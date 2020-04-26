Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907D91B8B3F
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgDZC10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:27:26 -0400
Received: from mail-co1nam11olkn2044.outbound.protection.outlook.com ([40.92.18.44]:27936
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726087AbgDZC1Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:27:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWnsiCdyUzytcX4GrNtUcJGoqKvBfpgtEk2pnqi7BaoNP3nmS3fkEX5MDuBIjbuaVPHMEAyvhl/Uth4a/KstFh64/rPmv15mthsieqv3B1dpuTDG4pAUiPNvNgTnYj5yvkMs9/uK2Me54jAzg9b4j9zE4+z+jYdCNagsNLjVCnigEoWQ9xp2CdiTOJoaUusZhME96onu1P9cwJNgvSltan8E61rTzbDX1NPsCbLSDYC3Oj1podH9xuCSQCQNMKrKqltRT03d2qV5Q5cNZdd2dL1WqB1Zp+AWF796Sc1E3wkksYkub1jQysT8EUblZqHRVhdBe7bdKfUk9doC0ADmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSs294RsueSv8t3XwPH3w3458B4RooPL11xssljNUYU=;
 b=n4lcOn3kuCv6iSvKC/VR9tTWBwqv7wzNb3sf8Hlb4qFyCk36RWC5zFp/LPwgE8YU7nr6/V3RA+jbSKuNREuKw0YxJe5aejOeNvpb3Co/FBq9Qbr3wGyQSvZbIDoWzV/pK3nWjfmM4hbc2ghYlF5m/hAen23U2s/l5GBiQhqFB3ZCo/jnWKHYng0Rufxl6Fd+c+DZn0f6BbuiERuNebEtj7JWSB7mFO0WDwIBH9NBky302gtOm8VG/9EwlcEXI/Et5XoXmBobQgW8kPC5V85rLeqmBOj+kxqjHRF4fuMS2zSOUgzKAceGNaqvLyK1bBDgevUEFMZVsx3NSt6xS07qPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::51) by
 DM6NAM11HT254.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Sun, 26 Apr
 2020 02:27:23 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc4d::4a) by DM6NAM11FT041.mail.protection.outlook.com
 (2a01:111:e400:fc4d::98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Sun, 26 Apr 2020 02:27:23 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:531B31765C167240FADAD33C2444280293575C44E3AA2CD8BEB47D2BFD6B721D;UpperCasedChecksum:382035105F016C51E8D78BD7EC922D9068D323520BD471630FCE1EAC17CCE74A;SizeAsReceived:7956;Count:50
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 02:27:23 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH 02/11] media: exynos4-is: Request syscon only if ISP writeback is present
Date:   Sat, 25 Apr 2020 19:26:41 -0700
Message-ID: <BN6PR04MB066006C199A43996C0502B62A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426022650.10355-1-xc-racer2@live.ca>
References: <20200426022650.10355-1-xc-racer2@live.ca>
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR17CA0086.namprd17.prod.outlook.com
 (2603:10b6:300:c2::24) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200426022650.10355-3-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by MWHPR17CA0086.namprd17.prod.outlook.com (2603:10b6:300:c2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sun, 26 Apr 2020 02:27:21 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200426022650.10355-3-xc-racer2@live.ca>
X-TMN:  [G7Cs4MM2yrwsmarBCCekGBrr73zkLHuucpIt+RpKrepKcQy9fHU6tvmtkdp/Egxy]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 420a6fac-6952-46ad-b221-08d7e9895a36
X-MS-TrafficTypeDiagnostic: DM6NAM11HT254:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62/GSOfmLqQflkz9FXkbq35CipkjOYlc3CZH+XRgYPrm6oww5IzK4mosSsg0CXttynvgXLNjU8P0z4wVXEhK8YsfSG2f9VNg/yGFQl35G4CLLIxyTi403shc8/c0YGej4BBpUGwmK/gq5XzNOdv20RJrFByllTk3xVsaY//DH0k/Rz0jV5qHY9OUQzQgSZRI9V5a9aokLNXb/t5phKv26g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: wG+zfM+P8LZZQwjk07Bk/6RaKDXdAHoL2zfQl5j13+CT1itEhCarHPg6NjoB9/7qLoIKZS0eTeEhnEr2lrSoQF1M1UMTasjHkcsBWfCMlhA0Ehpfmol4TkJYOG/RTaVNmRRZz4PpptP4WuMWiFosJZJc9quo+r3Ly/pNm3GsRuYJrmEbNAD3gOKyGl9CdCyHbNuFLziLBu1PO7DAkIUzGA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420a6fac-6952-46ad-b221-08d7e9895a36
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2020 02:27:23.3808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT254
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

