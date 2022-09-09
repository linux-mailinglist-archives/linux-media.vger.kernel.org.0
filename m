Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23E045B3F52
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 21:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiIITQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 15:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiIITQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 15:16:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242E713B138
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 12:16:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWjUM-0005iw-SO; Fri, 09 Sep 2022 21:16:30 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWjUJ-004sQF-PP; Fri, 09 Sep 2022 21:16:29 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWjUK-00HZkF-Tn; Fri, 09 Sep 2022 21:16:28 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v1 1/4] media: v4l: move helper functions for fractions from uvc to v4l2-common
Date:   Fri,  9 Sep 2022 21:16:24 +0200
Message-Id: <20220909191627.4188908-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220909191627.4188908-1-m.grzeschik@pengutronix.de>
References: <20220909191627.4188908-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The functions uvc_simplify_fraction and uvc_fraction_to_interval are
generic helpers which are also useful for other v4l2 drivers. This patch
moves them to v4l2-common.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v13 -> v1:
    - added Reviewed-by and Tested-by from Dan
    - moved to this smaller patch series

 drivers/media/usb/uvc/uvc_driver.c    | 84 --------------------------
 drivers/media/usb/uvc/uvc_v4l2.c      | 14 ++---
 drivers/media/usb/uvc/uvcvideo.h      |  3 -
 drivers/media/v4l2-core/v4l2-common.c | 86 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           |  4 ++
 5 files changed, 97 insertions(+), 94 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9c05776f11d1f0..0f14dee4b6d794 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -329,90 +329,6 @@ static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_coefficients)
 	return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
 }
 
-/*
- * Simplify a fraction using a simple continued fraction decomposition. The
- * idea here is to convert fractions such as 333333/10000000 to 1/30 using
- * 32 bit arithmetic only. The algorithm is not perfect and relies upon two
- * arbitrary parameters to remove non-significative terms from the simple
- * continued fraction decomposition. Using 8 and 333 for n_terms and threshold
- * respectively seems to give nice results.
- */
-void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
-		unsigned int n_terms, unsigned int threshold)
-{
-	u32 *an;
-	u32 x, y, r;
-	unsigned int i, n;
-
-	an = kmalloc_array(n_terms, sizeof(*an), GFP_KERNEL);
-	if (an == NULL)
-		return;
-
-	/*
-	 * Convert the fraction to a simple continued fraction. See
-	 * https://en.wikipedia.org/wiki/Continued_fraction
-	 * Stop if the current term is bigger than or equal to the given
-	 * threshold.
-	 */
-	x = *numerator;
-	y = *denominator;
-
-	for (n = 0; n < n_terms && y != 0; ++n) {
-		an[n] = x / y;
-		if (an[n] >= threshold) {
-			if (n < 2)
-				n++;
-			break;
-		}
-
-		r = x - an[n] * y;
-		x = y;
-		y = r;
-	}
-
-	/* Expand the simple continued fraction back to an integer fraction. */
-	x = 0;
-	y = 1;
-
-	for (i = n; i > 0; --i) {
-		r = y;
-		y = an[i-1] * y + x;
-		x = r;
-	}
-
-	*numerator = y;
-	*denominator = x;
-	kfree(an);
-}
-
-/*
- * Convert a fraction to a frame interval in 100ns multiples. The idea here is
- * to compute numerator / denominator * 10000000 using 32 bit fixed point
- * arithmetic only.
- */
-u32 uvc_fraction_to_interval(u32 numerator, u32 denominator)
-{
-	u32 multiplier;
-
-	/* Saturate the result if the operation would overflow. */
-	if (denominator == 0 ||
-	    numerator/denominator >= ((u32)-1)/10000000)
-		return (u32)-1;
-
-	/*
-	 * Divide both the denominator and the multiplier by two until
-	 * numerator * multiplier doesn't overflow. If anyone knows a better
-	 * algorithm please let me know.
-	 */
-	multiplier = 10000000;
-	while (numerator > ((u32)-1)/multiplier) {
-		multiplier /= 2;
-		denominator /= 2;
-	}
-
-	return denominator ? numerator * multiplier / denominator : 0;
-}
-
 /* ------------------------------------------------------------------------
  * Terminal and unit management
  */
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 4cc3fa6b8c9812..f4d4c33b6dfbd7 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -386,7 +386,7 @@ static int uvc_v4l2_get_streamparm(struct uvc_streaming *stream,
 	mutex_unlock(&stream->mutex);
 
 	denominator = 10000000;
-	uvc_simplify_fraction(&numerator, &denominator, 8, 333);
+	v4l2_simplify_fraction(&numerator, &denominator, 8, 333);
 
 	memset(parm, 0, sizeof(*parm));
 	parm->type = stream->type;
@@ -427,7 +427,7 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
 	else
 		timeperframe = parm->parm.output.timeperframe;
 
-	interval = uvc_fraction_to_interval(timeperframe.numerator,
+	interval = v4l2_fraction_to_interval(timeperframe.numerator,
 		timeperframe.denominator);
 	uvc_dbg(stream->dev, FORMAT, "Setting frame interval to %u/%u (%u)\n",
 		timeperframe.numerator, timeperframe.denominator, interval);
@@ -481,7 +481,7 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
 	/* Return the actual frame period. */
 	timeperframe.numerator = probe.dwFrameInterval;
 	timeperframe.denominator = 10000000;
-	uvc_simplify_fraction(&timeperframe.numerator,
+	v4l2_simplify_fraction(&timeperframe.numerator,
 		&timeperframe.denominator, 8, 333);
 
 	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -1275,7 +1275,7 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
 		fival->discrete.numerator =
 			frame->dwFrameInterval[index];
 		fival->discrete.denominator = 10000000;
-		uvc_simplify_fraction(&fival->discrete.numerator,
+		v4l2_simplify_fraction(&fival->discrete.numerator,
 			&fival->discrete.denominator, 8, 333);
 	} else {
 		fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
@@ -1285,11 +1285,11 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
 		fival->stepwise.max.denominator = 10000000;
 		fival->stepwise.step.numerator = frame->dwFrameInterval[2];
 		fival->stepwise.step.denominator = 10000000;
-		uvc_simplify_fraction(&fival->stepwise.min.numerator,
+		v4l2_simplify_fraction(&fival->stepwise.min.numerator,
 			&fival->stepwise.min.denominator, 8, 333);
-		uvc_simplify_fraction(&fival->stepwise.max.numerator,
+		v4l2_simplify_fraction(&fival->stepwise.max.numerator,
 			&fival->stepwise.max.denominator, 8, 333);
-		uvc_simplify_fraction(&fival->stepwise.step.numerator,
+		v4l2_simplify_fraction(&fival->stepwise.step.numerator,
 			&fival->stepwise.step.denominator, 8, 333);
 	}
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 24c911aeebce56..ff710bdd38b3fd 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -911,9 +911,6 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
 
 /* Utility functions */
-void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
-			   unsigned int n_terms, unsigned int threshold);
-u32 uvc_fraction_to_interval(u32 numerator, u32 denominator);
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 					    u8 epaddr);
 u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index e0fbe6ba4b6c49..40f56e044640d7 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -484,3 +484,89 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 	return freq > 0 ? freq : -EINVAL;
 }
 EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
+
+/*
+ * Simplify a fraction using a simple continued fraction decomposition. The
+ * idea here is to convert fractions such as 333333/10000000 to 1/30 using
+ * 32 bit arithmetic only. The algorithm is not perfect and relies upon two
+ * arbitrary parameters to remove non-significative terms from the simple
+ * continued fraction decomposition. Using 8 and 333 for n_terms and threshold
+ * respectively seems to give nice results.
+ */
+void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
+		unsigned int n_terms, unsigned int threshold)
+{
+	u32 *an;
+	u32 x, y, r;
+	unsigned int i, n;
+
+	an = kmalloc_array(n_terms, sizeof(*an), GFP_KERNEL);
+	if (an == NULL)
+		return;
+
+	/*
+	 * Convert the fraction to a simple continued fraction. See
+	 * https://en.wikipedia.org/wiki/Continued_fraction
+	 * Stop if the current term is bigger than or equal to the given
+	 * threshold.
+	 */
+	x = *numerator;
+	y = *denominator;
+
+	for (n = 0; n < n_terms && y != 0; ++n) {
+		an[n] = x / y;
+		if (an[n] >= threshold) {
+			if (n < 2)
+				n++;
+			break;
+		}
+
+		r = x - an[n] * y;
+		x = y;
+		y = r;
+	}
+
+	/* Expand the simple continued fraction back to an integer fraction. */
+	x = 0;
+	y = 1;
+
+	for (i = n; i > 0; --i) {
+		r = y;
+		y = an[i-1] * y + x;
+		x = r;
+	}
+
+	*numerator = y;
+	*denominator = x;
+	kfree(an);
+}
+EXPORT_SYMBOL_GPL(v4l2_simplify_fraction);
+
+/*
+ * Convert a fraction to a frame interval in 100ns multiples. The idea here is
+ * to compute numerator / denominator * 10000000 using 32 bit fixed point
+ * arithmetic only.
+ */
+u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator)
+{
+	u32 multiplier;
+
+	/* Saturate the result if the operation would overflow. */
+	if (denominator == 0 ||
+	    numerator/denominator >= ((u32)-1)/10000000)
+		return (u32)-1;
+
+	/*
+	 * Divide both the denominator and the multiplier by two until
+	 * numerator * multiplier doesn't overflow. If anyone knows a better
+	 * algorithm please let me know.
+	 */
+	multiplier = 10000000;
+	while (numerator > ((u32)-1)/multiplier) {
+		multiplier /= 2;
+		denominator /= 2;
+	}
+
+	return denominator ? numerator * multiplier / denominator : 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_fraction_to_interval);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index b708d63995f458..725ff91b26e063 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -540,6 +540,10 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
 		       unsigned int div);
 
+void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
+		unsigned int n_terms, unsigned int threshold);
+u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator);
+
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
-- 
2.30.2

