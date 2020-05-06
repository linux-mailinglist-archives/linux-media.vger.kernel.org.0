Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739021C6F75
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 13:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgEFLk7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 07:40:59 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:46265 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725824AbgEFLk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 07:40:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WIQ0jodhT8hmdWIQ3jCb57; Wed, 06 May 2020 13:40:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588765256; bh=bcAKEKV60SExJ8D6COhzkjBGSAQVfnSrdGSf3R6oGa8=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eF7/KEOFJlBwvD6JnSvjQ8dKAIF0LGkFQTNAAoMHyDdBcFAOlbbRZEraAZDBIz1wm
         ye7aUIYaFIRSXxN2Esw6471B6skvLDzLdnLEdosAq6uPMlcNf8XappTXECuAWgB8Z1
         ZZgksSB1KSOLrm02El5VcFeEZum1tLNGTaXB8H4CqCIVZIO7uoNmPoZjvbsHSnBLfC
         ImFydG6PC/HdUcK4cqLPwlhfR7BPmcgD0PfX4CLyKue3qOrS56f7v5f48aFSa+/onU
         3gFom3UkkMYDzJ5ERmUOXxK+vm7VNdG//LOlhnHBpZZPFN+xcNhqDg3xSfEDNlxoFf
         j9QmTEgJR0ilA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2] media: vidioc-enum-fmt.rst: make the ENUM_FMT text clearer
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Message-ID: <e9daad9e-f481-93e7-c338-0f29105fc148@xs4all.nl>
Date:   Wed, 6 May 2020 13:40:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJe/eznRf/qNoxVSFxgaTFT83zkzXtgCZ3lk9mv8k9j6lOHHKfYFXbNEV6DAXnRoPp4WG5V/kag/HAAq9UocvxnKn+3sFLlo9Nbd7x6QE4qIR/qbByAG
 PmVj3++uamw7dHwnNcK3JRW8c2D7DhOCtzkZrpqi2mq+uUHOSuOEsI9NQrCsnTnMl9JA2uMrZ/9dpfxYAIRctH3J692we1MObyroKWi/KMHXejHv1VIoqivv
 Cx6Pv3iS8z3HYP70QylJmQKQg5oYj1mQL9RN+oUhkMAxED5JWss2fV493eUNhL3MvjgqZ3bI1acFtCbxKboTpVdMOxqOFUXpvfBcTPqYJRZivRUv6Z1+1sgc
 4nl3pdIIFj/s9ETnE/YfWxyTQspZECJWFfgD02Offvzz5aZFdcPAFPFniA8hen3EdsLWmW/eoZjDASeyyhYJ6fxHC1JPDM6evLJkkMKaABNC7oB8Cmk=
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

Fixes: e5b6b07a1b45 ("media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
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
index 9694111772a2..82f3338d8f66 100644
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
@@ -48,21 +48,35 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
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
+   devices) that media bus code.
+
+   Regardless of the value of the ``mbus_code`` field, the enumerated image
+   formats shall not depend on the active configuration of the video device
+   or device pipeline.


 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -87,8 +101,9 @@ otherwise operate as previously described.
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
