Return-Path: <linux-media+bounces-38408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA176B10D00
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EE61188EF28
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98E82ECD31;
	Thu, 24 Jul 2025 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h+ht9XLw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D9B2EACEF;
	Thu, 24 Jul 2025 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366273; cv=none; b=N5/aorm6lQZQXsm5XhuKfLbp9epboIMd1WXdLoJMTNF5+54TobNFleu3rGut2e5+h+L5jbAa4Lw7IRBQPw/CYr/ctLj2IJTT7M5cigxOCKClh3sdSLFLvlbrQYeoazB7xD+fsAcVutrbDDbmii1eLYXF3BM1ULwY5ex6vQuCy8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366273; c=relaxed/simple;
	bh=YyXmr6Wtr5A4ih2ag5qo99kLDMbBWLONqHu1vyrmcVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXSDgGEZcMoZ+Wz5lZht9hWjOgEwx0Tn88daEgooljtkc6W+SYguR9xuT0r4n/4y1p0bywe/F4oXPKHz6LWmocDgindKjRAVgviRBbFddazMMue+FrjaeqomXjSy2dqOrA6/nwi8Lgji/DE5JDbFBnKA2EJcFXdfm61CUNt0Ty8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h+ht9XLw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94EBAC64;
	Thu, 24 Jul 2025 16:10:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366217;
	bh=YyXmr6Wtr5A4ih2ag5qo99kLDMbBWLONqHu1vyrmcVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h+ht9XLwnR7UUmgO5C1AnL/fmYRCmYCmDKsEl4ajfFSsNUFW/vKCksTmj00tKoXNZ
	 XmVRYnAutmBWI+AAIXuys8VnL05rd7n5Zu1h0LZsZCEMmhXwh5gByar/62zTFgV+bu
	 4Ci1jWtb3K76SoOaZ3gXHz0MghHEvgo7Uk+hdolI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:31 +0200
Subject: [PATCH DNI v2 24/27] media: pisp_be: Implement set/get_pad_fmt
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-24-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7R60gOltUMYV82hQEHCOM7Z9Qxe0nMqQmWx
 fEVl6pPqgGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0QAKCRByNAaPFqFW
 PHkCD/9qdD97ai0c7MCMnH3YjlFvnHU4m+d7AKDsxdcHUkaQC3fNm0Vf5s7ThTfX8ag8sil/2SR
 p1LfNxyGmzquhg+qI1Nl26LHi4DdSSXrxSk+/O13c0pKG6cIvoWit0DtnW4eGmX+ju7Q9t09fN8
 V22Eheu5sYjw0Cyi+C5PQU1VQGt3iow9/VXWVwPwuaQNgD16CvIVjkVLNiQZ1DXHMoafj+Plru1
 sIlc+fimyMZphtvb8CfrAvnKCCyY+nfKx02gNqgo3xN/cO6sOmbzjSI45F6gjBRSwcwPga+oub5
 93Az+XiI8+BJEs7XMy/yBLmBTvyXgX882Ge61o+49nuTnunSnpj7NqSg5vRhQTAKXjK3TvkkBOb
 FHOeo8HlR5V2dsXuR+ueC4q8u1RVNb/7f0JBWUNMdcybKpt392/G8++fRnYIgw44g2o36V3VnxG
 D25Ty2DGKhxyxJ/T/EetSfMEUhyT23/a0jVjkMggNb6/EkE9WiT42WZkywHDVRAR+NvYLLmM7KD
 sCaDuCzNPhUubYTXxyO25NaALJ/oZyAE4vVYpv6I/82FRO0E6RqeoqQImOpF+EKSxjdssqF+RVI
 tgg+l012YM4Qeo5fxrQiY8JdcW7Ly50ejzQ9hstqd+MfSfSHHeExGy9QY9VoThzdMMrDAyIw5ij
 DNh9e56xdOx2BAQ==
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


