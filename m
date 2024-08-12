Return-Path: <linux-media+bounces-16140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F410D94EFB7
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 16:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F06FB25276
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 14:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C07183CBB;
	Mon, 12 Aug 2024 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="XAJ1XCCe"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2105.outbound.protection.outlook.com [40.107.236.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33861181BA8;
	Mon, 12 Aug 2024 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473376; cv=fail; b=ns7rbT2xfja4s5QMVOFqSRTvPfzWKhdytFh5646g3PEPfHDPf0nscxINGE5KmWKnJ1E//LSipfLjD+99JUXYvOWPOX7cF+S8RXgSKT5KidUmceVxujg4OHewGy57Ttavky7xDbsrvToZoTQpcGvZ0pvgFbBZgmWSyonqU97aH4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473376; c=relaxed/simple;
	bh=jVzYQIPiVT3EwzfZjHI4FjlMqGSQkR4iRXAZxZXZdEA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lWd62G15SFEwkd3961d4wmgzxX0E5wct2nC3VfVMsXTVeagT7Q0JZGKUFmHE9GUMy0AoGlOL3uQArZgKd0wn8/+y3lD4LPoxBFQo59K+EvwQ1pV4kQIrxUjRIIRLv13IV4sRxQI9C4BU4cdDDDD7/aS7oaQsdsFcS9oNbE+VKHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=XAJ1XCCe; arc=fail smtp.client-ip=40.107.236.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGk8F2+0PyzztSCFRBoLjSeRehfYwgNb27ytW8uNXZM0Ck86XP4vRRu90FRqZ4K8USowmaOAqexls9EBYiyooew6HU4X6PRS68IlHhLn/uODxjpDjslC7yX/v1Gsf193/SZ9xo2UeE2/8qCgw87Kn74mcXB9PT0q/MsDn2/qJdI0Tcykw3EmXl77UOvjpcKh7YgEctNaWBLDmYImPK6ZKDe7RkqiNed+tItF2sQ650sVHPV/wGtSQDzXLdfClyB5sRBudBFff5oukk2q9juGIAY4Gbpo5HdeBOPQg4/cr2ZIG7Tj4rnD9cviLzCfwSVxTnr8At//P/dspc4SnTVEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9r9T3XikLPiAvkoyT1wYTUxOmRsPcZyiaXeGynTlcyI=;
 b=xqAbwarSlFXD3Ih6juUcZY8mWZ9IbBuA5NzXbPa/8Z7HmAVcbDmI63RqBgevEWQhomYt6m9C3Vig84vXmsi0Wqb9kq/+mjMr5gWOasGsx918m0XklQfhVmIiGgS+egxwRboHz/KUA1S3v4EpY0GZevS/C2s+JPAZhvXqE55i/TpWGOTw5ayJP7pYu3h2sg024GuR5QsGATIdce+uEoRQpDh7o2Sd7NfXzXGHtUjU0OkgGEzMPYiVduxFWwVLaJunb8D/xzXclSoUj1IGkGtqtpxq92xnialCSWvjlBFHpPzPutforiSIfb+/A9MUrz1jBU0+PeNCtnCjB4qgFTvLWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9r9T3XikLPiAvkoyT1wYTUxOmRsPcZyiaXeGynTlcyI=;
 b=XAJ1XCCet55Ssv58mmFrVbR0AFhJ8sYx0abyYgHYRxGxxJnv9jKTX7n6jh99dCFSBg2+obDyUQx+yj3aiG33yKHWUOBndwojwSimYffaDq0T/IY5FL3yxgZRpt1cmoLNJXnaJR1Jv/3IY9dZDKfc5KL6+LDDkMZ41OkvUawRz3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by DM6PR08MB6377.namprd08.prod.outlook.com (2603:10b6:5:1f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 14:36:09 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%5]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 14:36:09 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-media@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Michael Tretter <m.tretter@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: platform: rga: fix 32-bit DMA limitation
Date: Mon, 12 Aug 2024 15:35:55 +0100
Message-ID: <20240812143555.530279-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0298.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::15) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|DM6PR08MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: f2bfe311-08c0-4848-37e0-08dcbadc1b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?22D4s8LnMbgFOeSTiPeIxDSXUZetH/zQnBXVkG+sHuxNCfShy17EakX1QfQG?=
 =?us-ascii?Q?PRI2pvHzKCCnGo4H3B+JGe6+uwpiIL6nVpZTj8V1xvhZMPnekZ64SzBZBJxd?=
 =?us-ascii?Q?CuyRQJnSHQFXNNicDTzA3DO9DLgZgwMxPqUarDwJFstJP50yqIhQ+hyPL/b3?=
 =?us-ascii?Q?BkI0L6frtKiaNT9kSxcI1GGUe3TVURY/tUjroadr3DKnxTFgG3S2nXdUHlQL?=
 =?us-ascii?Q?XOAAqu7krpV09cp6SZJ22+FRhNdL87Ab4C55XVgycoB/Bjj3+Ko2QfNln9Ib?=
 =?us-ascii?Q?sXDM8IL7VknmEZFJ3K+VZD/Wy30K/Yi9h8z44/D8ssVUFLyfLaJYgV68kYq/?=
 =?us-ascii?Q?MbWsuR1gyj8lFLHIlVXabp9Usy+NzMV3GAB6y8nPT72PZgfg8zJEPs+XDm8d?=
 =?us-ascii?Q?+dxelwrYQ/gopKudy7S7O6vlKZwuRd2opMNibrkgR3zzzcNevhYYavLYgL3R?=
 =?us-ascii?Q?C/BuDHo8L1hh7ZdDuXVYaBuQdDWcNE7WXGGVt2Hp2BGmRCWRGOEw8jGCf2Ic?=
 =?us-ascii?Q?jmwZnIDiMHI/ritEJZwLKzzTi3Ue436Sol8AenrcSsfIQqi2RwEFzsZifoU6?=
 =?us-ascii?Q?RnOJ4cFbUUeRvVjUnrOm4l9fDLC7yOKoCBkBJR7W94OUxTNVOOW68vLudYn3?=
 =?us-ascii?Q?S307XrPQQrJ0UjKo4wZjqG+IxnchdsJ7twVChPAUzKtDz6NUX6JXwJlY255W?=
 =?us-ascii?Q?TI3aFhrPRTL7O3/26oIUqwXomympOLHiQPkPT98n+wv6npBfB9OBYC+01tFw?=
 =?us-ascii?Q?qFMKsJ2xhyyUjykH4i5J+1NJFRAzs7jNv7mpAcjn3xAhHF+kf0z6r6LCYpPo?=
 =?us-ascii?Q?OiA4KixfTcqWYwf88cLwl2MC3T7TRckGRrxKvCMxilHXsZfPixhG1UmLDCLV?=
 =?us-ascii?Q?I9bQYL6UEXLm6x6J9RO1W/NRwt7S0uC11EEl1XSXdwaJgVL2Bi9lwypMErcD?=
 =?us-ascii?Q?O3sqXR5fOesrOkGznwpFVOxlfYQdgdF0w99kYzkhlNs61gmWk1AtgR7n3Dv3?=
 =?us-ascii?Q?GoDz/wX8T+8SuBp7Ag1eeJN6tJO2M5Aos5wuG6+eQmEiAJLAHvYertwC9S2B?=
 =?us-ascii?Q?R8wTuNIrd3cscMtWYwQ4K4qt4pYDRNzSqGN1xSGoOpn78tr8OMDzmry0rxPP?=
 =?us-ascii?Q?eGUAjmX8t9GA3AoSpFkSa4DVVb9TguGJgYxLRBb0qOpRiUhdIvt3FE2LVmZl?=
 =?us-ascii?Q?9bl/9KNXTD5KYu80VT6q+sZDWgGjMhXJAcSxMHcoqYwD8Ia9D7LFtiu2i6/T?=
 =?us-ascii?Q?eeFVscUQdlHUDq8mVVbvB23hAFKMTVk9n9AL2L8Yrr7Xjwp9Y5bbxI9Vww3K?=
 =?us-ascii?Q?aK/+kXrVRt4JMTHVoYqx5D8W+3sh/IF4oNGxPTDnhoxSxUHHM3dwGdiyGKOV?=
 =?us-ascii?Q?rnO9V5dFNNA9tGmsnzEyg3bkSUwBs6lQO6QgzZ7yz+5SkxNrIQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hEu3n+NplpJzPWc8CEahq+c19Y8N29itqvnTzlJk1lTlM+hujnKIeQjJta4X?=
 =?us-ascii?Q?36QT+Su7M0rTMVlMfPMIJ3isnyH/rVad5ZModvxrqZlqO+j+79ckVhC/EoOd?=
 =?us-ascii?Q?ahizevN+shP+7ZkVHweZsFfhVP95ixcdVE5P1b1xjW1LSibMkC1O8lRl023B?=
 =?us-ascii?Q?YbrwMPXpHuloo3l4zmbfjOLMjux07nV2PTe6Dl6ySKO0Qr6ntnVmnxnyFsFT?=
 =?us-ascii?Q?6DxcTOfUtSfuMMdXgIqkwdvIu6SC3tDgIt5+g19xaSdY2d9NzWDxOeJRy20g?=
 =?us-ascii?Q?158VMr1kSHION0y0nDRrumOeQ5XRz7uGVWO89NlQIfuVxeWsWdgKzyvA7mTc?=
 =?us-ascii?Q?uIFBzEPlaK3+WW/p+u8bt2qqqnR1OwE4mPABx7ZPqwCsl9a34oxazS4MxWiU?=
 =?us-ascii?Q?ou6uEGBKxq28kbFsZy+A8giIP9XADDrOdRdYQ5WNtaYtvXb0hQDC6h2fTWx3?=
 =?us-ascii?Q?zC2H3VXmREaKwBeXOXNfAHiEfgjNRdBekkVWFbTog6F3e/Whb0h7wVunDloB?=
 =?us-ascii?Q?BfwSuRKtyef5y3gsBBJwnwD5E5jryeHfr/U4d25fFEArpEXI8VLpEepBK/qo?=
 =?us-ascii?Q?asiiQc3fvTsdY7mDQLna+3SM+IKyS1zqOuOQUNlMw4yrVE4kJX851qR5YDD6?=
 =?us-ascii?Q?+FdWDMh0miSvyjfgsZouQKr2wdVeIuMxLy3YKv4WoaitsLjBDTCeUNDpSZOn?=
 =?us-ascii?Q?qk+41c3jDCOxcxCtdcg68hq3wwqdnWm10GheoAk79I8X6anAGjrdG7hpIBAa?=
 =?us-ascii?Q?IBwGS4O9eY+Y6ZakrFWfB6nnI9+ppk1dWXX1UNcKsDWgf7nda/NjiHozlobV?=
 =?us-ascii?Q?25H313JWbfV8IetxFaqOSN2LSLb/AO98hTNTmOcceGExnbXk+DCu6RetSGKm?=
 =?us-ascii?Q?r5jJBmpvn7YaMDl3yRbVWH4jYsKcxEXOmSAOoAzcrxf70V6NnmXhkI0OqnQu?=
 =?us-ascii?Q?gO96uFvPnxuPLZWIb+Ahoh+K/jayPm4xmAQ1dyeDLG/P8Cl7ymsTLCSlXEQA?=
 =?us-ascii?Q?a1axcO+JKJAmKGCmDTrrYJwAHTHLkNQRJtae0Add7nrwswwZlGCpaPVvtbux?=
 =?us-ascii?Q?CneJvNvuFbpBENvf1fgIdu242S9pKJALg6Xgcrd0HhxKH6D1zj94odQaFdx5?=
 =?us-ascii?Q?o1cweKZiE+2U/9g6OR9b+iwquXdWrp0rzFSqhbJwY6qvYw4zFqRm0Km/bwjj?=
 =?us-ascii?Q?N5VQfH/5967PXy6vdT+MtgCDaY99jn2jhexZKVXpg/1yeIIjvtsHRNzMCjgZ?=
 =?us-ascii?Q?3/9vXCeW/DzsHJ8iZCFuOEdBBDPpNThjlsMcvMMGD7S5hP5h2hXDZsEccGl8?=
 =?us-ascii?Q?MbQVzOFXohDroJmhynlX9+k98bBIrZwy+B1OfYoF/LIEJ/asXyOCteEVftFs?=
 =?us-ascii?Q?Hx+1PngEBImNiHZ1LoAbWJUTopPpTtgpwmhvz2DTEvCGKeK4puzDEa8SpS3S?=
 =?us-ascii?Q?7jAOggTV6bPCbYeHck4c7ZHPUsuHDeJL79nnCri/qagIr4fMjChBc5VZf3Kc?=
 =?us-ascii?Q?Lrlsbo8lQuKKtV2POso7lX4ZMcULc/+oLFVcD/KG1gFCGl+q87zQCNPfqp+P?=
 =?us-ascii?Q?KqbThmT/ricbso4YED4WN47QgwC/ivptQTPfL+nM/CEU12KzZQNjY16Fdlur?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2bfe311-08c0-4848-37e0-08dcbadc1b54
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:36:09.7144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eb2BhAlCQY02OMr6Xk/yhP6pu33tTKEDRe+iSM5Ow4xS0q5y6ga2YIutAXhEH1Y2bQeKFZNHe8BmXWaCpN2x2nx8TRWclQ+C2fsBbVrOIxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6377

The destination buffer flags are assigned twice but source is not set in
what looks like a copy+paste mistake.  Assign the source queue flags so
the 32-bit DMA limitation is handled consistently.

Fixes: ec9ef8dda2a24 ("media: rockchip: rga: set dma mask to 32 bits")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/media/platform/rockchip/rga/rga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 0e768f3e9edab..de532b7ecd74c 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -102,7 +102,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	src_vq->drv_priv = ctx;
 	src_vq->ops = &rga_qops;
 	src_vq->mem_ops = &vb2_dma_sg_memops;
-	dst_vq->gfp_flags = __GFP_DMA32;
+	src_vq->gfp_flags = __GFP_DMA32;
 	src_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &ctx->rga->mutex;
-- 
2.46.0


