Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDDD1B8B20
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgDZC1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:27:15 -0400
Received: from mail-dm6nam11olkn2096.outbound.protection.outlook.com ([40.92.19.96]:5696
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726087AbgDZC1P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:27:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVWczFcwgVsbygDxIzPfJGyLvJp6mf/cyxpsOKA1T8Dk1RtIDCWogHvaCYmBSoUt+tOinO17Uwy+Lv5vF1GcmWE+jvLXBBNZlw5zxHBonjNHm7zKotinMDq/CIWXEbMnp0Iyd1H5mxjJ7NppaxWwAku7vi3JGqg/Y4lew7Qk7IXQnm6o7VExDyyVpNlQjiDpeZ8zgsV49Gxv4FOS6pcOkJNrVa/cqV83nk65slwNah43m3fkPIJ7JhjEfAwBzAFipRq20CDIApAQrVRnv/dRJi2bMaDXMp3v+IbCE+5+r1ewuCDHsIChKqQaLKBKXYaWU7c1ddWejFAYqf2O8qHHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIai2UCie5uAdRZypBYolyyz1q9wd+OOct+1I+f5Gow=;
 b=QWae5/77RItvlqIqU9Kgn1yIOIQi4OAJqLMXPCU58FAleD5chsqu+7yaeVl3r9M+bsXnR+xVz+ffDvX7fxeyMIIQeFGoAc4oXsd3jZeW3sOO+0KP3AZGPwHYylczdylf5MO5vlk/MwSGLfjvuPfHDgPvHaiKchdFr13P0A+GYGfAkvngteEMUnoKrdlyC59HdJQNUiPqxP0MXDc0BSYDuS9qPBiLeFLCyojZ2Qf5k1Qu31V+oP/txgvQ0IrdbHWvjWbeh5eXsxNYRnayyiuPFCojsVmuivwsdParhN9Gg43sufdUwwfkj7byI5BK1MH/5PS1lUXKySAOHMGmm7CB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::4f) by
 DM6NAM11HT010.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::169)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Sun, 26 Apr
 2020 02:27:13 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc4d::4a) by DM6NAM11FT041.mail.protection.outlook.com
 (2a01:111:e400:fc4d::98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Sun, 26 Apr 2020 02:27:13 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:6C3C4D775E340410A25E041F9860D233A9430FD71AB0B6C65217D9B2BB811079;UpperCasedChecksum:FFCFA57C55479EF904CAAAC48016629450CD64C999D9A17CA2EC27511A171EC9;SizeAsReceived:7772;Count:48
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 02:27:13 +0000
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH 00/11] media: exynos4-is: Improve support for s5pv210 and parallel ports
Date:   Sat, 25 Apr 2020 19:26:39 -0700
Message-ID: <BN6PR04MB06602E7221CC7455F3142540A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MWHPR17CA0086.namprd17.prod.outlook.com
 (2603:10b6:300:c2::24) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <20200426022650.10355-1-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jon-hp-6570b.telus (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by MWHPR17CA0086.namprd17.prod.outlook.com (2603:10b6:300:c2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sun, 26 Apr 2020 02:27:11 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200426022650.10355-1-xc-racer2@live.ca>
X-TMN:  [Ir4pf3fCPfIZp8hSif/KV7bN2M9wUsbTSjsvWkRqHJKxyj04210y2rxIq3JfF8Wz]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 7c52f882-2a33-4e07-6414-08d7e9895433
X-MS-TrafficTypeDiagnostic: DM6NAM11HT010:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NqCIYIiw4DxMxZ14MuE4EsKLh4N0ziK5vHFy3Fz47C+2vzue9LCEjNJuYQtJuEFtKz+Mi/yBDKGBQPtMRSHlvGmX03RwMhNFugv/cDfDsRuWJ7G4xD23+zv1ERaJvdlUQt2DRGq4bsgaoIc1SOQfscLAK0V831Ix3Bgkj1obTxJYa8Mq3ubSrltzfeTGUR+zzJfsJYduKIx96MtY+DRIwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: oniZQFVDVYiluJ8VIae0XN0hwSqrV1g0sNABB7eDrauLO5QqfMDguDosZSrUaSaWB4NHuqLlcja8rf8KIitP5sNCjILs1Myw0iLJ40hqBbIAy8teoOPlDKf7K1Lm3jjCf8ytT0k4tyq7Bg363Xt5GtFQjcjR0qdbHj4JCHuvy/Lh2sGnjzsjVUKJEcGgwDG0dw7teXJ3/tdaDQc52pDYZw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c52f882-2a33-4e07-6414-08d7e9895433
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2020 02:27:13.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT010
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset improves support in the exynos4-is driver for s5pv210
platforms as well as for sensors connected to the parallel ports
and not using the CSIS device.

Fixes range from nullptr exceptions to probe fixes to JPEG fixes.

Notably, it also changes the fwnode probing of parallel port sensors
to match the binding doc.  The binding doc said port A = reg 0 and
port B = reg 1 but the driver implemented A=1 and B=2.  The only in-tree
user of parallel ports is currently Goni, which notes that it uses port
A but has reg = 1.  Also note that the sensor driver is not mainlined
despite being present.  I have left the DTS as-is.

Some patches cleaning up non-DT support are also included.

The patches have been tested on a first-gen Galaxy S GT-i900M device based
on S5PV210.  Two sensors (CE147 and S5KA3DFX, both with non-mainline
drivers), both attached to port A, were succesfully used.

Jonathan Bakker (10):
  media: exynos4-is: Remove static driver data for S5PV210 FIMC variants
  media: exynos4-is: Fix nullptr when no CSIS device present
  media: exynos4-is: Correct missing entity function initialization
  media: exynos4-is: Improve support for sensors with multiple pads
  media: exynos4-is: Properly set JPEG options when not using CSIS
  media: exynos4-is: Add support for multiple sensors on one port
  media: exynos4-is: Remove inh_sensor_ctrls
  media: exynos4-is: Remove unused struct member input_index
  media: exynos4-is: Prevent duplicate call to media_pipeline_stop
  media: exynos4-is: Correct parallel port probing

Tomasz Figa (1):
  media: exynos4-is: Request syscon only if ISP writeback is present

 .../media/platform/exynos4-is/fimc-capture.c  | 22 ++----
 drivers/media/platform/exynos4-is/fimc-core.c | 67 ++----------------
 drivers/media/platform/exynos4-is/fimc-core.h |  5 --
 drivers/media/platform/exynos4-is/fimc-reg.c  |  7 ++
 drivers/media/platform/exynos4-is/media-dev.c | 68 ++++++++++++++-----
 drivers/media/platform/exynos4-is/media-dev.h |  1 +
 include/media/drv-intf/exynos-fimc.h          |  2 +-
 7 files changed, 72 insertions(+), 100 deletions(-)

-- 
2.20.1

