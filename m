Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E4628D15A
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 17:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730730AbgJMPgk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 11:36:40 -0400
Received: from retiisi.eu ([95.216.213.190]:54602 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbgJMPgk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 11:36:40 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 538FC634C89;
        Tue, 13 Oct 2020 18:35:27 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/2] v4l: Add a helper for obtaining the link frequency
Date:   Tue, 13 Oct 2020 18:36:32 +0300
Message-Id: <20201013153633.31022-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201013153633.31022-1-sakari.ailus@linux.intel.com>
References: <20201013153633.31022-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a helper for obtaining the link frequency from transmitter drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 33 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 21 +++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 3dc17ebe14fa..78007dba4677 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -441,3 +441,36 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
+
+s64 v4l2_get_link_rate(struct v4l2_ctrl_handler *handler, unsigned int mul,
+		       unsigned int div)
+{
+	struct v4l2_ctrl *ctrl;
+	s64 freq;
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_LINK_FREQ);
+	if (ctrl) {
+		struct v4l2_querymenu qm = { .id = V4L2_CID_LINK_FREQ };
+		int ret;
+
+		qm.index = v4l2_ctrl_g_ctrl(ctrl);
+
+		ret = v4l2_querymenu(handler, &qm);
+		if (ret)
+			return -ENOENT;
+
+		freq = qm.value;
+	} else {
+		if (!mul || !div)
+			return -ENOENT;
+
+		ctrl = v4l2_ctrl_find(handler, V4L2_CID_PIXEL_RATE);
+		if (!ctrl)
+			return -ENOENT;
+
+		freq = div_u64(v4l2_ctrl_g_ctrl_int64(ctrl) * mul, div);
+	}
+
+	return freq > 0 ? freq : -EINVAL;
+}
+EXPORT_SYMBOL_GPL(v4l2_get_link_rate);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index a3083529b698..be36cbdcc1bd 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -519,6 +519,27 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 			u32 width, u32 height);
 
+/**
+ * v4l2_get_link_rate - Get link rate from transmitter
+ *
+ * @handler: The transmitter's control handler
+ * @mul: The multiplier between pixel rate and link frequency. Bits per pixel on
+ *	 D-PHY, samples per clock on parallel. 0 otherwise.
+ * @div: The divisor between pixel rate and link frequency. Number of data lanes
+ *	 times two on D-PHY, 1 on parallel. 0 otherwise.
+ *
+ * This function is intended for obtaining the link frequency from the
+ * transmitter sub-devices. It returns the link rate, either from the
+ * V4L2_CID_LINK_FREQ control implemented by the transmitter, or value
+ * calculated based on the V4L2_CID_PIXEL_RATE implemented by the transmitter.
+ *
+ * Returns link frequency on success, otherwise a negative error code:
+ *	-ENOENT: Link frequency or pixel rate control not found
+ *	-EINVAL: Invalid link frequency value
+ */
+s64 v4l2_get_link_rate(struct v4l2_ctrl_handler *handler, unsigned int mul,
+		       unsigned int div);
+
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
-- 
2.27.0

