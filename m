Return-Path: <linux-media+bounces-31228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79019A9F578
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 18:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0700D5A4353
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 16:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76AE27B4F5;
	Mon, 28 Apr 2025 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJIHfgbr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8640D27A913
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857025; cv=none; b=JPgoydPPwR6ZoHddhme20DZgqm72Qfrf0rwG0m+u58LFzoN6hTjki/9UxaRZH+1zrPUZ443wuZvm4eY5nIZj2EYe6gp2WdyRJ+wtyqYRbUZTPcI1WZKlPwBmwShnjGIlzH1C5i5mkjV9ZeMlqNSe62ZNOL9CVKdLAY4BP0/tAss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857025; c=relaxed/simple;
	bh=KjF3tgXP4UXBoZaT0uoVjNihMeEp5lsKSwIRIOOyzZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OkZUjXP6vI2JF2tYZ412grs5JqyQ72dwnuw7nblBWLUNw4U8gQ1Etp/ClhSpyUmLiwbMs7rRYmHokhnzvW9aYQZYkcQxHkV5pNFin05JvBxJ8cpCj2qOU0+Dy706iDGueXvzhV2pBPmdJZKjEMAve5Dr6yZCZwfewXUEFA8eU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJIHfgbr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745857023; x=1777393023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KjF3tgXP4UXBoZaT0uoVjNihMeEp5lsKSwIRIOOyzZU=;
  b=MJIHfgbrnxXjEC23vIXIuFhuz1pJa+lTnRdRmVUmrCYH9lZUnTGchFII
   Dwmgz49CefJ8au83kwydQKPmv3ajT7PrCyon7sb6vIBwHXc0A9Y9Glhyz
   HSdRNdA5cxX3izUSB6mYhldcXQDz81T6SaTCpsofHD89QXwZF98yJczYP
   QEuLzeCeADrx+/k73AnOAmAIibZT9OfSX5JlMIHykpreZ5OYG0DvSyA6h
   ygQxzFXvRf1kJFgJ9VgPrZqw5aNSIB9Iug3JWPxnF6Tsv59dkVIzM4lxD
   V9QQvfi8PotPKNLNYM19+C1S8RkgakI7Apjg6iFTVf1zdOMto4npcZSLs
   Q==;
X-CSE-ConnectionGUID: np+YrEDjSOiusmHcgq7eYg==
X-CSE-MsgGUID: XyBOVDOqT7WF4ttrd/U58w==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47547144"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="47547144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:17:03 -0700
X-CSE-ConnectionGUID: lU0N23WXRNSVqmVb+yjZLA==
X-CSE-MsgGUID: FwJH77OZSr2LvJldEZ+cag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="164522892"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.253.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:17:02 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 4/5] media: intel/ipu6: Rename ipu6_isys_subdev
Date: Mon, 28 Apr 2025 18:16:42 +0200
Message-Id: <20250428161643.321617-5-stanislaw.gruszka@linux.intel.com>
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

ipu6_isys_subdev structure will be shared with ipu7, to avoid confusion
rename it to ipu_isys_subdev.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu-isys.h       | 14 +++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  4 +++-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  8 ++++----
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   | 20 ++-----------------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  6 +++---
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  4 ++--
 7 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu-isys.h b/drivers/media/pci/intel/ipu6/ipu-isys.h
index 52dd0a5a8c8c..c476d9119c1f 100644
--- a/drivers/media/pci/intel/ipu6/ipu-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu-isys.h
@@ -4,8 +4,22 @@
 #ifndef IPU_ISYS_H
 #define IPU_ISYS_H
 
+#include <linux/container_of.h>
+
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
+struct ipu_isys_subdev {
+	struct v4l2_subdev sd;
+	u32 const *supported_codes;
+	struct media_pad *pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+	void (*ctrl_init)(struct v4l2_subdev *sd);
+	int source; /* SSI stream source; -1 if unset */
+};
+
+#define to_ipu_isys_subdev(__sd) container_of(__sd, struct ipu_isys_subdev, sd)
+
 int ipu_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
 				struct v4l2_mbus_framefmt *format);
 int ipu_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index c8935bf7df31..703a5112ba95 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -224,7 +224,7 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 				     const struct ipu6_isys_csi2_timing *timing,
 				     unsigned int nlanes, int enable)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu_isys_subdev *asd = to_ipu_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_isys *isys = csi2->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -339,7 +339,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 					 struct v4l2_subdev_state *state,
 					 u32 pad, u64 streams_mask)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu_isys_subdev *asd = to_ipu_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_isys_csi2_timing timing = { };
 	struct v4l2_subdev *remote_sd;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index 24ed13b4a63f..24f01eed7e93 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -9,6 +9,8 @@
 #include "ipu6-isys-subdev.h"
 #include "ipu6-isys-video.h"
 
+#include "ipu-isys.h"
+
 struct media_entity;
 struct v4l2_mbus_frame_desc_entry;
 
@@ -35,7 +37,7 @@ struct ipu6_isys_stream;
 #define CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_B		-2
 
 struct ipu6_isys_csi2 {
-	struct ipu6_isys_subdev asd;
+	struct ipu_isys_subdev asd;
 	struct ipu6_isys *isys;
 	struct ipu6_isys_video av[NR_OF_CSI2_SRC_PADS];
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 7c6125dc4af4..180eeb6fc981 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -141,7 +141,7 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu_isys_subdev *asd = to_ipu_isys_subdev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_rect *crop;
 	u32 code = asd->supported_codes[0];
@@ -209,7 +209,7 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu_isys_subdev *asd = to_ipu_isys_subdev(sd);
 	const u32 *supported_codes = asd->supported_codes;
 	u32 index;
 
@@ -265,7 +265,7 @@ static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
 	.init_state = ipu6_isys_subdev_init_state,
 };
 
-int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,
+int ipu6_isys_subdev_init(struct ipu_isys_subdev *asd, struct device *dev,
 			  const struct v4l2_subdev_ops *ops,
 			  unsigned int nr_ctrls, unsigned int num_sink_pads,
 			  unsigned int num_source_pads)
@@ -326,7 +326,7 @@ int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,
 	return ret;
 }
 
-void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd)
+void ipu6_isys_subdev_cleanup(struct ipu_isys_subdev *asd)
 {
 	media_entity_cleanup(&asd->sd.entity);
 	v4l2_ctrl_handler_free(&asd->ctrl_handler);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index 732e6ecc927a..a58d2e80f7a2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -4,26 +4,10 @@
 #ifndef IPU6_ISYS_SUBDEV_H
 #define IPU6_ISYS_SUBDEV_H
 
-#include <linux/container_of.h>
-
-#include <media/media-entity.h>
-#include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
 #include "ipu-isys.h"
 
-struct ipu6_isys_subdev {
-	struct v4l2_subdev sd;
-	u32 const *supported_codes;
-	struct media_pad *pad;
-	struct v4l2_ctrl_handler ctrl_handler;
-	void (*ctrl_init)(struct v4l2_subdev *sd);
-	int source;	/* SSI stream source; -1 if unset */
-};
-
-#define to_ipu6_isys_subdev(__sd) \
-	container_of(__sd, struct ipu6_isys_subdev, sd)
-
 unsigned int ipu6_isys_mbus_code_to_bpp(u32 code);
 unsigned int ipu6_isys_mbus_code_to_mipi(u32 code);
 bool ipu6_isys_is_bayer_format(u32 code);
@@ -36,9 +20,9 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum
 				    *code);
-int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,
+int ipu6_isys_subdev_init(struct ipu_isys_subdev *asd, struct device *dev,
 			  const struct v4l2_subdev_ops *ops,
 			  unsigned int nr_ctrls, unsigned int num_sink_pads,
 			  unsigned int num_source_pads);
-void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd);
+void ipu6_isys_subdev_cleanup(struct ipu_isys_subdev *asd);
 #endif /* IPU6_ISYS_SUBDEV_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index c11e62a44fbf..e9705bb077b6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -869,7 +869,7 @@ void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
 }
 
 static struct ipu6_isys_stream *
-ipu6_isys_get_stream(struct ipu6_isys_video *av, struct ipu6_isys_subdev *asd)
+ipu6_isys_get_stream(struct ipu6_isys_video *av, struct ipu_isys_subdev *asd)
 {
 	struct ipu6_isys_stream *stream = NULL;
 	struct ipu6_isys *isys = av->isys;
@@ -1174,7 +1174,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	struct v4l2_subdev_route *route = NULL;
 	struct v4l2_subdev_route *r;
 	struct v4l2_subdev_state *state;
-	struct ipu6_isys_subdev *asd;
+	struct ipu_isys_subdev *asd;
 	struct v4l2_subdev *remote_sd;
 	struct media_pipeline *pipeline;
 	struct media_pad *source_pad, *remote_pad;
@@ -1189,7 +1189,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	}
 
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-	asd = to_ipu6_isys_subdev(remote_sd);
+	asd = to_ipu_isys_subdev(remote_sd);
 	source_pad = media_pad_remote_pad_first(&remote_pad->entity->pads[0]);
 	if (!source_pad) {
 		dev_dbg(dev, "No external source entity\n");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 1d945be2b879..78cf6b8d5211 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -21,7 +21,7 @@
 struct file;
 struct ipu6_isys;
 struct ipu6_isys_csi2;
-struct ipu6_isys_subdev;
+struct ipu_isys_subdev;
 
 struct ipu6_isys_pixelformat {
 	u32 pixelformat;
@@ -56,7 +56,7 @@ struct ipu6_isys_stream {
 	int stream_source;
 	int stream_handle;
 	unsigned int nr_output_pins;
-	struct ipu6_isys_subdev *asd;
+	struct ipu_isys_subdev *asd;
 
 	int nr_queues;	/* Number of capture queues */
 	int nr_streaming;
-- 
2.34.1


