Return-Path: <linux-media+bounces-37987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A25B08B29
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 775CA1C249C0
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4436F2D94BF;
	Thu, 17 Jul 2025 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lMH6BjkN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F22D8391;
	Thu, 17 Jul 2025 10:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749183; cv=none; b=lCkgQ1xYftcWN74yyNlt3xoYpTftFz2PW/ee3si1nHCBsIjeIubsbjMTsVCYWqM/MjpXl9wU9hT4iW3RBRADTLXdY3Mwv0KzfxBc7l5SWDX9LzLVinBCkWrN1FUP/60ksu7sT1oXXROHK2FwWPJoJ03B8q3Vu3GBByxHXMv3JjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749183; c=relaxed/simple;
	bh=9aZhUEi8nzk0nQ1lg/OYG7ZJZJnqA3OQHgxh4Ti+sSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWZzp+k+2Wlh8TDzV5JkVT4l49xbMXfVB5dVl/K/iEblUPm/7fV3SImTnD/0FWFAizJl5pjz63Oj2rPUxd67Bswt3MK4H8PqDPE71UkJEApMvsLViy9WDFM3vscOuVw1iLsQ6/mLvLu1MTVTaYBikuxt38748LIPwg50xWkNSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lMH6BjkN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AF2C1E74;
	Thu, 17 Jul 2025 12:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749142;
	bh=9aZhUEi8nzk0nQ1lg/OYG7ZJZJnqA3OQHgxh4Ti+sSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lMH6BjkNJfBOxwgNQfFoFlDmJyVde8+lHri01kln6JgFe7kf4uq6RWQWnNq+MIDBT
	 PM9kBe0e1b16Ej8L8uqmqRPz5jHnVJNKV5gmxP6y2HBOYj1/jHj5z5A1RtNcDnvDx0
	 JBLbUklElR/VldW0dozOFWdWxUXYldqIumwveGaQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:48 +0200
Subject: [PATCH DNI 22/26] media: pisp_be: Add support for subdev state
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-22-81ac18979c03@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=9aZhUEi8nzk0nQ1lg/OYG7ZJZJnqA3OQHgxh4Ti+sSs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRRVJywCBAo7BIzYjV82f8QM3uGxHTpYi2Rt
 C39bakUCimJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PIFBD/4uLBHQuvpaSyM6QrS1Mwp9UC008FWTYRM5RQrbx+5/10SzLLpWWEjsismkOyWFAe+ld5N
 97fTwHqiVHEIne/j+39cXN3J2Dyb+4DYRTfeaG8poBPhLsBQexXvsHlehsMKTN2cUrjqqdC3P+L
 Go8W3IqAV3hirQDAGN0Y78z/DWu7XbAFwZtdDd1Y2GosdLfw9x1WI2Cv6Lu0ZvS1jB5MTBdzpvk
 y/WpbOmSDvxMRHzdYWiLxcE3wrYBEK6LNk939H5Zbu3Tx6GGHGnn4KwwcQIuuw3CfB00l4Vamv5
 ebbkBRD3gBn7QWJ21KQySTiv2i9c9gq3dWDTevk9I8dfzzlU1ggpotKjZG5butVooPSFuB9Vefi
 bF81TLpLk+gvQY+X34EyxD6bkrfmeVGcz0gl2bn1oN8ndw9/IC9hMaWCwmSHtsJBoo1L+kqacaO
 KSp1M/qgLLkOgTBfzKG84OI3W9NlEqqMDUrikaOUCAhzb1qOFiAIjqBXPoDn7epL6bo6wBkOqs3
 RzCqVC4qf1wOLsDjs6j63CuprP29p+KbnkcYPAlGgbw4P3VGS19TVWsCmFcvA9bwhYpaw3jsP0c
 +0bCV7MiA/zb8Kk8g2+eytbe4vvjLzmsFVgT33leutuwIASJKTvuXLTewSX40hJ0/Gazhyw+qPu
 KzBIVTUKJJYVbNA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add support for subdev state in the ISP subdevice by providing an
init_state() callback and by calling init_finalize() before registering
the subdev.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 423cb21298309c2ba51214b129fbf6e875370c98..5aec4f8979053500c870e71ce7171bbd1cac9606 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1496,12 +1496,49 @@ static const struct v4l2_subdev_ops pispbe_sd_ops = {
 	.pad = &pispbe_pad_ops,
 };
 
+static int pispbe_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
+		fmt = v4l2_subdev_state_get_format(state, i);
+
+		switch (i) {
+		case MAIN_INPUT_NODE:
+			fallthrough;
+		case OUTPUT0_NODE:
+			fallthrough;
+		case OUTPUT1_NODE:
+			fmt->width = 1920;
+			fmt->height = 1080;
+			fmt->code = MEDIA_BUS_FMT_FIXED;
+			break;
+		case CONFIG_NODE:
+			fmt->width =  sizeof(struct pisp_be_tiles_config);
+			fmt->height = 1;
+			fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+			break;
+		default:
+			/* No need to configure other nodes. */
+			continue;
+		}
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops pispbe_subdev_internal_ops = {
+	.init_state = pispbe_init_state,
+};
+
 static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 {
 	struct v4l2_subdev *sd = &pispbe->sd;
 	int ret;
 
 	v4l2_subdev_init(sd, &pispbe_sd_ops);
+	sd->internal_ops = &pispbe_subdev_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	sd->owner = THIS_MODULE;
 	sd->dev = pispbe->dev;
@@ -1517,6 +1554,10 @@ static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 	if (ret)
 		goto error;
 
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto error;
+
 	ret = v4l2_device_register_subdev(&pispbe->v4l2_dev, sd);
 	if (ret)
 		goto error;

-- 
2.49.0


