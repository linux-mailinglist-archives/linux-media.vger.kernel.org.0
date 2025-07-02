Return-Path: <linux-media+bounces-36530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A907AF1310
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF0707B3F6B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 10:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B941A26562D;
	Wed,  2 Jul 2025 11:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JcwikjEU"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57F7245038;
	Wed,  2 Jul 2025 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454002; cv=fail; b=dCtocvmSRvGdYeDdrooCOtCjFfQpwj6ASlE1HjiFOfiopt6OF9+gFPyCaUAn3/bBV8htzC63aK5BRyXYCKxJfOdxbt32vnp5Dq/rHHHkYnhG2MLmJ22ZDk7qPGGwixvGSa7F7zbxRO3ybGjCA2jefNyuwm41xCigl6LntI+GZpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454002; c=relaxed/simple;
	bh=KKK3T2Tn8w/JJjjM1i+W0GhRumqvrPtd46g/MyiMSVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ov4kgzKqOBj0Lsz2NSBCdP4ve+4Ew95Fmmcyl2PuqM4Kygt6oIxdouwifWQ/xgipYSafZxpmiRYYtT7p5wmDlkCmnbYRjtKnWz/b2JKdhqg5Y6lONjhL9mbdVptnaWXZ2pTVJyrDrdefZrLX5NGq/s6Q6VJU1H3Ej9HiJeCG6CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JcwikjEU; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJemYVEh2RLvYYlkuSwbE5D3thyzUwKufr8HN+EJXtW3h4Tv5oooBVDR6csoV6OqqdXst/idmHdZ0oAZmv6DdvyY95q+WC1wDTv48hzk7aI9rlY+G24RQfK+C+rCqDLfU2O28BbEKmdtgfg/+9DNrnwY+KXGp73/jAZFI8/r7s9l+cCd+XllCe4N6BqO38w5WM9iQc2LgRWKhFKhQ/bWqnOPutF9GZRa8IE3Pt/tO1CSRSS/vr6Ddy0zC6RQm4FsGzqrPvhlo+ya4RXhM7GSNtiYrSCwkolQPbAgmF2aWoB2KpKfFk0+3wXNf56593/isa89klFF20RVZ8fhDNGGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAZl4m7RIJEB9oH5FlCMCVONnVySE6kkk5W0qO98TF0=;
 b=LtPX8ONolkmAm5hu+AmjvHP175/mYjNYXjYmG/wHxPC3hJDcOp+5jOU2yjbiLS13KSXdrIufRDUKqmAJCGxjDf+BP25AvQJGVu3rNwmrJFCw+nECaiHZTfMc0FXuJCFWm5P/lMEq98gVLvFpBIBoe6HVG3T6IZ6ofh+sKfhmppVn5qBGUFWsGkY54fS+h4x+++YgeYKkTkbkGgHETqLwMAms/Id4IEr4RHLjLPNXtTyEdcgLgsU/PAXe9oEFJHG+VFdtaB9XUmWW/32y24rI8Lim0Q+0OejnqJy5T9dke8n9HTcKRN7LX/n5JCL8QI9E6ZKOBMOfMQDN0OHUPlEUuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAZl4m7RIJEB9oH5FlCMCVONnVySE6kkk5W0qO98TF0=;
 b=JcwikjEUAjOaD+cixKb/Eih4Q88A1WND0A3R7aAcIsl3ACR7i9uzj11L/uP0O3CSHXNfP4rZSpMisvLcXmzWUmYmiZlQVaXdiwh1Qqh/95GpQPioSi3jS1Al/Y+MgUV/GSkUHAcAdZB5hd9C9KoYYjkmNH7g54CRACkMCPtz1MOPFksvuTRfr49eEPDaopj3EX0clEMM7ZOW6dBic0LiAkfHh+IIyr/xUSCf0B9PEzvLVfVvqaa+I7cDGsUn6zn7G+A109/idj/n/DQH0NSAMZWVZad4yRqdWAe8gD6ko/nC+KjXEWQtn2IlHh2FSw/tmXIxGSJJFdmym5iTAeFk6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 10:59:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 10:59:57 +0000
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
	thomas.weissschuh@linutronix.de,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 1/3] usb: core: add dma-noncoherent buffer alloc and free API
Date: Wed,  2 Jul 2025 19:02:20 +0800
Message-Id: <20250702110222.3926355-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702110222.3926355-1-xu.yang_2@nxp.com>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: a21bdb0b-15dd-4ddb-ce65-08ddb95794cf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?qHFwlc9R1SzAmQLNgbkxt3WEF38y3ZdEbBuqSHdUEBAQBZP2XAkca8v1kadQ?=
 =?us-ascii?Q?imWvuy009Bk/jRRLsX/e/oxwfQkNuLYrMfq3JpUC/h/yHXjX6hX9atjyQPPN?=
 =?us-ascii?Q?sSxOWHXoYce1OrlDmMepyY2Pmp00bU3H7rqQRnjL5Bj2Ayk8z52oNrZBFhw6?=
 =?us-ascii?Q?yYozG9bl/ujye9AqgNuOhRuxa9Y8Y62dptSd+x2uG/u7i3DiJQW7Lr6zdLDf?=
 =?us-ascii?Q?BJLX8oJzG+jmV+2uOVAn4i3qix9VqjfiBH1F0pKscv+pjLm59IO8Ilvj+hcH?=
 =?us-ascii?Q?eEvJjATD7SZNdSBqpQtVOd9vsJvUscQ6w20dSOdNa1BzTSjnF4IT2nCF4gNF?=
 =?us-ascii?Q?KgULwJ6QdmS++LTrgER86Erw3/h8nyJI/v/8N+EWUQW+f76/4gPJ+JCk5MMq?=
 =?us-ascii?Q?2x/rmA8ARcwm+wewt10nJYQ2iDiWyuQTmhQDcAFeQGWzBntV/nc2VUtYwPvO?=
 =?us-ascii?Q?WpelnKusW2eGf3Wxq1UMGkpWXEgET5hvNqkubnIAB8FkS8sGT94HZLr1vRyw?=
 =?us-ascii?Q?zZf4UaBLc15tgtphs+VV0ni4CXXU07EjRoJbl6eahIwdR9+3G+uFqZHdt/0f?=
 =?us-ascii?Q?NITZC4DzmGqQN32/zRktErGhMR0Xf69YpHGQJYdTn4WuwG7hHBxdoJuIf3Aq?=
 =?us-ascii?Q?y3oFsvnsgukXDquDk9CHRH3C/H/pkCkwBwEIb7F2wiVlcK/Bkv6Aoa6ubhqb?=
 =?us-ascii?Q?WJ1hAmPSd7zK9z5GbY1ibWW6trRh15E/P0KMDRkkyozg029aMjkNlWgvlTwi?=
 =?us-ascii?Q?KJseQvKlOJwB417/HrSnZW5IxVuNQShoL+wBIUaDtR8Wnxpt1yTjASPlgMBp?=
 =?us-ascii?Q?RC+Ahpa0xzO+S/em41IEs+5aHaw0yZKF2JAIiqxy0sLaw/4nCUNJLUGHULyq?=
 =?us-ascii?Q?mDUZiAxsfxHQ9nDZby9mURF/n+75WVOpzrcPF/GVwNeCm6rM5fjZLGrgcsNG?=
 =?us-ascii?Q?WL1Z8AekmEookY9mGj1Dy7y329NmmgVPQWqEQR2r+HJFUvR+Upyi+ZRzC4RI?=
 =?us-ascii?Q?Aba/nVPyXnlY5KY2GgwVEj4IDyJLtxMIlSTDaV5Us2O91lOtpuf+Q+vxRAJd?=
 =?us-ascii?Q?L3QTf9RmVX2dAQPygB0aj0r1jRPcPGWPeKodJ6IvJVKYew0S9iKjOZ6NLQdv?=
 =?us-ascii?Q?BZZeVjmXuXjCeYLZ5xtCdnYxlzv5zRA+k5dPFh1lVBg375ZuB7+jXVomsImE?=
 =?us-ascii?Q?kM1nIP/kvq5JiHg9PRrqmVq7vLkfkaxHh76vly20AjqeiFbL2y1F5kVm/FjV?=
 =?us-ascii?Q?NKcjTR280jPlaqK7VAx/73mp0/LKg3ozZwt13XRGIULYU6UmNrcFApBeZKir?=
 =?us-ascii?Q?ZR/L/lIkEHfygpWcux9/YgEx7rSLBnvQHeL6sAQAVvkdtdAWwNHeifFQd7de?=
 =?us-ascii?Q?2jZHZVw8cTd/CRM5P2JFXzqi4dL56iIMHbGSbjtvNAinYDRcq0LalJbqUnEv?=
 =?us-ascii?Q?iUamZrb9VDo8jZUtfAIWBe0EgYSStiLDgZMfAWAV9mUGh5ks5tKtF2wI3GiO?=
 =?us-ascii?Q?Y0hRZ0tbNDzKls8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bWr0ZaPiGDKz5DYq877klw2TYYqTlID9zFsiTM3PFJz5TDTdI8tbrdznYxSM?=
 =?us-ascii?Q?aQSCJiaeT2yVCWDEgLMSWjdV9tyQ83KnoIZQ+FnHFM1VGir20H/QRDI9QLuB?=
 =?us-ascii?Q?syJNE2sM/qljDcgRcu+VevbcszBsqlPg+8cQluk3TY58JCQzHDjvW8AeJweN?=
 =?us-ascii?Q?D+qUZICULCKoo8Wh838ZHeRSzVw4/3XJcupUv58OA3Dr0AHQnEM3F2i49y9y?=
 =?us-ascii?Q?tM0pIhPixyXsUYN+cYc4FagXl1YXE61vUy/mQfPdFt9immG6tiL8u7W2RAym?=
 =?us-ascii?Q?Xoey1EhHukbnYzEjA/v/YDiyaDy2qlW66IB381WAahnGp9bVFwT2rolTBY3t?=
 =?us-ascii?Q?wMTzjpjnzgM1BVLfHFa/OCFVQVd/CdvA+bM1klw6kU/wxJbHSBXAc5G3Zshh?=
 =?us-ascii?Q?1/BpeVyoyCl0t5PUGT4UVlV951uTZKRdqb7Zqw4sdgh/NXG2ItDz0wjEsd9v?=
 =?us-ascii?Q?Rh+ERtvkugslgJgVzIOWQQZbl3cGRcRlreX4c1bgqrjCts9vOv+BkSJOEqbm?=
 =?us-ascii?Q?EBFGYOFxdE+H/WjOtgi774M3QiEfdsq21lpbSdmFmr9vQFi0idqOiwJl/hrV?=
 =?us-ascii?Q?DQO/n7Fqgf05HpkSTAIgb/m49Y8i2Dbz80C9dp2159woV4X3rub4da5Xlm8F?=
 =?us-ascii?Q?z0P47jTRyJHZwng2mLaFsIIKIZsvelU1+2QGYq2TKbnVhMPxRj/wnj2zZOse?=
 =?us-ascii?Q?//OB5J+Cz0asHfzjYaq93pBUtWFIcbN/d2wVw8ftIkCeHP14um50ZoLFtQMs?=
 =?us-ascii?Q?eW7GNyYks73USRMTC8w2H26ZvkXonp0LZY94DGnp/7yIYZZ1JzSByl2djTFi?=
 =?us-ascii?Q?Ga2p3MoIurmjmOh8T9Lgq1zzei+dom3sZ4e4sQoIaPk7EtvlaDUNFQWI3wXE?=
 =?us-ascii?Q?CBjT5zk6FuKcBmJ3uLf3cHD6i6KZJoYH8hZXRTSqktTK+7MPhExZ7m8EijtK?=
 =?us-ascii?Q?k97m3nZJiI6cN7oYJiZYM8k5ZpnFMAzpRp+vI3S/JzEUgaPzaATR7kczYXlk?=
 =?us-ascii?Q?glfGTaAn8Yk/dbUaLI67KzaXPTJ/o3dugwb7A/Q6eoRgcz5A6KfogavIeM+3?=
 =?us-ascii?Q?Upx8H03ICl7t0m059a/2Om/dgGC7zkHgzzletM7ZWUkHprlx3c+jdGo8lGzz?=
 =?us-ascii?Q?hOu1Ei8wEcn+WZKHO/xcNte/EH6pxC1o99JtpZWywYdsKHgBcThyb/3fhw0u?=
 =?us-ascii?Q?2wAcefgDwuPWaJDSROvOABZctmprcBic2xxFLF2vGjEovtBcrI1zniWCaqej?=
 =?us-ascii?Q?bh2+Kc/9+I6/VdGo0plTRJOOVZiakRZsFWNgwXosOvlNoyKDckFfC0saiArF?=
 =?us-ascii?Q?mGW5Q4Zu7Z9fEpS0p8p3YDYPTiKLGCh0BJwnVX7Ovs6Xwss6Ws1UOsFEpIKF?=
 =?us-ascii?Q?FIrwxj7qvwSIMl294pnau585E4XoJDRx06fSfu5A7ilqKXjQ5/NCoYbMOXCI?=
 =?us-ascii?Q?gf6SlrMptoZy7bT0h/33QWeGdW8Skc3E/6uH2Y7v7XfW4hyeJLxTo1g3CBDw?=
 =?us-ascii?Q?aFWzdVqcZU4gCvl52Xl0FWikPT37ekLC3TQbqP/BuO+cG+dU1oleFJy74Jno?=
 =?us-ascii?Q?eTe5sC0rRFmtHNmSK9OLMlewzd8GLAVil+23XaZa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21bdb0b-15dd-4ddb-ce65-08ddb95794cf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:59:57.0155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKo29Oet7rU1cr6rcvMw9SJdJ3hI5uL5K7bSZXgackDqtZFwcez3+iO9HXIIJu8YwPoOncHd6I0NKITQ8BRhWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888

This will add usb_alloc_noncoherent() and usb_free_noncoherent()
functions to support alloc and free buffer in a dma-noncoherent way.

To explicit manage the memory ownership for the kernel and device,
this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
and call it at proper time.  The management requires the user save
sg_table returned by usb_alloc_noncoherent() to urb->sgt.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - put Return section at the end of description
 - correct some abbreviations
 - remove usb_dma_noncoherent_sync_for_cpu() and
   usb_dma_noncoherent_sync_for_device()
 - do DMA sync in usb_hcd_map_urb_for_dma() and
   usb_hcd_unmap_urb_for_dma()
 - call flush_kernel_vmap_range() for OUT transfers
   and invalidate_kernel_vmap_range() for IN transfers
---
 drivers/usb/core/hcd.c | 19 ++++++++++
 drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    | 11 ++++++
 3 files changed, 110 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index c22de97432a0..e0fa6d6d273b 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1366,6 +1366,14 @@ void usb_hcd_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
 				urb->transfer_buffer_length,
 				dir);
 
+	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
+	    urb->sgt) {
+		dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
+		if (dir == DMA_FROM_DEVICE)
+			invalidate_kernel_vmap_range(urb->transfer_buffer,
+						     urb->transfer_buffer_length);
+	}
+
 	/* Make it safe to call this routine more than once */
 	urb->transfer_flags &= ~(URB_DMA_MAP_SG | URB_DMA_MAP_PAGE |
 			URB_DMA_MAP_SINGLE | URB_MAP_LOCAL);
@@ -1491,7 +1499,18 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 		if (ret && (urb->transfer_flags & (URB_SETUP_MAP_SINGLE |
 				URB_SETUP_MAP_LOCAL)))
 			usb_hcd_unmap_urb_for_dma(hcd, urb);
+
+		return ret;
 	}
+
+	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
+	    urb->sgt) {
+		if (dir == DMA_TO_DEVICE)
+			flush_kernel_vmap_range(urb->transfer_buffer,
+						urb->transfer_buffer_length);
+		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 118fa4c93a79..fca7735fc660 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1030,6 +1030,86 @@ void usb_free_coherent(struct usb_device *dev, size_t size, void *addr,
 }
 EXPORT_SYMBOL_GPL(usb_free_coherent);
 
+/**
+ * usb_alloc_noncoherent - allocate dma-noncoherent buffer for URB_NO_xxx_DMA_MAP
+ * @dev: device the buffer will be used with
+ * @size: requested buffer size
+ * @mem_flags: affect whether allocation may block
+ * @dma: used to return DMA address of buffer
+ * @dir: DMA transfer direction
+ * @table: used to return sg_table of allocated memory
+ *
+ * To explicit manage the memory ownership for the kernel vs the device by
+ * USB core, the user needs save sg_table to urb->sgt. Then USB core will
+ * do DMA sync for CPU and device properly.
+ *
+ * When the buffer is no longer used, free it with usb_free_noncoherent().
+ *
+ * Return: Either null (indicating no buffer could be allocated), or the
+ * cpu-space pointer to a buffer that may be used to perform DMA to the
+ * specified device.  Such cpu-space buffers are returned along with the DMA
+ * address (through the pointer provided).
+ */
+void *usb_alloc_noncoherent(struct usb_device *dev, size_t size,
+			    gfp_t mem_flags, dma_addr_t *dma,
+			    enum dma_data_direction dir,
+			    struct sg_table **table)
+{
+	struct device *dmadev;
+	struct sg_table *sgt;
+	void *buffer;
+
+	if (!dev || !dev->bus)
+		return NULL;
+
+	dmadev = bus_to_hcd(dev->bus)->self.sysdev;
+
+	sgt = dma_alloc_noncontiguous(dmadev, size, dir, mem_flags, 0);
+	if (!sgt)
+		return NULL;
+
+	buffer = dma_vmap_noncontiguous(dmadev, size, sgt);
+	if (!buffer) {
+		dma_free_noncontiguous(dmadev, size, sgt, dir);
+		return NULL;
+	}
+
+	*table = sgt;
+	*dma = sg_dma_address(sgt->sgl);
+
+	return buffer;
+}
+EXPORT_SYMBOL_GPL(usb_alloc_noncoherent);
+
+/**
+ * usb_free_noncoherent - free memory allocated with usb_alloc_noncoherent()
+ * @dev: device the buffer was used with
+ * @size: requested buffer size
+ * @addr: CPU address of buffer
+ * @dir: DMA transfer direction
+ * @table: describe the allocated and DMA mapped memory,
+ *
+ * This reclaims an I/O buffer, letting it be reused.  The memory must have
+ * been allocated using usb_alloc_noncoherent(), and the parameters must match
+ * those provided in that allocation request.
+ */
+void usb_free_noncoherent(struct usb_device *dev, size_t size,
+			  void *addr, enum dma_data_direction dir,
+			  struct sg_table *table)
+{
+	struct device *dmadev;
+
+	if (!dev || !dev->bus)
+		return;
+	if (!addr)
+		return;
+
+	dmadev = bus_to_hcd(dev->bus)->self.sysdev;
+	dma_vunmap_noncontiguous(dmadev, addr);
+	dma_free_noncontiguous(dmadev, size, table, dir);
+}
+EXPORT_SYMBOL_GPL(usb_free_noncoherent);
+
 /*
  * Notifications of device and interface registration
  */
diff --git a/include/linux/usb.h b/include/linux/usb.h
index e8662843e68c..9ade441ab4c8 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1619,6 +1619,7 @@ struct urb {
 	void *transfer_buffer;		/* (in) associated data buffer */
 	dma_addr_t transfer_dma;	/* (in) dma addr for transfer_buffer */
 	struct scatterlist *sg;		/* (in) scatter gather buffer list */
+	struct sg_table *sgt;		/* (in) scatter gather table for noncoherent buffer */
 	int num_mapped_sgs;		/* (internal) mapped sg entries */
 	int num_sgs;			/* (in) number of entries in the sg list */
 	u32 transfer_buffer_length;	/* (in) data buffer length */
@@ -1824,6 +1825,16 @@ void *usb_alloc_coherent(struct usb_device *dev, size_t size,
 void usb_free_coherent(struct usb_device *dev, size_t size,
 	void *addr, dma_addr_t dma);
 
+enum dma_data_direction;
+
+void *usb_alloc_noncoherent(struct usb_device *dev, size_t size,
+			    gfp_t mem_flags, dma_addr_t *dma,
+			    enum dma_data_direction dir,
+			    struct sg_table **table);
+void usb_free_noncoherent(struct usb_device *dev, size_t size,
+			  void *addr, enum dma_data_direction dir,
+			  struct sg_table *table);
+
 /*-------------------------------------------------------------------*
  *                         SYNCHRONOUS CALL SUPPORT                  *
  *-------------------------------------------------------------------*/
-- 
2.34.1


