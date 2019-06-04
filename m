Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9723F34F67
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 19:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfFDR5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 13:57:34 -0400
Received: from retiisi.org.uk ([95.216.213.190]:32876 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726399AbfFDR5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 13:57:34 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id BD219634C7B;
        Tue,  4 Jun 2019 20:57:29 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>, hverkuil@xs4all.nl,
        m.felsch@pengutronix.de
Subject: [RFC 1/1] v4l2-subdev: Rework subdev format and selection macros to work without MC
Date:   Tue,  4 Jun 2019 20:57:31 +0300
Message-Id: <20190604175731.20596-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework the macros for accessing subdev try formats to work meaningfully
and relatively safely without V4L2 sub-device uAPI (and without MC). This
is done by simply reverting to accessing the pad number zero if
CONFIG_VIDEO_V4L2_SUBDEV_API isn't enabled, and emitting a kernel warning
if the pad is non-zero in that case.

The functions are seen useful if subdev uAPI is disabled for drivers that
can work without the Kconfig option but benefit from the option if it's
enabled.

As a by-product, the patch simplifies individual inline functions by
removing two lines of code from each of them and moving the functionality
to a common macro.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi guys,

This might not be pretty but should provide some comfort for drivers
working with different Kconfig options. Comments are welcome...

 include/media/v4l2-subdev.h | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e1e3c18c3fd6..3328f302326b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -930,6 +930,17 @@ struct v4l2_subdev_fh {
 	container_of(fh, struct v4l2_subdev_fh, vfh)
 
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
+#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
+	(WARN_ON(!(__cfg)) ? NULL :		\
+	 ((__sd)->entity.graph_obj.mdev ?				\
+	  (WARN_ON((__pad) >= (__sd)->entity.num_pads) ?		\
+	   NULL : &(__cfg)[__pad].__field) :				\
+	  &(__cfg)[WARN_ON(__pad) && 0].__field))
+#else /* CONFIG_VIDEO_V4L2_SUBDEV_API */
+#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
+	(WARN_ON(!(__cfg)) ? NULL :					\
+	 &(__cfg)[WARN_ON(__pad) && 0].__field)
+#endif /* !CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 /**
  * v4l2_subdev_get_try_format - ancillary routine to call
@@ -944,9 +955,7 @@ static inline struct v4l2_mbus_framefmt
 			    struct v4l2_subdev_pad_config *cfg,
 			    unsigned int pad)
 {
-	if (WARN_ON(pad >= sd->entity.num_pads))
-		pad = 0;
-	return &cfg[pad].try_fmt;
+	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_fmt);
 }
 
 /**
@@ -962,9 +971,7 @@ static inline struct v4l2_rect
 			  struct v4l2_subdev_pad_config *cfg,
 			  unsigned int pad)
 {
-	if (WARN_ON(pad >= sd->entity.num_pads))
-		pad = 0;
-	return &cfg[pad].try_crop;
+	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_crop);
 }
 
 /**
@@ -980,11 +987,8 @@ static inline struct v4l2_rect
 			     struct v4l2_subdev_pad_config *cfg,
 			     unsigned int pad)
 {
-	if (WARN_ON(pad >= sd->entity.num_pads))
-		pad = 0;
-	return &cfg[pad].try_compose;
+	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_compose);
 }
-#endif
 
 extern const struct v4l2_file_operations v4l2_subdev_fops;
 
-- 
2.11.0

