Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED9B233BD1
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730776AbgG3XCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:02:03 -0400
Received: from mail-bn8nam11olkn2038.outbound.protection.outlook.com ([40.92.20.38]:30688
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730730AbgG3XB4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:01:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SowYpgBUnOP3L4PIpIW+QttKzdmDgVZF/U+5ulDJOjpjTKEqQ9i0X5x8kt59HpSK19Z0MAP1Hgji40xfS/UvVo+EVXy0x4J7DCy+FretDk1dND2y+CjbRbrHhucrbEjJoe31gCnxxGVYalLjuC1GJBHRWqUFW3l7G7c/pWeC3e2HJkfp5/S99kGbClxvhvtfdq4L9OnSWYtofXA5EqtWqCPbW41GWRj63WLKChXkq0SrhOMJpEmS9pCJcsTdBVgHfzAptSduocoY8eUyHmFGnr38rVKd08X0TbGhfdqP5y0+7YKf5593W61euVJmnQdZQ4AJXXRgycacMoEHG5/eAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPOU3Pqy+7AMsEp+2f1FLlsm3Y/VJ9J0mITZ3S4WYqk=;
 b=A3/E0uwU6CYNR1CGm7Idh118u/Mwg9rCO5X6D685guuaRw7NAID5ZgE/9Wqgir2vITB1xbD0Rj7ldzypEesE4VoBpJPnKFHnhWBPOZ8VfsP+/Y11qMR6BRjtQSQzehGnBKHkMFUv4pyELb9aaHCRlhqAmr+2BKnktON3V5YfY7k1zpO1PmFnZI5a7JumH4PyPCkkuNj7XIdP3M2Kww6mg3M52U6AslAgqGyrH2WLRNaOtaSVhfl01dvXmTo9eDadaqfzk38MAgPl4Sm9sb007iGE1D+Fh+PQa/R00o7LtDq8DFRiFXgcHz5oeLV/aLoWy4qEy79roQH0OzClc77PlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::49) by
 CO1NAM11HT024.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::90)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.34; Thu, 30 Jul
 2020 23:01:53 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:01:53 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:34E6A582C7CEEB1B120FF0426C8CBF7DEF9FC53914CDE0FA451380ACF3445E0E;UpperCasedChecksum:C3D149B0385F3212795C78D4112D990E1EEFF348F159996243496527CF57A9FA;SizeAsReceived:7897;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:01:53 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH v2 05/11] media: exynos4-is: Properly set JPEG options for parallel ports
Date:   Thu, 30 Jul 2020 16:01:08 -0700
Message-ID: <BN6PR04MB06606078C5234BE00FDDA682A3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-6-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:01:50 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-6-xc-racer2@live.ca>
X-TMN:  [XUMFdNQ3ktpLQlcl5YT/V9IQPutN4lV7yIQkFVF3IaPuV09RcCDOFjpFqnWZoTKn]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: adab711a-4a43-4b02-6848-08d834dc8c89
X-MS-TrafficTypeDiagnostic: CO1NAM11HT024:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gdx0wHdFujlRIr6s0+ggopvAInFF9UjuCMXE5tBhRU+3Ijz1iFvkA6JCHXDAkTa+vHNu812XUNLGClueEZ4wrpbycuTM4om/WEzuLd096Th6CxLdeYm4VfwL5Hb/WJ1hLlDcpqEXgv2AhF+eNCO9JD419g4XmDtXNZA4KbyfEZalDDSgd+holGN6BeFDx6sy8kuJCepPBpV5VjvrU3Cytg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 37GHycH95X64Zwn0w26gyL48Z2Vj++IPng6Wa6sKLg6wI0bEQPSyGyQYw1qDksLi9lulBdzKzWCfGbTcfH/w49Z8AM+6ti5B/TpSDEIZJevLCPV5S24TToKhRvjjCR2zqsQAnljOwHikyC7EWYxYv7rG0y1RtvtYgaKPomvJeyVuRlbiAQVTIXUmPbnxHJ6O8ubYeEuInJYH5iYzSbwcAQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adab711a-4a43-4b02-6848-08d834dc8c89
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:01:53.2248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT024
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit ee7160e57c98 ("[media] s5p-fimc: Add support for JPEG capture")
added support for JPEG capture, but missed setting a register when the
parallel port was used rather than the CSIS device.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes from v1:
- Re-wording commit message
- Add R-b tag
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

