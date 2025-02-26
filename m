Return-Path: <linux-media+bounces-27080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC1A4654E
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AD0517CB8C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BDD21CA1E;
	Wed, 26 Feb 2025 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="oFRAoHBG"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9923221DB5;
	Wed, 26 Feb 2025 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584407; cv=fail; b=uW2UB0lOtrwNkSsO5WWGok5x+RwsLGcTeHnxDDb4Ct91AkbbaUdAfBE7bO3zWGh8hKbJ78D9nC5/CAQwyHWnrN1iMTGnXdz/jLKeQmLfZdDYvLxN8tHjVWNFHjRIRfN6XLOranVHqo5CGRP1TJ5Z+PH5Nw/ILfd8qFc97QXAPo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584407; c=relaxed/simple;
	bh=JDyjTuUtmBrknHl67BapgfVeza/o7HEhSsMyml9s780=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FlCmbTLd3s6wNVqSNgTcgsyAw5sfhadY6+xnj+UZXxVKHGe/2rj0wbXsQhK9O/R/iqAUC48sSNbj/QGNBW9G5T/xDUikqFsZSVVYDBhBjoVkmytCUb2MEGc6A9pETUDLzBDWaX9GoNuI8CTHe5cTmUGXhqDnNtjW/SwsE+6xNug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=oFRAoHBG; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqsW03DHtfxY8Ficj81SMrwIYyO0VH1RvZj4aERDKMKzTZItTSrKe7INjtlO3SJFh3b70GBMLLhOuddWjQ9F18Z3HACDyL/lRSUkxi7j6QAOkIGSz19l6d/bnOIFcbAYettPf42fEXA4wmx7drcx3Q3Rn+StjC79HPlXUzw6+UUVjr0VMoXmXOrhfk0QtIkCzbfgerNO+KddEwHv5Z1SkTBB4eoC8u71kgi6Pg2hkJnedDprM1YgOnsct4JP9TgXTY4hU6K77sQbOFEhgzVeDoBzYGaRQzTUWxgqv3ZA7B8mQaKAo+Ek/MZJu6+P2adYDjBm1IweVlG9Z6GoikYAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1IXGsz+W3YQlgdefjKpJElb9gHzoOTFEwPIJflJ51Y=;
 b=T91nslIOhs0HZcXFnqfayu5TpkKogFnZN63qS3BBsXOL8TQHAJoKmDwq3V8twl0RzM3iEfXp29ajBawp3vLKc8HMBmfS2W2hMl9DKyBzQNC6AXc6pY2Lw1/mGZBLFbbaxZ05bSje2Ujzx6XrW+CpVkilrWH3y4ilqzFHfuyZaAxB60/KHL6qfsdo5Qs6HadwraPvtj8vNoHBtq5jHTeP9HthHspegvtkxYUR9rxyqvXbyxp69jHncnBMXq9fH7rne/YBajAGxOx1eEiIgqXE7dJRuIRQHUEBbmzmuwx6EdWnCAW5gammlDFZcDEYjM8kEbqiR7I6rfc3zhllVVe23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1IXGsz+W3YQlgdefjKpJElb9gHzoOTFEwPIJflJ51Y=;
 b=oFRAoHBGcj/2Vp2l3DoK6MDGuXhtjq7a7e/bJXAErK2+2rUR8K1m0RFzs7shmoXP+8fao7fcTKaF4BYBN+ohObngurrioeOZN7+OE0J9AIRv5EnRdA9la4NsY7+RFcZoSyCvsov1UCgzavZ/SsU28zVa/IVQ8jxFhoOC6KP96tPA2T9TtK5MV2hWXn7Ko8vRoyrgtgku4LvUsPb8KEr0HnKXLbDwjqq65YnN0WZkMtT6+OzcaCMuyu8PHd/eLue8ifVXaOStkPt1jmck776s1ZffqRcohes3BgvMZ3S+x+1v1dWhz5dcf6orsHHubOkwZo+/TEAuFGh/ng3MszSMKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GV2PR03MB8559.eurprd03.prod.outlook.com (2603:10a6:150:af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:39:59 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:39:59 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com
Subject: [PATCH v1 3/8] MT9M114: Add get_mbus_config
Date: Wed, 26 Feb 2025 16:39:24 +0100
Message-Id: <20250226153929.274562-4-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226153929.274562-1-mathis.foerst@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0132.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::11) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GV2PR03MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5d04e9-fcd3-4990-bb32-08dd567bd422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KcIxXU+LRaKjx9vKt5tr3Z1XNHMw7yW10fKQd+UpkB4cmHcg3ZECuNQFfMM8?=
 =?us-ascii?Q?lfiCjNHexrd/64soBoJUdsd1z/hLv2JlbRwURtuFtWXDCDwM7Hik+DWajrIK?=
 =?us-ascii?Q?MBZUuCEFpeISpQIFfCw+gqFTdyrAtRLfECQzj/dTGnjBShKoVxkUh0AD1e4E?=
 =?us-ascii?Q?/JoDgS7X1bMFr4LO4paN2FR6/gdO/YryJGrMnRaT0TEDcV9s4f5wMWWwDkzD?=
 =?us-ascii?Q?g1L0q78VgTldaqbuURJubXNA5dBjf1ivT4hq4Eoh5SR4mg/xpIKAJh6CKWSY?=
 =?us-ascii?Q?S63aXc6YjCD/7w7ZWKVPgmS4vMIGNiw+Ge+tGqtTA4lKUbfsD0YrLRprxpoP?=
 =?us-ascii?Q?af7NXaiioCzU1qDM2+mLDHZM40hMvqjNg6UwqCPvv6MBwu97u0mnQYqb721c?=
 =?us-ascii?Q?1IAmG224u2LC4XpaqVbQ2Pz+H75OZiYYOaF/Pletcpt1AcSU++djVFWvpnZt?=
 =?us-ascii?Q?wMjEyZ0+Zgh7zSrlb33QPTJnb5MljtGcTK8vWpg1icDrIt7MQF6hJ1d5TZYR?=
 =?us-ascii?Q?kpF25jUgJL/8SVgpViUhrHI2kIcF2F5VGw8pRkba3KgUq4qtr5awxLejnttO?=
 =?us-ascii?Q?2LMwdQe4xO1qPivQ4fhUBsQDUW0oR9kkWk96EfhXZs6cCTEsCh3KC3R+eu55?=
 =?us-ascii?Q?8JTd4oO8xKkCKWwnbcpZmDnti+xQaWyWaJ/36o9/J2/tJyFCX8ATIPdjH1uJ?=
 =?us-ascii?Q?nVHqI5WAJF6ckHqYW0aSOYV1ekbSwR92jlNPK27Nq4SeF44okMCaqtqn9rap?=
 =?us-ascii?Q?//AkC1K/eIIdhS4vkbd1ptZfeU5J6gWkpuojcnnbd3h9PwwF+8ytJIsqXY2q?=
 =?us-ascii?Q?HHAWTOSKbRJqWFcPcDLTF01ScC0cJrM5EcQ5NvdM1OZpbgc6rI8uyj0Gg/BW?=
 =?us-ascii?Q?o9vbgl1ngwcjz6cpinj7JtkgXbGcK5B/HDmN6SBf6VExONS7n1WsdEgrS9Xz?=
 =?us-ascii?Q?V/R0xGnNmbGWjXz5Wox56soeJfSKZsZFD/YpCqfrF/u0rpRyUdxNqR1YJ36P?=
 =?us-ascii?Q?1pRwMl8JLieWmGCMXH3yBuYvIi5o89oADxLLKS20mTvx7oCkuPVLFTQhTLKR?=
 =?us-ascii?Q?JTK3LFYtMLDZT8/YkMxASmr/D3wsfAApJah+c2svViE4qAcFiUIqVPTciBrz?=
 =?us-ascii?Q?t9qTBPiEvWrU8v/6tv0vE7VrIsJONwQ9M9Tl+lcihGhyu47Vd5/99bkbWWJU?=
 =?us-ascii?Q?De/rdIJEzHi46Wpu/4CpenJzoPoksLo6Nius7hZvt0fsvY7bBk8GlJFe3Kxv?=
 =?us-ascii?Q?ykv8jrMh5MhzUronrymHZ7q/m18HWlmgrm7GW5QVKCdmlaDKluP6TSKABc1b?=
 =?us-ascii?Q?POBy3yDA6FkrNpXWbaDlGzwzUL+ZQwZUjB+CiFGYmddIK3kL4rJm267syGAk?=
 =?us-ascii?Q?ta1BxsU9s6SKY7H3zzL063EVOaQcCPiINauTY8Td8o1nvyzJfMCZ74advNVb?=
 =?us-ascii?Q?1DseL48zg2OPNWoVwqW+/fD65XsP7PeP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ePC8bCP6roW3jkgbDZ1ceQ5g7FGPYOBxj2e6IySPR120t0I1awye8gWuExV?=
 =?us-ascii?Q?gwXkuPY0CWfpY7HHyuZ1IwxQXuOX5QsL9WFrRSsAffW+Y0eC+xpdw2aegVLT?=
 =?us-ascii?Q?sabAE9wY21aN/shm02LftmvHdLXIHfNVKvF4X2wsLg+hTefB84kH/r0K9h2M?=
 =?us-ascii?Q?q10d7y7DbC5VU9+Yja0YN2dA6PMl+YWSerzl3hlwEfFEEK8Jx0mXknv7yMht?=
 =?us-ascii?Q?WMaq4+h7cudFREiIDKSPyiZw6RX5pstd1NzkBwz1xAfqv+iu+VZc2fUgcUbS?=
 =?us-ascii?Q?U2p+JLOuTcfadPmFBX0npcTmOCOedVr7rwQKBy73gNwQTqYdojzKkHHP2atM?=
 =?us-ascii?Q?0THORG5GY55+5ACMWKn52tUbnUi2REVw87aywCFzlGTg+6immf1em9tI4EDY?=
 =?us-ascii?Q?U5M48TC+bVtdS5PzE7idAtR1QgVVFsktcLs7Xp/2EJ+pR1Xj9ujQzEYNJ3pF?=
 =?us-ascii?Q?gpBjoZVgBI6KYis4t0RTuesS1GYGNrJ2dQsNSXKQO2wDsKhEZBe7hqIWelWZ?=
 =?us-ascii?Q?ynD7sETflau8yIPUK/MjfdAw73x0bAlG6C751EL40gjHB2xZcKvTZupzmAHk?=
 =?us-ascii?Q?ojE/oHq3ODrT28tq1LgTbPd/0nt/X/PXJqRQdpA9i/u5yvYcZpSLVCZh1sWX?=
 =?us-ascii?Q?38rD/OtQUexqlsyyIk+e81kVoph5rkXY1X8UJLbzaSTBhISHKpp5Z1yNp33l?=
 =?us-ascii?Q?OZvWNa+NlZ/ld3FNzXQDY0DDVAUFiknxv9fmzcF7//lv1HnYHoapNjyed4CS?=
 =?us-ascii?Q?zsMOf+9rjletMc1LAIP7Z1rZYTGzObJATemEujY0+THW4ygHpx8oHI8P4tRX?=
 =?us-ascii?Q?WYSuwYK5KlyKrHL7YgWMnOnFNg3XEjqo0zZsIEzG8SMHxy0vdOI7NrttjGBt?=
 =?us-ascii?Q?K+6RpQhzY7wsr/BbazEyYQH6RB42Yrf0vKDx5JpkOIS+VgsxNMXB/VEP1yx9?=
 =?us-ascii?Q?s2ZZXMd9e2kRKV9OYL4jh59CvdP8a8RTVitqOlIDUnwH16ribcQzbdR3ltdc?=
 =?us-ascii?Q?qkYPiuurBEmGjLvLytFn+UOw0/FIeCxBylljDD/fKmnZrJifOHJPSEA9rGHo?=
 =?us-ascii?Q?DZ7Jk8hFcai9sUaT8cYCIyet9KtpLXEE+Wib1LfB5hDFIs8XS/+i5MR7ajP0?=
 =?us-ascii?Q?B6E9S66lxl7P0lNr192cfJodvG+Yy71tFLuzpSsrZV9+lfWb7udgwy1Nv7g6?=
 =?us-ascii?Q?LxgCFTqtcs9QullsVa95wN23gv5aLjTuk8FYzzPmkui0cKfNKn4O8N1CB3/r?=
 =?us-ascii?Q?6rOqhnPCcQiBAHbiXSYbt/Tjbhktz2OLJhD+Fec7wxocM0WAb1fCCcFC/Rhj?=
 =?us-ascii?Q?3KpnJznZciPeKu05Vg0Y9t/6xKCdBr9hrCBAkzskbfQl8szVKX92TeWK0uMx?=
 =?us-ascii?Q?w8uvbTF3WORxEyo3yaGs/cnOqZ5sqEWX6l1+AcvrqmGfQkRB+2qLP2haAoZy?=
 =?us-ascii?Q?n/g2rACEnONBj7DZu5K2F9Fum/vHy/Z/OSPKQJqru+7WN1Ot9uH8Pk6+Gdms?=
 =?us-ascii?Q?CjPr5eB9sbUF/jY7v7yhNj1JYM5YWp5G7yCP41OpFWCrLuHhNMeHhm6iLDXR?=
 =?us-ascii?Q?YS/wOsdfEg6KiZpzeDi8wEHZSRahCeNYybJX+jKM?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5d04e9-fcd3-4990-bb32-08dd567bd422
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:39:59.8365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CQQi8BHfKIRxlL3SexzejSz17Yrb11rQFgKyoXHadAuoTNIoNdxy8/jFTPUO4LBhs69kjrKld91uiJKFRCvhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8559

The i.MX6 camera frameworks requires get_mbus_config to be implemented.
See [0].

[0] drivers/staging/media/imx/imx-media-csi.c - line 211..216

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5f0b0ad8f885..fa64d6d315a1 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1977,6 +1977,24 @@ static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
 		v4l2_device_unregister_subdev(&sensor->pa.sd);
 		return ret;
 	}
+	return 0;
+}
+
+static int mt9m114_ifp_get_mbus_config(struct v4l2_subdev *sd,
+				   unsigned int pad,
+				   struct v4l2_mbus_config *cfg)
+{
+	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
+
+	if (sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY) {
+		cfg->type = V4L2_MBUS_CSI2_DPHY;
+	} else {
+		cfg->type = V4L2_MBUS_PARALLEL;
+		cfg->bus.parallel.flags = V4L2_MBUS_MASTER |
+					  V4L2_MBUS_PCLK_SAMPLE_RISING |
+					  V4L2_MBUS_DATA_ACTIVE_HIGH;
+		cfg->bus.parallel.bus_width = 8;
+	}
 
 	return 0;
 }
@@ -1993,6 +2011,7 @@ static const struct v4l2_subdev_pad_ops mt9m114_ifp_pad_ops = {
 	.set_fmt = mt9m114_ifp_set_fmt,
 	.get_selection = mt9m114_ifp_get_selection,
 	.set_selection = mt9m114_ifp_set_selection,
+	.get_mbus_config = mt9m114_ifp_get_mbus_config,
 	.get_frame_interval = mt9m114_ifp_get_frame_interval,
 	.set_frame_interval = mt9m114_ifp_set_frame_interval,
 };
-- 
2.34.1


