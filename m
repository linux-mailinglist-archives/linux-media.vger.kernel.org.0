Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D903C1F70
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 08:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbhGIGl5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 02:41:57 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46552 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230351AbhGIGlw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Jul 2021 02:41:52 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1696Ugnf008109;
        Fri, 9 Jul 2021 06:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=vO8jfPldb40pnjAxiYQBbUa87S2Vueq33ToRp5mOcKk=;
 b=Spxprx0vihQMWfCjYxAY6+DXeIIdBiRbHvx9wStF1nGVvmKx+fmn/QZyMIHboBkOKtZh
 cGl5hVME6vCdQ9+F7vc87cg7bW4TvLsCIxKtJli36YfjDz/9Dxa6V0rABLHWnMCdaGkN
 huhSW+QpRa6E8N42pk+zZJyTXGU2ZMnLLmrmxhpTnHEPUNwadM1i+t2xN1UyAFjMrX19
 xMx4lhaZGaMmBPu3VAyBRHfZed9NQBvtJdD2vErVJvETUICe6yynEoWcE66J/JfyThaN
 HyJdW5oDzTdDUUCuzh5KKX0S6r26UHPspKC/LYPP2lHGsobPf/fCWfAqQlW81qayHVwv 6g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39npbyjn4d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Jul 2021 06:38:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1696UYJl139161;
        Fri, 9 Jul 2021 06:38:54 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
        by aserp3020.oracle.com with ESMTP id 39jfqf4p75-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Jul 2021 06:38:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEhjDsQBUDWNvU0npDr/9OMXGsNiOJWlpFhrpFYN8NEtvhVfLjdlobEKG0m6XDbHFtDlGxjP4fAPjHmgKgH4dXuylIFiR6podGja9K1Wpp+xMkc7zHie6HE2ukNm8jNMWzmIOFoi4DvzPshsURfdY0bO9/Kkv+Q6H95bfMBoreUVUtWJvZIRQoQX6urrIUcFtl+Yz4wYRXSUuq+1fFzc5GtCCyXMCcbvOIBBQgfLKI/j8X4JyS2sELZ+EgyBIFeexSqWl4nfNjWDPGNa8ico3AIvSZxCQxU9Gb7wjg16GQe400OetPG4yluMi5fvRTj6xMwlXhGDgEZntA0D0WTGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vO8jfPldb40pnjAxiYQBbUa87S2Vueq33ToRp5mOcKk=;
 b=ezu3kh91ubRMa2ZtMBoiRSXVnKyU5zmpkizDfwKdFXKxZf28izRd30syFtCKsrCBRlcFGVy/ML/VB9lnqyXMn3AC4KDXGthKFFR/nU2hlIQraT4wxKBtdZD0bpW2ZN8qZHXLiE1OD2YL0/e6rVNsRFxJQmp0SDsrtjFsjOVagpQ9PEFnxigXnYOQqgGNQ2daF5CG8Sy7DQjodDSFZ/paswrv+0cOJXaxCgKuAf6NYLmacAQ5Z7pARceV8q9LbcZVavrNK9ihLzOsZy+Nj0p8MjvHrM9spqzCIeOwnJ9zTdZuXZquFwNsvQkmZoXBpB8fpciUj5i552eE8iz06Vq9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vO8jfPldb40pnjAxiYQBbUa87S2Vueq33ToRp5mOcKk=;
 b=JLrxJpmZAp3QSNcjaVl3Tolb3xc5cWbRDdlQO7vjUIP1XB3VdBJAqTf6d4Lo1veXKJnqMfVetwGnunZ8ATIY3SWPY9xTa95xh71eYk40dfOGqGFVnkArU7XV1a76mvJ667iUoFH1/8x7DhXy344JmqEjhaS1/FAPOEbBmnDgq/w=
Authentication-Results: iotwrt.com; dkim=none (message not signed)
 header.d=none;iotwrt.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5411.namprd10.prod.outlook.com
 (2603:10b6:5:35e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Fri, 9 Jul
 2021 06:38:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.033; Fri, 9 Jul 2021
 06:38:52 +0000
Date:   Fri, 9 Jul 2021 09:38:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jacob Chen <jacob-chen@iotwrt.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: rockchip/rga: fix a use after free in rga_probe()
Message-ID: <YOfu5Zb2kpN/0Prn@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: JN2P275CA0030.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mwanda (102.222.70.252) by JN2P275CA0030.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 06:38:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2dbe30e-af3d-4929-d2fd-08d942a43702
X-MS-TrafficTypeDiagnostic: CO6PR10MB5411:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54113794E026AB7AD49BAC6F8E189@CO6PR10MB5411.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C7NKzl2BJNUHOiaOTdrZEsqglYVedwHDPWe/X67m4GepgbvRdCTOYG76C8JVbcFdP1sukp7VgkaVhYsFur95o5n1hgog+OIfqeWhiDvmF2UqQiaKzgHhb3qFslkOv0tr+j/e0lwKFMxvvdki6Q9v7ff5h60LlT0ziFSnorxmbzXl+PQeGUJ2ylFTxxcjLlpzc9eu4AWXkXY3+q/lhwlMogpC6BqSIHx+5C8puPsywHsqo4pf5aXpm+HX8umZr3iWbQqnQVCOMbTUHIsGcw5vgr3m+ipSjrp7Zh/3rDpLNJVvUGGsLmDJFo6awsCwMdvOHDDgOkEwTKEJItgpHH1WdYfit+SCPToUgkeN7a3VJcdXNIpxB9QUNPT4+1Eb9+NV2SUb+GODiMIxpZTLM9cJ1cgs5/7nqmsip8nnZ3mibaaglae4Mvw1eQIeVYaXCYxnfr3NHVZuzl1YB9URO7wbQ4PNvxpvyt6geJlcnxE6Pfs88Tcbbynn6sQ5hPnv3ZNrColtsoMfkh4HFq8bSbSAS8HqgXnknUAF5MRpRDst3rBHsJD9mefsGdEIlMXuOduy40JR7aAbrFCcbe1ivebzbMfNPOrF2h8xc3TJWxrBJJ6iPqapFCRGk0lYmqbuewMcweQXzsdwusubJS5q2ouqW92rAeucCeghkDP52yHFnx5iJsd0MJdJWaul+NUs9jX7xm50NWUeCSMibVHpu+leQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(366004)(136003)(376002)(6666004)(83380400001)(956004)(5660300002)(55016002)(44832011)(86362001)(7416002)(316002)(66946007)(52116002)(66556008)(9686003)(478600001)(66476007)(2906002)(33716001)(26005)(8936002)(6916009)(38350700002)(6496006)(38100700002)(186003)(9576002)(8676002)(54906003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C0MO/jpgA/8E23BItyS50649V6iBl/W7biryd23O+HJb+bjMNtAzZahK+gf+?=
 =?us-ascii?Q?JoDgGfBEQrhyFl+m2hksuQA9AWNUGbP0k6aDyOyNlNsR0/V3mzp4q7J/kkCP?=
 =?us-ascii?Q?2cWVX5VldaaPGW1mH9SBfvG4yDVLrfS9MQQ7ODkq/e+f7xame64ivQ0Q4pKa?=
 =?us-ascii?Q?/hcxsBpA1kZJm2n+rBeModpaNQAnXL/VN6s4mQriLyZrG8MVVTI3BIPyFlCW?=
 =?us-ascii?Q?Ra8aWoavb+L/V75f5Im5deVD+vw5tHrwiVmDQcJXbQxNKHbuYZ8+cByB5qXp?=
 =?us-ascii?Q?LopsWRjSiyeFaw6B206XpPdE03qv+skenDgissTcOOowzHb7lvGp1zLj9jX+?=
 =?us-ascii?Q?+h1y2Det/2RILPWvF+bTKJ2hiEe4kfRkaShj13Uxoykx5pfRjsKuWKMAt24z?=
 =?us-ascii?Q?o7R0/fRH4CjYgW7qPZ0mToutztD37mtVBWhLghdTRGpedLaGymdoGyIKhKGG?=
 =?us-ascii?Q?G3jKfhHPMeyuLQLJ1sjEBI9tXOx7MR8Kj33Dg7jAI3teNl75jtGLKBdL7Qgl?=
 =?us-ascii?Q?XJkxh+l9dbOyvA/vpOlxpC+5kpUoh7ivJmZt4NiBBN50PL73on17y+OdqAr3?=
 =?us-ascii?Q?s/s8Xi3bP/zpx4EakleapBbCV8UoMK7ZtWTENZapnvHxWlWLP9+QzGZZ3zuW?=
 =?us-ascii?Q?KQR+3zmGoYSc+2IkA2Szhjh4abvL/pNQ4pKZCxPS54UKa5r/+C2zNsBIkHIF?=
 =?us-ascii?Q?H44mFVsrU0qx66MPon6PUVm6rHZGUWxnozRBA6gn1L4WZ2xE5gVMXJlIlttD?=
 =?us-ascii?Q?7DoR+LAFrw+BRpFL+nOn09a/l4/qY4fKfJTeOwhsP18z8rfXntHyGZjKCL1/?=
 =?us-ascii?Q?7irYHfLpZkAqByanTYbylhjfdCjvQatJq75o/Jlk6QFqfZTTICxqksZ2W9rt?=
 =?us-ascii?Q?aZ+LpOBVeiRd4rf2RPMV73//HnLgp6Gf2tkBgbGfYKuaiIA09IlI+H74SPF5?=
 =?us-ascii?Q?nty1Egj/Ubi+hhF/M+AMp14tgHI8cZEJZwjEOl9cnw+NJdVgKe9Two1dAclZ?=
 =?us-ascii?Q?q9ITIo+SQ1Xj7uRVVvMIr7u3+/C6i+2K4j1ucVK/LRhxdxgY6Gu5+F7mAlwP?=
 =?us-ascii?Q?UPS5iWFVB8A4fRFniwWJlGf4VHHMj6ktcvxKyT3ZA6ESCWZA7O27I6p6Nk17?=
 =?us-ascii?Q?cmW+C50cU09bsIbFDtX+mUADkvdlzRUQUF3m5Dhsi5f4djYgI8L3Zbor1zD2?=
 =?us-ascii?Q?D4yMb8OmYMU7rYQ52RnKW9OCS6iPm9MLkqYGo7wbeFP5ULOCFLC49QwJCr2E?=
 =?us-ascii?Q?e7V3OKNanhzTLc5oLJRae0TO8IUZNxTEC4IQnE4gUjCS5zjuKvjArmx681j2?=
 =?us-ascii?Q?RQiEZOTROOmD6WiIK79PQfPu?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dbe30e-af3d-4929-d2fd-08d942a43702
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 06:38:51.9194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRSmWKSZ9DL8PIW3PxgT4Qh/LU9Oo5/UGwI/juvrAp9AZGsVZvc5fRTCwqb7LSQf3Kkpimhsu2JbctqjiIi06359vzacoo01Nk3Uw/AYQTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5411
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10039 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107090031
X-Proofpoint-GUID: f0C4woq8qS9bvFqO4heU1otUb9BWvc4l
X-Proofpoint-ORIG-GUID: f0C4woq8qS9bvFqO4heU1otUb9BWvc4l
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The video_device_release() frees the "vfd" pointer so passing it to
video_unregister_device() on the next line results in a use after free.
Calling video_unregister_device() on a device that hasn't been
registered is supposed to be a no-op so that can be removed.  The paths
with to goto unreg_video_dev have a memory leak and should be updated to
goto rel_vdev instead.

Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/rockchip/rga/rga.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index bf3fd71ec3af..37f7fd060c38 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -863,12 +863,12 @@ static int rga_probe(struct platform_device *pdev)
 	if (IS_ERR(rga->m2m_dev)) {
 		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
 		ret = PTR_ERR(rga->m2m_dev);
-		goto unreg_video_dev;
+		goto rel_vdev;
 	}
 
 	ret = pm_runtime_resume_and_get(rga->dev);
 	if (ret < 0)
-		goto unreg_video_dev;
+		goto rel_vdev;
 
 	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
 	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
@@ -904,8 +904,6 @@ static int rga_probe(struct platform_device *pdev)
 
 rel_vdev:
 	video_device_release(vfd);
-unreg_video_dev:
-	video_unregister_device(rga->vfd);
 unreg_v4l2_dev:
 	v4l2_device_unregister(&rga->v4l2_dev);
 err_put_clk:
-- 
2.30.2

