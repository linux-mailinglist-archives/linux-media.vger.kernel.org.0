Return-Path: <linux-media+bounces-10438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE008B6FE3
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9CCF1F23E47
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD5C12CD98;
	Tue, 30 Apr 2024 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ozG4K/sn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3196212C46D;
	Tue, 30 Apr 2024 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473636; cv=none; b=VPZDojJue8dM8jMkVxpaKL//dWeRhrdLDGKTxVgyEPXRw6qqHGvh75vKpTjLi01tcaEUR98sepBAMS+vHB03XIBm+Xz6r6HWHpNlKbjORmBXdjXfhAheomOq8AFcH5f42u7hxgmmIs209LdMaHdXPA4RDdcBotVRReROSttb3zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473636; c=relaxed/simple;
	bh=ZfdS6T3ZhCoSiaEh2zJX8ksVMuq9Mb7o6E5mxBtVy4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ay1cXaBjeh8HSKv86BDBHQbx0xTZPAs8OVzndKg+G3uQ6jpyQwB1ME5bNbHATGGhPtpYCnWx0CDbrKcHwsvwU/k9N2bMTqPWCOlRxFmQQWkNHQbJzFaN91mG2ZiYfp3l+vh3yDcli0SguXAKt0PDSTwmWkQpfs2EQZqLjLogrBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ozG4K/sn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C48B9DFB;
	Tue, 30 Apr 2024 12:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473564;
	bh=ZfdS6T3ZhCoSiaEh2zJX8ksVMuq9Mb7o6E5mxBtVy4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ozG4K/sntVPDfrpQKeiPTA3fsI4SbZQylgGEJ1Z/+v/oQweNH2kFMSO7HSIIXJeP2
	 TyJ1+s8rtpBke7P7dP5NhZibAmwZKTz1ng220ELr0eljwFcXyirICQc8/WTs6tGVmZ
	 +LtnHLw4+D1/Hgc7wU/8cTPNaWO5W4RnAlJmox10=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 14/19] media: max9286: Implement .get_mbus_config()
Date: Tue, 30 Apr 2024 12:39:50 +0200
Message-ID: <20240430103956.60190-15-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the .get_mbus_config() operation to allow the remote receiver
to retrieve the bus configuration.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 0e08a1041eed..a71f0aabd67d 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1072,6 +1072,20 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int max9286_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
+				   struct v4l2_mbus_config *config)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+
+	if (pad != MAX9286_SRC_PAD)
+		return -EINVAL;
+
+	config->type = V4L2_MBUS_CSI2_DPHY;
+	config->bus.mipi_csi2.num_data_lanes = priv->csi2_data_lanes;
+
+	return 0;
+}
+
 static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				  struct v4l2_mbus_frame_desc *fd)
 {
@@ -1127,6 +1141,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
 	.enum_mbus_code = max9286_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= max9286_set_fmt,
+	.get_mbus_config = max9286_get_mbus_config,
 	.get_frame_interval = v4l2_subdev_get_frame_interval,
 	.set_frame_interval = max9286_set_frame_interval,
 	.get_frame_desc	= max9286_get_frame_desc,
-- 
2.44.0


