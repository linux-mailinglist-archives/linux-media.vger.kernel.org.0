Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4402B1572F4
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 11:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgBJKmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 05:42:45 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:32875 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726792AbgBJKmp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 05:42:45 -0500
Received: from [IPv6:2001:983:e9a7:1:c5d7:92c3:173b:c056]
 ([IPv6:2001:983:e9a7:1:c5d7:92c3:173b:c056])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 16WUj9tjfVuxO16WVjyi2r; Mon, 10 Feb 2020 11:42:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581331360; bh=jw8FFrFTo70xvwqT6/KBqggAQzxTAlShbIRliosXcjA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LBumy+16RuQHzxQ6VxJHFcEHfMjGD4xWdiugt2SQce9Elw0/3eI4ejR9ueHqJRRLf
         2uak/BXfOx2jIGI3q8/KDtJ4h70gQr6SnngzGp+YgkYeHxdG/2z06xLNCcxy9QTwCr
         YfpkeCfLhF9FC1Zs0S9BplcNGef+aMh2B+QKVYGwE8+b56i56BaR70NKwcJa4LnR0o
         dYb5kKWCHDnp9vpvRcnweKR4S6GQkvMUxpbcOa05/IGcvpkDyOYsjmfKIwSRHpaqlP
         pmUF+KiABXV+Z/AemCINLNcO1XY2vxc1kIGIQgkjcnB3XpVf7HU00aP5VMBbx8g6H+
         qJdZMNW8MgQlA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] Documentation/media/uapi: more readable unions
Message-ID: <1077a089-57fc-8d99-9505-676bf8ebc03b@xs4all.nl>
Date:   Mon, 10 Feb 2020 11:42:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNha61+INfW4hID0/dh2ZOAIS65jPN3GndVNLHNCgpe1XNlYZjIiUhQJre6PZ7JBVFSasEFADsfqoiU0DnT6pU8kar9fG9mcfQr/edFmi24LIMaqWJtm
 A17H95WOQLrNrR9AMrj//QI0wo7QJFNaCdQ2Ei8c9DsCwAFa+HrrwlssiEoPk22PNuHYnRe8oHp0NIcFxp/x3MUvwI3zNiOSQA+8xqIVP1Pi2F5G+4A10w4/
 SUY1PsgBFOP+DWxK9nPptO6UlRwfdKtgChvnJsR9rR0CQVxpbDo+E8lXhRknQui5yAnASIbupS/qnCBUTDZs2A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid adding an extra columns when describing unions in the documentation.
That makes it much harder to read. See e.g. VIDIOC_QUERY_EXT_CTRLS.

Instead start off a union with 'union {' and end it with an extra row
containing '}'.

This leaves a lot more space for the description of the fields.

This formatting technique was used in a few places already, but this
patches fixes all remaining occurrences of 'union' in the media uAPI.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Nicolas Dufresne <nicolas@ndufresne.ca>
---
diff --git a/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst b/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
index a21659d55c6b..6818ddf1495c 100644
--- a/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
+++ b/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
@@ -44,18 +44,18 @@ is only available if the ``CEC_CAP_CONNECTOR_INFO`` capability is set.
 .. flat-table:: struct cec_connector_info
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 1 8
+    :widths:       1 1 8

     * - __u32
       - ``type``
       - The type of connector this adapter is associated with.
-    * - union
+    * - union {
       - ``(anonymous)``
-      -
-    * -
-      - ``struct cec_drm_connector_info``
+    * - ``struct cec_drm_connector_info``
       - drm
       - :ref:`cec-drm-connector-info`
+    * - }
+      -


 .. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
diff --git a/Documentation/media/uapi/cec/cec-ioc-dqevent.rst b/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
index 5e21b1fbfc01..d16b226b1bef 100644
--- a/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
+++ b/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
@@ -109,35 +109,33 @@ it is guaranteed that the state did change in between the two events.
 .. flat-table:: struct cec_event
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 1 8
+    :widths:       1 1 8

     * - __u64
       - ``ts``
-      - :cspan:`1`\ Timestamp of the event in ns.
+      - Timestamp of the event in ns.

 	The timestamp has been taken from the ``CLOCK_MONOTONIC`` clock.

 	To access the same clock from userspace use :c:func:`clock_gettime`.
     * - __u32
       - ``event``
-      - :cspan:`1` The CEC event type, see :ref:`cec-events`.
+      - The CEC event type, see :ref:`cec-events`.
     * - __u32
       - ``flags``
-      - :cspan:`1` Event flags, see :ref:`cec-event-flags`.
-    * - union
+      - Event flags, see :ref:`cec-event-flags`.
+    * - union {
       - (anonymous)
-      -
-      -
-    * -
-      - struct cec_event_state_change
+    * - struct cec_event_state_change
       - ``state_change``
       - The new adapter state as sent by the :ref:`CEC_EVENT_STATE_CHANGE <CEC-EVENT-STATE-CHANGE>`
 	event.
-    * -
-      - struct cec_event_lost_msgs
+    * - struct cec_event_lost_msgs
       - ``lost_msgs``
       - The number of lost messages as sent by the :ref:`CEC_EVENT_LOST_MSGS <CEC-EVENT-LOST-MSGS>`
 	event.
+    * - }
+      -


 .. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{11.0cm}|
diff --git a/Documentation/media/uapi/mediactl/media-ioc-enum-entities.rst b/Documentation/media/uapi/mediactl/media-ioc-enum-entities.rst
index 6218d9cbdd83..33e2b110145c 100644
--- a/Documentation/media/uapi/mediactl/media-ioc-enum-entities.rst
+++ b/Documentation/media/uapi/mediactl/media-ioc-enum-entities.rst
@@ -64,12 +64,11 @@ id's until they get an error.
 .. flat-table:: struct media_entity_desc
     :header-rows:  0
     :stub-columns: 0
-    :widths: 1 1 1 1 8
+    :widths: 2 2 1 8

     *  -  __u32
        -  ``id``
        -
-       -
        -  Entity ID, set by the application. When the ID is or'ed with
 	  ``MEDIA_ENT_ID_FLAG_NEXT``, the driver clears the flag and returns
 	  the first entity with a larger ID. Do not expect that the ID will
@@ -79,79 +78,70 @@ id's until they get an error.
     *  -  char
        -  ``name``\ [32]
        -
-       -
        -  Entity name as an UTF-8 NULL-terminated string. This name must be unique
           within the media topology.

     *  -  __u32
        -  ``type``
        -
-       -
        -  Entity type, see :ref:`media-entity-functions` for details.

     *  -  __u32
        -  ``revision``
        -
-       -
        -  Entity revision. Always zero (obsolete)

     *  -  __u32
        -  ``flags``
        -
-       -
        -  Entity flags, see :ref:`media-entity-flag` for details.

     *  -  __u32
        -  ``group_id``
        -
-       -
        -  Entity group ID. Always zero (obsolete)

     *  -  __u16
        -  ``pads``
        -
-       -
        -  Number of pads

     *  -  __u16
        -  ``links``
        -
-       -
        -  Total number of outbound links. Inbound links are not counted in
 	  this field.

     *  -  __u32
        -  ``reserved[4]``
        -
-       -
        -  Reserved for future extensions. Drivers and applications must set
           the array to zero.

-    *  -  union
+    *  -  union {
+       -  (anonymous)

-    *  -
-       -  struct
+    *  -  struct
        -  ``dev``
        -
        -  Valid for (sub-)devices that create a single device node.

     *  -
-       -
        -  __u32
        -  ``major``
        -  Device node major number.

     *  -
-       -
        -  __u32
        -  ``minor``
        -  Device node minor number.

-    *  -
-       -  __u8
+    *  -  __u8
        -  ``raw``\ [184]
        -
        -
+    *  - }
+       -


 Return Value
diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
index 9149b57728e5..3112300c2fa0 100644
--- a/Documentation/media/uapi/v4l/buffer.rst
+++ b/Documentation/media/uapi/v4l/buffer.rst
@@ -172,11 +172,10 @@ struct v4l2_buffer
 .. flat-table:: struct v4l2_buffer
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 2 1 10
+    :widths:       1 2 10

     * - __u32
       - ``index``
-      -
       - Number of the buffer, set by the application except when calling
 	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`, then it is set by the
 	driver. This field can range from zero to the number of buffers
@@ -186,14 +185,12 @@ struct v4l2_buffer
 	:ref:`VIDIOC_CREATE_BUFS` minus one.
     * - __u32
       - ``type``
-      -
       - Type of the buffer, same as struct
 	:c:type:`v4l2_format` ``type`` or struct
 	:c:type:`v4l2_requestbuffers` ``type``, set
 	by the application. See :c:type:`v4l2_buf_type`
     * - __u32
       - ``bytesused``
-      -
       - The number of bytes occupied by the data in the buffer. It depends
 	on the negotiated data format and may change with each buffer for
 	compressed variable size data like JPEG images. Drivers must set
@@ -205,18 +202,15 @@ struct v4l2_buffer
 	``planes`` pointer is used instead.
     * - __u32
       - ``flags``
-      -
       - Flags set by the application or driver, see :ref:`buffer-flags`.
     * - __u32
       - ``field``
-      -
       - Indicates the field order of the image in the buffer, see
 	:c:type:`v4l2_field`. This field is not used when the buffer
 	contains VBI data. Drivers must set it when ``type`` refers to a
 	capture stream, applications when it refers to an output stream.
     * - struct timeval
       - ``timestamp``
-      -
       - For capture streams this is time when the first data byte was
 	captured, as returned by the :c:func:`clock_gettime()` function
 	for the relevant clock id; see ``V4L2_BUF_FLAG_TIMESTAMP_*`` in
@@ -229,7 +223,6 @@ struct v4l2_buffer
 	stream.
     * - struct :c:type:`v4l2_timecode`
       - ``timecode``
-      -
       - When the ``V4L2_BUF_FLAG_TIMECODE`` flag is set in ``flags``, this
 	structure contains a frame timecode. In
 	:c:type:`V4L2_FIELD_ALTERNATE <v4l2_field>` mode the top and
@@ -239,10 +232,9 @@ struct v4l2_buffer
 	independent of the ``timestamp`` and ``sequence`` fields.
     * - __u32
       - ``sequence``
-      -
       - Set by the driver, counting the frames (not fields!) in sequence.
 	This field is set for both input and output devices.
-    * - :cspan:`3`
+    * - :cspan:`2`

 	In :c:type:`V4L2_FIELD_ALTERNATE <v4l2_field>` mode the top and
 	bottom field have the same sequence number. The count starts at
@@ -262,13 +254,11 @@ struct v4l2_buffer

     * - __u32
       - ``memory``
-      -
       - This field must be set by applications and/or drivers in
 	accordance with the selected I/O method. See :c:type:`v4l2_memory`
-    * - union
+    * - union {
       - ``m``
-    * -
-      - __u32
+    * - __u32
       - ``offset``
       - For the single-planar API and when ``memory`` is
 	``V4L2_MEMORY_MMAP`` this is the offset of the buffer from the
@@ -276,29 +266,27 @@ struct v4l2_buffer
 	and apart of serving as parameter to the
 	:ref:`mmap() <func-mmap>` function not useful for applications.
 	See :ref:`mmap` for details
-    * -
-      - unsigned long
+    * - unsigned long
       - ``userptr``
       - For the single-planar API and when ``memory`` is
 	``V4L2_MEMORY_USERPTR`` this is a pointer to the buffer (casted to
 	unsigned long type) in virtual memory, set by the application. See
 	:ref:`userp` for details.
-    * -
-      - struct v4l2_plane
+    * - struct v4l2_plane
       - ``*planes``
       - When using the multi-planar API, contains a userspace pointer to
 	an array of struct :c:type:`v4l2_plane`. The size of
 	the array should be put in the ``length`` field of this
 	struct :c:type:`v4l2_buffer` structure.
-    * -
-      - int
+    * - int
       - ``fd``
       - For the single-plane API and when ``memory`` is
 	``V4L2_MEMORY_DMABUF`` this is the file descriptor associated with
 	a DMABUF buffer.
+    * - }
+      -
     * - __u32
       - ``length``
-      -
       - Size of the buffer (not the payload) in bytes for the
 	single-planar API. This is set by the driver based on the calls to
 	:ref:`VIDIOC_REQBUFS` and/or
@@ -308,12 +296,10 @@ struct v4l2_buffer
 	actual number of valid elements in that array.
     * - __u32
       - ``reserved2``
-      -
       - A place holder for future extensions. Drivers and applications
 	must set this to 0.
     * - __u32
       - ``request_fd``
-      -
       - The file descriptor of the request to queue the buffer to. If the flag
         ``V4L2_BUF_FLAG_REQUEST_FD`` is set, then the buffer will be
 	queued to this request. If the flag is not set, then this field will
@@ -344,11 +330,10 @@ struct v4l2_plane
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 1 2
+    :widths:       1 1 2

     * - __u32
       - ``bytesused``
-      -
       - The number of bytes occupied by data in the plane (its payload).
 	Drivers must set this field when ``type`` refers to a capture
 	stream, applications when it refers to an output stream. If the
@@ -362,40 +347,35 @@ struct v4l2_plane
 	   which may not be 0.
     * - __u32
       - ``length``
-      -
       - Size in bytes of the plane (not its payload). This is set by the
 	driver based on the calls to
 	:ref:`VIDIOC_REQBUFS` and/or
 	:ref:`VIDIOC_CREATE_BUFS`.
-    * - union
+    * - union {
       - ``m``
-      -
-      -
-    * -
-      - __u32
+    * - __u32
       - ``mem_offset``
       - When the memory type in the containing struct
 	:c:type:`v4l2_buffer` is ``V4L2_MEMORY_MMAP``, this
 	is the value that should be passed to :ref:`mmap() <func-mmap>`,
 	similar to the ``offset`` field in struct
 	:c:type:`v4l2_buffer`.
-    * -
-      - unsigned long
+    * - unsigned long
       - ``userptr``
       - When the memory type in the containing struct
 	:c:type:`v4l2_buffer` is ``V4L2_MEMORY_USERPTR``,
 	this is a userspace pointer to the memory allocated for this plane
 	by an application.
-    * -
-      - int
+    * - int
       - ``fd``
       - When the memory type in the containing struct
 	:c:type:`v4l2_buffer` is ``V4L2_MEMORY_DMABUF``,
 	this is a file descriptor associated with a DMABUF buffer, similar
 	to the ``fd`` field in struct :c:type:`v4l2_buffer`.
+    * - }
+      -
     * - __u32
       - ``data_offset``
-      -
       - Offset in bytes to video data in the plane. Drivers must set this
 	field when ``type`` refers to a capture stream, applications when
 	it refers to an output stream.
@@ -407,7 +387,6 @@ struct v4l2_plane
 	   at offset ``data_offset`` from the start of the plane.
     * - __u32
       - ``reserved[11]``
-      -
       - Reserved for future use. Should be zeroed by drivers and
 	applications.

diff --git a/Documentation/media/uapi/v4l/dev-sliced-vbi.rst b/Documentation/media/uapi/v4l/dev-sliced-vbi.rst
index e86346f66017..7b2d38dd402a 100644
--- a/Documentation/media/uapi/v4l/dev-sliced-vbi.rst
+++ b/Documentation/media/uapi/v4l/dev-sliced-vbi.rst
@@ -478,33 +478,30 @@ struct v4l2_mpeg_vbi_fmt_ivtv
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 1 2
+    :widths:       1 1 2

     * - __u8
       - ``magic``\ [4]
-      -
       - A "magic" constant from :ref:`v4l2-mpeg-vbi-fmt-ivtv-magic` that
 	indicates this is a valid sliced VBI data payload and also
 	indicates which member of the anonymous union, ``itv0`` or
 	``ITV0``, to use for the payload data.
-    * - union
+    * - union {
       - (anonymous)
-    * -
-      - struct :c:type:`v4l2_mpeg_vbi_itv0`
+    * - struct :c:type:`v4l2_mpeg_vbi_itv0`
       - ``itv0``
       - The primary form of the sliced VBI data payload that contains
 	anywhere from 1 to 35 lines of sliced VBI data. Line masks are
 	provided in this form of the payload indicating which VBI lines
 	are provided.
-    * -
-      - struct :ref:`v4l2_mpeg_vbi_ITV0 <v4l2-mpeg-vbi-itv0-1>`
+    * - struct :ref:`v4l2_mpeg_vbi_ITV0 <v4l2-mpeg-vbi-itv0-1>`
       - ``ITV0``
       - An alternate form of the sliced VBI data payload used when 36
 	lines of sliced VBI data are present. No line masks are provided
 	in this form of the payload; all valid line mask bits are
 	implcitly set.
-
-
+    * - }
+      -

 .. _v4l2-mpeg-vbi-fmt-ivtv-magic:

diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
index db43dda5aafb..054275c0dfc1 100644
--- a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
@@ -100,7 +100,8 @@ describing all planes of that format.
     * - __u8
       - ``flags``
       - Flags set by the application or driver, see :ref:`format-flags`.
-    * - :cspan:`2` union { (anonymous)
+    * - union {
+      - (anonymous)
     * - __u8
       - ``ycbcr_enc``
       - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
@@ -113,7 +114,8 @@ describing all planes of that format.
         This information supplements the ``colorspace`` and must be set by
 	the driver for capture streams and by the application for output
 	streams, see :ref:`colorspaces`.
-    * - :cspan:`2` }
+    * - }
+      -
     * - __u8
       - ``quantization``
       - Quantization range, from enum :c:type:`v4l2_quantization`.
diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
index a8321c348bf8..a993b861bf75 100644
--- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
@@ -143,7 +143,6 @@ Single-planar format structure
       - Flags set by the application or driver, see :ref:`format-flags`.
     * - union {
       - (anonymous)
-      -
     * - __u32
       - ``ycbcr_enc``
       - Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
@@ -158,7 +157,6 @@ Single-planar format structure
 	streams, see :ref:`colorspaces`.
     * - }
       -
-      -
     * - __u32
       - ``quantization``
       - Quantization range, from enum :c:type:`v4l2_quantization`.
diff --git a/Documentation/media/uapi/v4l/vidioc-dbg-g-chip-info.rst b/Documentation/media/uapi/v4l/vidioc-dbg-g-chip-info.rst
index a1cf20181cf1..d38031dbe4e4 100644
--- a/Documentation/media/uapi/v4l/vidioc-dbg-g-chip-info.rst
+++ b/Documentation/media/uapi/v4l/vidioc-dbg-g-chip-info.rst
@@ -91,23 +91,23 @@ instructions.
 .. flat-table:: struct v4l2_dbg_match
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 1 2
+    :widths:       1 1 2

     * - __u32
       - ``type``
       - See :ref:`name-chip-match-types` for a list of possible types.
-    * - union
+    * - union {
       - (anonymous)
-    * -
-      - __u32
+    * - __u32
       - ``addr``
       - Match a chip by this number, interpreted according to the ``type``
 	field.
-    * -
-      - char
+    * - char
       - ``name[32]``
       - Match a chip by this name, interpreted according to the ``type``
 	field. Currently unused.
+    * - }
+      -



diff --git a/Documentation/media/uapi/v4l/vidioc-dbg-g-register.rst b/Documentation/media/uapi/v4l/vidioc-dbg-g-register.rst
index 29e1d4fc4f52..112597c6cad2 100644
--- a/Documentation/media/uapi/v4l/vidioc-dbg-g-register.rst
+++ b/Documentation/media/uapi/v4l/vidioc-dbg-g-register.rst
@@ -100,23 +100,23 @@ instructions.
 .. flat-table:: struct v4l2_dbg_match
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 1 2
+    :widths:       1 1 2

     * - __u32
       - ``type``
       - See :ref:`chip-match-types` for a list of possible types.
-    * - union
+    * - union {
       - (anonymous)
-    * -
-      - __u32
+    * - __u32
       - ``addr``
       - Match a chip by this number, interpreted according to the ``type``
 	field.
-    * -
-      - char
+    * - char
       - ``name[32]``
       - Match a chip by this name, interpreted according to the ``type``
 	field. Currently unused.
+    * - }
+      -



diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
index f1a504836f31..784c5980da8d 100644
--- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
@@ -77,32 +77,25 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
 .. flat-table:: struct v4l2_decoder_cmd
     :header-rows:  0
     :stub-columns: 0
-    :widths: 11 24 12 16 106
+    :widths: 1 1 1 3

     * - __u32
       - ``cmd``
       -
-      -
       - The decoder command, see :ref:`decoder-cmds`.
     * - __u32
       - ``flags``
       -
-      -
       - Flags to go with the command. If no flags are defined for this
 	command, drivers and applications must set this field to zero.
-    * - union
+    * - union {
       - (anonymous)
-      -
-      -
-      -
-    * -
-      - struct
+    * - struct
       - ``start``
       -
       - Structure containing additional data for the
 	``V4L2_DEC_CMD_START`` command.
     * -
-      -
       - __s32
       - ``speed``
       - Playback speed and direction. The playback speed is defined as
@@ -113,7 +106,6 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
 	of 1 steps just one frame forward, a speed of -1 steps just one
 	frame back.
     * -
-      -
       - __u32
       - ``format``
       - Format restrictions. This field is set by the driver, not the
@@ -124,30 +116,26 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
 	GOPs, which it can then play in reverse order. So to implement
 	reverse playback the application must feed the decoder the last
 	GOP in the video file, then the GOP before that, etc. etc.
-    * -
-      - struct
+    * - struct
       - ``stop``
       -
       - Structure containing additional data for the ``V4L2_DEC_CMD_STOP``
 	command.
     * -
-      -
       - __u64
       - ``pts``
       - Stop playback at this ``pts`` or immediately if the playback is
 	already past that timestamp. Leave to 0 if you want to stop after
 	the last frame was decoded.
-    * -
-      - struct
+    * - struct
       - ``raw``
-      -
-      -
     * -
-      -
       - __u32
       - ``data``\ [16]
       - Reserved for future extensions. Drivers and applications must set
 	the array to zero.
+    * - }
+      -



diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
index 42659a3d1705..2f37d255352a 100644
--- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
+++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
@@ -55,66 +55,54 @@ call.
 .. flat-table:: struct v4l2_event
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 2 1
+    :widths:       1 1 2

     * - __u32
       - ``type``
-      -
       - Type of the event, see :ref:`event-type`.
-    * - union
+    * - union {
       - ``u``
-      -
-      -
-    * -
-      - struct :c:type:`v4l2_event_vsync`
+    * - struct :c:type:`v4l2_event_vsync`
       - ``vsync``
       - Event data for event ``V4L2_EVENT_VSYNC``.
-    * -
-      - struct :c:type:`v4l2_event_ctrl`
+    * - struct :c:type:`v4l2_event_ctrl`
       - ``ctrl``
       - Event data for event ``V4L2_EVENT_CTRL``.
-    * -
-      - struct :c:type:`v4l2_event_frame_sync`
+    * - struct :c:type:`v4l2_event_frame_sync`
       - ``frame_sync``
       - Event data for event ``V4L2_EVENT_FRAME_SYNC``.
-    * -
-      - struct :c:type:`v4l2_event_motion_det`
+    * - struct :c:type:`v4l2_event_motion_det`
       - ``motion_det``
       - Event data for event V4L2_EVENT_MOTION_DET.
-    * -
-      - struct :c:type:`v4l2_event_src_change`
+    * - struct :c:type:`v4l2_event_src_change`
       - ``src_change``
       - Event data for event V4L2_EVENT_SOURCE_CHANGE.
-    * -
-      - __u8
+    * - __u8
       - ``data``\ [64]
       - Event data. Defined by the event type. The union should be used to
 	define easily accessible type for events.
+    * - }
+      -
     * - __u32
       - ``pending``
-      -
       - Number of pending events excluding this one.
     * - __u32
       - ``sequence``
-      -
       - Event sequence number. The sequence number is incremented for
 	every subscribed event that takes place. If sequence numbers are
 	not contiguous it means that events have been lost.
     * - struct timespec
       - ``timestamp``
-      -
       - Event timestamp. The timestamp has been taken from the
 	``CLOCK_MONOTONIC`` clock. To access the same clock outside V4L2,
 	use :c:func:`clock_gettime`.
     * - u32
       - ``id``
-      -
       - The ID associated with the event source. If the event does not
 	have an associated ID (this depends on the event type), then this
 	is 0.
     * - __u32
       - ``reserved``\ [8]
-      -
       - Reserved for future extensions. Drivers must set the array to
 	zero.

@@ -233,54 +221,45 @@ call.
 .. flat-table:: struct v4l2_event_ctrl
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 2 1
+    :widths:       1 1 2

     * - __u32
       - ``changes``
-      -
       - A bitmask that tells what has changed. See
 	:ref:`ctrl-changes-flags`.
     * - __u32
       - ``type``
-      -
       - The type of the control. See enum
 	:c:type:`v4l2_ctrl_type`.
-    * - union (anonymous)
-      -
-      -
-      -
-    * -
-      - __s32
+    * - union {
+      - (anonymous)
+    * - __s32
       - ``value``
       - The 32-bit value of the control for 32-bit control types. This is
 	0 for string controls since the value of a string cannot be passed
 	using :ref:`VIDIOC_DQEVENT`.
-    * -
-      - __s64
+    * - __s64
       - ``value64``
       - The 64-bit value of the control for 64-bit control types.
+    * - }
+      -
     * - __u32
       - ``flags``
-      -
       - The control flags. See :ref:`control-flags`.
     * - __s32
       - ``minimum``
-      -
       - The minimum value of the control. See struct
 	:ref:`v4l2_queryctrl <v4l2-queryctrl>`.
     * - __s32
       - ``maximum``
-      -
       - The maximum value of the control. See struct
 	:ref:`v4l2_queryctrl <v4l2-queryctrl>`.
     * - __s32
       - ``step``
-      -
       - The step value of the control. See struct
 	:ref:`v4l2_queryctrl <v4l2-queryctrl>`.
     * - __s32
       - ``default_value``
-      -
       - The default value value of the control. See struct
 	:ref:`v4l2_queryctrl <v4l2-queryctrl>`.

diff --git a/Documentation/media/uapi/v4l/vidioc-dv-timings-cap.rst b/Documentation/media/uapi/v4l/vidioc-dv-timings-cap.rst
index e62d45d37072..1d0acbf14c4f 100644
--- a/Documentation/media/uapi/v4l/vidioc-dv-timings-cap.rst
+++ b/Documentation/media/uapi/v4l/vidioc-dv-timings-cap.rst
@@ -112,7 +112,7 @@ that doesn't support them will return an ``EINVAL`` error code.
 .. flat-table:: struct v4l2_dv_timings_cap
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 2 1
+    :widths:       1 1 2

     * - __u32
       - ``type``
@@ -127,16 +127,14 @@ that doesn't support them will return an ``EINVAL`` error code.
       - Reserved for future extensions.

 	Drivers and applications must set the array to zero.
-    * - union
-      -
-      -
-    * -
-      - struct :c:type:`v4l2_bt_timings_cap`
+    * - union {
+      - (anonymous)
+    * - struct :c:type:`v4l2_bt_timings_cap`
       - ``bt``
       - BT.656/1120 timings capabilities of the hardware.
-    * -
-      - __u32
+    * - __u32
       - ``raw_data``\ [32]
+    * - }
       -

 .. tabularcolumns:: |p{7.0cm}|p{10.5cm}|
diff --git a/Documentation/media/uapi/v4l/vidioc-enum-frameintervals.rst b/Documentation/media/uapi/v4l/vidioc-enum-frameintervals.rst
index 2c69f26b165d..563a67cddeca 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-frameintervals.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-frameintervals.rst
@@ -138,36 +138,31 @@ application should zero out all members except for the *IN* fields.

     * - __u32
       - ``index``
-      -
       - IN: Index of the given frame interval in the enumeration.
     * - __u32
       - ``pixel_format``
-      -
       - IN: Pixel format for which the frame intervals are enumerated.
     * - __u32
       - ``width``
-      -
       - IN: Frame width for which the frame intervals are enumerated.
     * - __u32
       - ``height``
-      -
       - IN: Frame height for which the frame intervals are enumerated.
     * - __u32
       - ``type``
-      -
       - OUT: Frame interval type the device supports.
-    * - union
-      -
-      -
+    * - union {
+      - (anonymous)
       - OUT: Frame interval with the given index.
-    * -
-      - struct :c:type:`v4l2_fract`
+    * - struct :c:type:`v4l2_fract`
       - ``discrete``
       - Frame interval [s].
-    * -
-      - struct :c:type:`v4l2_frmival_stepwise`
+    * - struct :c:type:`v4l2_frmival_stepwise`
       - ``stepwise``
       -
+    * - }
+      -
+      -
     * - __u32
       - ``reserved[2]``
       -
diff --git a/Documentation/media/uapi/v4l/vidioc-enum-framesizes.rst b/Documentation/media/uapi/v4l/vidioc-enum-framesizes.rst
index cf31f548826f..cd97546a7122 100644
--- a/Documentation/media/uapi/v4l/vidioc-enum-framesizes.rst
+++ b/Documentation/media/uapi/v4l/vidioc-enum-framesizes.rst
@@ -155,31 +155,27 @@ application should zero out all members except for the *IN* fields.

     * - __u32
       - ``index``
-      -
       - IN: Index of the given frame size in the enumeration.
     * - __u32
       - ``pixel_format``
-      -
       - IN: Pixel format for which the frame sizes are enumerated.
     * - __u32
       - ``type``
-      -
       - OUT: Frame size type the device supports.
-    * - union
-      -
-      -
+    * - union {
+      - (anonymous)
       - OUT: Frame size with the given index.
-    * -
-      - struct :c:type:`v4l2_frmsize_discrete`
+    * - struct :c:type:`v4l2_frmsize_discrete`
       - ``discrete``
       -
-    * -
-      - struct :c:type:`v4l2_frmsize_stepwise`
+    * - struct :c:type:`v4l2_frmsize_stepwise`
       - ``stepwise``
       -
+    * - }
+      -
+      -
     * - __u32
       - ``reserved[2]``
-      -
       - Reserved space for future use. Must be zeroed by drivers and
 	applications.

diff --git a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst b/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
index 5c675cbac4cf..e36dd2622857 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
+++ b/Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst
@@ -179,23 +179,21 @@ EBUSY
 .. flat-table:: struct v4l2_dv_timings
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 2 1
+    :widths:       1 1 2

     * - __u32
       - ``type``
-      -
       - Type of DV timings as listed in :ref:`dv-timing-types`.
-    * - union
-      -
-      -
-    * -
-      - struct :c:type:`v4l2_bt_timings`
+    * - union {
+      - (anonymous)
+    * - struct :c:type:`v4l2_bt_timings`
       - ``bt``
       - Timings defined by BT.656/1120 specifications
-    * -
-      - __u32
+    * - __u32
       - ``reserved``\ [32]
       -
+    * - }
+      -

 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|

diff --git a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst b/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
index 271cac18afbb..cdb2a2a512d6 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst
@@ -136,15 +136,13 @@ still cause this situation.
 .. flat-table:: struct v4l2_ext_control
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 1 2
+    :widths:       1 1 2

     * - __u32
       - ``id``
-      -
       - Identifies the control, set by the application.
     * - __u32
       - ``size``
-      -
       - The total size in bytes of the payload of this control. This is
 	normally 0, but for pointer controls this should be set to the
 	size of the memory containing the payload, or that will receive
@@ -161,55 +159,48 @@ still cause this situation.
 	   *length* of the string may well be much smaller.
     * - __u32
       - ``reserved2``\ [1]
-      -
       - Reserved for future extensions. Drivers and applications must set
 	the array to zero.
-    * - union
+    * - union {
       - (anonymous)
-    * -
-      - __s32
+    * - __s32
       - ``value``
       - New value or current value. Valid if this control is not of type
 	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
 	not set.
-    * -
-      - __s64
+    * - __s64
       - ``value64``
       - New value or current value. Valid if this control is of type
 	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
 	not set.
-    * -
-      - char *
+    * - char *
       - ``string``
       - A pointer to a string. Valid if this control is of type
 	``V4L2_CTRL_TYPE_STRING``.
-    * -
-      - __u8 *
+    * - __u8 *
       - ``p_u8``
       - A pointer to a matrix control of unsigned 8-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U8``.
-    * -
-      - __u16 *
+    * - __u16 *
       - ``p_u16``
       - A pointer to a matrix control of unsigned 16-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U16``.
-    * -
-      - __u32 *
+    * - __u32 *
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
-    * -
-      - :c:type:`v4l2_area` *
+    * - :c:type:`v4l2_area` *
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
-    * -
-      - void *
+    * - void *
       - ``ptr``
       - A pointer to a compound type which can be an N-dimensional array
 	and/or a compound type (the control's type is >=
 	``V4L2_CTRL_COMPOUND_TYPES``). Valid if
 	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set for this control.
+    * - }
+      -


 .. tabularcolumns:: |p{4.0cm}|p{2.2cm}|p{2.1cm}|p{8.2cm}|
@@ -221,12 +212,11 @@ still cause this situation.
 .. flat-table:: struct v4l2_ext_controls
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 2 1
+    :widths:       1 1 2

-    * - union
+    * - union {
       - (anonymous)
-    * -
-      - __u32
+    * - __u32
       - ``ctrl_class``
       - The control class to which all controls belong, see
 	:ref:`ctrl-class`. Drivers that use a kernel framework for
@@ -235,8 +225,7 @@ still cause this situation.
 	support this can be tested by setting ``ctrl_class`` to 0 and
 	calling :ref:`VIDIOC_TRY_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` with a ``count`` of 0. If that
 	succeeds, then the driver supports this feature.
-    * -
-      - __u32
+    * - __u32
       - ``which``
       - Which value of the control to get/set/try.
 	``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of the
@@ -261,6 +250,8 @@ still cause this situation.
 	by setting ctrl_class to ``V4L2_CTRL_WHICH_CUR_VAL`` and calling
 	VIDIOC_TRY_EXT_CTRLS with a count of 0. If that fails, then the
 	driver does not support ``V4L2_CTRL_WHICH_CUR_VAL``.
+    * - }
+      -
     * - __u32
       - ``count``
       - The number of controls in the controls array. May also be zero.
diff --git a/Documentation/media/uapi/v4l/vidioc-g-fmt.rst b/Documentation/media/uapi/v4l/vidioc-g-fmt.rst
index e35a9caff652..1e69bfc46e8d 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-fmt.rst
+++ b/Documentation/media/uapi/v4l/vidioc-g-fmt.rst
@@ -103,51 +103,44 @@ The format as returned by :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` must be identical

     * - __u32
       - ``type``
-      -
       - Type of the data stream, see :c:type:`v4l2_buf_type`.
-    * - union
+    * - union {
       - ``fmt``
-    * -
-      - struct :c:type:`v4l2_pix_format`
+    * - struct :c:type:`v4l2_pix_format`
       - ``pix``
       - Definition of an image format, see :ref:`pixfmt`, used by video
 	capture and output devices.
-    * -
-      - struct :c:type:`v4l2_pix_format_mplane`
+    * - struct :c:type:`v4l2_pix_format_mplane`
       - ``pix_mp``
       - Definition of an image format, see :ref:`pixfmt`, used by video
 	capture and output devices that support the
 	:ref:`multi-planar version of the API <planar-apis>`.
-    * -
-      - struct :c:type:`v4l2_window`
+    * - struct :c:type:`v4l2_window`
       - ``win``
       - Definition of an overlaid image, see :ref:`overlay`, used by
 	video overlay devices.
-    * -
-      - struct :c:type:`v4l2_vbi_format`
+    * - struct :c:type:`v4l2_vbi_format`
       - ``vbi``
       - Raw VBI capture or output parameters. This is discussed in more
 	detail in :ref:`raw-vbi`. Used by raw VBI capture and output
 	devices.
-    * -
-      - struct :c:type:`v4l2_sliced_vbi_format`
+    * - struct :c:type:`v4l2_sliced_vbi_format`
       - ``sliced``
       - Sliced VBI capture or output parameters. See :ref:`sliced` for
 	details. Used by sliced VBI capture and output devices.
-    * -
-      - struct :c:type:`v4l2_sdr_format`
+    * - struct :c:type:`v4l2_sdr_format`
       - ``sdr``
       - Definition of a data format, see :ref:`pixfmt`, used by SDR
 	capture and output devices.
-    * -
-      - struct :c:type:`v4l2_meta_format`
+    * - struct :c:type:`v4l2_meta_format`
       - ``meta``
       - Definition of a metadata format, see :ref:`meta-formats`, used by
 	metadata capture devices.
-    * -
-      - __u8
+    * - __u8
       - ``raw_data``\ [200]
       - Place holder for future extensions.
+    * - }
+      -


 Return Value
diff --git a/Documentation/media/uapi/v4l/vidioc-g-parm.rst b/Documentation/media/uapi/v4l/vidioc-g-parm.rst
index d9d5d97848d3..044a459e073f 100644
--- a/Documentation/media/uapi/v4l/vidioc-g-parm.rst
+++ b/Documentation/media/uapi/v4l/vidioc-g-parm.rst
@@ -69,33 +69,29 @@ union holding separate parameters for input and output devices.
 .. flat-table:: struct v4l2_streamparm
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 1 2
+    :widths:       1 1 2

     * - __u32
       - ``type``
-      -
       - The buffer (stream) type, same as struct
 	:c:type:`v4l2_format` ``type``, set by the
 	application. See :c:type:`v4l2_buf_type`.
-    * - union
+    * - union {
       - ``parm``
-      -
-      -
-    * -
-      - struct :c:type:`v4l2_captureparm`
+    * - struct :c:type:`v4l2_captureparm`
       - ``capture``
       - Parameters for capture devices, used when ``type`` is
 	``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or
 	``V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE``.
-    * -
-      - struct :c:type:`v4l2_outputparm`
+    * - struct :c:type:`v4l2_outputparm`
       - ``output``
       - Parameters for output devices, used when ``type`` is
 	``V4L2_BUF_TYPE_VIDEO_OUTPUT`` or ``V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE``.
-    * -
-      - __u8
+    * - __u8
       - ``raw_data``\ [200]
       - A place holder for future extensions.
+    * - }
+      -



diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
index 6690928e657b..9f10dc212961 100644
--- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
+++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
@@ -290,34 +290,29 @@ See also the examples in :ref:`control`.
 .. flat-table:: struct v4l2_querymenu
     :header-rows:  0
     :stub-columns: 0
-    :widths:       1 1 2 1
+    :widths:       1 1 2

     * - __u32
-      -
       - ``id``
       - Identifies the control, set by the application from the respective
 	struct :ref:`v4l2_queryctrl <v4l2-queryctrl>` ``id``.
     * - __u32
-      -
       - ``index``
       - Index of the menu item, starting at zero, set by the application.
-    * - union
-      -
-      -
-      -
-    * -
-      - __u8
+    * - union {
+      - (anonymous)
+    * - __u8
       - ``name``\ [32]
       - Name of the menu item, a NUL-terminated ASCII string. This
 	information is intended for the user. This field is valid for
 	``V4L2_CTRL_TYPE_MENU`` type controls.
-    * -
-      - __s64
+    * - __s64
       - ``value``
       - Value of the integer menu item. This field is valid for
 	``V4L2_CTRL_TYPE_INTEGER_MENU`` type controls.
-    * - __u32
+    * - }
       -
+    * - __u32
       - ``reserved``
       - Reserved for future extensions. Drivers must set the array to
 	zero.
