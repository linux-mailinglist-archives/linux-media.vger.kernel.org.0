Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2819D1C701B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 14:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgEFMQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 08:16:07 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:60443 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727792AbgEFMQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 08:16:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WIy0jop8o8hmdWIy3jCizD; Wed, 06 May 2020 14:16:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588767364; bh=NWOX+IxTHWmO3r0mOrugqBWtkXbaVOW+x2SbofER9+g=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=atnvN5/DbrexpIdgnil9Q2/fFdH7GXrOz+lYaz1uyougb43QSzFP01sycFEObihA6
         g7MABjVrv4q2w95cByNJM1wDP3oboK9jA+b6//zQEin+N7IyYvI+/ulq07VuRYp9ow
         AxMiFaYPgmizHmQN7LBeS0Rwll9AAkMvWUh5AU/7Uy2XpP7ugAzdsLnMD4ICv01LLi
         0gmA0JJX7axxTOWsnZxLGnLZFCtzuQmW+qPwuLIlAQw58tO86vM0y6BsF29tXbFxrM
         obMTaBL3lyInN7NIABBdpHb/3b0iLZSSs93DN70nbvqiBtch1frW1FS50RyC6U70Z4
         IfXyd5lhe6VAQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3] media: vidioc-enum-fmt.rst: make the ENUM_FMT text clearer
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Message-ID: <cceee07a-cddd-ff63-30ec-1efbeb6f9472@xs4all.nl>
Date:   Wed, 6 May 2020 14:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPi7U/L5KaZcW9BFKRO/PZCKt4f4XXkNwmINWD/1eu8l2vOtyMMbPR/IQ8OBDgkyr1KNGWYHqk74NkzNvFK3WduQGr2WTrx3AQ7qUUQwaDKD9uDbp7pc
 vK4bwy5jvAzSMGbU7gO8gX73ou5wLzdMpR6a4Uahjm19RNtDKgSqv+oO/S+2yAT3JONfclg5lwdNV5EpYrM0OLIsx2KSxWUyFDJROLJWrg/vmIIHXA7tcv9l
 WqrpYIehfpdHSkOBzPI3gT6bPagrgWzrAOvR4mhQ3qKZq5EpRPbtNtniMEBjwUbusTe1+b+3RwfZEEP15I2jJCdkOrjtSv9Ttlvo7Yh1XrknNKpcHTXAymfB
 fWAsW/Zcewc19x+iH2GUNFKHK8gyIP20Xrqhgucr7sPWOgysIutrlARNM4KbBf2cWwyu+IrF8C87dYJJxeLRjnQIo91wJrXv5wT+K+eKeFAKRs4fpck=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework the documentation to make it easier for the reader to understand
the differences in behavior of this ioctl between MC and non-MC drivers.

Note the addition of the 'video-node-centric' and 'MC-centric' terms to
help understand what the IO_MC capability really means.

Also mention in the beginning that mbus_code is one of the fields that
application should initialize, and add META_OUTPUT as one of the types that
this ioctl supports (that was never added here when the META_OUTPUT buffer
type was added).

Finally document that EINVAL will be returned if mbus_code is unsupported.

Fixes: e5b6b07a1b45 ("media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v2:

Document the error code if mbus_code is unsupported.

Changes since v1:
Updated version from Mauro's patch. Reworked the numerated list a bit since it
looked a bit odd in places. I think this version looks nice.

Also mention in the beginning that mbus_code is one of the fields that
application should initialize, and add META_OUTPUT as one of the types that
this ioctl supports (that was never added here when the META_OUTPUT buffer
type was added).

Finally changed 'video node centric' to 'video-node-centric', mostly because
'centric' is a suffix and so should be written as 'foo-centric'. And
'video node-centric' looks weird. But 'video-node-centric' and 'MC-centric'
work well IMHO.
---
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 9694111772a2..a53dd3d7f7e2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -39,8 +39,8 @@ Arguments
 Description
 ===========

-To enumerate image formats applications initialize the ``type`` and
-``index`` field of struct :c:type:`v4l2_fmtdesc` and call
+To enumerate image formats applications initialize the ``type``, ``mbus_code``
+and ``index`` fields of struct :c:type:`v4l2_fmtdesc` and call
 the :ref:`VIDIOC_ENUM_FMT` ioctl with a pointer to this structure. Drivers
 fill the rest of the structure or return an ``EINVAL`` error code. All
 formats are enumerable by beginning at index zero and incrementing by
@@ -48,21 +48,36 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
 formats in preference order, where preferred formats are returned before
 (that is, with lower ``index`` value) less-preferred formats.

-If the driver doesn't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
-<device-capabilities>`, applications shall initialize the ``mbus_code`` field
-to zero and drivers shall ignore the value of the field.  Drivers shall
-enumerate all image formats. The enumerated formats may depend on the active
-input or output of the device.
+Depending on the ``V4L2_CAP_IO_MC`` :ref:`capability <device-capabilities>`,
+the ``mbus_code`` field is handled differently:

-If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`capability
-<device-capabilities>`, applications may initialize the ``mbus_code`` field to
-a valid :ref:`media bus format code <v4l2-mbus-pixelcode>`. If the
-``mbus_code`` field is not zero, drivers shall restrict enumeration to only the
-image formats that can produce (for video output devices) or be produced from
-(for video capture devices) that media bus code.  Regardless of the value of
-the ``mbus_code`` field, the enumerated image formats shall not depend on the
-active configuration of the video device or device pipeline. Enumeration shall
-otherwise operate as previously described.
+1) ``V4L2_CAP_IO_MC`` is not set (also known as a 'video-node-centric' driver)
+
+   Applications shall initialize the ``mbus_code`` field to zero and drivers
+   shall ignore the value of the field.
+
+   Drivers shall enumerate all image formats.
+
+   .. note::
+
+      After switching the input or output the list of enumerated image
+      formats may be different.
+
+2) ``V4L2_CAP_IO_MC`` is set (also known as an 'MC-centric' driver)
+
+   If the ``mbus_code`` field is zero, then all image formats
+   shall be enumerated.
+
+   If the ``mbus_code`` field is initialized to a valid (non-zero)
+   :ref:`media bus format code <v4l2-mbus-pixelcode>`, then drivers
+   shall restrict enumeration to only the image formats that can produce
+   (for video output devices) or be produced from (for video capture
+   devices) that media bus code. If the ``mbus_code`` is unsupported by
+   the driver, then ``EINVAL`` shall be returned.
+
+   Regardless of the value of the ``mbus_code`` field, the enumerated image
+   formats shall not depend on the active configuration of the video device
+   or device pipeline.


 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -87,8 +102,9 @@ otherwise operate as previously described.
 	``V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE``,
 	``V4L2_BUF_TYPE_VIDEO_OVERLAY``,
 	``V4L2_BUF_TYPE_SDR_CAPTURE``,
-	``V4L2_BUF_TYPE_SDR_OUTPUT`` and
-	``V4L2_BUF_TYPE_META_CAPTURE``.
+	``V4L2_BUF_TYPE_SDR_OUTPUT``,
+	``V4L2_BUF_TYPE_META_CAPTURE`` and
+	``V4L2_BUF_TYPE_META_OUTPUT``.
 	See :c:type:`v4l2_buf_type`.
     * - __u32
       - ``flags``
@@ -174,3 +190,6 @@ appropriately. The generic error codes are described at the
 EINVAL
     The struct :c:type:`v4l2_fmtdesc` ``type`` is not
     supported or the ``index`` is out of bounds.
+
+    If ``V4L2_CAP_IO_MC`` is set and the specified ``mbus_code``
+    is unsupported, then also return this error code.
