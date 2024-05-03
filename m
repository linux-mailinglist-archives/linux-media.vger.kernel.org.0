Return-Path: <linux-media+bounces-10696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 507BE8BB059
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 17:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE8F6286AF2
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 15:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57C815532A;
	Fri,  3 May 2024 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gxVX7x/q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8471552FE;
	Fri,  3 May 2024 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751520; cv=none; b=F28RmZ/TWkrlcvqJGyYWLABcod8uAAZhD7lkhAL7+TmFb8TPsojPp1jApMxnYnUSWNWY+HzuGYJ/bBu+aOH/oqRBHosOhtzPQ9PX3zbzbHN6ULv0+de4iiJcbRa0ncPwIQwZGLSoY2AF75Vrht9Iasy1Xb9jNPFwhwsaVu6QdW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751520; c=relaxed/simple;
	bh=EB6QRFTTEdg6cY8xX5I5zPw/Fit3e0eJvYJpZEBReGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUkjBrQHqrmR7TzoQ/YJXerOtEiAGamciraaQmiXbisps5RxLmKWtCButH5m1b2qVgU4y3kABXQruAXDx4DbcERvFRQTQBzQ6yJwiuW0bpf8G+w7q8oNPGaT+C2hnk1/JwaowoaVdULZ9flWnUwSWOpPdABN1ak2JESUhf/M6zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gxVX7x/q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AADC22B09;
	Fri,  3 May 2024 17:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714751452;
	bh=EB6QRFTTEdg6cY8xX5I5zPw/Fit3e0eJvYJpZEBReGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gxVX7x/qGbE1eQ6EQfzJe2ChHCqTtGVS+ewIerXvx504fUXwGlurqxcy6Kfdu5gNr
	 /19/KoU+XTemlocBCZIKuuIHlkza6pkIUwuEBrBjfCagf2wScZKWIKr5A67cXWJ9gr
	 162lXSzlB8CJZHhJtxKLV7KWskb53lD0aBH8C/vU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 06/11] media: adv748x-csi2: Implement enum_mbus_codes
Date: Fri,  3 May 2024 17:51:21 +0200
Message-ID: <20240503155127.105235-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a list of supported mbus codes for the TXA and TXB CSI-2
transmitters and implement the enum_mbus_code operation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 9da7f6742a2b..219417b319a6 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -21,6 +21,18 @@ static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
 	.field = V4L2_FIELD_NONE,
 };
 
+static const unsigned int adv748x_csi2_txa_fmts[] = {
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_YUYV10_1X20,
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_RGB666_1X18,
+	MEDIA_BUS_FMT_RGB888_1X24,
+};
+
+static const unsigned int adv748x_csi2_txb_fmts[] = {
+	MEDIA_BUS_FMT_YUYV8_1X16,
+};
+
 int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
 {
 	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
@@ -146,6 +158,28 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
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
@@ -235,6 +269,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
 }
 
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
+	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
 	.get_fmt = adv748x_csi2_get_format,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
-- 
2.44.0


