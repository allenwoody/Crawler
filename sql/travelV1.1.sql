-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014-05-20 09:05:55
-- 服务器版本: 5.1.28-rc-community
-- PHP 版本: 5.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `travel`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_crawled`
--

CREATE TABLE IF NOT EXISTS `t_crawled` (
  `sid` varchar(48) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '能唯一标示一个url的md5值',
  `sname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'sid未采用md5加密前的数据',
  `isVisited` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被访问过',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `crawled_unique` (`sid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='保存已经爬取过的Url';

--
-- 转存表中的数据 `t_crawled`
--

INSERT INTO `t_crawled` (`sid`, `sname`, `isVisited`) VALUES
('0a526daef77977ada03751c4c76771', 'shixiangyuan-1', 1),
('0a5b655c2c3861fb73af1edc772cc7b', 'guangzhou-2', 1),
('0c8657a65c625acdcc02cab2aa2944d', 'dashatoumatou-1', 1),
('104faf09634b64712d6b375388ffa', 'zhujiang-1', 1),
('10c8d3e7777198b3f23a169843ff731', 'jiaomenhelvdao-1', 1),
('111ca2a742db452e2363814a6ff8c2e5', 'panhediaosuyishuyuan-1', 1),
('1139fb723fa6aed249f5ad5d6dd5243', 'kuaihuotianxinnongjiale-1', 1),
('113e8b9d840fc3eb8c3e76698f0773b', 'xiledengtuozhanxunlianzhongxin-1', 1),
('125a3891fdc4ac4b8777a27b6af74886', 'shiweitanghuochezhan-1', 1),
('12a32df7c0b03a704e98b1df3d9fc', 'lvyunshengtaiguoyuan-1', 1),
('1355143795731086e7fab149e57f2b6', 'nanyueguoshuizhayizhi-1', 1),
('135c9521f283e745a1d2263274ca483', 'jinxiuxiangjiangwenquancheng-1', 1),
('13ad45a36c59dedbfe9ce16efc3cb350', 'furongxiazhizunpiaoliu-1', 1),
('13da1a39b3cdc2192583348fa71052a0', 'sanyatangyougu-1', 1),
('13f3d6801156fbf541dba4ba71fd', 'eyugongyuan-1', 1),
('146f9dab21264b118933abe53872ad5d', 'longxuedao-1', 1),
('14a03473e42c4931d5e0523c9aa70', 'longtanguoshugongyuan-1', 1),
('15cf6fcc83f62b1ea57f3ed7d8cc451', 'dalingcun-1', 1),
('16111076f8f7227452d830d51cc64c3a', 'zhuangtougongyuan-1', 1),
('16483eb6c1f5c35fe69680c49060df6c', 'jidujiaodongshantang-1', 1),
('164b5223b5766d66ebb52d6c974b79ba', 'guomindangyidajiuzhi-1', 1),
('18b1765329d76e67bb27fee9467fbcb', 'qiloulaojie-1', 1),
('19228db86c7ec8d313d1aed82bd295f', 'tianhulvyouqu-1', 1),
('19502f25701b178441da9be05c2f2c4f', 'hualongnongyedaguanyuan-1', 1),
('1a3a4eae91eeb9f7bdb1ceac1deedc0', 'baiyunxianguan-1', 1),
('1b62ada08e7ff5d139979531cee4a2a', 'dajiaoshanhaibingongyuan-1', 1),
('1b9e86fd427bbfe77acbbb79e206a82', 'yuehaiguanjiuzhi-1', 1),
('1bc436131c3a3fa8a42c04c838e34', 'wangguwenquandujiacun-1', 1),
('1c49e951b4369575c615c1a9c24e286', 'zizhengdafuci-1', 1),
('1cad8223319ab983c929f2ebc8be36', 'xinhepu-1', 1),
('1cfe0f81ac2a3d9e27a327966fffe', 'zhujiangyeyoushengzongmatou-1', 1),
('1d296984e5653cdd8c97ff418b6a1f1', 'zhujiangyeyouxitimatou-1', 1),
('1d531cb60c7f3c8ebaa42c9f9768f22', 'jiulonghudujiacun-1', 1),
('1db5b0c0926978c1439c64495da6b27b', 'jidujiaotangshamiantang-1', 1),
('1dcfb5b25667dbc3889afd704665cfd7', 'yuanyezhuangyuan-1', 1),
('1ea5d81a2d8cbbf4e7e72c8acee7eb2', 'guangzhouzhantianyouguju-1', 1),
('1efcf587168efab2869bacca18e281', 'xilaichudi-1', 1),
('1fa2676ac26767ae1d8acb4eba1c39', 'guangzhou-28', 1),
('1ff1ea7b6167b5a5d2c5bb8e8ee', 'baiyunhuashi-1', 1),
('2027c23876daa29d1780abb525baf1c', 'jinshishuishijie-1', 1),
('2045a4ea3920c4163964519bd997c8', 'taigucang-1', 1),
('2083928318b9cec65566945f122f99', 'qingyunshuyuan-1', 1),
('2090c7a8b3176a3524511b075a9e652', 'zhangjiulingjiniangongyuan-1', 1),
('20a943576b297e179e91336edcf4932', 'zhujianghaoyouchuan-1', 1),
('20bfa696f7cb1cf0997397a93410da25', 'fangcunhuangdaxianci-1', 1),
('22a88f66ecd3a3b1822a7e6b9d7d7e', 'dongshanshaoyegongyuan-1', 1),
('2341d94c8e839d51d7282406a914153', 'guangzhoupeizhengzhongxue-1', 1),
('235919d01c9764e5835731517d2fbe8e', 'guangdongshengnongminxiehuijiuzhi-1', 1),
('23924cf172e2a8638df4927dd8b330f', 'haiyindaqiao-1', 1),
('23d8e1c49e957f428a20add5109461', 'qingyinongzhuang-1', 1),
('24937cdcd62782654cb8ad83e39e49e', 'shezufengqingcun-1', 1),
('259697654c894e9fd032d3cfbf2069a0', 'baomoyuan-1', 1),
('25a045aa204894805f6689b965ebe062', 'yilaodajiuzhi-1', 1),
('2682cb30bfc6b84ded347d9a0b27268', 'lanhaitunzhujiangyeyou-1', 1),
('2688bce629ea46c8a0843e9d11bd1954', 'guangzhouluxunjinianguan-1', 1),
('26b25d6bf3c7fbbbaf74db8cdd923683', 'xiaodongyingqingzhensi-1', 1),
('27201c0ea23aca65dc65b28e6d8c5d6', 'guangzhougongshejiuzhi-1', 1),
('27332ffcc3c84c20b01d3e9daafc77c6', 'lizhiwanyouchuan-1', 1),
('281fd14966db83e8b2319c547763a6e', 'huanlewagu-1', 1),
('288775eb1d61799ba051b239d5837d57', 'tiannandiyifeng-1', 1),
('29555cebee7a4a1ed1cbedceb552031', 'guangzhou-16', 1),
('2a5cccdcf35919f4279c4374b51cdcc', 'xiangshuixiashengtaidujiaqu-1', 1),
('2b89b953fa64483d1afce2c4f2eba', 'luhugongyuan-1', 1),
('2d31cb56daefbef5443db3a72a6e212', 'bishuiwanwenquan-1', 1),
('2d949337c041b13e52c16c5d195979b', 'conghuasenlinyezhanjulebu-1', 1),
('2db7ae62ef846e5fb39c760bd40b01d', 'qixingganggongyuan-1', 1),
('2e35507ff2c3376b714d479eb9d74', 'sanbaidongshengtaidujiaqu-1', 1),
('2f1142a05acd17d5d2c5a934d0af26a0', 'guangzhou-23', 1),
('2f6f3b4c9e4c8f39879575f1192cbac', 'baiyunquwenhuaguan-1', 1),
('2f8eed90a1fcaf7d2f7e7f87a7ad3', 'timian-1', 1),
('3024df771be3f6864e43d27f25484e47', 'shuiguoshijie-1', 1),
('306148eb47592d7cd7fab7b7c71b7250', 'nanshadajiaoshanhaibingongyuan-1', 1),
('307d9d40cb9e68c1c98c74aca6e5e264', 'nanhuyouleyuan-1', 1),
('31c8a4b829e12c743aafa1caa4d7370', 'huguangdujiashanzhuang-1', 1),
('3468c2c7e34bc25f2779851c47da2eb7', 'xiaozhourenminlitang-1', 1),
('34d4b6bedbabb4bc9e37c83953de7', 'nanjingmeishansi-1', 1),
('34e350702ce4a87fb1e414951ebacd13', 'liedeyong-1', 1),
('34e8c4b4b5c69f6879b6272b3a469e8', 'baisuipaifang-1', 1),
('352d4919f6d583d42b62ab84bfdd13d', 'yangchengchuangyichanyeyuan-1', 1),
('359043f11589797566e9ba177fc7e49', 'xiaoganggongyuan-1', 1),
('35b07ae54e10cbbd2d48883943e5caa', 'shengpingshexue-1', 1),
('362d9f373a75f391827c5e65b769f851', 'haibangshuixiang-1', 1),
('36da38602389055de57dc1cea6e754', 'pingandaxiyuan-1', 1),
('37928eecfae9a486d57e5bcdba30e9e', 'lijiangmingzhugejuyuan-1', 1),
('37aa1d17edb507094e05d7df57f985', 'zhongchaorenminxueyiting-1', 1),
('37fe1630687affffdb14907de99326f5', 'zhongshanjinianbei-1', 1),
('38831261744e7f45b23154576756', 'guangzhou-13', 1),
('388ad3283f61150d8e87ab4c55bb1', 'guangzhoubowuguan-1', 1),
('38d16439512af5229e68f67cee503976', 'dawencunlvdao-1', 1),
('394d0c081a96971215ffbd6c16f76f', 'huangpugucunrenwenlishizhanlanguan-1', 1),
('397c6b9cee875ad8ce1748e2473', 'guangzhou-14', 1),
('39afe13b6c2b75612ec310305f58fe83', 'zhangmindamu-1', 1),
('39ba2c25495d6e4b42db178bac853', 'yuyinshanfang-1', 1),
('39e09ca6ccf5e94ea7e361dbb9a9c5a', 'guangzhoubaiyunshan-1', 1),
('3a12589f8d27d9464c9801b4952c95c', 'chenlianbogongguan-1', 1),
('3c65f73cc1d648e698dc04216ae1f38', 'yuexiugongyuan-1', 1),
('3c899330d9582768647757a5385dfbf2', 'shuixicun-1', 1),
('3c8dbbf7c930acf7976b8a374aff6816', 'lingnandiyiquan-1', 1),
('3cea4b589b1d1b39f0554c2c88f3447', 'fanyulianhuashan-1', 1),
('3d70255fc960f85bef29856ea39b3f70', 'tianzhujiaoludeshengmutang-1', 1),
('3e4315f624a44de6aad063181784696', 'longjinxixiguandawu-1', 1),
('3e4a9d6cb22c3ca3f3896c31225227', 'baoqumeiguishijie-1', 1),
('3ed616501816d486e302cc7efe485a', 'huangpujunxiaojulebu-1', 1),
('3ede888553b784fcc4c434382026b1e6', 'hunqingtang-1', 1),
('3eff23966b9fbb5f53627281ead1276', 'xinghaiyuan-1', 1),
('3f55f48876531ab6a848d6d0ccf7b6a7', 'liurongsi-1', 1),
('3f5ca1c38cda12ef269beae3d2dd350', 'dengshichangjinianguan-1', 1),
('3fc54656fcf54b1f094f4871a1936a3', 'baishuizhai-1', 1),
('401f83793a2c7862943734946cb1df6a', 'mingyuanlou-1', 1),
('40c5df74d3c9a7ca91c4c1d447d11cd7', 'shundebiguiyuanhuanleshijie-1', 1),
('4168f491e88612e384ef88e3b91e3b55', 'TITchuangyiyuan-1', 1),
('4260d470f2f52bc4d5a454446d66609b', 'guxianglizhutigongyuan-1', 1),
('428bee6daebb7c994a50b9495692b23', 'dongpingdaya-1', 1),
('42ac2ea1223aa4fb2f7975ae2986ee90', 'mochi-1', 1),
('43744995ef4ac1fdb67643d3c9e9b4c', 'bahehuiguan-1', 1),
('43ad94214ad25cd28ccab0bf501c4749', 'zhongshandaxue-1', 1),
('43cdc28e45bff634d0acb97967f2f4', 'fulongjiufang-1', 1),
('43fce6152c03472e7cc5168bdb8a968', 'xuguangpingguju-1', 1),
('458a164fca46ca5be8a34da65468dd49', 'luochangcun-1', 1),
('45d7b6f27b4a98d2db7cfece448db4fb', 'dishuiyansenlingongyuan-1', 1),
('45e3f752caa5ac4c2b7de4908b46dbdc', 'xiaozhouyishuqu-1', 1),
('46226cb13628d77344c9586baef6b7', 'zhengguofoyesi-1', 1),
('46b615ab517edfeaeead89eae84487e', 'gzhuangpugongyuan-1', 1),
('484741343dc41d4fa29e219d4a7f6d79', 'diecuiyuan-1', 1),
('4a544d0b15683272b9d7454b354bd90', 'guangzhou-24', 1),
('4aa90183f5cde8959131e7d7cf9d7', 'guangzhou-5', 1),
('4bd371cbb3d91ac8842dc2fe2d7bf2fe', 'guangzhou-7', 1),
('4c3b3884467d6922f5aaee9460cee', 'xudi-1', 1),
('4d8b68f851ea9082f7d41591ab6f9ad6', 'shaojiwo-1', 1),
('4e4e26fa26f3203a335416cafc733c8', 'guangzhou-17', 1),
('4ec613a9778a73601762b0ebacff7319', 'shiboguangdongguan-1', 1),
('4edb21b0abd613bcd8abb2e19452a3', 'sunzhongshanjinianbei-1', 1),
('4fed61f651bc20fe41392d6882f6f3', 'guangdongkexuezhongxin-1', 1),
('50541af6a917a38f3c3343964365ba53', 'tuanyidaguangchang-1', 1),
('5067b22bcb915cde62e8cc187f5504d', 'guangdongwenquanbinguan-1', 1),
('506dd0cc90ed9bb5f288b62cc813723', 'liuhuahugongyuan-1', 1),
('50c2f5dad7d165202a6630d6d01f74ed', 'yubeiminzhongkangrijinianting-1', 1),
('511fe3db2bee4728aaa0d5958ce68c4b', 'guangzhoujiefangjinianxiang-1', 1),
('514307343bf371597603e282ca846d8', 'nanshashidigongyuan-1', 1),
('5172d7d171a6896c62286ff987553', 'longwanggumiao-1', 1),
('51de8048b83e2afc05d415deea6757', 'zhongyangyinhangjiuzhi-1', 1),
('522f34c89b30c9f1fac158f73f574', 'xiaoshizongci-1', 1),
('52f5656a4ecebcaa21c3f743f1bb0c2', 'shangxiajiubuxingjie-1', 1),
('5315653db3e87fee7c15b3c8aa786ed', 'qianganggucun-1', 1),
('53464729aeda734e8ab86fe7ad933d93', 'yingshanjiangongci-1', 1),
('53b470d381748f7956ab5fd4164294fb', 'renweimiao-1', 1),
('54e2d3e0d37a25bb63f7e51844d7e97c', 'shijingqiao-1', 1),
('55542bead54aeed8613fea9db5608f3', 'aiqundasha-1', 1),
('5569340b1236922f4e6a81e44752a50', 'fengtailansheng-1', 1),
('5695387bba1cf38de1b2bfb7dac40fc', 'tianhecheng-1', 1),
('574ebcf5d0345bb7615f171a78b76d', 'chenyinkeguju-1', 1),
('57ddb938f5b13c49a9e18345b698f8bf', 'jishengongyuan-1', 1),
('583270cc4de4b7cf86d7f3c26e512793', 'bosilou-1', 1),
('583f8f2bca66144e5332f59c23baed3d', 'cuidaowenquandujiacun-1', 1),
('589276fd3860719716434fe8d65b73c', 'xianmuyuanwenquan-1', 1),
('58e26778493bf8dfd3f63db8b5a46230', 'maanshangongyuan-1', 1),
('5917f14716dfa6bc6c1878ef7f4a7db', 'guangzhou-31', 1),
('599e8a33dad9ce454bf9db9b1919240', 'hualinsiyuqiyitiaojie-1', 1),
('59ce7767ee3fc80bae0d64f1f34f3b2', 'jigongfang-1', 1),
('59dd1ebb15d5951c5d7de56840e4e38e', 'chigangta-1', 1),
('59f8aea5b05d9146133e5f58a8ac4e96', 'huananzhiwuyuan-1', 1),
('5b439095c4cfebd065a9e3533467a3', 'hongzhuanchang-1', 1),
('5c3c3e85cd8ae5ec31122069b126976a', 'dajinfeng-1', 1),
('5c81ceb3d4c461a53b15c9e1a81013', 'baosangyuan-1', 1),
('5cc57a57328884e54697d9f2451a8e', 'jidujiaojiuzhutang-1', 1),
('5cfd5e97f3657647ed5c489c157dde52', 'baiwankuiyuan-1', 1),
('5d171a45a0f71ee3f8ae0239e342644', 'luoyonggongyuan-1', 1),
('5d5898efdbca39ae387c761e91ee62', 'guangzhoutiyuguan-1', 1),
('5e1bb6544d1debcd15fd66346a1cac43', 'huangpugugangjingguanqu-1', 1),
('5e4ec0e8e770d91642aee0efa944dfd6', 'dajiaoshanpaotai-1', 1),
('5e68b1305232b4c02675bb3bf14843b3', 'conghuawanfengwenquanjiudian-1', 1),
('5eb8ee2b9fd63940af6efc8e3c4469', 'jinjiling-1', 1),
('5fd9dbcfeb61495864dcdec986531614', 'shamian-1', 1),
('60e22fc2c7abb4bf70eaaadfe83b8fe7', 'haijunguangzhoulieshilingyuan-1', 1),
('61466e4f9f51316ae7441fdb4cf783c', 'baihegangpaotai-1', 1),
('615e44edb56bfb567dabd9a9d22f7dd', 'huachengguangchang-1', 1),
('61802bd455aff7be7ef562643b02c59', 'biguiyuanertongzhiyetiyanzhongxin-1', 1),
('6228dae63dd182dc1d938bb2b65b7b18', 'nanshashuixiangyitiaojie-1', 1),
('63b3f3f9afe9f8c75f3ca2f360e726d', 'guangzhou-1', 1),
('64f8f8d2689634157139e5bea7a97d', 'shisiyong-1', 1),
('6512b68c4814ec3c6560e4ae7da148', 'shennongcaotangbowuguan-1', 1),
('65593c731a818cec3be40c20aca78c', 'fengyunlingsenlingongyuan-1', 1),
('65c5c6322076042a7a2b6835dfae618', 'nanshabinhaiyongchang-1', 1),
('6615aa39310e236d7c4d9bb3e176e', 'lianhuashangucaishichang-1', 1),
('66a7dc96c4da16cabbe076c56886e226', 'tianhegongyuan-1', 1),
('66d5bb3cf7461d44d03afd128d90dc', 'baiyunlouluxunguju-1', 1),
('66f48cfb05cf981d2ee63c07af962', 'danshuikengfengjingqu-1', 1),
('6720a4fd575f79538e6d2a583e234845', 'baitugangpaotai-1', 1),
('680f8e72e95786a521c64b032b3f3e5', 'liwanbowuguan-1', 1),
('6855b6d89158addf86b3c17767cc4f7', 'guangzhoudongwuyuan-1', 1),
('689b13eeead8257f21f3be55b72cb4fb', 'zhonghuaguangchang-1', 1),
('68e7986e36ce8e190af6a1bc23674dc', 'guangzhou-18', 1),
('69e8e3134b102cc1a6c1d4bcfaf1e28f', 'liededaqiao-1', 1),
('69f2e075d45e7a61c6bcb5c127fa0', 'nongjiangsuo-1', 1),
('6ad998d1f676d6127cc66881ecc8cdc', 'guangzhouyishubowuyuan-1', 1),
('6b35b11b5b2b57beca688d151be297e', 'meihuagu-1', 1),
('6b3b8c80df348b9e83fa838966a20b3', 'julonggucun-1', 1),
('6b563086634e119d668ea25af31fa184', 'qiannianguteng-1', 1),
('6b8dd97415d8091c689ddf5eda52924', 'mingchungu-1', 1),
('6bc07bf03ace19faeca9c7b73ae96fe', 'shishishengxindajiaotang-1', 1),
('6c23c9b4eaa33b229a5bf6e9927f84f', 'guangzhou-15', 1),
('6c8ac3e0195d751afab5b231908f639b', 'fenghuangguwei-1', 1),
('6d70296a248c117424384a4c978369a5', 'zengchenghuxindao-1', 1),
('6d9a3f35e4d031e5536278d78e62574', 'shijiulujunlingyuan-1', 1),
('6dae6c811975402f5f337ce1961d5626', 'panyuguangchang-1', 1),
('6f6314752c8a66696beed5fe23541f', 'jinxingnongzhuang-1', 1),
('6fbb20a3698cf2625c7275e1fd98c8', 'tianhegongyuanmofasenlin-1', 1),
('702750e0555c51f97fb8597633eb563', 'nanhaishenmiao-1', 1),
('702d2abcde105d4a4322868d392bfcb3', 'shangchongguoshugongyuan-1', 1),
('70d315fcf2b75afaf13353a437994dc8', 'haizhushidigongyuan-1', 1),
('711aad858d294e6f431ac970bcb48e73', 'luogang-1', 1),
('712258b45dd2493c398a373f9734d', 'guangzhoubeilin-1', 1),
('7138bbdd6ca1cad17ad0c95bc6b486', 'chenlijizhongyaobowuguan-1', 1),
('7146d2c8563db8ad447bfb84be41ce3', 'tianhepiaojuan-1', 1),
('7184e96bc9fc22e05c37c93d51be63', 'zhucunqixiguangchang-1', 1),
('71f87d3b76a4436a6c3378cf1af57872', 'guangzhoudiaosugongyuan-1', 1),
('725a9f9126d0d4e585e35572923af95', 'longtancun-1', 1),
('72ae66b4e12585ae9a13274646b659', 'tianshiyinghuayouleyuan-1', 1),
('72f7d89646aea4a09ad99339286076', 'huanannongyedaxueshumuyuan-1', 1),
('73f22573a853fea552b89247274ee9', 'hezhizhoushidigongyuan-1', 1),
('7493ae67b0ce11547781e29fe5928ff', 'xijiaoshengtaigongyuan-1', 1),
('752fb09f4fda52a86ed0811edbea9c6c', 'meisenhuanleying-1', 1),
('75b4928323ea7c27c2a024ec5f6ac', 'lingnanyinxiangyuan-1', 1),
('771de438bd801013ebb56c2ebb7594f7', 'panguwanglvyouqu-1', 1),
('77a2b0455c4edafeb433c41f6ca02d21', 'shuimoyuan-1', 1),
('789cf3e26eaccdb85b1eec40ef5ce6', 'pazhouguojihuizhanzhongxin-1', 1),
('78eb6920b24acfa9286e5d9af7c397c7', 'meilinhuwenquan-1', 1),
('78f1b6b3fa4a1b661e37686782277651', 'changlongshuishangleyuan-1', 1),
('79936d781cc158a4ca9a3a13d5e8986', 'xitoucun-1', 1),
('7aa88989b058d942f67f9a4c7305c4', 'zhonghuaquanguozonggonghuijiuzhi-1', 1),
('7aaf13112e68554658766976c35f63f8', 'longyandong-1', 1),
('7b188277221a12e2346d5ecd23e02ce', 'ershadaotiyugongyuan-1', 1),
('7b7ec2927ca04bf9ce2ab32055015ca', 'daqiuyuannongzhuang-1', 1),
('7b9290b3c17e2d5f4d6b78c3d51b539', 'linzexujinianyuan-1', 1),
('7c8c9a8529edc614b76b06ff3314446', 'huangpugucun-1', 1),
('7cc1e4af66856d991426bab5d1dca96', '488Deckyunxiaopingtai-1', 1),
('7d18c9ee89361169555e7fe2c5c235', 'zhongdabeimenguangchang-1', 1),
('7d4c311c8795db80397425f0112a7d', 'guangzhouliqishanzhuang-1', 1),
('7d4e3a420558be19970e0886a5bba', 'dafengmenpiaoliu-1', 1),
('7d9ba433b77980e9f33163bcd44c825e', 'gaotanwenquan-1', 1),
('7ea761c1ac2f73f7f6bbef9fb7474', 'jishanganlangongyuan-1', 1),
('7eb8be8b9af81c5c7508561e499a1e7', 'sanyuanlikangyingdouzhengjiuzhi-1', 1),
('7eda1444c8ad4db38ac7c974d46698', 'wuzhean-1', 1),
('7f54eafbbb87fdabf1b87873a59eef56', 'guangzhou-12', 1),
('7f5ca1bd89570101ac27c95739917a2', 'jidujiaoshifutang-1', 1),
('801439db7070d7a952b19d972473c36', 'xiangshuixia-1', 1),
('804a1eb26cdc6c97c535ad6146a882', 'guangzhouhuahuibolanyuan-1', 1),
('80a8e9927694b257d1a2f65b3b58911', 'fankongyezhanjidi-1', 1),
('80bb40f9c21797fc4331baac5fac468', 'haizhuangsi-1', 1),
('80d5b47688d9934b4e8338259ee9b92', 'guangzhouhaiyangguan-1', 1),
('80e069402bd3da9c6436ba9cf4a37b26', 'tianjingshanguojiasenlingongyuan-1', 1),
('81273af9b5fa5ba39a7b613bf88855b', 'guangzhou-9', 1),
('81509d2e4bae59cca9f8c41ceac845e9', 'shibafudi-1', 1),
('82438a869f4c5c23e4b9da2651acd45', 'qingzhenxianxianmu-1', 1),
('82e2fa5174d23aeeaad6ae63555c7fc', 'zengjianghualang-1', 1),
('83cee8f6eaf2d8b6fc3c7e9a4334ad4', 'haizhuhu-1', 1),
('83fe3d745ebc64dade172478f8399be', 'guangzhoudaxuecheng-1', 1),
('841eb49dd275a95299638cd68d312ee', 'guangzhou-26', 1),
('84d949bf42db98a6a2f162bd4b97ca1', 'changlongguojimaxidajuyuan-1', 1),
('85358b44f563cf535b6a2bd672a36129', 'lizhiwenhualeyuan-1', 1),
('853fb015a2c7531ea952aa481aaa91e', 'tianluhusenlingongyuan-1', 1),
('8562db80814f65cd8ee3cf7481904a', 'changlongyeshengdongwushijie-1', 1),
('85e99fd12b7d9af5d6a9d388f6acca0', 'beifajinianbei-1', 1),
('85eea2165ddf44a26989cd791b332f7b', 'guanzhoudao-1', 1),
('869ed581eaf11198ae5cfdcbd10972', 'zengbugongyuan-1', 1),
('86f2dae3b034979d2670345eee5da950', 'conghuawenquanfengjingqu-1', 1),
('872780a4cd9093e7e7d91febdb5fe1f', 'jingangchansi-1', 1),
('8880c54ef77e9486bed5f7e6b9d399', 'jinyinyoulechang-1', 1),
('88869beaa8abf9987c21971afade416', 'liuxihexiagupiaoliu-1', 1),
('8921a98ea0896b1f75e660a2b84d83e', 'guangzhou-25', 1),
('89918017a6acefd38c86572f9975266', 'yunxishengtaigongyuan-1', 1),
('8a1eed68bdc6732a6467897fbad', 'zhongshanjiniantang-1', 1),
('8b273b8eb5bf39740a858389ea94968', 'qifunongzhuang-1', 1),
('8b685511b6767f5c2436cc5715b7f3d4', 'lianhuashanshuishangleyuan-1', 1),
('8ca853f2347eb0f5f9df2c2e1dbcd8', 'guangzhou-10', 1),
('8d97a1ecf4f878deeb489a24d23e2fbb', 'caonuangongyuan-1', 1),
('8d9d40c4335576592e428adc8d85781', 'guangzhou-22', 1),
('8f971ef830694bd261d9999aae56a65', 'xiangcaoshijie-1', 1),
('909d6782288f53da31d0228251e7b832', 'fojidong-1', 1),
('912b5eae6c215b25b8e2fa26d4e1f4e7', 'guangdongzhongyiyaobowuguan-1', 1),
('91713954bd323962156d8cdce1d8ea4', 'hualinchansi-1', 1),
('929c35234d9ee3891a32496e967331d', 'sanyuanlirenminkangyingjinianbei-1', 1),
('92a791c3c05e55c49725574fc486df1b', 'huaguoshangongyuan-1', 1),
('937b89613fd28dca3c0547caaa272b', 'guangxiaosi-1', 1),
('938ceab07871c652a956a78e25d992b', 'puzhouhuayuan-1', 1),
('93ef6227c11dc41e23ffd681df95dd58', 'qianniugu-1', 1),
('945133a75856748f368775be2a74f68e', 'shenjinggucun-1', 1),
('9461baa732d545add9e14c527ad699', 'panguwangmiao-1', 1),
('9538ab8c98f9ffaa6fdfb7b1dd263af', 'baiyunhugongyuan-1', 1),
('955f75d87dba9341accb78a27c2ee43b', 'dongfangsi-1', 1),
('95bc7787d6a647f8eafcd7163b2c3', 'zhujiangyeyoudashatoumatou-1', 1),
('95f17d46dc7249c5c5e6e5a59ad472', 'dongzhengzhenwanglieshimu-1', 1),
('9628a4fe5aed4d16ead64f9f892688', 'baihuashanzhuangdujiacun-1', 1),
('96856e53d9aaab71db6cc2a5d64ff7d', 'xiaozhoucun-1', 1),
('9689eb1b42e618c6e9d6ad9483244ef', 'lujiangshuyuan-1', 1),
('97730b511d4bccf651fd85453ce8250', 'nengrensi-1', 1),
('989935ee33bfe7b14c081ec11c374', 'xinghaiyinyueting-1', 1),
('98adec56a273574f818fca3d11f53', 'guangzhouzhanglongjiudianbaihucanting-1', 1),
('98baa7d477178f2687720dde4529f3c', 'jiulongtanshuishangshijiedujiacun-1', 1),
('9910138c3bb41480591160d9b05eb65d', 'gezhoudao-1', 1),
('991ecb32639db0993d8aabf2dd665783', 'shitoujikuangwuyuan-1', 1),
('997b8adb2397796871d6b9b64812c4d', 'nanyueyuan-1', 1),
('99dc664d5164d9ff1062f0ea7e912bcb', 'guangzhoushijiedaguan-1', 1),
('99e58ae6e79483444625ac6b2379ae54', 'yonglelvseshengtainongzhuang-1', 1),
('9ab9fefe37fd54d0244f2d3f3925212', 'changzhouwenhuafengjingqu-1', 1),
('9ba064d75ac86ad8ee4920b2d6ca1fec', 'yangsijiangjunmiao-1', 1),
('9ba4ec8e2a6365845bcc816e65ab3e19', 'beixidujiacun-1', 1),
('9bcd9d81c5dc5f9432fffda569d168a1', 'wuyanqiao-1', 1),
('9c36761f2543c4735a2ea9edee47582', 'xuanxingcun-1', 1),
('9ca4db7de2c35b2cda533ad125777215', 'zhujiangyeyoutianzimatou-1', 1),
('9d0cf2a355873eebcf37194579335', 'guangmingdaxiyuan-1', 1),
('9d89e46f71c4180d0170751cb58d', 'maofengshan-1', 1),
('9e8faf5339281ca3e3529bbf636', 'jinhuagumiao-1', 1),
('9e9c1f986439d46d7d2878f0c69f419b', 'tianhedongzhanlvhuaguangchang-1', 1),
('9f727f2fb8fc39b31268d715fecaa94d', 'waigeshiwenquanzhuangyuan-1', 1),
('9fe13a7992df9e3fa84fcd1f3947434', 'changlongxiangjiangyeshengdongwushijie-1', 1),
('a046bee0f87a716d1c61df55369f7062', 'guangzhouyuandian-1', 1),
('a09375d636fbad2a8c748d914ee4e517', 'guangdongaolinpiketiyuzhongxin-1', 1),
('a0a2f689b7feec18db1ba196ffd904d', 'shibaluohanshansenlingongyuan-1', 1),
('a0bf115e52dda847f8d09e553d7169', 'moxingling-1', 1),
('a118dfaaf851c24af8ef650a646eebc', 'dajiangpugucun-1', 1),
('a182beea4be3f7f8da697a875396fa65', 'chenjiaci-1', 1),
('a18d1e42157b61c6f2cd29a70b46179', 'huaishengsi-1', 1),
('a222734893769940e63312856d5f118f', 'pinghedaya-1', 1),
('a2a810127ad723d732799ab5225a538', 'wendeluwenhuajie-1', 1),
('a2b541c3fed86eb354fdae853de933d', 'guangzhoutamotianlun-1', 1),
('a4499251dd69316d8c762aa3d864581', 'xingqibaxiaozhen-1', 1),
('a4ad8758d95145279848cd83b396a33f', 'nanwancun-1', 1),
('a62c85cf7bbeb16804fd3b9666a34e3', 'dawencunzhanlanguan-1', 1),
('a62e47ada0ee519cbb14ea816cd42a40', 'yaozhouyizhi-1', 1),
('a634dde8bdfc782b426e9462cbd3659', 'zhonggongsandahuizhijinianguan-1', 1),
('a674f03eb5ab7c41e17921137e890', 'mulanyuan-1', 1),
('a6b7ea4d578b60c3ea8b8a77b3fb7774', 'lianxianglou-1', 1),
('a6e0535ebe4c7ac09368fc7f9e4f039', 'huadugeminglieshilingyuan-1', 1),
('a78fd12ab19f53845235a509920df5b', 'kegengyuan-1', 1),
('a811c54d2cde661b6f4ef90c26781b3', 'linghushanzhuang-1', 1),
('a8aeded2d8d121c9f1374a7e1c8adf50', 'changlonghuanleshijie-1', 1),
('a8b217e01da97bcc36bf11f8e1aac21', 'jianshizongci-1', 1),
('a922b4aed38efff0592e71bfda6e4399', 'huangjinhaianshuishangleyuan-1', 1),
('a926ed36cd342c6e4112a2b09ee58', 'huangpujunshizhutiyuan-1', 1),
('a936c6614995e6cdead526b55e13dc5e', 'dafogusi-1', 1),
('aafdab52d8dec4b937f5bda17c38c7fe', 'nanshashijiuyong-1', 1),
('ab9b22fff44f2a7ecc98704de41a1b81', 'nanshatianhougong-1', 1),
('abc35e4689488cf90a1ad58d8463970', 'bishuixia-1', 1),
('ac2ee7bc749fb31ddb0fb6d3828b83d', 'wenhuagongyuan-1', 1),
('ac9b9a74148f24e383283deb75875d6', 'guangzhou-20', 1),
('ad40a6afbd892a2f25ea7e6bb3fc70ab', 'nanshahaibingongyuan-1', 1),
('ad51578cf813e2dd963a5a32ce5014a4', 'guangdongmeishuguan-1', 1),
('addeab5db3e8451e76c2618d522f94b', 'guangzhoulizhiwanyong-1', 1),
('ae468aae8ef6877a7aa6ffc84a12b', 'conghuazhonglou-1', 1),
('ae504f723ba3d0b4b2b9f62e57848', 'zhongsurenminxueyiting-1', 1),
('aea993363745d4e3d19f41fbae8345', 'haixinsha-1', 1),
('aef93ff2c7ccaabcf499056d6a9131', 'jinkengsenlingongyuan-1', 1),
('af3545e459ff29ad694cf54914ff3', 'yuewangjing-1', 1),
('af42addbdc188757689fee5de56d8c3e', 'guangzhouyayuncun-1', 1),
('afdd733928fdaec660b7df365c4645cd', 'guangzhou-6', 1),
('afe42712e943bc5117d2bfcba8f333a', 'furongyezhantuozhanjulebu-1', 1),
('b03b2b46a4a147aa632d31e788bc7b70', 'guangdongshengbowuguan-1', 1),
('b0575c7d9ac279f19e4ba674d837667', 'huaduhuayansi-1', 1),
('b21693ab40aa0a111c354ecc5add853', 'guangzhoushixiaofangjujiuzhi-1', 1),
('b21787d0afc086c7e3a74f28821059ec', 'shimenguojiasenlingongyuan-1', 1),
('b2829262585164d166c33f4b78b1ba', 'jiaoshilingsenlingongyuan-1', 1),
('b2f24cc3a08ee9c5869355fcb3e996f4', 'qixiwenhuaguangchang-1', 1),
('b3d461fad94763f5f4967c822954cf6', 'haioudao-1', 1),
('b423a1e17972a48a3baa3ba5a928606c', 'wenkuige-1', 1),
('b4308861395064ec5c017991151b5cc', 'xiaolourenjia-1', 1),
('b486c4546450eaed28606c8e6e821aa2', 'liuxiheguojiasenlingongyuan-1', 1),
('b5244f7b3760e6f2504155677f57292', 'jiashuonongchang-1', 1),
('b5c8c95ba0c7cf2689b360f8a1bfaada', 'liwanhugongyuan-1', 1),
('b7562f6126c380ca4abdff2076ce968b', 'luhuertongleyuan-1', 1),
('b7717445282d6c242b0c1d246cc6b', 'shuyuanwenhuaqun-1', 1),
('b7e1c08361c0ea25976353552a74e8c', 'longtoushansenlingongyuan-1', 1),
('b7e41bff1622376e45643c9bec5aac', 'huaduguangchang-1', 1),
('b834c4ed255d1e1a3d7d669d66add8a9', 'xiaofantianleyuan-1', 1),
('b89d4ea426185f04ca9d9e9568398f', 'guangdongaolinpiketiyuchang-1', 1),
('b928ca14424aa7ba945abb30a82578d', 'guangzhou-21', 1),
('b9d5ea32a35a4f46685082bd3ba1424', 'chuangyegongyuan-1', 1),
('b9e1d21d59f378ee2a17f2ae91a25fb', 'kengbeicungujianzhuqun-1', 1),
('b9e578432d12dc9cf717e33657101d69', 'zhujiangyeyoujinhangyoulun-1', 1),
('b9e6fb2b2963c5915e52103249f0cf2e', 'dafushan-1', 1),
('ba263c31d32c790aaae8f71f547ac34', 'hongchenggongyuan-1', 1),
('ba8acd8612f81a9f46a5c4b115cd3d', 'furongfeipu-1', 1),
('bc2e3e1271b13c4d0e6da27f6a3ae4', 'guangzhouribaohao-1', 1),
('bc58bca283dd2e355e18a702a141', 'shucaigongyuan-1', 1),
('bc95144e997b3e493a752283a9331012', 'conghuasenlinpubugupiaoliu-1', 1),
('bd35f099fa60656fbf6c475cdf66590', 'guangzhoujindaishibowuguan-1', 1),
('bd657e8a196ed25e318734eb8e9f0e1', 'guangyuci-1', 1),
('bdd0625680778f263f22b745989767', 'guangzhou-29', 1),
('be5dc2878076db18947bcb97e779033', 'beihuiguixianguangzhoubiaozhita-1', 1),
('beafbc394ef65a8273dcad53e61f79c', 'gaopuguangfuminju-1', 1),
('bf9551f6df5364320c0c39aa1a06d20', 'xinxihaoyouchuan-1', 1),
('bfbe5cd612fb39721b359c251dd8cb5', 'shawanguzhen-1', 1),
('bfdb398c1cfb321643874a08cc16b47', 'tianhetiyuzhongxin-1', 1),
('c01686949711b6cd7a6118efbee5cfdf', 'guangzhou-3', 1),
('c05d514f81e177c107043b5bf2df83', 'guangzhouguojijinrongzhongxin-1', 1),
('c0b8f1acb38591e52ef96b21a727a8', 'tiantangding-1', 1),
('c1762880fb1ea9822c1751516cc2aad', 'guoshidazongci-1', 1),
('c23a4dec2bc2ce15585ef88750bb3fc6', 'zhujiangyeyou-1', 1),
('c24ad42f723ac5cf63a31b38a7d1a7', 'zengchengdafengmensenlingongyuan-1', 1),
('c27910c04ee26df3c314e1128e4892e', 'panyu-1', 1),
('c29c33a22ec8b501edc8a56e5a6e8e', 'beijingluqianniangudaoyizhi-1', 1),
('c32a1d7c64f553ec40d116cf9613d5e', 'guangdongshengbowuguanxinguan-1', 1),
('c32c8c13d4c626cb9c30fcc4c71bfc57', 'shuzhugang-1', 1),
('c375ac47bcb9898dd6cc13ddba353b6', 'gualvguangchang-1', 1),
('c3ebfeff9497edda23c032bc3b623f7', 'zhucun-1', 1),
('c3fd61ba12842f81c3e72de81ac0dc9e', 'xiaopengxianguan-1', 1),
('c44b27fb1f1dfc56c55db86b5174de', 'heshengnongzhuang-1', 1),
('c572e185411275494e9293b532d37d', 'kejiaweilongwu-1', 1),
('c5cdc592d3ba1eb58219acd8ae027', 'guangzhouhuiguan-1', 1),
('c5e36e6556dd897384f116046326c2f', 'hongxiuquangujujinianguan-1', 1),
('c690a4f86a8143a9d15c45a78fa8e95', 'xiguangulaodawu-1', 1),
('c6b1588ad1837a8e7922c362d8a92bd', 'baiyunguojihuiyizhongxin-1', 1),
('c7883dd7cb0fca19cd288eff83660fc', 'huangpujunxiaojiuzhi-1', 1),
('c82ee84e5f965b210b0e47424f513', 'guangzhou-19', 1),
('c8bf93ce92ae1d6f1ecb9688aa8597b6', 'gaobaizhang-1', 1),
('ca86dd225b82c19318972ed3d435f554', 'dazhonglou-1', 1),
('caa6ae6bbc6eb897a6a5ecd079ef89b6', 'guangzhouta-1', 1),
('cb82c99a104c55a39e3a933188a537c', 'yuyanshuyuan-1', 1),
('cbcf5a4bd524bbf639f6a92beba47c1', 'huolushan-1', 1),
('cc1ab78d64c6529a55a6ff64d7d0dd1', 'yuexiuxihuhuashi-1', 1),
('cca3aca45b2eb708584ebd5cd38b0fd', 'qinhanzaochuanyizhi-1', 1),
('cd867110dfa2a8ad2a2ffe14a84bd', 'huangpucunribenlou-1', 1),
('ce80252678b310b1dd6967454e8a7344', 'guangzhou-27', 1),
('ce9ffb5ae99293d5a5ebc0695bbb7260', 'huanghuaganggongyuan-1', 1),
('ced12173128f59992c5ea7cb4af9a', 'huanglonghusenlingongyuan-1', 1),
('cf53d6bcb05e232abf1e218119b623', 'yongshipiao-1', 1),
('cfdba022ee34d6d2d8e4fe47b33c338a', 'lanpu-1', 1),
('cfdeb0979fbb92d89361c36221d476c0', 'dahemashuishangleyuan-1', 1),
('d0803be2df6882c1b09e887c2b2de6fb', 'tayinglou-1', 1),
('d0a2c2ef9d61c22c56d68cfb83ff67bb', 'yingzhoushengtaigongyuan-1', 1),
('d0e248bce4d4798821cd37674f2c492', 'guangzhou-4', 1),
('d1e63843d3db4ec5bdd3e570d7e11d96', 'dongjiaogongyuan-1', 1),
('d26ae35858c294448ff0df1c9b7621bc', 'dashaheshidigongyuan-1', 1),
('d2b6684b5ab8ed58258f43d9fa73b', 'guangzhougejuyuan-1', 1),
('d341f49030da2c6ff66fd740e76a7ca9', 'modieshagongyuan-1', 1),
('d376eccdb8ef4947d84a492f67a07c1a', 'zuiguangongyuan-1', 1),
('d557240efe6355adf3d194a07e1a81', 'longdongsenlingongyuan-1', 1),
('d63c4134aeb4d4e27331663a1d682ad', 'wuyangshixiang-1', 1),
('d682c843d5696345bc0b9661da3bbcc', 'jiansheliumalu-1', 1),
('d7912b5b61d661c7eb9412fde3a61ab9', 'xiaoyaopiao-1', 1),
('d7c64b81a62ad713eb1765324d597e', 'yunfengfeicuimengxiangguan-1', 1),
('d7d44ee75859751ebf557b954d3ee294', 'gualingcun-1', 1),
('d861b917bc1c90f591921ad2642aea', 'jidujiaoguangxiaotang-1', 1),
('d89926817cb0c3c6cb1562e68ae8f4b', 'qinqinnongzhuang-1', 1),
('d98b173d6e5abf31777025f291583c58', 'zhujiangxinchengguangchang-1', 1),
('dbd882175f7f21496c7cd46bd82d38', 'guangzhourenmingongyuan-1', 1),
('dc821a14d0557158cb20b34198efcc7', 'pengjiamugongyuan-1', 1),
('dc9f699fc38413b944da71bed34f2764', 'dongshanhugongyuan-1', 1),
('dcf0eb7e5a689385be6ffe58bdcfe4', 'xinyihuiguan-1', 1),
('dd31456ada1fdb0bc6bf69b7ae5980', 'sunzhongshandayuanshuaifujinianguan-1', 1),
('dd6c344d2fe4c26ea6563e345a77034', 'nongminyundongjiangxisuojiuzhi-1', 1),
('ddc6f93e27859e50316832c64c46ddf8', 'furongzhang-1', 1),
('de91d8dda88f63527e7ab6b1ca6bb86', 'habiwangguo-1', 1),
('debf752856386fefd893301a2e9fee68', 'hutushanzhuang-1', 1),
('df76414e4c73eeb84dee7a2d4d2d18d6', 'guangzhouhuanghuagangjuyuan-1', 1),
('df8217f595e6602ffd1937ba356e86', 'pukongjian-1', 1),
('df93b68518a4f21a48cdb6cff254c', 'huizhangongyuan-1', 1),
('e03387a04d66ef4dc9ce325ca8b580e', 'yingzimashujulebu-1', 1),
('e1434aa0e5fd9caa8a5cd459f0a15add', 'aoshangujianzhuqun-1', 1),
('e1456e0689e87fae3dc5583a7e3c34e', 'xiuquangongyuan-1', 1),
('e1549de02fe2dd7b84a9f33bb9f16327', 'fushougongyuan-1', 1),
('e22f79ffd866595098a422cf175884f0', 'hongshengmiao-1', 1),
('e2327b2341dcee42b6619b6a2a2b95b', 'zhenhailou-1', 1),
('e26b5daa1b52fa592d9944a0c559e314', 'shajicananjinianbei-1', 1),
('e376589eb8d949fdd8f3dee8cd643d1', 'yuntaihuayuan-1', 1),
('e3ba5b5835fa665a128be7cdfdf4886', 'wangzishansenlingongyuan-1', 1),
('e4d36e57a212af37fbc15f03167256', 'baietanfengqingjiubajie-1', 1),
('e59d32a6ea19cd4cad9b1e428383e355', 'jinyeziwenquan-1', 1),
('e5c1966897c269804844be2e8b8ee393', 'xihannanyuewangbowuguan-1', 1),
('e613b3e81ea1fa396c2033c87a73ede7', 'beianwenhuamatouchuangyichanyeyuan-1', 1),
('e63d7c36e09febcbb950b13f027050', 'jiabaoliqihaoyouchuan-1', 1),
('e793b49633465c927e796efc490695b', 'liangshizongci-1', 1),
('e7fd83c30e635c4c3f2a32d923fc', 'lizhiwanwenta-1', 1),
('e838bd73c2d8c131f83ac5357c9b49d', 'chunyangguan-1', 1),
('e8bca5c739fb37dd742d69a1bc738487', 'guangzhouhangtianqiguan-1', 1),
('e8cd19f91ceb791d4689d358a6caa8', 'xianxinghaijinianguan-1', 1),
('e9bac27dc312918abfbc6fabaa63a792', 'guangzhoutaguangchang-1', 1),
('e9bb4cb1316a9b4dc73ebfd815574e9', 'lingshizongci-1', 1),
('ea3f8c0e2394d97d9cdc664aa606433', 'zhoutoujugongyuan-1', 1),
('ea951b6dbab1eba2a36544edb47044', 'guangzhou-8', 1),
('eabc6f6b91f14a98f0dd4d58bd5833', 'furongdujiacun-1', 1),
('eadad47ea9754385cbb199afa63405b', 'guangzhou-11', 1),
('eb3ba9e688aa52bf351253672b8bcbfb', 'xiangxuegongyuan-1', 1),
('ebeba2f1f1f857d1cc4d896c262cbbd', 'guangzhou-30', 1),
('ec791f4de9476936cc687912559d213', 'shimataohuagongyuan-1', 1),
('ec95b428debddaccfde4a562cb777f4', 'xiguanminsuguan-1', 1),
('ecac81a15628eaca61e3d91e76f8d', 'zengshidazongci-1', 1),
('eccaa630ce6bc6ca4a94eb1bda1babdd', 'zhujiangyeyouzhongdamatou-1', 1),
('ed2454fdcadab2b2cf238b54f0ccf6c7', 'hongshancun-1', 1),
('ee79b955c2884f4e92435de32a5e9617', 'dafengmenfengjingqu-1', 1),
('ee93964a8037e84f263de47eac99593d', 'pazhouta-1', 1),
('eea7443477105f22c897fe9b7216c9', 'conghua-1', 1),
('eeb9d5c9d35d23334c3d385f6b70ad55', 'zhujianggongyuan-1', 1),
('ef67cf57c07f542e4db4d9a0ee6c7352', 'yudalonghuayuan-1', 1),
('f0e9a31a48dad137ea8adca11482b8e', 'fengrumu-1', 1),
('f1f0e714a49797eda2188b0f18d5cfa', 'kangyouweiwanmucaotang-1', 1),
('f1f7425fa617e076d5d54ce95aea4faf', 'changlongyejiandongwushijie-1', 1),
('f2169cc7dda12062df2647c59ae84ad0', 'jinhangzhujiangyeyou-1', 1),
('f245461f647f47332b1361f6d90aa29', 'lieshilingyuanhuahuiguan-1', 1),
('f3966a2b4926714a73865bcb727a02e', 'panyuxuegong-1', 1),
('f3977de07a1229e060682a60216bc56', 'panyusenmeifandouleyuan-1', 1),
('f45cf74b3cdad101d271ff7fc5c1be1', 'ximenkouguchengqiang-1', 1),
('f472a197db351d1dc4104f338ea2787', 'yingcun-1', 1),
('f5404b54236759b21f542f36decacf85', 'guangdongdianshitawenhuayoulezhongxin-1', 1),
('f56da9bd3524ff5a9edc71fc7593de', 'guojiyishujiaoliuzhanting-1', 1),
('f59a8cf3eaa2b4b0dce33257d0dae1eb', 'baodeci-1', 1),
('f59baf4c2b3575e64c56b5ac8df4a8b3', 'keziling-1', 1),
('f665eb626753864a5eabaefae77c87f', 'zhujiangyeyoufangcunmatou-1', 1),
('f6e3167e72f8262358ec132668a5869', 'zhumafenggongci-1', 1),
('f735da74cfeeb2bf2745928e6f014b', 'yuexiushan-1', 1),
('f773cfdee9ab49caa4b426cdf44458f', 'sanyuangong-1', 1),
('f7c8d7b384da975612f4547feb69b1f5', 'xiaolouxianyuan-1', 1),
('f7f1f5aa342822cc97523aa333fe37b', 'sanrenting-1', 1),
('f8c5e9bdfa78b990e9185236ab9aa6', 'conghua-2', 1),
('f8ed3de2af48dfb6d89f5c1558d59436', 'dayuanshuaifujinianguan-1', 1),
('f95b472921a12e4e9dbd411136f680e', 'wuxianguan-1', 1),
('fa2c6221c5c1ebdc5f3394ba5ec0f92b', 'xianganggongyuan-1', 1),
('fb343ed3c999ff0622fe11a262cb3d4', 'zhongguolidaihuihuaguan-1', 1),
('fbc3ffff2e51f211ea2e305629f0af5b', 'guangdongshengcaizhengtingdalou-1', 1),
('fc527a43bd6ba20559cde26b99336a', 'nanshajiaomengongyuan-1', 1),
('fc7960852c8f54ed54d84552945fdf', 'huanannongyedaxueshidigongyuan-1', 1),
('fca4d2cc64ed947c891d92437ecca529', 'donghaoyong-1', 1),
('fd541e5636331d8339351c441948231', 'mingdaiguchengqiang-1', 1),
('fdf4dde1167762da388b5ad888777cc0', 'zhishugongyuan-1', 1),
('fee36f5a1d645e929fc639bf880bdcd', 'guangzhouqiyilieshilingyuan-1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_scenery`
--

CREATE TABLE IF NOT EXISTS `t_scenery` (
  `sid` varchar(48) COLLATE utf8_unicode_ci NOT NULL COMMENT '景点id',
  `surl` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '景点拼音',
  `parent_sid` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '景点归属地区id',
  `view_count` int(12) DEFAULT '0' COMMENT '访问量',
  `star` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '星级',
  `scene_layer` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '景点归属层次',
  `ambiguity_sname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模糊名字',
  `going_count` int(12) DEFAULT '0' COMMENT '想去的人数',
  `gone_count` int(12) DEFAULT '0' COMMENT '去过的人数',
  `rating` double(4,1) DEFAULT '0.0' COMMENT '评分',
  `rating_count` int(12) DEFAULT '0' COMMENT '评分数量',
  `map_info` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '经纬度',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;