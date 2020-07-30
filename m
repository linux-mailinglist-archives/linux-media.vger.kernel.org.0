Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A83233BAA
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730695AbgG3XBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:01:47 -0400
Received: from mail-dm6nam11olkn2063.outbound.protection.outlook.com ([40.92.19.63]:31832
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730610AbgG3XBq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:01:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFE4JwmXrKpqZlEjAgtb2Ma7cqazdSlzvje0jPzjnwN+FbmpFtf6ZB7JpsHScxe3twUx13+E/2w39sKmJrMuHhY4Kdy7HuwJrzcDQPZFxDuFSaee51XidEk8+egNrNipRWhpQ4u0QpcViGo46npM5uq6h1PsBJqAOG+ZFli3EQimqnVndfUCC9vh5SrCusSrkGrXdnZuyuQcF7Qvk5uTsZ9TrKVlg9b1Y4EhpHTD34P3q7jB1QaqaRsxwBTM3crx0GHWwCMC+k7ZFxed+Qxym6LMCRc23Yy54WhG3nd1YMxcGvQE3SMUSpleJZqDstNAFk6qP/uNNA8xDInVLC/WUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQOKs4z3oyCqFH1/N6DNbATpf65afldethlybdfmeCI=;
 b=PY2IRARRNwenlnIRefPUmV7gKwD8gsE4MOAOcKQBAdsaU44RvDS1998udGy3+Hm+Gnc3AR7XNLGHA0hxRcEvq+5dzSMYgoOJenIMmbBNOle6py3werkKNv2d09OmXtT0X+UaWO1hJEZmwlDRIPj/xrtkdbveTnxiXY9e7ryt6cCKYAiPXXDBSXKCTYdtyNIFAbTuMeNncAOrLbuXILw3gyqJoSUDwXiU1s3vIx61UD8w/uuJN9KxMuxh9pLYhb+3n98JbJXUV+1MmTG0iL2BPakuC8R1IrC/nUlnILH4bVQ4d7JG3nror+vq4ZmNNsc0nveygqnxoK7/t6KNSOxYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::44) by
 CO1NAM11HT129.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::341)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:01:42 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:01:42 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:3538F3A21A8EC971FD774DB37A6B524600BE435616978A34993947AB90E2A987;UpperCasedChecksum:1540BB733E1A7B0CF19245EB20CF9206838AAF2F39ADD65EFCCEA00AE2272D7D;SizeAsReceived:7948;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:01:42 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 01/11] media: exynos4-is: Remove static driver data for S5PV210 FIMC variants
Date:   Thu, 30 Jul 2020 16:01:04 -0700
Message-ID: <BN6PR04MB0660CB5DB6A7AFC610C6B185A3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-2-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:01:40 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-2-xc-racer2@live.ca>
X-TMN:  [xdlFrvN1cYpSRSw+BcwBYjrEe7q0kaD1TG4nQMfqTFz2K62bmR8bfVKVc3qTVvvu]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ba3cca91-8404-4a19-faa8-08d834dc862d
X-MS-TrafficTypeDiagnostic: CO1NAM11HT129:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcXyHSoQr4sRVRPflvQudeLmz5m7ans69h9rAbqRGjceJ9aY7c32mT6f2xhhKjYVkXrV2sHMSwW+aNR/jpF9nJh4Jcs/HjSYR4D/NmkH5e9BRWfnbp4Hb6Sn6ord8MUhnCKS5kORAGJptCu7UM3dQFSxOECSKeePEAgLT/aP4lU1HrDjvscUgFTS0e1L41sHJokqJZG5f5+GFjjQo0Pf5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: OLAtvydECkalkU8kDyWvussQnLybahOhZHBaMA+3rXmGZwytP94FCOFoqBawqrNBHcmTn/nnUNVxALvoN+IB6+AnYuVFDTDVZ5jze597tqWGkg3mi14TWGtsZJQ2hvkh1dAr+hIbnLSbwGXqE2cpOD5YMbvSlbGnekqjzlzrhK2XpZfCS4Pr3OsriMR37dO57D78v/n0kJDz5U98p2lCCA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3cca91-8404-4a19-faa8-08d834dc862d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:01:42.6182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT129
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The S5PV210 platform only supports device tree based booting
where the FIMC variant data is parsed directly from
the device tree, hence the now unused static data can be removed.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes from v1:
- Added R-b tags
---
 drivers/media/platform/exynos4-is/fimc-core.c | 59 -------------------
 1 file changed, 59 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-core.c b/drivers/media/platform/exynos4-is/fimc-core.c
index cde60fbb23a8..2258f3bfc929 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/exynos4-is/fimc-core.c
@@ -1110,67 +1110,8 @@ static int fimc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-/* Image pixel limits, similar across several FIMC HW revisions. */
-static const struct fimc_pix_limit s5p_pix_limit[4] = {
-	[0] = {
-		.scaler_en_w	= 3264,
-		.scaler_dis_w	= 8192,
-		.out_rot_en_w	= 1920,
-		.out_rot_dis_w	= 4224,
-	},
-	[1] = {
-		.scaler_en_w	= 4224,
-		.scaler_dis_w	= 8192,
-		.out_rot_en_w	= 1920,
-		.out_rot_dis_w	= 4224,
-	},
-	[2] = {
-		.scaler_en_w	= 1920,
-		.scaler_dis_w	= 8192,
-		.out_rot_en_w	= 1280,
-		.out_rot_dis_w	= 1920,
-	},
-};
-
-static const struct fimc_variant fimc0_variant_s5pv210 = {
-	.has_inp_rot	 = 1,
-	.has_out_rot	 = 1,
-	.has_cam_if	 = 1,
-	.min_inp_pixsize = 16,
-	.min_out_pixsize = 16,
-	.hor_offs_align	 = 8,
-	.min_vsize_align = 16,
-	.pix_limit	 = &s5p_pix_limit[1],
-};
-
-static const struct fimc_variant fimc1_variant_s5pv210 = {
-	.has_inp_rot	 = 1,
-	.has_out_rot	 = 1,
-	.has_cam_if	 = 1,
-	.has_mainscaler_ext = 1,
-	.min_inp_pixsize = 16,
-	.min_out_pixsize = 16,
-	.hor_offs_align	 = 1,
-	.min_vsize_align = 1,
-	.pix_limit	 = &s5p_pix_limit[2],
-};
-
-static const struct fimc_variant fimc2_variant_s5pv210 = {
-	.has_cam_if	 = 1,
-	.min_inp_pixsize = 16,
-	.min_out_pixsize = 16,
-	.hor_offs_align	 = 8,
-	.min_vsize_align = 16,
-	.pix_limit	 = &s5p_pix_limit[2],
-};
-
 /* S5PV210, S5PC110 */
 static const struct fimc_drvdata fimc_drvdata_s5pv210 = {
-	.variant = {
-		[0] = &fimc0_variant_s5pv210,
-		[1] = &fimc1_variant_s5pv210,
-		[2] = &fimc2_variant_s5pv210,
-	},
 	.num_entities	= 3,
 	.lclk_frequency	= 166000000UL,
 	.out_buf_count	= 4,
-- 
2.20.1

