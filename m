Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77CC650F35B
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 10:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344433AbiDZIJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 04:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344500AbiDZIJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 04:09:15 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E667B34BA5
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 01:06:04 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23Q45xpw022267;
        Tue, 26 Apr 2022 08:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=7A6p86d1CILvGm97lc3WvHM9y3XAezTezMp1eBSjXtU=;
 b=B/MPS2QMjA06nY1JVS3PDlZSrPxcKBR9sNqqWSakqbYh8BsBubManZEdTK9d0EbdYz28
 i7RkeBdozXQB/keShVLHh9zleygL0v8HvU0NGtoeLcdJewCEZt+Cm3PsHivMtxDMNCgD
 1HHpMV/q70fDtDw1HICOkzTno1hmUscQKcGBAwY2RX3J4oHtIu2ZDLWsRdwbeE6WI5V0
 oZ22kUUBVhngcfNbdL/9oSIlmdZ5GCYzEx0U13TxwBFY/7ET6DVOr6/bEfnFsthur2Rm
 3VAMci4xRn6NLhwkgpQKlE1CEHAEn9yCARLSyuHFSoLJMMdF2Zl+LsIv78clXwsjEvIt Hg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4dd0c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Apr 2022 08:05:35 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23Q80TJi020863;
        Tue, 26 Apr 2022 08:05:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fm7w2hv0t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Apr 2022 08:05:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUAjUmBC8zEbVh5mZ9pALai5T8PIDOatYay/rznptADwbW7HGJ7rOi5LEQfoiVI7uExjkGdAPXJbzdWM6FV6PJdSsRcg0Ey7jEQYl2gg6RQ/RCzkf3D/+HU2cVmk5ZztjynEAi4H/u+XfHIIGX7Ln+/qkK/5nsO+diT4kXD9DVHG+Vm2n0QYjxOyA6CShsSh1Jql5VQwQRw1UGXXz54H6VDcQGfT7psTuHc9hJ89iWE8SMyr2cKpdUrNQPnQxwqTqS4axbOqd1pzUs4e6kSAk89QzzNseVLh9pFJ1VN3HPemjGfYpj5K+Sq3BobuOsAlHp1w2GA7dXP9CHL+vYckaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A6p86d1CILvGm97lc3WvHM9y3XAezTezMp1eBSjXtU=;
 b=kvdxxTumkR/Y5bcYvl3v2t7UnhrLhUr3ArcQkl7ixFR8SmJP0en57PIgshJ2SgYowyMZUpolDj07BRSmAxneh+PcH6EQ89zu6CHL4ef2Y8ikZaGZO/hxJ4QBQpYAgPr6FIK1vfbfjcAzU7McsAjAMvORYiwRTlUC3Q6UhWn62oqs5df0a5NN2tQA2BC7rIr4OEse8NMDiOHwnBGuhqNHdpTiYLAnz021WfSCnJckvw6rkuJhUOtFrx8RQBMnA6qNoTcBzlXrdtsRfzYYbHKgG/pYFtVz/gAz2nbhOl+FYQuCnAmhOuSl9Xn+rpSViL8XYmyfDboMzKIiFvFK8kW5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A6p86d1CILvGm97lc3WvHM9y3XAezTezMp1eBSjXtU=;
 b=q0OGHE6lt1jZvSgRoNIjjIxDbHi7xHG9iPWnXaiuzpLjmrf3ofA3z/FjRO48WhxpoK/j7CYvlySF05rzJxb7przDwxbGcK3cTo6OUG3FF/ZW36+t/g42cLZRC0qarUa4eI3fhSS3yV5yylKyLJGjJggcXCLX7o/rS/97/St4od8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5198.namprd10.prod.outlook.com
 (2603:10b6:5:3a5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 08:05:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Tue, 26 Apr 2022
 08:05:32 +0000
Date:   Tue, 26 Apr 2022 11:05:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Ian Cowan <ian@linux.cowan.aero>,
        clabbe@baylibre.com
Cc:     lkp@intel.com, kbuild-all@lists.01.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
        mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, ian@linux.cowan.aero
Subject: Re: [PATCH 3/4] staging: media: zoran: replace all pr_err() with
 zrdev_err()
Message-ID: <202204260911.PpSNCMg4-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423051821.293133-1-ian@linux.cowan.aero>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0068.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f00ab350-da69-4a63-9160-08da275b892b
X-MS-TrafficTypeDiagnostic: DS7PR10MB5198:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB51981161806713B4AFE53E688EFB9@DS7PR10MB5198.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 52FJZKExsECSbjaDlAxo4HtIXflSHrfX7RMTG0m1ofG4sWbshJkc+TckcylbeCwqX+fJj1H8xXG4q54/gW2KpQv0+B9j5jO+QO55ho5WhMkkvfLhYc5bqpt1MTkRb9UKk/lxuiStR6d+v/xE9llhiuwLbCTsfyfmwi9d4Pv76lRuMcXmb5N8w8EyiNgVxDVvhxcc43z023asy+ggL4MUhDuhIuvvURD3/c4H4iOqPayubFja6GNPjw8fy6bxW4mAmrFh6YjIzVlcW53qfe1SaHsnA1GGaQ9hQP3Iksh1qIHRhvbBTdfUUo5IowQ0Qcz9qJt/T6Za9c5PdHfGHciJ5wU00clpqStwfwNHiu8SCQYWmSY0auOCcjWGmBvyfoh4NkrEzEa9tYD9Pkkibc9eEovIj+HgPZHXLTVsmSXQVR+uWmu6Xkl3Ta6BT6iADKBo8hHbEJDcFMsfbq7WacD9whWLwMJqwkiy4pU0zyDfdmObZRVEgHQ3jMNznyjJfAolfZQwZp/lqxJufu2YsN161hawpKKIlbXAyzx6/zNtwqCoJMlICjuvcmpRBl08w51KVAcRYtnmWSeT0y8jB3EmLHjxE2iKlSmI+CsIpsDGosT+WMBT3TuhYFpuZfJztuxGULObjs6WxGo4B7JHfhs+Blcm95nb3x+H5KVRnJ1diIzlNmQVsaE/W6H3ShWYUE2UgListpur2ZplwtmgrM6Ho/7z2jLnlExUFkBw+aSzrUB153+fp0e31+m3ZMxJR6JMAYL2qiYd7Z4ETaG1gBLduDCI6WW3qaqBMBd7usTolODzXjf8tVmBnv/CRUR72JAYiv0IPKLQLCJnLQoHjLZ9Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38350700002)(38100700002)(4001150100001)(2906002)(83380400001)(508600001)(52116002)(6666004)(966005)(6506007)(6512007)(9686003)(6486002)(36756003)(1076003)(7416002)(316002)(26005)(186003)(86362001)(5660300002)(8936002)(66476007)(8676002)(4326008)(66556008)(66946007)(44832011)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IPeklpj5Qdb94Sna/JqjS2UyuBDkfNSzzQZTEpNC9cdRhypzx9+GT5kMFCC4?=
 =?us-ascii?Q?KSGPnrz0i8rxJRa1GjSyM5QEWkoCPP+3zm2IiFD0Go/oHpCBQG/2XIGJag4M?=
 =?us-ascii?Q?6QkyeUny4IZ7APEAoI15a0ju0iht8sRs2khp5YPT/7V8pw7/FHVIEqZG/c+3?=
 =?us-ascii?Q?LIAvP+Q2T8uhPq+uPdNxgz7bU/pgUcKu+1FUzh9aQ5Ucw2tFvxDpdOBN7cfv?=
 =?us-ascii?Q?BVkXtprcjBcqRxJ8LcmbAONxq28db08FYnUv2KC0osfG8JIWhaN1GgopFge+?=
 =?us-ascii?Q?ticfTKAtsf9hcwQtJDoymRNQ1E6BcYQyQMDb16RlGrPTPzcxBQl7zJVfJq8g?=
 =?us-ascii?Q?L3liSjrO2h3Eftwm/IO0R/i501LBL+mTZl1bGDMUAhYGXRO7OXq+uisqiCUm?=
 =?us-ascii?Q?LnjxmE7nzrWUekUcAOdTHbkiC5bYGHUoU1ESEYu7oKxXw1LIapeJbP44u/2h?=
 =?us-ascii?Q?Tl7FelFlw3jYm8O7t6l9vSsn79BCaVYVJ2eWeT/8rIIjjpVaKD2TljpTvdFe?=
 =?us-ascii?Q?wCIT+PLnZLgv+r0aPGY16Qn4kbdEEabH/n11bbs8LjvdiD4+kGy086p9p416?=
 =?us-ascii?Q?9/xrWifjKeY3QnjDhWBUEADwIyLuUulSGwsE5JnEucvt+m/F/ZI22YxyfoSp?=
 =?us-ascii?Q?+zz4tDhLz/Zu3nu8ge9hRS6t1NrwBdrAP/umKFOfzQMp0LZcd2I4HJOj6NXe?=
 =?us-ascii?Q?BIcmfMOHi4ezZ47Y6vNgmlANMliQA3APuwDxJcj8USgDxn3AdtaYoBh2fyF5?=
 =?us-ascii?Q?NNaU9kR7KJPHjiGUTjS4sRnkj2LAWwGFv8jv+C9OWjQrP9b4DjQmb6qqUjHC?=
 =?us-ascii?Q?obX3i1p4UpdVTRaD1iLDqSClYBeC9TaryOIU0c6hoNXzhoh8FpkBBE1iuQ2a?=
 =?us-ascii?Q?I2q1KkirSd29RddcA59jnn8izbxoJQj6H5xaN0dxtbw4X2kqAZV1ZMaqd8t6?=
 =?us-ascii?Q?n5lnd1cUkItNvitNCinZG2np7w1bXzYAuS+tbDMhqJ1qMUIpII+XT9I8r4Cm?=
 =?us-ascii?Q?m2pYsoA/7nUhS477G383MISpxS8PlZkDpTRcANsbdbqoUjw4GlSZM+lovlSs?=
 =?us-ascii?Q?1C0ph+YjjLGu9MRjrPabBZ+yd+wFwlHRneKwoBl7G8kBJBouiMznrHT3Bzj/?=
 =?us-ascii?Q?6IL+XjNEJ8AYycnqTvWJOUAR3lihBRsktZrjqrnhY5Mkvgd04wL5G+VAMw1P?=
 =?us-ascii?Q?BDSRIe0//SFHfpSCUhF45BU5/HhLkeMVKhOz42ovoKyy1ZiR/yxX2gJ9xMfJ?=
 =?us-ascii?Q?iQnDp4fUpgBWAE1ybz64Ky91HUb9KEQd+SaHTxk82Ra90Hsi60W/2sTHF7FC?=
 =?us-ascii?Q?Vnj+41jZ93qCgKps3OtxKOxxAFO86l64s9IjYhIJzocJsxtCcAiaeVk3hYLC?=
 =?us-ascii?Q?wlIs9xmuhp/RZbZreFtJ0D5+9hiY5zIUi4GwtB+qQULmFCSKNEcDQZGUcZvE?=
 =?us-ascii?Q?rA2L6RWP9GfZOsNoaSHu91nDNfeMNF8dWBlO8EQft/lXO6w1FkrtwnRmcoQO?=
 =?us-ascii?Q?uRqXKC/E5u2QOkjPHkJ7YT3fIZI3PM3qA3+Q+rNYvb4eRRw8l2f5d7PbolXF?=
 =?us-ascii?Q?7RqbQOo/g96e6feXfngJzhs/mkuBSIiNmLSrLOZbsXIzViWXE5QqXbIoIdfa?=
 =?us-ascii?Q?rAVu+HOyEJymT9P6HvDS8sw7+BnEBEBe746CpMqmeMuhDvbeQNe32wDgawqw?=
 =?us-ascii?Q?V80KvDgcsrhSxboGagkdYRxVq63FRaLaFdHilum84d30L+WzAd5W0gdij2Ws?=
 =?us-ascii?Q?zO4odJFQszvfJacgGllduStWBpK6cpA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00ab350-da69-4a63-9160-08da275b892b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:05:32.6937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLH72p/7xJOQb5qZenpqYIBUMwJNrDXZOzJEHahEs8nNLrb5U/iT3Yqiv7QGEarsTysuCrpEwlfdXjVy59ksUF/zpzP1WYrutmt1In6fvvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5198
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-26_02:2022-04-25,2022-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260053
X-Proofpoint-GUID: gOokeE8jdIj2EGDgo2SzNuT_w7yzDljb
X-Proofpoint-ORIG-GUID: gOokeE8jdIj2EGDgo2SzNuT_w7yzDljb
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FAKE_REPLY_C,HEXHASH_WORD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ian,

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Cowan/staging-media-zoran-add-zrdev_dbg-macros/20220425-092814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 1efba7ef1d7da5944493728c5375fef5b2130de4
config: i386-randconfig-m021-20220425 (https://download.01.org/0day-ci/archive/20220426/202204260911.PpSNCMg4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/staging/media/zoran/videocodec.c:55 videocodec_attach() warn: variable dereferenced before check 'master' (see line 50)
drivers/staging/media/zoran/videocodec.c:124 videocodec_detach() warn: variable dereferenced before check 'codec' (see line 120)
drivers/staging/media/zoran/videocodec.c:177 videocodec_register() warn: variable dereferenced before check 'codec' (see line 175)
drivers/staging/media/zoran/videocodec.c:210 videocodec_unregister() warn: variable dereferenced before check 'codec' (see line 208)

vim +/master +55 drivers/staging/media/zoran/videocodec.c

5e195bbddabdd9 Corentin Labbe 2020-09-25   47  struct videocodec *videocodec_attach(struct videocodec_master *master)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   48  {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   49  	struct codec_list *h = codeclist_top;
a0a095d4ab6241 Ian Cowan      2022-04-23  @50  	struct zoran *zr = videocodec_master_to_zoran(master);
                                                                                              ^^^^^^
Dereferenced inside function call.

61c3b19f7b9eb7 Corentin Labbe 2020-09-25   51  	struct attached_list *a, *ptr;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   52  	struct videocodec *codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   53  	int res;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   54  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  @55  	if (!master) {
                                                    ^^^^^^^
Checked too late.  The "master" pointer can't actually be NULL so just
delete this if statement.

a0a095d4ab6241 Ian Cowan      2022-04-23   56  		zrdev_err(zr, "%s: no data\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   57  		return NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   58  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   59  
a0a095d4ab6241 Ian Cowan      2022-04-23   60  	zrdev_dbg(zr, "%s: '%s', flags %lx, magic %lx\n", __func__,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   61  		  master->name, master->flags, master->magic);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   62  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   63  	if (!h) {
a0a095d4ab6241 Ian Cowan      2022-04-23   64  		zrdev_err(zr, "%s: no device available\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   65  		return NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   66  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   67  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   68  	while (h) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   69  		// attach only if the slave has at least the flags
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   70  		// expected by the master
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   71  		if ((master->flags & h->codec->flags) == master->flags) {
5e195bbddabdd9 Corentin Labbe 2020-09-25   72  			dprintk(4, "%s: try '%s'\n", __func__, h->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   73  
5e195bbddabdd9 Corentin Labbe 2020-09-25   74  			codec = kmemdup(h->codec, sizeof(struct videocodec), GFP_KERNEL);
5e195bbddabdd9 Corentin Labbe 2020-09-25   75  			if (!codec)
fe047de480ca23 Corentin Labbe 2021-12-14   76  				goto out_kfree;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   77  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   78  			res = strlen(codec->name);
5e195bbddabdd9 Corentin Labbe 2020-09-25   79  			snprintf(codec->name + res, sizeof(codec->name) - res, "[%d]", h->attached);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   80  			codec->master_data = master;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   81  			res = codec->setup(codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   82  			if (res == 0) {
5e195bbddabdd9 Corentin Labbe 2020-09-25   83  				dprintk(3, "%s: '%s'\n", __func__, codec->name);
5e195bbddabdd9 Corentin Labbe 2020-09-25   84  				ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
5e195bbddabdd9 Corentin Labbe 2020-09-25   85  				if (!ptr)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   86  					goto out_kfree;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   87  				ptr->codec = codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   88  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   89  				a = h->list;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   90  				if (!a) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   91  					h->list = ptr;
5e195bbddabdd9 Corentin Labbe 2020-09-25   92  					dprintk(4, "videocodec: first element\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   93  				} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   94  					while (a->next)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   95  						a = a->next;	// find end
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   96  					a->next = ptr;
5e195bbddabdd9 Corentin Labbe 2020-09-25   97  					dprintk(4, "videocodec: in after '%s'\n", h->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   98  				}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   99  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  100  				h->attached += 1;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  101  				return codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  102  			} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  103  				kfree(codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  104  			}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  105  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  106  		h = h->next;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  107  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  108  
a0a095d4ab6241 Ian Cowan      2022-04-23  109  	zrdev_err(zr, "%s: no codec found!\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  110  	return NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  111  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  112   out_kfree:
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  113  	kfree(codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  114  	return NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  115  }
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  116  
5e195bbddabdd9 Corentin Labbe 2020-09-25  117  int videocodec_detach(struct videocodec *codec)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  118  {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  119  	struct codec_list *h = codeclist_top;
a0a095d4ab6241 Ian Cowan      2022-04-23 @120  	struct zoran *zr = videocodec_to_zoran(codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  121  	struct attached_list *a, *prev;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  122  	int res;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  123  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25 @124  	if (!codec) {

The "codec" variable can be NULL so this code can crash.  Move the
dereference after the check.

a0a095d4ab6241 Ian Cowan      2022-04-23  125  		zrdev_err(zr, "%s: no data\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  126  		return -EINVAL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  127  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  128  
5e195bbddabdd9 Corentin Labbe 2020-09-25  129  	dprintk(2, "%s: '%s', type: %x, flags %lx, magic %lx\n", __func__,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  130  		codec->name, codec->type, codec->flags, codec->magic);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  131  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  132  	if (!h) {
a0a095d4ab6241 Ian Cowan      2022-04-23  133  		zrdev_err(zr, "%s: no device left...\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  134  		return -ENXIO;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  135  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  136  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  137  	while (h) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  138  		a = h->list;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  139  		prev = NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  140  		while (a) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  141  			if (codec == a->codec) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  142  				res = a->codec->unset(a->codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  143  				if (res >= 0) {
5e195bbddabdd9 Corentin Labbe 2020-09-25  144  					dprintk(3, "%s: '%s'\n", __func__, a->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  145  					a->codec->master_data = NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  146  				} else {
a0a095d4ab6241 Ian Cowan      2022-04-23  147  					zrdev_err(zr, "%s: '%s'\n", __func__, a->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  148  					a->codec->master_data = NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  149  				}
5e195bbddabdd9 Corentin Labbe 2020-09-25  150  				if (!prev) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  151  					h->list = a->next;
5e195bbddabdd9 Corentin Labbe 2020-09-25  152  					dprintk(4, "videocodec: delete first\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  153  				} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  154  					prev->next = a->next;
5e195bbddabdd9 Corentin Labbe 2020-09-25  155  					dprintk(4, "videocodec: delete middle\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  156  				}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  157  				kfree(a->codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  158  				kfree(a);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  159  				h->attached -= 1;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  160  				return 0;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  161  			}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  162  			prev = a;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  163  			a = a->next;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  164  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  165  		h = h->next;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  166  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  167  
a0a095d4ab6241 Ian Cowan      2022-04-23  168  	zrdev_err(zr, "%s: given codec not found!\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  169  	return -EINVAL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  170  }
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  171  
5e195bbddabdd9 Corentin Labbe 2020-09-25  172  int videocodec_register(const struct videocodec *codec)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  173  {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  174  	struct codec_list *ptr, *h = codeclist_top;
a0a095d4ab6241 Ian Cowan      2022-04-23 @175  	struct zoran *zr = videocodec_to_zoran((struct videocodec *)codec);
                                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Dereference

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  176  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25 @177  	if (!codec) {

Check

a0a095d4ab6241 Ian Cowan      2022-04-23  178  		zrdev_err(zr, "%s: no data!\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  179  		return -EINVAL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  180  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  181  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  182  	dprintk(2,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  183  		"videocodec: register '%s', type: %x, flags %lx, magic %lx\n",
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  184  		codec->name, codec->type, codec->flags, codec->magic);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  185  
5e195bbddabdd9 Corentin Labbe 2020-09-25  186  	ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
5e195bbddabdd9 Corentin Labbe 2020-09-25  187  	if (!ptr)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  188  		return -ENOMEM;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  189  	ptr->codec = codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  190  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  191  	if (!h) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  192  		codeclist_top = ptr;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  193  		dprintk(4, "videocodec: hooked in as first element\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  194  	} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  195  		while (h->next)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  196  			h = h->next;	// find the end
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  197  		h->next = ptr;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  198  		dprintk(4, "videocodec: hooked in after '%s'\n",
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  199  			h->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  200  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  201  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  202  	return 0;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  203  }
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  204  
5e195bbddabdd9 Corentin Labbe 2020-09-25  205  int videocodec_unregister(const struct videocodec *codec)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  206  {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  207  	struct codec_list *prev = NULL, *h = codeclist_top;
a0a095d4ab6241 Ian Cowan      2022-04-23 @208  	struct zoran *zr = videocodec_to_zoran((struct videocodec *)codec);
                                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Dereference

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  209  
61c3b19f7b9eb7 Corentin Labbe 2020-09-25 @210  	if (!codec) {

Check

a0a095d4ab6241 Ian Cowan      2022-04-23  211  		zrdev_err(zr, "%s: no data!\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  212  		return -EINVAL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  213  	}

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

