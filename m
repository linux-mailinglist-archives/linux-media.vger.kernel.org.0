Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E1D2C5546
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390017AbgKZN1d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:27:33 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38423 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390007AbgKZN1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:27:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id iHIrkPCQhN7XgiHJ4kYrYT; Thu, 26 Nov 2020 14:27:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606397250; bh=8tCQs7kNmo0PHn9vmaG04/gezXJjbRH/ENyyOaWtrJs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=VMG+uWwBSn1MBa1p9NUKhIAhFI2sK9VOtvb130dm5NKHm5n1F0SBpdcMVZWVAaLJw
         0kPi2GvkQDeOvx/A4tkhd+s8we5O2k4WjIxWN9xKnNCK1WsWvUJFgqvjvJiVPmBcs9
         dOBH4h7M3jH+hhPKWqkhbBdnt47noHa+3KhQsXOgLMdq1ZC3WvBNxut1nvKV0eMEq/
         2AkvNf2uX3DVx/GmT+OCiNgtaVuPyutUgQ/I/1yzNW6GPM6oIgoXSagBkou5Zdtl0f
         Rrl0E2RWl7qreqFrRAUebBU63c93RwLWkWrkDNaEZOGt7vb5m6fCcVPqaPNhaXLFPI
         2knpTtzs5HWiQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/6] userspace-api/media: finalize stateless FWHT codec docs
Date:   Thu, 26 Nov 2020 14:27:17 +0100
Message-Id: <20201126132717.1216907-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
References: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI2mYU/U22kBPRgdIV4rFhhBfw55xjWo5zsUQkgwONGtjwg1nWlRrYf/MrJQoHvJbLKYsi5QGNYkG+ulpk4vZ64bqHvJm7MQfqyIEhP5op/CaxfaPSEs
 KNhiDZ2GQWRALvY/1ucE59gxB3rcgcudHXJ9WYO+jp+tfOzfBX5GBC6qASCiqJdFYLNHnZKzmty7x6R9VW+xQzlEmc74ztHq6NXr6tHANX+rzhgD9OGuut+T
 jXcvYK25kfd7VwvryfEbgl0dbFQXVxeQJ3osXw4pNdw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document V4L2_CTRL_TYPE_FWHT_PARAMS and p_fwht_params. Also
improve the V4L2_PIX_FMT_FWHT_STATELESS description.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 4 +++-
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst          | 4 ++++
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst  | 6 ++++++
 .../userspace-api/media/videodev2.h.rst.exceptions          | 1 +
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 4ae737520925..acad5f3ca0c1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -217,4 +217,6 @@ Compressed Formats
       - ``V4L2_PIX_FMT_FWHT_STATELESS``
       - 'SFWH'
       - Same format as V4L2_PIX_FMT_FWHT but requires stateless codec implementation.
-	See the :ref:`associated Codec Control IDs <v4l2-mpeg-fwht>`.
+        Metadata associated with the frame to decode is required to be passed
+        through the ``V4L2_CID_STATELESS_FWHT_PARAMS`` control.
+	See the :ref:`associated Codec Control ID <codec-stateless-fwht>`.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 5b1fc62ade0d..116d128fa9cf 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -208,6 +208,10 @@ still cause this situation.
       - ``p_h264_decode_params``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_decode_params`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_H264_DECODE_PARAMS``.
+    * - struct :c:type:`v4l2_ctrl_fwht_params` *
+      - ``p_fwht_params``
+      - A pointer to a struct :c:type:`v4l2_ctrl_fwht_params`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_FWHT_PARAMS``.
     * - void *
       - ``ptr``
       - A pointer to a compound type which can be an N-dimensional array
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 9b8716f90f12..82f61f1e2fb8 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -462,6 +462,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_h264_decode_params`, containing H264
 	decode parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_FWHT_PARAMS``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_fwht_params`, containing FWHT
+	parameters for stateless video decoders.
     * - ``V4L2_CTRL_TYPE_HEVC_SPS``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 7f6a4cc2ac4e..0ed170c6e720 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -146,6 +146,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
-- 
2.29.2

