Return-Path: <linux-media+bounces-43203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C1BA07CC
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A82DF3849E3
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EE4305077;
	Thu, 25 Sep 2025 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mcs2YirO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE74F3019C1;
	Thu, 25 Sep 2025 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758815733; cv=none; b=eN52amSnVXYcl9msp02J2I+XytG8LFY1R1WwxK/Pb7AHlXOGd60aDezFEs67tjgw8/pTeY3ZfWxxEgac73dJASO3mZ+9iTyfYsKyTX0majW5e+cLVVQdX+Z+sWcO/uhuRH8s6bV0m9prb7WXJ35GWhK0EtLQskxTyDK2l363GZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758815733; c=relaxed/simple;
	bh=0eohwAR/y++4oPMxRnpqozTlsghcWn2K5MPx0wPe8gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1MElmGt3GfPibKirGZUJwQbUQXTY+BdGWsiuJl5IrFADTrnoMFbTyoNgGNK2AIvNAzVPFW6+er6jHWDv5ZbxgiLhIsm5zhQhWAdtqH1fihPctT/r+/RfIETg1oRnumOAa1KAuw9jfCJqegu4ufUlsOqboOJ6wLoVWzG51OPgKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mcs2YirO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 628B21D1C;
	Thu, 25 Sep 2025 17:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758815642;
	bh=0eohwAR/y++4oPMxRnpqozTlsghcWn2K5MPx0wPe8gg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mcs2YirOd9cwzKG03SPsBv9Hu8SCoekmPeGuYhxWzmjddYDdUZlXWueul6Gl41IYx
	 OlSU4tm4LTT8NyUg7pGfK2BAw7s9Sznpt2dx178Xg0suyV0meuVCt35XXyToGzG51e
	 Xy1ALGMN1+X/f0UGnFoTTnMuTD/J6JnE42tAkOCY=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Thu, 25 Sep 2025 16:54:26 +0100
Subject: [PATCH v4 1/4] media: v4l: Add helper to get number of active
 lanes via a pad
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-active-data-lanes-v4-1-8b54e3d5af6c@ideasonboard.com>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
In-Reply-To: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0

Sometimes, users will not use all of the MIPI CSI 2 lanes available when
connecting to the MIPI CSI receiver of their device. Add a helper
function that checks the mbus_config for the device driver to allow
users to define the number of active data lanes through the
get_mbus_config op.

If the driver does not implement this op, fall back to using the maximum
number of lanes available.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 29 +++++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 20 ++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index b367d479d6b3..2b4cec25e751 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -573,6 +573,35 @@ s64 v4l2_get_link_freq(const struct media_pad *pad, unsigned int mul,
 	return v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
 }
 EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
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
+	/* This relies on the mbus_config being zeroed at init time */
+	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
+	if (!lanes)
+		return max_data_lanes;
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
 #endif
 
 /*
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 5c0a7f6b5bb6..950df46cb27a 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -581,6 +581,26 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 #ifdef CONFIG_MEDIA_CONTROLLER
 s64 v4l2_get_link_freq(const struct media_pad *pad, unsigned int mul,
 		       unsigned int div);
+
+/**
+ * v4l2_get_active_data_lanes - Get number of active data lanes from driver
+ *
+ * @pad: The transmitter's media pad.
+ * @max_data_lanes: The maximum number of active data lanes supported by
+ *		    the MIPI CSI link in hardware.
+ *
+ * This function is intended for obtaining the number of data lanes that are
+ * actively being used by the driver for a MIPI CSI-2 device on a given media pad.
+ * This information is derived from a mbus_config fetched from a device driver
+ * using the get_mbus_config v4l2_subdev pad op.
+ *
+ * Return:
+ * * >0: Number of active data lanes
+ * * %-EINVAL: Number of active data lanes is invalid, as it exceeds the maximum
+ *	       supported data lanes.
+ */
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
+					unsigned int max_data_lanes);
 #endif
 
 void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,

-- 
2.43.0


