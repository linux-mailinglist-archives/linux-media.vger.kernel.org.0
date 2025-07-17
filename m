Return-Path: <linux-media+bounces-37988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D69DCB08B2C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C09958583E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EE72D97BB;
	Thu, 17 Jul 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uiwxmilU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC422D8DA4;
	Thu, 17 Jul 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749184; cv=none; b=KCPBi9Yys/i4JqQ38n35/b6ZSTooaxZBy2CqAfOJqPUSp/QTme7dcxkHuKM3GNL30oR1y4I3qWIqLMmno8GyWtQtG9tkz+Kgb56FebS+hABW2uyCgqHBaxR8OYMXAtmwmjxt82OIPg1Th7QifeHH8/iF+vzHh1WEVWX8HEKWyCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749184; c=relaxed/simple;
	bh=YyXmr6Wtr5A4ih2ag5qo99kLDMbBWLONqHu1vyrmcVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2cetHZ6nxEsT2Ku4Vd609c/V07AeowFxo8BunSJlYrcn4QW0+SjwaRoAk378r8+XmKnXr1G3t9GhF+I86VclkEO32iQTHYor6qcUism5Ubfaxpi0+mnzVXLwBz/gLjrE0qphW/LlJR+dTXwxOQJblv5TIJ4+qrgmxQe3yOKh9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uiwxmilU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7D201AE2;
	Thu, 17 Jul 2025 12:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749144;
	bh=YyXmr6Wtr5A4ih2ag5qo99kLDMbBWLONqHu1vyrmcVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uiwxmilUyeUwUbhXT+Z3DOUylJFzWaOUMiyPqvYTUp4+ecDcr2ZRpyrJJ/pClK7EP
	 HC9VLTioj6+n9rvkpV7bdvKWoF7FHTjE4wDOpktqUwrNqJmS2Etgzw5wAfkf9kTtL7
	 2rYDY8h6AG3srtfYxn3SaqJT9Ma2qMdDM8ZZUPDA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:49 +0200
Subject: [PATCH DNI 23/26] media: pisp_be: Implement set/get_pad_fmt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-23-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=YyXmr6Wtr5A4ih2ag5qo99kLDMbBWLONqHu1vyrmcVI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRR446grg45jSOazWmLg7XRPDLLG/B80g+S+
 8a4h6emRMuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PHIcD/4nIDePGNOBSTZXua3WG5IPv5k4ZIU7nI1QDA4K1hbYrxMBgTT4OSo+Cme46A2XAe1vzgU
 nweba/418w7v34UBvBbQuVKa4HnWC1apjPZYAQ9QNkYkVXBSDeMoApB83UvIBgYzqpSzB4msTy+
 HrvY4dzEVVNe7RrFUbtJJf313vzRfKcaEUtLz5JXE+CtdXLhv+iRLl3hovKuWv0Tpl9xw9cw0ca
 JyrLlnLiQ6/wfQaDdOe7obChvMgeErN9tv/8OEV4T56RCcGABsDlRJQAlRx1649PkLmuoxOD3ln
 cqeeVKdT9xjK0oFihEJtCvGJISxv11x2QfV6xjQpDg/EDMZ73SJC1zMtGcF0FEPGEOg2PCb8dAd
 jvx55GGnAfoc3PBl1+/Vu+q0H9GutBmNVhhMq4gdStnXr5GnfWu/D0TmdiJQtdG92/yBg10EClw
 3uq0nvKh6JaITdRdIyDCzLI0ibnmH7nzVkvDC/KrhS3rhgw8GxxIfUWjk25Z6Db2q1bqRwx48DP
 HzCx0YF8z1KT0j54/+RxGp1w6pg3X/I7MvFtjFG+np8fRhvqXTBy2ZDYJhUd8LW2056qo0P+uf8
 ZS1Bgt5F2kzwSWJL9GLjF3uz95lO1uyk9wihRscneEATpBN2VPzjLBgwFJkanvsR8NjRC/1aGDp
 i6TdcGazjri2pQA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Implement operation handlers for the set and get pad_fmt subdev
pad operations.

Format is only modifiable on the image nodes (of both output and capture
types). Only sizes can be modified.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 5aec4f8979053500c870e71ce7171bbd1cac9606..22e440f387b5e5560b2cc80a8b3bf6064dc12d7c 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1488,7 +1488,36 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 	return ret;
 }
 
+static int pispbe_subdev_set_pad_fmt(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+
+	/* Only allow setting sizes on the image input and output pads. */
+
+	switch (format->pad) {
+	case TDN_INPUT_NODE:
+	case STITCH_INPUT_NODE:
+	case TDN_OUTPUT_NODE:
+	case STITCH_OUTPUT_NODE:
+		return -EINVAL;
+	}
+
+	fmt->width = clamp(fmt->width, PISP_BACK_END_MIN_TILE_WIDTH,
+			   PISP_BACK_END_MAX_TILE_WIDTH);
+	fmt->height = clamp(fmt->height, PISP_BACK_END_MIN_TILE_HEIGHT,
+			    PISP_BACK_END_MAX_TILE_HEIGHT);
+	fmt->code = MEDIA_BUS_FMT_FIXED;
+
+	*v4l2_subdev_state_get_format(state, format->pad) = *fmt;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops pispbe_pad_ops = {
+	.set_fmt = pispbe_subdev_set_pad_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
 };
 

-- 
2.49.0


