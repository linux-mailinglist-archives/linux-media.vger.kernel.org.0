Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3197A34016E
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 10:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhCRJDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 05:03:32 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38847 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229540AbhCRJDM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 05:03:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MoYclIPqNDUxpMoYgliDxm; Thu, 18 Mar 2021 10:03:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616058190; bh=PKajviO7uivJkmQG4FS31K3PvYrAPn9uHRQMzwJBBCw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s3iNO/bKPwnxAyaeji90458n9s+QN713PrePBHfW80yM58C76rjGtJ4vtZqlpYU0z
         u9s/W9fFN4YW3hqSxzKABF4kKuMyFxS6oZy4ggc0p7Us+TiAv5Ll52622BjbScuK0I
         WeB4T0Dn3D6atYH/L5YjIQKP50sa5za5zMP+RaZiKdpK/CBM8502/Q6M3ZsMNFETW5
         yv3fU0YICbfdy7QP+kMnmtF2kYEEFUjsVLpKtvXUqzclPOK4CVtkPNFlcK2XaFi4xp
         Fo13IJaiiZEl5VDJ3zXlrlbT2HjjebFO4nwTm7vyM7qrQaU5QAyvjtx8rB0BskfrqN
         0iOc7P9RkDRJQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vidioc-g-ext-ctrls.rst: reformat tables and clarify which vs
 ctrl_class
Message-ID: <1a94550f-41c6-feb0-6044-c60f764c832f@xs4all.nl>
Date:   Thu, 18 Mar 2021 10:03:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPiPe5xHU8RHqjTzEiRHZHCHURVXQ9kpm/EonT8IpSrk77ENnYzS42Y1pup/MF04HF8LJ8yeI3ss1OqB55TIxT4mlPf0sYBqAJde4mSNEsQMEZI4etGm
 CNORJ8FclRsAob6fysJcuRktyuZ64WkeB7ujKIt6JsvYlFNtorqSQzI0SmqcOJyQd/3ooHE2J9z1MB+0WJXnA+W6HMeLcW5gWyU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIDIOC_G/S/TRY_EXT_CTRLS documentation has large explanatory texts for
some of the fields in a table. This makes it hard to read. Move those text to
a new cell spanning the whole width of the table, similar to what was done
for struct v4l2_pix_format. This makes it much more readable.

Also move the 'ctrl_class' description to below the 'which' description and
just mention that it is deprecated and that 'which' should be used instead.

Finally remove 'note::' for the V4L2_CTRL_WHICH_DEF_VAL description. It doesn't
have to be marked as a note, it's just a simple paragraph.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 01773f01c4a7..f2b4786721eb 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -138,11 +138,12 @@ still cause this situation.
       - Identifies the control, set by the application.
     * - __u32
       - ``size``
-      - The total size in bytes of the payload of this control. This is
-	normally 0, but for pointer controls this should be set to the
-	size of the memory containing the payload, or that will receive
-	the payload. If :ref:`VIDIOC_G_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` finds that this value is
-	less than is required to store the payload result, then it is set
+      - The total size in bytes of the payload of this control.
+    * - :cspan:`2` The ``size`` field is normally 0, but for pointer
+	controls this should be set to the size of the memory that contains
+	the payload or that will receive the payload.
+	If :ref:`VIDIOC_G_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` finds that this value
+	is less than is required to store the payload result, then it is set
 	to a value large enough to store the payload result and ``ENOSPC`` is
 	returned.

@@ -242,30 +243,19 @@ still cause this situation.

     * - union {
       - (anonymous)
-    * - __u32
-      - ``ctrl_class``
-      - The control class to which all controls belong, see
-	:ref:`ctrl-class`. Drivers that use a kernel framework for
-	handling controls will also accept a value of 0 here, meaning that
-	the controls can belong to any control class. Whether drivers
-	support this can be tested by setting ``ctrl_class`` to 0 and
-	calling :ref:`VIDIOC_TRY_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` with a ``count`` of 0. If that
-	succeeds, then the driver supports this feature.
     * - __u32
       - ``which``
       - Which value of the control to get/set/try.
-	``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of the
-	control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
+    * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
+	the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
 	value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
 	these controls have to be retrieved from a request or tried/set for
 	a request. In the latter case the ``request_fd`` field contains the
 	file descriptor of the request that should be used. If the device
 	does not support requests, then ``EACCES`` will be returned.

-	.. note::
-
-	   When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
-	   get the default value of the control, you cannot set or try it.
+	When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
+	get the default value of the control, you cannot set or try it.

 	For backwards compatibility you can also use a control class here
 	(see :ref:`ctrl-class`). In that case all controls have to
@@ -273,9 +263,12 @@ still cause this situation.
 	just use ``V4L2_CTRL_WHICH_CUR_VAL``. There are some very old
 	drivers that do not yet support ``V4L2_CTRL_WHICH_CUR_VAL`` and
 	that require a control class here. You can test for such drivers
-	by setting ctrl_class to ``V4L2_CTRL_WHICH_CUR_VAL`` and calling
-	VIDIOC_TRY_EXT_CTRLS with a count of 0. If that fails, then the
-	driver does not support ``V4L2_CTRL_WHICH_CUR_VAL``.
+	by setting ``which`` to ``V4L2_CTRL_WHICH_CUR_VAL`` and calling
+	:ref:`VIDIOC_TRY_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` with a count of 0.
+	If that fails, then the driver does not support ``V4L2_CTRL_WHICH_CUR_VAL``.
+    * - __u32
+      - ``ctrl_class``
+      - Deprecated name kept for backwards compatibility. Use ``which`` instead.
     * - }
       -
     * - __u32
@@ -283,7 +276,8 @@ still cause this situation.
       - The number of controls in the controls array. May also be zero.
     * - __u32
       - ``error_idx``
-      - Set by the driver in case of an error. If the error is associated
+      - Index of the failing control. Set by the driver in case of an error.
+    * - :cspan:`2` If the error is associated
 	with a particular control, then ``error_idx`` is set to the index
 	of that control. If the error is not related to a specific
 	control, or the validation step failed (see below), then
