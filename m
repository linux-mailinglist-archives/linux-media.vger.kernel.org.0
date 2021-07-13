Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77B93C6D41
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 11:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235031AbhGMJ1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 05:27:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14784 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234397AbhGMJ13 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 05:27:29 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16D97JLb013915;
        Tue, 13 Jul 2021 09:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=L17bwVMs4gzgIH8mx+YPUPVmWaRdar8ujU1PA9RXgM8=;
 b=wcDWCqYaspUCnfNoMaECLfaGhH69HkbvqDReBX30FiK+TB58uFLrbIeVflW08vvhJ9Rc
 ukk/DUlDlaCtKQY/csCQg9Bgtt1pDlHc3+Gp8MT8P+Lgr+b8+OW2SOgp1jIOPzleT6bJ
 pObxKStRd+At17KYx96b7RLxZA0xc69NCqRFkzsrvF/+GhtAk2P7bB+ONklulVoAOFDf
 oEpcmGLNBNs64oVCuVaLPbajmUB+EKZHJR3Op2PUH/pJdguCLlRzqZNwiqLnMohFb6Pz
 rELl2vLQpZ9obprMAK4rLlLR/LVuwivgvF8JFuPyWC4odw3vPBJnWoYLOWM0BZdmK6t1 vQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 39rnxdj3ue-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Jul 2021 09:24:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16D9AsFO151876;
        Tue, 13 Jul 2021 09:24:24 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by userp3020.oracle.com with ESMTP id 39qnaxafkn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Jul 2021 09:24:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bm36Zg+0DbMHAwH7jrm0ggQegnOJCQbuSm5UhT88sOZV1/eb8oQbxADN4SF0KJvtpDrMYFUb6OCgR/gL+vcispSRI0rSnc2LrdJahWY6/8yQZO/Dl0J98rxKtNCTew4UG937uhmr2B+c9T7qdW9GDoFvfZnnky4/OSiZSeJfxxRwWN9cshcY3g0225TjrqfHzmEyNSuX6ng5hqdnw6d9LjWVNp3+EGlun7Tmv5WPiZlvA2Csb0IvCfGNQasideplFV+/8nZNPp53hUmDD8Vw4gJrsqM6oCNbpVZnBuGYcMhXf7YQdMstJGJMBX3kDTUnD50Zz9a6ZJsKMNN4EOpQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L17bwVMs4gzgIH8mx+YPUPVmWaRdar8ujU1PA9RXgM8=;
 b=W1dR2WT4ftNhbKTfWqXeFhvK+ZX+5wVZDdS/I3KNRJwjBwhH5aCmnnQswmz5U9Ot9GPVc8oq0HZQx+HpFrTDJmQayZQ03kD1bSXbpDi2tS4SIFVRgqd2O1gIcimGYUe7smSchLr8uXGvjbHtI3fEMaGR7DkwZSJdjh89vwHlorsJnvje59m8NKurVPyDwUGKsHjsqxhAOWlHHHD1ir+/qwqFc15rQSdzJi25IsQeoUV8xPDMuuo+ot+aRGIsxPKeHJ4Wpgp257ISSTeno9lNegMjqO2wbyOAZ4uKw/FM+3TCD4tS6iS4Hbl+V63h8uS8yvcsS08zlI3ct+mr5YEg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L17bwVMs4gzgIH8mx+YPUPVmWaRdar8ujU1PA9RXgM8=;
 b=rEsGgQkdufft0vq5KfGMwc1MIsQoyEOsmrBPrWGCrpxTaE+VMYMiLAy4NdNem3c7eNjk6c3tBuoMuBpkMYrO4zJ/z6DEIFaqLv9ifhHyGAYvCmKKNWmP/bqCH7xUHkm29eq5vQ0/U0U7xAK5/1099oWnfcsQw5YEVZp0X3gbbhg=
Authentication-Results: iotwrt.com; dkim=none (message not signed)
 header.d=none;iotwrt.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2159.namprd10.prod.outlook.com
 (2603:10b6:301:2c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Tue, 13 Jul
 2021 09:24:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 09:24:22 +0000
Date:   Tue, 13 Jul 2021 12:24:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jacob Chen <jacob-chen@iotwrt.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Dongliang Mu <mudongliangabcd@gmail.com>
Subject: [PATCH v2] media: rockchip/rga: fix error handling in probe
Message-ID: <YO1burFzVK+l3JST@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: LO2P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mwanda (2a02:6900:8208:1848::16ae) by LO2P265CA0050.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend Transport; Tue, 13 Jul 2021 09:24:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13570910-4a0a-4570-16ad-08d945dfff95
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2159E45C429400F45068E34C8E149@MWHPR1001MB2159.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BpnS7Pn6XEBufSdYBF6vjWlBY4YT0yJ52ld4tIEkn/a+VfTZxZpvmMHGJxOU70PuOVReHKPLRxdMOykw8g6CdvzmC2wMppg1tB4/vtaSHOr25CelCEBPXe2x2Jil4nCeJw6/JKa7Z5kPH63jjrRlryH+ONJTFXg1VjHWNCtJfOS7rbGMkiwrFgfsl1WkjO1poiojmie1aRFdv4aw2GwyG6NE/SMN4g/9HhowROLIgwv0XJX12UQj+UysoOmMJ88gNyaM57iPaG8wBSiKJLh2P5+xOCAJG5x/D3G2jPgKFMieOUnx950AmJAhlP2xzXytu7T68R6Qz6ZWVJt3dcz8AWm2Q/NqnhOmYgy/gaiUrciqK7yfwdvV6YK0BmRO/JCHCZHar0+ZM181chfErbXMiM8uWBfNQ+FwqjS+oAeZW/sPqLZGvs9HhwH3eqmEtuKDD8jVw+zadotogDBvV7DRQul8M0TQcBxQTB3LC7JwrZKDVrlLj8KcTQceDGch8wsiG6lyNfUJ1tTOmOzOFDFk4BxH/PpqITX5Eh4KPjKYtmyuruq3takUAuQkO4LIaZrGeBi23al6ZK0okdAD+qWBcz1g55XPH9bCsfLUqtMCstvFPjwZA6wktrn06Rjet9Zm+PFwPnYFxwzmIdsLeKoXBBNMF5vH0Vu9A7VOzyMNOA70SVzgX0NvYDPafqHf737+GcU2LSzBlgBUHIC6NE/bhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(39860400002)(136003)(366004)(44832011)(38100700002)(83380400001)(9576002)(5660300002)(6666004)(33716001)(316002)(54906003)(86362001)(52116002)(6496006)(9686003)(2906002)(55016002)(6916009)(186003)(8676002)(66556008)(66476007)(66946007)(4326008)(478600001)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hRDovjINpn75+Ic5O3QmuQN9OMGSKgweBQnH+j6DG1grsMMbeJm6k/1TtFbX?=
 =?us-ascii?Q?+rXjS0vFDE/thfg9klW+w72kpQ55Me940WirCa/TXKYu4HneeV7L0D40c0wG?=
 =?us-ascii?Q?u7FrImz+1ja0ESIBrlm3ZEaoyoxp/pn3p393ldb6R8PcIXrysrp+9M6KVg1n?=
 =?us-ascii?Q?fqqvROTZxicRaI07fie9X+C8W1EiPSvjBjFdWb4649aqOZ4BuQsvvU2VAf56?=
 =?us-ascii?Q?6Kt01gOsfT86bymrAX7Y5Bs6UIjnikFQxx0qcpuafA/Sj+laR9NIsblLd0cb?=
 =?us-ascii?Q?zaaIEOM1Knsea8P4WZA+HJM+6MFYPmqg3NOsMY0LI5wJIauVT41M2bq+Rx0F?=
 =?us-ascii?Q?2KFMZchb+XusP3iQgUpLpHjwTvVTTzBraYrQ5SlS5bBdteM3rpZpb+C9ehiM?=
 =?us-ascii?Q?gi02JJpr8kc/YP4Gv8JpE0Qvx9wJ43upCDKeJWmraIPZbpSPAqCadiW1Sveh?=
 =?us-ascii?Q?5Cnaya3Wrd03fYMRTzt6q13TN97Xbgk4ll5ayuGpvdxeJcMlEmiT1hIBo2ak?=
 =?us-ascii?Q?Yz0xLno87RozuaBIiMlqFJatOtiLaK9oy8ukTKdGRZPu0Ui4eVtXHzJHHV0i?=
 =?us-ascii?Q?VFbjMM93tvIJg54sSFeLJ+7IkfTuR7KAnW3/M2+aq4CTqqpVw6rRojPjp0QE?=
 =?us-ascii?Q?MC41McsTxT25FBypQARNqHOpj0EQrfbftMxmYYrNTj6kAESPdTjgMTrvoCrh?=
 =?us-ascii?Q?gqmgXTIJYH9XKlULdehNy+IaNaIFxx5nVP4CmHqYkhyEGO91aPh3Fg7Yi3Cq?=
 =?us-ascii?Q?Mp870SkXXAy5SVh6BJjBmH+oa13MWJJZRVKkhpDZudU5jNcuRMBKiteCEWNl?=
 =?us-ascii?Q?7EvJN0EmwO7PuQVj8kETjuTqcJH1xM6wio2S6yhmB1pY81fu6CExE/hdbFqh?=
 =?us-ascii?Q?xhMBkhvqfkdlyn2e6/DHbvq9vIGha3d5W6lFlQreiPLTHuEpFPA597aOXOqO?=
 =?us-ascii?Q?yR9rq0KX9ArWKwC6amVp3DYDCG1utUSr8V9fxapCHARW70ibiYGFXrWfZ+gM?=
 =?us-ascii?Q?qDWbPj3k+VfQeq+mRtVuA6hZbuI4Dja3EyTEKk5b1QVJepjnCcekXuCWawoY?=
 =?us-ascii?Q?/oRHKyPlrKzDdVrz0EgpWYMvZyeyYjscAkRxjYaqK8j6qCo7IqXixIV38U7F?=
 =?us-ascii?Q?zslV5pNedUrNYXPB6XvyXUYHXEJBKhpT15q28FL9GPA0Me4Ua13O3lLWFslW?=
 =?us-ascii?Q?Jg3RqyxvQzGdMmAhjoH5bb96Rkr3RKNcp852yihmW6OWC4i783CMGU5HK0Px?=
 =?us-ascii?Q?KZK+umdRsVJl9JF/KDRMwMDiq3HkKHyhiLU8CMMDb8UQ+pgYFMyHbQlgDpRZ?=
 =?us-ascii?Q?udzj09BaruchtxVb6Hmo81eYXIF88neopm98oPqUlVh4xlbUIXM8nMP8iUGd?=
 =?us-ascii?Q?TqHIQAU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13570910-4a0a-4570-16ad-08d945dfff95
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:24:22.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/SM9UMdUPYK+ROBFthqZi5OZpyyP8yNFIrdjsNhFNpKB/cM3dfj+vfqzV0kuod+xUGwdy7KC5dKZLqj2Oy1tnfx4tqYdzc8XRCSccXazmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2159
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107130058
X-Proofpoint-GUID: 79YkD6Rc0_MYJBcWtfG0UeIBRmDHBRd5
X-Proofpoint-ORIG-GUID: 79YkD6Rc0_MYJBcWtfG0UeIBRmDHBRd5
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a few bugs in this code.  1)  No checks for whether
dma_alloc_attrs() or __get_free_pages() failed.  2)  If
video_register_device() fails it doesn't clean up the dma attrs or the
free pages.  3)  The video_device_release() function frees "vfd" which
leads to a use after free on the next line.  The call to
video_unregister_device() is not required so I have just removed that.

Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  The v1 patch only fixed the use after free and not the other bugs

 drivers/media/platform/rockchip/rga/rga.c | 27 ++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index bf3fd71ec3af..6759091b15e0 100644
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
@@ -882,11 +882,23 @@ static int rga_probe(struct platform_device *pdev)
 	rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
 					   &rga->cmdbuf_phy, GFP_KERNEL,
 					   DMA_ATTR_WRITE_COMBINE);
+	if (!rga->cmdbuf_virt) {
+		ret = -ENOMEM;
+		goto rel_vdev;
+	}
 
 	rga->src_mmu_pages =
 		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
+	if (!rga->src_mmu_pages) {
+		ret = -ENOMEM;
+		goto free_dma;
+	}
 	rga->dst_mmu_pages =
 		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
+	if (rga->dst_mmu_pages) {
+		ret = -ENOMEM;
+		goto free_src_pages;
+	}
 
 	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
 	def_frame.size = def_frame.stride * def_frame.height;
@@ -894,7 +906,7 @@ static int rga_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
-		goto rel_vdev;
+		goto free_dst_pages;
 	}
 
 	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
@@ -902,10 +914,15 @@ static int rga_probe(struct platform_device *pdev)
 
 	return 0;
 
+free_dst_pages:
+	free_pages((unsigned long)rga->dst_mmu_pages, 3);
+free_src_pages:
+	free_pages((unsigned long)rga->src_mmu_pages, 3);
+free_dma:
+	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
+		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
 rel_vdev:
 	video_device_release(vfd);
-unreg_video_dev:
-	video_unregister_device(rga->vfd);
 unreg_v4l2_dev:
 	v4l2_device_unregister(&rga->v4l2_dev);
 err_put_clk:
-- 
2.30.2

