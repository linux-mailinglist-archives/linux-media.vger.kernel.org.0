Return-Path: <linux-media+bounces-28981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF07BA75465
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C93207A7DA2
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C89D149DFF;
	Sat, 29 Mar 2025 05:45:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021079.outbound.protection.outlook.com [40.107.57.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3A63594E;
	Sat, 29 Mar 2025 05:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227155; cv=fail; b=MQgWpvak0Lkq+NxPVOnj8ssiIZtpqXSqip7PkdEZufBAhH7lkM1QukIsXJNpdZ8YNcd/klj9JECSedmRxiiOWSVIXzz6RCqTRIYB3dlD9hPc5NrXUqGoTP8596hUNrRcjqI2IZv/QhMnbuS7+lcSh6va3meXCsS62PlbzSSapEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227155; c=relaxed/simple;
	bh=+EtqznvfnvXwkMwFwK+jSBH543Ihb56Bg4ZZnJPQ2IA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CQBFf34Civr5gwtbJitvQj5j5iRNZmUVBslhJeTNo8c4nThrXX3GTe/q4jAIUxxNOcEl7oXJv9AxBrNTN0LqGE1rkTTIAMNxp41svCxi6g50V6Pe2DwcP7ob7L9NzS1YuF/97zr3+w16zpY/V5jnWkPtK8JpfsB9kIjR9hSV1TM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk8yUORsQb/aYpbLRaGQB3TFRxEXIsHvYCqHJHD/oxL7S6XymszYfxZ7rY2/CEYSvU/uhO8Ugijl2xeN3anGZmA1U22N3z47Q9T7+z83ImKu8J3zW0PIG3d4E67FlbMGkcfw8u65lzQQmECN2OWXhr67olNK8ItaaBS4vnqjdS42fXzqdufz1+Ig60OXyYMHJnQlL3xR7X5+zhCkdJ9C/kVBi7DaNg1cWvEHss0D3vwkhdf18kpArv8HLhN1AKN8RtwRPmi1rzQTrLYq5aWMstIX1P2lNqBYhp4gJO7oG/VKIaIzgRzlf0NkYNr3zSs0CI88hWwSYntmqVGQo5WwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHLcdMCNn/yeuA467vTb56UvRf9bafNJHUU/94+bsQ0=;
 b=S+fyUw9qN4On4GI4jm6hyle54FFHao6U7HNev0VUH1r+0Otrh/QrNLtnG5CABMB9pDRZO/nw+X+fgVkl4l7PfnG2IS2JZjqavqYKmX1gx719g+ePt+TCnfbKuVo0DvSnbkDnf+MNfbhRcyB7iwkUNs9UcYIpz0wq49o+kLuirv9tbHhTQvZ8z3nMYk87Bf64n5gyGlllscPNWju8tng9emPG4Fm3GiW9T0xXQ+UeYPvSy63YE/aQ0oZEdg428ECgGA/GiumT9G5542v2FRCaKRY67gY5LClkZSFs7vw0yYqBG2dVR8h5dqVRjH+ze4YdbyZTTKECwfdupTXdaf64mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:51 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:51 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Luis Garcia <git@luigi311.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] media: i2c: imx334: Use subdev state lock for synchronization
Date: Sat, 29 Mar 2025 11:13:30 +0530
Message-Id: <20250329054335.19931-9-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: b8a657f9-d7e5-4e4d-e20c-08dd6e84f6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3imdyihFJYlLGwjvpldA0OHfg6dFBq1Eg+QKXY0fRmFXRw0HPfxYdtwPUp11?=
 =?us-ascii?Q?vVhUhUEtpBxMTdcEmN/RVhwV0QAC04SRG6NTW1mZvEnQgraLhhWM1D6cZ0tL?=
 =?us-ascii?Q?q3MMhIUiGEIVLtb24K0qL/iOOuvoaOuGZoIpPUQIR8Vat6D3UjHioydqocNc?=
 =?us-ascii?Q?T001GxE5M/ykrzS4KQmmOzuJBWHkK5rKdsmRFNvhaFD4W6iLqGe0J/A5hpxz?=
 =?us-ascii?Q?6/Ygeg2SM4CwwU3M+7CfT/wo0ryMBAodgZ0xPCOhmrgfHoStIwljjH7j23sh?=
 =?us-ascii?Q?0E2su+ufMvonxrW26F0/vk9zGmnFFAwBu6RQuUXg7GXfp98l+jHWMVcN6HAW?=
 =?us-ascii?Q?UU9KyTIgHUfF5PDPVUEjjekvVtyaGiTJoXuYJMcciQEQMOwLJvMtnYyql/7V?=
 =?us-ascii?Q?vVaoYz2th33YVv0k5v+5GZVeDoKarHwRYGsfMVXanL2Zuj3USG8AUGJhs+U2?=
 =?us-ascii?Q?HUCOKs+Of/rovWk/LkTvQGEpCSmMuoPtIDYY6RZUuK8f2WibQqLVjPnWwm/X?=
 =?us-ascii?Q?9nHjQnhY8RRQ4+RSQtRLwdul0DaixzF37CARtL9Yqvy+3C490forHIhIY4Lb?=
 =?us-ascii?Q?35Oug2bFjbCpYVNHkjP9IfaXsi2bMmHxF/j6aKeWgjwak9W9oQS1GaJ2jRMN?=
 =?us-ascii?Q?fYGFwiKoabWd4BoXvwVj0aVeFlcnEYXcH5myv27uNLTjlSGMCXg7nU40pMEW?=
 =?us-ascii?Q?Iw+zvQD1guNLpIfje1daRQb7A4mdLJ0DDQQxfNxKAAxagqEDRdX7h3AuPokh?=
 =?us-ascii?Q?tU8w0zRiezZcU4HAPw8E5wqnjb9ji4nQnOq2GJCVmuJ0D9wDHMIs1qYf/3Dj?=
 =?us-ascii?Q?kCjoR0VIjYv8/g6uJc12TbUGiGR1yUxxo4zZ/q6JZjaVDL51L4qe7AyqorxL?=
 =?us-ascii?Q?ylvzyYQEdCZLliSgjKcw17TgmzdtqSyo6iMdFTkODMR7S9uEosrbC0L7aqdf?=
 =?us-ascii?Q?HNjseXJ4UrzkwG27SMIUhh4Zwvh2v1HwE+Bs2/8cgbFGLTeIcq7brbnXtYuc?=
 =?us-ascii?Q?mNd6UZu2HCCc3SpPh+dPIgz+2xMYbyZBCJXKEjRGxObAmDdl523KcIJuX7u6?=
 =?us-ascii?Q?2zvUVTTczuQ+MRF6p4RtwXjuB5fDm+jeonwA4+WM3JYN+3V7wmDjN6OWp1xr?=
 =?us-ascii?Q?la3Eiv19nxtSGsXpNft/Yul0k2PrUA6VKAfYoasAPqo3WTLWDxFo/J9xhqmg?=
 =?us-ascii?Q?68A2d2DVdREYDhGcn2BCv1bfwMKPWii2Jlb4IztIyIpYzuYaTqgXYxEfdd/h?=
 =?us-ascii?Q?XfvtLnfAbK0AxjoUhVNQtUT2sVlfIBb6D5aSHmUNePD9p9iYGYEobeJ1vsAs?=
 =?us-ascii?Q?YMGmqj+T+Z2gR8d8ExSLV5Zqs7chgaoZIEBW2A4yXigD2N2reqXHHuOXwUif?=
 =?us-ascii?Q?ofE+1VcrVlmg3cUz7gqM8FPNWn2TH3WtptQJHR+LLuAz/7tgb9OZrKg4LzY9?=
 =?us-ascii?Q?xZHLcQpBu+pecCwqIIm05sQZqW3bNTKx2UaL8yYVsDaOn7FCPjNPdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e3I3Kev7yQ6y3RSj8liS4NfkdUiFdHUu8rqW1L3F74kHyibpBYKFZbXm9PUR?=
 =?us-ascii?Q?zdSyPr+sGmMDPawxH+aCzhXYgzMfnFgQP8gty7E6tp/GaMaWZpEkw+HmQnjc?=
 =?us-ascii?Q?nThkOhwswmVVR2pjgxbMmnExciqy2w8uReomhld+NEfyJ3HdC66Od+W/vdai?=
 =?us-ascii?Q?WBOAI+8UvHm/hw9Hz6PgxJ9AgIaN3ORsijjcaSXLTNeGuklwigH9eKkWOpwl?=
 =?us-ascii?Q?lwhyXSS5/REp39lXk0ktIRadKg1HKUOIVdDpA/704FrvuIcewDtjRJ4Fa9Dn?=
 =?us-ascii?Q?/OIIYVKEmxo26tZrzIlN3xY8VDAtjn+tF/Sk/iuE0rWyzqY6dfV2OBOyOafb?=
 =?us-ascii?Q?OMqOm73VNywsYNgCvZnQqxDtA6QaVaq7IVsWHSrst5OWiWaxGAWjmYtBQ0TZ?=
 =?us-ascii?Q?MATvnCRgvytSY3hqqm2DyaEgj6or+vZKrOzNKuDyKAzoQFPCjc9hIbEI5dzO?=
 =?us-ascii?Q?G23FcCHWkQgQb76xBYdRlS6F70FW8kR6I35WdT5xq6cSjnx/9tcPgWH7zfci?=
 =?us-ascii?Q?HyiH3I3Y8afOMtDXT4SakpwGobf/UWMRnXB110iGmAC4WjR7bbUSiwCOM7K8?=
 =?us-ascii?Q?1etJ4z2DeXXXQjIRo8MN428xfcHrTx6KDQEoGMQ3usMM1x4WGEskVv4+nIMD?=
 =?us-ascii?Q?peccdyxy81zV8TsbVhkhZWCzdp3YFLi5efFMsPGAd4xNu07oImPPi1bYE7QW?=
 =?us-ascii?Q?FwuJ0am1KBFMt0ieYHpHLsepv/L1rLyYLHW2rGGGm++Yz8qD6h4BMJZIcIcE?=
 =?us-ascii?Q?jjguj5i/T+n4HriRUm5v35ZbKhxggrDOuw1vamLJfNTpqShI5r9FLPNLHIH2?=
 =?us-ascii?Q?FQooCOqx9a93ht+XPZGbFsprWGW/EYN8J3wu+LUqVLXCmjntJVsrg1sfoZK6?=
 =?us-ascii?Q?KszrKX/bqITLh5Ajvee/pPlrZcaBOkc9/CQ5kPCE3ziiQ79uBENuEu9fojFl?=
 =?us-ascii?Q?E0aUpsN1/8K7G7kEn74IJTKJFNYJft88XOMqkYGH+2QnZIHrv+sOEv450NnP?=
 =?us-ascii?Q?2vL13GGSQ0jeHJNsH3Cg3jYS186pYNQ7jbHUCdc3xaQTK9IJpwNlOzMRUp0A?=
 =?us-ascii?Q?kUnfw8T0kXfzm10NIO8hu2yO2A8JufaUYswhtWsiHBLH7G7xCKJRFos8vV9S?=
 =?us-ascii?Q?J8MaU7sAnAEG18CYr/SJhV7kd/cFPj0wCFQBsV/XnK1OnpLGz8o5/o5meJxW?=
 =?us-ascii?Q?uJpRQBSAMeI80+zrEVe4TFws0jCMROsx3PZOadIk9wSqUOcij7Owks5r09cO?=
 =?us-ascii?Q?gVqmzh63dg00ox14RW/YiJ0TYFQeAf6EEkVoGMfIcUI02kHsdSawt3UoLHL2?=
 =?us-ascii?Q?wYr+7GZqOoJ9fRwNOdf55di3uKR4J+tPlYjWqdK6IWLiBTFicxDFCiP4jPIn?=
 =?us-ascii?Q?h7njJYaiuYnL5u7XNFaJja3GnSFlJGoyT3izhrCsEvG5sj02CEKjrea4j3Rj?=
 =?us-ascii?Q?jLjp9MTL9z3kTd08FpK5VkGULZZBx4DTWaCXxHhbJV2rn6kgQ7nIhZvKzie9?=
 =?us-ascii?Q?wDet+2bkqi22yxdr89zEbeezj5a3wl+vNiGU1euYVBBdooBkFF2ocvIQSAk9?=
 =?us-ascii?Q?jfSvu3XJg1cI33P6DnN1DoXiJ23N5OvAbfTikO/gFQSz8YOx8GJwVynqGl7y?=
 =?us-ascii?Q?pg=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a657f9-d7e5-4e4d-e20c-08dd6e84f6c9
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:51.3433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVRYft0TXSVOJUZEuVmJ5kqOAtCrLuCVcSckrcLMlAGH9e2SP2elRwzZ1B4NRUrDAMoqwaUBvG0PuTzW9mHs7+5i0iclFRHNvThMNwj1sjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

Replace the custom mutex in the imx334 driver with the V4L2 subdev state
lock for control synchronization. Initialize the subdev with
v4l2_subdev_init_finalize in imx334_probe, adding proper cleanup in error
paths and imx334_remove. This aligns the driver with V4L2 standards.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 52 +++++++++++++-------------------------
 1 file changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 169c3c4ca9eb..29eec4dd28cc 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -184,7 +184,6 @@ struct imx334_mode {
  * @again_ctrl: Pointer to analog gain control
  * @vblank: Vertical blanking in lines
  * @cur_mode: Pointer to current selected sensor mode
- * @mutex: Mutex for serializing sensor controls
  * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
  * @cur_code: current selected format code
  */
@@ -207,7 +206,6 @@ struct imx334 {
 	};
 	u32 vblank;
 	const struct imx334_mode *cur_mode;
-	struct mutex mutex;
 	unsigned long link_freq_bitmap;
 	u32 cur_code;
 };
@@ -755,8 +753,6 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 {
 	struct imx334 *imx334 = to_imx334(sd);
 
-	mutex_lock(&imx334->mutex);
-
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
@@ -767,8 +763,6 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 		imx334_fill_pad_format(imx334, imx334->cur_mode, fmt);
 	}
 
-	mutex_unlock(&imx334->mutex);
-
 	return 0;
 }
 
@@ -788,8 +782,6 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx334_mode *mode;
 	int ret = 0;
 
-	mutex_lock(&imx334->mutex);
-
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
@@ -810,8 +802,6 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 			imx334->cur_mode = mode;
 	}
 
-	mutex_unlock(&imx334->mutex);
-
 	return ret;
 }
 
@@ -830,8 +820,6 @@ static int imx334_init_state(struct v4l2_subdev *sd,
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
 
-	mutex_lock(&imx334->mutex);
-
 	imx334_fill_pad_format(imx334, imx334->cur_mode, &fmt);
 
 	__v4l2_ctrl_modify_range(imx334->link_freq_ctrl, 0,
@@ -839,8 +827,6 @@ static int imx334_init_state(struct v4l2_subdev *sd,
 				 ~(imx334->link_freq_bitmap),
 				 __ffs(imx334->link_freq_bitmap));
 
-	mutex_unlock(&imx334->mutex);
-
 	return imx334_set_pad_format(sd, sd_state, &fmt);
 }
 
@@ -943,12 +929,10 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
 	struct imx334 *imx334 = to_imx334(sd);
 	int ret;
 
-	mutex_lock(&imx334->mutex);
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(imx334->dev);
 		if (ret < 0)
-			goto error_unlock;
+			return ret;
 
 		ret = imx334_start_streaming(imx334);
 		if (ret)
@@ -958,15 +942,10 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(imx334->dev);
 	}
 
-	mutex_unlock(&imx334->mutex);
-
 	return 0;
 
 error_power_off:
 	pm_runtime_put(imx334->dev);
-error_unlock:
-	mutex_unlock(&imx334->mutex);
-
 	return ret;
 }
 
@@ -1145,9 +1124,6 @@ static int imx334_init_controls(struct imx334 *imx334)
 	if (ret)
 		return ret;
 
-	/* Serialize controls with sensor device */
-	ctrl_hdlr->lock = &imx334->mutex;
-
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
 	imx334->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
@@ -1249,12 +1225,10 @@ static int imx334_probe(struct i2c_client *client)
 		return dev_err_probe(imx334->dev, ret,
 					"HW configuration is not supported\n");
 
-	mutex_init(&imx334->mutex);
-
 	ret = imx334_power_on(imx334->dev);
 	if (ret) {
 		dev_err_probe(imx334->dev, ret, "failed to power-on the sensor\n");
-		goto error_mutex_destroy;
+		return ret;
 	}
 
 	/* Check module identity */
@@ -1287,6 +1261,13 @@ static int imx334_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
+	imx334->sd.state_lock = imx334->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&imx334->sd);
+	if (ret < 0) {
+		dev_err(imx334->dev, "subdev init error: %d\n", ret);
+		goto error_media_entity;
+	}
+
 	pm_runtime_set_active(imx334->dev);
 	pm_runtime_enable(imx334->dev);
 
@@ -1294,23 +1275,26 @@ static int imx334_probe(struct i2c_client *client)
 	if (ret < 0) {
 		dev_err(imx334->dev,
 			"failed to register async subdev: %d\n", ret);
-		goto error_media_entity;
+		goto error_subdev_cleanup;
 	}
 
 	pm_runtime_idle(imx334->dev);
 
 	return 0;
 
-error_media_entity:
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&imx334->sd);
 	pm_runtime_disable(imx334->dev);
 	pm_runtime_set_suspended(imx334->dev);
+
+error_media_entity:
 	media_entity_cleanup(&imx334->sd.entity);
+
 error_handler_free:
 	v4l2_ctrl_handler_free(imx334->sd.ctrl_handler);
+
 error_power_off:
 	imx334_power_off(imx334->dev);
-error_mutex_destroy:
-	mutex_destroy(&imx334->mutex);
 
 	return ret;
 }
@@ -1324,9 +1308,9 @@ static int imx334_probe(struct i2c_client *client)
 static void imx334_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx334 *imx334 = to_imx334(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1335,8 +1319,6 @@ static void imx334_remove(struct i2c_client *client)
 		imx334_power_off(&client->dev);
 		pm_runtime_set_suspended(&client->dev);
 	}
-
-	mutex_destroy(&imx334->mutex);
 }
 
 static const struct dev_pm_ops imx334_pm_ops = {
-- 
2.34.1


