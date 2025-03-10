Return-Path: <linux-media+bounces-27921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8629A58CA7
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A86188CC14
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 07:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0171D8DF6;
	Mon, 10 Mar 2025 07:20:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021129.outbound.protection.outlook.com [40.107.51.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33F81D5AD9;
	Mon, 10 Mar 2025 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591203; cv=fail; b=DhoD6qun2qBy+9+mqJBIAk/VyNewY6VN8t39YwSqf/xkoPLE9fcHk6CgkwN9GAFxCKWd+IwWBb03GbOt0ZdyVr97zytKIK0UDv86v1XY8hkbpyrCbqFM7d06VGop7EAdvkn9HgzRRWe+R0BmC5Vfi+iH3FPP0k8+7m5UQxCiPrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591203; c=relaxed/simple;
	bh=s1GPMlOovNRVYsCTzswDj7ZglxioGOMSlitTdMKG2K8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PZj7u7MN1HIA0lIqGCis/Q3MLrF6+Z71CcegVnIesdE2HSG68jrKrtSvP+qD5wwurElDhhAsQyPTFSFkaxR9CVbfUYpoy4bObPPbU5xO/LbUpb4gnKilN6r2v4vM+CHb9f8gPdAOWFurOMr17AlBEJfVMtY1wKIPV5BDHH66+Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeFbxKspOABRn3Xi0zQ6YS2uvbHXeVgOYoxhPbbQwlCxuDjDXpfx46SG2kmVgZ2hf5Gm+BngtNLT+CETkPrdUv3Q3IK6ZVOYbFyMvZot1p6KRqbzmkM41KLlntPNV/cUAmaHByGXrOEeDHq9BJm+umAQlL8bK2hSlBbkMVbh6M7rtjiEIQWtO106NjfeyaT12YRmTkm37obMSXndxMy8NxOmgB5Y7+trwjsSLbbRNq3qb2ou4Zpvk4Oau3ZdF09zzj5wGPZpRuxDGG0iWYUasEdQx5GO5sLTkLKFI55MWVhwEJYjAZoiRPietYeJ7RSYj4mbzAzbpPFlVmO3ogcJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azlX4BaSHk8ee9LeL2wg8X0j41EQ3hOwgyCu2CY8QAs=;
 b=cZaH5Qtq56pbGd+B8APkhPkXooKMQasKOeZqK9H9hBoDJOJoD7sk7BlwBij/iHg4csqOXeKNMBH3iJuZksQF3S2STS+WridLwUCWaU1OUdgA0UnBiZ1+Gc+I6DtXa8CrhLk6obYw6C79euhWqpMIfKWPDQkKrSVPxSl4KkHFO7/fHNXSXcAqRtMFZ2XJyVAiPZKJAJJPIUTWbcXkvirJQaBimfpjqTHgqIyhJKmC58hYNo9xlBRixbhsvLJwLhkl4oCFLF/heieQ66VkGCiR+awWCudB4y/zwJWKb+fDBxo5eZ8g9T+I+s1+PuQ2wPkc7BseZxrY37q9ZRjswtX4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1385.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:19:59 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:19:59 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Luis Garcia <git@luigi311.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] media: i2c: imx334: Simplify with dev_err_probe()
Date: Mon, 10 Mar 2025 12:47:43 +0530
Message-Id: <20250310071751.151382-2-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PEPF00000180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::50) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA0P287MB1385:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1b4531-0ce9-446c-8a57-08dd5fa3f7bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A3oBCIZOj5G96jfXmxATfm7t6NLlRPEU/5RCtiecM3NAoY300tDRRB+26M7W?=
 =?us-ascii?Q?1uNeiodSIJKgk//+M2NsxiSfWYgYDYoLo7Q/dowZ5P8LuruBgo4xeNMZBlqj?=
 =?us-ascii?Q?mvqT2fZvpA1+hj2kt29NINgcOw4wBeMtpN1sfxQVatgNKBduo2Cb40ANs1vp?=
 =?us-ascii?Q?y25HIO7fALFpsEn23cBfNLzvMvXjJ5/kA4XS+gzrPmNZoDPAXQ/Y8yYSFF64?=
 =?us-ascii?Q?g0+N5wifDmx8PG4PIndHX3+NqtDNMpVyVFP9XzK/2WvxlPwg7WiO864LnU2G?=
 =?us-ascii?Q?bkNtkVHjMKfAcVTzUJmAi6F3r93lU7LDcxpQ6TzBll1LR6UTa6eGZywWIH3r?=
 =?us-ascii?Q?y20zdqZ1jaEwz9pCkL7VLOh3LB1dh2XMeCH16Px+1uV6z808w1uv6P1eYY/c?=
 =?us-ascii?Q?AZ24hpnRtjFGyi2yDwRkhnYZECeZYDmRii9W2VV0fOTVTUuinifUH3KFwLw+?=
 =?us-ascii?Q?B47U13mJnBIcwnl1xfQAzng8ztcp/1VjtHfULeSzElQRzJL7qj9S8Z4hgkIJ?=
 =?us-ascii?Q?xHaz/MYoGlqRCYI3YIUBzLAw2N5xd26WCqx7WSVkgb7/Auacq4MKeMTyqLDF?=
 =?us-ascii?Q?sDysvKQn8JDHmTGtFcsP81KfXru/18n/1wDRoCIa2W+US+wUxU3PoiwcNynU?=
 =?us-ascii?Q?TQGGANapUuPzxbRzS5Mc4PcODrp8+x/xzt6EROdnVNG4qQxpDpwBQ/cwlWRU?=
 =?us-ascii?Q?PJ3UKqaYfaGfjDBAq0cARE2siKkdzjlyQh5vrqm+h/dyFW0XCnL6naimQ03k?=
 =?us-ascii?Q?rpHJ3XeWVNszYktkLZA1r8/QWkNLkWzBFiEXR6YrAYFiETaHsh/q1UtHMXvc?=
 =?us-ascii?Q?+m7hJsePMbZAI17t1sWBvimUKiySEjVIXOgc76gJ2htwQn8tLdwmW9XvTGzi?=
 =?us-ascii?Q?1jREV+PFRYPy7gvg5BaFHRSRI5nUzAUL5H5r5slilLZkyLXTE3TjBJ1I/DC2?=
 =?us-ascii?Q?iDB8w0JZmxmbrexM7EJAFsJAwCv84fNjTpOROZ8NJBxyJ9XXAoMMLaURwMsA?=
 =?us-ascii?Q?ptfCKsA9dqTkJfqyhImuDEdenmN+vRLeSsSXhJEPBxFTD4INmAq/8l78jBSM?=
 =?us-ascii?Q?LCjf1EHm3QaLZpYp/DcI2lmCPrYNfOsgRsVdFyQhTXyX8lneQwiUf/92+NUX?=
 =?us-ascii?Q?4mmt+fRnKEVdKWYRXk4a/Kf6VEZBQqvNJK8/KWH9qvwdcw1N99b4KFymQqgW?=
 =?us-ascii?Q?4U2L+iRgLxGatyvrQoj5UxUF1DbsOXmOBjdaxAZu7dvVYSZkW5T1694QPGMd?=
 =?us-ascii?Q?ZSw+y/wEg6/KGvGLFCa9izWgClVwS5vf5ynjJ97m84nkO8fs07P0C75oMdYg?=
 =?us-ascii?Q?tRwPPdhujWOzTXQlu26dTbLNGYg9FBGrARvUBgntvDnQCvkooBJ7hipCWbnD?=
 =?us-ascii?Q?qV/Vxl4z3q/m2ufBbwTsG7KUqC/GkcxdcHILCQW7w9jxwsaFSKqge1/Z3Qt4?=
 =?us-ascii?Q?6NWqDtWTO514eXhkWbq2ipezGWWLgat2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ep/tRUPcVLesUAelelXBC3y5s/r6eKsK+A+PpOfykiklMPV6L6cj1cXuYtnm?=
 =?us-ascii?Q?z2D7FlpvXBnM7+u/il6dm2RMB3id5M4/9WdCFeD5z5oIRsBJokmZRG+/B81z?=
 =?us-ascii?Q?v0xBt8fpblfpCMyyD+4npLzUFg0LxYtsuQ8BdP7aZ4VbWsaSH6kPDdbENEOk?=
 =?us-ascii?Q?RiweX2kNSPSvPcvfzpSYujaCoQ0ALFoU9paCrnywe9wdw8B7lUPbKXEVrTl3?=
 =?us-ascii?Q?pK5WFi95X/eZN2GtXlWdOyMr2q2CdPTuBeUek39KwDfrcWQ133N2IH9WHWgz?=
 =?us-ascii?Q?V+YWAJCV5H1ft13k0rFBx9NtIcG7IGD7i/xxeJv1u+jDv24Kge6OnKiIyOGM?=
 =?us-ascii?Q?+Zndc1ZjHTrL7ZqfC0MZu4j27mBF9IjlOXWgNg3NRKmMhAs5iXNcv3SLmq+g?=
 =?us-ascii?Q?69omo9wmw6bkcJrKVAbqMRIgSrnyxbgIzqTGOVxCRsDb+VZmwTNL4iEEbbx8?=
 =?us-ascii?Q?qKTwX9M+Tp1PKVkid/glp+5X7pthVTiOkrqr/pqAj9xW8ZfMj/FNDsH8XK0y?=
 =?us-ascii?Q?UbwL0kYJ0S3gPf9KRcFuZUGFu/qxfi1/SVyqroXsUyGln8oTkjpwJelb1sxj?=
 =?us-ascii?Q?+2W3pHxbz/VQMUMCp4OnB8m6lA2vHY/L1zoxhrqUMk/Ui7HMh5undpQLxZZJ?=
 =?us-ascii?Q?onrqzK9hA7JWEn6jWdRzmHSArT0saHuG19pZgSxeQpmmbMFhJjb1Yo4i8ZWd?=
 =?us-ascii?Q?3OroyV2DJa8h6a4pYmDCQ+BN9mhc0HpMy/RWYQ5EOVdCqghyGUBJ8AnaiAkF?=
 =?us-ascii?Q?c5Lxhetf+yAXodv5kCgXDMbEZq2+/ondZOT+hvJO5/3Eu42y86mkLFBl7C9/?=
 =?us-ascii?Q?XUKNg8LJR297laXC1As+uv0NpgFj9c4hoXn3nkjQcq5boGTwIQ4jIq3SggMF?=
 =?us-ascii?Q?VGtYEJDxsgfPpsqinw1btkSi8+IipXcMl3oiKom/ESvgDGLR9pRtBx3ca9IW?=
 =?us-ascii?Q?ht3GTjozNqUGfR7/bPsuWg17qYSYqFY9yel7bztrWZBQyL59rREEOFosJFBw?=
 =?us-ascii?Q?5fml6jH4u2NHGEqYXaHmDOJ1kfishIyPwj9kvihLMPRY9mtv/kOfE+rl3HXJ?=
 =?us-ascii?Q?D6XCfK+jaTsxYwsjhqUbZMdUGc1qJLrYuj+xSmbqn6MIfZ9ZZjUrZm9IdMX0?=
 =?us-ascii?Q?VmxlKdScRga6YQmvgw6dvoucP9zIgPGiun2NPINEY+w8AaiNkrAgH5H3Nfmp?=
 =?us-ascii?Q?PQxX9WlUe70ZlpVyi6GoQ367E98uy3S3ssE6CfM/+C4LR1wfHRi2n1k2mgkK?=
 =?us-ascii?Q?N72M+0mopcInicw5EcfqBWC3dUNt/8mHzmG6Hl9vEqO4ty158ITht9tLTfeZ?=
 =?us-ascii?Q?h5GYPjVQEZuXhiYVqh6XNB9jkm3pSuf2apTc+Jr/uqBqqWZaLtr3AspLQOnF?=
 =?us-ascii?Q?i2aFCsZDPrvMZXAgOF4au5O1dfI1xuLBDdzEpJvsT2sJv+osIJb3g2zYQTNa?=
 =?us-ascii?Q?Pnl1Oivld20sP5so2fKNdf6IYGSb2VH0bST4wHF9KiPb3jx3n6VsBloSnfnN?=
 =?us-ascii?Q?RwO1UKdO9dHQcIWv2RQfvp9sh4m82BEAKI+wEOmj/IO41rmMEjj4rpkveQmz?=
 =?us-ascii?Q?7ZcQzdwPH2vrUdbJI17/kidaUNIeARt89INt2WZBxibdjd8D5Ca/6vBfuOym?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1b4531-0ce9-446c-8a57-08dd5fa3f7bb
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:19:59.8493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOqsg2ZYYdFNWq1CI6ArcIkFgEKpzkPNq2PhSekrIeFQO0KESoJaJq5af8In/Moufo6QpozBRtwTaBUzdS62KT/d6yf409FaP47Jpvk5m4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1385

Error handling in probe() can be a bit simpler with dev_err_probe().

also, Added missing newline characters (\n) in error messages.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 61 +++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 8cd1eecd0143..ad0b03a3f573 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -658,7 +658,7 @@ static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
 	lpfr = imx334->vblank + imx334->cur_mode->height;
 	shutter = lpfr - exposure;
 
-	dev_dbg(imx334->dev, "Set long exp %u analog gain %u sh0 %u lpfr %u",
+	dev_dbg(imx334->dev, "Set long exp %u analog gain %u sh0 %u lpfr %u\n",
 		exposure, gain, shutter, lpfr);
 
 	ret = imx334_write_reg(imx334, IMX334_REG_HOLD, 1, 1);
@@ -705,7 +705,7 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		imx334->vblank = imx334->vblank_ctrl->val;
 
-		dev_dbg(imx334->dev, "Received vblank %u, new lpfr %u",
+		dev_dbg(imx334->dev, "Received vblank %u, new lpfr %u\n",
 			imx334->vblank,
 			imx334->vblank + imx334->cur_mode->height);
 
@@ -725,7 +725,7 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 		exposure = ctrl->val;
 		analog_gain = imx334->again_ctrl->val;
 
-		dev_dbg(imx334->dev, "Received exp %u analog gain %u",
+		dev_dbg(imx334->dev, "Received exp %u analog gain %u\n",
 			exposure, analog_gain);
 
 		ret = imx334_update_exp_gain(imx334, exposure, analog_gain);
@@ -759,7 +759,7 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = 0;
 		break;
 	default:
-		dev_err(imx334->dev, "Invalid control %d", ctrl->id);
+		dev_err(imx334->dev, "Invalid control %d\n", ctrl->id);
 		ret = -EINVAL;
 	}
 
@@ -986,7 +986,7 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	ret = imx334_write_regs(imx334, common_mode_regs,
 				ARRAY_SIZE(common_mode_regs));
 	if (ret) {
-		dev_err(imx334->dev, "fail to write common registers");
+		dev_err(imx334->dev, "fail to write common registers\n");
 		return ret;
 	}
 
@@ -995,7 +995,7 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	ret = imx334_write_regs(imx334, reg_list->regs,
 				reg_list->num_of_regs);
 	if (ret) {
-		dev_err(imx334->dev, "fail to write initial registers");
+		dev_err(imx334->dev, "fail to write initial registers\n");
 		return ret;
 	}
 
@@ -1009,7 +1009,7 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx334->sd.ctrl_handler);
 	if (ret) {
-		dev_err(imx334->dev, "fail to setup handler");
+		dev_err(imx334->dev, "fail to setup handler\n");
 		return ret;
 	}
 
@@ -1017,7 +1017,7 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	ret = imx334_write_reg(imx334, IMX334_REG_MODE_SELECT,
 			       1, IMX334_MODE_STREAMING);
 	if (ret) {
-		dev_err(imx334->dev, "fail to start streaming");
+		dev_err(imx334->dev, "fail to start streaming\n");
 		return ret;
 	}
 
@@ -1091,7 +1091,7 @@ static int imx334_detect(struct imx334 *imx334)
 		return ret;
 
 	if (val != IMX334_ID) {
-		dev_err(imx334->dev, "chip id mismatch: %x!=%x",
+		dev_err(imx334->dev, "chip id mismatch: %x!=%x\n",
 			IMX334_ID, val);
 		return -ENXIO;
 	}
@@ -1121,24 +1121,20 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	/* Request optional reset pin */
 	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
 						     GPIOD_OUT_LOW);
-	if (IS_ERR(imx334->reset_gpio)) {
-		dev_err(imx334->dev, "failed to get reset gpio %ld",
-			PTR_ERR(imx334->reset_gpio));
-		return PTR_ERR(imx334->reset_gpio);
-	}
+	if (IS_ERR(imx334->reset_gpio))
+		return dev_err_probe(imx334->dev, PTR_ERR(imx334->reset_gpio),
+				     "failed to get reset gpio\n");
 
 	/* Get sensor input clock */
 	imx334->inclk = devm_clk_get(imx334->dev, NULL);
-	if (IS_ERR(imx334->inclk)) {
-		dev_err(imx334->dev, "could not get inclk");
-		return PTR_ERR(imx334->inclk);
-	}
+	if (IS_ERR(imx334->inclk))
+		return dev_err_probe(imx334->dev, PTR_ERR(imx334->inclk),
+					 "could not get inclk\n");
 
 	rate = clk_get_rate(imx334->inclk);
-	if (rate != IMX334_INCLK_RATE) {
-		dev_err(imx334->dev, "inclk frequency mismatch");
-		return -EINVAL;
-	}
+	if (rate != IMX334_INCLK_RATE)
+		return dev_err_probe(imx334->dev, -EINVAL,
+					 "inclk frequency mismatch\n");
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
@@ -1151,7 +1147,7 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX334_NUM_DATA_LANES) {
 		dev_err(imx334->dev,
-			"number of CSI2 data lanes %d is not supported",
+			"number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto done_endpoint_free;
@@ -1205,7 +1201,7 @@ static int imx334_power_on(struct device *dev)
 
 	ret = clk_prepare_enable(imx334->inclk);
 	if (ret) {
-		dev_err(imx334->dev, "fail to enable inclk");
+		dev_err(imx334->dev, "fail to enable inclk\n");
 		goto error_reset;
 	}
 
@@ -1349,23 +1345,22 @@ static int imx334_probe(struct i2c_client *client)
 	imx334->sd.internal_ops = &imx334_internal_ops;
 
 	ret = imx334_parse_hw_config(imx334);
-	if (ret) {
-		dev_err(imx334->dev, "HW configuration is not supported");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(imx334->dev, ret,
+					"HW configuration is not supported\n");
 
 	mutex_init(&imx334->mutex);
 
 	ret = imx334_power_on(imx334->dev);
 	if (ret) {
-		dev_err(imx334->dev, "failed to power-on the sensor");
+		dev_err_probe(imx334->dev, ret, "failed to power-on the sensor\n");
 		goto error_mutex_destroy;
 	}
 
 	/* Check module identity */
 	ret = imx334_detect(imx334);
 	if (ret) {
-		dev_err(imx334->dev, "failed to find sensor: %d", ret);
+		dev_err(imx334->dev, "failed to find sensor: %d\n", ret);
 		goto error_power_off;
 	}
 
@@ -1376,7 +1371,7 @@ static int imx334_probe(struct i2c_client *client)
 
 	ret = imx334_init_controls(imx334);
 	if (ret) {
-		dev_err(imx334->dev, "failed to init controls: %d", ret);
+		dev_err(imx334->dev, "failed to init controls: %d\n", ret);
 		goto error_power_off;
 	}
 
@@ -1388,14 +1383,14 @@ static int imx334_probe(struct i2c_client *client)
 	imx334->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&imx334->sd.entity, 1, &imx334->pad);
 	if (ret) {
-		dev_err(imx334->dev, "failed to init entity pads: %d", ret);
+		dev_err(imx334->dev, "failed to init entity pads: %d\n", ret);
 		goto error_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&imx334->sd);
 	if (ret < 0) {
 		dev_err(imx334->dev,
-			"failed to register async subdev: %d", ret);
+			"failed to register async subdev: %d\n", ret);
 		goto error_media_entity;
 	}
 
-- 
2.34.1


