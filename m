Return-Path: <linux-media+bounces-10905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8B08BD31A
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF52284902
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A119F157466;
	Mon,  6 May 2024 16:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vmnck3hG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E91A156F5A;
	Mon,  6 May 2024 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014207; cv=none; b=Yql23yBCkDGT4BE6BH4P5WGIiJJ+WQ0kDUDv2sNZVjhX2fIUSS+jd0XrLfkQPC4kKDP7t/y+62O52UDSpPCKQakxooK5kjaXEonz69a6HZ8/sQV1FKC8m50YDk4PjorupJRnufHhRDrcDO7P7e7czGNerALuS2+BomDuz7xHI5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014207; c=relaxed/simple;
	bh=AzVgKik486AAxavydUnMwN0E/AKlQHE24VbgF7qGTmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsczR3Ovf6Pi3Wyb7qYIlnRypQcQ1WtVHmsv5Md94jnzJfyxysHNaTi8Tcw8YzpkRMIiTTtQOPbKpRd4azrqxtQRRKNwoXDNuLD29eQbCVoPp/WGdmRWnmT3eim3Dy3qFav8S6APPkYGWI7VuZMOj6STtEHrHvmIfKwoy9tNVjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vmnck3hG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCCB112E4;
	Mon,  6 May 2024 18:49:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715014197;
	bh=AzVgKik486AAxavydUnMwN0E/AKlQHE24VbgF7qGTmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vmnck3hGtUqPM8OjF1kkVpRoFLTr+2C13Up8YkYd+eFeQvPa55JZmOIVRawINsPSb
	 6d0yyuZzl61BzeMqw7h9Q3No3o30CNZQ8FZceSudUoesCqkIGjbB9CXbd5vOSYbKBT
	 3poNYOgh62E46FgLPwCeA/C1kIJz5IAmKaqgNCmU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 05/11] media: adv748x-csi2: Implement enum_mbus_codes
Date: Mon,  6 May 2024 18:49:33 +0200
Message-ID: <20240506164941.110389-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
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

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 5b265b722394..4fd6d3a681d5 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -14,6 +14,18 @@
 
 #include "adv748x.h"
 
+static const unsigned int adv748x_csi2_txa_fmts[] = {
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_UYVY10_1X20,
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_RGB666_1X18,
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
@@ -139,6 +151,28 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
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
+	if (code->pad != ADV748X_CSI2_SOURCE)
+		return -EINVAL;
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
@@ -228,6 +262,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
 }
 
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
+	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
 	.get_fmt = adv748x_csi2_get_format,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
-- 
2.44.0


