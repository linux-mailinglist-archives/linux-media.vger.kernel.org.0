Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B90527E12B
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgI3GgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:59320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727941AbgI3GgJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:09 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 327EE20EDD;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=/vhtb0V0SpZar8+Mb+RFkPXIcOjwExLlB9XuSDwJUjU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MkSfWT7kuU0Q2uS9Y0fFRiyu+iWIOylG3gRPjm6mwJY+SYAJlefMxc214ZDLRUsow
         5xVDqNl67phiP+k9iRZHm3tP/jowcn2jq0ACUfFhd7WiC10MceErhrWxAK+TEHDQAV
         YTej3HLJzc0h4UDJibARKoZKiu/XIkDh29RTLvtE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVie-001Qmg-2b; Wed, 30 Sep 2020 08:36:04 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] media: hist-v4l2.rst: remove :c:`type` from structs and enums
Date:   Wed, 30 Sep 2020 08:36:02 +0200
Message-Id: <fcd31439fbf1e50341a46918ead1a94f214ad584.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601447236.git.mchehab+huawei@kernel.org>
References: <cover.1601447236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using struct|enum :c:`type` here sounds a bad idea, as it may be
documenting data types that were already removed. Also, it makes
the file harder to read.

As automarkup.py should be able to handle those cases, let's
just get rid of the markup.

While not required by automarkup, in order to make easier for
grep, both type and names are now at the same line.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/v4l/hist-v4l2.rst     | 229 ++++++++----------
 1 file changed, 101 insertions(+), 128 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/hist-v4l2.rst b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
index fe60cb9e2e07..1a4fd941f163 100644
--- a/Documentation/userspace-api/media/v4l/hist-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
@@ -45,7 +45,7 @@ renamed to :ref:`VIDIOC_ENUMSTD`,
 Codec API was released.
 
 1998-11-08: Many minor changes. Most symbols have been renamed. Some
-material changes to struct :c:type:`v4l2_capability`.
+material changes to struct v4l2_capability.
 
 1998-11-12: The read/write directon of some ioctls was misdefined.
 
@@ -116,9 +116,8 @@ compatible* with 0.19 and earlier versions. Purpose of these changes was
 to simplify the API, while making it more extensible and following
 common Linux driver API conventions.
 
-1. Some typos in ``V4L2_FMT_FLAG`` symbols were fixed. struct
-   :c:type:`v4l2_clip` was changed for compatibility with
-   v4l. (1999-08-30)
+1. Some typos in ``V4L2_FMT_FLAG`` symbols were fixed. struct v4l2_clip
+   was changed for compatibility with v4l. (1999-08-30)
 
 2. ``V4L2_TUNER_SUB_LANG1`` was added. (1999-09-05)
 
@@ -151,16 +150,14 @@ common Linux driver API conventions.
    This change obsoletes the following ioctls: ``VIDIOC_S_INFMT``,
    ``VIDIOC_G_INFMT``, ``VIDIOC_S_OUTFMT``, ``VIDIOC_G_OUTFMT``,
    ``VIDIOC_S_VBIFMT`` and ``VIDIOC_G_VBIFMT``. The image format
-   structure struct :c:type:`v4l2_format` was renamed to struct
-   :c:type:`v4l2_pix_format`, while struct
-   :c:type:`v4l2_format` is now the envelopping structure
+   struct v4l2_format was renamed to struct v4l2_pix_format, while
+   struct v4l2_format is now the envelopping structure
    for all format negotiations.
 
 5. Similar to the changes above, the ``VIDIOC_G_PARM`` and
    ``VIDIOC_S_PARM`` ioctls were merged with ``VIDIOC_G_OUTPARM`` and
-   ``VIDIOC_S_OUTPARM``. A ``type`` field in the new struct
-   :c:type:`v4l2_streamparm` selects the respective
-   union member.
+   ``VIDIOC_S_OUTPARM``. A ``type`` field in the new struct v4l2_streamparm
+   selects the respective union member.
 
    This change obsoletes the ``VIDIOC_G_OUTPARM`` and
    ``VIDIOC_S_OUTPARM`` ioctls.
@@ -178,7 +175,7 @@ common Linux driver API conventions.
    categories might have a greater separation, or may even appear in
    separate windows.
 
-7. The struct :c:type:`v4l2_buffer` ``timestamp`` was
+7. The struct v4l2_buffer ``timestamp`` was
    changed to a 64 bit integer, containing the sampling or output time
    of the frame in nanoseconds. Additionally timestamps will be in
    absolute system time, not starting from zero at the beginning of a
@@ -201,16 +198,15 @@ common Linux driver API conventions.
    v4l2_masterclock_gettime() function (used only by drivers) to
    return a 64-bit integer.
 
-8. A ``sequence`` field was added to struct
-   :c:type:`v4l2_buffer`. The ``sequence`` field counts
-   captured frames, it is ignored by output devices. When a capture
-   driver drops a frame, the sequence number of that frame is skipped.
+8. A ``sequence`` field was added to struct v4l2_buffer. The ``sequence``
+   field counts captured frames, it is ignored by output devices. When a
+   capture driver drops a frame, the sequence number of that frame is skipped.
 
 
 V4L2 Version 0.20 incremental changes
 =====================================
 
-1999-12-23: In struct :c:type:`v4l2_vbi_format` the
+1999-12-23: In struct v4l2_vbi_format the
 ``reserved1`` field became ``offset``. Previously drivers were required
 to clear the ``reserved1`` field.
 
@@ -255,10 +251,9 @@ multiple tuners into account.)
 compatibility* as the :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and
 :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctls may fail now if the
 struct ``v4l2_fmt`` ``type`` field does not contain
-``V4L2_BUF_TYPE_VBI``. In the documentation of the struct
-:c:type:`v4l2_vbi_format` ``offset`` field the
-ambiguous phrase "rising edge" was changed to "leading edge".
-
+``V4L2_BUF_TYPE_VBI``. In the documentation of the struct v4l2_vbi_format`,
+the ``offset`` field the ambiguous phrase "rising edge" was changed to
+"leading edge".
 
 V4L2 Version 0.20 2000-11-23
 ============================
@@ -321,7 +316,7 @@ This unnamed version was finally merged into Linux 2.5.46.
     until the application attempts to initiate a data exchange, see
     :ref:`open`.
 
-3.  The struct :c:type:`v4l2_capability` changed
+3.  The struct v4l2_capability changed
     dramatically. Note that also the size of the structure changed,
     which is encoded in the ioctl request code, thus older V4L2 devices
     will respond with an ``EINVAL`` error code to the new
@@ -354,7 +349,7 @@ This unnamed version was finally merged into Linux 2.5.46.
     ``V4L2_FLAG_MONOCHROME`` flag was removed, this information is
     available as described in :ref:`format`.
 
-4.  In struct :c:type:`v4l2_input` the ``assoc_audio``
+4.  In struct v4l2_input the ``assoc_audio``
     field and the ``capability`` field and its only flag
     ``V4L2_INPUT_CAP_AUDIO`` was replaced by the new ``audioset`` field.
     Instead of linking one video input to one audio input this field
@@ -363,11 +358,11 @@ This unnamed version was finally merged into Linux 2.5.46.
     New fields are ``tuner`` (reversing the former link from tuners to
     video inputs), ``std`` and ``status``.
 
-    Accordingly struct :c:type:`v4l2_output` lost its
+    Accordingly struct v4l2_output lost its
     ``capability`` and ``assoc_audio`` fields. ``audioset``,
     ``modulator`` and ``std`` where added instead.
 
-5.  The struct :c:type:`v4l2_audio` field ``audio`` was
+5.  The struct v4l2_audio field ``audio`` was
     renamed to ``index``, for consistency with other structures. A new
     capability flag ``V4L2_AUDCAP_STEREO`` was added to indicated if the
     audio input in question supports stereo sound.
@@ -375,21 +370,20 @@ This unnamed version was finally merged into Linux 2.5.46.
     where removed. This can be easily implemented using controls.
     (However the same applies to AVL which is still there.)
 
-    Again for consistency the struct
-    :c:type:`v4l2_audioout` field ``audio`` was renamed
+    Again for consistency the struct v4l2_audioout field ``audio`` was renamed
     to ``index``.
 
-6.  The struct :c:type:`v4l2_tuner` ``input`` field was
+6.  The struct v4l2_tuner ``input`` field was
     replaced by an ``index`` field, permitting devices with multiple
     tuners. The link between video inputs and tuners is now reversed,
     inputs point to their tuner. The ``std`` substructure became a
-    simple set (more about this below) and moved into struct
-    :c:type:`v4l2_input`. A ``type`` field was added.
+    simple set (more about this below) and moved into struct v4l2_input.
+    A ``type`` field was added.
 
-    Accordingly in struct :c:type:`v4l2_modulator` the
+    Accordingly in struct v4l2_modulator the
     ``output`` was replaced by an ``index`` field.
 
-    In struct :c:type:`v4l2_frequency` the ``port``
+    In struct v4l2_frequency the ``port``
     field was replaced by a ``tuner`` field containing the respective
     tuner or modulator index number. A tuner ``type`` field was added
     and the ``reserved`` field became larger for future extensions
@@ -405,7 +399,7 @@ This unnamed version was finally merged into Linux 2.5.46.
     :ref:`VIDIOC_S_STD <VIDIOC_G_STD>` now take a pointer to this
     type as argument. :ref:`VIDIOC_QUERYSTD` was
     added to autodetect the received standard, if the hardware has this
-    capability. In struct :c:type:`v4l2_standard` an
+    capability. In struct v4l2_standard an
     ``index`` field was added for
     :ref:`VIDIOC_ENUMSTD`. A
     :ref:`v4l2_std_id <v4l2-std-id>` field named ``id`` was added as
@@ -417,10 +411,10 @@ This unnamed version was finally merged into Linux 2.5.46.
 
     Struct ``v4l2_enumstd`` ceased to be.
     :ref:`VIDIOC_ENUMSTD` now takes a pointer to a
-    struct :c:type:`v4l2_standard` directly. The
+    struct v4l2_standard directly. The
     information which standards are supported by a particular video
-    input or output moved into struct :c:type:`v4l2_input`
-    and struct :c:type:`v4l2_output` fields named ``std``,
+    input or output moved into struct v4l2_input
+    and struct v4l2_output fields named ``std``,
     respectively.
 
 8.  The struct :ref:`v4l2_queryctrl <v4l2-queryctrl>` fields
@@ -432,14 +426,13 @@ This unnamed version was finally merged into Linux 2.5.46.
     :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>`, but without the overhead of
     programming the hardware and regardless of I/O in progress.
 
-    In struct :c:type:`v4l2_format` the ``fmt`` union was
-    extended to contain struct :c:type:`v4l2_window`. All
+    In struct v4l2_format the ``fmt`` union was
+    extended to contain struct v4l2_window. All
     image format negotiations are now possible with ``VIDIOC_G_FMT``,
     ``VIDIOC_S_FMT`` and ``VIDIOC_TRY_FMT``; ioctl. The ``VIDIOC_G_WIN``
     and ``VIDIOC_S_WIN`` ioctls to prepare for a video overlay were
-    removed. The ``type`` field changed to type enum
-    :c:type:`v4l2_buf_type` and the buffer type names
-    changed as follows.
+    removed. The ``type`` field changed to type enum v4l2_buf_type and
+    the buffer type names changed as follows.
 
 
 
@@ -448,7 +441,7 @@ This unnamed version was finally merged into Linux 2.5.46.
 	:stub-columns: 0
 
 	* - Old defines
-	  - enum :c:type:`v4l2_buf_type`
+	  - enum v4l2_buf_type
 	* - ``V4L2_BUF_TYPE_CAPTURE``
 	  - ``V4L2_BUF_TYPE_VIDEO_CAPTURE``
 	* - ``V4L2_BUF_TYPE_CODECIN``
@@ -476,16 +469,12 @@ This unnamed version was finally merged into Linux 2.5.46.
 	* - ``V4L2_BUF_TYPE_PRIVATE_BASE``
 	  - ``V4L2_BUF_TYPE_PRIVATE`` (but this is deprecated)
 
+10. In struct v4l2_fmtdesc a enum v4l2_buf_type field named ``type`` was
+    added as in struct v4l2_format. The ``VIDIOC_ENUM_FBUFFMT`` ioctl is no
+    longer needed and was removed. These calls can be replaced by
+    :ref:`VIDIOC_ENUM_FMT` with type ``V4L2_BUF_TYPE_VIDEO_OVERLAY``.
 
-10. In struct :c:type:`v4l2_fmtdesc` a enum
-    :c:type:`v4l2_buf_type` field named ``type`` was
-    added as in struct :c:type:`v4l2_format`. The
-    ``VIDIOC_ENUM_FBUFFMT`` ioctl is no longer needed and was removed.
-    These calls can be replaced by
-    :ref:`VIDIOC_ENUM_FMT` with type
-    ``V4L2_BUF_TYPE_VIDEO_OVERLAY``.
-
-11. In struct :c:type:`v4l2_pix_format` the ``depth``
+11. In struct v4l2_pix_format the ``depth``
     field was removed, assuming applications which recognize the format
     by its four-character-code already know the color depth, and others
     do not care about it. The same rationale lead to the removal of the
@@ -498,18 +487,15 @@ This unnamed version was finally merged into Linux 2.5.46.
     Since the remaining flags were replaced as well, the ``flags`` field
     itself was removed.
 
-    The interlace flags were replaced by a enum
-    :c:type:`v4l2_field` value in a newly added ``field``
-    field.
-
-
+    The interlace flags were replaced by a enum v4l2_field value in a
+    newly added ``field`` field.
 
     .. flat-table::
 	:header-rows:  1
 	:stub-columns: 0
 
 	* - Old flag
-	  - enum :c:type:`v4l2_field`
+	  - enum v4l2_field
 	* - ``V4L2_FMT_FLAG_NOT_INTERLACED``
 	  - ?
 	* - ``V4L2_FMT_FLAG_INTERLACED`` = ``V4L2_FMT_FLAG_COMBINED``
@@ -525,33 +511,31 @@ This unnamed version was finally merged into Linux 2.5.46.
 	* - ``-``
 	  - ``V4L2_FIELD_ALTERNATE``
 
-
-    The color space flags were replaced by a enum
-    :c:type:`v4l2_colorspace` value in a newly added
-    ``colorspace`` field, where one of ``V4L2_COLORSPACE_SMPTE170M``,
-    ``V4L2_COLORSPACE_BT878``, ``V4L2_COLORSPACE_470_SYSTEM_M`` or
+    The color space flags were replaced by a enum v4l2_colorspace value in
+    a newly added ``colorspace`` field, where one of
+    ``V4L2_COLORSPACE_SMPTE170M``, ``V4L2_COLORSPACE_BT878``,
+    ``V4L2_COLORSPACE_470_SYSTEM_M`` or
     ``V4L2_COLORSPACE_470_SYSTEM_BG`` replaces ``V4L2_FMT_CS_601YUV``.
 
-12. In struct :c:type:`v4l2_requestbuffers` the
-    ``type`` field was properly defined as enum
-    :c:type:`v4l2_buf_type`. Buffer types changed as
-    mentioned above. A new ``memory`` field of type enum
-    :c:type:`v4l2_memory` was added to distinguish between
+12. In struct v4l2_requestbuffers the
+    ``type`` field was properly defined as enum v4l2_buf_type. Buffer types
+    changed as mentioned above. A new ``memory`` field of type
+    enum v4l2_memory was added to distinguish between
     I/O methods using buffers allocated by the driver or the
     application. See :ref:`io` for details.
 
-13. In struct :c:type:`v4l2_buffer` the ``type`` field was
-    properly defined as enum :c:type:`v4l2_buf_type`.
+13. In struct v4l2_buffer the ``type`` field was
+    properly defined as enum v4l2_buf_type.
     Buffer types changed as mentioned above. A ``field`` field of type
-    enum :c:type:`v4l2_field` was added to indicate if a
+    enum v4l2_field was added to indicate if a
     buffer contains a top or bottom field. The old field flags were
     removed. Since no unadjusted system time clock was added to the
     kernel as planned, the ``timestamp`` field changed back from type
     stamp_t, an unsigned 64 bit integer expressing the sample time in
-    nanoseconds, to struct :c:type:`timeval`. With the addition
+    nanoseconds, to struct timeval. With the addition
     of a second memory mapping method the ``offset`` field moved into
-    union ``m``, and a new ``memory`` field of type enum
-    :c:type:`v4l2_memory` was added to distinguish between
+    union ``m``, and a new ``memory`` field of type enum v4l2_memory
+    was added to distinguish between
     I/O methods. See :ref:`io` for details.
 
     The ``V4L2_BUF_REQ_CONTIG`` flag was used by the V4L compatibility
@@ -560,7 +544,7 @@ This unnamed version was finally merged into Linux 2.5.46.
     indeed allocated in device memory rather than DMA-able system
     memory. It was barely useful and so was removed.
 
-14. In struct :c:type:`v4l2_framebuffer` the
+14. In struct v4l2_framebuffer the
     ``base[3]`` array anticipating double- and triple-buffering in
     off-screen video memory, however without defining a synchronization
     mechanism, was replaced by a single pointer. The
@@ -571,39 +555,38 @@ This unnamed version was finally merged into Linux 2.5.46.
     ``V4L2_FBUF_CAP_LIST_CLIPPING`` and
     ``V4L2_FBUF_CAP_BITMAP_CLIPPING``.
 
-15. In struct :c:type:`v4l2_clip` the ``x``, ``y``,
+15. In struct v4l2_clip the ``x``, ``y``,
     ``width`` and ``height`` field moved into a ``c`` substructure of
-    type struct :c:type:`v4l2_rect`. The ``x`` and ``y``
+    type struct v4l2_rect. The ``x`` and ``y``
     fields were renamed to ``left`` and ``top``, i. e. offsets to a
     context dependent origin.
 
-16. In struct :c:type:`v4l2_window` the ``x``, ``y``,
+16. In struct v4l2_window the ``x``, ``y``,
     ``width`` and ``height`` field moved into a ``w`` substructure as
-    above. A ``field`` field of type :c:type:`v4l2_field` was added to
+    above. A ``field`` field of type enum v4l2_field was added to
     distinguish between field and frame (interlaced) overlay.
 
 17. The digital zoom interface, including struct ``v4l2_zoomcap``,
     struct ``v4l2_zoom``, ``V4L2_ZOOM_NONCAP`` and
     ``V4L2_ZOOM_WHILESTREAMING`` was replaced by a new cropping and
     scaling interface. The previously unused
-    struct :c:type:`v4l2_cropcap` and struct :c:type:`v4l2_crop`
+    struct v4l2_cropcap and struct v4l2_crop
     where redefined for this purpose. See :ref:`crop` for details.
 
-18. In struct :c:type:`v4l2_vbi_format` the
+18. In struct v4l2_vbi_format the
     ``SAMPLE_FORMAT`` field now contains a four-character-code as used
     to identify video image formats and ``V4L2_PIX_FMT_GREY`` replaces
     the ``V4L2_VBI_SF_UBYTE`` define. The ``reserved`` field was
     extended.
 
-19. In struct :c:type:`v4l2_captureparm` the type of
-    the ``timeperframe`` field changed from unsigned long to struct
-    :c:type:`v4l2_fract`. This allows the accurate
+19. In struct v4l2_captureparm the type of
+    the ``timeperframe`` field changed from unsigned long to
+    struct v4l2_fract. This allows the accurate
     expression of multiples of the NTSC-M frame rate 30000 / 1001. A new
     field ``readbuffers`` was added to control the driver behaviour in
     read I/O mode.
 
-    Similar changes were made to struct
-    :c:type:`v4l2_outputparm`.
+    Similar changes were made to struct v4l2_outputparm.
 
 20. The struct ``v4l2_performance`` and
     ``VIDIOC_G_PERF`` ioctl were dropped. Except when using the
@@ -720,7 +703,7 @@ V4L2 in Linux 2.6.8
 ===================
 
 1. A new field ``input`` (former ``reserved[0]``) was added to the
-   struct :c:type:`v4l2_buffer` structure. Purpose of this
+   struct v4l2_buffer. Purpose of this
    field is to alternate between video inputs (e. g. cameras) in step
    with the video capturing process. This function must be enabled with
    the new ``V4L2_BUF_FLAG_INPUT`` flag. The ``flags`` field is no
@@ -740,7 +723,7 @@ V4L2 spec erratum 2004-08-01
 
 4. The documentation of the :ref:`VIDIOC_QBUF` and
    :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctls did not mention the
-   struct :c:type:`v4l2_buffer` ``memory`` field. It was
+   struct v4l2_buffer ``memory`` field. It was
    also missing from examples. Also on the ``VIDIOC_DQBUF`` page the ``EIO``
    error code was not documented.
 
@@ -786,11 +769,10 @@ the wrong argument type.
 V4L2 spec erratum 2006-01-10
 ============================
 
-1. The ``V4L2_IN_ST_COLOR_KILL`` flag in struct
-   :c:type:`v4l2_input` not only indicates if the color
-   killer is enabled, but also if it is active. (The color killer
-   disables color decoding when it detects no color in the video signal
-   to improve the image quality.)
+1. The ``V4L2_IN_ST_COLOR_KILL`` flag in struct v4l2_input not only
+   indicates if the color killer is enabled, but also if it is active.
+   (The color killer disables color decoding when it detects no color
+   in the video signal to improve the image quality.)
 
 2. :ref:`VIDIOC_S_PARM <VIDIOC_G_PARM>` is a write-read ioctl, not
    write-only as stated on its reference page. The ioctl changed in 2003
@@ -800,19 +782,17 @@ V4L2 spec erratum 2006-01-10
 V4L2 spec erratum 2006-02-03
 ============================
 
-1. In struct :c:type:`v4l2_captureparm` and struct
-   :c:type:`v4l2_outputparm` the ``timeperframe``
+1. In struct v4l2_captureparm and struct v4l2_outputparm the ``timeperframe``
    field gives the time in seconds, not microseconds.
 
 
 V4L2 spec erratum 2006-02-04
 ============================
 
-1. The ``clips`` field in struct :c:type:`v4l2_window`
-   must point to an array of struct :c:type:`v4l2_clip`, not
+1. The ``clips`` field in struct v4l2_window
+   must point to an array of struct v4l2_clip, not
    a linked list, because drivers ignore the
-   struct :c:type:`v4l2_clip`. ``next`` pointer.
-
+   struct v4l2_clip. ``next`` pointer.
 
 V4L2 in Linux 2.6.17
 ====================
@@ -836,19 +816,18 @@ V4L2 spec erratum 2006-09-23 (Draft 0.15)
    ``V4L2_BUF_TYPE_SLICED_VBI_OUTPUT`` of the sliced VBI interface were
    not mentioned along with other buffer types.
 
-2. In :ref:`VIDIOC_G_AUDIO <VIDIOC_G_AUDIO>` it was clarified that the struct
-   :c:type:`v4l2_audio` ``mode`` field is a flags field.
+2. In :ref:`VIDIOC_G_AUDIO <VIDIOC_G_AUDIO>` it was clarified that the
+   struct v4l2_audio ``mode`` field is a flags field.
 
 3. :ref:`VIDIOC_QUERYCAP` did not mention the sliced VBI and radio
    capability flags.
 
-4. In :ref:`VIDIOC_G_FREQUENCY <VIDIOC_G_FREQUENCY>` it was clarified that applications
-   must initialize the tuner ``type`` field of struct
-   :c:type:`v4l2_frequency` before calling
+4. In :ref:`VIDIOC_G_FREQUENCY <VIDIOC_G_FREQUENCY>` it was clarified that
+   applications must initialize the tuner ``type`` field of
+   struct v4l2_frequency before calling
    :ref:`VIDIOC_S_FREQUENCY <VIDIOC_G_FREQUENCY>`.
 
-5. The ``reserved`` array in struct
-   :c:type:`v4l2_requestbuffers` has 2 elements,
+5. The ``reserved`` array in struct v4l2_requestbuffers has 2 elements,
    not 32.
 
 6. In :ref:`output` and :ref:`raw-vbi` the device file names
@@ -868,7 +847,7 @@ V4L2 in Linux 2.6.18
    flag to skip unsupported controls with
    :ref:`VIDIOC_QUERYCTRL`, new control types
    ``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_TYPE_CTRL_CLASS``
-   (:c:type:`v4l2_ctrl_type`), and new control flags
+   (enum v4l2_ctrl_type), and new control flags
    ``V4L2_CTRL_FLAG_READ_ONLY``, ``V4L2_CTRL_FLAG_UPDATE``,
    ``V4L2_CTRL_FLAG_INACTIVE`` and ``V4L2_CTRL_FLAG_SLIDER``
    (:ref:`control-flags`). See :ref:`extended-controls` for details.
@@ -877,7 +856,7 @@ V4L2 in Linux 2.6.18
 V4L2 in Linux 2.6.19
 ====================
 
-1. In struct :c:type:`v4l2_sliced_vbi_cap` a
+1. In struct v4l2_sliced_vbi_cap a
    buffer type field was added replacing a reserved field. Note on
    architectures where the size of enum types differs from int types the
    size of the structure changed. The
@@ -915,7 +894,7 @@ V4L2 in Linux 2.6.22
 ====================
 
 1. Two new field orders ``V4L2_FIELD_INTERLACED_TB`` and
-   ``V4L2_FIELD_INTERLACED_BT`` were added. See :c:type:`v4l2_field` for
+   ``V4L2_FIELD_INTERLACED_BT`` were added. See enum v4l2_field for
    details.
 
 2. Three new clipping/blending methods with a global or straight or
@@ -923,19 +902,17 @@ V4L2 in Linux 2.6.22
    See the description of the :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`
    and :ref:`VIDIOC_S_FBUF <VIDIOC_G_FBUF>` ioctls for details.
 
-   A new ``global_alpha`` field was added to
-   :c:type:`v4l2_window`, extending the structure. This
-   may *break compatibility* with applications using a
-   struct :c:type:`v4l2_window` directly. However the
+   A new ``global_alpha`` field was added to struct v4l2_window,
+   extending the structure. This may **break compatibility** with
+   applications using a struct v4l2_window directly. However the
    :ref:`VIDIOC_G/S/TRY_FMT <VIDIOC_G_FMT>` ioctls, which take a
-   pointer to a :c:type:`v4l2_format` parent structure
+   pointer to a struct v4l2_format parent structure
    with padding bytes at the end, are not affected.
 
-3. The format of the ``chromakey`` field in struct
-   :c:type:`v4l2_window` changed from "host order RGB32"
-   to a pixel value in the same format as the framebuffer. This may
-   *break compatibility* with existing applications. Drivers supporting
-   the "host order RGB32" format are not known.
+3. The format of the ``chromakey`` field in struct v4l2_window changed from
+   "host order RGB32" to a pixel value in the same format as the framebuffer.
+   This may **break compatibility** with existing applications. Drivers
+   supporting the "host order RGB32" format are not known.
 
 
 V4L2 in Linux 2.6.24
@@ -1164,7 +1141,7 @@ V4L2 in Linux 3.5
 V4L2 in Linux 3.6
 =================
 
-1. Replaced ``input`` in struct :c:type:`v4l2_buffer` by
+1. Replaced ``input`` in struct v4l2_buffer by
    ``reserved2`` and removed ``V4L2_BUF_FLAG_INPUT``.
 
 2. Added V4L2_CAP_VIDEO_M2M and V4L2_CAP_VIDEO_M2M_MPLANE
@@ -1178,7 +1155,7 @@ V4L2 in Linux 3.9
 =================
 
 1. Added timestamp types to ``flags`` field in
-   struct :c:type:`v4l2_buffer`. See :ref:`buffer-flags`.
+   struct v4l2_buffer. See :ref:`buffer-flags`.
 
 2. Added ``V4L2_EVENT_CTRL_CH_RANGE`` control event changes flag. See
    :ref:`ctrl-changes-flags`.
@@ -1205,7 +1182,7 @@ V4L2 in Linux 3.11
 V4L2 in Linux 3.14
 ==================
 
-1. In struct :c:type:`v4l2_rect`, the type of ``width`` and
+1. In struct v4l2_rect, the type of ``width`` and
    ``height`` fields changed from _s32 to _u32.
 
 
@@ -1224,7 +1201,7 @@ V4L2 in Linux 3.16
 V4L2 in Linux 3.17
 ==================
 
-1. Extended struct :c:type:`v4l2_pix_format`. Added
+1. Extended struct v4l2_pix_format. Added
    format flags.
 
 2. Added compound control types and
@@ -1241,13 +1218,9 @@ V4L2 in Linux 3.18
 V4L2 in Linux 3.19
 ==================
 
-1. Rewrote Colorspace chapter, added new enum
-   :c:type:`v4l2_ycbcr_encoding` and enum
-   :c:type:`v4l2_quantization` fields to struct
-   :c:type:`v4l2_pix_format`, struct
-   :c:type:`v4l2_pix_format_mplane` and
-   struct :c:type:`v4l2_mbus_framefmt`.
-
+1. Rewrote Colorspace chapter, added new enum v4l2_ycbcr_encoding
+   and enum v4l2_quantization fields to struct v4l2_pix_format,
+   struct v4l2_pix_format_mplane and struct v4l2_mbus_framefmt.
 
 V4L2 in Linux 4.4
 =================
-- 
2.26.2

