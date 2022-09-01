Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAA65A92A8
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234321AbiIAJD4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbiIAJDV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:03:21 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAB712D51F
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:02:33 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2816e8hx024955;
        Thu, 1 Sep 2022 09:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=Ge59dbz9rulCQMQlb4iAZ48VtIXZvSfivpPz5p6O9g8=;
 b=Y0VAoU2L/WdODIEJ9gAlZy3juFdHjSDjx2De8z4Zh82MVvJo/r3fu1JAn88EsVSMT4g5
 /0+vkhkqNgZMgaVR1gvC/k9vcTh/m1TRxYHGnfFpJH7MCZNBfZnofHmDjDUkatkm90gZ
 gW/pxvYVamJDmBd7aJcGI+4BdAsDIihbabIBkhHSUlTF/ogd011850wmFOhyZC8c79up
 OmxuLAaDbrUwRAGxbQp6CHV6zZSbblkW6X3axCfZ+WcyP8yr4BOsiEtaAtxK02sBlHNU
 EiXwLgwLxsyaGYP7x8qr60+Y+A8k8DE2vUhleVMkPOYS3og0E7nIQACnAv4LA/r2tYwT rw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j79pc39vd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 09:02:22 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2817THef022114;
        Thu, 1 Sep 2022 09:02:22 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3j79q5yu53-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 09:02:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHUlXjeiz69WJGyokAH5Ms3/Z8g+peHRto8xWYo6LRp7xcqRAbin3O9KvJ/PQEH4DBuxY1WRLzi+cLcAEZ7c33KWzDAnQqgOR2BvSgCTE/75qVDewykxA/OUJWmHqhMa9WJHLgHCHpSHCT8t6P1UA7mQjyXg9ECTPRZ1TreqLk0umuOMry0tnXSxr2mIXqRssya/0Q2bSvzAiPmWkZqk6QBL7C+UtoH8RXQd5KLHNh2+sr9oL8srjyEZUjIphUgcGyIM96KO4tkuHK8Kh/8QAYN2TIUBuvDKG1kuaB4FbgWrSJjdoIGaIeWoFYT1ySFGFTUYn/CRKplomBP9LLcGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge59dbz9rulCQMQlb4iAZ48VtIXZvSfivpPz5p6O9g8=;
 b=dCl3JCho5dr3DbzDat8sGna810Cg6RVkAGV2PiVk0Yc2o06+KAKZtSxo+EZw3ax3NZv8TraZRKwm7FatOSr3xm4rCPfDDb1AE6vTk+Ai2NsKi9/2betAm71hzZBrKlb6Eu1nXqpHHRd6dXn68UhlgrwhYSHf7U6c99j4QE3/2tITw+5Efy3yqGLltG2bt7wl2Q6oeQyFPuVOssZYa09nPPgWYn76dQ9+PbeMS/ev7G1jaHJzEmQHiC6hMgbZw8mYaMm2fTxk2WkzhWIzKJc6CDRteJ0rZFPBr2ddyCv1FQlBgL/opVkiZhzOKybjtHrBsKXVD0AGvNLPW5khG5S+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge59dbz9rulCQMQlb4iAZ48VtIXZvSfivpPz5p6O9g8=;
 b=aKOgGTWgmzj1FlTxMMVIiQ7ejJL9m9+ee9Pkql8CkXPzpVlHp3BafEeWiI1t2a8AgiNRDyrTLKw7QAX3MOsKYc0LfOn9wpZs03/vAnfvFtlJvuDGIx0WtWd31d4HmTt30apYi3e4B1qzQsylFwTMH+h0sucD9lyYUdPejhMhHKI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5860.namprd10.prod.outlook.com
 (2603:10b6:a03:3ee::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 09:02:19 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 09:02:19 +0000
Date:   Thu, 1 Sep 2022 12:02:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     moudy.ho@mediatek.com
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] media: platform: mtk-mdp3: add MediaTek MDP3 driver
Message-ID: <YxB1E00e8D6P4W2e@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: LO4P123CA0518.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c15b8484-41af-420e-658f-08da8bf8acda
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5860:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0LNAVweqm4QwNkLNY4oh1m9jNL+Ez5UnapVcQN9jxqClUOpzZS5hD6m4j4HephbzCcWokTbhMRKUjiXaQQ7sQRf9th2VNB8w/T39QFxbFflzjZPLtReT3gZ2OH0GHNyYYCq26sVymGAuxvAN+oZf009OcMRntmG6tn7IgtA9xSgNjfTYr6jbQgI0c0x0pd1uL7AjMH/lHCBsdZv4KV/ajSYK2WIReVUpJY4znbsLqqAHFiuRNtEeXiG7rWLCXk6/O0aUl5o+8AwKXsXmbBNYeJxDPLtVN7IbdaCihFeHFUANS7QyXkk1vT4+AiDzEss301ki9SRTygQjxgEAlGc6NMqy6oFJDFPEpZRhKqred43TVKzOf2aO5ldRervj7GjrVJIyPRbXtX8Nrpm4ELc/lNAUiQeF72NmvmuSsSSgGu8e/4+N6iabWlbF/kmGO1VW3I5yw9jVF3Itn1mJvd0QBmf/HfyBI/5QO6JGEeHa7icSvoj6xt++D0rZckd+yIxpCUP84LFTWs+C8/1bEiJBKwM7wUJ6BobXZ8v9uiDW7GdkrP34wY7MncodoVsou/2Z9vPGdu0BKs4+TAo3i66Jc2m/PrtoxzhCYfcRvuia+xiYKLYbPo25T2nrQXYzjeihJ+OACOqhb+JnCVGloe880jNL0GviC2CcrRipnLSiY+le+Z0koxawrYPiPL5iytFZPXw06t6h27fzjALdjNQ6PorW6iTTHigQBAJoySs8hyami7C7DRiYw2WGvymlpWALoHwwF0FBAkJMdsQuzqopaCAuRvmdFhTRpJF9R2tNSo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(396003)(366004)(136003)(346002)(39860400002)(83380400001)(38350700002)(38100700002)(66946007)(66556008)(966005)(316002)(66476007)(4326008)(8676002)(478600001)(6486002)(6916009)(8936002)(6666004)(41300700001)(5660300002)(44832011)(86362001)(186003)(33716001)(26005)(6506007)(6512007)(2906002)(9686003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gUpV9F+8RDtcZxdD6yj+pZaS5dcKAb0ufV5qzO8GWYwKHZotoiQLipV5kvdf?=
 =?us-ascii?Q?WLjJykJb3TpLB+gtlaoRkvjDVrVfjUSX78suRVJVMCSse54xAmDNVa400fCE?=
 =?us-ascii?Q?T8/rNglOJL0ME2/PztvJQEHbyBL6xosYSQYcuPrsDz49U2kBSb0FWsTgWTi+?=
 =?us-ascii?Q?7rL2zrUnzCHPgfOFH1Hk1lKBGHxgCMk0Tl2x7y6LwvTElqgQ+vuOJvlaiKCG?=
 =?us-ascii?Q?BhobHz4gMhDBGBUtSmlEqqay58xu7dSpXr/4ZPb1/ODSD0PGActD8+MbfrgQ?=
 =?us-ascii?Q?dIBXX8j/vtgJs5AVVMf4Ybe2tH7nMkqd2nd7eKOOA7jOJ95vrbU5PXOdLhUh?=
 =?us-ascii?Q?I8blHer6S63FsKXPzIYqSCOMkNdbdkEf5NnyzRsHKWpIVnX3vp16gaTSz0xL?=
 =?us-ascii?Q?hEVRtvSjjgG1NmG6WvzXGNnJTF4zbPUTbdCR4MGcExz86NPKsjjWPSrZ2M8s?=
 =?us-ascii?Q?P8uTtqnf3wf+8N/WwcC4hTXDWPUIO43Y+aILOekLvn0klUYQSL6x1eKTox2a?=
 =?us-ascii?Q?VivkGcN38KNu2s0+G2pEpGFa3IQwNn/oQPoo6Oyi/qyOmSkG4wyYru/jn3nV?=
 =?us-ascii?Q?ZtV4u4qZoMvvHuwQ0i+25/4/81vsIHKsbbADQTceUpCtbF57mKZlgqmAsDhE?=
 =?us-ascii?Q?ERpgbtHKND1ZhTj+ePqunt6t0QyF/ckoEOZ1hiTrCj4Za69ielu0zOqDy1/V?=
 =?us-ascii?Q?tTTrZi565X9Ffb9ghnM+AaEuO3tQvfqCxTcNzeehHM7aQlwfm5uHLeo6mElL?=
 =?us-ascii?Q?IQM7gqxxfiCIgroWiEatSeeYCtDyiRuKQPspu+36Npj0oOKvK/ZoEQRjX75b?=
 =?us-ascii?Q?/tH4kPw+jAficdF+9X+kQSV7yUBk3fu/FK3AKug94Ag+m/9MNf8NTyRutTXE?=
 =?us-ascii?Q?nYjEtNgBRUqlvwgl6ZZMeqx8XaIbrTS1sM4QKb07CHAkXTeT4fR3FOCSSNez?=
 =?us-ascii?Q?T93KYJqdaDING+bVXWl2UBZAEiz3/icWB7V1BorRzfQNtiWe830wbyb2OKrg?=
 =?us-ascii?Q?Jlv7RJUqZr2g8ZIgiB2KP/Pt6fs9wx+i4qzIpSK9KkRkGzWNiU5tBs7GXDH6?=
 =?us-ascii?Q?VFgmIRilazZdnPd1mHNQdCi0cKyekZeABt3DVgbfVBOHBMCClbGoaW7TJEbC?=
 =?us-ascii?Q?ypts3ywVE+Mx6NJiGW7BxUbq1I5mPmUiuP0fbSCJU/4haMoF79XwfGw+aQK/?=
 =?us-ascii?Q?ihIPToBOMTrTmT81mImoMckZjafI7Gy5keXlxNqKlYHtpKx4CFu9d+jVyxdi?=
 =?us-ascii?Q?5dg3z0KXwx6n+ct7dWo2rEnBJHTG1Xi94X9PFRmsfUIYqSs0jSJCXOVSO5e3?=
 =?us-ascii?Q?s2qsT42smG3V5kD3wCVF7Crw1WQoIlkewvTlk+q+HI/JSfG93HfF0vedjRyS?=
 =?us-ascii?Q?K1KoUFa7QI2zc4rRmvX49eRqEm1GWNhkHw4EkOmS6Ug8smj13I8rjcoXmWf+?=
 =?us-ascii?Q?VKNhYmx+zGSYiYZnaq0i5xRfpIemrJVNRBszqooN9JweAwmPsb/FFmsHsTq/?=
 =?us-ascii?Q?zXqPLGB9epFl6HVovuxPnT7S0T10XoyQECSygbE1J5srdwNw0ccsjNv3wejK?=
 =?us-ascii?Q?B+O55QNNfvcKxpNfZYiPQJ9qFL1uAupZQ2x928HRV8is1MzZHZ+7ZBY+hgTm?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15b8484-41af-420e-658f-08da8bf8acda
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 09:02:19.7303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xfung1AYh0DPzqavULaZkGBlCE0WA5uF9ZsymKPU7+v2/gNfk6eogs9BIAFahtf5xWyTvUYq2SiWIBKzYAGixmNYTCCyP3Xi0gfwQRTnFS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5860
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_06,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010040
X-Proofpoint-ORIG-GUID: 6VO1hEx5jb9teaVIoqfgNfboxupHP93s
X-Proofpoint-GUID: 6VO1hEx5jb9teaVIoqfgNfboxupHP93s
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Moudy Ho,

The patch 61890ccaefaf: "media: platform: mtk-mdp3: add MediaTek MDP3
driver" from Aug 23, 2022, leads to the following Smatch static
checker warning:

	drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:460 mdp_cmdq_send()
	error: we previously assumed 'cmd' could be null (see line 369)

The error handling in mdp_cmdq_send() has a number of bugs.
Dereferencing uninitialized pointers, a double free, stack traces, and
not propagating the negative error code, and returning a positive
number instead of a negative error codes.  See below for details and
potential fixes  (not complete).

Read my blog for more Error Handling Tips!
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 29f6c1cd3de7..0cdb62c27b58 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -252,10 +252,9 @@ static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
 	dma_addr_t dma_addr;
 
 	pkt->va_base = kzalloc(size, GFP_KERNEL);
-	if (!pkt->va_base) {
-		kfree(pkt);

NOTE1: Freeing here lead to a double free

+	if (!pkt->va_base)
 		return -ENOMEM;
-	}
+
 	pkt->buf_size = size;
 	pkt->cl = (void *)client;
 
@@ -368,25 +367,24 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
 	if (!cmd) {
 		ret = -ENOMEM;
-		goto err_cmdq_data;
+		goto err_decrement;
 	}
 
-	if (mdp_cmdq_pkt_create(mdp->cmdq_clt, &cmd->pkt, SZ_16K)) {
-		ret = -ENOMEM;
+	ret = mdp_cmdq_pkt_create(mdp->cmdq_clt, &cmd->pkt, SZ_16K);
+	if (ret)
 		goto err_cmdq_data;
-	}
 
 	comps = kcalloc(param->config->num_components, sizeof(*comps),
 			GFP_KERNEL);
 	if (!comps) {
 		ret = -ENOMEM;
-		goto err_cmdq_data;
+		goto err_destroy_pkt;
 	}
 
 	path = kzalloc(sizeof(*path), GFP_KERNEL);
 	if (!path) {
 		ret = -ENOMEM;
-		goto err_cmdq_data;
+		goto err_free_comps;
 	}
 
 	path->mdp_dev = mdp;
@@ -406,7 +404,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	ret = mdp_path_ctx_init(mdp, path);
 	if (ret) {
 		dev_err(dev, "mdp_path_ctx_init error\n");
-		goto err_cmdq_data;
+		goto err_free_path;
 	}
 
 	mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
@@ -414,7 +412,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	ret = mdp_path_config(mdp, cmd, path);
 	if (ret) {
 		dev_err(dev, "mdp_path_config error\n");
-		goto err_cmdq_data;
+		goto err_free_path;
 	}
 	cmdq_pkt_finalize(&cmd->pkt);
 
@@ -433,7 +431,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	ret = mdp_comp_clocks_on(&mdp->pdev->dev, cmd->comps, cmd->num_comps);
 	if (ret) {
 		dev_err(dev, "comp %d failed to enable clock!\n", ret);
-		goto err_clock_off;
+		goto err_free_path;
 	}
 
 	dma_sync_single_for_device(mdp->cmdq_clt->chan->mbox->dev,
@@ -453,14 +451,20 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
-err_cmdq_data:
+// FIXME: what to do here?
+// err_cmdq_data:
+//	wake_up(&mdp->callback_wq);

NOTE2: not sure how why we call wake_up(&mdp->callback_wq);

+err_free_path:
 	kfree(path);
-	atomic_dec(&mdp->job_count);
-	wake_up(&mdp->callback_wq);
-	if (cmd->pkt.buf_size > 0)
-		mdp_cmdq_pkt_destroy(&cmd->pkt);
+err_free_comps:
 	kfree(comps);
+err_destroy_pkt:
+	mdp_cmdq_pkt_destroy(&cmd->pkt);
+err_free_cmd:
 	kfree(cmd);
+err_decrement:
+	atomic_dec(&mdp->job_count);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mdp_cmdq_send);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index e62abf3587bf..a18ac10269a6 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -699,11 +699,22 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 			dev_err(dev,
 				"Failed to enable clk %d. type:%d id:%d\n",
 				i, comp->type, comp->id);
-			return ret;
+			goto err_unwind;
 		}
 	}
 
 	return 0;

NOTE3: This function *must* clean up after itself.  Calling
clk_disable_unprepare() on an uninitialized clk will trigger a stack
trace.

+
+err_unwind:
+	while (--i >= 0) {
+		if (IS_ERR_OR_NULL(comp->clks[i]))
+			continue;
+		clk_disable_unprepare(comp->clks[i]);
+	}
+	if (comp->comp_dev)
+		pm_runtime_put_sync(comp->comp_dev);
+
+	return ret;
 }
 
 void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
@@ -722,13 +733,21 @@ void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
 
 int mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num)
 {
-	int i;
+	int ret, i;
 
-	for (i = 0; i < num; i++)
-		if (mdp_comp_clock_on(dev, &comps[i]) != 0)
-			return ++i;

NOTE4: This function is supposed to return a negative error code.

+	for (i = 0; i < num; i++) {
+		ret = mdp_comp_clock_on(dev, &comps[i]);
+		if (ret)
+			goto err_unwind;
+	}
 
 	return 0;
+

NOTE5: Same bug here.

+err_unwind:
+	while (--i >= 0)
+		mdp_comp_clock_off(dev, &comps[i]);
+
+	return ret;
 }
 
 void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num)
