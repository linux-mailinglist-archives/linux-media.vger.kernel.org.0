Return-Path: <linux-media+bounces-41657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C769B41BB7
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DB635E3C6C
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F702F0666;
	Wed,  3 Sep 2025 10:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aTqTeDd2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA12EA14A;
	Wed,  3 Sep 2025 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895001; cv=none; b=GL4cUn7mDQygEUn+Ajwt6UpFWofjAkEskhupF8O800P8f2DiKYqLAa68/88UqZ2XEvLsd3iCORmcxufeeRWo2uHePsXb6hn71GLAS47SPPSKZ0NopkmEG5C3OIb+Fi3C84cnIRgQC1lMbGE/vo34qrhbXNHNZVKax1SrknOiGZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895001; c=relaxed/simple;
	bh=m7VoVORCRPmE9sJDD1t63RnEi0k7Sc7WqvjsbxvaBpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RnH/tVyKj2y/5mpoYkd3URv1S/ZWL5DojE3cZqLm1f6G/9q6jqKpSpo8cFlF94tXjB0tE71GyPjRwkssZ6KAHL19YsCggnqYOWoM9YgzaDNOBkcPDBvQM/fyWyePcRgkJnQHEhkMH5LQBqvRZCcVR1KDzTIoHNtyQV+uaqnEhtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aTqTeDd2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A6CBC6D;
	Wed,  3 Sep 2025 12:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756894926;
	bh=m7VoVORCRPmE9sJDD1t63RnEi0k7Sc7WqvjsbxvaBpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aTqTeDd2KK/HXBeiT9CweKPF0VShHez7ziwt5AHJpFXKXX/Xcgha5IP7J6HaQ9Cd7
	 +gnK4FOmCbGTrk8By0o6cwMY6gd3MB2A4+qlm4JjT5EqnaAnSeovwEhnDkplr1jcbI
	 Vxhp7/HC7UwJe0mM1KzLtTk+qPZoequlPF7NdTHU=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil@kernel.org,
	nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se,
	dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com,
	mehdi.djait@linux.intel.com,
	niklas.soderlund+renesas@ragnatech.se,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 1/3] media: v4l: Add helper to get number of active lanes via a pad
Date: Wed,  3 Sep 2025 11:22:40 +0100
Message-ID: <20250903102243.1563527-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
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

If the driver does not implement this op, fall back to using the number
of data lanes specified in device tree.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 25 +++++++++++++++++++++++++
 include/media/v4l2-common.h           |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 6e585bc76367..8683107b3704 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -571,6 +571,31 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
 }
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
+
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes)
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
+	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
+		return dt_lanes;
+
+	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
+
+	if (lanes < 0 || lanes > dt_lanes)
+		return -EINVAL;
+
+	return lanes;
+}
+EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /*
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 0a43f56578bc..3f8937260c76 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -584,6 +584,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 	(pad, mul, div)
 s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 			     unsigned int div);
+unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes);
 #else
 #define v4l2_get_link_freq(handler, mul, div)		\
 	__v4l2_get_link_freq_ctrl(handler, mul, div)
-- 
2.43.0


