Return-Path: <linux-media+bounces-45220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2879FBFB628
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 12:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C74E3583053
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F716322A24;
	Wed, 22 Oct 2025 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qluBMNrA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58EE258ED1;
	Wed, 22 Oct 2025 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128559; cv=none; b=pAgTvn67tr45vY+MYHvLutRsH3YZaCZMottGu5pUpDLsJxNP9PoUD8BksdrlWJwUZUg9LcfamN3en7aMScnUtAKz7t3EQvnkGYf77iKbYfh6z8eWHxi6osSWBB8zjGOaUQaAwf2Uw5ZgPluPJ9352wxNoLUhG4f2kSeFqFNqrNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128559; c=relaxed/simple;
	bh=Snr3gpZ7+iGBKLCS7AvL2UYxmpcLXIBEkGrG9qyjAbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUYg3edwy1S8yuouTKEGQqFX0K4mhU9R/DxHZGyYRWfj/s936Mv5Rf9brgl+jNin3/gnIKGJ3YuCSgboGrMDFuqeBXGLkhF59IQ+tJgrYeAE0sVusZ5CxdAXfn17sOolox3H3d7R3QrlshqTA27MqEwE9jcHkm1u0PkZdiHnUkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qluBMNrA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AF8C8FA;
	Wed, 22 Oct 2025 12:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761128451;
	bh=Snr3gpZ7+iGBKLCS7AvL2UYxmpcLXIBEkGrG9qyjAbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qluBMNrAEWD4GTaCR5h+4JCrn7OCRdtwCHPbVa/lr23RVBmDuj/mwIfP/IQSjESQn
	 Y0E/Mfz/qtSlVx9L669LIXwJMPjcrzsxSTDNH8NEKZTA1NRtLRuYatWDNorpSBtcCQ
	 4bThNWWYnm5xhtQHJx77QMCYcu7KKP/DoCjuJExQ=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v5 1/4] media: v4l: Add helper to get number of active lanes via a pad
Date: Wed, 22 Oct 2025 11:22:25 +0100
Message-ID: <20251022102228.275627-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 drivers/media/v4l2-core/v4l2-common.c | 29 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 20 ++++++++++++++++++
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


