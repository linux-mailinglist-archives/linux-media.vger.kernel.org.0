Return-Path: <linux-media+bounces-15108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A29346BA
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 05:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AEDF283ECE
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 03:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8134084C;
	Thu, 18 Jul 2024 03:29:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4663376EC;
	Thu, 18 Jul 2024 03:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273341; cv=fail; b=V3+JM9x5Dr5zDweLcZgnSCDGDjeUUeqg6wAnj54HGjbuLICqdGsmME+lxRi3YDRH9PLYJpt+gohVSiA1pRN+Xwhn/iU4g3D1kQzwtX8OcNFKFOkgit2XZBWh6WYojBcgJdWAcFq8OF6IdII6Ep6ZOndmNLY6XvVZAdhgycBtiRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273341; c=relaxed/simple;
	bh=dqu7hmhSBPnG469y5RLSUWvufEJwjkxufPZpia3Scvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tvtyWsPJTZLIiFZY1y2nRatbqwkQi//zPtxNF98ku0UTwbxF55xZAg9mLyqAgrKYZoTBnyX+E7xd73xp+ssR6rTG3nYWjhwBqxg2A/DjZWBxmXl9VkjmpC/WMKWIVJ/7gqb7cGwlAUlD5dPfBLGSxMKREzOxcVnrM1bkHnyUj2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3QqFoOyRVo9qyFgmSal3SEbeYphGHT7S3gxEJ0BBq7vSZpeIGfqKFj33QJccyHIQrntnlGk1GTV9Bm72Q5IntQ5bfFLavy6wNu1AKtPsbSCFjMiIAW4B9CyuFEjTuNLJ4mRegg1W0rA1MJWC51v0uvgy4G1ZU7gG8gxUlVU20pqMUy2jNCKLkaZAXxnnDc/y4ju6jRhuL0P3UUK7fDOSUskgj7bIGOoEMbbaJPuuJpLd3PJ6D9+PlhNLdH1vZn+j9BLvf3cIB4Z/zWDi9nfmp5DNUPEmW3eRlm6uBtgR10mAl8VTvH/L0ujT6NTUK5NoPcIwk39rEiEdllFTUPyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Elm6+5syzmno/M8taC3nAEbxa3IwawV1r+Q/2JLkkq4=;
 b=jUbL6p4ZXGVoVLvGj9pm/LXOFYvlV5OCFoTHcCVWbIRbuuEqLL9AjlljxXgGgS3ZOi8my3WTdK2Y8G7VNHX4Mk0vkLa0KzElA0G9+9dpMImszK05Rv9sBOsZfwJoh3atWdrVp5wFpVYrhq2PbwR6py2Tm0Sx7sy/K/dAov81Whfrza1+yg5vdfYvQTQRrH2y0YZbkLdBHtHq9AfnC/dGqd8UZn1xDrFijBnwXHNGT2NtIp6BT3Dy8Lk5Q0RjCQyoK8oUSZiwBPJGiTDYZG6Rtiye7dfaTZfXRzkjkq4QXC4/K/r3W0S3L9lhIIREJ9EFjX/LDPhYKZk460QWghSxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1238.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.46; Thu, 18 Jul
 2024 03:28:42 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.044; Thu, 18 Jul 2024 03:28:42 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Jayshri Pawar <jpawar@cadence.com>,
	Jai Luthra <j-luthra@ti.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/5] media: cadence: csi2rx: Support runtime PM
Date: Wed, 17 Jul 2024 20:28:30 -0700
Message-Id: <20240718032834.53876-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1238:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c91ca0-4bdd-4b55-8903-08dca6d9b931
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|41320700013|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	55GVb0dicpbuEqVrgBV5ofPgH7ZQOhue1zUhe0BuJKnBo29dPCxrmpyRCqKbnQsocLU49ks8wwK8KJdcgmvyh+/ajRNC9x5rOMoJ84Noq/o1qBP6D8h9ByeI5tpdbR09fhHEiyfnso1n7eoPodgotjH/hu5ieVsOtei5efHA6N+Za07LEP8O2eYEaW7asB2zb1MndyXQlgyL+oZZxJCm8X9OMnZO+gMCbUlrt9SYf85dPH3H6RRXrKw0zmXa+K4+L6Mw2fwzE7xFUP/einm1VGprVTDoHOqAfAEKeRHsor9D6B+pxDm7gKJjhZj4kEe1NHO7Y8zeQVSB5e+9JqHZ1TGHmtc1CRBJAACRRfrgb0PwSOVCx9BIAbGs1VjtUtfgNphzpQXUOnguu7fvv1/CaSIq/RlWvDtEtq/E3F4mW3ThjXLUHYjRL/a59UiI3xQ43docivlguUvyVVYFRYeZYcm6jY0du9ptm64/W3qqvioODARio1CXIfL7T0gQ8IKeJhkICzPdPw7tiIgdsI8bCtGMjEJYIxwN+pEtauldhkiE7o03IgmnBy3ERLorHgZFisWdiNHR4WP+G+eHyUA0F3NWPBCFB0gayJJPjFY5quw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(41320700013)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MO7EEKsI+sUSAeFMqBERhZK8YK2MYvt3eUQo1cSrnev1hHZeM/bGJwQ3MXdV?=
 =?us-ascii?Q?9pbUsZX5fd36geVV5z4pqt5m1SmqLGlZ2G7v0NTd3j/+tySBBtA18MmMW9FR?=
 =?us-ascii?Q?Ta8xXjAlLTpXsuWi9w2pmsGh/d76EvOWK2PiMxbPpEMP/nJZIWueerw2EU7Q?=
 =?us-ascii?Q?2sX65PHu/MBaskbHKOIcAIEocKS6F04bfUNr2PQ292DI9ERq6xUnspUce53/?=
 =?us-ascii?Q?JNtEkQ1IEN7/s0Ruo9ybvfGGgmBDwsDPVEUDLtj5Ofp9TffFwgBRx1rkIBTs?=
 =?us-ascii?Q?Bgk0Cx5OxdH2R+Q2kBqilS9AGqSmp0idrH2ImoVyiw07h3pvz82BNcBj6R9C?=
 =?us-ascii?Q?pT1buwFCJ74vD0IaX8xiaKJFPHRW6oci+gE7tv1SOA845L4PXjNSE2c2YXdE?=
 =?us-ascii?Q?NK52jlCdyTwVl3la/RlIKGbJSfedj3vmPVqiSMuK9ytFIkVxoTBQSZRzCebj?=
 =?us-ascii?Q?joK6cGcjGviVHnLxE61NepMLtgjBCPDZ+3VxSY4D3szoSX6ocBxKfhYMEVZk?=
 =?us-ascii?Q?52x+SvveStpqKmbjlpiDCWxKKG3B5IINLAmxnmAd1vobrHHh2kBANlqf9PwW?=
 =?us-ascii?Q?7VQv7Y1hFA3H+jyVyrSyjrITHavs4ukSpemiUK2wLZsy5AhN6gbtrCxmTjgi?=
 =?us-ascii?Q?Ar5hKafLrvJ8ve/Bi8ujfZhPC1SDBo4+C7lofKY/Tq9O6W0KhMvLGhPC2lbR?=
 =?us-ascii?Q?nJzKY75z4BCyhQUDdE4UqOYWNU8a4rTYTyKcUrug6FmEva9vniBXV8LOYyjB?=
 =?us-ascii?Q?W1bi6ZtgES15ZrJvaAGxefFRmx45pmZfq7HKTcG8z0P7FzqIfyOZLZpfjxLB?=
 =?us-ascii?Q?ZuiYcS6B9dMSYweYoKmPjHyw7LRCa95LPSZgZgyfw4ZiXCtPBVhUhQJr57/1?=
 =?us-ascii?Q?5ISC6o5PjMBrZ6XtZ6hED3XwF+AbGKFKEdPc4YOh4zb/LrlFYo8tLTV3241U?=
 =?us-ascii?Q?l5PjloEFDeGUC8vsJPdI7qNZjqQraS71W5gY9ty2N8AL+E9JqIt+rrFKVjqk?=
 =?us-ascii?Q?3ycZ2WqNgsJCco0jjcGLDlfnFXnUIG/cAtSQsZyLjfdod03R7a0Z2btTI1vf?=
 =?us-ascii?Q?ALjEvJZkhaX6Htxr8dLSlZWJfWy3mS5dA/AOLjy8nIq0TIGbjP3hGPByTzCe?=
 =?us-ascii?Q?gwXrkygxAP2m6VFOyu7zVcIdAAF1sVWgT6ri+cyg6zBcrydZFEkasDXr3Scx?=
 =?us-ascii?Q?Jq49MK1CWoHNLUdTqIkVDwaQflfen5pT9E23mxyaRxXL8SYzmRydB22NVWHz?=
 =?us-ascii?Q?Or3omd0KtMPRbuVS7Xsh/9IkWmPmPNwvBG2VlmXCKZ0zOv6SfcfZZBMUxF2A?=
 =?us-ascii?Q?NZG/s5kM/NM3R04XpyyoNwcm3WSEtsyNmb3VbNvk0KLweEyRIhaVKSeiHwpJ?=
 =?us-ascii?Q?CyUw6xlVdBGYNJY09ckcJbb+KzBdNo5qbuumgMnhHDHzdodVRpz2aSXxJ3SF?=
 =?us-ascii?Q?YVVJalXJOHjLFRLXp7b2IIbEbWt8r1dr3RrlewsGXr3qRIoMf9+oL9wVMuAT?=
 =?us-ascii?Q?0MhUaCbiTh+XApx63wE+0S03b2duSYUxnWQpHVq+j6/3IsYNuaEp3GIwoW4B?=
 =?us-ascii?Q?l3kLa6v4uhEWO7BafE838/Am+lO0D3pbuWEF+C+ZTQmxJW/7XEbyezViY2RS?=
 =?us-ascii?Q?LZSDxvQHyFG8wNf/SI0MnU0=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c91ca0-4bdd-4b55-8903-08dca6d9b931
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 03:28:42.6108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVL4/OyNvH3UaRHQi7O1EPb4fWSLivsJA9j9XthOi/t9aY/Yu2LgZ+iZydzG9t29yv2jyACFDWRXqs/VI72EFHcXOgMTRZlY4vyd1gQNdwmJHffyNwBR4liZPbV95Htl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1238

Use runtime power management hooks to save power when CSI-RX is not in
use.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 121 ++++++++++++-------
 1 file changed, 80 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 6f7d27a48eff..981819adbb3a 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -211,11 +211,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	u32 reg;
 	int ret;
 
-	ret = clk_prepare_enable(csi2rx->p_clk);
-	if (ret)
-		return ret;
-
-	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
 	reg = csi2rx->num_lanes << 8;
@@ -253,7 +248,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		if (ret) {
 			dev_err(csi2rx->dev,
 				"Failed to configure external DPHY: %d\n", ret);
-			goto err_disable_pclk;
+			return ret;
 		}
 	}
 
@@ -268,11 +263,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	 * hence the reference counting.
 	 */
 	for (i = 0; i < csi2rx->max_streams; i++) {
-		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
-		if (ret)
-			goto err_disable_pixclk;
-
-		reset_control_deassert(csi2rx->pixel_rst[i]);
 
 		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
 		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
@@ -288,34 +278,18 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
 	}
 
-	ret = clk_prepare_enable(csi2rx->sys_clk);
-	if (ret)
-		goto err_disable_pixclk;
-
-	reset_control_deassert(csi2rx->sys_rst);
 
 	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
 	if (ret)
-		goto err_disable_sysclk;
-
-	clk_disable_unprepare(csi2rx->p_clk);
+		goto err_phy_power_off;
 
 	return 0;
 
-err_disable_sysclk:
-	clk_disable_unprepare(csi2rx->sys_clk);
-err_disable_pixclk:
-	for (; i > 0; i--) {
-		reset_control_assert(csi2rx->pixel_rst[i - 1]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
-	}
-
+err_phy_power_off:
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 		phy_power_off(csi2rx->dphy);
 	}
-err_disable_pclk:
-	clk_disable_unprepare(csi2rx->p_clk);
 
 	return ret;
 }
@@ -326,10 +300,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	u32 val;
 	int ret;
 
-	clk_prepare_enable(csi2rx->p_clk);
-	reset_control_assert(csi2rx->sys_rst);
-	clk_disable_unprepare(csi2rx->sys_clk);
-
 	for (i = 0; i < csi2rx->max_streams; i++) {
 		writel(CSI2RX_STREAM_CTRL_STOP,
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
@@ -342,14 +312,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 		if (ret)
 			dev_warn(csi2rx->dev,
 				 "Failed to stop streaming on pad%u\n", i);
-
-		reset_control_assert(csi2rx->pixel_rst[i]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i]);
 	}
 
-	reset_control_assert(csi2rx->p_rst);
-	clk_disable_unprepare(csi2rx->p_clk);
-
 	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
 		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
 
@@ -374,9 +338,15 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
 		 * enable the whole controller.
 		 */
 		if (!csi2rx->count) {
+			ret = pm_runtime_resume_and_get(csi2rx->dev);
+			if (ret < 0)
+				goto out;
+
 			ret = csi2rx_start(csi2rx);
-			if (ret)
+			if (ret) {
+				pm_runtime_put(csi2rx->dev);
 				goto out;
+			}
 		}
 
 		csi2rx->count++;
@@ -386,8 +356,10 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
 		/*
 		 * Let the last user turn off the lights.
 		 */
-		if (!csi2rx->count)
+		if (!csi2rx->count) {
 			csi2rx_stop(csi2rx);
+			pm_runtime_put(csi2rx->dev);
+		}
 	}
 
 out:
@@ -707,6 +679,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	pm_runtime_enable(csi2rx->dev);
 	ret = v4l2_async_register_subdev(&csi2rx->subdev);
 	if (ret < 0)
 		goto err_free_state;
@@ -721,6 +694,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 err_free_state:
 	v4l2_subdev_cleanup(&csi2rx->subdev);
+	pm_runtime_disable(csi2rx->dev);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
@@ -739,9 +713,73 @@ static void csi2rx_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2rx->subdev);
 	v4l2_subdev_cleanup(&csi2rx->subdev);
 	media_entity_cleanup(&csi2rx->subdev.entity);
+	pm_runtime_disable(csi2rx->dev);
 	kfree(csi2rx);
 }
 
+static int csi2rx_runtime_suspend(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+
+	reset_control_assert(csi2rx->sys_rst);
+	clk_disable_unprepare(csi2rx->sys_clk);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		reset_control_assert(csi2rx->pixel_rst[i]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return 0;
+}
+
+static int csi2rx_runtime_resume(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+	int ret;
+
+	ret = clk_prepare_enable(csi2rx->p_clk);
+	if (ret)
+		return ret;
+
+	reset_control_deassert(csi2rx->p_rst);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
+		if (ret)
+			goto err_disable_pixclk;
+
+		reset_control_deassert(csi2rx->pixel_rst[i]);
+	}
+
+	ret = clk_prepare_enable(csi2rx->sys_clk);
+	if (ret)
+		goto err_disable_pixclk;
+
+	reset_control_deassert(csi2rx->sys_rst);
+
+	return ret;
+
+err_disable_pixclk:
+	for (; i > 0; i--) {
+		reset_control_assert(csi2rx->pixel_rst[i - 1]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops csi2rx_pm_ops = {
+	SET_RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
+};
+
 static const struct of_device_id csi2rx_of_table[] = {
 	{ .compatible = "starfive,jh7110-csi2rx" },
 	{ .compatible = "cdns,csi2rx" },
@@ -756,6 +794,7 @@ static struct platform_driver csi2rx_driver = {
 	.driver	= {
 		.name		= "cdns-csi2rx",
 		.of_match_table	= csi2rx_of_table,
+		.pm		= &csi2rx_pm_ops,
 	},
 };
 module_platform_driver(csi2rx_driver);
-- 
2.25.1


