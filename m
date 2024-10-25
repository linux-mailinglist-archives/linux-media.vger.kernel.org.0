Return-Path: <linux-media+bounces-20317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD69B0359
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 15:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 223CC284C42
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 13:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEDB1632D6;
	Fri, 25 Oct 2024 13:05:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2092.outbound.protection.outlook.com [40.107.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3C206500;
	Fri, 25 Oct 2024 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861528; cv=fail; b=ZKss+MAhkAjQm+jJb3ZUvdWk0fgF+yZYJLgFEx7Pws0T8AmbDCMgk5oy7EyrHvCt1Dvhd8Z6BLMGhZDB4HHHoMmjukbOqgAksEVwbSttUvWPdpNPvg9fn1MEycNm2vGXHQXl2iYAR2pU0r29QqHMkLqodjckai4/Xu1D/jKnpHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861528; c=relaxed/simple;
	bh=f/H62/jSyBIQRzP09aUn+Lr7TtMOXWPHvmbfWuWhRnI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=k7nUQXfqqmGyJWeE2RZMltLy2ojFzS29NHzpdnL7u5eho54tGRj1HVji2ekCeCzwnyQqpeHidbMRKWJu0+frlrY6C4uIk3gvNNqbb4JPl4V7YjIzqqUbQQ8nVa5KdpuexrGRLfxLjttMw/JtuqgRWPfxWHwpsbKfGuTsU8ecbwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3lbor7zSzkRe1nlRW/rVqIOj9RVUkPdhOXPQbz8sphD1RK/89WoUQbzEGPBBUQMUPloT9jZCddHjMFaY4UVfgZgk4pG3K95NTU9OKbCinZJMwEu/JsFhsjWonc6rh+oasljB4+48wrC+H7BkFtZ5HBUa+NCOq/lsea5B9+gAaroksItUNfDQ1PiwQzTDn3OYSGdtBVPoMGxYnIfLmv0UvKdtmbKOvSQTgw+C2kLnMWJQk77+Om0Bwj1NAwGKoysTKCiU5BYE+7PboNSJUcBTO0TGfbhc0UwKzMbdIFrJwWrCa0raI0kI1C0C/TNxA6c+4GY7z+Y66T57VLJPl5wjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9c5Jcwb3EAYjS/+fTwfW0x3jw6qJvCRAn5j/BJGt+g=;
 b=PMDlWsKEwVZbyF+y9/Djo9ZEzFtbq4BzTFNqUYZQhUpQv3ivNJgqu4a9xN25raa/kpoOOTOqgM+eO58vO6+MNDRO9suNmZAE6vyQBCmf3/18SwlFSgSgZu57K3WZubsb++T71L2MpS0ejPZV4i2YE9Yz8+Wc4YM32QPD4YzhLvxOpTOLyKnwHcd62b0uRDUoTv6vxcpbqCHE/kSKTcyX5ZTAkCi4sMbJZP/CInMjAXQWTm48rkM01T8/K5ROYONxuveX9EN2mW+KnGLgIxHfpcumOXaqu6Z/LWaEQZPIhqF5guB5ofGsd/rWuv7pS5egjsM7cZxB3cN3tCj+i6Gndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1110.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:155::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 13:05:22 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 13:05:22 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: mt9p031: Refactor format handling for different sensor models
Date: Fri, 25 Oct 2024 18:32:17 +0530
Message-ID: <20241025130442.17417-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0203.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::15) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1110:EE_
X-MS-Office365-Filtering-Correlation-Id: 740fa873-210f-42a0-a2dc-08dcf4f5af1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7EuuSaWRJ6S4NLRret1obh6DLz7r2CyECiKpakmP7MnQ++4yG2xNdYE43W5b?=
 =?us-ascii?Q?Ai4DwtvOwZsZQgO+gz0UX03mzMOdPv+Ieow4hmhcGXi5a5lx6leXST1OtJzO?=
 =?us-ascii?Q?py+IQO/bjdVKJ2+1tYG4p3ksDj74i5tfTZ5+G7ikBE2aZwAs185ulxARkVPu?=
 =?us-ascii?Q?HXTvNOGCck8u7d7jxGDr/sPdDk64XtnTwpU1dY6pbP6z//vPtyd9f/lj10Nz?=
 =?us-ascii?Q?3XLaUQB2TZb/XZUDaQaIHQb39ejU9uQj8hEWbQqMBGDJH1ihlSR3BYIWdV0/?=
 =?us-ascii?Q?TeCdlVGx6FWw7VdH0DLeV+cifafXoXa9+uk3oU7WQjCGKbSjIjLZ5RVFrRsc?=
 =?us-ascii?Q?DpAn0N1qStW0BnC082jNm5ZcqeM31fGr7N2cWD/fYAN+rym2TqqrSYhloaf8?=
 =?us-ascii?Q?QKJQrOKxdGAIyI5TkcfZ2Js5rVRpE2K9euDgvDC9gt6CMNiNfl7P90lUFfKZ?=
 =?us-ascii?Q?jf7O/vy3XIc9Ak+wYQOWfY5bsUrOLV4UU4ExwwZnXglkVu5UOEzbz19Wh+HY?=
 =?us-ascii?Q?XBp0D3Bd0Fx/GsYHgGjbvIFs4KK4vE9zqnjNovZlirmshtxirf+8+j6S7cmy?=
 =?us-ascii?Q?OnQH7Bk+JV7M27yDQpMl1KkC3YptoBelnhfXgz6W/peOq2yiqgeCb69oKLQ7?=
 =?us-ascii?Q?YBQaNP58pbYzxUjAWnYNcSynn0J/kpya4Y4lQ7iL4WJ2qnUkK1UK2cwAn85+?=
 =?us-ascii?Q?CoDIrZy8buaXct/1TFfK3a2wp0TX7I/oo+PwPrG5Z8g2ioVQb5yaYJywErzM?=
 =?us-ascii?Q?2XZovSUJHEtc56yJhdZuMVzIiPKkimgIMd+PFNcupZ8/46pjaDL8c2BeILKa?=
 =?us-ascii?Q?VhfGPmWqpsJ7jmLQZDVk2+2ewthr8+CHu0+fyp036mHpOJyb788Avl9aJiCo?=
 =?us-ascii?Q?YuTGMJY5oGCMbq1zudVsD13qrvGKG85y/XdL4WyKq33huDGxOTCVnt55XzaG?=
 =?us-ascii?Q?bx7czxvCJ6QAd/pMCCgT1URx2AoamhB6YEZ7y8JpBVL/Q/EEa9IfXoocRdgu?=
 =?us-ascii?Q?1kONB1Ky2Oglme7ky7hD3WTxPw0T1XZ+pO79BS2JFcC/UgjImn9929d16eyd?=
 =?us-ascii?Q?lpaFcdFfxgW5OJNhPSdZxy1W/jmirVcaj0F69hKQaksoNCwqNxuUV/JgI7eZ?=
 =?us-ascii?Q?2Da+3BLd8QZfObh7wJmq9gdXKwvHfxKEk9HcNxaF5BtymwX4Axjgf0c76jJr?=
 =?us-ascii?Q?6z5UOxhwXOYKDi/MnxcKi7s88/zrwsqacAW/eibp08BZW60rfBRAi0TlL/Xk?=
 =?us-ascii?Q?+F2jmS8QRNkJngJ+x1KD+1OFUQ8PGcMM4XMPsN7ayxI9EKNZJ4RlH/oX7QW8?=
 =?us-ascii?Q?EqUiH/ulmpmo7MPAU53MAb6R38AzUDNmVn7KIawibEXbIqj6iW6q2GRTQilb?=
 =?us-ascii?Q?ldz6OUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IvMcM4rL1LOAXt6uI7znz8BHxdf7rVvIAkZ12eLw+F3SOKxyd7XUmzbAiM2/?=
 =?us-ascii?Q?p0qH0bjv3aK5CxkqQJpB0CcAv3tmFE9nJAwgp+PDomkWh8XdRrZlKrseCF1N?=
 =?us-ascii?Q?fk1Tt+TffQ6h0L3mQuA1kNZeF2mWayMG25v1q4z8iphUUZoIo1tQLBwg1iOj?=
 =?us-ascii?Q?YOZwJ/d7T3cL60+CpL1/z4LG337d8o8+rFsVZAdm2s1+e3tgNaz7UU7h8Qm2?=
 =?us-ascii?Q?4quKOWiUYG2PGMeBOoDnWkTFE4iUYJOm6L0BVUjZKaKiHWxL77IgyLuNAqle?=
 =?us-ascii?Q?PzLHELLfg7UEFkL7OMmzUT91PGl6TD5HfB/JH23v2hPi2hiqJaiGSV1aLaEx?=
 =?us-ascii?Q?J+iBjfT0oWxyxycx+4wDcQHC6rb/YR5n8nMK1O3RUWzzt21BzVhOU+Obfzl7?=
 =?us-ascii?Q?aWUY+HCD9Qg4GiwLs/3/6Ohf6wrilWtm0bfNpJkLvWt9rfXZ7miHjNSivT+F?=
 =?us-ascii?Q?Xv73EGbMnCVXm6k2MuoDu+TGKqNNq0Pe9dxh7XDpOQsA/UtIOYUq0ZuS3GvG?=
 =?us-ascii?Q?LfQUB7wspOXnTRS1Yp0byIOTLApv3yCDmzIv9snSEV4agj/dzKOD8qmDtAxq?=
 =?us-ascii?Q?kD+Ja0cb+/TfvX6jGhH/79reWKflvBm5P4MH0K3MRaqDx3N3jpSho9FWLnJN?=
 =?us-ascii?Q?mCMd/Yj1nSmXLaDUbLKVmZgTgoG5eAWIHNDnqM6W011RiUL/6xyw/IA2fsxk?=
 =?us-ascii?Q?CeLcdztXLvsRiJIVqxRM7vOp+9eqMfVRvpTsUph0U39VxvTQ2k0Yjo2R+LHV?=
 =?us-ascii?Q?WCzEo42tdD2HUBIBZVK5ok2/yt9iYjBLk5DYUsYoMQMFzr5HZBkD12k0nQX8?=
 =?us-ascii?Q?xB1ieqFQeQLBjnsygaX///XErLlJ/NlIbIkaJr1Qw1P1mqyJLimHG/WlVJLp?=
 =?us-ascii?Q?aQV1tW8LwPYFbCA70TsaXdtNZjDm6Wts//A9Zo98zmtrjd7A1Ip3C/Ls4J7z?=
 =?us-ascii?Q?iNk/MIe/RIrNHvx29gOEJOejPI5nJFlkRFoyswIUcOjrcF3V1SIo4yW0WLN6?=
 =?us-ascii?Q?2Cac18dlKeRuWJPwdatgCj9pp3N0Dv8k6V9zodU7uwSGN8sH2GbKUzb60t76?=
 =?us-ascii?Q?UYx9xOsJaHZT6NAG/HTH8JWNVgmEdqRFcSbHkGHD/htYYuJ+U6obPaxpGtlB?=
 =?us-ascii?Q?pSygcGyZIdZXNX+0Bhb0QsFUwncjNZVYr/BIjYZxrOfpSzl8IhIcITdX+O6f?=
 =?us-ascii?Q?SeOzRKY9zy8QtuzLhBcEeamACUCC7rhvwPDL0kfdpD/rzVci2hgysvAlyXkW?=
 =?us-ascii?Q?yKEXWXkmzqy2FJDrqIZMyOw+W36djAlU89zQcY0hZr/Wxiuz5/ylF7eBpDiU?=
 =?us-ascii?Q?HpmWMaVT5PUcHH3cFS9rbtbHpEeMG50KVUPICj0z2Lue+emGTnITGMH01Qa/?=
 =?us-ascii?Q?43omMGhRIL3vbl5UJdK5tULvWz0Np6yHi0Uziw4rOrOWRdzgKDBmGNhhXfE1?=
 =?us-ascii?Q?gEwLYVYHSgWBrwkj9GARNDRuz0Iwsy9/5/dXb1jqhYAfPfRJJJpqM5MM+UFh?=
 =?us-ascii?Q?Pt8sOWNGBdYKyFJsC1QM8rSgYU89JqWwhvxg/UEW8gws9b5EgeMQD7gFArBw?=
 =?us-ascii?Q?kYiurXxcMtHrEM5azQWSOEstF7SyX3BxU75MQeDWpl5h+ste2SMFk3C840FN?=
 =?us-ascii?Q?741YzUUNDovuVy1o85u5uPo=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 740fa873-210f-42a0-a2dc-08dcf4f5af1e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 13:05:22.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEYrVXrwrQWbRNIf1Fh47DMLMlldNUuZyi5Z0PkK49FguBt7mtIkHf5UApKRhQ6rPk1uIIY6B8ymex3ezgo60ZSu1fHEqQE1rohem/iaM7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1110

Add new structure 'mt9p031_model_info' to encapsulate format codes for
the mt9p031 camera sensor family. This approach enhances code clarity
and maintainability.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/mt9p031.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index d8735c246e52..d4fcc692311c 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -113,6 +113,16 @@
 #define MT9P031_TEST_PATTERN_RED			0xa2
 #define MT9P031_TEST_PATTERN_BLUE			0xa3
 
+struct mt9p031_model_info {
+       u32 code;
+};
+
+static const struct mt9p031_model_info mt9p031_models[] = {
+	{.code = MEDIA_BUS_FMT_SGRBG12_1X12}, /* mt9p006  */
+	{.code = MEDIA_BUS_FMT_SGRBG12_1X12}, /* mt9p031  */
+	{.code = MEDIA_BUS_FMT_Y12_1X12},     /* mt9p031m */
+};
+
 struct mt9p031 {
 	struct v4l2_subdev subdev;
 	struct media_pad pad;
@@ -125,7 +135,7 @@ struct mt9p031 {
 	struct clk *clk;
 	struct regulator_bulk_data regulators[3];
 
-	u32 code;
+	const struct mt9p031_model_info *model;
 	struct aptina_pll pll;
 	unsigned int clk_div;
 	bool use_pll;
@@ -708,7 +718,7 @@ static int mt9p031_init_state(struct v4l2_subdev *subdev,
 	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
 
 	format = __mt9p031_get_pad_format(mt9p031, sd_state, 0, which);
-	format->code = mt9p031->code;
+	format->code = mt9p031->model->code;
 	format->width = MT9P031_WINDOW_WIDTH_DEF;
 	format->height = MT9P031_WINDOW_HEIGHT_DEF;
 	format->field = V4L2_FIELD_NONE;
@@ -1117,7 +1127,7 @@ static int mt9p031_probe(struct i2c_client *client)
 	mt9p031->pdata = pdata;
 	mt9p031->output_control	= MT9P031_OUTPUT_CONTROL_DEF;
 	mt9p031->mode2 = MT9P031_READ_MODE_2_ROW_BLC;
-	mt9p031->code = (uintptr_t)i2c_get_match_data(client);
+	mt9p031->model = &mt9p031_models[(uintptr_t)i2c_get_match_data(client)];
 
 	mt9p031->regulators[0].supply = "vdd";
 	mt9p031->regulators[1].supply = "vdd_io";
@@ -1214,17 +1224,17 @@ static void mt9p031_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mt9p031_id[] = {
-	{ "mt9p006", MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ "mt9p031", MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ "mt9p031m", MEDIA_BUS_FMT_Y12_1X12 },
+	{ "mt9p006", 0 },
+	{ "mt9p031", 1 },
+	{ "mt9p031m", 2 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, mt9p031_id);
 
 static const struct of_device_id mt9p031_of_match[] = {
-	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
-	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
+	{ .compatible = "aptina,mt9p006", .data = (void *)0 },
+	{ .compatible = "aptina,mt9p031", .data = (void *)1 },
+	{ .compatible = "aptina,mt9p031m", .data = (void *)2 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mt9p031_of_match);
-- 
2.43.0


