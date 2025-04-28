Return-Path: <linux-media+bounces-31227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24615A9F575
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 18:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C489E5A3123
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 16:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9792826E17A;
	Mon, 28 Apr 2025 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMbgj//K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD927A13F
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857022; cv=none; b=CF8W4hJl49h70WWlvxvabeR6E9OlC3agHY7sgAIU/tKYjEhARtfEWxF16ZI8GO/jFaTmHXrD/bT+HZHWo90+jooKPhz6YIlUW2JJ3Z1JL5Gb+PLJrkJolpn2BZYPqh39LaGJ0Kao36knG5HaCnHVgP9mBIjGnFWcydIxrzty5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857022; c=relaxed/simple;
	bh=DKNRC7mCetTlnFh0HaWg2LbV67x6JfxkuIRIB10mRmM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oXfJJV8ExcfthCTNDSfDo5H0SU6UPBebIyB0qL2mEtxw5dNn8dLCbsgT02QA3fR0hZadfPtDU+eJJFoLdt7wKGJ8D2cGFu7bGxmzkFdu2LQw7hQrOoudrh1HOELD+BtvunFV+OSTY14HK/LZnJYk4hxBRjJ1QWJ37VUXI5l4/+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMbgj//K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745857021; x=1777393021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DKNRC7mCetTlnFh0HaWg2LbV67x6JfxkuIRIB10mRmM=;
  b=KMbgj//KBZ2QV5zYU4JTE+QNIo2kXhrY1c/kkFvGNbeKn3UP3aaZwgmJ
   AdBdZM6manrNjERPCrXZlAFRScSBXFcRglO8Du3yp9hVVoqOFirN8Rvdi
   D6PxF3C9hBSwkLVAmsH+hwfWwAm9eBD2XvtmEGU00nhpy9ChPH9jwj87R
   mLQzC7O9RTgzAz6IbwtH6VTU6gVH6FCpvA84JtSgRR40n8tx6ORomBltA
   8H6X3mcqSnIUWxqVS4p4nVJsBkqCHuln0/URGEeXiZbVBn9yfHWRjeiMd
   bm1bIJkrXqCzDgRNT4bHjMDqu7oaDWolJXtg5bjrSpV6JavFLkFk2sul7
   g==;
X-CSE-ConnectionGUID: J7zPbgWcRdSKt7MLMxi8og==
X-CSE-MsgGUID: hUEqaLO7RZqCkmQx0TUQ7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47341249"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="47341249"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:16:55 -0700
X-CSE-ConnectionGUID: 4KgObYizTSCH9QGoAeNlOw==
X-CSE-MsgGUID: iX86tpvrSX2QvLttsDJlzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="134546799"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.253.52])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:16:54 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 2/5] media: intel/ipu6: Remove ipu6_isys dependency from ipu6_isys_subdev
Date: Mon, 28 Apr 2025 18:16:40 +0200
Message-Id: <20250428161643.321617-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
References: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys back pointer of ipu6_isys_subdev structure is only used to get
pointer to struct device. We can use device pointer directly, what
would allow to refactor ipu6 subdev code to make it more independent.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c   | 15 ++++-----------
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 10 ++++------
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h |  8 ++------
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 685ef81969ac..543f81b1899f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -98,12 +98,8 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 				struct v4l2_event_subscription *sub)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
-	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
-	struct device *dev = &csi2->isys->adev->auxdev.dev;
-
-	dev_dbg(dev, "csi2 subscribe event(type %u id %u)\n",
-		sub->type, sub->id);
+	dev_dbg(sd->dev, "csi2 subscribe event(type %u id %u)\n", sub->type,
+		sub->id);
 
 	switch (sub->type) {
 	case V4L2_EVENT_FRAME_SYNC:
@@ -402,8 +398,6 @@ static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_selection *sel)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
-	struct device *dev = &asd->isys->adev->auxdev.dev;
 	struct v4l2_mbus_framefmt *sink_ffmt;
 	struct v4l2_mbus_framefmt *src_ffmt;
 	struct v4l2_rect *crop;
@@ -442,7 +436,7 @@ static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *sd,
 		src_ffmt->code = ipu6_isys_convert_bayer_order(sink_ffmt->code,
 							       sel->r.left,
 							       sel->r.top);
-	dev_dbg(dev, "set crop for %s sel: %d,%d,%d,%d code: 0x%x\n",
+	dev_dbg(sd->dev, "set crop for %s sel: %d,%d,%d,%d code: 0x%x\n",
 		sd->name, sel->r.left, sel->r.top, sel->r.width, sel->r.height,
 		src_ffmt->code);
 
@@ -532,8 +526,7 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 	csi2->port = index;
 
 	csi2->asd.sd.entity.ops = &csi2_entity_ops;
-	csi2->asd.isys = isys;
-	ret = ipu6_isys_subdev_init(&csi2->asd, &csi2_sd_ops, 0,
+	ret = ipu6_isys_subdev_init(&csi2->asd, dev, &csi2_sd_ops, 0,
 				    NR_OF_CSI2_SINK_PADS, NR_OF_CSI2_SRC_PADS);
 	if (ret)
 		goto fail;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index e5ce76c17ca3..7c6125dc4af4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -265,10 +265,9 @@ static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
 	.init_state = ipu6_isys_subdev_init_state,
 };
 
-int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
+int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,
 			  const struct v4l2_subdev_ops *ops,
-			  unsigned int nr_ctrls,
-			  unsigned int num_sink_pads,
+			  unsigned int nr_ctrls, unsigned int num_sink_pads,
 			  unsigned int num_source_pads)
 {
 	unsigned int num_pads = num_sink_pads + num_source_pads;
@@ -281,12 +280,11 @@ int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
 			 V4L2_SUBDEV_FL_HAS_EVENTS |
 			 V4L2_SUBDEV_FL_STREAMS;
 	asd->sd.owner = THIS_MODULE;
-	asd->sd.dev = &asd->isys->adev->auxdev.dev;
+	asd->sd.dev = dev;
 	asd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	asd->sd.internal_ops = &ipu6_isys_subdev_internal_ops;
 
-	asd->pad = devm_kcalloc(&asd->isys->adev->auxdev.dev, num_pads,
-				sizeof(*asd->pad), GFP_KERNEL);
+	asd->pad = devm_kcalloc(dev, num_pads, sizeof(*asd->pad), GFP_KERNEL);
 	if (!asd->pad)
 		return -ENOMEM;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index 46a2ede867f0..732e6ecc927a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -12,11 +12,8 @@
 
 #include "ipu-isys.h"
 
-struct ipu6_isys;
-
 struct ipu6_isys_subdev {
 	struct v4l2_subdev sd;
-	struct ipu6_isys *isys;
 	u32 const *supported_codes;
 	struct media_pad *pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -39,10 +36,9 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum
 				    *code);
-int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd,
+int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,
 			  const struct v4l2_subdev_ops *ops,
-			  unsigned int nr_ctrls,
-			  unsigned int num_sink_pads,
+			  unsigned int nr_ctrls, unsigned int num_sink_pads,
 			  unsigned int num_source_pads);
 void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd);
 #endif /* IPU6_ISYS_SUBDEV_H */
-- 
2.34.1


