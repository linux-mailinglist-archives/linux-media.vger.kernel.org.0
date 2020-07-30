Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FB4233BAC
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 01:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730714AbgG3XBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 19:01:48 -0400
Received: from mail-co1nam11olkn2101.outbound.protection.outlook.com ([40.92.18.101]:33504
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730679AbgG3XBr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 19:01:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6AVtEu9gcNNKwiijxVCjVoZlfFrWdaqLiS0MbeY1SZSqryPjACSzwybDzfdMkdg1TuF2cKUHoRIJyE4CaAxG6gZC1m0+XfK7QEjH1aJRbgJevicmHkb9csPT8YiSsMPsvaS41JVB8iVDTvuYl/7gDW2et+usxgDnWlLKe0HBK+1W8y6I0S582yDyNUXcSk3Z4/K6Z5jc4V5YiK2Pw5J2JO5sU5f2rhFuMjARvRFe3sIOcz10zMm0M5L3dcm2i5lXB6tK5UdeaQXqQ+e/usJ8Eh6baVPmQCKbOFxHDOwHSFVCRG1m2mATUrDv0n93DFyEW4AOT8nnGess1ooqDcseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrWi4i7InKArJxirSj8URElHcdG+2YoYiJ74Ri0R1b4=;
 b=IIiCUYOFcDMeN6/Osom2C/Oo3C8YG4IWXII6f2PykHkUb0GNTRLMhDzeK1Dm36ezwggzHeaPeTS5O1I3q+mtsEV0N8iLXmvvydGcnYb/MQI2dfTFwkGXfsmY/khOmFOLWD6g2cba43GauYuA2BrREQNMIGktbL4IXzafGBzecy9yHpwbwBvzBtrV1PiO9m+vRhVSxc3+ydpFTq00/kt+mxIi22FY57LKh3wn5AXDa56/44RW+qSgh62ag2lcwm/ISXzeIB1HY+PSxq439/I2pxxpzGG5LX9tUuaaPgfjPQz9Q2vcu2UiopNIEpnnV/E072QMdQ+iFZCNl7CBwtk/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::4d) by
 CO1NAM11HT244.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::213)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Thu, 30 Jul
 2020 23:01:45 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4a) by CO1NAM11FT027.mail.protection.outlook.com
 (2a01:111:e400:3861::224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend
 Transport; Thu, 30 Jul 2020 23:01:45 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:69B6BC31054B3CD364E3DC61692BC3297A1AA36D662363AC7B8E6237F428C89C;UpperCasedChecksum:E3D2D5140C2722910C698BA52F0C2D1702EE18D9F843DD650C65B5145869F4EF;SizeAsReceived:7993;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3239.020; Thu, 30 Jul 2020
 23:01:45 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 02/11] media: exynos4-is: Request syscon only if ISP writeback is present
Date:   Thu, 30 Jul 2020 16:01:05 -0700
Message-ID: <BN6PR04MB0660E8E21919AFA3D41C39CFA3710@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730230114.8572-1-xc-racer2@live.ca>
References: <20200730230114.8572-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:300:116::12) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200730230114.8572-3-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0002.namprd07.prod.outlook.com (2603:10b6:300:116::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 23:01:42 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200730230114.8572-3-xc-racer2@live.ca>
X-TMN:  [4B10MzEU3GoY2mHOist1sMIusdWFvf5V5FIZG3IrSJvcrHBuSGn7xs8x4cIYj/M1]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 03c5415f-122c-499c-59c4-08d834dc87d9
X-MS-TrafficTypeDiagnostic: CO1NAM11HT244:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QhW/jxyhrz8WYyBK8NyRiEpHt2YjCN2UxOmPXPKzsjVHOUXvSZv7OnSoatnVGmLpVAcrzIPVH+sk4mSnAaJ9IHmZcZKaNgzaCkKd1OZhZX9HE7NJiB117e2332wrlrdqXoP/ItYAlycSKCCTJhskMSWawUo49mBL2qT1kiu1N3iZDhQ8unEu6iiA+jlQRMjzU02ca72MilNL3n7DlJOqvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: Kv4z+nPUZLHtRTYb+++L4FBNiqCN19YkRItGXWp02nfN8dpWczY08ELx/TYNyHywyE2WGgAUR7iu64Jwdru4U0mqv2pMNh061U/ymsnxNZwaIQYutZARlcEX4CQ5SIfUGjksbZZyoocEcmB5Mwq4RVvA6qc1dQYWeET7+92slkC28h2FXrjBQdYtl5tF0+DqdRBw7P2Pr7afUg0tqD9j5g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c5415f-122c-499c-59c4-08d834dc87d9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 23:01:45.3531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT244
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tomasz Figa <tomasz.figa@gmail.com>

On FIMC variants which don't have writeback channel, there is no need to
access system registers. This patch makes the driver request sysreg
regmap conditionally depending on whether writeback is supported.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes from v1:
- Added R-b tags
---
 drivers/media/platform/exynos4-is/fimc-core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-core.c b/drivers/media/platform/exynos4-is/fimc-core.c
index 2258f3bfc929..08d1f39a914c 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/exynos4-is/fimc-core.c
@@ -954,9 +954,11 @@ static int fimc_probe(struct platform_device *pdev)
 	spin_lock_init(&fimc->slock);
 	mutex_init(&fimc->lock);
 
-	fimc->sysreg = fimc_get_sysreg_regmap(dev->of_node);
-	if (IS_ERR(fimc->sysreg))
-		return PTR_ERR(fimc->sysreg);
+	if (fimc->variant->has_isp_wb) {
+		fimc->sysreg = fimc_get_sysreg_regmap(dev->of_node);
+		if (IS_ERR(fimc->sysreg))
+			return PTR_ERR(fimc->sysreg);
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	fimc->regs = devm_ioremap_resource(dev, res);
-- 
2.20.1

