Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B9136D5A1
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 12:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239179AbhD1KTd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 06:19:33 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40273 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239186AbhD1KTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 06:19:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id bhHFlUpapk1MGbhHKlO0cl; Wed, 28 Apr 2021 12:18:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619605126; bh=FaGFLXMN8fAUU3nHBbcLeEzxvjl5hbViH+zIyDrLHLI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Z1OKyJT+dHTjRkMamRKaKxfziWxbntuMpTWSZfuGno1+jqqNgj/AlFmuWRznJ2YXv
         YqPPuemEI8yuo4x/+zTjZX9mBkGX+2GUt/pZtrvoSHc2sZBXLRK4h+HgoqctXEVE7h
         uBekGyIcGO7YQwBziAzNJ4fm1G+/7pQjSASqLaousbvJxrecTqXPUFvxCKMFebqBIo
         EAEWRGxT4VPEL4PB655R7t7RLEdbVkAH8uvHHBpdG+z98Bhv6S3Vf/XWYrw8HAMxT4
         fTTnPkNVRi+BJrFCPXQ+NIja4Ecndbd6zzFP+jGvPvRHnRJlUYX7Ks9e98jsUSwo62
         xvMjDuPDPZoVg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 3/5] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Date:   Wed, 28 Apr 2021 12:18:39 +0200
Message-Id: <20210428101841.696059-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428101841.696059-1-hverkuil-cisco@xs4all.nl>
References: <20210428101841.696059-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHFQWPhSbygR6iT2W13lBgP0QONlYInXOymdCv7Sr2VSP0Tze59t8nFvpcl/AWTb8ENYk2aG9D9aJBsChs9V1U/dy+aQkcR8h1H2+H+pXH/jOXKve1fJ
 RGoAmEGO5U2zki+fBosc5N7esDu/wIXxy/nSBfUVeThZsYKK/oYTHeVdNKRg2aAkbuA1XUgMgp/N9yXZLlYIIZKNWZA79uwRNkmg52hWip9Dw5B8ImYDpMGz
 4AjhafpWQkdW47bYN/quankPHVj7uvmT4l8uC/swIY1H2RWwfEp4DyFfPVtz4VsxXGqS4bTuJniQ4vs5L8I6ofG35S9jgkP95sIgzZA3cAM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new flag that indicates that this control is a dynamically sized
array. Also document this flag.

Currently dynamically sized arrays are limited to one dimensional arrays,
but that might change in the future if there is a need for it.

The initial use-case of dynamic arrays are stateless codecs. A frame
can be divided in many slices, so you want to provide an array containing
slice information for each slice. Typically the number of slices is small,
but the standard allow for hundreds or thousands of slices. Dynamic arrays
are a good solution since sizing the array for the worst case would waste
substantial amounts of memory.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/v4l/vidioc-queryctrl.rst          | 8 ++++++++
 .../userspace-api/media/videodev2.h.rst.exceptions        | 1 +
 include/uapi/linux/videodev2.h                            | 1 +
 3 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 8a285daedc6a..4a7b2e8dec79 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -595,6 +595,14 @@ See also the examples in :ref:`control`.
 	``V4L2_CTRL_FLAG_GRABBED`` flag when buffers are allocated or
 	streaming is in progress since most drivers do not support changing
 	the format in that case.
+    * - ``V4L2_CTRL_FLAG_DYNAMIC_ARRAY``
+      - 0x0800
+      - This control is a dynamically sized 1-dimensional array. It
+        behaves the same as a regular array, except that the number
+	of elements as reported by the ``elems`` field is between 1 and
+	``dims[0]``. So setting the control with a differently sized
+	array will change the ``elems`` field when the control is
+	queried afterwards.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index f59940352faa..362a4389e60c 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -374,6 +374,7 @@ replace define V4L2_CTRL_FLAG_VOLATILE control-flags
 replace define V4L2_CTRL_FLAG_HAS_PAYLOAD control-flags
 replace define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE control-flags
 replace define V4L2_CTRL_FLAG_MODIFY_LAYOUT control-flags
+replace define V4L2_CTRL_FLAG_DYNAMIC_ARRAY control-flags
 
 replace define V4L2_CTRL_FLAG_NEXT_CTRL control
 replace define V4L2_CTRL_FLAG_NEXT_COMPOUND control
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 311a01cc5775..6264dc389193 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1862,6 +1862,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
+#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.30.2

