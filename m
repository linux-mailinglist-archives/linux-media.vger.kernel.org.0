Return-Path: <linux-media+bounces-36733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62259AF8396
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 00:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB62B7B4355
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C082C08C0;
	Thu,  3 Jul 2025 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MQJrhaDj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A402C08CC;
	Thu,  3 Jul 2025 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582355; cv=none; b=cIduCQ0ww3vd3LE6NHbLUuNJbxj1VvGwXXYSKx/BAanAevY0SYOqQQPFHdt3wvZ+IXcSJnyla3rB0VTVR0rQbh4gYLF3UCgNQTtlO/aGGROc79hHPm/I1dUwQMN75QorYPa81WBuwmjVPKCb2Rj6WCKgalQLfUVAMXH0xHVlgYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582355; c=relaxed/simple;
	bh=HBitOO9Od7hEvpquEDGzdav4G25wyNObNjbNHUj10Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2W6E7r8uoyflAFnQz6y7Z+UI/5rzTS8B1yFurxmUSRCuE4uVwQr8GLlLhI/AVbTZ+xdX22hCdcwL2tpLTQK+I13b4bQLyoXpCFz48mVTmM5Y8dC7wBv2pTKJLjnZo91bZcDirAdVKc/BvKvSTq8YCamhW2X/89FCTL+zxgKrn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MQJrhaDj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8B90B667;
	Fri,  4 Jul 2025 00:38:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751582320;
	bh=HBitOO9Od7hEvpquEDGzdav4G25wyNObNjbNHUj10Nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQJrhaDj2M4PjDFB7vscf29E43yRNN8wrWaEmeGfgrxXLD+SC6h3UehrVrMIOroFI
	 EicQDDFHT3LwyzGdfcUFSnFEAluzBP/QwSuKHY/HEGviMpGZOeK09qwgsWkP/v470K
	 rheSE6Sq309ZILUoLaxCNWYfulB+0QDo2e9vMM8I=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 6/8] media: renesas: vsp1: Fix RWPF media bus code and frame size enumeration
Date: Fri,  4 Jul 2025 01:38:24 +0300
Message-ID: <20250703223826.10246-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703223826.10246-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250703223826.10246-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RWPF can't freely convert between all input and output formats. They
support RGB <-> YUV conversion, but HSV formats can't be converted. Fix
the media bus code and frame size enumeration to take this into account
on the source pad.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
Changes since v1:

- Replace hardcoded pad number with RWPF_PAD_SINK
---
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 80 +++++++++++++++++--
 1 file changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index ccc7608f538d..c9e6fb98f863 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -18,29 +18,97 @@
  * V4L2 Subdevice Operations
  */
 
+/* Keep HSV last. */
 static const unsigned int rwpf_codes[] = {
+	MEDIA_BUS_FMT_AYUV8_1X32,
 	MEDIA_BUS_FMT_ARGB8888_1X32,
 	MEDIA_BUS_FMT_AHSV8888_1X32,
-	MEDIA_BUS_FMT_AYUV8_1X32,
 };
 
 static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= ARRAY_SIZE(rwpf_codes))
+	struct vsp1_entity *entity = to_vsp1_entity(subdev);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *format;
+
+	if (code->pad == RWPF_PAD_SINK)
+		return vsp1_subdev_enum_mbus_code(subdev, sd_state, code);
+
+	state = vsp1_entity_get_state(entity, sd_state, code->which);
+	if (!state)
 		return -EINVAL;
 
-	code->code = rwpf_codes[code->index];
+	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 
-	if (code->pad == RWPF_PAD_SOURCE &&
-	    code->code == MEDIA_BUS_FMT_AYUV8_1X32)
+	guard(mutex)(&entity->lock);
+
+	/*
+	 * The RWPF supports conversion between RGB and YUV formats, but HSV
+	 * formats can't be converted.
+	 */
+	if (format->code == MEDIA_BUS_FMT_AHSV8888_1X32) {
+		if (code->index)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_AHSV8888_1X32;
+	} else {
+		if (code->index >= ARRAY_SIZE(rwpf_codes) - 1)
+			return -EINVAL;
+
+		code->code = rwpf_codes[code->index];
+	}
+
+	if (code->code == MEDIA_BUS_FMT_AYUV8_1X32)
 		code->flags = V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
 			    | V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
 
 	return 0;
 }
 
+static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct vsp1_entity *entity = to_vsp1_entity(subdev);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *format;
+
+	if (fse->pad == RWPF_PAD_SINK)
+		return vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
+
+	if (fse->index)
+		return -EINVAL;
+
+	state = vsp1_entity_get_state(entity, sd_state, fse->which);
+	if (!state)
+		return -EINVAL;
+
+	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
+
+	guard(mutex)(&entity->lock);
+
+	/*
+	 * The RWPF supports conversion between RGB and YUV formats, but
+	 * HSV formats can't be converted.
+	 */
+	if ((format->code == MEDIA_BUS_FMT_AHSV8888_1X32) !=
+	    (fse->code == MEDIA_BUS_FMT_AHSV8888_1X32))
+		return -EINVAL;
+
+	/*
+	 * The size on the source pad is fixed and always identical to
+	 * the sink pad.
+	 */
+	fse->min_width = format->width;
+	fse->max_width = format->width;
+	fse->min_height = format->height;
+	fse->max_height = format->height;
+
+	return 0;
+}
+
 static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *fmt)
@@ -281,7 +349,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 
 static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
 	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
-	.enum_frame_size = vsp1_subdev_enum_frame_size,
+	.enum_frame_size = vsp1_rwpf_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = vsp1_rwpf_set_format,
 	.get_selection = vsp1_rwpf_get_selection,
-- 
Regards,

Laurent Pinchart


