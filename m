Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8271D2F6922
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729806AbhANSJR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729803AbhANSJR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:09:17 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E87C061574;
        Thu, 14 Jan 2021 10:08:36 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 133881F45D13
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
Subject: [RFC PATCH v6 11/11] media: docs: add documentation for the Extended API
Date:   Thu, 14 Jan 2021 15:07:38 -0300
Message-Id: <20210114180738.1758707-12-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114180738.1758707-1-helen.koike@collabora.com>
References: <20210114180738.1758707-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation and update references in current documentation for the
Extended API.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
Changes in v6:
- Update note saying ext_api should be used for new applications on
  newer kernels (Tomasz and Hans)
- Fix typos pointed in v5 (Hand and Tomasz)
- Change order, mention Ext first in format.rst (Tomasz)
- Mention planes[i].offset should be set to zero for userptr
- Remove ext_create_buf and ext_prep_buf from the docs
- s/displayed/consumed for output (Tomasz)
- Remove references for plane length
- Drop EIO sentence mentioning signal loss (Hans)
- Removed first half of the note in EIO (Tomas and Hans)
- Update text to mention EXT_TRY_FMT is mandatory (Hans and Tomasz)
- Remove requirement to fill `memory` field for dqbuf (Tomasz)
- EXT_DQBUF sets `m` field to zero (Tomasz for DMA-fd)

Changes in v5:
- new patch
---
 .../userspace-api/media/v4l/buffer.rst        |   5 +
 .../userspace-api/media/v4l/common.rst        |   1 +
 .../userspace-api/media/v4l/dev-capture.rst   |   6 +
 .../userspace-api/media/v4l/dev-output.rst    |   6 +
 .../userspace-api/media/v4l/ext-api.rst       |  89 +++++++++
 .../userspace-api/media/v4l/format.rst        |  18 +-
 .../userspace-api/media/v4l/user-func.rst     |   5 +
 .../media/v4l/vidioc-ext-qbuf.rst             | 188 ++++++++++++++++++
 .../media/v4l/vidioc-g-ext-pix-fmt.rst        | 116 +++++++++++
 .../userspace-api/media/v4l/vidioc-qbuf.rst   |   2 +-
 10 files changed, 431 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-api.rst
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 1b0fdc160533..89652fa7a098 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -21,6 +21,11 @@ such as pointers and sizes for each plane, are stored in
 struct :c:type:`v4l2_plane` instead. In that case,
 struct :c:type:`v4l2_buffer` contains an array of plane structures.
 
+.. note::
+
+    For modern applications on newer kernels, these operations are replaced
+    by their :ref:`ext_api` counterparts, which should be used instead.
+
 Dequeued video buffers come with timestamps. The driver decides at which
 part of the frame and with which clock the timestamp is taken. Please
 see flags in the masks ``V4L2_BUF_FLAG_TIMESTAMP_MASK`` and
diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
index 8c263c5a85d8..61a64065f9f3 100644
--- a/Documentation/userspace-api/media/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -53,6 +53,7 @@ applicable to all devices.
     ext-ctrls-detect
     fourcc
     format
+    ext-api
     planar-apis
     selection-api
     crop
diff --git a/Documentation/userspace-api/media/v4l/dev-capture.rst b/Documentation/userspace-api/media/v4l/dev-capture.rst
index fe58fd450e2f..73580e16057c 100644
--- a/Documentation/userspace-api/media/v4l/dev-capture.rst
+++ b/Documentation/userspace-api/media/v4l/dev-capture.rst
@@ -93,6 +93,12 @@ and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl, even if :ref:`VIDIOC_S_FMT <VIDIOC
 requests and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does.
 :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is optional.
 
+.. note::
+
+    For modern applications on newer kernels, these operations are replaced
+    by their :ref:`ext_api` counterparts, which should be used instead.
+
+
 Reading Images
 ==============
 
diff --git a/Documentation/userspace-api/media/v4l/dev-output.rst b/Documentation/userspace-api/media/v4l/dev-output.rst
index eadcb4aa813b..676578c099b6 100644
--- a/Documentation/userspace-api/media/v4l/dev-output.rst
+++ b/Documentation/userspace-api/media/v4l/dev-output.rst
@@ -90,6 +90,12 @@ and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl, even if :ref:`VIDIOC_S_FMT <VIDIOC
 requests and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does.
 :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is optional.
 
+.. note::
+
+    For modern applications on newer kernels, these operations are replaced
+    by their :ref:`ext_api` counterparts, which should be used instead.
+
+
 Writing Images
 ==============
 
diff --git a/Documentation/userspace-api/media/v4l/ext-api.rst b/Documentation/userspace-api/media/v4l/ext-api.rst
new file mode 100644
index 000000000000..e73d5b77a550
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-api.rst
@@ -0,0 +1,89 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/userspace-api/media/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _ext_api:
+
+*************
+Extended API
+*************
+
+Introduction
+============
+
+The Extended Format API was conceived to extend V4L2 capabilities and
+to simplify certain mechanisms.
+It unifies single- vs multi- planar handling,
+brings the concept of pixelformat + modifiers, allows planes to be placed
+in any offset inside a buffer and let userspace to change colorspace
+attributes if supported by the driver.
+
+Data format negotiation and buffer handling works very similar to the classical
+version, thus in this document we mention only the main differences.
+
+Data Format Negotiation
+=======================
+
+The API replaces the classical ioctls:
+
+:ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>`, :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>`,
+:ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>`
+(with :c:type:`v4l2_format` as the main parameter).
+
+By the extended versions:
+
+:ref:`VIDIOC_G_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>`,
+:ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>`,
+:ref:`VIDIOC_TRY_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>`
+(with :c:type:`v4l2_ext_pix_format` as the main parameter).
+
+For CAPTURE and OUTPUT queues only.
+
+The ``type`` field of struct :c:type:`v4l2_ext_pix_format` only accepts 
+``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or ``V4L2_BUF_TYPE_VIDEO_OUTPUT``.
+
+The ``plane_fmt`` field is an array which holds information by plane using
+the :c:type:`v4l2_plane_pix_format`. When this struct is filled, its
+``sizeimage`` field should be non-zero for all valid planes for a given
+``pixelformat`` + ``modifier`` combination, and zeroed for the invalid ones.
+
+Colorspace attributes are not read-only as in the classical version, i.e, they
+can be set by application and drivers will adjust accordingly depending on what
+is supported by the underlying hardware.
+
+Buffers
+=======
+
+The API replaces the classical ioctls:
+
+:ref:`VIDIOC_QBUF <VIDIOC_QBUF>`,
+:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`,
+(with :c:type:`v4l2_buffer` as the main parameter)
+
+By the extended versions:
+
+:ref:`VIDIOC_EXT_QBUF <VIDIOC_EXT_QBUF>`,
+:ref:`VIDIOC_EXT_DQBUF <VIDIOC_EXT_QBUF>`,
+(with :c:type:`v4l2_ext_buffer` as the main parameter)
+
+Comparing :c:type:`v4l2_ext_buffer` with :c:type:`v4l2_buffer`, in the
+extended version there is a unification of the single-/multi- planar handling
+through the ``planes`` field of type :c:type:`v4l2_ext_plane`.
+
+The :c:type:`v4l2_ext_plane` also allows planes to be placed in a given offset
+inside a buffer.
+Planes can be placed in different locations inside the same buffer, or in
+different buffers.
+
+
+.. kernel-doc:: include/uapi/linux/videodev2.h
+   :functions: v4l2_ext_plane
+
+
+.. kernel-doc:: include/uapi/linux/videodev2.h
+   :functions: v4l2_ext_buffer
diff --git a/Documentation/userspace-api/media/v4l/format.rst b/Documentation/userspace-api/media/v4l/format.rst
index 35bbb2fea46e..713e1a9f699a 100644
--- a/Documentation/userspace-api/media/v4l/format.rst
+++ b/Documentation/userspace-api/media/v4l/format.rst
@@ -21,13 +21,19 @@ format and the driver selects and reports the best the hardware can do
 to satisfy the request. Of course applications can also just query the
 current selection.
 
-A single mechanism exists to negotiate all data formats using the
-aggregate struct :c:type:`v4l2_format` and the
+There are two mechanism to negotiate data formats:
+
+The first one is through the :ref:`ext_api`, please refer to its documentation
+for more information.
+
+The second one is using the aggregate struct :c:type:`v4l2_format` and the
 :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and
 :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctls. Additionally the
 :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` ioctl can be used to examine
 what the hardware *could* do, without actually selecting a new data
-format. The data formats supported by the V4L2 API are covered in the
+format.
+
+The data formats supported by the V4L2 API are covered in the
 respective device section in :ref:`devices`. For a closer look at
 image formats see :ref:`pixfmt`.
 
@@ -64,8 +70,12 @@ earlier versions of V4L2. Switching the logical stream or returning into
 *may* support a switch using :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>`.
 
 All drivers exchanging data with applications must support the
-:ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl. Implementation of the
+:ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl
+or the ref:`Extended <VIDIOC_G_EXT_PIX_FMT>` respective versions.
+Implementation of the
 :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is highly recommended but optional.
+For the Extended API, ref:`VIDIOC_TRY_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` is
+mandatory.
 
 Image Format Enumeration
 ========================
diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 53e604bd7d60..3e21a780033d 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -13,6 +13,7 @@ Function Reference
     func-close
     func-ioctl
     vidioc-create-bufs
+    vidioc-ext-create-bufs
     vidioc-cropcap
     vidioc-dbg-g-chip-info
     vidioc-dbg-g-register
@@ -41,6 +42,7 @@ Function Reference
     vidioc-g-ext-ctrls
     vidioc-g-fbuf
     vidioc-g-fmt
+    vidioc-g-ext-pix-fmt
     vidioc-g-frequency
     vidioc-g-input
     vidioc-g-jpegcomp
@@ -55,8 +57,11 @@ Function Reference
     vidioc-log-status
     vidioc-overlay
     vidioc-prepare-buf
+    vidioc-ext-prepare-buf
     vidioc-qbuf
+    vidioc-ext-qbuf
     vidioc-querybuf
+    vidioc-ext-querybuf
     vidioc-querycap
     vidioc-queryctrl
     vidioc-query-dv-timings
diff --git a/Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst
new file mode 100644
index 000000000000..d137eddc331e
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-ext-qbuf.rst
@@ -0,0 +1,188 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/userspace-api/media/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _VIDIOC_EXT_QBUF:
+
+***************************************
+ioctl VIDIOC_EXT_QBUF, VIDIOC_EXT_DQBUF
+***************************************
+
+Name
+====
+
+VIDIOC_EXT_QBUF - VIDIOC_EXT_DQBUF - Exchange a buffer with the driver
+
+
+Synopsis
+========
+
+.. c:function:: int ioctl( int fd, VIDIOC_EXT_QBUF, struct v4l2_ext_buffer *argp )
+    :name: VIDIOC_EXT_QBUF
+
+.. c:function:: int ioctl( int fd, VIDIOC_EXT_DQBUF, struct v4l2_ext_buffer *argp )
+    :name: VIDIOC_EXT_DQBUF
+
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :ref:`open() <func-open>`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_ext_buffer`.
+
+
+Description
+===========
+
+Applications call the ``VIDIOC_EXT_QBUF`` ioctl to enqueue an empty
+(capturing) or filled (output) buffer in the driver's incoming queue.
+The semantics depend on the selected I/O method.
+
+To enqueue a buffer applications set the ``type`` field of a struct
+:c:type:`v4l2_ext_buffer` to the same buffer type as was
+previously used with struct :c:type:`v4l2_ext_pix_format` ``type``.
+Applications must also set the ``index`` field. Valid index numbers
+range from zero to the number of buffers allocated with
+:ref:`VIDIOC_REQBUFS` (struct
+:c:type:`v4l2_requestbuffers` ``count``) minus
+one.
+When the buffer is intended for output (``type`` is
+``V4L2_BUF_TYPE_VIDEO_OUTPUT``) applications must also initialize the
+``timestamp`` fields.
+see :ref:`buffer` for details. Applications must also set ``flags`` to 0. The
+``reserved`` field must be set to 0.
+
+To enqueue a :ref:`memory mapped <mmap>` buffer applications set the
+``memory`` field to ``V4L2_MEMORY_MMAP``.
+When ``VIDIOC_EXT_QBUF`` is called with a pointer to this structure
+the driver sets the ``V4L2_BUF_FLAG_MAPPED`` and ``V4L2_BUF_FLAG_QUEUED``
+flags and clears the ``V4L2_BUF_FLAG_DONE`` flag in the ``flags`` field, or
+it returns an ``EINVAL`` error code.
+
+To enqueue a :ref:`user pointer <userp>` buffer applications set the
+``memory`` field to ``V4L2_MEMORY_USERPTR``, the ``planes[i].m.userptr``
+field to the address of the buffer and ``planes[i].offset`` should be zero.
+When ``VIDIOC_EXT_QBUF`` is called with a pointer to this structure
+the driver sets the ``V4L2_BUF_FLAG_QUEUED`` flag and clears the
+``V4L2_BUF_FLAG_MAPPED`` and ``V4L2_BUF_FLAG_DONE`` flags in the
+``flags`` field, or it returns an error code. This ioctl locks the
+memory pages of the buffer in physical memory, they cannot be swapped
+out to disk.
+Buffers remain locked until dequeued, until the
+:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` or
+:ref:`VIDIOC_REQBUFS` ioctl is called, or until the
+device is closed.
+
+To enqueue a :ref:`DMABUF <dmabuf>` buffer applications set the
+``memory`` field to ``V4L2_MEMORY_DMABUF``, the ``planes[i].m.fd`` field to a
+file descriptor associated with a DMABUF buffer
+and ``planes[i].offset`` of the plane in the memory buffer.
+When ``VIDIOC_EXT_QBUF`` is called with a pointer to this structure the driver
+sets the ``V4L2_BUF_FLAG_QUEUED`` flag and clears the
+``V4L2_BUF_FLAG_MAPPED`` and ``V4L2_BUF_FLAG_DONE`` flags in the
+``flags`` field, or it returns an error code. This ioctl locks the
+buffer. Locking a buffer means passing it to a driver for a hardware
+access (usually DMA). If an application accesses (reads/writes) a locked
+buffer then the result is undefined.
+Buffers remain locked until dequeued, until the
+:ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` or
+:ref:`VIDIOC_REQBUFS` ioctl is called, or until the
+device is closed.
+
+The ``request_fd`` field can be used with the ``VIDIOC_EXT_QBUF`` ioctl to specify
+the file descriptor of a :ref:`request <media-request-api>`, if requests are
+in use. Setting it means that the buffer will not be passed to the driver
+until the request itself is queued. Also, the driver will apply any
+settings associated with the request for this buffer. This field will
+be ignored unless the ``V4L2_BUF_FLAG_REQUEST_FD`` flag is set.
+If the device does not support requests, then ``EBADR`` will be returned.
+If requests are supported but an invalid request file descriptor is given,
+then ``EINVAL`` will be returned.
+
+.. caution::
+   It is not allowed to mix queuing requests with queuing buffers directly.
+   ``EBUSY`` will be returned if the first buffer was queued directly and
+   then the application tries to queue a request, or vice versa. After
+   closing the file descriptor, calling
+   :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` or calling :ref:`VIDIOC_REQBUFS`
+   the check for this will be reset.
+
+   For :ref:`memory-to-memory devices <mem2mem>` you can specify the
+   ``request_fd`` only for output buffers, not for capture buffers. Attempting
+   to specify this for a capture buffer will result in an ``EBADR`` error.
+
+Applications call the ``VIDIOC_EXT_DQBUF`` ioctl to dequeue a filled
+(capturing) or displayed (output) buffer from the driver's outgoing
+queue. They just set the ``type`` and ``reserved`` fields of
+a struct :c:type:`v4l2_ext_buffer` as above, when
+``VIDIOC_EXT_DQBUF`` is called with a pointer to this structure the driver
+fills the remaining fields or returns an error code. The driver may also
+set ``V4L2_BUF_FLAG_ERROR`` in the ``flags`` field. It indicates a
+non-critical (recoverable) streaming error. In such case the application
+may continue as normal, but should be aware that data in the dequeued
+buffer might be corrupted.
+
+Pointers in ``m`` field is set to zero. Applications must track the buffers
+in queuing time.
+
+By default ``VIDIOC_EXT_DQBUF`` blocks when no buffer is in the outgoing
+queue. When the ``O_NONBLOCK`` flag was given to the
+:ref:`open() <func-open>` function, ``VIDIOC_EXT_DQBUF`` returns
+immediately with an ``EAGAIN`` error code when no buffer is available.
+
+
+.. kernel-doc:: include/uapi/linux/videodev2.h
+   :functions: v4l2_ext_buffers
+
+
+Return Value
+============
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+EAGAIN
+    Non-blocking I/O has been selected using ``O_NONBLOCK`` and no
+    buffer was in the outgoing queue.
+
+EINVAL
+    The buffer ``type`` is not supported, or the ``index`` is out of
+    bounds, or no buffers have been allocated yet, or the ``userptr``
+    are invalid, or the ``V4L2_BUF_FLAG_REQUEST_FD`` flag was
+    set but the the given ``request_fd`` was invalid, or ``m.fd`` was
+    an invalid DMABUF file descriptor.
+
+EIO
+    ``VIDIOC_EXT_DQBUF`` failed due to an internal error.
+
+    .. note::
+
+       It is recommended that drivers indicate recoverable errors by setting
+       the ``V4L2_BUF_FLAG_ERROR`` and returning 0 instead. In that case the
+       application should be able to safely reuse the buffer and continue
+       streaming.
+
+EPIPE
+    ``VIDIOC_EXT_DQBUF`` returns this on an empty capture queue for mem2mem
+    codecs if a buffer with the ``V4L2_BUF_FLAG_LAST`` was already
+    dequeued and no new buffers are expected to become available.
+
+EBADR
+    The ``V4L2_BUF_FLAG_REQUEST_FD`` flag was set but the device does not
+    support requests for the given buffer type, or
+    the ``V4L2_BUF_FLAG_REQUEST_FD`` flag was not set but the device requires
+    that the buffer is part of a request.
+
+EBUSY
+    The first buffer was queued via a request, but the application now tries
+    to queue it directly, or vice versa (it is not permitted to mix the two
+    APIs).
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst
new file mode 100644
index 000000000000..6cb14390dc51
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-pix-fmt.rst
@@ -0,0 +1,116 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/userspace-api/media/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _VIDIOC_G_EXT_PIX_FMT:
+
+************************************************************************
+ioctl VIDIOC_G_EXT_PIX_FMT, VIDIOC_S_EXT_PIX_FMT, VIDIOC_TRY_EXT_PIX_FMT
+************************************************************************
+
+Name
+====
+
+VIDIOC_G_EXT_PIX_FMT - VIDIOC_S_EXT_PIX_FMT - VIDIOC_TRY_EXT_PIX_FMT - Get or set the data format, try a format
+
+
+Synopsis
+========
+
+.. c:function:: int ioctl( int fd, VIDIOC_G_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp )
+    :name: VIDIOC_G_EXT_PIX_FMT
+
+.. c:function:: int ioctl( int fd, VIDIOC_S_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp )
+    :name: VIDIOC_S_EXT_PIX_FMT
+
+.. c:function:: int ioctl( int fd, VIDIOC_TRY_EXT_PIX_FMT, struct v4l2_ext_pix_format *argp )
+    :name: VIDIOC_TRY_EXT_PIX_FMT
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :ref:`open() <func-open>`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_ext_pix_format`.
+
+
+Description
+===========
+
+These ioctls are used to negotiate the format of data (typically image
+format) exchanged between driver and application.
+
+To query the current parameters applications set the ``type`` field of a
+struct :c:type:`v4l2_ext_pix_format` to  ``V4L2_BUF_TYPE_VIDEO_CAPTURE`` or
+``V4L2_BUF_TYPE_VIDEO_OUTPUT``, all the other types are invalid in this API,
+and multiplanar is supported through modifiers.
+
+When the application calls the
+:ref:`VIDIOC_G_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` ioctl with a pointer to this
+structure the driver fills the other members.
+When the requested buffer type is not supported drivers return
+an ``EINVAL`` error code.
+
+To change the current format parameters applications initialize all
+the fields in the struct.
+For details see the documentation of the various devices types in
+:ref:`devices`. Good practice is to query the current parameters
+first, and to modify only those parameters not suitable for the
+application. When the application calls the :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` ioctl with
+a pointer to a struct :c:type:`v4l2_ext_pix_format` structure the driver
+checks and adjusts the parameters against hardware abilities. Drivers
+should not return an error code unless the ``type`` field is invalid,
+this is a mechanism to fathom device capabilities and to approach
+parameters acceptable for both the application and driver. On success
+the driver may program the hardware, allocate resources and generally
+prepare for data exchange. Finally the :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` ioctl returns
+the current format parameters as :ref:`VIDIOC_G_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` does. Very simple,
+inflexible devices may even ignore all input and always return the
+default parameters. However all V4L2 devices exchanging data with the
+application must implement the :ref:`VIDIOC_G_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` and :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>`
+ioctl. When the requested buffer type is not supported drivers return an
+EINVAL error code on a :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` attempt. When I/O is already in
+progress or the resource is not available for other reasons drivers
+return the ``EBUSY`` error code.
+
+The :ref:`VIDIOC_TRY_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` ioctl is equivalent to :ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` with one
+exception: it does not change driver state. It can also be called at any
+time, never returning ``EBUSY``. This function is provided to negotiate
+parameters, to learn about hardware limitations, without disabling I/O
+or possibly time consuming hardware preparations.
+
+The format as returned by :ref:`VIDIOC_TRY_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` must be identical to what
+:ref:`VIDIOC_S_EXT_PIX_FMT <VIDIOC_G_EXT_PIX_FMT>` returns for the same input or output.
+
+
+.. kernel-doc:: include/uapi/linux/videodev2.h
+   :functions: v4l2_plane_pix_format
+
+
+.. kernel-doc:: include/uapi/linux/videodev2.h
+   :functions: v4l2_ext_pix_format
+
+
+Return Value
+============
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+EINVAL
+    The struct :c:type:`v4l2_ext_pix_format` ``type`` field is
+    invalid or the requested buffer type not supported.
+
+EBUSY
+    The device is busy and cannot change the format. This could be
+    because or the device is streaming or buffers are allocated or
+    queued to the driver. Relevant for :ref:`VIDIOC_S_EXT_PIX_FMT
+    <VIDIOC_G_EXT_PIX_FMT>` only.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
index 77e0747a6d28..7f2aae992348 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
@@ -121,7 +121,7 @@ then ``EINVAL`` will be returned.
    to specify this for a capture buffer will result in an ``EBADR`` error.
 
 Applications call the ``VIDIOC_DQBUF`` ioctl to dequeue a filled
-(capturing) or displayed (output) buffer from the driver's outgoing
+(capturing) or consumed (output) buffer from the driver's outgoing
 queue. They just set the ``type``, ``memory`` and ``reserved`` fields of
 a struct :c:type:`v4l2_buffer` as above, when
 ``VIDIOC_DQBUF`` is called with a pointer to this structure the driver
-- 
2.29.2

