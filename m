Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6454A24B720
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 12:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731830AbgHTKrw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 06:47:52 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57503 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731125AbgHTKrV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 06:47:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8i6GkGNb2ywL58i6HkZM8E; Thu, 20 Aug 2020 12:47:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597920437; bh=q8856SSFKcAqi2mEoUgZVAFvjm1x0wOQLTKZMsmtLc8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GAKKrXA3XN85IJNREvGTUcAJPoJ7zFx5p5YpkAk4nhINjhXpxfBHb542AvQnIYo8A
         LrTH95ah8a+NvNzv00bQhsSKEtghQhsRAGofw6QoRasJ/8Vm34zU9OJue510HBZha6
         d23yIhJrd5dcJ8El2kMnfyDd7osJ9r6imccLEAWY6fmHdN1YYZH/1bPAfRFTqMt9xx
         C5BbXDoFwuL5NdF4hRqj3e06+tPlrokLMz+faBBZV4QArBw7BfOHvkJ1FysEY+ddqx
         2KUJbxya46AZRGvhQw+TUgXnscodHskNG4vHWm5T0x1DOfupp7kDZ5Tkj0LIb8Jc/5
         W3BDclWZcMTAQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] videodev2.h: RGB BT2020 and HSV are always full range
Message-ID: <8da57c1e-239c-464c-173f-36426c4b32d8@xs4all.nl>
Date:   Thu, 20 Aug 2020 12:47:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCluNxjx0kWekF0IZIqNjILtsP3iCt6QPW4Kg35DDGc4odawqC1h69s4OHEXfbWQS3/ssMpbVb13c7PVShKONg1uoPL1A5WNWNX0QUIuBa0EOyB2rgFL
 RE7Jm39l4Md47daWvsjEN/kJSz90V6kEubhJyl6q7NZ7aBof8Gz1iy+cMD5/A50wdBH7qBKw78LkQx/uuNldwZlKTakwR+840Ki0o6mMlmnfrG78ZCmfrG9N
 hCKPA8RmTAyBiDd+h5gasmYB1wCNZcERoH1YKle7jLgp74WN3cpdO8AWnMqc2vwRIidgiR1GcMLrsZxH//WCrQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The default RGB quantization range for BT.2020 is full range (just as for all the other
RGB pixel encodings), not limited range.

Update the V4L2_MAP_QUANTIZATION_DEFAULT macro and documentation accordingly.

Also mention that HSV is always full range and cannot be limited range.

When RGB BT2020 was introduced in V4L2 it was not clear whether it should be limited
or full range, but full range is the right (and consistent) choice.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/colorspaces-defs.rst b/Documentation/userspace-api/media/v4l/colorspaces-defs.rst
index 01404e1f609a..4089f426258d 100644
--- a/Documentation/userspace-api/media/v4l/colorspaces-defs.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces-defs.rst
@@ -36,8 +36,7 @@ whole range, 0-255, dividing the angular value by 1.41. The enum
 :c:type:`v4l2_hsv_encoding` specifies which encoding is used.

 .. note:: The default R'G'B' quantization is full range for all
-   colorspaces except for BT.2020 which uses limited range R'G'B'
-   quantization.
+   colorspaces. HSV formats are always full range.

 .. tabularcolumns:: |p{6.7cm}|p{10.8cm}|

@@ -169,8 +168,8 @@ whole range, 0-255, dividing the angular value by 1.41. The enum
       - Details
     * - ``V4L2_QUANTIZATION_DEFAULT``
       - Use the default quantization encoding as defined by the
-	colorspace. This is always full range for R'G'B' (except for the
-	BT.2020 colorspace) and HSV. It is usually limited range for Y'CbCr.
+	colorspace. This is always full range for R'G'B' and HSV.
+	It is usually limited range for Y'CbCr.
     * - ``V4L2_QUANTIZATION_FULL_RANGE``
       - Use the full range quantization encoding. I.e. the range [0…1] is
 	mapped to [0…255] (with possible clipping to [1…254] to avoid the
@@ -180,4 +179,4 @@ whole range, 0-255, dividing the angular value by 1.41. The enum
     * - ``V4L2_QUANTIZATION_LIM_RANGE``
       - Use the limited range quantization encoding. I.e. the range [0…1]
 	is mapped to [16…235]. Cb and Cr are mapped from [-0.5…0.5] to
-	[16…240].
+	[16…240]. Limited Range cannot be used with HSV.
diff --git a/Documentation/userspace-api/media/v4l/colorspaces-details.rst b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
index 300c5d2e7d0f..cf1b825ec34a 100644
--- a/Documentation/userspace-api/media/v4l/colorspaces-details.rst
+++ b/Documentation/userspace-api/media/v4l/colorspaces-details.rst
@@ -377,9 +377,8 @@ Colorspace BT.2020 (V4L2_COLORSPACE_BT2020)
 The :ref:`itu2020` standard defines the colorspace used by Ultra-high
 definition television (UHDTV). The default transfer function is
 ``V4L2_XFER_FUNC_709``. The default Y'CbCr encoding is
-``V4L2_YCBCR_ENC_BT2020``. The default R'G'B' quantization is limited
-range (!), and so is the default Y'CbCr quantization. The chromaticities
-of the primary colors and the white reference are:
+``V4L2_YCBCR_ENC_BT2020``. The default Y'CbCr quantization is limited range.
+The chromaticities of the primary colors and the white reference are:



diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c7b70ff53bc1..4769628790da 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -375,9 +375,9 @@ enum v4l2_hsv_encoding {

 enum v4l2_quantization {
 	/*
-	 * The default for R'G'B' quantization is always full range, except
-	 * for the BT2020 colorspace. For Y'CbCr the quantization is always
-	 * limited range, except for COLORSPACE_JPEG: this is full range.
+	 * The default for R'G'B' quantization is always full range.
+	 * For Y'CbCr the quantization is always limited range, except
+	 * for COLORSPACE_JPEG: this is full range.
 	 */
 	V4L2_QUANTIZATION_DEFAULT     = 0,
 	V4L2_QUANTIZATION_FULL_RANGE  = 1,
@@ -386,14 +386,13 @@ enum v4l2_quantization {

 /*
  * Determine how QUANTIZATION_DEFAULT should map to a proper quantization.
- * This depends on whether the image is RGB or not, the colorspace and the
- * Y'CbCr encoding.
+ * This depends on whether the image is RGB or not, the colorspace.
+ * The Y'CbCr encoding is not used anymore, but is still there for backwards
+ * compatibility.
  */
 #define V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb_or_hsv, colsp, ycbcr_enc) \
-	(((is_rgb_or_hsv) && (colsp) == V4L2_COLORSPACE_BT2020) ? \
-	 V4L2_QUANTIZATION_LIM_RANGE : \
-	 (((is_rgb_or_hsv) || (colsp) == V4L2_COLORSPACE_JPEG) ? \
-	 V4L2_QUANTIZATION_FULL_RANGE : V4L2_QUANTIZATION_LIM_RANGE))
+	(((is_rgb_or_hsv) || (colsp) == V4L2_COLORSPACE_JPEG) ? \
+	 V4L2_QUANTIZATION_FULL_RANGE : V4L2_QUANTIZATION_LIM_RANGE)

 /*
  * Deprecated names for opRGB colorspace (IEC 61966-2-5)
