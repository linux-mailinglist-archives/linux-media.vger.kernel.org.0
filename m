Return-Path: <linux-media+bounces-11224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9628C1283
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C726B1F2247B
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5761016F90B;
	Thu,  9 May 2024 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WW4HZJ7h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B14116F84B;
	Thu,  9 May 2024 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715271268; cv=none; b=u3BJskjhNgpwIYgs7034TOdxDXHam6vu6Wi4cM0dSRWO3yvchAMaIDW/CI+7xaX+dL3VJ+egHUQRcCF09QWfSdaA/zZK6tB6V5N5eYtk5Us5gf8RUBbC+jV4hKtZhguCkAQ2nLm9ZfoP8IDa8uMAtKrMIsZ0TuNodJmEKW2axag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715271268; c=relaxed/simple;
	bh=iViq08jUNSHgBicLYycSVq+/7nVBFXjEyG3kM8K4YF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awazqUIoEeWhJmXkWoSJIbzsKvSkq81JqpEj/dsn84HHmx6/GAis672Os0fuAy50CBE7A5OFRaFLtAPFMQNtDIKNg7kmcW3C1581eMpt5h+yCTta9OHGcMPA8DBZqpAm/CKDCcYsW8h5RbdOtI0ZzlPT4LO6HweQS+rPFQOzIMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WW4HZJ7h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 445062F95;
	Thu,  9 May 2024 18:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715271257;
	bh=iViq08jUNSHgBicLYycSVq+/7nVBFXjEyG3kM8K4YF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WW4HZJ7hvp/izEoqiC4rN/W3l9D/3w6mrI8v20rWzl1MKyOdxFFMdd4o07kECTbRC
	 8BZQBKgmXxULf2z5y0UXotfem3/GGDCd6nR2bmm5Pzg9YtQc2SQbZusR4czKRbK00j
	 YLXR4mFLfqn2H6tTpEjtXyGrGqoxqKQ/mtbPW9ps=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 05/11] media: adv748x-csi2: Implement enum_mbus_codes
Date: Thu,  9 May 2024 18:13:55 +0200
Message-ID: <20240509161403.111789-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a list of supported mbus codes for the TXA and TXB CSI-2
transmitters and implement the enum_mbus_code operation.

The TXB transmitter only support YUV422 while the TXA one supports
multiple formats as reported by the chip's manual in section 9.7.
but the HDMI and AFE subdevices only provide RGB888 and YUV422, so only
list those ones here.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 5b265b722394..29b18b6c8b0e 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -14,6 +14,15 @@
 
 #include "adv748x.h"
 
+static const unsigned int adv748x_csi2_txa_fmts[] = {
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_RGB888_1X24,
+};
+
+static const unsigned int adv748x_csi2_txb_fmts[] = {
+	MEDIA_BUS_FMT_UYVY8_1X16,
+};
+
 int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
 {
 	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
@@ -139,6 +148,41 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
  * But we must support setting the pad formats for format propagation.
  */
 
+static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *sd_state,
+				       struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
+	const unsigned int *codes = is_txa(tx) ?
+				    adv748x_csi2_txa_fmts :
+				    adv748x_csi2_txb_fmts;
+	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
+				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
+
+	/*
+	 * The format available on the source pad is the one applied on the sink
+	 * pad.
+	 */
+	if (code->pad == ADV748X_CSI2_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, ADV748X_CSI2_SINK);
+		code->code = fmt->code;
+
+		return 0;
+	}
+
+	if (code->index >= num_fmts)
+		return -EINVAL;
+
+	code->code = codes[code->index];
+
+	return 0;
+}
+
 static struct v4l2_mbus_framefmt *
 adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
@@ -228,6 +272,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
 }
 
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
+	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
 	.get_fmt = adv748x_csi2_get_format,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
-- 
2.44.0


