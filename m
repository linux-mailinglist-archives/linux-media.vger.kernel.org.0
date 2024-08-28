Return-Path: <linux-media+bounces-16983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2273F962024
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 08:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55EE11C2351F
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 06:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82F11581F2;
	Wed, 28 Aug 2024 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9X65n/c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504E214E2C0
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724828268; cv=none; b=IljlbIYQvXzqyMCrjWUx36NDgp3DaxhyvuRgYzydsBEH3UeI6sMDjHG05yzaX2x0hR/IQHdlQI05I02PC12qDFW+G4YTqXPfp5sHprLZ1KzFV/qzaCrj7w4nbmK9vOQ837iUf1oA5j8fSIdeL+6XSJyboJxcQzDnrdz89LQ6FWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724828268; c=relaxed/simple;
	bh=EIVg+bIKN8S5ORQwcvMgd8ZKnY0qJbDQZFQyWu6QRzM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=AbxL/sAVQI5sBtoQaO0qSXdBYrWdTjSCr8lVS2O9j9qqpXwqdjtY5IbOVrdrjohJWpbb8rlW7Tv4WQtF3Thr8/3zIrvVCvonB84qoSBBfHEG4MHHKACX+Q6ifY6XK5CSpjC859oHfIR3b4HvTu9txn91wQ480QescFLerLdAo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9X65n/c; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724828266; x=1756364266;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EIVg+bIKN8S5ORQwcvMgd8ZKnY0qJbDQZFQyWu6QRzM=;
  b=X9X65n/c0+yN7vE3IuZAFhABmFmKINU/nb0Moz+xu2DSjIZz9oH4G6f7
   uXGtnL6V1Jvt1FJSTDpfvvzgIDOfq5DHyMqMljhOeBuiaSar+2YEvkLV1
   8Yef6Q5H7UenrODlZqbqoWn+T9WjPmNUT+so00lfrL4LtNSq66IjfVaRb
   y5FVhZPJVB1NexToLJ1xnW1/KzHhqH9sHT00DnBLViTf5QSakWU4cGP6/
   5PVogybVh+hwtt9yYlMCd2QNhagp7oy8mjAzqKvqx0CrPT4pZKHUJjAy+
   /HsOChpa8+8L6/+g66JJH3eJqZKjQC1q6cIcdV5M7rqieln4QxQz+ZIX6
   w==;
X-CSE-ConnectionGUID: XHqGekEmSumrVESTeHgyAQ==
X-CSE-MsgGUID: VPmc0YXyRPK32HjwGga74w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34715460"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="34715460"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 23:57:45 -0700
X-CSE-ConnectionGUID: ggBbyLQBRJ+Hzp9rUVPgtQ==
X-CSE-MsgGUID: eEBrg800QSiIc4xxKAB0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67809888"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 23:57:44 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8BF6D11F8B3
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 09:57:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sjCcg-009lWO-1Z
	for linux-media@vger.kernel.org;
	Wed, 28 Aug 2024 09:57:42 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: i2c: imx355: Parse and register properties
Date: Wed, 28 Aug 2024 09:57:32 +0300
Message-Id: <20240828065732.2327616-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Mader <robert.mader@collabora.com>

Analogous to e.g. the imx219 driver. This enables propagating the
V4L2_CID_CAMERA_SENSOR_ROTATION and V4L2_CID_CAMERA_ORIENTATION
values so that userspace - e.g. libcamera - can detect the
correct rotation and orientation from the device tree.

Signed-off-by: Robert Mader <robert.mader@collabora.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Just reposting this here, the original patch is
20240811111718.22513-1-robert.mader@collabora.com on LKML.

 drivers/media/i2c/imx355.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 7e9c2f65fa08..0dd25eeea60b 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1520,6 +1520,7 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
 static int imx355_init_controls(struct imx355 *imx355)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx355->sd);
+	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
 	s64 vblank_def;
@@ -1531,7 +1532,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 	int ret;
 
 	ctrl_hdlr = &imx355->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -1603,6 +1604,15 @@ static int imx355_init_controls(struct imx355 *imx355)
 		goto error;
 	}
 
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx355_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
 	imx355->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.39.2


