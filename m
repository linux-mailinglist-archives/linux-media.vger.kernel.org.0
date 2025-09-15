Return-Path: <linux-media+bounces-42559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA56B57CA1
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 15:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 559D9482549
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E3D31280A;
	Mon, 15 Sep 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WCst6joH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD530C376;
	Mon, 15 Sep 2025 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942326; cv=none; b=HxWnL32n4wlT6YIQaJLdfF6cT3gC7FiiYwNKhBwJHfmo1H6WZj5T9Cjnr3PPdaSR2maV7ImkXQtB4v5BUnyAT0+Xn06H9bay0EVlQDIfoZywogdNUSQoZVw9Dr2FRpGxKJNZchislvskkPexu5EMC1y/vE7G6soP0BMJZrwwtcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942326; c=relaxed/simple;
	bh=ywZiur11oipxoYMdutVTBFOmdw+ZWTNq9HDTBsGjna4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLthgefOoyOAamPuwvs/eVrsTNHt9s4M/obVgKcwrysWa+SNjDrMjLGFTeTo3Ytr6jtTJkmRDuqiZM3MM3er9HwUbpKPuAyeFnw/nzwE128CMPCZ0076PzjzxjmUFvh7+E7Zq7UAXpzfaY3cY9Yp+XfStMsO34Ae2xFFGu3lc8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WCst6joH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8963622CF;
	Mon, 15 Sep 2025 15:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757942241;
	bh=ywZiur11oipxoYMdutVTBFOmdw+ZWTNq9HDTBsGjna4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WCst6joHxuo6OuFbOVtgQGlFY7TFD2OcvpXnXchENNDM61YbWoLSOMCUtF546i3w1
	 BtLs+Nvk7NT6DDzXFd2ssoMtP2idDAI/HqDl8cZe31h8xQKEdjbrUNFquezDXdmRSg
	 DLx0fhc2jJemL4cEVOzQUkMzSDXnvLmJIyAW5NUU=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Mon, 15 Sep 2025 14:18:33 +0100
Subject: [PATCH v3 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-mbus-config-active-lanes-v3-1-97a1282a410b@ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
In-Reply-To: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>, Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0

Sometimes, users will not use all of the MIPI CSI 2 lanes available when
connecting to the MIPI CSI receiver of their device. Add a helper
function that checks the mbus_config for the device driver to allow
users to define the number of active data lanes through the
get_mbus_config op.

If the driver does not implement this op, fall back to using the number
of data lanes specified in device tree.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 32 ++++++++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 21 +++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 6e585bc76367..2ce8407f1397 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -571,6 +571,38 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
 }
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
+
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
+					unsigned int max_data_lanes)
+{
+	struct v4l2_mbus_config mbus_config = {};
+	struct v4l2_subdev *sd;
+	unsigned int lanes;
+	int ret;
+
+	sd = media_entity_to_v4l2_subdev(pad->entity);
+	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
+			       &mbus_config);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		return ret;
+
+	/*
+	 * This relies on the mbus_config being zeroed at init time.
+	 */
+	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
+		return max_data_lanes;
+
+	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
+
+	if (lanes > max_data_lanes) {
+		dev_dbg(sd->dev, "Active data lanes (%u) exceeds max (%u)\n",
+			lanes, max_data_lanes);
+		return -EINVAL;
+	}
+
+	return lanes;
+}
+EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /*
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 0a43f56578bc..6af0695460ab 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -584,6 +584,27 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 	(pad, mul, div)
 s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 			     unsigned int div);
+
+/**
+ * v4l2_get_active_data_lanes - Get number of active data lanes from driver
+ *
+ * @pad: The transmitter's media pad.
+ * @max_data_lanes: The maximum number of active data lanes supported by
+ * 		    the MIPI CSI link in hardware. This can be configured
+ * 		    in device tree.
+ *
+ * This function is intended for obtaining the number of data lanes that are
+ * actively being used by the driver for a MIPI CSI-2 device on a given media pad.
+ * This information is derived from a mbus_config fetched from a device driver
+ * using the get_mbus_config v4l2_subdev pad op.
+ *
+ * Return:
+ * * >0: Number of active data lanes
+ * * %-EINVAL: Number of active data lanes is invalid, as it exceeds the maximum
+ *	       supported data lanes listed in device tree.
+ */
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
+					unsigned int max_data_lanes);
 #else
 #define v4l2_get_link_freq(handler, mul, div)		\
 	__v4l2_get_link_freq_ctrl(handler, mul, div)

-- 
2.43.0


