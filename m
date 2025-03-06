Return-Path: <linux-media+bounces-27673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47FA54237
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 06:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F215E188FC91
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 05:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406691A238D;
	Thu,  6 Mar 2025 05:35:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021074.outbound.protection.outlook.com [40.107.51.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC3219F495;
	Thu,  6 Mar 2025 05:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741239311; cv=fail; b=KC6l+hpOVFeHOVKy9IHDUx7AuIq57aPdWQrD7k9e+0rI1JolRb6KiNLeXmeBpsxH8FJk/h1L+FV377KhMR+8OmxwAS8wEj0+DxDXigpdEfW8AnRTWy/ag7fOBiYR1vv+eVhV//gQ4f/DFiVfFDQX2UwcTWBnHpqv9gltJkV56Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741239311; c=relaxed/simple;
	bh=2bNl0fccCPo3zgfuj9vk5lLoP+ZGFBfz2evf+a8aC1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FO18AQrl4LzOYqZDA+2uvQcbv/VINw03ImP+iugCsPaJVLofvCE4LNV4GryAvSJhr4SkSb15kSxFEaUiPPZGZcZsDquMmJpePF0NTtFmQgTczDHN7WAc5ydkg71yFw2Cs0AmW4JPAb9JN2LWFz0jYn4yEjkDqd02Pd3fkWsOTo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArFLWAkvC5BY1wggVe9lBcEZj2A/3GBsGCoSkbWfZRGdWtgL1dIxPkN8qQwdL4/wkkLyfua4EgarBwWt+xcY+c2FxlJNACIiFmvE34n9BXl5qJB7PkUXz4ZYnAStRN0th+z0nuLFyhgFwH8qE3qhxtcRywVn1MIoIp0UaWSaOEw0cT4ziuN6MoKfHne+wPhZ4OgiUGPz0ctIfc634bXEZzx1YokxkVGzFG/agKKOYLU+L3ve1Y/E6Yn1FmYb4U9XjvZnvEgxilBgLRSr2z5HYsn6HWXngN7Mp3u5o9pCctcirbRMsoQbgBxpo8/XxPDIiGBDAH4kNuV5kvJm8vOziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwtFdu+Y85OH2ykILSMp8qVnsuBB8OBihpV4FvUDtn8=;
 b=gCyYlrNcDExT6scQa454SLS+eOowYKf7qdi3+fk3o8nQRCeOqF46LAuV0XJeqwACPmwu8V9ooOmQUF8C6Fi7CgDUvGqK5hPlkbUskvwxWJ4z6wuysxCUC9O6+Z7oCfOnI7tOIhIrYuxf+RY+t+p/HirMGUsBtizM2Hkq7bsYOWEAw8SkaCCa5u0nE5K7TpendqMCeZ5RKlhKM8sddexpYRViDlY22AqeepA5usvA7TgnvM6ZEwjKAXIJzQOWmIZrp/JCB+YokgqciTpOj+1h/lGe0vJ+jo7E5v/xUCYeutPTLdjMMdihbd+nas7tMzXB7cielWqQXDLFMs56dov3EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN1P287MB3789.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:256::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 05:35:02 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:35:02 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] media: i2c: imx219: media: i2c: imx219: Enable runtime PM autosuspend
Date: Thu,  6 Mar 2025 11:04:44 +0530
Message-Id: <20250306053445.40054-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306053445.40054-1-tarang.raval@siliconsignals.io>
References: <20250306053445.40054-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN1P287MB3789:EE_
X-MS-Office365-Filtering-Correlation-Id: 7810c85a-b0ae-443f-7152-08dd5c70a444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ff7Y/XTXmkjAZiZ6LoIlmcF1I2nByqT6KhVhM+sEfJTvpbzCHpjwuGNpZwie?=
 =?us-ascii?Q?FY74lfP/fQDuoTfXfBcxK7BybSIgincP6lzx5fODU0ks5Xwur82rs5V9ZN7x?=
 =?us-ascii?Q?kgfG+mCIuorq/ojaRd6QuieTN7Rc1Z0dTKRtcbOTGouhVli06HeWXfegVAi2?=
 =?us-ascii?Q?2zYwukYk4qg9nDLdNt0NaUoVF8UGa3o4WeJrkhqs0VzdZckwkPs/7Br5Hs8z?=
 =?us-ascii?Q?GNbZSVA/9tC/i6oHMZWrC+ZNc/0DdO5yuFlH1Tnf0ZghQUlupv+wJkYIrW9Q?=
 =?us-ascii?Q?4s+J2tTTw6n+0Yfp4oYp37w2ujp8ZEbjCmqKndHMa2yn9F4KJ3O5T5H+nt2u?=
 =?us-ascii?Q?fla8oggy73zo/8unkRWj1ONOgOQ2ch1nUeWbpl+Ah8IYZk+gqislTzeOzlLT?=
 =?us-ascii?Q?HMzfQNE4Ec4Ei1+x6ed/7n5btFNyZtWOFWHXKaJRzHm4v9bmKSA6IiBK7N1N?=
 =?us-ascii?Q?Cgk8jYrGW6dRyYBjU8qivs+gG2O+4RX9qyYcZe+NRjk0E8uPVbZ8dhOYCns8?=
 =?us-ascii?Q?urrLb0COEfjiaHwoqDDRffVqJV000t6q8KP8Bqe/nsuVPwGDT8pGaO2tvfMv?=
 =?us-ascii?Q?m3V9fcI5Ku9J/EqMZ1TQsgf9FfxMSZ9qkBYPwfdP7Kn8J3ODEvqc9y08g+il?=
 =?us-ascii?Q?TnHFCx6l5rOM+GF6br6D7yRTBu778WG9/cXp3QZjjmcO7GdvjxoAt5viiWx7?=
 =?us-ascii?Q?jVQ4DhcACaQE9CUJoB7x7R9ixbRTIfhNVGe9yx6J3epxANjizIuhjSCM+ZAs?=
 =?us-ascii?Q?8LVTsD5pIF96g4YFur+tfpnlelaldwDUT+VdgMfzTCb/HIQS7Y/hg0d5j7wd?=
 =?us-ascii?Q?P0EE7f45nmHLFm4awVeEHofhYTNddrIdZt162CHXuSrYWSY/VitzXqxPZJnP?=
 =?us-ascii?Q?w5Y4JaA5OYTyU05iLUBlqrdQ7AMcAk5EsitoaRefpizQwE7p3VPt282kqLIa?=
 =?us-ascii?Q?O0/sgyATFJkzYT2Q1kh5YbPr61nfpYEn5Y6SERuz8Z5Y+m7YdrLWkA2DjVWe?=
 =?us-ascii?Q?56cZ18/603RX5jFuCkSYcAnAfRQOYKTDlt9abTjDiq8n4ShAxF5WUnZZssl2?=
 =?us-ascii?Q?O925ukj8yrFmoKTIbnmDR5DWBC7Xu7++oDTHi9Xv8BJY2bnyYy6ziy0CWnYM?=
 =?us-ascii?Q?hfKj3R0vNDrxPX73aI6EfHGhiERTTWP9UGC3u2kzYn1LLFqTY+7VUz/e+QcM?=
 =?us-ascii?Q?zW14x9+X38o7cGJXx5AzgswPuAKBsM0SHVl6yEup9Kcky02IqeQ1bK8LO5iB?=
 =?us-ascii?Q?UO+WaS5sasB89Bi8VnMGLaDzmxwPhId4fe4YummqW1ubj+oG2IZpuKvF96yS?=
 =?us-ascii?Q?0dfpY3b2yUhnUJieVCM/FvYnqE6So0kA6T7WOTswcoEXDsghJh0bOrgNA66r?=
 =?us-ascii?Q?8sA1aFVUHMn2CSMwhWi/1auSXrCIxH88Tgjv4w7kU0S0T7Sj2f33jX+7dPcH?=
 =?us-ascii?Q?LevU3OQ13XS/lt5qviubMOK/gGM0tfTF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dp0Pfc5H7gg+AdG2ipRK3K24QyY+q2XDeCtUyjGIXtwqtuDz0tz5Y8sPV9kn?=
 =?us-ascii?Q?2ic42EWr78cCYG+4mN6bZ9o4tS63gcx8qmptEMAStyR3xU0YI++hw/mrBDwQ?=
 =?us-ascii?Q?kkwXYwL2J5Veb3EOF0LuS7G8O+GzGBcD9WxscIT5ytQCjYSusN43CwA4xWSS?=
 =?us-ascii?Q?f/tgYeXRfyi8lemslpqqmTdS67vyZLiLwqVGEiBtnPkj7ZcUXM7yA35poPaC?=
 =?us-ascii?Q?/25+0i8Nq1viRYYDPnPUCA9Cy7x40Otf/Ocvu5j4C7d8X3+kXFPQlb/PRFZN?=
 =?us-ascii?Q?2O65U5BkYwWae768l0BpZJBMAM7lMjqmt4t/2wFcVpSRRfyo3RfXzZNPFQ9/?=
 =?us-ascii?Q?kXULJVemsuYJSxUxz9ZK2Hmdw57kIviACGAdI/PdjWEp1CsWrrCgvvEv8Sm2?=
 =?us-ascii?Q?xSWteIRSF4XXtF3C2WEXfSjMox9Fe8N0WHvYxk+8cGwN7CM9eX8QyiMpqZ4t?=
 =?us-ascii?Q?ljBA7QU9eJp2RoJM5VO9LcbUm1GVHuPWYK2deuzD5aqzoA00H4igTHLLMcHK?=
 =?us-ascii?Q?fvi2qtT/wtoyaA7dOLHpBIw+URV+1ZXv53UXtBBdVh0oCabW5ZqLIw/IS5hT?=
 =?us-ascii?Q?R/n3PW6KoHekDWBUJT1CYnefRlgXrHvOGoQ8lKcMng4O/Ho2kgMl060nKmyM?=
 =?us-ascii?Q?ffjjKovIs83GYNuEBlKG9clbjUJORnzHbRjpjocJQQP1BFWKsxyx9k8XDLDK?=
 =?us-ascii?Q?dTrcLj6EmAcI+hG2dd4EZMjGu+EdjzuBgI0t5wYYDR6G4oI/JYqFLuJLICSW?=
 =?us-ascii?Q?V9VMuJzTlUIcmg613nHlYRpbgUnL/0fCDT+cciYKEOLSWhkR45yxKr1OpXpC?=
 =?us-ascii?Q?0R0hLPM83zYoR1FAVqKXweRV2EzD8GI9GeCtrrSTmvEGFl5G7zvUDXlg+XJG?=
 =?us-ascii?Q?+hMJcIjpw3RLbiE6qL8LYpIG5/sBwUJRNkvj/WZc7p0Gtv+1/k04pyHJT8cv?=
 =?us-ascii?Q?TuTwN1ka805Yi+ipiHoVKaGykdeeGIe+MP4CDC1/Gwa9aBImKMF6SgMbr/CF?=
 =?us-ascii?Q?1lHh2d/exl02wMtSgoqVc5ynGznL2Dlu43jqskgMfDb5MDpp2XKkMqLSYl7b?=
 =?us-ascii?Q?0mX8RsS4Z4dUYoaG+LQzF+F+cixYgxY+KJT1Wvs+Hg70uQPz9K8JpCS1y1of?=
 =?us-ascii?Q?DrwJsStGSDSL5/IwZ8yJiUfMIef/cr/YFq/Lbptegjq05O6poWabH/J8tOLY?=
 =?us-ascii?Q?JZisbwER331qyzF9jq0eIfJlRjp9mf4WVjaexVAI0lb1lBXaZ20ql8a8XdLa?=
 =?us-ascii?Q?C4ntGMeR6saWPmybzMghRuAhMDociQ4wlzQxxgYE9/GdXKaAw8iX5A7FNwZO?=
 =?us-ascii?Q?aFCW6jIHPdtNL5PLbIeA+I+aP+MitF8Bmyw5XIsTtVF9bKCdVeYsz8iaQohv?=
 =?us-ascii?Q?xhcJx+8tawWcNTx5kJw+F0yB0kfz9PUL2JFhy752iz7dNlFN6qOcAOgB7bX7?=
 =?us-ascii?Q?IlQsrv6lCoIwIhXwTRJwCg83hbqXJr1UwiN13eUPn0PVRTOOgYbGTtEBFYI2?=
 =?us-ascii?Q?XfKD1eY5qJ5sO532uNaUrTDQtGEhVVDBKvrn5fUDoBpgtY6Lfl3hjeaLY7u8?=
 =?us-ascii?Q?S9R0v0eLYXV02V3e4E2xrQOSx+v2aysHnIlwcutXb8lgU4HLK8dvmwmpltWM?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 7810c85a-b0ae-443f-7152-08dd5c70a444
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 05:35:01.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTtteLN7579BXfesd7an/rPiDktU9OqOLELvboFLQwnD9XxbT7Xr1V/u4QrwvE5k02KNprqXcfX4oN0FfQN42vuJrm4lXawjYj7hTehExbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3789

Use pm_runtime_put_autosuspend() instead of pm_runtime_put()
to allow autosuspend. Set a 1000ms autosuspend delay in
imx219_probe() to improve power efficiency.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 390a7b9780b4..b42a19958aa6 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -776,7 +776,8 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 	return ret;
 }
 
@@ -797,7 +798,8 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
 	__v4l2_ctrl_grab(imx219->vflip, false);
 	__v4l2_ctrl_grab(imx219->hflip, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1269,6 +1271,8 @@ static int imx219_probe(struct i2c_client *client)
 	}
 
 	pm_runtime_idle(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	return 0;
 
-- 
2.34.1


