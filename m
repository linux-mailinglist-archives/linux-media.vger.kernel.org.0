Return-Path: <linux-media+bounces-28975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C8A75456
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D91837A72DD
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE1018A6AE;
	Sat, 29 Mar 2025 05:45:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021103.outbound.protection.outlook.com [40.107.57.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A786342;
	Sat, 29 Mar 2025 05:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227125; cv=fail; b=t9Ykla6NjCahYqLvwtnd9KmXyOXoZcTRkF7ZOggwYQYcpbZC/jW4soFj43P/JcZsA5W6Pqq+1/rdqfG/QligKgxGekw+hlUhee1TYACs0tdH/80Bx1w8IoTlJA/McEF1nG8m5njXZFg2xgmqwSacwQzqhuKOtZI0pzl0trApNn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227125; c=relaxed/simple;
	bh=+M7AMO97qL5l24ZXMXfe4A4xUt1QxOpTw8ydUJj9XXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sooMO5oJrqvEigZF5My+iHOQG6xHVyH2ETRs5jo7t3yMkOq5dqAN42TpzAn/y2hadHPkLxd49bJE8GQ4mS6VM9xqeFPAJGa8VPVhqjsLyxc0pZcUL4ng3z5iNaRHqRPFAdt3aUThn0OAf/Hq+QMZfKvZpiQifg4i1CbnmU9P1Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFCOHr4m8lDTezPIPRr89SCSzRph9cJ41UHoA4wmjUsMKp03FID5KFzgZ2A3x7yEsK2dvcyrnSvRxCYMzn4tc1cr1o0Bk3liVy4ih2/hRUtCFyFSHqw0ta6q75xUbCAxZv9zSP6M3nCG5um/SaMjUntQCj1suk79T7qTX/2xboqLALz+yQhm7RkRSI9/p6y4dWENVf/Esq/fY2I4ZxjXzjTZiaWMkapvGKEnusWj3hy9Eed2Z4tC6I43yjccdvA1+fvM+tCUpm9BQrLWV6cL3vU4TZGSUvgh/+vbH6ZQp4ISVghkxi7FFGzE4hXaezCU3Ng4BxFDM6b58DZ5WQw+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3qspVvCFUOeooSrHVY++3/kqgShCZ2N/IpfoIrpmfQ=;
 b=iEbqyXsjihsGYnKzdJlM4U+HXsbPP690qbI8wgy6jXW/hJxByrccSkFpzCJuRbUlXN7R3ylryqyO+9v8v9luFX10l1YincIMFHqMJFKYnhzeW9O7vv/KAuJeQSr/aayn53sfjuL4h3YQCAZci3lUGGwNLoq9JtBsgzDxXeFn/0+VV4SGJkn+jKDrOc1CdoOhQKf0AN4ged6Ce88jbRk7yFPeodYSaduxuDwuxs6WBrdtz96UboCknuYuWa2InqVfv32FPcjZ7aF3jtZ8azeco5uvUxbrF/X9xtnhfqLyCE0peQ08rJndVD0glyndo4bOHJctKdaHe3FanBTsmhE1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:19 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:19 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] media: i2c: imx334: Convert to CCI register access helpers
Date: Sat, 29 Mar 2025 11:13:24 +0530
Message-Id: <20250329054335.19931-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB1842:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fac682-b2cc-4acc-e2dc-08dd6e84e3aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BZCnTTMkbbeBaUw/8t1TZf6zd/2zepFmAcpbxRZutnB8sYIuld4U2QmuxgZF?=
 =?us-ascii?Q?IkNLQDRMUEPSbvMpkmcgRTywhJSkN/B4yx/svhG6TtXauLn+WvsDrX2kzJtZ?=
 =?us-ascii?Q?Lm02KNFxf4PFF1UyBBrwwjG2w8nLEklFfi5scJtJ4za/XoCknqWivTpL3gAj?=
 =?us-ascii?Q?0OjerpcwMnuDlLd0qUfkmkqxRn9XiZKVhuJ5mYi0XQDcpakbDkjTXIbwvtAt?=
 =?us-ascii?Q?VNRZ8dvpBrHIwuV0Gh47Nqwqj3vVJQKyXCgQOytXWkGh/SOLaRT6HyCLApsp?=
 =?us-ascii?Q?TiwNIUhMeZabZhMt80sRRBVzDPLSdouUc+Ie+koyzP+bTMrjmlFKAOcPjlk4?=
 =?us-ascii?Q?gsGX7j9d+jramUVIvWZywKMbRIEFeeMnF4Cx+i4BmnOK8+zhGEv2tlxSKAdc?=
 =?us-ascii?Q?fb5zhsD8cwigcCIyHixauz3bBKrfVEyhoDkS1Qb2elAFkCEE+CY+wSIU934i?=
 =?us-ascii?Q?co3EGXBokTMJGZRTaZ+wLCUiL9Bewiasmmb/TwOcBvqBUHHcVNRBMTsn4QOi?=
 =?us-ascii?Q?3pN9W7s3oRq4Yd4LhcNkb1t50pMkvKNjpMQzoeIp5MLwVkFv44JqFkDS6Jwm?=
 =?us-ascii?Q?LI25g+K2Bj+gsI9ULlRBjcAGP7lOvjOw81CKF6EQn+0RDCjdSACvf7b2mOce?=
 =?us-ascii?Q?PbWdjei9U9N7Y681oiW8CbQWBNVYDmuY2uAQYWGdhcMbZrJ9kR13qR5aVl0E?=
 =?us-ascii?Q?QVPyudXAvigbrKgaYAhNhB87Ef2ENkfRuNme5G3AKLsF7VQzWmZplhlmOBXr?=
 =?us-ascii?Q?F+o6H2XTRqjLYdRB4I0TdwUoRG8xBBwbP8RLD1x4rUD4+ZV+St49jG7XrDAL?=
 =?us-ascii?Q?rtpdNdUb9eyKRLXpgWANn5mC9SUKqalUiniq5j9RhbZkR7YypzbSDaR6hXNe?=
 =?us-ascii?Q?VVClYFcH3KR6BU2mDsFi299G4GhTSdalf0L3PN14FdLgZ077KZEARTT6preO?=
 =?us-ascii?Q?qjfIu2dMTF8S9ABiF/dELqlTP2lky0hYMuILh07gaHHqfVYxHoRHHqefYUxW?=
 =?us-ascii?Q?tfhCVjQBKNYmHRDwgyTox+7SolXbzSsvnPe+Af0YBplDz1WeaOaNP62gHB3l?=
 =?us-ascii?Q?OeATrA72HTD0ncbt+yLItvq9GlSwTGUUhoL16qFQs4arHiakMGS5x19irpby?=
 =?us-ascii?Q?a2Bsatt95Q9YCmqicZkkDxADjWmCYSAeK/FXwnodTXtMQxvNvAZg1PKeQDEv?=
 =?us-ascii?Q?DNR2PLKmogLFaGzMfrN+mQQAx/htNTGLWoFih+RtiDbAVC4jq9jBFgEn75lD?=
 =?us-ascii?Q?/bGb0kyvvJ+1/ivTC7diGkQ5G429kXMKkIeoJXx1HCRyGPzL0OFZHm0oyKWy?=
 =?us-ascii?Q?pGRtsqvdoNoX3urNDjyvGqBJqYtEPVeo25DJ/c1AkJ2bFD74fbcPUbX3MXEw?=
 =?us-ascii?Q?2U08PGYJXHgCpWvQogikP26F0bBXcQ62d3MjQCSsoAzX1kEeWh5kz7LjkrQU?=
 =?us-ascii?Q?5A/1yOTqkB0VL+IgrjYUTMvGvKAVkilcKMdqWrvM6Ocbzxz9a7plOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xN0T1df5ASB3YFOoNA+N7fJA+n5EPo2CKEwDWaqkc2wqnW5C4wFolCto4tGw?=
 =?us-ascii?Q?ZILueUzRmWET0k4j31IBQb5opuVleCPol6XGBXkJDsrGzgQJc8MO85hphkld?=
 =?us-ascii?Q?QmHOvsER0Q0IeggFH2eaLFnBbn1HIIM8aF0FD4yYEqlRvn7Ek1Xj5C9IYfi/?=
 =?us-ascii?Q?+5KYel1GAGAHBCxvkEFxMK4fWTwV/S9Apq/9qFUDRwTYltGpuANvrlFCMHea?=
 =?us-ascii?Q?PcYhxzZrnnrZEMAQi6Fpk5vnffiHCGx0t2uJ0X2IJYVNpIXoMtS6WE8mtc/x?=
 =?us-ascii?Q?P07RMLOBUFi0whfqE3z1zYdA5LOo8s8G/ISkbRRvItdPxMxi6ZgIypxbP+ue?=
 =?us-ascii?Q?8xTe5zLqWtg8q2upIEcEBrkZgZdRH/GZHjwsdRO94EbtYtsVgo+cqEjrInkD?=
 =?us-ascii?Q?OiAgZ+zk5912gj66eJJ+ZVfJksOrOe8nHLYudMa8DjIjQiQ52RJ6Lam+CXVi?=
 =?us-ascii?Q?lQlORs/oEHHhCotIS86DInJ6G2wwCsX7/Jpz5WKBSTXE+1Men/uyYdiRBCdb?=
 =?us-ascii?Q?9ZbyUqYq0/Y2HSkQVOXht7/4NlOQPJGOb4ccTHex6o/UsaJ3z5BN44DafPap?=
 =?us-ascii?Q?yFSliZD4GF+HsCHxCr+kO3XsOKzqiw1xzRJXORMXtpSx5fjAk9vW8l6d2CQA?=
 =?us-ascii?Q?rT12PSKSf9uPTkbuc26zltLggOK22oYTtK9pq4SAZjz7wuO8+gXFn7HzswZ6?=
 =?us-ascii?Q?jTHydPPupJpC+VzdvqSQFa/Vd/5cW/11eCstQnhJvqHVSnPi1KCwjzHf4uR0?=
 =?us-ascii?Q?iAMqljd9W+a827gnkBYuZ3Xau5xbEy/PDzAhKKKztoQYezsNVOxg3nnGoN8H?=
 =?us-ascii?Q?OYReN50M2EtHYMRWX8njXQ/wJiCNtEjy+ZLUZQ4v3GUw6cxQIKlLHbNWweMa?=
 =?us-ascii?Q?0dQDlZ5K5eRW5QZFz1xSfo5NXDfKR1eHpgWZKk3S1+tsuO+30YCVc3bJ9pIs?=
 =?us-ascii?Q?BgM1PTrhzZMbNV735ptw/pYCYV0pKLUJhQbbwHiQTASZUAWifwAha+lbQmjT?=
 =?us-ascii?Q?3tZdlP0E73qgnxmywBP0m2WiKYY3mYGCRzcHU62dVGC5fXC7Cn7Uhn+jgQyr?=
 =?us-ascii?Q?n3uhRaU/cLMdd66h49NDsVm2mWK206yRd59hOZ/uZDTIYRt+gdHx+lC9mZxX?=
 =?us-ascii?Q?1+D7KaHbsb1214R/Z4DLFUCtq0iL8RjWM1h8uQmEUA55odaouAWcy+kWVQ8D?=
 =?us-ascii?Q?1c/df8i98znaj2gRvGKptBm3BQ+0Cdkh1owoOqM2Api18LY3MHpmsi2q//LP?=
 =?us-ascii?Q?cSYjShnKGmC3lj/+a7xWmwPOempT+cj7UihRM+rMdRos7RrIDLIxUwpCVGww?=
 =?us-ascii?Q?/WgklBi2jGeDhnJ1ay8ngctIN32isZM8eOjDgD6ttjPf/hn85fQzO/Eea7EE?=
 =?us-ascii?Q?fD7ZF3+D5xQAb9rgTn5qmoTI/7vba4b72v+PDhAKrJf627/zB4y6yV2D30az?=
 =?us-ascii?Q?xFcLbAV0vzwog0bNj4K8X0GBnquvVF4W6cw35a5//vTarftT+5FgM5PQ4jtR?=
 =?us-ascii?Q?3Y0ZQJ4lGNC1OiO+baRCkQSziCEsj1PxwcmgnFemSPysDmBaosFeU6gTLIe1?=
 =?us-ascii?Q?7xkBvsKbxwJqVlsrPgPPXNJcTs20ecsfZGuXMldlIV5eH8IAbRLtCAog+7zp?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fac682-b2cc-4acc-e2dc-08dd6e84e3aa
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:19.2594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dz2qxKSWI5QvQ/enFz2MMcF+19LJ2FkQ4jze1HegeErBglmWGojIZAhBABjsGJVBqvxHNof4FXdiV+xzq+LMPuIZUvSB0IPnqJsgtxFuQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

Use the new common CCI register access helpers to replace the private
register access helpers in the imx334 driver. This simplifies the driver
by reducing the amount of code.

Acked-by: Shravan Chippa <Shravan.Chippa@microchip.com>
Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx334.c | 746 ++++++++++++++++---------------------
 2 files changed, 319 insertions(+), 428 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 85ecb2aeefdb..c8138c1079fd 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -217,6 +217,7 @@ config VIDEO_IMX319
 config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
 	depends on OF_GPIO
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX334 camera.
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index ad0b03a3f573..0785bf213d91 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -12,77 +12,123 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 /* Streaming Mode */
-#define IMX334_REG_MODE_SELECT	0x3000
-#define IMX334_MODE_STANDBY	0x01
-#define IMX334_MODE_STREAMING	0x00
+#define IMX334_REG_MODE_SELECT		CCI_REG8(0x3000)
+#define IMX334_MODE_STANDBY		0x01
+#define IMX334_MODE_STREAMING		0x00
 
 /* Lines per frame */
-#define IMX334_REG_LPFR		0x3030
+#define IMX334_REG_VMAX			CCI_REG24_LE(0x3030)
+
+#define IMX334_REG_HMAX			CCI_REG16_LE(0x3034)
+
+#define IMX334_REG_OPB_SIZE_V		CCI_REG8(0x304c)
+#define IMX334_REG_ADBIT		CCI_REG8(0x3050)
+#define IMX334_REG_MDBIT		CCI_REG8(0x319d)
+#define IMX334_REG_ADBIT1		CCI_REG16_LE(0x341c)
+#define IMX334_REG_Y_OUT_SIZE		CCI_REG16_LE(0x3308)
+#define IMX334_REG_XVS_XHS_OUTSEL	CCI_REG8(0x31a0)
+#define IMX334_REG_XVS_XHS_DRV		CCI_REG8(0x31a1)
 
 /* Chip ID */
-#define IMX334_REG_ID		0x3044
-#define IMX334_ID		0x1e
+#define IMX334_REG_ID			CCI_REG8(0x3044)
+#define IMX334_ID			0x1e
 
 /* Exposure control */
-#define IMX334_REG_SHUTTER	0x3058
-#define IMX334_EXPOSURE_MIN	1
-#define IMX334_EXPOSURE_OFFSET	5
-#define IMX334_EXPOSURE_STEP	1
-#define IMX334_EXPOSURE_DEFAULT	0x0648
+#define IMX334_REG_SHUTTER		CCI_REG24_LE(0x3058)
+#define IMX334_EXPOSURE_MIN		1
+#define IMX334_EXPOSURE_OFFSET		5
+#define IMX334_EXPOSURE_STEP		1
+#define IMX334_EXPOSURE_DEFAULT		0x0648
+
+#define IMX334_REG_LANEMODE		CCI_REG8(0x3a01)
+
+/* Window cropping Settings */
+#define IMX334_REG_AREA3_ST_ADR_1	CCI_REG16_LE(0x3074)
+#define IMX334_REG_AREA3_ST_ADR_2	CCI_REG16_LE(0x308e)
+#define IMX334_REG_UNREAD_PARAM5	CCI_REG16_LE(0x30b6)
+#define IMX334_REG_AREA3_WIDTH_1	CCI_REG16_LE(0x3076)
+#define IMX334_REG_AREA3_WIDTH_2	CCI_REG16_LE(0x3090)
+#define IMX334_REG_BLACK_OFSET_ADR	CCI_REG16_LE(0x30c6)
+#define IMX334_REG_UNRD_LINE_MAX	CCI_REG16_LE(0x30ce)
+#define IMX334_REG_UNREAD_ED_ADR	CCI_REG16_LE(0x30d8)
+#define IMX334_REG_UNREAD_PARAM6	CCI_REG16_LE(0x3116)
+
+#define IMX334_REG_VREVERSE		CCI_REG8(0x304f)
+#define IMX334_REG_HREVERSE		CCI_REG8(0x304e)
+
+/* Binning Settings */
+#define IMX334_REG_HADD_VADD		CCI_REG8(0x3199)
+#define IMX334_REG_VALID_EXPAND		CCI_REG8(0x31dd)
+#define IMX334_REG_TCYCLE		CCI_REG8(0x3300)
 
 /* Analog gain control */
-#define IMX334_REG_AGAIN	0x30e8
-#define IMX334_AGAIN_MIN	0
-#define IMX334_AGAIN_MAX	240
-#define IMX334_AGAIN_STEP	1
-#define IMX334_AGAIN_DEFAULT	0
+#define IMX334_REG_AGAIN		CCI_REG16_LE(0x30e8)
+#define IMX334_AGAIN_MIN		0
+#define IMX334_AGAIN_MAX		240
+#define IMX334_AGAIN_STEP		1
+#define IMX334_AGAIN_DEFAULT		0
 
 /* Group hold register */
-#define IMX334_REG_HOLD		0x3001
+#define IMX334_REG_HOLD			CCI_REG8(0x3001)
+
+#define IMX334_REG_MASTER_MODE		CCI_REG8(0x3002)
+#define IMX334_REG_WINMODE		CCI_REG8(0x3018)
+#define IMX334_REG_HTRIMMING_START	CCI_REG16_LE(0x302c)
+#define IMX334_REG_HNUM			CCI_REG16_LE(0x302e)
 
 /* Input clock rate */
-#define IMX334_INCLK_RATE	24000000
+#define IMX334_INCLK_RATE		24000000
+
+/* INCK Setting Register */
+#define IMX334_REG_BCWAIT_TIME		CCI_REG8(0x300c)
+#define IMX334_REG_CPWAIT_TIME		CCI_REG8(0x300d)
+#define IMX334_REG_INCKSEL1		CCI_REG16_LE(0x314c)
+#define IMX334_REG_INCKSEL2		CCI_REG8(0x315a)
+#define IMX334_REG_INCKSEL3		CCI_REG8(0x3168)
+#define IMX334_REG_INCKSEL4		CCI_REG8(0x316a)
+#define IMX334_REG_SYS_MODE		CCI_REG8(0x319e)
+
+#define IMX334_REG_TCLKPOST		CCI_REG16_LE(0x3a18)
+#define IMX334_REG_TCLKPREPARE		CCI_REG16_LE(0x3a1a)
+#define IMX334_REG_TCLKTRAIL		CCI_REG16_LE(0x3a1c)
+#define IMX334_REG_TCLKZERO		CCI_REG16_LE(0x3a1e)
+#define IMX334_REG_THSPREPARE		CCI_REG16_LE(0x3a20)
+#define IMX334_REG_THSZERO		CCI_REG16_LE(0x3a22)
+#define IMX334_REG_THSTRAIL		CCI_REG16_LE(0x3a24)
+#define IMX334_REG_THSEXIT		CCI_REG16_LE(0x3a26)
+#define IMX334_REG_TPLX			CCI_REG16_LE(0x3a28)
 
 /* CSI2 HW configuration */
-#define IMX334_LINK_FREQ_891M	891000000
-#define IMX334_LINK_FREQ_445M	445500000
-#define IMX334_NUM_DATA_LANES	4
+#define IMX334_LINK_FREQ_891M		891000000
+#define IMX334_LINK_FREQ_445M		445500000
+#define IMX334_NUM_DATA_LANES		4
 
-#define IMX334_REG_MIN		0x00
-#define IMX334_REG_MAX		0xfffff
+#define IMX334_REG_MIN			0x00
+#define IMX334_REG_MAX			0xfffff
 
 /* Test Pattern Control */
-#define IMX334_REG_TP		0x329e
-#define IMX334_TP_COLOR_HBARS	0xA
-#define IMX334_TP_COLOR_VBARS	0xB
+#define IMX334_REG_TP			CCI_REG8(0x329e)
+#define IMX334_TP_COLOR_HBARS		0xa
+#define IMX334_TP_COLOR_VBARS		0xb
 
-#define IMX334_TPG_EN_DOUT	0x329c
-#define IMX334_TP_ENABLE	0x1
-#define IMX334_TP_DISABLE	0x0
+#define IMX334_TPG_EN_DOUT		CCI_REG8(0x329c)
+#define IMX334_TP_ENABLE		0x1
+#define IMX334_TP_DISABLE		0x0
 
-#define IMX334_TPG_COLORW	0x32a0
-#define IMX334_TPG_COLORW_120P	0x13
+#define IMX334_TPG_COLORW		CCI_REG8(0x32a0)
+#define IMX334_TPG_COLORW_120P		0x13
 
-#define IMX334_TP_CLK_EN	0x3148
-#define IMX334_TP_CLK_EN_VAL	0x10
-#define IMX334_TP_CLK_DIS_VAL	0x0
+#define IMX334_TP_CLK_EN		CCI_REG8(0x3148)
+#define IMX334_TP_CLK_EN_VAL		0x10
+#define IMX334_TP_CLK_DIS_VAL		0x0
 
-#define IMX334_DIG_CLP_MODE	0x3280
-
-/**
- * struct imx334_reg - imx334 sensor register
- * @address: Register address
- * @val: Register value
- */
-struct imx334_reg {
-	u16 address;
-	u8 val;
-};
+#define IMX334_DIG_CLP_MODE		CCI_REG8(0x3280)
 
 /**
  * struct imx334_reg_list - imx334 sensor register list
@@ -91,7 +137,7 @@ struct imx334_reg {
  */
 struct imx334_reg_list {
 	u32 num_of_regs;
-	const struct imx334_reg *regs;
+	const struct cci_reg_sequence *regs;
 };
 
 /**
@@ -121,6 +167,7 @@ struct imx334_mode {
 /**
  * struct imx334 - imx334 sensor device structure
  * @dev: Pointer to generic device
+ * @cci: CCI register map
  * @client: Pointer to i2c client
  * @sd: V4L2 sub-device
  * @pad: Media pad. Only one pad supported
@@ -141,6 +188,7 @@ struct imx334_mode {
  */
 struct imx334 {
 	struct device *dev;
+	struct regmap *cci;
 	struct i2c_client *client;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -168,250 +216,191 @@ static const s64 link_freq[] = {
 };
 
 /* Sensor common mode registers values */
-static const struct imx334_reg common_mode_regs[] = {
-	{0x3000, 0x01},
-	{0x3018, 0x04},
-	{0x3030, 0xca},
-	{0x3031, 0x08},
-	{0x3032, 0x00},
-	{0x3034, 0x4c},
-	{0x3035, 0x04},
-	{0x30c6, 0x00},
-	{0x30c7, 0x00},
-	{0x30ce, 0x00},
-	{0x30cf, 0x00},
-	{0x304c, 0x00},
-	{0x304e, 0x00},
-	{0x304f, 0x00},
-	{0x3050, 0x00},
-	{0x30b6, 0x00},
-	{0x30b7, 0x00},
-	{0x3116, 0x08},
-	{0x3117, 0x00},
-	{0x31a0, 0x20},
-	{0x31a1, 0x0f},
-	{0x300c, 0x3b},
-	{0x300d, 0x2a},
-	{0x314c, 0x29},
-	{0x314d, 0x01},
-	{0x315a, 0x06},
-	{0x3168, 0xa0},
-	{0x316a, 0x7e},
-	{0x319e, 0x02},
-	{0x3199, 0x00},
-	{0x319d, 0x00},
-	{0x31dd, 0x03},
-	{0x3300, 0x00},
-	{0x341c, 0xff},
-	{0x341d, 0x01},
-	{0x3a01, 0x03},
-	{0x3a18, 0x7f},
-	{0x3a19, 0x00},
-	{0x3a1a, 0x37},
-	{0x3a1b, 0x00},
-	{0x3a1c, 0x37},
-	{0x3a1d, 0x00},
-	{0x3a1e, 0xf7},
-	{0x3a1f, 0x00},
-	{0x3a20, 0x3f},
-	{0x3a21, 0x00},
-	{0x3a20, 0x6f},
-	{0x3a21, 0x00},
-	{0x3a20, 0x3f},
-	{0x3a21, 0x00},
-	{0x3a20, 0x5f},
-	{0x3a21, 0x00},
-	{0x3a20, 0x2f},
-	{0x3a21, 0x00},
-	{0x3078, 0x02},
-	{0x3079, 0x00},
-	{0x307a, 0x00},
-	{0x307b, 0x00},
-	{0x3080, 0x02},
-	{0x3081, 0x00},
-	{0x3082, 0x00},
-	{0x3083, 0x00},
-	{0x3088, 0x02},
-	{0x3094, 0x00},
-	{0x3095, 0x00},
-	{0x3096, 0x00},
-	{0x309b, 0x02},
-	{0x309c, 0x00},
-	{0x309d, 0x00},
-	{0x309e, 0x00},
-	{0x30a4, 0x00},
-	{0x30a5, 0x00},
-	{0x3288, 0x21},
-	{0x328a, 0x02},
-	{0x3414, 0x05},
-	{0x3416, 0x18},
-	{0x35Ac, 0x0e},
-	{0x3648, 0x01},
-	{0x364a, 0x04},
-	{0x364c, 0x04},
-	{0x3678, 0x01},
-	{0x367c, 0x31},
-	{0x367e, 0x31},
-	{0x3708, 0x02},
-	{0x3714, 0x01},
-	{0x3715, 0x02},
-	{0x3716, 0x02},
-	{0x3717, 0x02},
-	{0x371c, 0x3d},
-	{0x371d, 0x3f},
-	{0x372c, 0x00},
-	{0x372d, 0x00},
-	{0x372e, 0x46},
-	{0x372f, 0x00},
-	{0x3730, 0x89},
-	{0x3731, 0x00},
-	{0x3732, 0x08},
-	{0x3733, 0x01},
-	{0x3734, 0xfe},
-	{0x3735, 0x05},
-	{0x375d, 0x00},
-	{0x375e, 0x00},
-	{0x375f, 0x61},
-	{0x3760, 0x06},
-	{0x3768, 0x1b},
-	{0x3769, 0x1b},
-	{0x376a, 0x1a},
-	{0x376b, 0x19},
-	{0x376c, 0x18},
-	{0x376d, 0x14},
-	{0x376e, 0x0f},
-	{0x3776, 0x00},
-	{0x3777, 0x00},
-	{0x3778, 0x46},
-	{0x3779, 0x00},
-	{0x377a, 0x08},
-	{0x377b, 0x01},
-	{0x377c, 0x45},
-	{0x377d, 0x01},
-	{0x377e, 0x23},
-	{0x377f, 0x02},
-	{0x3780, 0xd9},
-	{0x3781, 0x03},
-	{0x3782, 0xf5},
-	{0x3783, 0x06},
-	{0x3784, 0xa5},
-	{0x3788, 0x0f},
-	{0x378a, 0xd9},
-	{0x378b, 0x03},
-	{0x378c, 0xeb},
-	{0x378d, 0x05},
-	{0x378e, 0x87},
-	{0x378f, 0x06},
-	{0x3790, 0xf5},
-	{0x3792, 0x43},
-	{0x3794, 0x7a},
-	{0x3796, 0xa1},
-	{0x37b0, 0x37},
-	{0x3e04, 0x0e},
-	{0x30e8, 0x50},
-	{0x30e9, 0x00},
-	{0x3e04, 0x0e},
-	{0x3002, 0x00},
+static const struct cci_reg_sequence common_mode_regs[] = {
+	{ IMX334_REG_MODE_SELECT, IMX334_MODE_STANDBY },
+	{ IMX334_REG_WINMODE,		0x04 },
+	{ IMX334_REG_VMAX,		0x0008ca },
+	{ IMX334_REG_HMAX,		0x044c },
+	{ IMX334_REG_BLACK_OFSET_ADR,	0x0000 },
+	{ IMX334_REG_UNRD_LINE_MAX,	0x0000 },
+	{ IMX334_REG_OPB_SIZE_V,	0x00 },
+	{ IMX334_REG_HREVERSE,		0x00 },
+	{ IMX334_REG_VREVERSE,		0x00 },
+	{ IMX334_REG_ADBIT,		0x00 },
+	{ IMX334_REG_UNREAD_PARAM5,	0x0000 },
+	{ IMX334_REG_UNREAD_PARAM6,	0x0008 },
+	{ IMX334_REG_XVS_XHS_OUTSEL,	0x20 },
+	{ IMX334_REG_XVS_XHS_DRV,	0x0f },
+	{ IMX334_REG_BCWAIT_TIME,	0x3b },
+	{ IMX334_REG_CPWAIT_TIME,	0x2a },
+	{ IMX334_REG_INCKSEL1,		0x0129 },
+	{ IMX334_REG_INCKSEL2,		0x06 },
+	{ IMX334_REG_INCKSEL3,		0xa0 },
+	{ IMX334_REG_INCKSEL4,		0x7e },
+	{ IMX334_REG_SYS_MODE,		0x02 },
+	{ IMX334_REG_HADD_VADD,		0x00 },
+	{ IMX334_REG_MDBIT,		0x00 },
+	{ IMX334_REG_VALID_EXPAND,	0x03 },
+	{ IMX334_REG_TCYCLE,		0x00 },
+	{ IMX334_REG_ADBIT1,		0x01ff },
+	{ IMX334_REG_LANEMODE,		0x03 },
+	{ IMX334_REG_TCLKPOST,		0x007f },
+	{ IMX334_REG_TCLKPREPARE,	0x0037 },
+	{ IMX334_REG_TCLKTRAIL,		0x0037 },
+	{ IMX334_REG_TCLKZERO,		0xf7 },
+	{ IMX334_REG_THSPREPARE,	0x003f },
+	{ IMX334_REG_THSPREPARE,	0x006f },
+	{ IMX334_REG_THSPREPARE,	0x003f },
+	{ IMX334_REG_THSPREPARE,	0x005f },
+	{ IMX334_REG_THSPREPARE,	0x002f },
+	{ CCI_REG8(0x3078), 0x02 },
+	{ CCI_REG8(0x3079), 0x00 },
+	{ CCI_REG8(0x307a), 0x00 },
+	{ CCI_REG8(0x307b), 0x00 },
+	{ CCI_REG8(0x3080), 0x02 },
+	{ CCI_REG8(0x3081), 0x00 },
+	{ CCI_REG8(0x3082), 0x00 },
+	{ CCI_REG8(0x3083), 0x00 },
+	{ CCI_REG8(0x3088), 0x02 },
+	{ CCI_REG8(0x3094), 0x00 },
+	{ CCI_REG8(0x3095), 0x00 },
+	{ CCI_REG8(0x3096), 0x00 },
+	{ CCI_REG8(0x309b), 0x02 },
+	{ CCI_REG8(0x309c), 0x00 },
+	{ CCI_REG8(0x309d), 0x00 },
+	{ CCI_REG8(0x309e), 0x00 },
+	{ CCI_REG8(0x30a4), 0x00 },
+	{ CCI_REG8(0x30a5), 0x00 },
+	{ CCI_REG8(0x3288), 0x21 },
+	{ CCI_REG8(0x328a), 0x02 },
+	{ CCI_REG8(0x3414), 0x05 },
+	{ CCI_REG8(0x3416), 0x18 },
+	{ CCI_REG8(0x35Ac), 0x0e },
+	{ CCI_REG8(0x3648), 0x01 },
+	{ CCI_REG8(0x364a), 0x04 },
+	{ CCI_REG8(0x364c), 0x04 },
+	{ CCI_REG8(0x3678), 0x01 },
+	{ CCI_REG8(0x367c), 0x31 },
+	{ CCI_REG8(0x367e), 0x31 },
+	{ CCI_REG8(0x3708), 0x02 },
+	{ CCI_REG8(0x3714), 0x01 },
+	{ CCI_REG8(0x3715), 0x02 },
+	{ CCI_REG8(0x3716), 0x02 },
+	{ CCI_REG8(0x3717), 0x02 },
+	{ CCI_REG8(0x371c), 0x3d },
+	{ CCI_REG8(0x371d), 0x3f },
+	{ CCI_REG8(0x372c), 0x00 },
+	{ CCI_REG8(0x372d), 0x00 },
+	{ CCI_REG8(0x372e), 0x46 },
+	{ CCI_REG8(0x372f), 0x00 },
+	{ CCI_REG8(0x3730), 0x89 },
+	{ CCI_REG8(0x3731), 0x00 },
+	{ CCI_REG8(0x3732), 0x08 },
+	{ CCI_REG8(0x3733), 0x01 },
+	{ CCI_REG8(0x3734), 0xfe },
+	{ CCI_REG8(0x3735), 0x05 },
+	{ CCI_REG8(0x375d), 0x00 },
+	{ CCI_REG8(0x375e), 0x00 },
+	{ CCI_REG8(0x375f), 0x61 },
+	{ CCI_REG8(0x3760), 0x06 },
+	{ CCI_REG8(0x3768), 0x1b },
+	{ CCI_REG8(0x3769), 0x1b },
+	{ CCI_REG8(0x376a), 0x1a },
+	{ CCI_REG8(0x376b), 0x19 },
+	{ CCI_REG8(0x376c), 0x18 },
+	{ CCI_REG8(0x376d), 0x14 },
+	{ CCI_REG8(0x376e), 0x0f },
+	{ CCI_REG8(0x3776), 0x00 },
+	{ CCI_REG8(0x3777), 0x00 },
+	{ CCI_REG8(0x3778), 0x46 },
+	{ CCI_REG8(0x3779), 0x00 },
+	{ CCI_REG8(0x377a), 0x08 },
+	{ CCI_REG8(0x377b), 0x01 },
+	{ CCI_REG8(0x377c), 0x45 },
+	{ CCI_REG8(0x377d), 0x01 },
+	{ CCI_REG8(0x377e), 0x23 },
+	{ CCI_REG8(0x377f), 0x02 },
+	{ CCI_REG8(0x3780), 0xd9 },
+	{ CCI_REG8(0x3781), 0x03 },
+	{ CCI_REG8(0x3782), 0xf5 },
+	{ CCI_REG8(0x3783), 0x06 },
+	{ CCI_REG8(0x3784), 0xa5 },
+	{ CCI_REG8(0x3788), 0x0f },
+	{ CCI_REG8(0x378a), 0xd9 },
+	{ CCI_REG8(0x378b), 0x03 },
+	{ CCI_REG8(0x378c), 0xeb },
+	{ CCI_REG8(0x378d), 0x05 },
+	{ CCI_REG8(0x378e), 0x87 },
+	{ CCI_REG8(0x378f), 0x06 },
+	{ CCI_REG8(0x3790), 0xf5 },
+	{ CCI_REG8(0x3792), 0x43 },
+	{ CCI_REG8(0x3794), 0x7a },
+	{ CCI_REG8(0x3796), 0xa1 },
+	{ CCI_REG8(0x37b0), 0x37 },
+	{ CCI_REG8(0x3e04), 0x0e },
+	{ IMX334_REG_AGAIN, 0x0050 },
+	{ CCI_REG8(0x3e04), 0x0e },
+	{ IMX334_REG_MASTER_MODE, 0x00 },
 };
 
 /* Sensor mode registers for 640x480@30fps */
-static const struct imx334_reg mode_640x480_regs[] = {
-	{0x302c, 0x70},
-	{0x302d, 0x06},
-	{0x302e, 0x80},
-	{0x302f, 0x02},
-	{0x3074, 0x48},
-	{0x3075, 0x07},
-	{0x308e, 0x49},
-	{0x308f, 0x07},
-	{0x3076, 0xe0},
-	{0x3077, 0x01},
-	{0x3090, 0xe0},
-	{0x3091, 0x01},
-	{0x3308, 0xe0},
-	{0x3309, 0x01},
-	{0x30d8, 0x30},
-	{0x30d9, 0x0b},
+static const struct cci_reg_sequence mode_640x480_regs[] = {
+	{ IMX334_REG_HTRIMMING_START,	0x0670 },
+	{ IMX334_REG_HNUM,		0x0280 },
+	{ IMX334_REG_AREA3_ST_ADR_1,	0x0748 },
+	{ IMX334_REG_AREA3_ST_ADR_2,	0x0749 },
+	{ IMX334_REG_AREA3_WIDTH_1,	0x01e0 },
+	{ IMX334_REG_AREA3_WIDTH_2,	0x01e0 },
+	{ IMX334_REG_Y_OUT_SIZE,	0x01e0 },
+	{ IMX334_REG_UNREAD_ED_ADR,	0x0b30 },
 };
 
 /* Sensor mode registers for 1280x720@30fps */
-static const struct imx334_reg mode_1280x720_regs[] = {
-	{0x302c, 0x30},
-	{0x302d, 0x05},
-	{0x302e, 0x00},
-	{0x302f, 0x05},
-	{0x3074, 0x84},
-	{0x3075, 0x03},
-	{0x308e, 0x85},
-	{0x308f, 0x03},
-	{0x3076, 0xd0},
-	{0x3077, 0x02},
-	{0x3090, 0xd0},
-	{0x3091, 0x02},
-	{0x3308, 0xd0},
-	{0x3309, 0x02},
-	{0x30d8, 0x30},
-	{0x30d9, 0x0b},
+static const struct cci_reg_sequence mode_1280x720_regs[] = {
+	{ IMX334_REG_HTRIMMING_START,	0x0530 },
+	{ IMX334_REG_HNUM,		0x0500 },
+	{ IMX334_REG_AREA3_ST_ADR_1,	0x0384 },
+	{ IMX334_REG_AREA3_ST_ADR_2,	0x0385 },
+	{ IMX334_REG_AREA3_WIDTH_1,	0x02d0 },
+	{ IMX334_REG_AREA3_WIDTH_2,	0x02d0 },
+	{ IMX334_REG_Y_OUT_SIZE,	0x02d0 },
+	{ IMX334_REG_UNREAD_ED_ADR,	0x0b30 },
 };
 
 /* Sensor mode registers for 1920x1080@30fps */
-static const struct imx334_reg mode_1920x1080_regs[] = {
-	{0x302c, 0xf0},
-	{0x302d, 0x03},
-	{0x302e, 0x80},
-	{0x302f, 0x07},
-	{0x3074, 0xcc},
-	{0x3075, 0x02},
-	{0x308e, 0xcd},
-	{0x308f, 0x02},
-	{0x3076, 0x38},
-	{0x3077, 0x04},
-	{0x3090, 0x38},
-	{0x3091, 0x04},
-	{0x3308, 0x38},
-	{0x3309, 0x04},
-	{0x30d8, 0x18},
-	{0x30d9, 0x0a},
+static const struct cci_reg_sequence mode_1920x1080_regs[] = {
+	{ IMX334_REG_HTRIMMING_START,	0x03f0 },
+	{ IMX334_REG_HNUM,		0x0780 },
+	{ IMX334_REG_AREA3_ST_ADR_1,	0x02cc },
+	{ IMX334_REG_AREA3_ST_ADR_2,	0x02cd },
+	{ IMX334_REG_AREA3_WIDTH_1,	0x0438 },
+	{ IMX334_REG_AREA3_WIDTH_2,	0x0438 },
+	{ IMX334_REG_Y_OUT_SIZE,	0x0438 },
+	{ IMX334_REG_UNREAD_ED_ADR,	0x0a18 },
 };
 
 /* Sensor mode registers for 3840x2160@30fps */
-static const struct imx334_reg mode_3840x2160_regs[] = {
-	{0x3034, 0x26},
-	{0x3035, 0x02},
-	{0x315a, 0x02},
-	{0x302c, 0x3c},
-	{0x302d, 0x00},
-	{0x302e, 0x00},
-	{0x302f, 0x0f},
-	{0x3074, 0xb0},
-	{0x3075, 0x00},
-	{0x308e, 0xb1},
-	{0x308f, 0x00},
-	{0x30d8, 0x20},
-	{0x30d9, 0x12},
-	{0x3076, 0x70},
-	{0x3077, 0x08},
-	{0x3090, 0x70},
-	{0x3091, 0x08},
-	{0x3308, 0x70},
-	{0x3309, 0x08},
-	{0x319e, 0x00},
-	{0x3a00, 0x01},
-	{0x3a18, 0xbf},
-	{0x3a1a, 0x67},
-	{0x3a1c, 0x6f},
-	{0x3a1e, 0xd7},
-	{0x3a1f, 0x01},
-	{0x3a20, 0x6f},
-	{0x3a21, 0x00},
-	{0x3a22, 0xcf},
-	{0x3a23, 0x00},
-	{0x3a24, 0x6f},
-	{0x3a25, 0x00},
-	{0x3a26, 0xb7},
-	{0x3a27, 0x00},
-	{0x3a28, 0x5f},
-	{0x3a29, 0x00},
+static const struct cci_reg_sequence mode_3840x2160_regs[] = {
+	{ IMX334_REG_HMAX,		0x0226 },
+	{ IMX334_REG_INCKSEL2,		0x02 },
+	{ IMX334_REG_HTRIMMING_START,	0x003c },
+	{ IMX334_REG_HNUM,		0x0f00 },
+	{ IMX334_REG_AREA3_ST_ADR_1,	0x00b0 },
+	{ IMX334_REG_AREA3_ST_ADR_2,	0x00b1 },
+	{ IMX334_REG_UNREAD_ED_ADR,	0x1220 },
+	{ IMX334_REG_AREA3_WIDTH_1,	0x0870 },
+	{ IMX334_REG_AREA3_WIDTH_2,	0x0870 },
+	{ IMX334_REG_Y_OUT_SIZE,	0x0870 },
+	{ IMX334_REG_SYS_MODE,		0x0100 },
+	{ IMX334_REG_TCLKPOST,		0x00bf },
+	{ IMX334_REG_TCLKPREPARE,	0x0067 },
+	{ IMX334_REG_TCLKTRAIL,		0x006f },
+	{ IMX334_REG_TCLKZERO,		0x1d7 },
+	{ IMX334_REG_THSPREPARE,	0x006f },
+	{ IMX334_REG_THSZERO,		0x00cf },
+	{ IMX334_REG_THSTRAIL,		0x006f },
+	{ IMX334_REG_THSEXIT,		0x00b7 },
+	{ IMX334_REG_TPLX,		0x005f },
 };
 
 static const char * const imx334_test_pattern_menu[] = {
@@ -426,18 +415,16 @@ static const int imx334_test_pattern_val[] = {
 	IMX334_TP_COLOR_VBARS,
 };
 
-static const struct imx334_reg raw10_framefmt_regs[] = {
-	{0x3050, 0x00},
-	{0x319d, 0x00},
-	{0x341c, 0xff},
-	{0x341d, 0x01},
+static const struct cci_reg_sequence raw10_framefmt_regs[] = {
+	{ IMX334_REG_ADBIT,  0x00 },
+	{ IMX334_REG_MDBIT,  0x00 },
+	{ IMX334_REG_ADBIT1, 0x01ff },
 };
 
-static const struct imx334_reg raw12_framefmt_regs[] = {
-	{0x3050, 0x01},
-	{0x319d, 0x01},
-	{0x341c, 0x47},
-	{0x341d, 0x00},
+static const struct cci_reg_sequence raw12_framefmt_regs[] = {
+	{ IMX334_REG_ADBIT,  0x01 },
+	{ IMX334_REG_MDBIT,  0x01 },
+	{ IMX334_REG_ADBIT1, 0x0047 },
 };
 
 static const u32 imx334_mbus_codes[] = {
@@ -513,101 +500,6 @@ static inline struct imx334 *to_imx334(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct imx334, sd);
 }
 
-/**
- * imx334_read_reg() - Read registers.
- * @imx334: pointer to imx334 device
- * @reg: register address
- * @len: length of bytes to read. Max supported bytes is 4
- * @val: pointer to register value to be filled.
- *
- * Big endian register addresses with little endian values.
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx334_read_reg(struct imx334 *imx334, u16 reg, u32 len, u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx334->sd);
-	struct i2c_msg msgs[2] = {0};
-	u8 addr_buf[2] = {0};
-	u8 data_buf[4] = {0};
-	int ret;
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-
-	/* Write register address */
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	/* Read data from register */
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = data_buf;
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = get_unaligned_le32(data_buf);
-
-	return 0;
-}
-
-/**
- * imx334_write_reg() - Write register
- * @imx334: pointer to imx334 device
- * @reg: register address
- * @len: length of bytes. Max supported bytes is 4
- * @val: register value
- *
- * Big endian register addresses with little endian values.
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx334_write_reg(struct imx334 *imx334, u16 reg, u32 len, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx334->sd);
-	u8 buf[6] = {0};
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_le32(val, buf + 2);
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
-
-	return 0;
-}
-
-/**
- * imx334_write_regs() - Write a list of registers
- * @imx334: pointer to imx334 device
- * @regs: list of registers to be written
- * @len: length of registers array
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx334_write_regs(struct imx334 *imx334,
-			     const struct imx334_reg *regs, u32 len)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < len; i++) {
-		ret = imx334_write_reg(imx334, regs[i].address, 1, regs[i].val);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 /**
  * imx334_update_controls() - Update control ranges based on streaming mode
  * @imx334: pointer to imx334 device
@@ -653,7 +545,7 @@ static int imx334_update_controls(struct imx334 *imx334,
 static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
 {
 	u32 lpfr, shutter;
-	int ret;
+	int ret, ret_hold;
 
 	lpfr = imx334->vblank + imx334->cur_mode->height;
 	shutter = lpfr - exposure;
@@ -661,22 +553,14 @@ static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
 	dev_dbg(imx334->dev, "Set long exp %u analog gain %u sh0 %u lpfr %u\n",
 		exposure, gain, shutter, lpfr);
 
-	ret = imx334_write_reg(imx334, IMX334_REG_HOLD, 1, 1);
-	if (ret)
-		return ret;
-
-	ret = imx334_write_reg(imx334, IMX334_REG_LPFR, 3, lpfr);
-	if (ret)
-		goto error_release_group_hold;
-
-	ret = imx334_write_reg(imx334, IMX334_REG_SHUTTER, 3, shutter);
-	if (ret)
-		goto error_release_group_hold;
-
-	ret = imx334_write_reg(imx334, IMX334_REG_AGAIN, 1, gain);
+	cci_write(imx334->cci, IMX334_REG_HOLD, 1, &ret);
+	cci_write(imx334->cci, IMX334_REG_VMAX, lpfr, &ret);
+	cci_write(imx334->cci, IMX334_REG_SHUTTER, shutter, &ret);
+	cci_write(imx334->cci, IMX334_REG_AGAIN, gain, &ret);
 
-error_release_group_hold:
-	imx334_write_reg(imx334, IMX334_REG_HOLD, 1, 0);
+	ret_hold = cci_write(imx334->cci, IMX334_REG_HOLD, 0, NULL);
+	if (ret_hold)
+		return ret_hold;
 
 	return ret;
 }
@@ -740,21 +624,21 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		if (ctrl->val) {
-			imx334_write_reg(imx334, IMX334_TP_CLK_EN, 1,
-					 IMX334_TP_CLK_EN_VAL);
-			imx334_write_reg(imx334, IMX334_DIG_CLP_MODE, 1, 0x0);
-			imx334_write_reg(imx334, IMX334_TPG_COLORW, 1,
-					 IMX334_TPG_COLORW_120P);
-			imx334_write_reg(imx334, IMX334_REG_TP, 1,
-					 imx334_test_pattern_val[ctrl->val]);
-			imx334_write_reg(imx334, IMX334_TPG_EN_DOUT, 1,
-					 IMX334_TP_ENABLE);
+			cci_write(imx334->cci, IMX334_TP_CLK_EN,
+				  IMX334_TP_CLK_EN_VAL, NULL);
+			cci_write(imx334->cci, IMX334_DIG_CLP_MODE, 0x0, NULL);
+			cci_write(imx334->cci, IMX334_TPG_COLORW,
+				  IMX334_TPG_COLORW_120P, NULL);
+			cci_write(imx334->cci, IMX334_REG_TP,
+				  imx334_test_pattern_val[ctrl->val], NULL);
+			cci_write(imx334->cci, IMX334_TPG_EN_DOUT,
+				  IMX334_TP_ENABLE, NULL);
 		} else {
-			imx334_write_reg(imx334, IMX334_DIG_CLP_MODE, 1, 0x1);
-			imx334_write_reg(imx334, IMX334_TP_CLK_EN, 1,
-					 IMX334_TP_CLK_DIS_VAL);
-			imx334_write_reg(imx334, IMX334_TPG_EN_DOUT, 1,
-					 IMX334_TP_DISABLE);
+			cci_write(imx334->cci, IMX334_DIG_CLP_MODE, 0x1, NULL);
+			cci_write(imx334->cci, IMX334_TP_CLK_EN,
+				  IMX334_TP_CLK_DIS_VAL, NULL);
+			cci_write(imx334->cci, IMX334_TPG_EN_DOUT,
+				  IMX334_TP_DISABLE, NULL);
 		}
 		ret = 0;
 		break;
@@ -961,12 +845,13 @@ static int imx334_set_framefmt(struct imx334 *imx334)
 {
 	switch (imx334->cur_code) {
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
-		return imx334_write_regs(imx334, raw10_framefmt_regs,
-					 ARRAY_SIZE(raw10_framefmt_regs));
+		return cci_multi_reg_write(imx334->cci, raw10_framefmt_regs,
+					ARRAY_SIZE(raw10_framefmt_regs), NULL);
+
 
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
-		return imx334_write_regs(imx334, raw12_framefmt_regs,
-					 ARRAY_SIZE(raw12_framefmt_regs));
+		return cci_multi_reg_write(imx334->cci, raw12_framefmt_regs,
+					ARRAY_SIZE(raw12_framefmt_regs), NULL);
 	}
 
 	return -EINVAL;
@@ -983,8 +868,8 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	const struct imx334_reg_list *reg_list;
 	int ret;
 
-	ret = imx334_write_regs(imx334, common_mode_regs,
-				ARRAY_SIZE(common_mode_regs));
+	ret = cci_multi_reg_write(imx334->cci, common_mode_regs,
+				  ARRAY_SIZE(common_mode_regs), NULL);
 	if (ret) {
 		dev_err(imx334->dev, "fail to write common registers\n");
 		return ret;
@@ -992,8 +877,8 @@ static int imx334_start_streaming(struct imx334 *imx334)
 
 	/* Write sensor mode registers */
 	reg_list = &imx334->cur_mode->reg_list;
-	ret = imx334_write_regs(imx334, reg_list->regs,
-				reg_list->num_of_regs);
+	ret = cci_multi_reg_write(imx334->cci, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx334->dev, "fail to write initial registers\n");
 		return ret;
@@ -1014,8 +899,8 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	}
 
 	/* Start streaming */
-	ret = imx334_write_reg(imx334, IMX334_REG_MODE_SELECT,
-			       1, IMX334_MODE_STREAMING);
+	ret = cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
+			IMX334_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(imx334->dev, "fail to start streaming\n");
 		return ret;
@@ -1032,8 +917,8 @@ static int imx334_start_streaming(struct imx334 *imx334)
  */
 static int imx334_stop_streaming(struct imx334 *imx334)
 {
-	return imx334_write_reg(imx334, IMX334_REG_MODE_SELECT,
-				1, IMX334_MODE_STANDBY);
+	return cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
+			IMX334_MODE_STANDBY, NULL);
 }
 
 /**
@@ -1084,14 +969,14 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
 static int imx334_detect(struct imx334 *imx334)
 {
 	int ret;
-	u32 val;
+	u64 val;
 
-	ret = imx334_read_reg(imx334, IMX334_REG_ID, 2, &val);
+	ret = cci_read(imx334->cci, IMX334_REG_ID, &val, NULL);
 	if (ret)
 		return ret;
 
 	if (val != IMX334_ID) {
-		dev_err(imx334->dev, "chip id mismatch: %x!=%x\n",
+		dev_err(imx334->dev, "chip id mismatch: %x!=%llx\n",
 			IMX334_ID, val);
 		return -ENXIO;
 	}
@@ -1339,6 +1224,11 @@ static int imx334_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	imx334->dev = &client->dev;
+	imx334->cci = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(imx334->cci)) {
+		dev_err(imx334->dev, "Unable to initialize I2C\n");
+		return -ENODEV;
+	}
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx334->sd, client, &imx334_subdev_ops);
-- 
2.34.1


