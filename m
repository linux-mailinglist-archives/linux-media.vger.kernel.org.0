Return-Path: <linux-media+bounces-29125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 373A9A77749
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C79E8188E097
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3E01EC011;
	Tue,  1 Apr 2025 09:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGWRlAZg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D301EC00D
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498617; cv=none; b=TDPwBvaKi+BWDtgGquuNJuYqmsK+mrol3i7hcpCOclZMnTzGayOf8nymSQmmYXWzTBqVdgRZmz7aWXHvJjlK4L+YGKtjGVN5mJCWBztDuwreNAUK3MdchTMeCxcOVttUd7cLgF4vOeJIpVBDsxpvLX6x5OpIve+MtJxQtu1GnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498617; c=relaxed/simple;
	bh=3IFTO41RffJ+iS/TOLX1vnSUBaOA4s4oLKBx/LdoVns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oj2Lp7CHsdNyNQU1IZF+oZORcRpnzSqRMPEnr4zbzsQX0lIZ2/p+pP9Ji7BH9hbYL53RYRR0TtnjU7AIq1AfHAU+Si8MEmqsj3Cw6unGQpufYnSKcp5M6qojwDGrnr1JKjkrJ5CQR84s1MQvG/sQjgV7OQ1XKeEF3zHb2wJZ00c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGWRlAZg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743498616; x=1775034616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3IFTO41RffJ+iS/TOLX1vnSUBaOA4s4oLKBx/LdoVns=;
  b=AGWRlAZgObSNkZStBZXVkuST0grcncRx8Us5XagkeOj1TKNERSCcHqHz
   tWoApbGLPNPf8Fb0bITBuRfblh/gEwOiXOPjDnAO46d12D/bSed4/W0QL
   oaIrAdjSoznobXh60nyra08iwI0cyegmTcMLypU1abt+fZEfAXdNIdXvT
   SAfieWCgOT5iWyiIaMa1UQ7B6i9b/v2FPsHbE6EOnMzu7OM5XjAIykZih
   A90LyHYk8MLiuP3fu9tc6DxyJ7sCfqXZZYbxvnPH0Rz+sTbSn8TfkNOGC
   p1HA2CA1c6dHsnNCCIlfpXd9E1H4psHRGkbtzMiOfbpvNwxHaKxMtvNIP
   g==;
X-CSE-ConnectionGUID: NrECqmKRQ9OzCl8xpy66zA==
X-CSE-MsgGUID: zEPR+3J8SBq85GHBvMUgkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="47532617"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="47532617"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:10:16 -0700
X-CSE-ConnectionGUID: STspg4jNRaSlyaVjsW0AcA==
X-CSE-MsgGUID: hxZSllCwT/6iG4mRFz+20Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126301246"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.112.43])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:10:15 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 4/5] media: intel/ipu6: Rename ipu6_isys_subdev
Date: Tue,  1 Apr 2025 11:09:52 +0200
Message-Id: <20250401090953.473339-6-stanislaw.gruszka@linux.intel.com>
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

ipu6_isys_subdev structure will be shared with ipu7, to avoid confusion
rename it to isys_subdev.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  4 +++-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  8 ++++----
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   | 20 ++-----------------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  6 +++---
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  4 ++--
 drivers/media/pci/intel/ipu6/isys.h           | 14 +++++++++++++
 7 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index a59231d81f80..2441f47e8742 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -224,7 +224,7 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 				     const struct ipu6_isys_csi2_timing *timing,
 				     unsigned int nlanes, int enable)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct isys_subdev *asd = to_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_isys *isys = csi2->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -339,7 +339,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 					 struct v4l2_subdev_state *state,
 					 u32 pad, u64 streams_mask)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct isys_subdev *asd = to_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_isys_csi2_timing timing = { };
 	struct v4l2_subdev *remote_sd;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index 24ed13b4a63f..7deafead66cf 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -9,6 +9,8 @@
 #include "ipu6-isys-subdev.h"
 #include "ipu6-isys-video.h"
 
+#include "isys.h"
+
 struct media_entity;
 struct v4l2_mbus_frame_desc_entry;
 
@@ -35,7 +37,7 @@ struct ipu6_isys_stream;
 #define CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_B		-2
 
 struct ipu6_isys_csi2 {
-	struct ipu6_isys_subdev asd;
+	struct isys_subdev asd;
 	struct ipu6_isys *isys;
 	struct ipu6_isys_video av[NR_OF_CSI2_SRC_PADS];
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 7c6125dc4af4..020c25925ca0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -141,7 +141,7 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *format)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct isys_subdev *asd = to_isys_subdev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_rect *crop;
 	u32 code = asd->supported_codes[0];
@@ -209,7 +209,7 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct isys_subdev *asd = to_isys_subdev(sd);
 	const u32 *supported_codes = asd->supported_codes;
 	u32 index;
 
@@ -265,7 +265,7 @@ static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
 	.init_state = ipu6_isys_subdev_init_state,
 };
 
-int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,
+int ipu6_isys_subdev_init(struct isys_subdev *asd, struct device *dev,
 			  const struct v4l2_subdev_ops *ops,
 			  unsigned int nr_ctrls, unsigned int num_sink_pads,
 			  unsigned int num_source_pads)
@@ -326,7 +326,7 @@ int ipu6_isys_subdev_init(struct ipu6_isys_subdev *asd, struct device *dev,
 	return ret;
 }
 
-void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd)
+void ipu6_isys_subdev_cleanup(struct isys_subdev *asd)
 {
 	media_entity_cleanup(&asd->sd.entity);
 	v4l2_ctrl_handler_free(&asd->ctrl_handler);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index 544537b4e3db..f3835d873991 100644
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
 
 #include "isys.h"
 
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
+int ipu6_isys_subdev_init(struct isys_subdev *asd, struct device *dev,
 			  const struct v4l2_subdev_ops *ops,
 			  unsigned int nr_ctrls, unsigned int num_sink_pads,
 			  unsigned int num_source_pads);
-void ipu6_isys_subdev_cleanup(struct ipu6_isys_subdev *asd);
+void ipu6_isys_subdev_cleanup(struct isys_subdev *asd);
 #endif /* IPU6_ISYS_SUBDEV_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 17ae8bb55234..e36a21aa9040 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -869,7 +869,7 @@ void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
 }
 
 static struct ipu6_isys_stream *
-ipu6_isys_get_stream(struct ipu6_isys_video *av, struct ipu6_isys_subdev *asd)
+ipu6_isys_get_stream(struct ipu6_isys_video *av, struct isys_subdev *asd)
 {
 	struct ipu6_isys_stream *stream = NULL;
 	struct ipu6_isys *isys = av->isys;
@@ -1174,7 +1174,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	struct v4l2_subdev_route *route = NULL;
 	struct v4l2_subdev_route *r;
 	struct v4l2_subdev_state *state;
-	struct ipu6_isys_subdev *asd;
+	struct isys_subdev *asd;
 	struct v4l2_subdev *remote_sd;
 	struct media_pipeline *pipeline;
 	struct media_pad *source_pad, *remote_pad;
@@ -1189,7 +1189,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	}
 
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-	asd = to_ipu6_isys_subdev(remote_sd);
+	asd = to_isys_subdev(remote_sd);
 	source_pad = media_pad_remote_pad_first(&remote_pad->entity->pads[0]);
 	if (!source_pad) {
 		dev_dbg(dev, "No external source entity\n");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 0cfea78bbc3c..f4dee6120635 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -21,7 +21,7 @@
 struct file;
 struct ipu6_isys;
 struct ipu6_isys_csi2;
-struct ipu6_isys_subdev;
+struct isys_subdev;
 
 struct ipu6_isys_pixelformat {
 	u32 pixelformat;
@@ -55,7 +55,7 @@ struct ipu6_isys_stream {
 	int stream_source;
 	int stream_handle;
 	unsigned int nr_output_pins;
-	struct ipu6_isys_subdev *asd;
+	struct isys_subdev *asd;
 
 	int nr_queues;	/* Number of capture queues */
 	int nr_streaming;
diff --git a/drivers/media/pci/intel/ipu6/isys.h b/drivers/media/pci/intel/ipu6/isys.h
index d822930e94bb..76f64439952b 100644
--- a/drivers/media/pci/intel/ipu6/isys.h
+++ b/drivers/media/pci/intel/ipu6/isys.h
@@ -4,8 +4,22 @@
 #ifndef ISYS_H
 #define ISYS_H
 
+#include <linux/container_of.h>
+
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
+struct isys_subdev {
+	struct v4l2_subdev sd;
+	u32 const *supported_codes;
+	struct media_pad *pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+	void (*ctrl_init)(struct v4l2_subdev *sd);
+	int source; /* SSI stream source; -1 if unset */
+};
+
+#define to_isys_subdev(__sd) container_of(__sd, struct isys_subdev, sd)
+
 int isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
 			    struct v4l2_mbus_framefmt *format);
 int isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
-- 
2.34.1


