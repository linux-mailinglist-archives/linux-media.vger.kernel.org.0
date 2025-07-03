Return-Path: <linux-media+bounces-36650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBC0AF7082
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 12:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF4711889DFA
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 10:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5C32D46D0;
	Thu,  3 Jul 2025 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YFM1ciD7"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A42E3390;
	Thu,  3 Jul 2025 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538954; cv=fail; b=BK9Ue0+q8q/hlviYHO1xMwEpnb+Snn14ol4J/+oqB7g/pXPqGbkiZus7ViKzQYcyJSbnGvHNcEX0oP/zitVWeHLs+4ZNR9zYEJisj6JSfJq4V8aq/z/3ql2pFKhvT1fDCpLENujmqs+qG2AJWn2Lrs4vk41KOEDF/J+wxfycrTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538954; c=relaxed/simple;
	bh=LALhuZvhWsh68GrPWAr+N/INxrWA4QS3c46mkXobpWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bw7cVE1ZBHKI1XTznjC/3nh+VZKGZV2JxniyA25nOpXpZz6mo8EHkkzzao8l5U6HMgX9kqb9+RiehYWxx4E8SY2xyzPxc/77ucBM/YUKmj65aKd/XCMmDjroyjbduARHacE3ZCrvQziDTjfSxcqjZom+98ZnjtlM8/SB2VOklTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YFM1ciD7; arc=fail smtp.client-ip=40.107.162.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjUSOtMozW+TGTuPiXXWs5VJmPGPKpkkyLzPIHtydtVFraloF+t+j5D7LzQb8IxzMAZoHrpMj57hcNPCp0fQizavNpYe/aIE1DAuzN+sB1NoAMDtkSmsqyyoHB9zkndKJau8bhzSSWe4XM9PDHbTbtVjoJZBTfHEahc+zC3tJjZsNnAzvuQPnuE/peTR+RCE1RXrm4TTMFbAhVIcseTwi0yS+Wc/HmjDSoUugbf6f+dz90xxVv10Fr7JahXnSu3p4QfFd2CEIJYfUJ1oS2eku81wIMmFT1hPxDqMTIvWoVJdWZ0+xoHyuoPvxZvxIoX9z+DIPN7QD2qmcUQdetrv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNyWHexmtHJkE0z6rxmA/nCGJi0Y+hSdRCe07jFZATA=;
 b=Wu2K1PoYOrxlVRqsMX0y+TdZ3do9JYERFC7542BGdZsK0cQ9z9FhklXRo+UIUU91U+6aIn0e+0XkGSPi5RP0GY5SX+dyO8JscBy0QeLNd5BYkAsci23fKF/PfvO/eX8EVDMD9zAziteaXYeC2FGiO5mq0mmLsibUgASTquLzam13s/JkMvEej5M1noraBiYUJDoKxHf+BucvxFTk7azKJG9xsyL/Fe5P2Hg9CCvTYrEloJzSw8/STsuI4s3cg3AhyDK5k3plpGJ6UJMT6MhIICVjBlQs7MehYdZKbpsKHjIL2NAEyWuV4IOlrvzQwwmxrLW8WhHE1rUQObJ80mAkSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNyWHexmtHJkE0z6rxmA/nCGJi0Y+hSdRCe07jFZATA=;
 b=YFM1ciD7XDhWHyYn32cjvq1/+b8Pm1VTJh4JDK2Ha8QOmFsCPCezdjtTJlkRZS0oMyr1YyhvD1blxTNqPTgwB2J0J74rQUdPBvPimfuMiMt4mOSn3FAH0JaUJhnne5ajCNtMZJz5pYfS8h6ES+9VzY60fH1RlyEujuIpK57JTw80I9boHgFOuKFShaj9BaVt2aTVjw2q2bDm4RXkyCZXnymkvgZH+Zc93wOGZj3QLLZCblWjPsZmbtZ3CQJSOVha90oOYOOTt4CVjbUOG7TOJkLcEd2L5nKmSiG+xm9rnHJcZvRpIn7PRFQod3C5l1bSbjplvUwEIhFZnaAg2wQ6aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:35:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:35:48 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com,
	mingo@kernel.org,
	tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v4 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
Date: Thu,  3 Jul 2025 18:38:10 +0800
Message-Id: <20250703103811.4048542-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703103811.4048542-1-xu.yang_2@nxp.com>
References: <20250703103811.4048542-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: c36469aa-1538-4d21-bf03-08ddba1d5ffe
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?SFGyUabvPDtaPXuLiyBIgLAMa6f7iil7fei0NPEuJgRevtPbqTQ5mpRwj3qh?=
 =?us-ascii?Q?4oNwR73cP95KCNcUZCKB+3VXznL0vPaZK98JpM2gm5cqd6NXrbO22l8WdZ1a?=
 =?us-ascii?Q?r1EiOYvKOszjhogpE3HQREC726EB6DIwgj2q/UbasQEvERuKv2q9vssJssMw?=
 =?us-ascii?Q?KreSGfGXeCuF5ct2MXa/2PiLW+1NTv7E9RWOiJyh5+yE585bSZYFFhdlzklM?=
 =?us-ascii?Q?e5z6BP3fHDMtrB4A+kLm+F7+0JklbzlAd5Oz3Mwa2kGulEhBwFnqXap+u8MS?=
 =?us-ascii?Q?jmJziqkBebi7HNCiKCNJjaHwhFvMqpsCjkL/6ZhHkksnsA29TeGtX0LblWOD?=
 =?us-ascii?Q?xDeC/nZVFWBAxt0bC2vX9sMRNLMsRLkQ4jSCA8YB+Njwf/ZV7PUk0jHlODmd?=
 =?us-ascii?Q?hYWAMfiDIpnb5SUkBs8HXOQpJ7OPa8SZF5Y+ghkjMTiTVzr4BAkRLK7ra1Ay?=
 =?us-ascii?Q?ux4cfsmzugdofqrVpzqzljKxhgs7Ww+LRDG0pfSb1gQ6KlzLj0xM1lbANuVZ?=
 =?us-ascii?Q?9Uj3XihOEN1vxkqoq408erxkHEsZAnJk9TuoCO81DC3BXvgRpy6AIbN8UvP+?=
 =?us-ascii?Q?eEAreELwP4UchEUacuUO77loXCmp/kN4eZ0zXJxEfMcsCoucagcXthu+qeJr?=
 =?us-ascii?Q?eu7vkzBdW8HfLAmWEMar1YHMaG93t64xo9orihbUtGKiAwQ3q3+liRsx9xGc?=
 =?us-ascii?Q?/NsMZmBuWosOpTXrS5wW87IpTcauppIt+eCIfwRw5v3tLKdZgrsvE4/gzRe0?=
 =?us-ascii?Q?XPR4kgS92RsZlPeZkH8rncmV6IYlBJvLZxzwASztWkA8mAhAGTAQeZabJ8h5?=
 =?us-ascii?Q?16GijJqf5DKlvIoIh6+emxpYXVelYBMIZq5enw4VX8FPliX+QOrKBrKymW7Z?=
 =?us-ascii?Q?ck7VjG9h7kxfpvEUh1XI3zkrVvTLcAoOXpKF9T27ID5rGoiAjW82VkAZ3Tnc?=
 =?us-ascii?Q?0dwdX1KEaEAWiOzNXyaBb5C67DxF1RC1lZZUttnfBZgXGIMiGvn7AiJfkZWo?=
 =?us-ascii?Q?yyH1y5+yfkoy7U0h++RLIEPKRpI8zbzRXKyH5Q0T2RDSNV9D6ISpzaX83+op?=
 =?us-ascii?Q?E5fNxTrWI0g8GkCQmSbmHaVEeDfOUShsV1wR1Fox3A2z3WmcoSkdIjKONka4?=
 =?us-ascii?Q?qdWrgwfYUA4p/yimckLvOnBgEXuqShsHSv+1CQWq4kfFZmw2445xDjf1ZB5+?=
 =?us-ascii?Q?cF6YGIl4CJfbBN5/NQAgb4o74hz+sOlBosR7oPAAM9pUF3Vh3nnkxwapTl26?=
 =?us-ascii?Q?2R43pDUjKoDZw29nOvtfSYbSunP4iy0Z4Us4XLBCRlC+/dAo5UnrlBMzeCQ6?=
 =?us-ascii?Q?UpCWZY77PXcHIIGORC3Ao+CJlEswf7v+mGu7qxj96kCR1nT5UCqpJTKe1zRd?=
 =?us-ascii?Q?h//R4wM+kmoDeYWH7tqqYdgJ7wcyjvp46ilVaJa5uNaEHKq3SV1pBWrsK+Fw?=
 =?us-ascii?Q?O/XU+F77/Q+KWy3n/hIcfrUMpv8gvNT24lEzPzfZKr9M6MdhvqGGkrC5YXDr?=
 =?us-ascii?Q?stRu+fH24JsG8PU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2afdWAX1dUjSZorHMKWButcLkqZ5TYUcNAwaQiIl2+rnYYShAF9Wb0YNVP/W?=
 =?us-ascii?Q?DyHHAPPk8O5Sjjc+Ey88RCkbg2r2s2dJBYgiPKkNna4AH6WUN9Pf5rb/VBGq?=
 =?us-ascii?Q?3cJmPeOcZI64rD9ONq+WPETihrQZ7eVeMEX3WtRtDX/T4QGba9946O7tlT/w?=
 =?us-ascii?Q?no5RLEwNG/jV19dq1nzssX9JMvvYKvMA/UTHfRvDM7uVaBfAOWVvRhnYW3Zk?=
 =?us-ascii?Q?MT/dkl3OuCMiTPA1Fu67JvekJVu45P0qEKMjAQU1GWoWotFtPK5gwmdPbQCw?=
 =?us-ascii?Q?ot68fxPS9Aw0JohIDeDWM9NS1RsvxVHFDCMUdML7L3NrY9SfOJM20qe3bVrK?=
 =?us-ascii?Q?YprvtHpNS65He4fWu8YGfNO67ap+ai6f0buKrdsqoiliX9kVrAfGB3cSLqg9?=
 =?us-ascii?Q?LzNoa+Fe9BXKonRIeRkdt96WoONurxygQ30z+MxR13zR3m50ZchjuKDWyplX?=
 =?us-ascii?Q?s3k7goJMPmIpjTUGQuPm+8kebRKtrbPSYB5uMZJNziPX0xKH2g3LS/pLpzql?=
 =?us-ascii?Q?hB+BWAdPhQWTyifBedKxC0V5z1Ch9+JdjA+J8cUNoJHfnM1vzl4nC9cTTcJS?=
 =?us-ascii?Q?MgDdVm5fUftpGAmBVqSvTgoWXlvLmB9DlgUqV65JpNCsPT6Bbe1DqE+VDzbj?=
 =?us-ascii?Q?URw4JMHyaNhKt6jMp2+6/gwZECDv7+DJgFX4cnxaEc+/jZPbWRroYTdyIb9/?=
 =?us-ascii?Q?cxASq9KNPeOofTMqyMI7DFMqhBBaaH4oDbAcQr6edmQ/dA+iVYuw/hPuw6iN?=
 =?us-ascii?Q?wA8Vqw4XHm7bVH5X8jvfPyN5g4f03sjlZIbuqVAg2WwhPwvcINHcsoahVuWW?=
 =?us-ascii?Q?foXk3KBNIPiNgX2inNaZRyBxnkWwx88hvFDDPNTfDhKe3gLDA3BpCiScbipA?=
 =?us-ascii?Q?annSuvfBGvoHBFTAFlniacpWMwf+YhC60Py0RzETPSbhAeB+cNK9b2zEDreQ?=
 =?us-ascii?Q?yreWcLIGFHLQ1BPu2TvGwS3kcxFW92IL5UbTLvH6xXfByDzibx9EGC04M0Q5?=
 =?us-ascii?Q?V79nYcHzMECPKRvofERNbyfqBP5d5yPCY7ZgN4yjTuUkML2mDHuJxd4MrGYk?=
 =?us-ascii?Q?Rwa0DF/aNGNt59v77THrkq8k4399Rv8bzzgbUyxUXwuxdSD4mF8lVBQcUKoz?=
 =?us-ascii?Q?koeCSstmCpN2fCcNy7Md24pFOx7dM9M8EJET+tkffHN6CbtSr+/UxyEQe8nn?=
 =?us-ascii?Q?OniSp6MXWH4xaBS8uS+20bvI/c/Ss9linp+1sNFNj5rlsOalmXmXPmt2cYyF?=
 =?us-ascii?Q?u9y93b7jv6IYVDAmXiTzDB/bVAOaUUVTevESCtbsDP59NPFv9m6wqLw4Kl28?=
 =?us-ascii?Q?xpVVCqsJWzGX1PLlbJfJ2pB/3x3NBNr42+IJAZfoix7Kod0OuoSrStNx1ZFT?=
 =?us-ascii?Q?UWqfB+XrIq0UmoOYcxcvjSpR02cUwGx/1p9I4jb42/XYPpUSBC1ZHdWWvwky?=
 =?us-ascii?Q?9CrQAOW/rcMVYSk9x4eh4+jFD1aO1YaJ0rVvSrzhhUfNoGmcvWMwXFxcTUjW?=
 =?us-ascii?Q?hzh44Ps01hjqHfzuDn/aD6TWBORpIj1gDFFIwLt/WLZNPoqTNH7DjfNCzTM9?=
 =?us-ascii?Q?08c4LzsAfzClj8a30n8mYJPw2WAgFSLZ5YnefylM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36469aa-1538-4d21-bf03-08ddba1d5ffe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:35:48.6171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoQrUqi171a8p8GykdywmdcDvV/PKwQvChxfQqt3ozCJzbiYjyjuktmbTkoEvcF16Kpf4WRBsDVS0sPfPq9Y2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

This will use USB noncoherent API to alloc/free urb buffers, then
uvc driver needn't to do dma sync operations by itself.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - remove uvc_stream_to_dmadev()
Changes in v3:
 - no changes
---
 drivers/media/usb/uvc/uvc_video.c | 61 +++++++------------------------
 1 file changed, 14 insertions(+), 47 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..a75af314e46b 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1275,20 +1275,6 @@ static inline enum dma_data_direction uvc_stream_dir(
 		return DMA_TO_DEVICE;
 }
 
-static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
-{
-	return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
-}
-
-static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
-{
-	/* Sync DMA. */
-	dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
-				    uvc_urb->sgt,
-				    uvc_stream_dir(uvc_urb->stream));
-	return usb_submit_urb(uvc_urb->urb, mem_flags);
-}
-
 /*
  * uvc_video_decode_data_work: Asynchronous memcpy processing
  *
@@ -1310,7 +1296,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
 		uvc_queue_buffer_release(op->buf);
 	}
 
-	ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
+	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
 	if (ret < 0)
 		dev_err(&uvc_urb->stream->intf->dev,
 			"Failed to resubmit video URB (%d).\n", ret);
@@ -1736,12 +1722,6 @@ static void uvc_video_complete(struct urb *urb)
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;
 
-	/* Sync DMA and invalidate vmap range. */
-	dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
-				 uvc_urb->sgt, uvc_stream_dir(stream));
-	invalidate_kernel_vmap_range(uvc_urb->buffer,
-				     uvc_urb->stream->urb_size);
-
 	/*
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
@@ -1750,7 +1730,7 @@ static void uvc_video_complete(struct urb *urb)
 
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
-		ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
+		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
 		if (ret < 0)
 			dev_err(&stream->intf->dev,
 				"Failed to resubmit video URB (%d).\n", ret);
@@ -1765,17 +1745,15 @@ static void uvc_video_complete(struct urb *urb)
  */
 static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 {
-	struct device *dma_dev = uvc_stream_to_dmadev(stream);
+	struct usb_device *udev = stream->dev->udev;
 	struct uvc_urb *uvc_urb;
 
 	for_each_uvc_urb(uvc_urb, stream) {
 		if (!uvc_urb->buffer)
 			continue;
 
-		dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
-		dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
-				       uvc_stream_dir(stream));
-
+		usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
+				     uvc_stream_dir(stream), uvc_urb->sgt);
 		uvc_urb->buffer = NULL;
 		uvc_urb->sgt = NULL;
 	}
@@ -1786,26 +1764,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
 				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
 {
-	struct device *dma_dev = uvc_stream_to_dmadev(stream);
-
-	uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
-					       uvc_stream_dir(stream),
-					       gfp_flags, 0);
-	if (!uvc_urb->sgt)
-		return false;
-	uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
-
-	uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
-						 uvc_urb->sgt);
-	if (!uvc_urb->buffer) {
-		dma_free_noncontiguous(dma_dev, stream->urb_size,
-				       uvc_urb->sgt,
-				       uvc_stream_dir(stream));
-		uvc_urb->sgt = NULL;
-		return false;
-	}
+	struct usb_device *udev = stream->dev->udev;
 
-	return true;
+	uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
+						gfp_flags, &uvc_urb->dma,
+						uvc_stream_dir(stream),
+						&uvc_urb->sgt);
+	return !!uvc_urb->buffer;
 }
 
 /*
@@ -1953,6 +1918,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 		urb->complete = uvc_video_complete;
 		urb->number_of_packets = npackets;
 		urb->transfer_buffer_length = size;
+		urb->sgt = uvc_urb->sgt;
 
 		for (i = 0; i < npackets; ++i) {
 			urb->iso_frame_desc[i].offset = i * psize;
@@ -2009,6 +1975,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
 				  size, uvc_video_complete, uvc_urb);
 		urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = uvc_urb->dma;
+		urb->sgt = uvc_urb->sgt;
 
 		uvc_urb->urb = urb;
 	}
@@ -2120,7 +2087,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 
 	/* Submit the URBs. */
 	for_each_uvc_urb(uvc_urb, stream) {
-		ret = uvc_submit_urb(uvc_urb, gfp_flags);
+		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
 		if (ret < 0) {
 			dev_err(&stream->intf->dev,
 				"Failed to submit URB %u (%d).\n",
-- 
2.34.1


