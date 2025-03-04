Return-Path: <linux-media+bounces-27493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CD6A4E3CC
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 16:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91648A16A7
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 15:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FCC279353;
	Tue,  4 Mar 2025 15:12:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020134.outbound.protection.outlook.com [52.101.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108FA278176;
	Tue,  4 Mar 2025 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101156; cv=fail; b=i3tqrnobXE7fL/aKfdbYoUbxPXKZ6cCZZn32kvZwX2GFISzfhZDHtM/L9gdBdc0XxcN98PIDxJ3ZcdQl4gurAiQmlur93MaYNc+PLC2rfeoAQV1lRXmc6fDsJTce1mKoW0dDO7oSuLjktBuAfcc5grTKFZcXIFPnA74sC3Aga1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101156; c=relaxed/simple;
	bh=GjVY39TBdHpExe9RY8iUDce8JJXkU7aYBaGT6M6trVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dn6p7FxmJc9WNZOFESBAXs80XcTS1PwJlhn3JC/xJenQNJfPcPEEartSaQPIC8M6Qfmbkmysz3C0nL1etb+loR8/aQcB2tUBvUzhg6YtLIwfGDE70E+5PL7/jTDGB5H4LDZWS33gxLQmvISg2DCOtNO68b8h3+VT22ZqPhguAJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqzkoHKM0QKXsUSSruHVN/s2sDHY2h/8YQJfOo/v20KaA44jqCsF80o5gTELf/IujTniQTkL8SLBS+iSWWhJ/K8LeRF3Y6XMWunPrsSKOz+iaabKKqtmuBVeYma+zQWd7zAckjfo8wq5GugPLZF01lny3Du1ytvg6cy0RiU0AS95CChwOblYVWs/cfcXn92hPJPwIZtXJRTzErqzZxAYVV1jpL+c/ZRO54aAwoTIhUbkQe74w08nRyeiSYQeA0qIqRpVKM/rQTP87+Y6mdx/9fFi1QcYlaxaSMOOhZK6X+57qoqan5gto9udE+XTeIP1CV6c7BOKSVnN3mCik5eg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys/Lw740i11ImXYyh0+8N1csSWEVX/FuBnAzjL6cdns=;
 b=m2gzqrjFof8MAPvkS1VymtTDyWJ30h9hXPc0sHNkPF/NjFlkHBWD6e0bjLBwgTaUjO523c7envIUNq0U7DwosqmMjINVZO8ja5ggGX+LhDhvcn0osFUFknIfv8BSpFpEYUa//8ldMbWrG4nqLqJFC7X9PrasQdi02KUviDzGTMYL74F+ebptc53QyixsB+5qjzcYlrOKbmQFKi8Woy7LoYv5SyHsgi8QeBbca0Icwem6hZLl/QdPw5CxmZZnbtHJ+ifIwmc6Q2DsGAaIIr9+KObEyNo/MUHt3uVvZzNYB7aewcTXUFwsiWX3zFcK2lKcMWyY4z/euwE0GT5BsWS/5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB1836.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f7::7) by
 PN0P287MB0672.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:160::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.29; Tue, 4 Mar 2025 15:12:32 +0000
Received: from MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
 ([fe80::2f96:dc5b:f53f:b759]) by MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
 ([fe80::2f96:dc5b:f53f:b759%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 15:12:32 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: "tarang.raval" <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: imx219: Use enable/disable_streams callbacks
Date: Tue,  4 Mar 2025 20:41:34 +0530
Message-Id: <20250304151134.105771-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304151134.105771-1-tarang.raval@siliconsignals.io>
References: <20250304151134.105771-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::20) To MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:f7::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB1836:EE_|PN0P287MB0672:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ee528b-aa47-4cef-c795-08dd5b2efc6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eDEdtnMLqek4+IZoW2f/KI/d6Zk762mSSFqGfDuuXEPjKiCQn3HgCRQisths?=
 =?us-ascii?Q?c+9F7lL09AQx/OrQ6kRvT5Rymi+mbgsHOArhaZ4WFFsE5vIlsHQCBmNZeaZ3?=
 =?us-ascii?Q?Z8SmO15OOmefImD8GOkMulypGj+jZuxMDo5akusb7B4XIYeelhDDKpkN12FV?=
 =?us-ascii?Q?oW/0r1oRBLUgu8Xpxf3TDPHZP1BJLBKogvlfIKX+e08YAOsmIUFeXmMCIIwI?=
 =?us-ascii?Q?0a3cWmdgfDx9AULlkfCzcPtUfekGikQanVz+wj79Ji7zHXb26j9KUYDrPjPq?=
 =?us-ascii?Q?CdxnKODnzSQ3gnkzSjQ9l5lSPQDFEZoQVNoGb0iAKPIyHF+kZk9p+71j2CiS?=
 =?us-ascii?Q?lt84GYO3gP0GBvG2Gd1BgJ3dg0MftuNK244f2qqxhfYPGv+JfDxXP42zTfTI?=
 =?us-ascii?Q?M3bp7Y2DT9BrdYgXCgR5tpeCaDJdeTvm9YlqplJKHF23Nx9kZwZbwKIlPZyT?=
 =?us-ascii?Q?8T3ZeC9UkcNVrOwGEpCoSmjpyOTeZuIHobpcBJx270KT4XfTi8gAsYiTvCl8?=
 =?us-ascii?Q?+VU+0ur21gYkyDw8e3Uh0lFTCB7bAPJlGLdJxrp+uBHy2vsskv3gCU8Ma3cB?=
 =?us-ascii?Q?7PIsoxFkZQ8QG+dL3k2y5wkn4AD69tarZ7RjpOZ8qEAtACRRV0HiK4O3Oo/u?=
 =?us-ascii?Q?73lJSlvENe/Bh60z1B1ghXt1nWFHdX60tzlqjhnuvRqkyh4UrpwXcjTd+Ugz?=
 =?us-ascii?Q?FD/gPneTbVYV8G6aD6fUPfP8TESqwyB9RT5IVPaCPPPzn7mVWdKi4EVMD4lH?=
 =?us-ascii?Q?Kcc64mfpgL0M+cysowtxss2xhX3dQ9BQnERgjtSiiMgEs0OkjvTCYPe09WGP?=
 =?us-ascii?Q?l+b8YqY5ARWUN4dibHQJX6/bRN4fZUB56KVFeXOlBH2DjpvxJ5nFBMW5fOnp?=
 =?us-ascii?Q?knBUr2qI9NilFFF6eg6TMvsbXXISELMP/czZx/BnGGcaATule6tj/xrAZK70?=
 =?us-ascii?Q?OXvZe/ED0vx19SEy5kp70H+dSmYDon9hF1P+KswabvAdBQ9lahmjHrkXGc6c?=
 =?us-ascii?Q?zs2B1RKqo9HPIh7QHsT/zLj4VQcZW8WOgm/j8oABhK+tgapFgZsurg7ev7T8?=
 =?us-ascii?Q?UGdlCWaCbqUQDvxcEW8rpEqKH8kvzhbOBWWBLDLszHKSqegdE2BmEfRFCUPA?=
 =?us-ascii?Q?1IEyifoWXeaPT3D1VwqQOZy4FvNtZoZ3KDdqzMkmpv9WJv6jFy5iAy+y6Kro?=
 =?us-ascii?Q?09IiB2v3p9p1i5YFYNtvLa7nxC8i+iJt0ow2yWS9DoWDUWnqt/ypG/+NWfp7?=
 =?us-ascii?Q?K2w7FUBsdy/C6My9Ivr1FMDYhT7hydVSZwS9V6rCvqd/vuC7iRye47dmTEIg?=
 =?us-ascii?Q?WXfdcKqtYmmi56ivRix7Wcanl1rG3SSdzDR7jzFdQr6/1YbgQiG/t8GrJ9No?=
 =?us-ascii?Q?+qxfkf+68NhmPvpnPhfWCGavOi1Ul9W0JTh7Xc5dIlynqYYZ0u43K9E4PM19?=
 =?us-ascii?Q?Yhye8kPUcoZHyp23YV+v2ZcTm6dh2JL0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB1836.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nSXdsJgyK4ZSqPdfeQQNl/YfYnxUL1BV+o+fkdnr2p638i6qaH06/sdSImTZ?=
 =?us-ascii?Q?jMBp2m9W3TNVZV6l91Jm7VmFjSrN5VlRmuKzAOFbqL0uz1X68cRiIpFFy2LJ?=
 =?us-ascii?Q?i5R12ArsvB2gVZRkVHqHiQKOqmc0ks7EG16uegKMn2XOapZCR/Zy4/uWcsPI?=
 =?us-ascii?Q?0qm8a0r0XqFaBC34PuU8zybxmhQFBnzwBGDGdtW5+YGRpYBN3+aZXLKg4z+t?=
 =?us-ascii?Q?yO5qZ26FeaiqTttTQ8aFlp3Pw6edaFbAWUmf4oplQVKJPibezMv6OmhD9bew?=
 =?us-ascii?Q?V+V2TCkjNwOA3MlmD1m8MuO4PIDy+8rGHzZgQYfwlrvsDNSKCNEt4yr36jj4?=
 =?us-ascii?Q?TB1uNdnZ8HahRHopMqZSFHWUERPu4QIR0kr6YhP9TgQKvj0w9BrCGGPOUzvZ?=
 =?us-ascii?Q?HuQOK5vIYT7U/0FzYTA1HidhdhmKxQlakNkjDlBRBoLJszzy+I2hbKSGMvMf?=
 =?us-ascii?Q?RTIHPmA7Ku8MBhwmlKQONLPQbmbVHxXkw+lFFDQ9ymXMrY4hmdH67ZtYvHmf?=
 =?us-ascii?Q?e/QjZgkbTAhrUbPdPFcJsneesAWOz32QI6q5wyL9zbhkQbyk5/cH9bpr5RM7?=
 =?us-ascii?Q?zgB9pWxJeagLoWr6RnaVRNhJh6JaKXZkCtPyJ2TyjKmd0STKEPf/jIYulFNr?=
 =?us-ascii?Q?cNMTHltH8ZBPOj+bzuYRCzsMnbL4N4SpPmiAy7kz5C/kkV77L7ZnxvcgI9h4?=
 =?us-ascii?Q?f/FCkeQZ1utAhGqr1Qd749cyf7nCJ4q98XJX6CHqRg7dwWjvOZh4uNyduhs1?=
 =?us-ascii?Q?nbjl3OqT9LLPZfM7KNiHdjD+64qpIPpyiC0nicTezF05qTO51id5MOwWcyQF?=
 =?us-ascii?Q?QMp+tookk8Y7OqTNpTwVe1QFHy2HtZ86RFq1PVNLvJymIoowziysUZRw6aMF?=
 =?us-ascii?Q?1+atN8cn/hQG7HSVINQ0lqN1uTBUUc+XTb5dSe1dHWRiq9nrh0RmBeq8YTVD?=
 =?us-ascii?Q?nUJOh+e2KUqz5fsht6G2NDDCkE+7ZdBtxFs23XcnzkT9symG2DhcueKStUHM?=
 =?us-ascii?Q?oQUL88szAT5z1S+VKXTb13fyUwaa9YlA0pKumUpEQ7MhxY6PxwS69mwn4VYM?=
 =?us-ascii?Q?3/V2vbCdRHfKHrBbAekfsKIPvj6aYuKm/Q8h9bRtWVv2eO+pZh8/sscllFbU?=
 =?us-ascii?Q?z9VkfosXA/SdIgApAURSH6AnpTqHAiWXC9/ABtfmOBu6vwEcUaeb/JMi5d+l?=
 =?us-ascii?Q?1jloIw6sfuOC6z22Vo+XJSo2BHHp2PQ3lnU66D3vNHjpjExfxviW1LANvaae?=
 =?us-ascii?Q?XDQYPncqpdO29imIj2LuRfRtbkQtXokLrdw/+3FHdmiwdOSIU2pWXXgy6SZX?=
 =?us-ascii?Q?eYYmrjp7rzkaugFJUdaWvRmDJTbMpuSvX6rTm+4+7iAFcg76FUUjCF0/N2ol?=
 =?us-ascii?Q?cUc4lNzg5JxG7TxiDFokcmbtpeZxr80aOiEH4oHF9faLyYDs+Koe0m0Tf6qT?=
 =?us-ascii?Q?Xb4nHzOVjXd8BDpX8DbgZGGLh09IriV5j5CzUMXIm4DhyauUfhYnsHWfQfAu?=
 =?us-ascii?Q?4YkTmziKiyYFRzBQiUHZ7+Aa9smqBrPuXYt/k3mp2wvsfI02vtQotsb91GbT?=
 =?us-ascii?Q?DBRYyKovshpz3vSyiIug224E/Dibj/lLR6iRdX0vbjKBCLbg22OHvcSeTVth?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ee528b-aa47-4cef-c795-08dd5b2efc6d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:12:31.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mePSig/5IUBVD3ZR1GBrPjlDM4OE5AP5mpn5i0ichfHL9ISSnyo88bl4TdmVA9X/r2ydPgIUjR9DnI2RHQvzMLUSTZOGem4Tav5GdlRTNFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0672

From: "tarang.raval" <tarang.raval@siliconsignals.io>

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: tarang.raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 49 ++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index bdb5fd5778a0..9674b0efb4e0 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -667,12 +667,17 @@ static int imx219_configure_lanes(struct imx219 *imx219)
 			 IMX219_CSI_4_LANE_MODE, NULL);
 };
 
-static int imx219_start_streaming(struct imx219 *imx219,
-				  struct v4l2_subdev_state *state)
+static int imx219_enable_streams(struct v4l2_subdev *sd,
+                                 struct v4l2_subdev_state *state, u32 pad,
+                                 u64 streams_mask)
 {
+	struct imx219 *imx219 = to_imx219(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	if (pad != 0)
+	        return -EINVAL;
+
 	ret = pm_runtime_resume_and_get(&client->dev);
 	if (ret < 0)
 		return ret;
@@ -711,48 +716,34 @@ static int imx219_start_streaming(struct imx219 *imx219,
 	if (ret)
 		goto err_rpm_put;
 
-	/* vflip and hflip cannot change during streaming */
-	__v4l2_ctrl_grab(imx219->vflip, true);
-	__v4l2_ctrl_grab(imx219->hflip, true);
-
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 	return ret;
 }
 
-static void imx219_stop_streaming(struct imx219 *imx219)
+static int imx219_disable_streams(struct v4l2_subdev *sd,
+                                  struct v4l2_subdev_state *state, u32 pad,
+                                  u64 streams_mask)
 {
+	struct imx219 *imx219 = to_imx219(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	if (pad != 0)
+	        return -EINVAL;
+
 	/* set stream off register */
 	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
 			IMX219_MODE_STANDBY, NULL);
 	if (ret)
 		dev_err(&client->dev, "%s failed to set stream\n", __func__);
 
-	__v4l2_ctrl_grab(imx219->vflip, false);
-	__v4l2_ctrl_grab(imx219->hflip, false);
-
-	pm_runtime_put(&client->dev);
-}
-
-static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct imx219 *imx219 = to_imx219(sd);
-	struct v4l2_subdev_state *state;
-	int ret = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable)
-		ret = imx219_start_streaming(imx219, state);
-	else
-		imx219_stop_streaming(imx219);
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
-	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -922,7 +913,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
-	.s_stream = imx219_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
@@ -931,6 +922,8 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.enable_streams = imx219_enable_streams,
+	.disable_streams = imx219_disable_streams,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.34.1


