Return-Path: <linux-media+bounces-39912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217AAB26471
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 13:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35C75887F47
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 11:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C684B2F39C5;
	Thu, 14 Aug 2025 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DcZYdkyJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4412E92D5;
	Thu, 14 Aug 2025 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755171516; cv=none; b=G4LQn1eAr9+OBAx4MtVlrGVVrjRMrW2xRJutcoROwORi0pbSsvlUbTuc8lHp5SZ+orZRc178F/cEmOa11V4O0cwTfoRqDxyUlz2ktJkRALS3FpwNW2VKjCpDdZHw44kuBqcQoBGvUi8xdNsfR7l7pANfMfb6bmExTGnfqquL92o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755171516; c=relaxed/simple;
	bh=0/kcF88SImS98m2EJ/3g0BxMqg048eR3mnkGCn/omCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KE+wKrOl0D34Dj4fXshZ3iGz6tSje9QFAXxjG68YnchNNGRSbsuDcTt+NgSwMRRaQwAOVwJfXMd2ZoUHU3KAqLYA0FV1t9pDzvvVRt2zGn1RPUkFoqx2J+kKUL5zr5hJEolnBSzJbDVo0uiJmR5wEuYFS8Q8QOuWLIDIBB7Dy+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DcZYdkyJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9620656D;
	Thu, 14 Aug 2025 13:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755171458;
	bh=0/kcF88SImS98m2EJ/3g0BxMqg048eR3mnkGCn/omCw=;
	h=From:To:Cc:Subject:Date:From;
	b=DcZYdkyJtE7iKxlaazF5aqwf7ef1TLMB/qs+dLqzuAZa3jgIp/Z6xe897brQpiNcl
	 EkuEOt/v/4yoW5I5FRAN2LikH7Qtz+hmf/lJWoGJxxbKSHrxIMgElYiiBNYn50djeE
	 E+ZQhHj41JcoFWgQWcd9dRWL9vtGfVOSRBtdTYcM=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH] imx-mipi-csis: Get the number of active lanes from mbus_config
Date: Thu, 14 Aug 2025 12:37:01 +0100
Message-ID: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although 4 lanes may be physically available, we may not be using all of
them. Get the number of configured lanes in the case a driver has
implemented the get_mbus_config op.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

---

Currently, the imx-mipi-csis driver parses the device tree to determine
the number of configured lanes for the CSI receiver. This may be
incorrect in the case that the connected device only uses a subset of
lanes, for example. Allow the drivers for these cameras to create a
mbus_config to configure the number of lanes that are actually being
used.

If the driver does not support the get_mbus_config op, this patch will
have no functional change.

Compile tested against media-master (v6.17-rc1)
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c0..efe4e2ad0382 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
 	return container_of(sdev, struct mipi_csis_device, sd);
 }
 
+static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
+{
+	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
+	struct v4l2_mbus_config mbus_config = { 0 };
+	int ret;
+
+	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
+			       0, &mbus_config);
+	if (ret == -ENOIOCTLCMD) {
+		dev_dbg(csis->dev, "No remote mbus configuration available\n");
+		return 0;
+	}
+
+	if (ret) {
+		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
+		return ret;
+	}
+
+	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(csis->dev, "Unsupported media bus type %u\n",
+			mbus_config.type);
+		return -EINVAL;
+	}
+
+	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
+		dev_err(csis->dev,
+			"Unsupported mbus config: too many data lanes %u\n",
+			mbus_config.bus.mipi_csi2.num_data_lanes);
+		return -EINVAL;
+	}
+
+	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
+	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);
+
+	return 0;
+}
+
 static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
@@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	ret = mipi_csis_get_active_lanes(sd);
+	if (ret < 0)
+		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;
-- 
2.43.0


