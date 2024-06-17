Return-Path: <linux-media+bounces-13463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4D090B5E2
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2A841C2303D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 16:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49190DDDA;
	Mon, 17 Jun 2024 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fjQ/LZOp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE0F9C9;
	Mon, 17 Jun 2024 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640731; cv=none; b=LvJJB3SfSopEonfzNqCg/edvFyEctnrRr5wjzVDulSjS9a5N+L1OAuzjfa72T361NGxIi00DMyDYPXNMkezCgk5H6d9uI2H44+D7T3x0uxBAEFja47o7MkxDMAo9gJYinmPSuRHPAC3gGmNMmwiXB/3QoQJn3/dRXzWHCBXoMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640731; c=relaxed/simple;
	bh=ss7AzAKSCu9iwRdhq+4itF2Cv9LkOVxmBZRmmDGlw2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VH263PnqEFQv0fsQZBl3hJNYtAOtIU5krDnGx2TLSMPkw01TgenYouJEIvlzh1cogWqCSwUzmupPgDHkxQ3Hk3SwuHBo3EHew1o+sdeOapTCnU4LPmZaq1iPaulBN87J72XAwdF1OQ4UE15G7e1WhqqeaFUojZqLmFgIMzCrcKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fjQ/LZOp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B48B7FDB;
	Mon, 17 Jun 2024 18:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718640704;
	bh=ss7AzAKSCu9iwRdhq+4itF2Cv9LkOVxmBZRmmDGlw2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fjQ/LZOp0VdGS0r34CjfDPTlXpESsXcrzqEx3lRDCxrzm7zsJpfhOSxqSjTHELMrq
	 X9m3zA6/J36oSR8I7uKWJ9SkdmkxYQ+RRm0Kv61HEnG3Xh9U1zCfpaxCDLJej3Ug9B
	 1P13HrlBBeqBnI/CgoX3UB9IxJaxnPxQlo3J2i9E=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 05/11] media: adv748x-csi2: Implement enum_mbus_codes
Date: Mon, 17 Jun 2024 18:11:28 +0200
Message-ID: <20240617161135.130719-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
References: <20240617161135.130719-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Define a list of supported mbus codes for the TXA and TXB CSI-2
transmitters and implement the enum_mbus_code operation.

The TXB transmitter only support YUV422 while the TXA one supports
multiple formats as reported by the chip's manual in section 9.7.
but the HDMI and AFE subdevices only provide RGB888 and YUV422, so only
list those ones here.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
2.45.2


