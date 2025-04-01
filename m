Return-Path: <linux-media+bounces-29123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA215A77747
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B2FF3AB204
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB191EC00D;
	Tue,  1 Apr 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWeX5YRg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0FD2E3398
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498610; cv=none; b=QzZlE3XkgCCYaWbViH4SqaHp2kY48f/+InjcTMgzPzCWKoS34LY2d8KWorCs2fpzIhoqOrTwNyw+cSJ/XVgQrphWtByakxY63pt3OKvEnDtRkEArywPrfYTnMeMnbGaBYWTlEhMwPHeKzsxj/S2G+78ndXBgR7aRcupsjA4/n2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498610; c=relaxed/simple;
	bh=bLQY2WaFwDvKYQ95TdWksLmYQwqJPF1DIDpvoMH/afg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b8gEEervEABy5xuLYlUchLc5GPBmd7AwdwaLB+l8XZZZBRMYjkzrNC5ty9zeI85VvpbjdTaKowaKlVcBv7W8kzIglqUXsMlKZbpWPnYabtyJEYpj1vL/5KU07//9XGenWMBtA5G9puW9mwPTd4c2rci4xYaVdJK9Ul4fCJV/p4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWeX5YRg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743498608; x=1775034608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bLQY2WaFwDvKYQ95TdWksLmYQwqJPF1DIDpvoMH/afg=;
  b=SWeX5YRgPuYq5c0qcO29MrdlUkEOUdPhUFunHKajw2rFZXiLTcT1XUXf
   MXBWuDYF45sQ3sULIKZc+lEH3s37Dbcyd9oOnGPKo1s3xDicwfr3Vr+7/
   GFWIn/VeUI/SQfHK4USgSbxYxZ9/DvYqzM1lX0VVfQPNwrW2Yvv6Ju/07
   LohF+WoR+GSHbmwslS7XPIUVYWIzqDKfHCVEcuPvtZLf7FTWZauyfXu9y
   xqmk3uk2vRLj09HxBZPmMf0BOTMwz7GzR8nZCQykRV4zQ2srHH6Rn07qk
   iAndvCeoDZNWt0QCOrOTaoWX84CaNsuo4ceyTGgCv98Nh7hpjXeobtgy/
   Q==;
X-CSE-ConnectionGUID: 5EBpqkkHQvKKZbsR+uWaxg==
X-CSE-MsgGUID: 14J0RiTbQNOS/ilIQLltqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48681953"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="48681953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:10:08 -0700
X-CSE-ConnectionGUID: AtM4eBhvR16I7G+RQQ510g==
X-CSE-MsgGUID: 2ZEVTGPpSj2o/gPsUmmuWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="157257161"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.112.43])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:10:07 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 2/5] media: intel/ipu6: Remove ipu6_isys dependency from ipu6_isys_subdev
Date: Tue,  1 Apr 2025 11:09:50 +0200
Message-Id: <20250401090953.473339-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401090953.473339-1-stanislaw.gruszka@linux.intel.com>
References: <20250401090953.473339-1-stanislaw.gruszka@linux.intel.com>
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
index 923e92785a17..531de32419c6 100644
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
index 42e35ae820c4..544537b4e3db 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -12,11 +12,8 @@
 
 #include "isys.h"
 
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


