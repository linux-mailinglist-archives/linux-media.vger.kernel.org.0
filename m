Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB911B8B2C
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgDZC1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:27:38 -0400
Received: from mail-bn8nam11olkn2045.outbound.protection.outlook.com ([40.92.20.45]:43072
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726343AbgDZC1g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:27:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSHIo/jH9y2S/VxnqmJnzwPnblcK0Ub3bx37En+HHgV8dFfI4lOmM0g6pbp+Mr71xP1L0ZvAbMja5StPX33NIHvPIBUqIZYyo9k4n6uIpEq+iJlcsIz3reWHbVikULwk2wA3+ExItaBnGcHMs1NdkkRZ0UVi31NLBtgdNnKlpjcbw4tr7lkIYC/2Qsrl299/RivkEW0h6SM96pPaS+2zFWfiL77NznllDyiu4KBPvJSOF0Dz3xjnQVxMCximtF55tt3cCv1/pQodLIPeJHYa5f8zU8q9sMZFbnrbGlf1iCM8hE33PdnUEj1y8bIzHEofUcBNoHLPBein2f9+XO38NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyhMmAuLLKz3Txu/D7fRrp8L5HG/2Hcsxc3Ddx0+cyU=;
 b=HeDI9fYpz7QYITnvPzEFc7NSIaSVJ8z/vhkAM5JU16r6vmkj84aqDwEnvVoDormNfZDxBzGkbY0tHjE8gVRzou+mVNX6PzGEhBDMMUzxLbDJJ8+aSWvDJF39vsRs/Pyt3JdDOefsfQDsYgCtNqCwB0hjpHnl0dByEoXH6+dXVY/mKwbKvzjQtaYWSjnoU2Sr6ULXnST0bIvoIAucu8ZAVuBbwvQuV7nV8VW18YwLPKZbViKcuFTZ8Ti3JlNWwMoOXtSCLMwRVkBKQnin6DB+iz433BaXNYtMdeDjR62GgXKymxZZJpWOGpi9f7CSNINsCYjTBQQE1OJJ6siP/GB/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::46) by
 DM6NAM11HT124.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::163)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Sun, 26 Apr
 2020 02:27:34 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc4d::4a) by DM6NAM11FT041.mail.protection.outlook.com
 (2a01:111:e400:fc4d::98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Sun, 26 Apr 2020 02:27:34 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:05EA9E6AB9C491620B9E8440C0337F428FBBFF41D5E8FD18B75C421E32E09B6D;UpperCasedChecksum:BF3F6747AA1159EE60BBBE289AF474DCF082DB893E89179191E39FD0215DE8B5;SizeAsReceived:7885;Count:50
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 02:27:34 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH 06/11] media: exynos4-is: Properly set JPEG options when not using CSIS
Date:   Sat, 25 Apr 2020 19:26:45 -0700
Message-ID: <BN6PR04MB06606F63C7ACE765B57331A1A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426022650.10355-1-xc-racer2@live.ca>
References: <20200426022650.10355-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR17CA0086.namprd17.prod.outlook.com
 (2603:10b6:300:c2::24) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200426022650.10355-7-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by MWHPR17CA0086.namprd17.prod.outlook.com (2603:10b6:300:c2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sun, 26 Apr 2020 02:27:32 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200426022650.10355-7-xc-racer2@live.ca>
X-TMN:  [P/je1eLt+p1HKCaiMUepc/soCEinAVv6a8+4tZTQTLViEbXGVfMnPX5sd3d8/mfE]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4b54d78b-a75b-4b14-cde1-08d7e98960b2
X-MS-TrafficTypeDiagnostic: DM6NAM11HT124:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rPJyK6oYs6gdQIo5y4it0w4/+286hequcDxCOdFnFv/ccdKmDuhVwnkpTxPatWouEaMo/Orm4wzr/Y32+U4NwLQC34FEv7TEKwRszaHaZ3+mJW2OPjw23Ys3m/I+MoKWOIvK75jfSRqiUehDnHAOCHxfijC9lj8il2g+xN5ZliEx38bOqxRx7JOvi6TdSf42fOuoPItXuzVspIMO3cha2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: LVOqoE7YPwnT7loVg6+q3OeLhrSPA0dizyuDbQ9OTRNQxzTnQtVARg9curgpXdg6wXfTlc3Ols5sEuK3mqsyrifPV8wS4pHM4BdYUXTPWUSS+b92Z0nRRxrNnbKJnmHuM1FkCTMR3/eATWOQwyCL4J7lssa3FDNwa5bmegzYKPmERSz9OkR3jnyVb5qxFw3ZfoGQ2ubZ163kdSt0ErPNsA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b54d78b-a75b-4b14-cde1-08d7e98960b2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2020 02:27:34.1615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT124
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit ee7160e57c98 ("[media] s5p-fimc: Add support for JPEG capture")
added support for JPEG capture, but missed setting a register when the
CSIS device wasn't in use.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
---
 drivers/media/platform/exynos4-is/fimc-reg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/exynos4-is/fimc-reg.c b/drivers/media/platform/exynos4-is/fimc-reg.c
index 5ce2bdebd424..269a98fca1e8 100644
--- a/drivers/media/platform/exynos4-is/fimc-reg.c
+++ b/drivers/media/platform/exynos4-is/fimc-reg.c
@@ -606,6 +606,11 @@ int fimc_hw_set_camera_source(struct fimc_dev *fimc,
 	switch (source->fimc_bus_type) {
 	case FIMC_BUS_TYPE_ITU_601:
 	case FIMC_BUS_TYPE_ITU_656:
+		if (fimc_fmt_is_user_defined(f->fmt->color)) {
+			cfg |= FIMC_REG_CISRCFMT_ITU601_8BIT;
+			break;
+		}
+
 		for (i = 0; i < ARRAY_SIZE(pix_desc); i++) {
 			if (vc->ci_fmt.code == pix_desc[i].pixelcode) {
 				cfg = pix_desc[i].cisrcfmt;
@@ -707,6 +712,8 @@ int fimc_hw_set_camera_type(struct fimc_dev *fimc,
 	case FIMC_BUS_TYPE_ITU_601...FIMC_BUS_TYPE_ITU_656:
 		if (source->mux_id == 0) /* ITU-A, ITU-B: 0, 1 */
 			cfg |= FIMC_REG_CIGCTRL_SELCAM_ITU_A;
+		if (vid_cap->ci_fmt.code == MEDIA_BUS_FMT_JPEG_1X8)
+			cfg |= FIMC_REG_CIGCTRL_CAM_JPEG;
 		break;
 	case FIMC_BUS_TYPE_LCD_WRITEBACK_A:
 		cfg |= FIMC_REG_CIGCTRL_CAMIF_SELWB;
-- 
2.20.1

