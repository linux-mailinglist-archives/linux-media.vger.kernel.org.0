Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722DF2177C5
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 21:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgGGTRw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 15:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgGGTRw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 15:17:52 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872D5C061755;
        Tue,  7 Jul 2020 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=ZY04TByD13zLeBJmk1gT8w49eKS0CdUVVP5lTKAhLCY=; b=fB4EsnDckGJsxd0u7J3TH9pgfk
        BY8LzimPmG5DmO+5RjSQ02MajK8s3RXWxyf1zfLFaANy254CKKkoV2oXId0fYScd3Q8XcFC/QUjSV
        swg3RGV8OPuNryHOJJXrjrEcgti0sMFFpgfCPha+By249+Csy4gyXkoKwuw5CKsfzhIPIkRl9s79V
        kLJfNV4z7FnMviderc3Q/cQRYwfhLblmFTGfMqOiok5HAwKZSs2S/caZsPZOyH2oVlw8dw8aPQnOr
        Ufh7eHBLwHssZG1WifY8bpQ4vR1yVip96DAvMGfbF7MltTe/Cv/ILRF1hLYxVz6w+CCb679GQjeEh
        5LFE4Z4A==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jst6B-0008Nx-SM; Tue, 07 Jul 2020 19:17:48 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: userspace-api/media: drop doubled words
Message-ID: <18da9c97-1896-958c-5941-f04bcd302ca3@infradead.org>
Date:   Tue, 7 Jul 2020 12:17:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Drop duplicated words in Documentation/userspace-api/media/.
This addresses the words "struct" and "value".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 Documentation/userspace-api/media/dvb/fe-get-info.rst    |    3 +--
 Documentation/userspace-api/media/v4l/buffer.rst         |    4 ++--
 Documentation/userspace-api/media/v4l/dev-osd.rst        |    2 +-
 Documentation/userspace-api/media/v4l/dev-sdr.rst        |    2 +-
 Documentation/userspace-api/media/v4l/hist-v4l2.rst      |    4 ++--
 Documentation/userspace-api/media/v4l/vidioc-dqevent.rst |    2 +-
 6 files changed, 8 insertions(+), 9 deletions(-)

--- linux-5.8-rc3.orig/Documentation/userspace-api/media/v4l/buffer.rst
+++ linux-5.8-rc3/Documentation/userspace-api/media/v4l/buffer.rst
@@ -23,8 +23,8 @@ argument to the :ref:`VIDIOC_QUERYBUF`,
 :ref:`VIDIOC_QBUF <VIDIOC_QBUF>` and
 :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl. In the multi-planar API,
 some plane-specific members of struct :c:type:`v4l2_buffer`,
-such as pointers and sizes for each plane, are stored in struct
-struct :c:type:`v4l2_plane` instead. In that case, struct
+such as pointers and sizes for each plane, are stored in
+struct :c:type:`v4l2_plane` instead. In that case,
 struct :c:type:`v4l2_buffer` contains an array of plane structures.
 
 Dequeued video buffers come with timestamps. The driver decides at which
--- linux-5.8-rc3.orig/Documentation/userspace-api/media/v4l/dev-osd.rst
+++ linux-5.8-rc3/Documentation/userspace-api/media/v4l/dev-osd.rst
@@ -51,7 +51,7 @@ other information, the physical address
 ``base`` field of struct :c:type:`v4l2_framebuffer`.
 The framebuffer device ioctl ``FBIOGET_FSCREENINFO`` returns the same
 address in the ``smem_start`` field of struct
-struct :c:type:`fb_fix_screeninfo`. The ``FBIOGET_FSCREENINFO``
+:c:type:`fb_fix_screeninfo`. The ``FBIOGET_FSCREENINFO``
 ioctl and struct :c:type:`fb_fix_screeninfo` are defined in
 the ``linux/fb.h`` header file.
 
--- linux-5.8-rc3.orig/Documentation/userspace-api/media/v4l/dev-sdr.rst
+++ linux-5.8-rc3/Documentation/userspace-api/media/v4l/dev-sdr.rst
@@ -78,7 +78,7 @@ field of a struct :c:type:`v4l2_format`
 ``V4L2_BUF_TYPE_SDR_CAPTURE`` or ``V4L2_BUF_TYPE_SDR_OUTPUT`` and use
 the struct :c:type:`v4l2_sdr_format` ``sdr`` member
 of the ``fmt`` union as needed per the desired operation. Currently
-there is two fields, ``pixelformat`` and ``buffersize``, of struct
+there is two fields, ``pixelformat`` and ``buffersize``, of
 struct :c:type:`v4l2_sdr_format` which are used.
 Content of the ``pixelformat`` is V4L2 FourCC code of the data format.
 The ``buffersize`` field is maximum buffer size in bytes required for
--- linux-5.8-rc3.orig/Documentation/userspace-api/media/v4l/hist-v4l2.rst
+++ linux-5.8-rc3/Documentation/userspace-api/media/v4l/hist-v4l2.rst
@@ -43,7 +43,7 @@ transmission arguments.
 1998-09-28: Revamped video standard. Made video controls individually
 enumerable.
 
-1998-10-02: The ``id`` field was removed from struct
+1998-10-02: The ``id`` field was removed from
 struct ``video_standard`` and the color subcarrier fields were
 renamed. The :ref:`VIDIOC_QUERYSTD` ioctl was
 renamed to :ref:`VIDIOC_ENUMSTD`,
@@ -260,7 +260,7 @@ multiple tuners into account.)
 
 2000-09-18: ``V4L2_BUF_TYPE_VBI`` was added. This may *break
 compatibility* as the :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and
-:ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctls may fail now if the struct
+:ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctls may fail now if the
 struct ``v4l2_fmt`` ``type`` field does not contain
 ``V4L2_BUF_TYPE_VBI``. In the documentation of the struct
 :c:type:`v4l2_vbi_format` ``offset`` field the
--- linux-5.8-rc3.orig/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ linux-5.8-rc3/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -260,7 +260,7 @@ call.
 	:ref:`v4l2_queryctrl <v4l2-queryctrl>`.
     * - __s32
       - ``default_value``
-      - The default value value of the control. See struct
+      - The default value of the control. See struct
 	:ref:`v4l2_queryctrl <v4l2-queryctrl>`.
 
 
--- linux-5.8-rc3.orig/Documentation/userspace-api/media/dvb/fe-get-info.rst
+++ linux-5.8-rc3/Documentation/userspace-api/media/dvb/fe-get-info.rst
@@ -34,8 +34,7 @@ Arguments
     File descriptor returned by :ref:`open() <frontend_f_open>`.
 
 ``argp``
-    pointer to struct struct
-    :c:type:`dvb_frontend_info`
+    pointer to struct :c:type:`dvb_frontend_info`
 
 
 Description

