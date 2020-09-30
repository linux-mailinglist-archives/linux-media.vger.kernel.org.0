Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFC227E97C
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 15:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730352AbgI3NZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 09:25:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:39386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730235AbgI3NZ3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:29 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 635832076B;
        Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=Cg0fn1knnH+cc6EvV9Oxe+RNtocav5ih/BZWz6jKluc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AqilabFNhmggt6JbavdqgevsopMmWJFVg4OPYdgH88hTwpKEMETyH9LB90Z/FWDGt
         F05wXPv2Z+W567cT8ua2qR1qaGOHdKb2lqKQrtN5ImfA7+aa9Ugvpb+wdjqPsXKuLp
         0Sb4SKvHAZH7Fr9yJhJSYuOoJn0kGoiM4si2VzUg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6g-001XJQ-0o; Wed, 30 Sep 2020 15:25:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jian-Jia Su <jjsu@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 13/52] media: docs: make V4L documents more compatible with Sphinx 3.1+
Date:   Wed, 30 Sep 2020 15:24:36 +0200
Message-Id: <6cc31b4e9c8d19d8c133546ae871054f3638599c.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sphinx 3.x broke support for the cdomain.py extension, as the
c domain code was rewritten. Due to that, the c tags need to
be re-written, in order to use the new c domain notation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/v4l/buffer.rst        | 14 +---
 .../userspace-api/media/v4l/dev-capture.rst   |  7 +-
 .../userspace-api/media/v4l/dev-output.rst    |  7 +-
 .../userspace-api/media/v4l/dev-raw-vbi.rst   | 19 ++---
 .../userspace-api/media/v4l/dev-rds.rst       | 12 +---
 .../media/v4l/dev-sliced-vbi.rst              | 31 ++------
 .../userspace-api/media/v4l/diff-v4l.rst      | 39 ++---------
 .../userspace-api/media/v4l/dmabuf.rst        |  8 +--
 .../userspace-api/media/v4l/format.rst        |  7 +-
 .../userspace-api/media/v4l/func-close.rst    |  8 +--
 .../userspace-api/media/v4l/func-ioctl.rst    | 10 +--
 .../userspace-api/media/v4l/func-mmap.rst     | 18 ++---
 .../userspace-api/media/v4l/func-munmap.rst   | 14 ++--
 .../userspace-api/media/v4l/func-open.rst     | 14 ++--
 .../userspace-api/media/v4l/func-poll.rst     | 40 +++++------
 .../userspace-api/media/v4l/func-read.rst     | 39 +++++------
 .../userspace-api/media/v4l/func-select.rst   | 42 +++++------
 .../userspace-api/media/v4l/func-write.rst    | 13 ++--
 .../userspace-api/media/v4l/hist-v4l2.rst     | 70 ++-----------------
 Documentation/userspace-api/media/v4l/io.rst  |  6 +-
 .../media/v4l/libv4l-introduction.rst         | 30 ++++----
 .../userspace-api/media/v4l/mmap.rst          | 26 +++----
 .../userspace-api/media/v4l/open.rst          | 15 ++--
 Documentation/userspace-api/media/v4l/rw.rst  | 18 ++---
 .../userspace-api/media/v4l/streaming-par.rst |  5 +-
 .../userspace-api/media/v4l/userp.rst         | 11 +--
 .../media/v4l/vidioc-create-bufs.rst          | 11 ++-
 .../media/v4l/vidioc-cropcap.rst              | 11 ++-
 .../media/v4l/vidioc-dbg-g-chip-info.rst      | 13 ++--
 .../media/v4l/vidioc-dbg-g-register.rst       | 18 ++---
 .../media/v4l/vidioc-decoder-cmd.rst          | 19 +++--
 .../media/v4l/vidioc-dqevent.rst              | 19 ++---
 .../media/v4l/vidioc-dv-timings-cap.rst       | 17 ++---
 .../media/v4l/vidioc-encoder-cmd.rst          | 25 +++----
 .../media/v4l/vidioc-enum-dv-timings.rst      | 16 ++---
 .../media/v4l/vidioc-enum-fmt.rst             | 12 ++--
 .../media/v4l/vidioc-enum-frameintervals.rst  | 15 ++--
 .../media/v4l/vidioc-enum-framesizes.rst      | 16 ++---
 .../media/v4l/vidioc-enum-freq-bands.rst      | 12 ++--
 .../media/v4l/vidioc-enumaudio.rst            | 10 ++-
 .../media/v4l/vidioc-enumaudioout.rst         | 10 ++-
 .../media/v4l/vidioc-enuminput.rst            | 14 ++--
 .../media/v4l/vidioc-enumoutput.rst           | 13 ++--
 .../media/v4l/vidioc-enumstd.rst              | 23 ++----
 .../userspace-api/media/v4l/vidioc-expbuf.rst | 14 ++--
 .../media/v4l/vidioc-g-audio.rst              | 18 ++---
 .../media/v4l/vidioc-g-audioout.rst           | 16 ++---
 .../userspace-api/media/v4l/vidioc-g-crop.rst | 16 ++---
 .../userspace-api/media/v4l/vidioc-g-ctrl.rst | 16 ++---
 .../media/v4l/vidioc-g-dv-timings.rst         | 26 +++----
 .../userspace-api/media/v4l/vidioc-g-edid.rst | 25 ++++---
 .../media/v4l/vidioc-g-enc-index.rst          | 13 ++--
 .../media/v4l/vidioc-g-ext-ctrls.rst          | 21 +++---
 .../userspace-api/media/v4l/vidioc-g-fbuf.rst | 18 ++---
 .../userspace-api/media/v4l/vidioc-g-fmt.rst  | 22 +++---
 .../media/v4l/vidioc-g-frequency.rst          | 16 ++---
 .../media/v4l/vidioc-g-input.rst              | 15 ++--
 .../media/v4l/vidioc-g-jpegcomp.rst           | 17 ++---
 .../media/v4l/vidioc-g-modulator.rst          | 17 ++---
 .../media/v4l/vidioc-g-output.rst             | 15 ++--
 .../userspace-api/media/v4l/vidioc-g-parm.rst | 30 ++++----
 .../media/v4l/vidioc-g-priority.rst           | 16 ++---
 .../media/v4l/vidioc-g-selection.rst          | 15 ++--
 .../media/v4l/vidioc-g-sliced-vbi-cap.rst     | 12 ++--
 .../userspace-api/media/v4l/vidioc-g-std.rst  | 24 ++++---
 .../media/v4l/vidioc-g-tuner.rst              | 19 ++---
 .../media/v4l/vidioc-log-status.rst           | 10 ++-
 .../media/v4l/vidioc-overlay.rst              | 10 ++-
 .../media/v4l/vidioc-prepare-buf.rst          | 10 ++-
 .../userspace-api/media/v4l/vidioc-qbuf.rst   | 17 +++--
 .../media/v4l/vidioc-query-dv-timings.rst     | 15 ++--
 .../media/v4l/vidioc-querybuf.rst             | 10 ++-
 .../media/v4l/vidioc-querycap.rst             | 16 ++---
 .../media/v4l/vidioc-queryctrl.rst            | 22 +++---
 .../media/v4l/vidioc-querystd.rst             | 15 ++--
 .../media/v4l/vidioc-reqbufs.rst              | 10 ++-
 .../media/v4l/vidioc-s-hw-freq-seek.rst       | 11 ++-
 .../media/v4l/vidioc-streamon.rst             | 14 ++--
 .../v4l/vidioc-subdev-enum-frame-interval.rst | 10 ++-
 .../v4l/vidioc-subdev-enum-frame-size.rst     | 11 ++-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      | 10 ++-
 .../media/v4l/vidioc-subdev-g-crop.rst        | 16 ++---
 .../media/v4l/vidioc-subdev-g-fmt.rst         | 17 ++---
 .../v4l/vidioc-subdev-g-frame-interval.rst    | 16 ++---
 .../media/v4l/vidioc-subdev-g-selection.rst   | 17 ++---
 .../media/v4l/vidioc-subdev-querycap.rst      |  9 ++-
 .../media/v4l/vidioc-subscribe-event.rst      | 17 ++---
 87 files changed, 559 insertions(+), 922 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index da7366e0e317..7dbdfbb4a0a9 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _buffer:
 
@@ -33,7 +34,6 @@ mem-to-mem devices is an exception to the rule: the timestamp source
 flags are copied from the OUTPUT video buffer to the CAPTURE video
 buffer.
 
-
 Interactions between formats, controls and buffers
 ==================================================
 
@@ -152,7 +152,6 @@ based on the queried sizes (for instance by allocating a set of buffers large
 enough for all the desired formats and controls, or by allocating separate set
 of appropriately sized buffers for each use case).
 
-
 .. c:type:: v4l2_buffer
 
 struct v4l2_buffer
@@ -257,7 +256,7 @@ struct v4l2_buffer
 	``V4L2_MEMORY_MMAP`` this is the offset of the buffer from the
 	start of the device memory. The value is returned by the driver
 	and apart of serving as parameter to the
-	:ref:`mmap() <func-mmap>` function not useful for applications.
+	:c:func:`mmap()` function not useful for applications.
 	See :ref:`mmap` for details
     * - unsigned long
       - ``userptr``
@@ -310,7 +309,6 @@ struct v4l2_buffer
 	given, then ``EINVAL`` will be returned.
 
 
-
 .. c:type:: v4l2_plane
 
 struct v4l2_plane
@@ -350,7 +348,7 @@ struct v4l2_plane
       - ``mem_offset``
       - When the memory type in the containing struct
 	:c:type:`v4l2_buffer` is ``V4L2_MEMORY_MMAP``, this
-	is the value that should be passed to :ref:`mmap() <func-mmap>`,
+	is the value that should be passed to :c:func:`mmap()`,
 	similar to the ``offset`` field in struct
 	:c:type:`v4l2_buffer`.
     * - unsigned long
@@ -384,7 +382,6 @@ struct v4l2_plane
 	applications.
 
 
-
 .. c:type:: v4l2_buf_type
 
 enum v4l2_buf_type
@@ -448,7 +445,6 @@ enum v4l2_buf_type
       - Buffer for metadata output, see :ref:`metadata`.
 
 
-
 .. _buffer-flags:
 
 Buffer Flags
@@ -706,7 +702,6 @@ enum v4l2_memory
       - The buffer is used for :ref:`DMA shared buffer <dmabuf>` I/O.
 
 
-
 Timecodes
 =========
 
@@ -715,7 +710,6 @@ The :c:type:`v4l2_buffer_timecode` structure is designed to hold a
 (struct :c:type:`timeval` timestamps are stored in the struct
 :c:type:`v4l2_buffer` ``timestamp`` field.)
 
-
 .. c:type:: v4l2_timecode
 
 struct v4l2_timecode
@@ -752,7 +746,6 @@ struct v4l2_timecode
       - The "user group" bits from the timecode.
 
 
-
 .. _timecode-type:
 
 Timecode Types
@@ -782,7 +775,6 @@ Timecode Types
       -
 
 
-
 .. _timecode-flags:
 
 Timecode Flags
diff --git a/Documentation/userspace-api/media/v4l/dev-capture.rst b/Documentation/userspace-api/media/v4l/dev-capture.rst
index 5ea1ffe71fa6..fe58fd450e2f 100644
--- a/Documentation/userspace-api/media/v4l/dev-capture.rst
+++ b/Documentation/userspace-api/media/v4l/dev-capture.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _capture:
 
@@ -19,7 +20,6 @@ device.
 
 .. note:: The same device file names are used for video output devices.
 
-
 Querying Capabilities
 =====================
 
@@ -34,7 +34,6 @@ functions they may also support the :ref:`video overlay <overlay>`
 streaming I/O methods must be supported. Tuners and audio inputs are
 optional.
 
-
 Supplemental Functions
 ======================
 
@@ -45,7 +44,6 @@ Video capture devices shall support :ref:`audio input <audio>`,
 :ref:`video input <video>` ioctls must be supported by all video
 capture devices.
 
-
 Image Format Negotiation
 ========================
 
@@ -55,7 +53,7 @@ capture, the latter how images are stored in memory, i. e. in RGB or YUV
 format, the number of bits per pixel or width and height. Together they
 also define how images are scaled in the process.
 
-As usual these parameters are *not* reset at :ref:`open() <func-open>`
+As usual these parameters are *not* reset at :c:func:`open()`
 time to permit Unix tool chains, programming a device and then reading
 from it as if it was a plain file. Well written V4L2 applications ensure
 they really get what they want, including cropping and scaling.
@@ -95,7 +93,6 @@ and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl, even if :ref:`VIDIOC_S_FMT <VIDIOC
 requests and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does.
 :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is optional.
 
-
 Reading Images
 ==============
 
diff --git a/Documentation/userspace-api/media/v4l/dev-output.rst b/Documentation/userspace-api/media/v4l/dev-output.rst
index 2315faf61aaf..eadcb4aa813b 100644
--- a/Documentation/userspace-api/media/v4l/dev-output.rst
+++ b/Documentation/userspace-api/media/v4l/dev-output.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _output:
 
@@ -18,7 +19,6 @@ device.
 
 .. note:: The same device file names are used also for video capture devices.
 
-
 Querying Capabilities
 =====================
 
@@ -32,7 +32,6 @@ functions they may also support the :ref:`raw VBI output <raw-vbi>`
 streaming I/O methods must be supported. Modulators and audio outputs
 are optional.
 
-
 Supplemental Functions
 ======================
 
@@ -43,7 +42,6 @@ Video output devices shall support :ref:`audio output <audio>`,
 :ref:`video output <video>` ioctls must be supported by all video
 output devices.
 
-
 Image Format Negotiation
 ========================
 
@@ -53,7 +51,7 @@ the latter how images are stored in memory, i. e. in RGB or YUV format,
 the number of bits per pixel or width and height. Together they also
 define how images are scaled in the process.
 
-As usual these parameters are *not* reset at :ref:`open() <func-open>`
+As usual these parameters are *not* reset at :c:func:`open()`
 time to permit Unix tool chains, programming a device and then writing
 to it as if it was a plain file. Well written V4L2 applications ensure
 they really get what they want, including cropping and scaling.
@@ -92,7 +90,6 @@ and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl, even if :ref:`VIDIOC_S_FMT <VIDIOC
 requests and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does.
 :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is optional.
 
-
 Writing Images
 ==============
 
diff --git a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
index bb52f85a619c..3f43a01ba938 100644
--- a/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-raw-vbi.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _raw-vbi:
 
@@ -32,7 +33,6 @@ applications must call the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl.
 Accessed as ``/dev/vbi``, raw VBI capturing or output is the default
 device function.
 
-
 Querying Capabilities
 =====================
 
@@ -44,7 +44,6 @@ in the ``capabilities`` field of struct
 read/write, streaming or asynchronous I/O methods must be supported. VBI
 devices may or may not have a tuner or modulator.
 
-
 Supplemental Functions
 ======================
 
@@ -53,7 +52,6 @@ VBI devices shall support :ref:`video input or output <video>`,
 ioctls as needed. The :ref:`video standard <standard>` ioctls provide
 information vital to program a VBI device, therefore must be supported.
 
-
 Raw VBI Format Negotiation
 ==========================
 
@@ -62,7 +60,7 @@ frequency. To properly interpret the data V4L2 specifies an ioctl to
 query the sampling parameters. Moreover, to allow for some flexibility
 applications can also suggest different parameters.
 
-As usual these parameters are *not* reset at :ref:`open() <func-open>`
+As usual these parameters are *not* reset at :c:func:`open()`
 time to permit Unix tool chains, programming a device and then reading
 from it as if it was a plain file. Well written V4L2 applications should
 always ensure they really get what they want, requesting reasonable
@@ -91,8 +89,8 @@ happen for instance when the video and VBI areas to capture would
 overlap, or when the driver supports multiple opens and another process
 already requested VBI capturing or output. Anyway, applications must
 expect other resource allocation points which may return ``EBUSY``, at the
-:ref:`VIDIOC_STREAMON` ioctl and the first :ref:`read() <func-read>`
-, :ref:`write() <func-write>` and :ref:`select() <func-select>` calls.
+:ref:`VIDIOC_STREAMON` ioctl and the first :c:func:`read()`
+, :c:func:`write()` and :c:func:`select()` calls.
 
 VBI devices must implement both the :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and
 :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl, even if :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ignores all requests
@@ -182,7 +180,6 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
       - This array is reserved for future extensions. Drivers and
 	applications must set it to zero.
 
-
 .. tabularcolumns:: |p{4.4cm}|p{1.5cm}|p{11.6cm}|
 
 .. _vbifmt-flags:
@@ -218,7 +215,6 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
 	non-zero.
 
 
-
 .. _vbi-hsync:
 
 .. kernel-figure:: vbi_hsync.svg
@@ -227,7 +223,6 @@ and always returns default parameters as :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` does
 
     **Figure 4.1. Line synchronization**
 
-
 .. _vbi-525:
 
 .. kernel-figure:: vbi_525.svg
@@ -251,7 +246,6 @@ negotiation, or after switching the video standard which may invalidate
 the negotiated VBI parameters, should be refused by the driver. A format
 change during active I/O is not permitted.
 
-
 Reading and writing VBI images
 ==============================
 
@@ -261,7 +255,6 @@ consisting of two fields of VBI images immediately following in memory.
 
 The total size of a frame computes as follows:
 
-
 .. code-block:: c
 
     (count[0] + count[1]) * samples_per_line * sample size in bytes
@@ -276,8 +269,8 @@ The latter bears the possibility of synchronizing video and VBI data by
 using buffer timestamps.
 
 Remember the :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` ioctl and the
-first :ref:`read() <func-read>`, :ref:`write() <func-write>` and
-:ref:`select() <func-select>` call can be resource allocation
+first :c:func:`read()`, :c:func:`write()` and
+:c:func:`select()` call can be resource allocation
 points returning an ``EBUSY`` error code if the required hardware resources
 are temporarily unavailable, for example the device is already in use by
 another process.
diff --git a/Documentation/userspace-api/media/v4l/dev-rds.rst b/Documentation/userspace-api/media/v4l/dev-rds.rst
index 463726ba46d7..207216d5e6a5 100644
--- a/Documentation/userspace-api/media/v4l/dev-rds.rst
+++ b/Documentation/userspace-api/media/v4l/dev-rds.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _rds:
 
@@ -28,7 +29,6 @@ The RDS interface does not support this format. Should support for MMBS
 the linux-media mailing list:
 `https://linuxtv.org/lists.php <https://linuxtv.org/lists.php>`__.
 
-
 Querying Capabilities
 =====================
 
@@ -68,31 +68,27 @@ like program identification codes and radio text, the flag
 :ref:`Writing RDS data <writing-rds-data>` and
 :ref:`FM Transmitter Control Reference <fm-tx-controls>`.
 
-
 .. _reading-rds-data:
 
 Reading RDS data
 ================
 
 RDS data can be read from the radio device with the
-:ref:`read() <func-read>` function. The data is packed in groups of
+:c:func:`read()` function. The data is packed in groups of
 three bytes.
 
-
 .. _writing-rds-data:
 
 Writing RDS data
 ================
 
 RDS data can be written to the radio device with the
-:ref:`write() <func-write>` function. The data is packed in groups of
+:c:func:`write()` function. The data is packed in groups of
 three bytes, as follows:
 
-
 RDS datastructures
 ==================
 
-
 .. c:type:: v4l2_rds_data
 
 .. tabularcolumns:: |p{2.5cm}|p{2.5cm}|p{12.5cm}|
@@ -113,7 +109,6 @@ RDS datastructures
       - Block description
 
 
-
 .. _v4l2-rds-block:
 
 .. tabularcolumns:: |p{2.9cm}|p{14.6cm}|
@@ -136,7 +131,6 @@ RDS datastructures
 	reception of this block.
 
 
-
 .. _v4l2-rds-block-codes:
 
 .. tabularcolumns:: |p{6.4cm}|p{2.0cm}|p{1.2cm}|p{7.9cm}|
diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
index 807751f305fb..f0df144c9f63 100644
--- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _sliced:
 
@@ -27,7 +28,6 @@ however the default function here is video capturing or output.
 Different file descriptors must be used to pass raw and sliced VBI data
 simultaneously, if this is supported by the driver.
 
-
 Querying Capabilities
 =====================
 
@@ -39,7 +39,6 @@ respectively, in the ``capabilities`` field of struct
 read/write, streaming or asynchronous :ref:`I/O methods <io>` must be
 supported. Sliced VBI devices may have a tuner or modulator.
 
-
 Supplemental Functions
 ======================
 
@@ -49,7 +48,6 @@ capabilities, and they may support :ref:`control` ioctls.
 The :ref:`video standard <standard>` ioctls provide information vital
 to program a sliced VBI device, therefore must be supported.
 
-
 .. _sliced-vbi-format-negotitation:
 
 Sliced VBI Format Negotiation
@@ -96,9 +94,8 @@ at this point, it may return an ``EBUSY`` error code if the required
 resources are temporarily unavailable. Other resource allocation points
 which may return ``EBUSY`` can be the
 :ref:`VIDIOC_STREAMON` ioctl and the first
-:ref:`read() <func-read>`, :ref:`write() <func-write>` and
-:ref:`select() <func-select>` call.
-
+:c:func:`read()`, :c:func:`write()` and
+:c:func:`select()` call.
 
 .. c:type:: v4l2_sliced_vbi_format
 
@@ -191,7 +188,7 @@ struct v4l2_sliced_vbi_format
     * - __u32
       - ``io_size``
       - :cspan:`2` Maximum number of bytes passed by one
-	:ref:`read() <func-read>` or :ref:`write() <func-write>` call,
+	:c:func:`read()` or :c:func:`write()` call,
 	and the buffer size in bytes for the
 	:ref:`VIDIOC_QBUF` and
 	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl. Drivers set this field
@@ -274,7 +271,6 @@ Sliced VBI services
 
     \normalsize
 
-
 Drivers may return an ``EINVAL`` error code when applications attempt to
 read or write data without prior format negotiation, after switching the
 video standard (which may invalidate the negotiated VBI parameters) and
@@ -284,13 +280,12 @@ return an ``EBUSY`` error code when applications attempt to change the
 format while i/o is in progress (between a
 :ref:`VIDIOC_STREAMON` and
 :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` call, and after the first
-:ref:`read() <func-read>` or :ref:`write() <func-write>` call).
-
+:c:func:`read()` or :c:func:`write()` call).
 
 Reading and writing sliced VBI data
 ===================================
 
-A single :ref:`read() <func-read>` or :ref:`write() <func-write>`
+A single :c:func:`read()` or :c:func:`write()`
 call must pass all data belonging to one video frame. That is an array
 of struct :c:type:`v4l2_sliced_vbi_data` structures with one or
 more elements and a total size not exceeding ``io_size`` bytes. Likewise
@@ -298,7 +293,6 @@ in streaming I/O mode one buffer of ``io_size`` bytes must contain data
 of one video frame. The ``id`` of unused
 struct :c:type:`v4l2_sliced_vbi_data` elements must be zero.
 
-
 .. c:type:: v4l2_sliced_vbi_data
 
 struct v4l2_sliced_vbi_data
@@ -344,9 +338,8 @@ struct v4l2_sliced_vbi_data
 	bytes at the end of this array are undefined, drivers and
 	applications shall ignore them.
 
-
 Packets are always passed in ascending line number order, without
-duplicate line numbers. The :ref:`write() <func-write>` function and
+duplicate line numbers. The :c:func:`write()` function and
 the :ref:`VIDIOC_QBUF` ioctl must return an ``EINVAL``
 error code when applications violate this rule. They must also return an
 EINVAL error code when applications pass an incorrect field or line
@@ -370,7 +363,6 @@ streaming (:ref:`memory mapping <mmap>` and/or
 :ref:`user pointer <userp>`) I/O. The latter bears the possibility of
 synchronizing video and VBI data by using buffer timestamps.
 
-
 Sliced VBI Data in MPEG Streams
 ===============================
 
@@ -405,7 +397,6 @@ data insertion is not supported by the device.
 The following subsections specify the format of the embedded sliced VBI
 data.
 
-
 MPEG Stream Embedded, Sliced VBI Data Format: NONE
 --------------------------------------------------
 
@@ -417,7 +408,6 @@ nor driver shall insert "empty" embedded sliced VBI data packets in the
 MPEG stream when this format is set. No MPEG stream data structures are
 specified for this format.
 
-
 MPEG Stream Embedded, Sliced VBI Data Format: IVTV
 --------------------------------------------------
 
@@ -460,7 +450,6 @@ the end with unspecified fill bytes to align the end of the payload to a
 with 18 lines/field with 43 bytes of data/line and a 4 byte magic
 number).
 
-
 .. c:type:: v4l2_mpeg_vbi_fmt_ivtv
 
 struct v4l2_mpeg_vbi_fmt_ivtv
@@ -523,7 +512,6 @@ Magic Constants for struct v4l2_mpeg_vbi_fmt_ivtv magic field
 	valid and that 36 lines of sliced VBI data are present.
 
 
-
 .. c:type:: v4l2_mpeg_vbi_itv0
 
 .. c:type:: v4l2_mpeg_vbi_ITV0
@@ -548,7 +536,6 @@ structs v4l2_mpeg_vbi_itv0 and v4l2_mpeg_vbi_ITV0
 	value:
 
 
-
 	::
 
 	    linemask[0] b0:     line  6  first field
@@ -574,7 +561,6 @@ structs v4l2_mpeg_vbi_itv0 and v4l2_mpeg_vbi_ITV0
 	applications.
 
 
-
 .. _v4l2-mpeg-vbi-itv0-1:
 
 struct v4l2_mpeg_vbi_ITV0
@@ -596,7 +582,6 @@ struct v4l2_mpeg_vbi_ITV0
 	lines 6 through 23 of the second field.
 
 
-
 .. c:type:: v4l2_mpeg_vbi_itv0_line
 
 struct v4l2_mpeg_vbi_itv0_line
@@ -619,7 +604,6 @@ struct v4l2_mpeg_vbi_itv0_line
       - The sliced VBI data for the line.
 
 
-
 .. _ITV0-Line-Identifier-Constants:
 
 Line Identifiers for struct v4l2_mpeg_vbi_itv0_line id field
@@ -653,7 +637,6 @@ Line Identifiers for struct v4l2_mpeg_vbi_itv0_line id field
 	description of the line payload.
 
 
-
 .. [#f1]
    According to :ref:`ETS 300 706 <ets300706>` lines 6-22 of the first
    field and lines 5-22 of the second field may carry Teletext data.
diff --git a/Documentation/userspace-api/media/v4l/diff-v4l.rst b/Documentation/userspace-api/media/v4l/diff-v4l.rst
index 3f7bac44377c..caa05fbbd396 100644
--- a/Documentation/userspace-api/media/v4l/diff-v4l.rst
+++ b/Documentation/userspace-api/media/v4l/diff-v4l.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _diff-v4l:
 
@@ -13,7 +14,6 @@ the much improved V4L2 API replaces the V4L API. The support for the old
 V4L calls were removed from Kernel, but the library :ref:`libv4l`
 supports the conversion of a V4L API system call into a V4L2 one.
 
-
 Opening and Closing Devices
 ===========================
 
@@ -32,7 +32,6 @@ recommend that V4L2 drivers by default register devices with the same
 numbers, but the system administrator can assign arbitrary minor numbers
 using driver module options. The major device number remains 81.
 
-
 .. _v4l-dev:
 
 .. flat-table:: V4L Device Types, Names and Numbers
@@ -53,14 +52,12 @@ using driver module options. The major device number remains 81.
       - ``/dev/vbi``, ``/dev/vbi0`` to ``/dev/vbi31``
       - 224-255
 
-
 V4L prohibits (or used to prohibit) multiple opens of a device file.
 V4L2 drivers *may* support multiple opens, see :ref:`open` for details
 and consequences.
 
 V4L drivers respond to V4L2 ioctls with an ``EINVAL`` error code.
 
-
 Querying Capabilities
 =====================
 
@@ -151,7 +148,6 @@ introduction.
       - ``-``
       - See above.
 
-
 The ``audios`` field was replaced by ``capabilities`` flag
 ``V4L2_CAP_AUDIO``, indicating *if* the device has any audio inputs or
 outputs. To determine their number applications can enumerate audio
@@ -164,7 +160,6 @@ were removed. Calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` or
 dimensions returns the closest size possible, taking into account the
 current video standard, cropping and scaling limitations.
 
-
 Video Sources
 =============
 
@@ -180,7 +175,6 @@ The ``channel`` field counting inputs was renamed to ``index``, the
 video input types were renamed as follows:
 
 
-
 .. flat-table::
     :header-rows:  1
     :stub-columns: 0
@@ -192,7 +186,6 @@ video input types were renamed as follows:
     * - ``VIDEO_TYPE_CAMERA``
       - ``V4L2_INPUT_TYPE_CAMERA``
 
-
 Unlike the ``tuners`` field expressing the number of tuners of this
 input, V4L2 assumes each video input is connected to at most one tuner.
 However a tuner can have more than one input, i. e. RF connectors, and a
@@ -216,7 +209,6 @@ addition together with the ``norm`` field and has been removed in the
 meantime. V4L2 has a similar, albeit more comprehensive approach to
 video standards, see :ref:`standard` for more information.
 
-
 Tuning
 ======
 
@@ -260,7 +252,6 @@ frequency where renamed to
 to a struct :c:type:`v4l2_frequency` instead of an
 unsigned long integer.
 
-
 .. _v4l-image-properties:
 
 Image Properties
@@ -274,7 +265,6 @@ replaced by V4L2 controls accessible with the
 :ref:`VIDIOC_S_CTRL <VIDIOC_G_CTRL>` ioctls:
 
 
-
 .. flat-table::
     :header-rows:  1
     :stub-columns: 0
@@ -292,7 +282,6 @@ replaced by V4L2 controls accessible with the
     * - ``whiteness``
       - ``V4L2_CID_WHITENESS``
 
-
 The V4L picture controls are assumed to range from 0 to 65535 with no
 particular reset value. The V4L2 API permits arbitrary limits and
 defaults which can be queried with the
@@ -306,7 +295,6 @@ of the image depth and others need not know. The ``palette`` field moved
 into the struct :c:type:`v4l2_pix_format`:
 
 
-
 .. flat-table::
     :header-rows:  1
     :stub-columns: 0
@@ -346,11 +334,9 @@ into the struct :c:type:`v4l2_pix_format`:
     * - ``VIDEO_PALETTE_YUV410P``
       - :ref:`V4L2_PIX_FMT_YVU410 <V4L2-PIX-FMT-YVU410>`
 
-
 V4L2 image formats are defined in :ref:`pixfmt`. The image format can
 be selected with the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl.
 
-
 Audio
 =====
 
@@ -384,7 +370,6 @@ The following fields where replaced by V4L2 controls accessible with the
 :ref:`VIDIOC_S_CTRL <VIDIOC_G_CTRL>` ioctls:
 
 
-
 .. flat-table::
     :header-rows:  1
     :stub-columns: 0
@@ -400,7 +385,6 @@ The following fields where replaced by V4L2 controls accessible with the
     * - ``balance``
       - ``V4L2_CID_AUDIO_BALANCE``
 
-
 To determine which of these controls are supported by a driver V4L
 provides the ``flags`` ``VIDEO_AUDIO_VOLUME``, ``VIDEO_AUDIO_BASS``,
 ``VIDEO_AUDIO_TREBLE`` and ``VIDEO_AUDIO_BALANCE``. In the V4L2 API the
@@ -416,7 +400,6 @@ V4L2 API permits arbitrary limits and defaults which can be queried with
 the :ref:`VIDIOC_QUERYCTRL` ioctl. For general
 information about controls see :ref:`control`.
 
-
 Frame Buffer Overlay
 ====================
 
@@ -463,7 +446,6 @@ size is determined by ``w.width`` and ``w.height``.
 The ``VIDIOCCAPTURE`` ioctl to enable or disable overlay was renamed to
 :ref:`VIDIOC_OVERLAY`.
 
-
 Cropping
 ========
 
@@ -490,21 +472,19 @@ struct :c:type:`v4l2_window`. These structures are used to
 select a capture or overlay format with the
 :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl.
 
-
 Reading Images, Memory Mapping
 ==============================
 
-
 Capturing using the read method
 -------------------------------
 
 There is no essential difference between reading images from a V4L or
-V4L2 device using the :ref:`read() <func-read>` function, however V4L2
+V4L2 device using the :c:func:`read()` function, however V4L2
 drivers are not required to support this I/O method. Applications can
 determine if the function is available with the
 :ref:`VIDIOC_QUERYCAP` ioctl. All V4L2 devices
 exchanging data with applications must support the
-:ref:`select() <func-select>` and :ref:`poll() <func-poll>`
+:c:func:`select()` and :c:func:`poll()`
 functions.
 
 To select an image format and size, V4L provides the ``VIDIOCSPICT`` and
@@ -517,7 +497,6 @@ negotiation ioctls :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and
 
 For more information about the V4L2 read interface see :ref:`rw`.
 
-
 Capturing using memory mapping
 ------------------------------
 
@@ -528,7 +507,6 @@ read method. V4L2 supports memory mapping as well, with a few
 differences.
 
 
-
 .. flat-table::
     :header-rows:  1
     :stub-columns: 0
@@ -550,7 +528,7 @@ differences.
 	``VIDIOCGMBUF`` ioctl is available to query the number of buffers,
 	the offset of each buffer from the start of the virtual file, and
 	the overall amount of memory used, which can be used as arguments
-	for the :ref:`mmap() <func-mmap>` function.
+	for the :c:func:`mmap()` function.
       - Buffers are individually mapped. The offset and size of each
 	buffer can be determined with the
 	:ref:`VIDIOC_QUERYBUF` ioctl.
@@ -568,7 +546,7 @@ differences.
 	the incoming queue. Filled buffers are dequeued from the outgoing
 	queue with the :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl. To wait
 	until filled buffers become available this function,
-	:ref:`select() <func-select>` or :ref:`poll() <func-poll>` can
+	:c:func:`select()` or :c:func:`poll()` can
 	be used. The :ref:`VIDIOC_STREAMON` ioctl
 	must be called once after enqueuing one or more buffers to start
 	capturing. Its counterpart
@@ -577,11 +555,9 @@ differences.
 	signal status, if known, with the
 	:ref:`VIDIOC_ENUMINPUT` ioctl.
 
-
 For a more in-depth discussion of memory mapping and examples, see
 :ref:`mmap`.
 
-
 Reading Raw VBI Data
 ====================
 
@@ -592,7 +568,6 @@ the V4L VBI interface. Reading from the device yields a raw VBI image
 with the following parameters:
 
 
-
 .. flat-table::
     :header-rows:  1
     :stub-columns: 0
@@ -616,7 +591,6 @@ with the following parameters:
     * - flags
       - 0
 
-
 Undocumented in the V4L specification, in Linux 2.3 the
 ``VIDIOCGVBIFMT`` and ``VIDIOCSVBIFMT`` ioctls using struct
 ``vbi_format`` were added to determine the VBI image
@@ -630,11 +604,10 @@ remaining fields are probably equivalent to struct
 
 Apparently only the Zoran (ZR 36120) driver implements these ioctls. The
 semantics differ from those specified for V4L2 in two ways. The
-parameters are reset on :ref:`open() <func-open>` and
+parameters are reset on :c:func:`open()` and
 ``VIDIOCSVBIFMT`` always returns an ``EINVAL`` error code if the parameters
 are invalid.
 
-
 Miscellaneous
 =============
 
diff --git a/Documentation/userspace-api/media/v4l/dmabuf.rst b/Documentation/userspace-api/media/v4l/dmabuf.rst
index f43d400dafaa..50fba11c2477 100644
--- a/Documentation/userspace-api/media/v4l/dmabuf.rst
+++ b/Documentation/userspace-api/media/v4l/dmabuf.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _dmabuf:
 
@@ -36,7 +37,6 @@ are passed in struct :c:type:`v4l2_buffer` (or in struct
 driver must be switched into DMABUF I/O mode by calling the
 :ref:`VIDIOC_REQBUFS <VIDIOC_REQBUFS>` with the desired buffer type.
 
-
 Example: Initiating streaming I/O with DMABUF file descriptors
 ==============================================================
 
@@ -135,10 +135,10 @@ buffers it must wait until an empty buffer can be dequeued and reused.
 Two methods exist to suspend execution of the application until one or
 more buffers can be dequeued. By default :ref:`VIDIOC_DQBUF
 <VIDIOC_QBUF>` blocks when no buffer is in the outgoing queue. When the
-``O_NONBLOCK`` flag was given to the :ref:`open() <func-open>` function,
+``O_NONBLOCK`` flag was given to the :c:func:`open()` function,
 :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` returns immediately with an ``EAGAIN``
 error code when no buffer is available. The
-:ref:`select() <func-select>` and :ref:`poll() <func-poll>`
+:c:func:`select()` and :c:func:`poll()`
 functions are always available.
 
 To start and stop capturing or displaying applications call the
@@ -158,5 +158,5 @@ Drivers implementing DMABUF importing I/O must support the
 :ref:`VIDIOC_REQBUFS <VIDIOC_REQBUFS>`, :ref:`VIDIOC_QBUF <VIDIOC_QBUF>`,
 :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`, :ref:`VIDIOC_STREAMON
 <VIDIOC_STREAMON>` and :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` ioctls,
-and the :ref:`select() <func-select>` and :ref:`poll() <func-poll>`
+and the :c:func:`select()` and :c:func:`poll()`
 functions.
diff --git a/Documentation/userspace-api/media/v4l/format.rst b/Documentation/userspace-api/media/v4l/format.rst
index eaa6445f6160..35bbb2fea46e 100644
--- a/Documentation/userspace-api/media/v4l/format.rst
+++ b/Documentation/userspace-api/media/v4l/format.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _format:
 
@@ -6,7 +7,6 @@
 Data Formats
 ************
 
-
 Data Format Negotiation
 =======================
 
@@ -53,8 +53,8 @@ image size.
 When applications omit the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl its locking side
 effects are implied by the next step, the selection of an I/O method
 with the :ref:`VIDIOC_REQBUFS` ioctl or implicit
-with the first :ref:`read() <func-read>` or
-:ref:`write() <func-write>` call.
+with the first :c:func:`read()` or
+:c:func:`write()` call.
 
 Generally only one logical stream can be assigned to a file descriptor,
 the exception being drivers permitting simultaneous video capturing and
@@ -67,7 +67,6 @@ All drivers exchanging data with applications must support the
 :ref:`VIDIOC_G_FMT <VIDIOC_G_FMT>` and :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl. Implementation of the
 :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` is highly recommended but optional.
 
-
 Image Format Enumeration
 ========================
 
diff --git a/Documentation/userspace-api/media/v4l/func-close.rst b/Documentation/userspace-api/media/v4l/func-close.rst
index c03ff3e62738..dba3263fd1b9 100644
--- a/Documentation/userspace-api/media/v4l/func-close.rst
+++ b/Documentation/userspace-api/media/v4l/func-close.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _func-close:
 
@@ -11,7 +12,6 @@ Name
 
 v4l2-close - Close a V4L2 device
 
-
 Synopsis
 ========
 
@@ -19,16 +19,13 @@ Synopsis
 
     #include <unistd.h>
 
-
 .. c:function:: int close( int fd )
-    :name: v4l2-close
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
-
+    File descriptor returned by :c:func:`open()`.
 
 Description
 ===========
@@ -38,7 +35,6 @@ associated with the file descriptor are freed. However data format
 parameters, current input or output, control values or other properties
 remain unchanged.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/func-ioctl.rst b/Documentation/userspace-api/media/v4l/func-ioctl.rst
index 8bde6b4f1cb5..f3b005094334 100644
--- a/Documentation/userspace-api/media/v4l/func-ioctl.rst
+++ b/Documentation/userspace-api/media/v4l/func-ioctl.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _func-ioctl:
 
@@ -11,7 +12,6 @@ Name
 
 v4l2-ioctl - Program a V4L2 device
 
-
 Synopsis
 ========
 
@@ -19,15 +19,13 @@ Synopsis
 
     #include <sys/ioctl.h>
 
-
-.. c:function:: int ioctl( int fd, int request, void *argp )
-    :name: v4l2-ioctl
+``int ioctl(int fd, int request, void *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``request``
     V4L2 ioctl request code as defined in the ``videodev2.h`` header
@@ -36,7 +34,6 @@ Arguments
 ``argp``
     Pointer to a function parameter, usually a structure.
 
-
 Description
 ===========
 
@@ -50,7 +47,6 @@ include the version in the kernel sources on the system they compile on.
 All V4L2 ioctl requests, their respective function and parameters are
 specified in :ref:`user-func`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/func-mmap.rst b/Documentation/userspace-api/media/v4l/func-mmap.rst
index b3a9cd862a7f..e3e5e64ebe7e 100644
--- a/Documentation/userspace-api/media/v4l/func-mmap.rst
+++ b/Documentation/userspace-api/media/v4l/func-mmap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _func-mmap:
 
@@ -11,7 +12,6 @@ Name
 
 v4l2-mmap - Map device memory into application address space
 
-
 Synopsis
 ========
 
@@ -20,9 +20,7 @@ Synopsis
     #include <unistd.h>
     #include <sys/mman.h>
 
-
 .. c:function:: void *mmap( void *start, size_t length, int prot, int flags, int fd, off_t offset )
-    :name: v4l2-mmap
 
 Arguments
 =========
@@ -54,7 +52,7 @@ Arguments
       #. The Linux ``videobuf`` kernel module, which is used by some
 	 drivers supports only ``PROT_READ`` | ``PROT_WRITE``. When the
 	 driver does not support the desired protection, the
-	 :ref:`mmap() <func-mmap>` function fails.
+	 :c:func:`mmap()` function fails.
 
       #. Device memory accesses (e. g. the memory on a graphics card
 	 with video capturing hardware) may incur a performance penalty
@@ -70,7 +68,7 @@ Arguments
 
     ``MAP_FIXED`` requests that the driver selects no other address than
     the one specified. If the specified address cannot be used,
-    :ref:`mmap() <func-mmap>` will fail. If ``MAP_FIXED`` is specified,
+    :c:func:`mmap()` will fail. If ``MAP_FIXED`` is specified,
     ``start`` must be a multiple of the pagesize. Use of this option is
     discouraged.
 
@@ -87,7 +85,7 @@ Arguments
        flags.
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``offset``
     Offset of the buffer in device memory. This must be the same value
@@ -97,11 +95,10 @@ Arguments
     in the struct :c:type:`v4l2_plane` ``m`` union
     ``mem_offset`` field for the multi-planar API.
 
-
 Description
 ===========
 
-The :ref:`mmap() <func-mmap>` function asks to map ``length`` bytes starting at
+The :c:func:`mmap()` function asks to map ``length`` bytes starting at
 ``offset`` in the memory of the device specified by ``fd`` into the
 application address space, preferably at address ``start``. This latter
 address is a hint only, and is usually specified as 0.
@@ -111,13 +108,12 @@ Suitable length and offset parameters are queried with the
 allocated with the :ref:`VIDIOC_REQBUFS` ioctl
 before they can be queried.
 
-To unmap buffers the :ref:`munmap() <func-munmap>` function is used.
-
+To unmap buffers the :c:func:`munmap()` function is used.
 
 Return Value
 ============
 
-On success :ref:`mmap() <func-mmap>` returns a pointer to the mapped buffer. On
+On success :c:func:`mmap()` returns a pointer to the mapped buffer. On
 error ``MAP_FAILED`` (-1) is returned, and the ``errno`` variable is set
 appropriately. Possible error codes are:
 
diff --git a/Documentation/userspace-api/media/v4l/func-munmap.rst b/Documentation/userspace-api/media/v4l/func-munmap.rst
index e8a27e43373a..077d58333904 100644
--- a/Documentation/userspace-api/media/v4l/func-munmap.rst
+++ b/Documentation/userspace-api/media/v4l/func-munmap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _func-munmap:
 
@@ -11,7 +12,6 @@ Name
 
 v4l2-munmap - Unmap device memory
 
-
 Synopsis
 ========
 
@@ -20,37 +20,33 @@ Synopsis
     #include <unistd.h>
     #include <sys/mman.h>
 
-
 .. c:function:: int munmap( void *start, size_t length )
-    :name: v4l2-munmap
 
 Arguments
 =========
 
 ``start``
     Address of the mapped buffer as returned by the
-    :ref:`mmap() <func-mmap>` function.
+    :c:func:`mmap()` function.
 
 ``length``
     Length of the mapped buffer. This must be the same value as given to
-    :ref:`mmap() <func-mmap>` and returned by the driver in the struct
+    :c:func:`mmap()` and returned by the driver in the struct
     :c:type:`v4l2_buffer` ``length`` field for the
     single-planar API and in the struct
     :c:type:`v4l2_plane` ``length`` field for the
     multi-planar API.
 
-
 Description
 ===========
 
-Unmaps a previously with the :ref:`mmap() <func-mmap>` function mapped
+Unmaps a previously with the :c:func:`mmap()` function mapped
 buffer and frees it, if possible.
 
-
 Return Value
 ============
 
-On success :ref:`munmap() <func-munmap>` returns 0, on failure -1 and the
+On success :c:func:`munmap()` returns 0, on failure -1 and the
 ``errno`` variable is set appropriately:
 
 EINVAL
diff --git a/Documentation/userspace-api/media/v4l/func-open.rst b/Documentation/userspace-api/media/v4l/func-open.rst
index f3890d284918..ba23ff1e45dd 100644
--- a/Documentation/userspace-api/media/v4l/func-open.rst
+++ b/Documentation/userspace-api/media/v4l/func-open.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _func-open:
 
@@ -11,7 +12,6 @@ Name
 
 v4l2-open - Open a V4L2 device
 
-
 Synopsis
 ========
 
@@ -19,9 +19,7 @@ Synopsis
 
     #include <fcntl.h>
 
-
 .. c:function:: int open( const char *device_name, int flags )
-    :name: v4l2-open
 
 Arguments
 =========
@@ -34,7 +32,7 @@ Arguments
     technicality, input devices still support only reading and output
     devices only writing.
 
-    When the ``O_NONBLOCK`` flag is given, the :ref:`read() <func-read>`
+    When the ``O_NONBLOCK`` flag is given, the :c:func:`read()`
     function and the :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl will
     return the ``EAGAIN`` error code when no data is available or no
     buffer is in the driver outgoing queue, otherwise these functions
@@ -43,22 +41,20 @@ Arguments
 
     Other flags have no effect.
 
-
 Description
 ===========
 
-To open a V4L2 device applications call :ref:`open() <func-open>` with the
+To open a V4L2 device applications call :c:func:`open()` with the
 desired device name. This function has no side effects; all data format
 parameters, current input or output, control values or other properties
-remain unchanged. At the first :ref:`open() <func-open>` call after loading the
+remain unchanged. At the first :c:func:`open()` call after loading the
 driver they will be reset to default values, drivers are never in an
 undefined state.
 
-
 Return Value
 ============
 
-On success :ref:`open() <func-open>` returns the new file descriptor. On error
+On success :c:func:`open()` returns the new file descriptor. On error
 -1 is returned, and the ``errno`` variable is set appropriately.
 Possible error codes are:
 
diff --git a/Documentation/userspace-api/media/v4l/func-poll.rst b/Documentation/userspace-api/media/v4l/func-poll.rst
index 95cf9c6fedcd..cbf4a0a10ae2 100644
--- a/Documentation/userspace-api/media/v4l/func-poll.rst
+++ b/Documentation/userspace-api/media/v4l/func-poll.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _func-poll:
 
@@ -11,7 +12,6 @@ Name
 
 v4l2-poll - Wait for some event on a file descriptor
 
-
 Synopsis
 ========
 
@@ -19,19 +19,16 @@ Synopsis
 
     #include <sys/poll.h>
 
-
 .. c:function:: int poll( struct pollfd *ufds, unsigned int nfds, int timeout )
-    :name: v4l2-poll
 
 Arguments
 =========
 
 
-
 Description
 ===========
 
-With the :ref:`poll() <func-poll>` function applications can suspend execution
+With the :c:func:`poll()` function applications can suspend execution
 until the driver has captured data or is ready to accept data for
 output.
 
@@ -44,57 +41,56 @@ display. When buffers are already in the outgoing queue of the driver
 (capture) or the incoming queue isn't full (display) the function
 returns immediately.
 
-On success :ref:`poll() <func-poll>` returns the number of file descriptors
+On success :c:func:`poll()` returns the number of file descriptors
 that have been selected (that is, file descriptors for which the
-``revents`` field of the respective :c:func:`struct pollfd` structure
+``revents`` field of the respective ``struct pollfd`` structure
 is non-zero). Capture devices set the ``POLLIN`` and ``POLLRDNORM``
 flags in the ``revents`` field, output devices the ``POLLOUT`` and
 ``POLLWRNORM`` flags. When the function timed out it returns a value of
 zero, on failure it returns -1 and the ``errno`` variable is set
 appropriately. When the application did not call
-:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` the :ref:`poll() <func-poll>`
+:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` the :c:func:`poll()`
 function succeeds, but sets the ``POLLERR`` flag in the ``revents``
 field. When the application has called
 :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` for a capture device but
 hasn't yet called :ref:`VIDIOC_QBUF <VIDIOC_QBUF>`, the
-:ref:`poll() <func-poll>` function succeeds and sets the ``POLLERR`` flag in
+:c:func:`poll()` function succeeds and sets the ``POLLERR`` flag in
 the ``revents`` field. For output devices this same situation will cause
-:ref:`poll() <func-poll>` to succeed as well, but it sets the ``POLLOUT`` and
+:c:func:`poll()` to succeed as well, but it sets the ``POLLOUT`` and
 ``POLLWRNORM`` flags in the ``revents`` field.
 
 If an event occurred (see :ref:`VIDIOC_DQEVENT`)
 then ``POLLPRI`` will be set in the ``revents`` field and
-:ref:`poll() <func-poll>` will return.
+:c:func:`poll()` will return.
 
-When use of the :ref:`read() <func-read>` function has been negotiated and the
-driver does not capture yet, the :ref:`poll() <func-poll>` function starts
+When use of the :c:func:`read()` function has been negotiated and the
+driver does not capture yet, the :c:func:`poll()` function starts
 capturing. When that fails it returns a ``POLLERR`` as above. Otherwise
 it waits until data has been captured and can be read. When the driver
 captures continuously (as opposed to, for example, still images) the
 function may return immediately.
 
-When use of the :ref:`write() <func-write>` function has been negotiated and the
-driver does not stream yet, the :ref:`poll() <func-poll>` function starts
+When use of the :c:func:`write()` function has been negotiated and the
+driver does not stream yet, the :c:func:`poll()` function starts
 streaming. When that fails it returns a ``POLLERR`` as above. Otherwise
 it waits until the driver is ready for a non-blocking
-:ref:`write() <func-write>` call.
+:c:func:`write()` call.
 
 If the caller is only interested in events (just ``POLLPRI`` is set in
-the ``events`` field), then :ref:`poll() <func-poll>` will *not* start
+the ``events`` field), then :c:func:`poll()` will *not* start
 streaming if the driver does not stream yet. This makes it possible to
 just poll for events and not for buffers.
 
-All drivers implementing the :ref:`read() <func-read>` or :ref:`write() <func-write>`
-function or streaming I/O must also support the :ref:`poll() <func-poll>`
+All drivers implementing the :c:func:`read()` or :c:func:`write()`
+function or streaming I/O must also support the :c:func:`poll()`
 function.
 
-For more details see the :ref:`poll() <func-poll>` manual page.
-
+For more details see the :c:func:`poll()` manual page.
 
 Return Value
 ============
 
-On success, :ref:`poll() <func-poll>` returns the number structures which have
+On success, :c:func:`poll()` returns the number structures which have
 non-zero ``revents`` fields, or zero if the call timed out. On error -1
 is returned, and the ``errno`` variable is set appropriately:
 
diff --git a/Documentation/userspace-api/media/v4l/func-read.rst b/Documentation/userspace-api/media/v4l/func-read.rst
index 56b255c595e1..e6f6ac4bed77 100644
--- a/Documentation/userspace-api/media/v4l/func-read.rst
+++ b/Documentation/userspace-api/media/v4l/func-read.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _func-read:
 
@@ -11,7 +12,6 @@ Name
 
 v4l2-read - Read from a V4L2 device
 
-
 Synopsis
 ========
 
@@ -19,15 +19,13 @@ Synopsis
 
     #include <unistd.h>
 
-
 .. c:function:: ssize_t read( int fd, void *buf, size_t count )
-    :name: v4l2-read
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``buf``
    Buffer to be filled
@@ -38,48 +36,48 @@ Arguments
 Description
 ===========
 
-:ref:`read() <func-read>` attempts to read up to ``count`` bytes from file
+:c:func:`read()` attempts to read up to ``count`` bytes from file
 descriptor ``fd`` into the buffer starting at ``buf``. The layout of the
 data in the buffer is discussed in the respective device interface
-section, see ##. If ``count`` is zero, :ref:`read() <func-read>` returns zero
+section, see ##. If ``count`` is zero, :c:func:`read()` returns zero
 and has no other results. If ``count`` is greater than ``SSIZE_MAX``,
 the result is unspecified. Regardless of the ``count`` value each
-:ref:`read() <func-read>` call will provide at most one frame (two fields)
+:c:func:`read()` call will provide at most one frame (two fields)
 worth of data.
 
-By default :ref:`read() <func-read>` blocks until data becomes available. When
-the ``O_NONBLOCK`` flag was given to the :ref:`open() <func-open>`
+By default :c:func:`read()` blocks until data becomes available. When
+the ``O_NONBLOCK`` flag was given to the :c:func:`open()`
 function it returns immediately with an ``EAGAIN`` error code when no data
-is available. The :ref:`select() <func-select>` or
-:ref:`poll() <func-poll>` functions can always be used to suspend
+is available. The :c:func:`select()` or
+:c:func:`poll()` functions can always be used to suspend
 execution until data becomes available. All drivers supporting the
-:ref:`read() <func-read>` function must also support :ref:`select() <func-select>` and
-:ref:`poll() <func-poll>`.
+:c:func:`read()` function must also support :c:func:`select()` and
+:c:func:`poll()`.
 
 Drivers can implement read functionality in different ways, using a
 single or multiple buffers and discarding the oldest or newest frames
 once the internal buffers are filled.
 
-:ref:`read() <func-read>` never returns a "snapshot" of a buffer being filled.
+:c:func:`read()` never returns a "snapshot" of a buffer being filled.
 Using a single buffer the driver will stop capturing when the
 application starts reading the buffer until the read is finished. Thus
 only the period of the vertical blanking interval is available for
 reading, or the capture rate must fall below the nominal frame rate of
 the video standard.
 
-The behavior of :ref:`read() <func-read>` when called during the active picture
+The behavior of :c:func:`read()` when called during the active picture
 period or the vertical blanking separating the top and bottom field
 depends on the discarding policy. A driver discarding the oldest frames
 keeps capturing into an internal buffer, continuously overwriting the
 previously, not read frame, and returns the frame being received at the
-time of the :ref:`read() <func-read>` call as soon as it is complete.
+time of the :c:func:`read()` call as soon as it is complete.
 
 A driver discarding the newest frames stops capturing until the next
-:ref:`read() <func-read>` call. The frame being received at :ref:`read() <func-read>`
+:c:func:`read()` call. The frame being received at :c:func:`read()`
 time is discarded, returning the following frame instead. Again this
 implies a reduction of the capture rate to one half or less of the
 nominal frame rate. An example of this model is the video read mode of
-the bttv driver, initiating a DMA to user memory when :ref:`read() <func-read>`
+the bttv driver, initiating a DMA to user memory when :c:func:`read()`
 is called and returning when the DMA finished.
 
 In the multiple buffer model drivers maintain a ring of internal
@@ -94,14 +92,13 @@ the driver with the :ref:`VIDIOC_G_PARM <VIDIOC_G_PARM>` and
 however. The discarding policy is not reported and cannot be changed.
 For minimum requirements see :ref:`devices`.
 
-
 Return Value
 ============
 
 On success, the number of bytes read is returned. It is not an error if
 this number is smaller than the number of bytes requested, or the amount
 of data required for one frame. This may happen for example because
-:ref:`read() <func-read>` was interrupted by a signal. On error, -1 is
+:c:func:`read()` was interrupted by a signal. On error, -1 is
 returned, and the ``errno`` variable is set appropriately. In this case
 the next read will start at the beginning of a new frame. Possible error
 codes are:
@@ -129,5 +126,5 @@ EIO
     communicate with a remote device (USB camera etc.).
 
 EINVAL
-    The :ref:`read() <func-read>` function is not supported by this driver, not
+    The :c:func:`read()` function is not supported by this driver, not
     on this device, or generally not on this type of device.
diff --git a/Documentation/userspace-api/media/v4l/func-select.rst b/Documentation/userspace-api/media/v4l/func-select.rst
index 6715d5efcc27..ba1879c728f0 100644
--- a/Documentation/userspace-api/media/v4l/func-select.rst
+++ b/Documentation/userspace-api/media/v4l/func-select.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _func-select:
 
@@ -11,7 +12,6 @@ Name
 
 v4l2-select - Synchronous I/O multiplexing
 
-
 Synopsis
 ========
 
@@ -21,9 +21,7 @@ Synopsis
     #include <sys/types.h>
     #include <unistd.h>
 
-
 .. c:function:: int select( int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout )
-    :name: v4l2-select
 
 Arguments
 =========
@@ -43,11 +41,10 @@ Arguments
 ``timeout``
   Maximum time to wait.
 
-
 Description
 ===========
 
-With the :ref:`select() <func-select>` function applications can suspend
+With the :c:func:`select()` function applications can suspend
 execution until the driver has captured data or is ready to accept data
 for output.
 
@@ -56,40 +53,39 @@ buffer has been filled or displayed and can be dequeued with the
 :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` ioctl. When buffers are already in
 the outgoing queue of the driver the function returns immediately.
 
-On success :ref:`select() <func-select>` returns the total number of bits set in
-:c:func:`struct fd_set`. When the function timed out it returns
+On success :c:func:`select()` returns the total number of bits set in
+``fd_set``. When the function timed out it returns
 a value of zero. On failure it returns -1 and the ``errno`` variable is
 set appropriately. When the application did not call
 :ref:`VIDIOC_QBUF` or
-:ref:`VIDIOC_STREAMON` yet the :ref:`select() <func-select>`
+:ref:`VIDIOC_STREAMON` yet the :c:func:`select()`
 function succeeds, setting the bit of the file descriptor in ``readfds``
 or ``writefds``, but subsequent :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`
 calls will fail. [#f1]_
 
-When use of the :ref:`read() <func-read>` function has been negotiated and the
-driver does not capture yet, the :ref:`select() <func-select>` function starts
-capturing. When that fails, :ref:`select() <func-select>` returns successful and
-a subsequent :ref:`read() <func-read>` call, which also attempts to start
+When use of the :c:func:`read()` function has been negotiated and the
+driver does not capture yet, the :c:func:`select()` function starts
+capturing. When that fails, :c:func:`select()` returns successful and
+a subsequent :c:func:`read()` call, which also attempts to start
 capturing, will return an appropriate error code. When the driver
 captures continuously (as opposed to, for example, still images) and
-data is already available the :ref:`select() <func-select>` function returns
+data is already available the :c:func:`select()` function returns
 immediately.
 
-When use of the :ref:`write() <func-write>` function has been negotiated the
-:ref:`select() <func-select>` function just waits until the driver is ready for a
-non-blocking :ref:`write() <func-write>` call.
+When use of the :c:func:`write()` function has been negotiated the
+:c:func:`select()` function just waits until the driver is ready for a
+non-blocking :c:func:`write()` call.
 
-All drivers implementing the :ref:`read() <func-read>` or :ref:`write() <func-write>`
-function or streaming I/O must also support the :ref:`select() <func-select>`
+All drivers implementing the :c:func:`read()` or :c:func:`write()`
+function or streaming I/O must also support the :c:func:`select()`
 function.
 
-For more details see the :ref:`select() <func-select>` manual page.
-
+For more details see the :c:func:`select()` manual page.
 
 Return Value
 ============
 
-On success, :ref:`select() <func-select>` returns the number of descriptors
+On success, :c:func:`select()` returns the number of descriptors
 contained in the three returned descriptor sets, which will be zero if
 the timeout expired. On error -1 is returned, and the ``errno`` variable
 is set appropriately; the sets and ``timeout`` are undefined. Possible
@@ -115,6 +111,6 @@ EINVAL
     ``FD_SETSIZE``.
 
 .. [#f1]
-   The Linux kernel implements :ref:`select() <func-select>` like the
-   :ref:`poll() <func-poll>` function, but :ref:`select() <func-select>` cannot
+   The Linux kernel implements :c:func:`select()` like the
+   :c:func:`poll()` function, but :c:func:`select()` cannot
    return a ``POLLERR``.
diff --git a/Documentation/userspace-api/media/v4l/func-write.rst b/Documentation/userspace-api/media/v4l/func-write.rst
index 37683611df04..49f5a0f4275f 100644
--- a/Documentation/userspace-api/media/v4l/func-write.rst
+++ b/Documentation/userspace-api/media/v4l/func-write.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _func-write:
 
@@ -11,7 +12,6 @@ Name
 
 v4l2-write - Write to a V4L2 device
 
-
 Synopsis
 ========
 
@@ -19,15 +19,13 @@ Synopsis
 
     #include <unistd.h>
 
-
 .. c:function:: ssize_t write( int fd, void *buf, size_t count )
-    :name: v4l2-write
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``buf``
      Buffer with data to be written
@@ -38,10 +36,10 @@ Arguments
 Description
 ===========
 
-:ref:`write() <func-write>` writes up to ``count`` bytes to the device
+:c:func:`write()` writes up to ``count`` bytes to the device
 referenced by the file descriptor ``fd`` from the buffer starting at
 ``buf``. When the hardware outputs are not active yet, this function
-enables them. When ``count`` is zero, :ref:`write() <func-write>` returns 0
+enables them. When ``count`` is zero, :c:func:`write()` returns 0
 without any other effect.
 
 When the application does not provide more data in time, the previous
@@ -49,7 +47,6 @@ video frame, raw VBI image, sliced VPS or WSS data is displayed again.
 Sliced Teletext or Closed Caption data is not repeated, the driver
 inserts a blank line instead.
 
-
 Return Value
 ============
 
@@ -80,5 +77,5 @@ EIO
     I/O error. This indicates some hardware problem.
 
 EINVAL
-    The :ref:`write() <func-write>` function is not supported by this driver,
+    The :c:func:`write()` function is not supported by this driver,
     not on this device, or generally not on this type of device.
diff --git a/Documentation/userspace-api/media/v4l/hist-v4l2.rst b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
index 1a4fd941f163..28a2750d5c8c 100644
--- a/Documentation/userspace-api/media/v4l/hist-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/hist-v4l2.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _hist-v4l2:
 
@@ -14,18 +15,17 @@ not just an extension but a replacement for the V4L API. However it took
 another four years and two stable kernel releases until the new API was
 finally accepted for inclusion into the kernel in its present form.
 
-
 Early Versions
 ==============
 
 1998-08-20: First version.
 
-1998-08-27: The :ref:`select() <func-select>` function was introduced.
+1998-08-27: The :c:func:`select()` function was introduced.
 
 1998-09-10: New video standard interface.
 
 1998-09-18: The ``VIDIOC_NONCAP`` ioctl was replaced by the otherwise
-meaningless ``O_TRUNC`` :ref:`open() <func-open>` flag, and the
+meaningless ``O_TRUNC`` :c:func:`open()` flag, and the
 aliases ``O_NONCAP`` and ``O_NOIO`` were defined. Applications can set
 this flag if they intend to access controls only, as opposed to capture
 applications which need exclusive access. The ``VIDEO_STD_XXX``
@@ -65,7 +65,6 @@ output devices were added.
 
 1999-01-19: The ``VIDIOC_NEXTBUF`` ioctl was removed.
 
-
 V4L2 Version 0.16 1999-01-31
 ============================
 
@@ -73,7 +72,6 @@ V4L2 Version 0.16 1999-01-31
 are gone. VIDIOC_QBUF takes a v4l2_buffer as a parameter. Added
 digital zoom (cropping) controls.
 
-
 V4L2 Version 0.18 1999-03-16
 ============================
 
@@ -81,7 +79,6 @@ Added a v4l to V4L2 ioctl compatibility layer to videodev.c. Driver
 writers, this changes how you implement your ioctl handler. See the
 Driver Writer's Guide. Added some more control id codes.
 
-
 V4L2 Version 0.19 1999-06-05
 ============================
 
@@ -107,7 +104,6 @@ malfunction of this ioctl.
 
 1999-06-05: Changed the value of V4L2_CID_WHITENESS.
 
-
 V4L2 Version 0.20 (1999-09-10)
 ==============================
 
@@ -128,14 +124,12 @@ common Linux driver API conventions.
    VIDIOC_STREAMON, VIDIOC_STREAMOFF, VIDIOC_S_FREQ,
    VIDIOC_S_INPUT, VIDIOC_S_OUTPUT, VIDIOC_S_EFFECT. For example
 
-
    .. code-block:: c
 
        err = ioctl (fd, VIDIOC_XXX, V4L2_XXX);
 
    becomes
 
-
    .. code-block:: c
 
        int a = V4L2_XXX; err = ioctl(fd, VIDIOC_XXX, &a);
@@ -202,7 +196,6 @@ common Linux driver API conventions.
    field counts captured frames, it is ignored by output devices. When a
    capture driver drops a frame, the sequence number of that frame is skipped.
 
-
 V4L2 Version 0.20 incremental changes
 =====================================
 
@@ -290,13 +283,11 @@ A number of changes were made to the raw VBI interface.
    were added. The former is an alias for the old ``V4L2_TYPE_VBI``, the
    latter was missing in the ``videodev.h`` file.
 
-
 V4L2 Version 0.20 2002-07-25
 ============================
 
 Added sliced VBI interface proposal.
 
-
 V4L2 in Linux 2.5.46, 2002-10
 =============================
 
@@ -307,7 +298,7 @@ This unnamed version was finally merged into Linux 2.5.46.
 1.  As specified in :ref:`related`, drivers must make related device
     functions available under all minor device numbers.
 
-2.  The :ref:`open() <func-open>` function requires access mode
+2.  The :c:func:`open()` function requires access mode
     ``O_RDWR`` regardless of the device type. All V4L2 drivers
     exchanging data with applications must support the ``O_NONBLOCK``
     flag. The ``O_NOIO`` flag, a V4L2 symbol which aliased the
@@ -435,7 +426,6 @@ This unnamed version was finally merged into Linux 2.5.46.
     the buffer type names changed as follows.
 
 
-
     .. flat-table::
 	:header-rows:  1
 	:stub-columns: 0
@@ -597,7 +587,6 @@ This unnamed version was finally merged into Linux 2.5.46.
     V4L2 documentation was inaccurate, this has been corrected in
     :ref:`pixfmt`.
 
-
 V4L2 2003-06-19
 ===============
 
@@ -648,7 +637,6 @@ V4L2 2003-06-19
    Kernel 2.6.39. Drivers and applications assuming a constant parameter
    need an update.
 
-
 V4L2 2003-11-05
 ===============
 
@@ -657,7 +645,6 @@ V4L2 2003-11-05
    refer to bytes in memory, in ascending address order.
 
 
-
    .. flat-table::
        :header-rows:  1
        :stub-columns: 0
@@ -678,7 +665,6 @@ V4L2 2003-11-05
 	 - R, G, B, X
 	 - B, G, R, X
 
-
    The ``V4L2_PIX_FMT_BGR24`` example was always correct.
 
    In :ref:`v4l-image-properties` the mapping of the V4L
@@ -689,7 +675,6 @@ V4L2 2003-11-05
    RGB pixel formats differently. These issues have yet to be addressed,
    for details see :ref:`pixfmt-rgb`.
 
-
 V4L2 in Linux 2.6.6, 2004-05-09
 ===============================
 
@@ -698,7 +683,6 @@ V4L2 in Linux 2.6.6, 2004-05-09
    ioctl, while the read-only version was renamed to
    ``VIDIOC_CROPCAP_OLD``. The old ioctl was removed on Kernel 2.6.39.
 
-
 V4L2 in Linux 2.6.8
 ===================
 
@@ -709,7 +693,6 @@ V4L2 in Linux 2.6.8
    the new ``V4L2_BUF_FLAG_INPUT`` flag. The ``flags`` field is no
    longer read-only.
 
-
 V4L2 spec erratum 2004-08-01
 ============================
 
@@ -727,7 +710,6 @@ V4L2 spec erratum 2004-08-01
    also missing from examples. Also on the ``VIDIOC_DQBUF`` page the ``EIO``
    error code was not documented.
 
-
 V4L2 in Linux 2.6.14
 ====================
 
@@ -735,7 +717,6 @@ V4L2 in Linux 2.6.14
    :ref:`sliced` and replaces the interface first proposed in V4L2
    specification 0.8.
 
-
 V4L2 in Linux 2.6.15
 ====================
 
@@ -755,7 +736,6 @@ V4L2 in Linux 2.6.15
    ``VIDIOC_G_MPEGCOMP`` and ``VIDIOC_S_MPEGCOMP`` ioctls where removed
    in Linux 2.6.25.)
 
-
 V4L2 spec erratum 2005-11-27
 ============================
 
@@ -765,7 +745,6 @@ cropping is supported. In the video standard selection example in
 :ref:`standard` the :ref:`VIDIOC_S_STD <VIDIOC_G_STD>` call used
 the wrong argument type.
 
-
 V4L2 spec erratum 2006-01-10
 ============================
 
@@ -778,14 +757,12 @@ V4L2 spec erratum 2006-01-10
    write-only as stated on its reference page. The ioctl changed in 2003
    as noted above.
 
-
 V4L2 spec erratum 2006-02-03
 ============================
 
 1. In struct v4l2_captureparm and struct v4l2_outputparm the ``timeperframe``
    field gives the time in seconds, not microseconds.
 
-
 V4L2 spec erratum 2006-02-04
 ============================
 
@@ -808,7 +785,6 @@ V4L2 in Linux 2.6.17
    ``V4L2_TUNER_MODE_STEREO`` for this purpose is deprecated now. See
    the :ref:`VIDIOC_G_TUNER <VIDIOC_G_TUNER>` section for details.
 
-
 V4L2 spec erratum 2006-09-23 (Draft 0.15)
 =========================================
 
@@ -837,7 +813,6 @@ V4L2 spec erratum 2006-09-23 (Draft 0.15)
    extended from 224-239 to 224-255. Accordingly device file names
    ``/dev/vbi0`` to ``/dev/vbi31`` are possible now.
 
-
 V4L2 in Linux 2.6.18
 ====================
 
@@ -852,7 +827,6 @@ V4L2 in Linux 2.6.18
    ``V4L2_CTRL_FLAG_INACTIVE`` and ``V4L2_CTRL_FLAG_SLIDER``
    (:ref:`control-flags`). See :ref:`extended-controls` for details.
 
-
 V4L2 in Linux 2.6.19
 ====================
 
@@ -874,14 +848,12 @@ V4L2 in Linux 2.6.19
 3. A new pixel format ``V4L2_PIX_FMT_RGB444`` (:ref:`pixfmt-rgb`) was
    added.
 
-
 V4L2 spec erratum 2006-10-12 (Draft 0.17)
 =========================================
 
 1. ``V4L2_PIX_FMT_HM12`` (:ref:`reserved-formats`) is a YUV 4:2:0, not
    4:2:2 format.
 
-
 V4L2 in Linux 2.6.21
 ====================
 
@@ -889,7 +861,6 @@ V4L2 in Linux 2.6.21
    General Public License version two or later, and under a 3-clause
    BSD-style license.
 
-
 V4L2 in Linux 2.6.22
 ====================
 
@@ -914,7 +885,6 @@ V4L2 in Linux 2.6.22
    This may **break compatibility** with existing applications. Drivers
    supporting the "host order RGB32" format are not known.
 
-
 V4L2 in Linux 2.6.24
 ====================
 
@@ -922,7 +892,6 @@ V4L2 in Linux 2.6.24
    ``V4L2_PIX_FMT_YUV555``, ``V4L2_PIX_FMT_YUV565`` and
    ``V4L2_PIX_FMT_YUV32`` were added.
 
-
 V4L2 in Linux 2.6.25
 ====================
 
@@ -949,7 +918,6 @@ V4L2 in Linux 2.6.25
    interface in Linux 2.6.18, where finally removed from the
    ``videodev2.h`` header file.
 
-
 V4L2 in Linux 2.6.26
 ====================
 
@@ -959,7 +927,6 @@ V4L2 in Linux 2.6.26
 2. Added user controls ``V4L2_CID_CHROMA_AGC`` and
    ``V4L2_CID_COLOR_KILLER``.
 
-
 V4L2 in Linux 2.6.27
 ====================
 
@@ -971,7 +938,6 @@ V4L2 in Linux 2.6.27
    ``V4L2_PIX_FMT_PCA561``, ``V4L2_PIX_FMT_SGBRG8``,
    ``V4L2_PIX_FMT_PAC207`` and ``V4L2_PIX_FMT_PJPG`` were added.
 
-
 V4L2 in Linux 2.6.28
 ====================
 
@@ -983,7 +949,6 @@ V4L2 in Linux 2.6.28
 3. The pixel formats ``V4L2_PIX_FMT_SGRBG10`` and
    ``V4L2_PIX_FMT_SGRBG10DPCM8`` were added.
 
-
 V4L2 in Linux 2.6.29
 ====================
 
@@ -999,7 +964,6 @@ V4L2 in Linux 2.6.29
    ``V4L2_CID_ZOOM_RELATIVE``, ``V4L2_CID_ZOOM_CONTINUOUS`` and
    ``V4L2_CID_PRIVACY``.
 
-
 V4L2 in Linux 2.6.30
 ====================
 
@@ -1007,7 +971,6 @@ V4L2 in Linux 2.6.30
 
 2. New control ``V4L2_CID_COLORFX`` was added.
 
-
 V4L2 in Linux 2.6.32
 ====================
 
@@ -1034,21 +997,18 @@ V4L2 in Linux 2.6.32
 9. Added Remote Controller chapter, describing the default Remote
    Controller mapping for media devices.
 
-
 V4L2 in Linux 2.6.33
 ====================
 
 1. Added support for Digital Video timings in order to support HDTV
    receivers and transmitters.
 
-
 V4L2 in Linux 2.6.34
 ====================
 
 1. Added ``V4L2_CID_IRIS_ABSOLUTE`` and ``V4L2_CID_IRIS_RELATIVE``
    controls to the :ref:`Camera controls class <camera-controls>`.
 
-
 V4L2 in Linux 2.6.37
 ====================
 
@@ -1057,7 +1017,6 @@ V4L2 in Linux 2.6.37
    applications found that used it. It was originally scheduled for
    removal in 2.6.35.
 
-
 V4L2 in Linux 2.6.39
 ====================
 
@@ -1067,7 +1026,6 @@ V4L2 in Linux 2.6.39
    drivers and applications. See :ref:`multi-planar API <planar-apis>`
    for details.
 
-
 V4L2 in Linux 3.1
 =================
 
@@ -1078,7 +1036,6 @@ V4L2 in Linux 3.1
 
    Added V4L2_CTRL_TYPE_BITMASK.
 
-
 V4L2 in Linux 3.2
 =================
 
@@ -1089,7 +1046,6 @@ V4L2 in Linux 3.2
    Does not affect the compatibility of current drivers and
    applications. See :ref:`selection API <selection-api>` for details.
 
-
 V4L2 in Linux 3.3
 =================
 
@@ -1099,7 +1055,6 @@ V4L2 in Linux 3.3
 2. Added the device_caps field to struct v4l2_capabilities and added
    the new V4L2_CAP_DEVICE_CAPS capability.
 
-
 V4L2 in Linux 3.4
 =================
 
@@ -1110,7 +1065,6 @@ V4L2 in Linux 3.4
    :ref:`VIDIOC_QUERY_DV_TIMINGS` and
    :ref:`VIDIOC_DV_TIMINGS_CAP`.
 
-
 V4L2 in Linux 3.5
 =================
 
@@ -1137,7 +1091,6 @@ V4L2 in Linux 3.5
    ``V4L2_CID_AUTO_FOCUS_START``, ``V4L2_CID_AUTO_FOCUS_STOP``,
    ``V4L2_CID_AUTO_FOCUS_STATUS`` and ``V4L2_CID_AUTO_FOCUS_RANGE``.
 
-
 V4L2 in Linux 3.6
 =================
 
@@ -1150,7 +1103,6 @@ V4L2 in Linux 3.6
 3. Added support for frequency band enumerations:
    :ref:`VIDIOC_ENUM_FREQ_BANDS`.
 
-
 V4L2 in Linux 3.9
 =================
 
@@ -1160,7 +1112,6 @@ V4L2 in Linux 3.9
 2. Added ``V4L2_EVENT_CTRL_CH_RANGE`` control event changes flag. See
    :ref:`ctrl-changes-flags`.
 
-
 V4L2 in Linux 3.10
 ==================
 
@@ -1172,32 +1123,27 @@ V4L2 in Linux 3.10
 2. Added new debugging ioctl
    :ref:`VIDIOC_DBG_G_CHIP_INFO`.
 
-
 V4L2 in Linux 3.11
 ==================
 
 1. Remove obsolete ``VIDIOC_DBG_G_CHIP_IDENT`` ioctl.
 
-
 V4L2 in Linux 3.14
 ==================
 
 1. In struct v4l2_rect, the type of ``width`` and
    ``height`` fields changed from _s32 to _u32.
 
-
 V4L2 in Linux 3.15
 ==================
 
 1. Added Software Defined Radio (SDR) Interface.
 
-
 V4L2 in Linux 3.16
 ==================
 
 1. Added event V4L2_EVENT_SOURCE_CHANGE.
 
-
 V4L2 in Linux 3.17
 ==================
 
@@ -1207,14 +1153,12 @@ V4L2 in Linux 3.17
 2. Added compound control types and
    :ref:`VIDIOC_QUERY_EXT_CTRL <VIDIOC_QUERYCTRL>`.
 
-
 V4L2 in Linux 3.18
 ==================
 
 1. Added ``V4L2_CID_PAN_SPEED`` and ``V4L2_CID_TILT_SPEED`` camera
    controls.
 
-
 V4L2 in Linux 3.19
 ==================
 
@@ -1232,13 +1176,11 @@ V4L2 in Linux 4.4
 
 3. Added transmitter support for Software Defined Radio (SDR) Interface.
 
-
 .. _other:
 
 Relation of V4L2 to other Linux multimedia APIs
 ===============================================
 
-
 .. _xvideo:
 
 X Video Extension
@@ -1284,7 +1226,6 @@ YUV to RGB conversion and scaling for faster video playback, and added
 an interface to MPEG-2 decoding hardware. This API is useful to display
 images captured with V4L2 devices.
 
-
 Digital Video
 -------------
 
@@ -1294,13 +1235,11 @@ homepage at `https://linuxtv.org <https://linuxtv.org>`__. The Linux
 DVB API has no connection to the V4L2 API except that drivers for hybrid
 hardware may support both.
 
-
 Audio Interfaces
 ----------------
 
 [to do - OSS/ALSA]
 
-
 .. _experimental:
 
 Experimental API Elements
@@ -1314,7 +1253,6 @@ change in the future.
 
 -  :ref:`VIDIOC_DBG_G_CHIP_INFO` ioctl.
 
-
 .. _obsolete:
 
 Obsolete API Elements
diff --git a/Documentation/userspace-api/media/v4l/io.rst b/Documentation/userspace-api/media/v4l/io.rst
index 9dc36b41dbf6..ce0cece6f35f 100644
--- a/Documentation/userspace-api/media/v4l/io.rst
+++ b/Documentation/userspace-api/media/v4l/io.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _io:
 
@@ -9,8 +10,8 @@ The V4L2 API defines several different methods to read from or write to
 a device. All drivers exchanging data with applications must support at
 least one of them.
 
-The classic I/O method using the :ref:`read() <func-read>` and
-:ref:`write() <func-write>` function is automatically selected after opening a
+The classic I/O method using the :c:func:`read()` and
+:c:func:`write()` function is automatically selected after opening a
 V4L2 device. When the driver does not support this method attempts to
 read or write will fail at any time.
 
@@ -38,7 +39,6 @@ closing and reopening the device.
 
 The following sections describe the various I/O methods in more detail.
 
-
 .. toctree::
     :maxdepth: 1
 
diff --git a/Documentation/userspace-api/media/v4l/libv4l-introduction.rst b/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
index e03280b35570..05690f2358ce 100644
--- a/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
+++ b/Documentation/userspace-api/media/v4l/libv4l-introduction.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _libv4l-introduction:
 
@@ -17,7 +18,6 @@ An example of using libv4l is provided by
 
 libv4l consists of 3 different libraries:
 
-
 libv4lconvert
 =============
 
@@ -65,7 +65,6 @@ libv4lconvert/processing. These controls are stored application wide
 libv4lconvert/processing offers the actual video processing
 functionality.
 
-
 libv4l1
 =======
 
@@ -78,7 +77,6 @@ just pass calls through.
 Since those functions are emulations of the old V4L1 API, it shouldn't
 be used for new applications.
 
-
 libv4l2
 =======
 
@@ -105,7 +103,6 @@ available in the driver. :ref:`VIDIOC_ENUM_FMT <VIDIOC_ENUM_FMT>`
 keeps enumerating the hardware supported formats, plus the emulated
 formats offered by libv4l at the end.
 
-
 .. _libv4l-ops:
 
 Libv4l device control functions
@@ -115,17 +112,17 @@ The common file operation methods are provided by libv4l.
 
 Those functions operate just like the gcc function ``dup()`` and
 V4L2 functions
-:c:func:`open() <v4l2-open>`, :c:func:`close() <v4l2-close>`,
-:c:func:`ioctl() <v4l2-ioctl>`, :c:func:`read() <v4l2-read>`,
-:c:func:`mmap() <v4l2-mmap>` and :c:func:`munmap() <v4l2-munmap>`:
+:c:func:`open()`, :c:func:`close()`,
+:c:func:`ioctl()`, :c:func:`read()`,
+:c:func:`mmap()` and :c:func:`munmap()`:
 
 .. c:function:: int v4l2_open(const char *file, int oflag, ...)
 
-   operates like the :c:func:`open() <v4l2-open>` function.
+   operates like the :c:func:`open()` function.
 
 .. c:function:: int v4l2_close(int fd)
 
-   operates like the :c:func:`close() <v4l2-close>` function.
+   operates like the :c:func:`close()` function.
 
 .. c:function:: int v4l2_dup(int fd)
 
@@ -133,19 +130,19 @@ V4L2 functions
 
 .. c:function:: int v4l2_ioctl (int fd, unsigned long int request, ...)
 
-   operates like the :c:func:`ioctl() <v4l2-ioctl>` function.
+   operates like the :c:func:`ioctl()` function.
 
 .. c:function:: int v4l2_read (int fd, void* buffer, size_t n)
 
-   operates like the :c:func:`read() <v4l2-read>` function.
+   operates like the :c:func:`read()` function.
 
 .. c:function:: void v4l2_mmap(void *start, size_t length, int prot, int flags, int fd, int64_t offset);
 
-   operates like the :c:func:`munmap() <v4l2-munmap>` function.
+   operates like the :c:func:`munmap()` function.
 
 .. c:function:: int v4l2_munmap(void *_start, size_t length);
 
-   operates like the :c:func:`munmap() <v4l2-munmap>` function.
+   operates like the :c:func:`munmap()` function.
 
 Those functions provide additional control:
 
@@ -168,14 +165,13 @@ Those functions provide additional control:
    of the given v4l control id. when the cid does not exist, could not be
    accessed for some reason, or some error occurred 0 is returned.
 
-
 v4l1compat.so wrapper library
 =============================
 
 This library intercepts calls to
-:c:func:`open() <v4l2-open>`, :c:func:`close() <v4l2-close>`,
-:c:func:`ioctl() <v4l2-ioctl>`, :c:func:`mmap() <v4l2-mmap>` and
-:c:func:`munmap() <v4l2-munmap>`
+:c:func:`open()`, :c:func:`close()`,
+:c:func:`ioctl()`, :c:func:`mmap()` and
+:c:func:`munmap()`
 operations and redirects them to the libv4l counterparts, by using
 ``LD_PRELOAD=/usr/lib/v4l1compat.so``. It also emulates V4L1 calls via V4L2
 API.
diff --git a/Documentation/userspace-api/media/v4l/mmap.rst b/Documentation/userspace-api/media/v4l/mmap.rst
index 1cce31c6de79..16b1e13b029f 100644
--- a/Documentation/userspace-api/media/v4l/mmap.rst
+++ b/Documentation/userspace-api/media/v4l/mmap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _mmap:
 
@@ -35,22 +36,22 @@ This ioctl can also be used to change the number of buffers or to free
 the allocated memory, provided none of the buffers are still mapped.
 
 Before applications can access the buffers they must map them into their
-address space with the :ref:`mmap() <func-mmap>` function. The
+address space with the :c:func:`mmap()` function. The
 location of the buffers in device memory can be determined with the
 :ref:`VIDIOC_QUERYBUF` ioctl. In the single-planar
 API case, the ``m.offset`` and ``length`` returned in a struct
 :c:type:`v4l2_buffer` are passed as sixth and second
-parameter to the :ref:`mmap() <func-mmap>` function. When using the
+parameter to the :c:func:`mmap()` function. When using the
 multi-planar API, struct :c:type:`v4l2_buffer` contains an
 array of struct :c:type:`v4l2_plane` structures, each
 containing its own ``m.offset`` and ``length``. When using the
 multi-planar API, every plane of every buffer has to be mapped
-separately, so the number of calls to :ref:`mmap() <func-mmap>` should
+separately, so the number of calls to :c:func:`mmap()` should
 be equal to number of buffers times number of planes in each buffer. The
 offset and length values must not be modified. Remember, the buffers are
 allocated in physical memory, as opposed to virtual memory, which can be
 swapped out to disk. Applications should free the buffers as soon as
-possible with the :ref:`munmap() <func-munmap>` function.
+possible with the :c:func:`munmap()` function.
 
 Example: Mapping buffers in the single-planar API
 =================================================
@@ -122,7 +123,6 @@ Example: Mapping buffers in the single-planar API
     for (i = 0; i < reqbuf.count; i++)
 	munmap(buffers[i].start, buffers[i].length);
 
-
 Example: Mapping buffers in the multi-planar API
 ================================================
 
@@ -238,10 +238,10 @@ be determined at any time using the :ref:`VIDIOC_QUERYBUF` ioctl. Two
 methods exist to suspend execution of the application until one or more
 buffers can be dequeued.  By default :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`
 blocks when no buffer is in the outgoing queue. When the ``O_NONBLOCK``
-flag was given to the :ref:`open() <func-open>` function,
+flag was given to the :c:func:`open()` function,
 :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` returns immediately with an ``EAGAIN``
-error code when no buffer is available. The :ref:`select() <func-select>`
-or :ref:`poll() <func-poll>` functions are always available.
+error code when no buffer is available. The :c:func:`select()`
+or :c:func:`poll()` functions are always available.
 
 To start and stop capturing or output applications call the
 :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` and :ref:`VIDIOC_STREAMOFF
@@ -259,15 +259,15 @@ Drivers implementing memory mapping I/O must support the
 <VIDIOC_QUERYBUF>`, :ref:`VIDIOC_QBUF <VIDIOC_QBUF>`, :ref:`VIDIOC_DQBUF
 <VIDIOC_QBUF>`, :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`
 and :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` ioctls, the :ref:`mmap()
-<func-mmap>`, :ref:`munmap() <func-munmap>`, :ref:`select()
-<func-select>` and :ref:`poll() <func-poll>` function. [#f3]_
+<func-mmap>`, :c:func:`munmap()`, :ref:`select()
+<func-select>` and :c:func:`poll()` function. [#f3]_
 
 [capture example]
 
 .. [#f1]
    One could use one file descriptor and set the buffer type field
    accordingly when calling :ref:`VIDIOC_QBUF` etc.,
-   but it makes the :ref:`select() <func-select>` function ambiguous. We also
+   but it makes the :c:func:`select()` function ambiguous. We also
    like the clean approach of one file descriptor per logical stream.
    Video overlay for example is also a logical stream, although the CPU
    is not needed for continuous operation.
@@ -280,6 +280,6 @@ and :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` ioctls, the :ref:`mmap()
    scatter-gather lists and the like.
 
 .. [#f3]
-   At the driver level :ref:`select() <func-select>` and :ref:`poll() <func-poll>` are
-   the same, and :ref:`select() <func-select>` is too important to be optional.
+   At the driver level :c:func:`select()` and :c:func:`poll()` are
+   the same, and :c:func:`select()` is too important to be optional.
    The rest should be evident.
diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
index 4e8fd216a1b0..18bfb9b8137d 100644
--- a/Documentation/userspace-api/media/v4l/open.rst
+++ b/Documentation/userspace-api/media/v4l/open.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _open:
 
@@ -140,7 +141,6 @@ means applications cannot *reliably* scan for loaded or installed
 drivers. The user must enter a device name, or the application can try
 the conventional device names.
 
-
 .. _related:
 
 Related Devices
@@ -157,7 +157,7 @@ support all functions. However, in practice this never worked: this
 support it and if they did it was certainly never tested. In addition,
 switching a device node between different functions only works when
 using the streaming I/O API, not with the
-:ref:`read() <func-read>`/\ :ref:`write() <func-write>` API.
+:c:func:`read()`/\ :c:func:`write()` API.
 
 Today each V4L2 device node supports just one function.
 
@@ -178,7 +178,6 @@ the Media Controller. If you want to work on this please write to the
 linux-media mailing list:
 `https://linuxtv.org/lists.php <https://linuxtv.org/lists.php>`__.
 
-
 Multiple Opens
 ==============
 
@@ -192,8 +191,8 @@ device should not change the state of the device. [#f2]_
 Once an application has allocated the memory buffers needed for
 streaming data (by calling the :ref:`VIDIOC_REQBUFS`
 or :ref:`VIDIOC_CREATE_BUFS` ioctls, or
-implicitly by calling the :ref:`read() <func-read>` or
-:ref:`write() <func-write>` functions) that application (filehandle)
+implicitly by calling the :c:func:`read()` or
+:c:func:`write()` functions) that application (filehandle)
 becomes the owner of the device. It is no longer allowed to make changes
 that would affect the buffer sizes (e.g. by calling the
 :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl) and other applications are
@@ -206,7 +205,6 @@ requested type of data, and to change related properties, to this file
 descriptor. Applications can request additional access privileges using
 the priority mechanism described in :ref:`app-pri`.
 
-
 Shared Data Streams
 ===================
 
@@ -215,12 +213,11 @@ the same data stream on a device by copying buffers, time multiplexing
 or similar means. This is better handled by a proxy application in user
 space.
 
-
 Functions
 =========
 
 To open and close V4L2 devices applications use the
-:ref:`open() <func-open>` and :ref:`close() <func-close>` function,
+:c:func:`open()` and :c:func:`close()` function,
 respectively. Devices are programmed using the
 :ref:`ioctl() <func-ioctl>` function as explained in the following
 sections.
@@ -228,7 +225,7 @@ sections.
 .. [#f1]
    There are still some old and obscure drivers that have not been
    updated to allow for multiple opens. This implies that for such
-   drivers :ref:`open() <func-open>` can return an ``EBUSY`` error code
+   drivers :c:func:`open()` can return an ``EBUSY`` error code
    when the device is already in use.
 
 .. [#f2]
diff --git a/Documentation/userspace-api/media/v4l/rw.rst b/Documentation/userspace-api/media/v4l/rw.rst
index 43609a27c3ec..64b85fb2a328 100644
--- a/Documentation/userspace-api/media/v4l/rw.rst
+++ b/Documentation/userspace-api/media/v4l/rw.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _rw:
 
@@ -6,8 +7,8 @@
 Read/Write
 **********
 
-Input and output devices support the :ref:`read() <func-read>` and
-:ref:`write() <func-write>` function, respectively, when the
+Input and output devices support the :c:func:`read()` and
+:c:func:`write()` function, respectively, when the
 ``V4L2_CAP_READWRITE`` flag in the ``capabilities`` field of struct
 :c:type:`v4l2_capability` returned by the
 :ref:`VIDIOC_QUERYCAP` ioctl is set.
@@ -22,18 +23,17 @@ However this is also the simplest I/O method, requiring little or no
 setup to exchange data. It permits command line stunts like this (the
 vidctrl tool is fictitious):
 
-
 .. code-block:: none
 
     $ vidctrl /dev/video --input=0 --format=YUYV --size=352x288
     $ dd if=/dev/video of=myimage.422 bs=202752 count=1
 
-To read from the device applications use the :ref:`read() <func-read>`
-function, to write the :ref:`write() <func-write>` function. Drivers
+To read from the device applications use the :c:func:`read()`
+function, to write the :c:func:`write()` function. Drivers
 must implement one I/O method if they exchange data with applications,
 but it need not be this. [#f1]_ When reading or writing is supported, the
-driver must also support the :ref:`select() <func-select>` and
-:ref:`poll() <func-poll>` function. [#f2]_
+driver must also support the :c:func:`select()` and
+:c:func:`poll()` function. [#f2]_
 
 .. [#f1]
    It would be desirable if applications could depend on drivers
@@ -43,5 +43,5 @@ driver must also support the :ref:`select() <func-select>` and
    capturing still images.
 
 .. [#f2]
-   At the driver level :ref:`select() <func-select>` and :ref:`poll() <func-poll>` are
-   the same, and :ref:`select() <func-select>` is too important to be optional.
+   At the driver level :c:func:`select()` and :c:func:`poll()` are
+   the same, and :c:func:`select()` is too important to be optional.
diff --git a/Documentation/userspace-api/media/v4l/streaming-par.rst b/Documentation/userspace-api/media/v4l/streaming-par.rst
index cc2e8fcecc7e..806cbfdad0f1 100644
--- a/Documentation/userspace-api/media/v4l/streaming-par.rst
+++ b/Documentation/userspace-api/media/v4l/streaming-par.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _streaming-par:
 
@@ -14,13 +15,13 @@ The current video standard determines a nominal number of frames per
 second. If less than this number of frames is to be captured or output,
 applications can request frame skipping or duplicating on the driver
 side. This is especially useful when using the
-:ref:`read() <func-read>` or :ref:`write() <func-write>`, which are
+:c:func:`read()` or :c:func:`write()`, which are
 not augmented by timestamps or sequence counters, and to avoid
 unnecessary data copying.
 
 Finally these ioctls can be used to determine the number of buffers used
 internally by a driver in read/write mode. For implications see the
-section discussing the :ref:`read() <func-read>` function.
+section discussing the :c:func:`read()` function.
 
 To get and set the streaming parameters applications call the
 :ref:`VIDIOC_G_PARM <VIDIOC_G_PARM>` and
diff --git a/Documentation/userspace-api/media/v4l/userp.rst b/Documentation/userspace-api/media/v4l/userp.rst
index 5b7321907dab..db224f9b611e 100644
--- a/Documentation/userspace-api/media/v4l/userp.rst
+++ b/Documentation/userspace-api/media/v4l/userp.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _userp:
 
@@ -78,10 +79,10 @@ buffers it must wait until an empty buffer can be dequeued and reused.
 Two methods exist to suspend execution of the application until one or
 more buffers can be dequeued. By default :ref:`VIDIOC_DQBUF
 <VIDIOC_QBUF>` blocks when no buffer is in the outgoing queue. When the
-``O_NONBLOCK`` flag was given to the :ref:`open() <func-open>` function,
+``O_NONBLOCK`` flag was given to the :c:func:`open()` function,
 :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>` returns immediately with an ``EAGAIN``
 error code when no buffer is available. The :ref:`select()
-<func-select>` or :ref:`poll() <func-poll>` function are always
+<func-select>` or :c:func:`poll()` function are always
 available.
 
 To start and stop capturing or output applications call the
@@ -101,7 +102,7 @@ Drivers implementing user pointer I/O must support the
 :ref:`VIDIOC_REQBUFS <VIDIOC_REQBUFS>`, :ref:`VIDIOC_QBUF <VIDIOC_QBUF>`,
 :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`, :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`
 and :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` ioctls, the
-:ref:`select() <func-select>` and :ref:`poll() <func-poll>` function. [#f2]_
+:c:func:`select()` and :c:func:`poll()` function. [#f2]_
 
 .. [#f1]
    We expect that frequently used buffers are typically not swapped out.
@@ -116,6 +117,6 @@ and :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` ioctls, the
    because an application may share them with other processes.
 
 .. [#f2]
-   At the driver level :ref:`select() <func-select>` and :ref:`poll() <func-poll>` are
-   the same, and :ref:`select() <func-select>` is too important to be optional.
+   At the driver level :c:func:`select()` and :c:func:`poll()` are
+   the same, and :c:func:`select()` is too important to be optional.
    The rest should be evident.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index d999028f47df..b06e5b528e11 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_CREATE_BUFS:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_CREATE_BUFS - Create buffers for Memory Mapped or User Pointer or DMA Buffer I/O
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_CREATE_BUFS, struct v4l2_create_buffers *argp )
-    :name: VIDIOC_CREATE_BUFS
+.. c:macro:: VIDIOC_CREATE_BUFS
 
+``int ioctl(int fd, VIDIOC_CREATE_BUFS, struct v4l2_create_buffers *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_create_buffers`.
 
-
 Description
 ===========
 
@@ -71,7 +70,6 @@ the actual number allocated and the starting index in the ``count`` and
 the ``index`` fields respectively. On return ``count`` can be smaller
 than the number requested.
 
-
 .. c:type:: v4l2_create_buffers
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -119,7 +117,6 @@ than the number requested.
       - A place holder for future extensions. Drivers and applications
 	must set the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst b/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
index aa02c312824e..00c31410d4e4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-cropcap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_CROPCAP:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_CROPCAP - Information about the video cropping and scaling abilities
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_CROPCAP, struct v4l2_cropcap *argp )
-    :name: VIDIOC_CROPCAP
+.. c:macro:: VIDIOC_CROPCAP
 
+``int ioctl(int fd, VIDIOC_CROPCAP, struct v4l2_cropcap *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_cropcap`.
 
-
 Description
 ===========
 
@@ -95,7 +94,6 @@ overlay devices.
    Starting with kernel 4.13 both variations are allowed.
 
 
-
 .. _v4l2-rect-crop:
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -120,7 +118,6 @@ overlay devices.
       - ``height``
       - Height of the rectangle, in pixels.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst
index a2541329b30a..bde6e952b267 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-chip-info.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_DBG_G_CHIP_INFO:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_DBG_G_CHIP_INFO - Identify the chips on a TV card
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_DBG_G_CHIP_INFO, struct v4l2_dbg_chip_info *argp )
-    :name: VIDIOC_DBG_G_CHIP_INFO
+.. c:macro:: VIDIOC_DBG_G_CHIP_INFO
 
+``int ioctl(int fd, VIDIOC_DBG_G_CHIP_INFO, struct v4l2_dbg_chip_info *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_dbg_chip_info`.
 
-
 Description
 ===========
 
@@ -76,7 +75,6 @@ is available from the LinuxTV v4l-dvb repository; see
 `https://linuxtv.org/repo/ <https://linuxtv.org/repo/>`__ for access
 instructions.
 
-
 .. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{7.0cm}|
 
 .. _name-v4l2-dbg-match:
@@ -103,7 +101,6 @@ instructions.
       -
 
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_dbg_chip_info
@@ -130,7 +127,6 @@ instructions.
       - Reserved fields, both application and driver must set these to 0.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _name-chip-match-types:
@@ -148,7 +144,6 @@ instructions.
       - 4
       - Match the nth sub-device.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst
index 350a04eb0e86..e1a6abe705bd 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dbg-g-register.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_DBG_G_REGISTER:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_DBG_G_REGISTER - VIDIOC_DBG_S_REGISTER - Read or write hardware registers
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_DBG_G_REGISTER, struct v4l2_dbg_register *argp )
-    :name: VIDIOC_DBG_G_REGISTER
+.. c:macro:: VIDIOC_DBG_G_REGISTER
 
-.. c:function:: int ioctl( int fd, VIDIOC_DBG_S_REGISTER, const struct v4l2_dbg_register *argp )
-    :name: VIDIOC_DBG_S_REGISTER
+``int ioctl(int fd, VIDIOC_DBG_G_REGISTER, struct v4l2_dbg_register *argp)``
 
+.. c:macro:: VIDIOC_DBG_S_REGISTER
+
+``int ioctl(int fd, VIDIOC_DBG_S_REGISTER, const struct v4l2_dbg_register *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_dbg_register`.
 
-
 Description
 ===========
 
@@ -85,7 +85,6 @@ It is available from the LinuxTV v4l-dvb repository; see
 `https://linuxtv.org/repo/ <https://linuxtv.org/repo/>`__ for access
 instructions.
 
-
 .. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{7.0cm}|
 
 .. c:type:: v4l2_dbg_match
@@ -112,7 +111,6 @@ instructions.
       -
 
 
-
 .. c:type:: v4l2_dbg_register
 
 .. flat-table:: struct v4l2_dbg_register
@@ -133,7 +131,6 @@ instructions.
       - The value read from, or to be written into the register.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _chip-match-types:
@@ -151,7 +148,6 @@ instructions.
       - 4
       - Match the nth sub-device.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
index 0ef757f061e3..fd71ceece037 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-decoder-cmd.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_DECODER_CMD:
 
@@ -11,28 +12,26 @@ Name
 
 VIDIOC_DECODER_CMD - VIDIOC_TRY_DECODER_CMD - Execute an decoder command
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_DECODER_CMD, struct v4l2_decoder_cmd *argp )
-    :name: VIDIOC_DECODER_CMD
+.. c:macro:: VIDIOC_DECODER_CMD
 
+``int ioctl(int fd, VIDIOC_DECODER_CMD, struct v4l2_decoder_cmd *argp)``
 
-.. c:function:: int ioctl( int fd, VIDIOC_TRY_DECODER_CMD, struct v4l2_decoder_cmd *argp )
-    :name: VIDIOC_TRY_DECODER_CMD
+.. c:macro:: VIDIOC_TRY_DECODER_CMD
 
+``int ioctl(int fd, VIDIOC_TRY_DECODER_CMD, struct v4l2_decoder_cmd *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     pointer to struct :c:type:`v4l2_decoder_cmd`.
 
-
 Description
 ===========
 
@@ -47,11 +46,11 @@ this structure.
 The ``cmd`` field must contain the command code. Some commands use the
 ``flags`` field for additional information.
 
-A :ref:`write() <func-write>` or :ref:`VIDIOC_STREAMON`
+A :c:func:`write()` or :ref:`VIDIOC_STREAMON`
 call sends an implicit START command to the decoder if it has not been
 started yet. Applies to both queues of mem2mem decoders.
 
-A :ref:`close() <func-close>` or :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
+A :c:func:`close()` or :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
 call of a streaming file descriptor sends an implicit immediate STOP
 command to the decoder, and all buffered data is discarded. Applies to both
 queues of mem2mem decoders.
@@ -60,7 +59,6 @@ In principle, these ioctls are optional, not all drivers may support them. They
 introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decoders
 (as further documented in :ref:`decoder`).
 
-
 .. tabularcolumns:: |p{1.1cm}|p{2.4cm}|p{1.2cm}|p{1.6cm}|p{10.6cm}|
 
 .. c:type:: v4l2_decoder_cmd
@@ -131,7 +129,6 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
       -
 
 
-
 .. tabularcolumns:: |p{5.6cm}|p{0.6cm}|p{11.3cm}|
 
 .. _decoder-cmds:
diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index f0dfc8cf9b14..634af717c8ba 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_DQEVENT:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_DQEVENT - Dequeue event
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_DQEVENT, struct v4l2_event *argp )
-    :name: VIDIOC_DQEVENT
+.. c:macro:: VIDIOC_DQEVENT
 
+``int ioctl(int fd, VIDIOC_DQEVENT, struct v4l2_event *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_event`.
 
-
 Description
 ===========
 
@@ -38,7 +37,6 @@ structure are filled by the driver. The file handle will also receive
 exceptions which the application may get by e.g. using the select system
 call.
 
-
 .. tabularcolumns:: |p{3.0cm}|p{4.4cm}|p{2.4cm}|p{7.7cm}|
 
 .. c:type:: v4l2_event
@@ -100,7 +98,6 @@ call.
 	zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. cssclass:: longtable
@@ -191,7 +188,6 @@ call.
       - Base event number for driver-private events.
 
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_event_vsync
@@ -206,7 +202,6 @@ call.
       - The upcoming field. See enum :c:type:`v4l2_field`.
 
 
-
 .. tabularcolumns:: |p{3.5cm}|p{3.0cm}|p{1.8cm}|p{8.5cm}|
 
 .. c:type:: v4l2_event_ctrl
@@ -257,7 +252,6 @@ call.
 	:ref:`v4l2_queryctrl <v4l2-queryctrl>`.
 
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_event_frame_sync
@@ -272,7 +266,6 @@ call.
       - The sequence number of the frame being received.
 
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_event_src_change
@@ -288,7 +281,6 @@ call.
 	:ref:`src-changes-flags`.
 
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_event_motion_det
@@ -318,7 +310,6 @@ call.
 	automatically assigned to the default region 0.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _ctrl-changes-flags:
@@ -344,7 +335,6 @@ call.
 	step or the default value of the control changed.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _src-changes-flags:
@@ -375,7 +365,6 @@ call.
 	loss of signal and so restarting streaming I/O is required in order for
 	the hardware to synchronize to the video signal.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst
index 82bb732893be..27bd6a83e42c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dv-timings-cap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_DV_TIMINGS_CAP:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_DV_TIMINGS_CAP - VIDIOC_SUBDEV_DV_TIMINGS_CAP - The capabilities of the Digital Video receiver/transmitter
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_DV_TIMINGS_CAP, struct v4l2_dv_timings_cap *argp )
-    :name: VIDIOC_DV_TIMINGS_CAP
+.. c:macro:: VIDIOC_DV_TIMINGS_CAP
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_DV_TIMINGS_CAP, struct v4l2_dv_timings_cap *argp )
-    :name: VIDIOC_SUBDEV_DV_TIMINGS_CAP
+``int ioctl(int fd, VIDIOC_DV_TIMINGS_CAP, struct v4l2_dv_timings_cap *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_DV_TIMINGS_CAP
+
+``int ioctl(int fd, VIDIOC_SUBDEV_DV_TIMINGS_CAP, struct v4l2_dv_timings_cap *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_dv_timings_cap`.
 
-
 Description
 ===========
 
@@ -55,7 +55,6 @@ the desired pad number in the struct
 zero the ``reserved`` array. Attempts to query capabilities on a pad
 that doesn't support them will return an ``EINVAL`` error code.
 
-
 .. tabularcolumns:: |p{1.2cm}|p{3.0cm}|p{13.3cm}|
 
 .. c:type:: v4l2_bt_timings_cap
@@ -97,7 +96,6 @@ that doesn't support them will return an ``EINVAL`` error code.
 	Drivers must set the array to zero.
 
 
-
 .. tabularcolumns:: |p{1.0cm}|p{4.0cm}|p{3.5cm}|p{9.2cm}|
 
 .. c:type:: v4l2_dv_timings_cap
@@ -153,7 +151,6 @@ that doesn't support them will return an ``EINVAL`` error code.
       - Can support non-standard timings, i.e. timings not belonging to
 	the standards set in the ``standards`` field.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst b/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst
index 44aad55d9459..5673606711b4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-encoder-cmd.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENCODER_CMD:
 
@@ -11,22 +12,22 @@ Name
 
 VIDIOC_ENCODER_CMD - VIDIOC_TRY_ENCODER_CMD - Execute an encoder command
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENCODER_CMD, struct v4l2_encoder_cmd *argp )
-    :name: VIDIOC_ENCODER_CMD
+.. c:macro:: VIDIOC_ENCODER_CMD
 
-.. c:function:: int ioctl( int fd, VIDIOC_TRY_ENCODER_CMD, struct v4l2_encoder_cmd *argp )
-    :name: VIDIOC_TRY_ENCODER_CMD
+``int ioctl(int fd, VIDIOC_ENCODER_CMD, struct v4l2_encoder_cmd *argp)``
 
+.. c:macro:: VIDIOC_TRY_ENCODER_CMD
+
+``int ioctl(int fd, VIDIOC_TRY_ENCODER_CMD, struct v4l2_encoder_cmd *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_encoder_cmd`.
@@ -47,16 +48,16 @@ this structure.
 The ``cmd`` field must contain the command code. Some commands use the
 ``flags`` field for additional information.
 
-After a STOP command, :ref:`read() <func-read>` calls will read
+After a STOP command, :c:func:`read()` calls will read
 the remaining data buffered by the driver. When the buffer is empty,
-:ref:`read() <func-read>` will return zero and the next :ref:`read() <func-read>`
+:c:func:`read()` will return zero and the next :c:func:`read()`
 call will restart the encoder.
 
-A :ref:`read() <func-read>` or :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`
+A :c:func:`read()` or :ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>`
 call sends an implicit START command to the encoder if it has not been
 started yet. Applies to both queues of mem2mem encoders.
 
-A :ref:`close() <func-close>` or :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
+A :c:func:`close()` or :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`
 call of a streaming file descriptor sends an implicit immediate STOP to
 the encoder, and all buffered data is discarded. Applies to both queues of
 mem2mem encoders.
@@ -65,7 +66,6 @@ These ioctls are optional, not all drivers may support them. They were
 introduced in Linux 2.6.21. They are, however, mandatory for stateful mem2mem
 encoders (as further documented in :ref:`encoder`).
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_encoder_cmd
@@ -89,7 +89,6 @@ encoders (as further documented in :ref:`encoder`).
 	the array to zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _encoder-cmds:
@@ -134,7 +133,6 @@ encoders (as further documented in :ref:`encoder`).
 	the encoder is already running, this command does nothing. No
 	flags are defined for this command.
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _encoder-flags:
@@ -151,7 +149,6 @@ encoders (as further documented in :ref:`encoder`).
 
         Does not apply to :ref:`encoder`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst
index bb74096cfbd8..20730cd4f6ef 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-dv-timings.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUM_DV_TIMINGS:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_ENUM_DV_TIMINGS - VIDIOC_SUBDEV_ENUM_DV_TIMINGS - Enumerate supported Digital Video timings
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUM_DV_TIMINGS, struct v4l2_enum_dv_timings *argp )
-    :name: VIDIOC_ENUM_DV_TIMINGS
+.. c:macro:: VIDIOC_ENUM_DV_TIMINGS
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_ENUM_DV_TIMINGS, struct v4l2_enum_dv_timings *argp )
-    :name: VIDIOC_SUBDEV_ENUM_DV_TIMINGS
+``int ioctl(int fd, VIDIOC_ENUM_DV_TIMINGS, struct v4l2_enum_dv_timings *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_ENUM_DV_TIMINGS
+
+``int ioctl(int fd, VIDIOC_SUBDEV_ENUM_DV_TIMINGS, struct v4l2_enum_dv_timings *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_enum_dv_timings`.
 
-
 Description
 ===========
 
@@ -65,7 +65,6 @@ pad number in the struct
 Attempts to enumerate timings on a pad that doesn't support them will
 return an ``EINVAL`` error code.
 
-
 .. c:type:: v4l2_enum_dv_timings
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -91,7 +90,6 @@ return an ``EINVAL`` error code.
       - ``timings``
       - The timings.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index b8347a96a554..2b3fa9c23146 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUM_FMT:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_ENUM_FMT - Enumerate image formats
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUM_FMT, struct v4l2_fmtdesc *argp )
-    :name: VIDIOC_ENUM_FMT
+.. c:macro:: VIDIOC_ENUM_FMT
 
+``int ioctl(int fd, VIDIOC_ENUM_FMT, struct v4l2_fmtdesc *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_fmtdesc`.
 
-
 Description
 ===========
 
@@ -72,7 +71,6 @@ the ``mbus_code`` field is handled differently:
    formats shall not depend on the active configuration of the video device
    or device pipeline.
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_fmtdesc
@@ -137,7 +135,6 @@ the ``mbus_code`` field is handled differently:
 	zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _fmtdesc-flags:
@@ -227,7 +224,6 @@ the ``mbus_code`` field is handled differently:
 	device when calling the :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl with
 	:ref:`V4L2_PIX_FMT_FLAG_SET_CSC <v4l2-pix-fmt-flag-set-csc>` set.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst
index 68469756e6c7..1f0949726045 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-frameintervals.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUM_FRAMEINTERVALS:
 
@@ -11,25 +12,23 @@ Name
 
 VIDIOC_ENUM_FRAMEINTERVALS - Enumerate frame intervals
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUM_FRAMEINTERVALS, struct v4l2_frmivalenum *argp )
-    :name: VIDIOC_ENUM_FRAMEINTERVALS
+.. c:macro:: VIDIOC_ENUM_FRAMEINTERVALS
 
+``int ioctl(int fd, VIDIOC_ENUM_FRAMEINTERVALS, struct v4l2_frmivalenum *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_frmivalenum`
     that contains a pixel format and size and receives a frame interval.
 
-
 Description
 ===========
 
@@ -91,7 +90,6 @@ other ioctl calls while it runs the frame interval enumeration.
 
        frame_rate = 1 / frame_interval
 
-
 Structs
 =======
 
@@ -99,7 +97,6 @@ In the structs below, *IN* denotes a value that has to be filled in by
 the application, *OUT* denotes values that the driver fills in. The
 application should zero out all members except for the *IN* fields.
 
-
 .. c:type:: v4l2_frmival_stepwise
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -120,7 +117,6 @@ application should zero out all members except for the *IN* fields.
       - Frame interval step size [s].
 
 
-
 .. c:type:: v4l2_frmivalenum
 
 .. tabularcolumns:: |p{1.8cm}|p{4.4cm}|p{2.4cm}|p{8.9cm}|
@@ -163,11 +159,9 @@ application should zero out all members except for the *IN* fields.
 	applications.
 
 
-
 Enums
 =====
 
-
 .. c:type:: v4l2_frmivaltypes
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
@@ -187,7 +181,6 @@ Enums
       - 3
       - Step-wise defined frame interval.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst
index dc4e0e216e7e..c9a36bcf699f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-framesizes.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUM_FRAMESIZES:
 
@@ -11,26 +12,24 @@ Name
 
 VIDIOC_ENUM_FRAMESIZES - Enumerate frame sizes
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUM_FRAMESIZES, struct v4l2_frmsizeenum *argp )
-    :name: VIDIOC_ENUM_FRAMESIZES
+.. c:macro:: VIDIOC_ENUM_FRAMESIZES
 
+``int ioctl(int fd, VIDIOC_ENUM_FRAMESIZES, struct v4l2_frmsizeenum *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_frmsizeenum`
     that contains an index and pixel format and receives a frame width
     and height.
 
-
 Description
 ===========
 
@@ -81,7 +80,6 @@ without any interaction from the application itself. This means that the
 enumeration data is consistent if the application does not perform any
 other ioctl calls while it runs the frame size enumeration.
 
-
 Structs
 =======
 
@@ -89,7 +87,6 @@ In the structs below, *IN* denotes a value that has to be filled in by
 the application, *OUT* denotes values that the driver fills in. The
 application should zero out all members except for the *IN* fields.
 
-
 .. c:type:: v4l2_frmsize_discrete
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -107,7 +104,6 @@ application should zero out all members except for the *IN* fields.
       - Height of the frame [pixel].
 
 
-
 .. c:type:: v4l2_frmsize_stepwise
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -137,7 +133,6 @@ application should zero out all members except for the *IN* fields.
       - Frame height step size [pixel].
 
 
-
 .. c:type:: v4l2_frmsizeenum
 
 .. tabularcolumns:: |p{1.4cm}|p{5.9cm}|p{2.3cm}|p{8.0cm}|
@@ -173,11 +168,9 @@ application should zero out all members except for the *IN* fields.
 	applications.
 
 
-
 Enums
 =====
 
-
 .. c:type:: v4l2_frmsizetypes
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
@@ -197,7 +190,6 @@ Enums
       - 3
       - Step-wise defined frame size.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst
index 2dabf542b20f..a0764fca8d18 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-freq-bands.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUM_FREQ_BANDS:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_ENUM_FREQ_BANDS - Enumerate supported frequency bands
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUM_FREQ_BANDS, struct v4l2_frequency_band *argp )
-    :name: VIDIOC_ENUM_FREQ_BANDS
+.. c:macro:: VIDIOC_ENUM_FREQ_BANDS
 
+``int ioctl(int fd, VIDIOC_ENUM_FREQ_BANDS, struct v4l2_frequency_band *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_frequency_band`.
 
-
 Description
 ===========
 
@@ -41,7 +40,6 @@ fields, and zero out the ``reserved`` array of a struct
 This ioctl is supported if the ``V4L2_TUNER_CAP_FREQ_BANDS`` capability
 of the corresponding tuner/modulator is set.
 
-
 .. tabularcolumns:: |p{2.9cm}|p{2.9cm}|p{5.8cm}|p{2.9cm}|p{3.0cm}|
 
 .. c:type:: v4l2_frequency_band
@@ -110,7 +108,6 @@ of the corresponding tuner/modulator is set.
 	Applications and drivers must set the array to zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _band-modulation:
@@ -130,7 +127,6 @@ of the corresponding tuner/modulator is set.
       - 0x08
       - Amplitude Modulation, commonly used for analog radio.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enumaudio.rst b/Documentation/userspace-api/media/v4l/vidioc-enumaudio.rst
index 6cf06ac0bb70..7873e5434d3e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enumaudio.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumaudio.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUMAUDIO:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_ENUMAUDIO - Enumerate audio inputs
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUMAUDIO, struct v4l2_audio *argp )
-    :name: VIDIOC_ENUMAUDIO
+.. c:macro:: VIDIOC_ENUMAUDIO
 
+``int ioctl(int fd, VIDIOC_ENUMAUDIO, struct v4l2_audio *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_audio`.
 
-
 Description
 ===========
 
@@ -43,7 +42,6 @@ zero, incrementing by one until the driver returns ``EINVAL``.
 See :ref:`VIDIOC_G_AUDIO <VIDIOC_G_AUDIO>` for a description of struct
 :c:type:`v4l2_audio`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enumaudioout.rst b/Documentation/userspace-api/media/v4l/vidioc-enumaudioout.rst
index b4a42ea397db..d4c3ba320834 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enumaudioout.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumaudioout.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUMAUDOUT:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_ENUMAUDOUT - Enumerate audio outputs
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUMAUDOUT, struct v4l2_audioout *argp )
-    :name: VIDIOC_ENUMAUDOUT
+.. c:macro:: VIDIOC_ENUMAUDOUT
 
+``int ioctl(int fd, VIDIOC_ENUMAUDOUT, struct v4l2_audioout *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_audioout`.
 
-
 Description
 ===========
 
@@ -48,7 +47,6 @@ zero, incrementing by one until the driver returns ``EINVAL``.
 See :ref:`VIDIOC_G_AUDIOout <VIDIOC_G_AUDOUT>` for a description of struct
 :c:type:`v4l2_audioout`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst b/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst
index 714688f81e23..0f62e681a827 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enuminput.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUMINPUT:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_ENUMINPUT - Enumerate video inputs
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUMINPUT, struct v4l2_input *argp )
-    :name: VIDIOC_ENUMINPUT
+.. c:macro:: VIDIOC_ENUMINPUT
 
+``int ioctl(int fd, VIDIOC_ENUMINPUT, struct v4l2_input *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_input`.
 
-
 Description
 ===========
 
@@ -39,7 +38,6 @@ fill the rest of the structure or return an ``EINVAL`` error code when the
 index is out of bounds. To enumerate all inputs applications shall begin
 at index zero, incrementing by one until the driver returns ``EINVAL``.
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_input
@@ -103,7 +101,6 @@ at index zero, incrementing by one until the driver returns ``EINVAL``.
 	zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _input-type:
@@ -126,7 +123,6 @@ at index zero, incrementing by one until the driver returns ``EINVAL``.
       - This input is a touch device for capturing raw touch data.
 
 
-
 .. tabularcolumns:: |p{4.8cm}|p{2.6cm}|p{10.1cm}|
 
 .. _input-status:
@@ -198,7 +194,6 @@ at index zero, incrementing by one until the driver returns ``EINVAL``.
       - VTR time constant. [?]
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _input-capabilities:
@@ -222,7 +217,6 @@ at index zero, incrementing by one until the driver returns ``EINVAL``.
 	``V4L2_SEL_TGT_NATIVE_SIZE`` selection target, see
 	:ref:`v4l2-selections-common`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst b/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst
index 272a0b2b475c..91fcf99094d2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumoutput.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUMOUTPUT:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_ENUMOUTPUT - Enumerate video outputs
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUMOUTPUT, struct v4l2_output *argp )
-    :name: VIDIOC_ENUMOUTPUT
+.. c:macro:: VIDIOC_ENUMOUTPUT
 
+``int ioctl(int fd, VIDIOC_ENUMOUTPUT, struct v4l2_output *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_output`.
 
-
 Description
 ===========
 
@@ -40,7 +39,6 @@ when the index is out of bounds. To enumerate all outputs applications
 shall begin at index zero, incrementing by one until the driver returns
 ``EINVAL``.
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_output
@@ -98,7 +96,6 @@ shall begin at index zero, incrementing by one until the driver returns
 	zero.
 
 
-
 .. tabularcolumns:: |p{7.0cm}|p{1.8cm}|p{8.7cm}|
 
 .. _output-type:
@@ -121,7 +118,6 @@ shall begin at index zero, incrementing by one until the driver returns
       - The video output will be copied to a :ref:`video overlay <overlay>`.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _output-capabilities:
@@ -145,7 +141,6 @@ shall begin at index zero, incrementing by one until the driver returns
 	``V4L2_SEL_TGT_NATIVE_SIZE`` selection target, see
 	:ref:`v4l2-selections-common`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst b/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst
index 85bc6d0231f1..b5704e8cf909 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enumstd.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_ENUMSTD:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_ENUMSTD - VIDIOC_SUBDEV_ENUMSTD - Enumerate supported video standards
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_ENUMSTD, struct v4l2_standard *argp )
-    :name: VIDIOC_ENUMSTD
+.. c:macro:: VIDIOC_ENUMSTD
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_ENUMSTD, struct v4l2_standard *argp )
-    :name: VIDIOC_SUBDEV_ENUMSTD
+``int ioctl(int fd, VIDIOC_ENUMSTD, struct v4l2_standard *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_ENUMSTD
+
+``int ioctl(int fd, VIDIOC_SUBDEV_ENUMSTD, struct v4l2_standard *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_standard`.
 
-
 Description
 ===========
 
@@ -45,7 +45,6 @@ zero, incrementing by one until the driver returns ``EINVAL``. Drivers may
 enumerate a different set of standards after switching the video input
 or output. [#f1]_
 
-
 .. c:type:: v4l2_standard
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -85,7 +84,6 @@ or output. [#f1]_
 	zero.
 
 
-
 .. c:type:: v4l2_fract
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -102,7 +100,6 @@ or output. [#f1]_
       - ``denominator``
       -
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. _v4l2-std-id:
@@ -120,7 +117,6 @@ or output. [#f1]_
 	standards.
 
 
-
 .. code-block:: c
 
     #define V4L2_STD_PAL_B          ((v4l2_std_id)0x00000001)
@@ -142,7 +138,6 @@ rate, and PAL color modulation with a 4.43 MHz color subcarrier. Some
 PAL video recorders can play back NTSC tapes in this mode for display on
 a 50/60 Hz agnostic PAL TV.
 
-
 .. code-block:: c
 
     #define V4L2_STD_NTSC_M         ((v4l2_std_id)0x00001000)
@@ -152,7 +147,6 @@ a 50/60 Hz agnostic PAL TV.
 ``V4L2_STD_NTSC_443`` is a hybrid standard with 525 lines, 60 Hz refresh
 rate, and NTSC color modulation with a 4.43 MHz color subcarrier.
 
-
 .. code-block:: c
 
     #define V4L2_STD_NTSC_M_KR      ((v4l2_std_id)0x00008000)
@@ -175,7 +169,6 @@ terrestrial digital TV standards. Presently the V4L2 API does not
 support digital TV. See also the Linux DVB API at
 `https://linuxtv.org <https://linuxtv.org>`__.
 
-
 .. code-block:: c
 
     #define V4L2_STD_PAL_BG         (V4L2_STD_PAL_B         |
@@ -228,7 +221,6 @@ support digital TV. See also the Linux DVB API at
     #define V4L2_STD_ALL            (V4L2_STD_525_60        |
 		     V4L2_STD_625_50)
 
-
 .. raw:: latex
 
     \begingroup
@@ -303,7 +295,6 @@ support digital TV. See also the Linux DVB API at
     \endgroup
 
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst
index a2c475a83a58..212377c90442 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-expbuf.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_EXPBUF:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_EXPBUF - Export a buffer as a DMABUF file descriptor.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_EXPBUF, struct v4l2_exportbuffer *argp )
-    :name: VIDIOC_EXPBUF
+.. c:macro:: VIDIOC_EXPBUF
 
+``int ioctl(int fd, VIDIOC_EXPBUF, struct v4l2_exportbuffer *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_exportbuffer`.
 
-
 Description
 ===========
 
@@ -63,11 +62,9 @@ for details about importing DMABUF files into V4L2 nodes. It is
 recommended to close a DMABUF file when it is no longer used to allow
 the associated memory to be reclaimed.
 
-
 Examples
 ========
 
-
 .. code-block:: c
 
     int buffer_export(int v4lfd, enum v4l2_buf_type bt, int index, int *dmafd)
@@ -87,7 +84,6 @@ Examples
 	return 0;
     }
 
-
 .. code-block:: c
 
     int buffer_export_mp(int v4lfd, enum v4l2_buf_type bt, int index,
@@ -114,7 +110,6 @@ Examples
 	return 0;
     }
 
-
 .. c:type:: v4l2_exportbuffer
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -155,7 +150,6 @@ Examples
       - Reserved field for future use. Drivers and applications must set
 	the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst b/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst
index 38667864355a..4c93bd55bd97 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-audio.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_AUDIO:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_AUDIO - VIDIOC_S_AUDIO - Query or select the current audio input and its attributes
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_AUDIO, struct v4l2_audio *argp )
-    :name: VIDIOC_G_AUDIO
+.. c:macro:: VIDIOC_G_AUDIO
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_AUDIO, const struct v4l2_audio *argp )
-    :name: VIDIOC_S_AUDIO
+``int ioctl(int fd, VIDIOC_G_AUDIO, struct v4l2_audio *argp)``
 
+.. c:macro:: VIDIOC_S_AUDIO
+
+``int ioctl(int fd, VIDIOC_S_AUDIO, const struct v4l2_audio *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_audio`.
 
-
 Description
 ===========
 
@@ -49,7 +49,6 @@ ioctl. Drivers may switch to a different audio mode if the request
 cannot be satisfied. However, this is a write-only ioctl, it does not
 return the actual new audio mode.
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_audio
@@ -80,7 +79,6 @@ return the actual new audio mode.
 	the array to zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _audio-capability:
@@ -101,7 +99,6 @@ return the actual new audio mode.
       - Automatic Volume Level mode is supported.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _audio-mode:
@@ -115,7 +112,6 @@ return the actual new audio mode.
       - 0x00001
       - AVL mode is on.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst b/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst
index 5bf56723c7ba..194f22493517 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-audioout.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_AUDOUT:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_AUDOUT - VIDIOC_S_AUDOUT - Query or select the current audio output
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_AUDOUT, struct v4l2_audioout *argp )
-    :name: VIDIOC_G_AUDOUT
+.. c:macro:: VIDIOC_G_AUDOUT
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_AUDOUT, const struct v4l2_audioout *argp )
-    :name: VIDIOC_S_AUDOUT
+``int ioctl(int fd, VIDIOC_G_AUDOUT, struct v4l2_audioout *argp)``
 
+.. c:macro:: VIDIOC_S_AUDOUT
+
+``int ioctl(int fd, VIDIOC_S_AUDOUT, const struct v4l2_audioout *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_audioout`.
 
-
 Description
 ===========
 
@@ -56,7 +56,6 @@ as ``VIDIOC_G_AUDOUT`` does.
    Connectors on a TV card to loop back the received audio signal
    to a sound card are not audio outputs in this sense.
 
-
 .. c:type:: v4l2_audioout
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -87,7 +86,6 @@ as ``VIDIOC_G_AUDOUT`` does.
       - Reserved for future extensions. Drivers and applications must set
 	the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst
index 735a6bf5e025..0ac1509e41cc 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-crop.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_CROP:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_CROP - VIDIOC_S_CROP - Get or set the current cropping rectangle
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_CROP, struct v4l2_crop *argp )
-    :name: VIDIOC_G_CROP
+.. c:macro:: VIDIOC_G_CROP
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_CROP, const struct v4l2_crop *argp )
-    :name: VIDIOC_S_CROP
+``int ioctl(int fd, VIDIOC_G_CROP, struct v4l2_crop *argp)``
 
+.. c:macro:: VIDIOC_S_CROP
+
+``int ioctl(int fd, VIDIOC_S_CROP, const struct v4l2_crop *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_crop`.
 
-
 Description
 ===========
 
@@ -69,7 +69,6 @@ been negotiated.
 When cropping is not supported then no parameters are changed and
 :ref:`VIDIOC_S_CROP <VIDIOC_G_CROP>` returns the ``EINVAL`` error code.
 
-
 .. c:type:: v4l2_crop
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -100,7 +99,6 @@ When cropping is not supported then no parameters are changed and
 
    Starting with kernel 4.13 both variations are allowed.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
index d863c849be95..4f1bed53fad5 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_CTRL:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_CTRL - VIDIOC_S_CTRL - Get or set the value of a control
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_CTRL, struct v4l2_control *argp )
-    :name: VIDIOC_G_CTRL
+.. c:macro:: VIDIOC_G_CTRL
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_CTRL, struct v4l2_control *argp )
-    :name: VIDIOC_S_CTRL
+``int ioctl(int fd, VIDIOC_G_CTRL, struct v4l2_control *argp)``
 
+.. c:macro:: VIDIOC_S_CTRL
+
+``int ioctl(int fd, VIDIOC_S_CTRL, struct v4l2_control *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_control`.
 
-
 Description
 ===========
 
@@ -55,7 +55,6 @@ These ioctls work only with user controls. For other control classes the
 :ref:`VIDIOC_S_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` or
 :ref:`VIDIOC_TRY_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` must be used.
 
-
 .. c:type:: v4l2_control
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -72,7 +71,6 @@ These ioctls work only with user controls. For other control classes the
       - ``value``
       - New value or current value.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
index e5a58db574d4..760a33d43b7d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-dv-timings.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_DV_TIMINGS:
 
@@ -11,33 +12,34 @@ Name
 
 VIDIOC_G_DV_TIMINGS - VIDIOC_S_DV_TIMINGS - VIDIOC_SUBDEV_G_DV_TIMINGS - VIDIOC_SUBDEV_S_DV_TIMINGS - Get or set DV timings for input or output
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_DV_TIMINGS, struct v4l2_dv_timings *argp )
-    :name: VIDIOC_G_DV_TIMINGS
+.. c:macro:: VIDIOC_G_DV_TIMINGS
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_DV_TIMINGS, struct v4l2_dv_timings *argp )
-    :name: VIDIOC_S_DV_TIMINGS
+``int ioctl(int fd, VIDIOC_G_DV_TIMINGS, struct v4l2_dv_timings *argp)``
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_DV_TIMINGS, struct v4l2_dv_timings *argp )
-    :name: VIDIOC_SUBDEV_G_DV_TIMINGS
+.. c:macro:: VIDIOC_S_DV_TIMINGS
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_DV_TIMINGS, struct v4l2_dv_timings *argp )
-    :name: VIDIOC_SUBDEV_S_DV_TIMINGS
+``int ioctl(int fd, VIDIOC_S_DV_TIMINGS, struct v4l2_dv_timings *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_G_DV_TIMINGS
+
+``int ioctl(int fd, VIDIOC_SUBDEV_G_DV_TIMINGS, struct v4l2_dv_timings *argp)``
+
+.. c:macro:: VIDIOC_SUBDEV_S_DV_TIMINGS
+
+``int ioctl(int fd, VIDIOC_SUBDEV_S_DV_TIMINGS, struct v4l2_dv_timings *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_dv_timings`.
 
-
 Description
 ===========
 
@@ -60,7 +62,6 @@ the current input or output does not support DV timings (e.g. if
 :ref:`VIDIOC_ENUMINPUT` does not set the
 ``V4L2_IN_CAP_DV_TIMINGS`` flag), then ``ENODATA`` error code is returned.
 
-
 Return Value
 ============
 
@@ -170,7 +171,6 @@ EPERM
       - Reserved for future extensions. Drivers and applications must set
 	the array to zero.
 
-
 .. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{7.0cm}|p{3.5cm}|
 
 .. c:type:: v4l2_dv_timings
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst b/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst
index 6a9ed2915cb9..39d523a449a7 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-edid.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_EDID:
 
@@ -11,34 +12,34 @@ Name
 
 VIDIOC_G_EDID - VIDIOC_S_EDID - VIDIOC_SUBDEV_G_EDID - VIDIOC_SUBDEV_S_EDID - Get or set the EDID of a video receiver/transmitter
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_EDID, struct v4l2_edid *argp )
-    :name: VIDIOC_G_EDID
+.. c:macro:: VIDIOC_G_EDID
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_EDID, struct v4l2_edid *argp )
-    :name: VIDIOC_S_EDID
+``int ioctl(int fd, VIDIOC_G_EDID, struct v4l2_edid *argp)``
 
+.. c:macro:: VIDIOC_S_EDID
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_EDID, struct v4l2_edid *argp )
-    :name: VIDIOC_SUBDEV_G_EDID
+``int ioctl(int fd, VIDIOC_S_EDID, struct v4l2_edid *argp)``
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_EDID, struct v4l2_edid *argp )
-    :name: VIDIOC_SUBDEV_S_EDID
+.. c:macro:: VIDIOC_SUBDEV_G_EDID
 
+``int ioctl(int fd, VIDIOC_SUBDEV_G_EDID, struct v4l2_edid *argp)``
+
+.. c:macro:: VIDIOC_SUBDEV_S_EDID
+
+``int ioctl(int fd, VIDIOC_SUBDEV_S_EDID, struct v4l2_edid *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
    Pointer to struct :c:type:`v4l2_edid`.
 
-
 Description
 ===========
 
@@ -97,7 +98,6 @@ this will drive the hotplug pin low and/or block the source from reading
 the EDID data in some way. In any case, the end result is the same: the
 EDID is no longer available.
 
-
 .. c:type:: v4l2_edid
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -132,7 +132,6 @@ EDID is no longer available.
       - Pointer to memory that contains the EDID. The minimum size is
 	``blocks`` * 128.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst b/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst
index 99cddf3b9888..7698e65ccccf 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-enc-index.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_ENC_INDEX:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_G_ENC_INDEX - Get meta data about a compressed video stream
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_ENC_INDEX, struct v4l2_enc_idx *argp )
-    :name: VIDIOC_G_ENC_INDEX
+.. c:macro:: VIDIOC_G_ENC_INDEX
 
+``int ioctl(int fd, VIDIOC_G_ENC_INDEX, struct v4l2_enc_idx *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_enc_idx`.
 
-
 Description
 ===========
 
@@ -55,7 +54,6 @@ will be zero.
 Currently this ioctl is only defined for MPEG-2 program streams and
 video elementary streams.
 
-
 .. tabularcolumns:: |p{3.8cm}|p{5.6cm}|p{8.1cm}|
 
 .. c:type:: v4l2_enc_idx
@@ -83,7 +81,6 @@ video elementary streams.
 	their ``offset``.
 
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_enc_idx_entry
@@ -116,7 +113,6 @@ video elementary streams.
       - Reserved for future extensions. Drivers must set the array to
 	zero.
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _enc-idx-flags:
@@ -140,7 +136,6 @@ video elementary streams.
       - *AND* the flags field with this mask to obtain the picture coding
 	type.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 0991af626591..f2173e310d67 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_EXT_CTRLS:
 
@@ -11,32 +12,30 @@ Name
 
 VIDIOC_G_EXT_CTRLS - VIDIOC_S_EXT_CTRLS - VIDIOC_TRY_EXT_CTRLS - Get or set the value of several controls, try control values
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_EXT_CTRLS, struct v4l2_ext_controls *argp )
-    :name: VIDIOC_G_EXT_CTRLS
+.. c:macro:: VIDIOC_G_EXT_CTRLS
 
+``int ioctl(int fd, VIDIOC_G_EXT_CTRLS, struct v4l2_ext_controls *argp)``
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_EXT_CTRLS, struct v4l2_ext_controls *argp )
-    :name: VIDIOC_S_EXT_CTRLS
+.. c:macro:: VIDIOC_S_EXT_CTRLS
 
+``int ioctl(int fd, VIDIOC_S_EXT_CTRLS, struct v4l2_ext_controls *argp)``
 
-.. c:function:: int ioctl( int fd, VIDIOC_TRY_EXT_CTRLS, struct v4l2_ext_controls *argp )
-    :name: VIDIOC_TRY_EXT_CTRLS
+.. c:macro:: VIDIOC_TRY_EXT_CTRLS
 
+``int ioctl(int fd, VIDIOC_TRY_EXT_CTRLS, struct v4l2_ext_controls *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_ext_controls`.
 
-
 Description
 ===========
 
@@ -119,7 +118,6 @@ correct. This prevents the situation where only some of the controls
 were set/get. Only low-level errors (e. g. a failed i2c command) can
 still cause this situation.
 
-
 .. tabularcolumns:: |p{1.2cm}|p{3.0cm}|p{1.5cm}|p{11.8cm}|
 
 .. c:type:: v4l2_ext_control
@@ -195,7 +193,6 @@ still cause this situation.
     * - }
       -
 
-
 .. tabularcolumns:: |p{4.0cm}|p{2.2cm}|p{2.1cm}|p{8.2cm}|
 
 .. c:type:: v4l2_ext_controls
@@ -309,7 +306,6 @@ still cause this situation.
 
 	Ignored if ``count`` equals zero.
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _ctrl-class:
@@ -363,7 +359,6 @@ still cause this situation.
       - The class containing RF tuner controls. These controls are
 	described in :ref:`rf-tuner-controls`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
index 7e1a0b812754..dc1f16343b22 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-fbuf.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_FBUF:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_FBUF - VIDIOC_S_FBUF - Get or set frame buffer overlay parameters
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_FBUF, struct v4l2_framebuffer *argp )
-    :name: VIDIOC_G_FBUF
+.. c:macro:: VIDIOC_G_FBUF
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_FBUF, const struct v4l2_framebuffer *argp )
-    :name: VIDIOC_S_FBUF
+``int ioctl(int fd, VIDIOC_G_FBUF, struct v4l2_framebuffer *argp)``
 
+.. c:macro:: VIDIOC_S_FBUF
+
+``int ioctl(int fd, VIDIOC_S_FBUF, const struct v4l2_framebuffer *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_framebuffer`.
 
-
 Description
 ===========
 
@@ -75,7 +75,6 @@ jeopardize the system security, its stability or even damage the
 hardware, therefore only the superuser can set the parameters for a
 destructive video overlay.
 
-
 .. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{7.0cm}|
 
 .. c:type:: v4l2_framebuffer
@@ -208,7 +207,6 @@ destructive video overlay.
       - ``priv``
       - Reserved. Drivers and applications must set this field to zero.
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _framebuffer-cap:
@@ -257,7 +255,6 @@ destructive video overlay.
 	chroma-key colors are replaced by framebuffer pixels, which is
 	exactly opposite of ``V4L2_FBUF_CAP_CHROMAKEY``
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _framebuffer-flags:
@@ -332,7 +329,6 @@ destructive video overlay.
 	other, so same ``chromakey`` field of struct
 	:c:type:`v4l2_window` is being used.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
index 7d113451bfbc..7e9f8475ea63 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_FMT:
 
@@ -11,29 +12,30 @@ Name
 
 VIDIOC_G_FMT - VIDIOC_S_FMT - VIDIOC_TRY_FMT - Get or set the data format, try a format
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_FMT, struct v4l2_format *argp )
-    :name: VIDIOC_G_FMT
+.. c:macro:: VIDIOC_G_FMT
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_FMT, struct v4l2_format *argp )
-    :name: VIDIOC_S_FMT
+``int ioctl(int fd, VIDIOC_G_FMT, struct v4l2_format *argp)``
 
-.. c:function:: int ioctl( int fd, VIDIOC_TRY_FMT, struct v4l2_format *argp )
-    :name: VIDIOC_TRY_FMT
+.. c:macro:: VIDIOC_S_FMT
+
+``int ioctl(int fd, VIDIOC_S_FMT, struct v4l2_format *argp)``
+
+.. c:macro:: VIDIOC_TRY_FMT
+
+``int ioctl(int fd, VIDIOC_TRY_FMT, struct v4l2_format *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_format`.
 
-
 Description
 ===========
 
@@ -85,7 +87,6 @@ recommended drivers are not required to implement this ioctl.
 The format as returned by :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` must be identical to what
 :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` returns for the same input or output.
 
-
 .. c:type:: v4l2_format
 
 .. tabularcolumns::  |p{1.2cm}|p{4.6cm}|p{3.0cm}|p{8.6cm}|
@@ -135,7 +136,6 @@ The format as returned by :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` must be identical
     * - }
       -
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst b/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst
index da0d5dee72ff..5445a4a442e4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-frequency.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_FREQUENCY:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_FREQUENCY - VIDIOC_S_FREQUENCY - Get or set tuner or modulator radio frequency
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_FREQUENCY, struct v4l2_frequency *argp )
-    :name: VIDIOC_G_FREQUENCY
+.. c:macro:: VIDIOC_G_FREQUENCY
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_FREQUENCY, const struct v4l2_frequency *argp )
-    :name: VIDIOC_S_FREQUENCY
+``int ioctl(int fd, VIDIOC_G_FREQUENCY, struct v4l2_frequency *argp)``
 
+.. c:macro:: VIDIOC_S_FREQUENCY
+
+``int ioctl(int fd, VIDIOC_S_FREQUENCY, const struct v4l2_frequency *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_frequency`.
 
-
 Description
 ===========
 
@@ -51,7 +51,6 @@ structure. When the requested frequency is not possible the driver
 assumes the closest possible value. However :ref:`VIDIOC_S_FREQUENCY <VIDIOC_G_FREQUENCY>` is a
 write-only ioctl, it does not return the actual new frequency.
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_frequency
@@ -89,7 +88,6 @@ write-only ioctl, it does not return the actual new frequency.
       - Reserved for future extensions. Drivers and applications must set
 	the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-input.rst b/Documentation/userspace-api/media/v4l/vidioc-g-input.rst
index f4637bc464f6..eee9ce51c797 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-input.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-input.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_INPUT:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_INPUT - VIDIOC_S_INPUT - Query or select the current video input
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_INPUT, int *argp )
-    :name: VIDIOC_G_INPUT
+.. c:macro:: VIDIOC_G_INPUT
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_INPUT, int *argp )
-    :name: VIDIOC_S_INPUT
+``int ioctl(int fd, VIDIOC_G_INPUT, int *argp)``
 
+.. c:macro:: VIDIOC_S_INPUT
+
+``int ioctl(int fd, VIDIOC_S_INPUT, int *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer an integer with input index.
 
-
 Description
 ===========
 
@@ -52,7 +52,6 @@ other parameters.
 Information about video inputs is available using the
 :ref:`VIDIOC_ENUMINPUT` ioctl.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst b/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst
index 8721adc5ad70..93ed111dfcb9 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-jpegcomp.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_JPEGCOMP:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_JPEGCOMP - VIDIOC_S_JPEGCOMP
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_JPEGCOMP, v4l2_jpegcompression *argp )
-    :name: VIDIOC_G_JPEGCOMP
+.. c:macro:: VIDIOC_G_JPEGCOMP
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_JPEGCOMP, const v4l2_jpegcompression *argp )
-    :name: VIDIOC_S_JPEGCOMP
+``int ioctl(int fd, VIDIOC_G_JPEGCOMP, v4l2_jpegcompression *argp)``
 
+.. c:macro:: VIDIOC_S_JPEGCOMP
+
+``int ioctl(int fd, VIDIOC_S_JPEGCOMP, const v4l2_jpegcompression *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_jpegcompression`.
 
-
 Description
 ===========
 
@@ -54,7 +54,6 @@ stored in the JPEG-encoded fields. These define how the JPEG field is
 encoded. If you omit them, applications assume you've used standard
 encoding. You usually do want to add them.
 
-
 .. tabularcolumns:: |p{1.2cm}|p{3.0cm}|p{13.3cm}|
 
 .. c:type:: v4l2_jpegcompression
@@ -92,7 +91,6 @@ encoding. You usually do want to add them.
 	control is exposed by a driver applications should use it instead
 	and ignore this field.
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _jpeg-markers:
@@ -118,7 +116,6 @@ encoding. You usually do want to add them.
       - (1<<7)
       - App segment, driver will always use APP0
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
index baf499d0df74..2ac2473e341b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-modulator.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_MODULATOR:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_MODULATOR - VIDIOC_S_MODULATOR - Get or set modulator attributes
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_MODULATOR, struct v4l2_modulator *argp )
-    :name: VIDIOC_G_MODULATOR
+.. c:macro:: VIDIOC_G_MODULATOR
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_MODULATOR, const struct v4l2_modulator *argp )
-    :name: VIDIOC_S_MODULATOR
+``int ioctl(int fd, VIDIOC_G_MODULATOR, struct v4l2_modulator *argp)``
 
+.. c:macro:: VIDIOC_S_MODULATOR
+
+``int ioctl(int fd, VIDIOC_S_MODULATOR, const struct v4l2_modulator *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_modulator`.
 
-
 Description
 ===========
 
@@ -60,7 +60,6 @@ context.
 To change the radio frequency the
 :ref:`VIDIOC_S_FREQUENCY <VIDIOC_G_FREQUENCY>` ioctl is available.
 
-
 .. tabularcolumns:: |p{2.9cm}|p{2.9cm}|p{5.8cm}|p{2.9cm}|p{3.0cm}|
 
 .. c:type:: v4l2_modulator
@@ -121,7 +120,6 @@ To change the radio frequency the
 	Drivers and applications must set the array to zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _modulator-txsubchans:
@@ -182,7 +180,6 @@ To change the radio frequency the
       - 0x0010
       - Enable the RDS encoder for a radio FM transmitter.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-output.rst b/Documentation/userspace-api/media/v4l/vidioc-g-output.rst
index 0afc55c67840..3138c4cc8fe3 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-output.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-output.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_OUTPUT:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_OUTPUT - VIDIOC_S_OUTPUT - Query or select the current video output
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_OUTPUT, int *argp )
-    :name: VIDIOC_G_OUTPUT
+.. c:macro:: VIDIOC_G_OUTPUT
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_OUTPUT, int *argp )
-    :name: VIDIOC_S_OUTPUT
+``int ioctl(int fd, VIDIOC_G_OUTPUT, int *argp)``
 
+.. c:macro:: VIDIOC_S_OUTPUT
+
+``int ioctl(int fd, VIDIOC_S_OUTPUT, int *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to an integer with output index.
 
-
 Description
 ===========
 
@@ -53,7 +53,6 @@ negotiating any other parameters.
 Information about video outputs is available using the
 :ref:`VIDIOC_ENUMOUTPUT` ioctl.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
index 94f3af279bba..724f7fa7bae1 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-parm.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_PARM:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_PARM - VIDIOC_S_PARM - Get or set streaming parameters
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_PARM, v4l2_streamparm *argp )
-    :name: VIDIOC_G_PARM
+.. c:macro:: VIDIOC_G_PARM
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_PARM, v4l2_streamparm *argp )
-    :name: VIDIOC_S_PARM
+``int ioctl(int fd, VIDIOC_G_PARM, v4l2_streamparm *argp)``
 
+.. c:macro:: VIDIOC_S_PARM
+
+``int ioctl(int fd, VIDIOC_S_PARM, v4l2_streamparm *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_streamparm`.
 
-
 Description
 ===========
 
@@ -48,7 +48,7 @@ format, on the other hand, may change the frame interval.
 
 Further these ioctls can be used to determine the number of buffers used
 internally by a driver in read/write mode. For implications see the
-section discussing the :ref:`read() <func-read>` function.
+section discussing the :c:func:`read()` function.
 
 To get and set the streaming parameters applications call the
 :ref:`VIDIOC_G_PARM <VIDIOC_G_PARM>` and
@@ -56,7 +56,6 @@ To get and set the streaming parameters applications call the
 pointer to a struct :c:type:`v4l2_streamparm` which contains a
 union holding separate parameters for input and output devices.
 
-
 .. tabularcolumns:: |p{3.5cm}|p{3.5cm}|p{3.5cm}|p{7.0cm}|
 
 .. c:type:: v4l2_streamparm
@@ -89,7 +88,6 @@ union holding separate parameters for input and output devices.
       -
 
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_captureparm
@@ -138,7 +136,7 @@ union holding separate parameters for input and output devices.
     * - __u32
       - ``readbuffers``
       - Applications set this field to the desired number of buffers used
-	internally by the driver in :ref:`read() <func-read>` mode.
+	internally by the driver in :c:func:`read()` mode.
 	Drivers return the actual number of buffers. When an application
 	requests zero buffers, drivers should just return the current
 	setting rather than the minimum or an error code. For details see
@@ -149,7 +147,6 @@ union holding separate parameters for input and output devices.
 	the array to zero.
 
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_outputparm
@@ -172,7 +169,7 @@ union holding separate parameters for input and output devices.
     * - :cspan:`2`
 
 	The field is intended to repeat frames on the driver side in
-	:ref:`write() <func-write>` mode (in streaming mode timestamps
+	:c:func:`write()` mode (in streaming mode timestamps
 	can be used to throttle the output), saving I/O bandwidth.
 
 	For stateful encoders (see :ref:`encoder`) this represents the
@@ -199,7 +196,7 @@ union holding separate parameters for input and output devices.
     * - __u32
       - ``writebuffers``
       - Applications set this field to the desired number of buffers used
-	internally by the driver in :ref:`write() <func-write>` mode. Drivers
+	internally by the driver in :c:func:`write()` mode. Drivers
 	return the actual number of buffers. When an application requests
 	zero buffers, drivers should just return the current setting
 	rather than the minimum or an error code. For details see
@@ -210,7 +207,6 @@ union holding separate parameters for input and output devices.
 	the array to zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _parm-caps:
@@ -226,7 +222,6 @@ union holding separate parameters for input and output devices.
 	field.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _parm-flags:
@@ -265,8 +260,7 @@ union holding separate parameters for input and output devices.
 
 	-  Moving objects in the image might have excessive motion blur.
 
-	-  Capture might only work through the :ref:`read() <func-read>` call.
-
+	-  Capture might only work through the :c:func:`read()` call.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst b/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst
index da3166ac6d08..d72a0c716fca 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-priority.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_PRIORITY:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_PRIORITY - VIDIOC_S_PRIORITY - Query or request the access priority associated with a file descriptor
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_PRIORITY, enum v4l2_priority *argp )
-    :name: VIDIOC_G_PRIORITY
+.. c:macro:: VIDIOC_G_PRIORITY
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_PRIORITY, const enum v4l2_priority *argp )
-    :name: VIDIOC_S_PRIORITY
+``int ioctl(int fd, VIDIOC_G_PRIORITY, enum v4l2_priority *argp)``
 
+.. c:macro:: VIDIOC_S_PRIORITY
+
+``int ioctl(int fd, VIDIOC_S_PRIORITY, const enum v4l2_priority *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to an enum :c:type:`v4l2_priority` type.
 
-
 Description
 ===========
 
@@ -43,7 +43,6 @@ To request an access priority applications store the desired priority in
 an enum v4l2_priority variable and call :ref:`VIDIOC_S_PRIORITY <VIDIOC_G_PRIORITY>` ioctl
 with a pointer to this variable.
 
-
 .. c:type:: v4l2_priority
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
@@ -78,7 +77,6 @@ with a pointer to this variable.
 	it blocks any other fd from changing device properties. Usually
 	applications which must not be interrupted, like video recording.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst
index cda7a69ea130..9a9e589cce77 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_SELECTION:
 
@@ -11,23 +12,22 @@ Name
 
 VIDIOC_G_SELECTION - VIDIOC_S_SELECTION - Get or set one of the selection rectangles
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_SELECTION, struct v4l2_selection *argp )
-    :name: VIDIOC_G_SELECTION
+.. c:macro:: VIDIOC_G_SELECTION
 
+``int ioctl(int fd, VIDIOC_G_SELECTION, struct v4l2_selection *argp)``
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_SELECTION, struct v4l2_selection *argp )
-    :name: VIDIOC_S_SELECTION
+.. c:macro:: VIDIOC_S_SELECTION
 
+``int ioctl(int fd, VIDIOC_S_SELECTION, struct v4l2_selection *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_selection`.
@@ -115,7 +115,6 @@ constraints.
 Selection targets and flags are documented in
 :ref:`v4l2-selections-common`.
 
-
 .. _sel-const-adjust:
 
 .. kernel-figure::  constraints.svg
@@ -128,7 +127,6 @@ Selection targets and flags are documented in
 
 
 
-
 .. c:type:: v4l2_selection
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -168,7 +166,6 @@ Selection targets and flags are documented in
 
    Starting with kernel 4.13 both variations are allowed.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
index a3a7fb00350f..752f7f5fae73 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-sliced-vbi-cap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_SLICED_VBI_CAP:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_G_SLICED_VBI_CAP - Query sliced VBI capabilities
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_SLICED_VBI_CAP, struct v4l2_sliced_vbi_cap *argp )
-    :name: VIDIOC_G_SLICED_VBI_CAP
+.. c:macro:: VIDIOC_G_SLICED_VBI_CAP
 
+``int ioctl(int fd, VIDIOC_G_SLICED_VBI_CAP, struct v4l2_sliced_vbi_cap *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_sliced_vbi_cap`.
 
-
 Description
 ===========
 
@@ -44,7 +43,6 @@ the sliced VBI API is unsupported or ``type`` is invalid.
    The ``type`` field was added, and the ioctl changed from read-only
    to write-read, in Linux 2.6.19.
 
-
 .. c:type:: v4l2_sliced_vbi_cap
 
 .. tabularcolumns:: |p{1.2cm}|p{4.2cm}|p{4.1cm}|p{4.0cm}|p{4.0cm}|
@@ -120,7 +118,6 @@ the sliced VBI API is unsupported or ``type`` is invalid.
 
    See also :ref:`vbi-525` and :ref:`vbi-625`.
 
-
 .. raw:: latex
 
     \scriptsize
@@ -183,7 +180,6 @@ the sliced VBI API is unsupported or ``type`` is invalid.
 
     \normalsize
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-std.rst b/Documentation/userspace-api/media/v4l/vidioc-g-std.rst
index 8a659a873528..da91fe07d9e0 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-std.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-std.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_STD:
 
@@ -11,33 +12,34 @@ Name
 
 VIDIOC_G_STD - VIDIOC_S_STD - VIDIOC_SUBDEV_G_STD - VIDIOC_SUBDEV_S_STD - Query or select the video standard of the current input
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_STD, v4l2_std_id *argp )
-    :name: VIDIOC_G_STD
+.. c:macro:: VIDIOC_G_STD
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_STD, const v4l2_std_id *argp )
-    :name: VIDIOC_S_STD
+``int ioctl(int fd, VIDIOC_G_STD, v4l2_std_id *argp)``
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_STD, v4l2_std_id *argp )
-    :name: VIDIOC_SUBDEV_G_STD
+.. c:macro:: VIDIOC_S_STD
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_STD, const v4l2_std_id *argp )
-    :name: VIDIOC_SUBDEV_S_STD
+``int ioctl(int fd, VIDIOC_S_STD, const v4l2_std_id *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_G_STD
+
+``int ioctl(int fd, VIDIOC_SUBDEV_G_STD, v4l2_std_id *argp)``
+
+.. c:macro:: VIDIOC_SUBDEV_S_STD
+
+``int ioctl(int fd, VIDIOC_SUBDEV_S_STD, const v4l2_std_id *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to :c:type:`v4l2_std_id`.
 
-
 Description
 ===========
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
index e3ba5b18a357..116e66c01556 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-tuner.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_G_TUNER:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_G_TUNER - VIDIOC_S_TUNER - Get or set tuner attributes
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_G_TUNER, struct v4l2_tuner *argp )
-    :name: VIDIOC_G_TUNER
+.. c:macro:: VIDIOC_G_TUNER
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_TUNER, const struct v4l2_tuner *argp )
-    :name: VIDIOC_S_TUNER
+``int ioctl(int fd, VIDIOC_G_TUNER, struct v4l2_tuner *argp)``
 
+.. c:macro:: VIDIOC_S_TUNER
+
+``int ioctl(int fd, VIDIOC_S_TUNER, const struct v4l2_tuner *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_tuner`.
 
-
 Description
 ===========
 
@@ -59,7 +59,6 @@ to zero. The term 'tuner' means SDR receiver in this context.
 To change the radio frequency the
 :ref:`VIDIOC_S_FREQUENCY <VIDIOC_G_FREQUENCY>` ioctl is available.
 
-
  .. tabularcolumns:: |p{1.3cm}|p{3.0cm}|p{6.6cm}|p{6.6cm}|
 
 .. c:type:: v4l2_tuner
@@ -183,7 +182,6 @@ To change the radio frequency the
 	Drivers and applications must set the array to zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. c:type:: v4l2_tuner_type
@@ -207,7 +205,6 @@ To change the radio frequency the
       - 5
       - Tuner controls the RF part of a Software Digital Radio (SDR)
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _tuner-capability:
@@ -299,7 +296,6 @@ To change the radio frequency the
 	instead of 62.5 kHz.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _tuner-rxsubchans:
@@ -338,7 +334,6 @@ To change the radio frequency the
       - The tuner receives an RDS channel.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _tuner-audmode:
diff --git a/Documentation/userspace-api/media/v4l/vidioc-log-status.rst b/Documentation/userspace-api/media/v4l/vidioc-log-status.rst
index 74b06dc68109..c218747be762 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-log-status.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-log-status.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_LOG_STATUS:
 
@@ -11,20 +12,18 @@ Name
 
 VIDIOC_LOG_STATUS - Log driver status information
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_LOG_STATUS)
-    :name: VIDIOC_LOG_STATUS
+.. c:macro:: VIDIOC_LOG_STATUS
 
+``int ioctl(int fd, VIDIOC_LOG_STATUS)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
-
+    File descriptor returned by :c:func:`open()`.
 
 Description
 ===========
@@ -40,7 +39,6 @@ Mismatches may give an indication where the problem is.
 This ioctl is optional and not all drivers support it. It was introduced
 in Linux 2.6.15.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-overlay.rst b/Documentation/userspace-api/media/v4l/vidioc-overlay.rst
index 8553fc7a6d8b..f2efaaba24c0 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-overlay.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-overlay.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_OVERLAY:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_OVERLAY - Start or stop video overlay
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_OVERLAY, const int *argp )
-    :name: VIDIOC_OVERLAY
+.. c:macro:: VIDIOC_OVERLAY
 
+``int ioctl(int fd, VIDIOC_OVERLAY, const int *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to an integer.
 
-
 Description
 ===========
 
@@ -41,7 +40,6 @@ Drivers do not support :ref:`VIDIOC_STREAMON` or
 :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>` with
 ``V4L2_BUF_TYPE_VIDEO_OVERLAY``.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-prepare-buf.rst b/Documentation/userspace-api/media/v4l/vidioc-prepare-buf.rst
index df003e5a65ac..45bb1eab2c2d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-prepare-buf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-prepare-buf.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_PREPARE_BUF:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_PREPARE_BUF - Prepare a buffer for I/O
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_PREPARE_BUF, struct v4l2_buffer *argp )
-    :name: VIDIOC_PREPARE_BUF
+.. c:macro:: VIDIOC_PREPARE_BUF
 
+``int ioctl(int fd, VIDIOC_PREPARE_BUF, struct v4l2_buffer *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_buffer`.
 
-
 Description
 ===========
 
@@ -41,7 +40,6 @@ in advance saves time during the actual I/O.
 The struct :c:type:`v4l2_buffer` structure is specified in
 :ref:`buffer`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
index cd920d0b6adf..fbf8c5962d8a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-qbuf.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_QBUF:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_QBUF - VIDIOC_DQBUF - Exchange a buffer with the driver
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_QBUF, struct v4l2_buffer *argp )
-    :name: VIDIOC_QBUF
+.. c:macro:: VIDIOC_QBUF
 
-.. c:function:: int ioctl( int fd, VIDIOC_DQBUF, struct v4l2_buffer *argp )
-    :name: VIDIOC_DQBUF
+``int ioctl(int fd, VIDIOC_QBUF, struct v4l2_buffer *argp)``
 
+.. c:macro:: VIDIOC_DQBUF
+
+``int ioctl(int fd, VIDIOC_DQBUF, struct v4l2_buffer *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_buffer`.
 
-
 Description
 ===========
 
@@ -142,13 +142,12 @@ API is used the ``m.fd`` fields of the passed array of struct
 
 By default ``VIDIOC_DQBUF`` blocks when no buffer is in the outgoing
 queue. When the ``O_NONBLOCK`` flag was given to the
-:ref:`open() <func-open>` function, ``VIDIOC_DQBUF`` returns
+:c:func:`open()` function, ``VIDIOC_DQBUF`` returns
 immediately with an ``EAGAIN`` error code when no buffer is available.
 
 The struct :c:type:`v4l2_buffer` structure is specified in
 :ref:`buffer`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-query-dv-timings.rst b/Documentation/userspace-api/media/v4l/vidioc-query-dv-timings.rst
index 6942e7e76897..5afdc4b4dc2d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-query-dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-query-dv-timings.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_QUERY_DV_TIMINGS:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_QUERY_DV_TIMINGS - VIDIOC_SUBDEV_QUERY_DV_TIMINGS - Sense the DV preset received by the current input
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_QUERY_DV_TIMINGS, struct v4l2_dv_timings *argp )
-    :name: VIDIOC_QUERY_DV_TIMINGS
+.. c:macro:: VIDIOC_QUERY_DV_TIMINGS
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_QUERY_DV_TIMINGS, struct v4l2_dv_timings *argp )
-    :name: VIDIOC_SUBDEV_QUERY_DV_TIMINGS
+``int ioctl(int fd, VIDIOC_QUERY_DV_TIMINGS, struct v4l2_dv_timings *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_QUERY_DV_TIMINGS
+
+``int ioctl(int fd, VIDIOC_SUBDEV_QUERY_DV_TIMINGS, struct v4l2_dv_timings *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_dv_timings`.
 
-
 Description
 ===========
 
@@ -65,7 +65,6 @@ and returns ``ERANGE``. In that case the application can call
 found timings with the hardware's capabilities in order to give more
 precise feedback to the user.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-querybuf.rst b/Documentation/userspace-api/media/v4l/vidioc-querybuf.rst
index 1d7ecf2697af..6c615e893866 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querybuf.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querybuf.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_QUERYBUF:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_QUERYBUF - Query the status of a buffer
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_QUERYBUF, struct v4l2_buffer *argp )
-    :name: VIDIOC_QUERYBUF
+.. c:macro:: VIDIOC_QUERYBUF
 
+``int ioctl(int fd, VIDIOC_QUERYBUF, struct v4l2_buffer *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_buffer`.
 
-
 Description
 ===========
 
@@ -67,7 +66,6 @@ flags, they are meaningless in this context.
 The struct :c:type:`v4l2_buffer` structure is specified in
 :ref:`buffer`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 80b7b79561f5..b512b1fbf9a3 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_QUERYCAP:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_QUERYCAP - Query device capabilities
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_QUERYCAP, struct v4l2_capability *argp )
-    :name: VIDIOC_QUERYCAP
+.. c:macro:: VIDIOC_QUERYCAP
 
+``int ioctl(int fd, VIDIOC_QUERYCAP, struct v4l2_capability *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_capability`.
 
-
 Description
 ===========
 
@@ -39,7 +38,6 @@ pointer to a struct :c:type:`v4l2_capability` which is
 filled by the driver. When the driver is not compatible with this
 specification the ioctl returns an ``EINVAL`` error code.
 
-
 .. tabularcolumns:: |p{1.5cm}|p{2.5cm}|p{13cm}|
 
 .. c:type:: v4l2_capability
@@ -132,7 +130,6 @@ specification the ioctl returns an ``EINVAL`` error code.
 	zero.
 
 
-
 .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
 
 .. _device-capabilities:
@@ -243,8 +240,8 @@ specification the ioctl returns an ``EINVAL`` error code.
       - The device supports the :ref:`metadata` capture interface.
     * - ``V4L2_CAP_READWRITE``
       - 0x01000000
-      - The device supports the :ref:`read() <rw>` and/or
-	:ref:`write() <rw>` I/O methods.
+      - The device supports the :c:func:`read()` and/or
+	:c:func:`write()` I/O methods.
     * - ``V4L2_CAP_ASYNCIO``
       - 0x02000000
       - The device supports the :ref:`asynchronous <async>` I/O methods.
@@ -269,7 +266,6 @@ specification the ioctl returns an ``EINVAL`` error code.
 	only appear in the ``capabilities`` field and never in the
 	``device_caps`` field.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 559ad849f7b9..9b8716f90f12 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_QUERYCTRL:
 
@@ -11,31 +12,29 @@ Name
 
 VIDIOC_QUERYCTRL - VIDIOC_QUERY_EXT_CTRL - VIDIOC_QUERYMENU - Enumerate controls and menu control items
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, int VIDIOC_QUERYCTRL, struct v4l2_queryctrl *argp )
-    :name: VIDIOC_QUERYCTRL
+``int ioctl(int fd, int VIDIOC_QUERYCTRL, struct v4l2_queryctrl *argp)``
 
-.. c:function:: int ioctl( int fd, VIDIOC_QUERY_EXT_CTRL, struct v4l2_query_ext_ctrl *argp )
-    :name: VIDIOC_QUERY_EXT_CTRL
+.. c:macro:: VIDIOC_QUERY_EXT_CTRL
 
-.. c:function:: int ioctl( int fd, VIDIOC_QUERYMENU, struct v4l2_querymenu *argp )
-    :name: VIDIOC_QUERYMENU
+``int ioctl(int fd, VIDIOC_QUERY_EXT_CTRL, struct v4l2_query_ext_ctrl *argp)``
 
+.. c:macro:: VIDIOC_QUERYMENU
+
+``int ioctl(int fd, VIDIOC_QUERYMENU, struct v4l2_querymenu *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_queryctrl`, :c:type:`v4l2_query_ext_ctrl`
     or :c:type:`v4l2_querymenu` (depending on the ioctl).
 
-
 Description
 ===========
 
@@ -95,7 +94,6 @@ inclusive.
 
 See also the examples in :ref:`control`.
 
-
 .. tabularcolumns:: |p{1.2cm}|p{3.6cm}|p{12.7cm}|
 
 .. _v4l2-queryctrl:
@@ -174,7 +172,6 @@ See also the examples in :ref:`control`.
 	zero.
 
 
-
 .. tabularcolumns:: |p{1.2cm}|p{5.0cm}|p{11.3cm}|
 
 .. _v4l2-query-ext-ctrl:
@@ -275,7 +272,6 @@ See also the examples in :ref:`control`.
 	the array to zero.
 
 
-
 .. tabularcolumns:: |p{1.2cm}|p{1.0cm}|p{1.7cm}|p{13.0cm}|
 
 .. _v4l2-querymenu:
@@ -311,7 +307,6 @@ See also the examples in :ref:`control`.
 	zero.
 
 
-
 .. tabularcolumns:: |p{5.8cm}|p{1.4cm}|p{1.0cm}|p{1.4cm}|p{6.9cm}|
 
 .. c:type:: v4l2_ctrl_type
@@ -582,7 +577,6 @@ See also the examples in :ref:`control`.
 	streaming is in progress since most drivers do not support changing
 	the format in that case.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-querystd.rst b/Documentation/userspace-api/media/v4l/vidioc-querystd.rst
index b043ec48cf9d..4a88287d8f61 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querystd.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querystd.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_QUERYSTD:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_QUERYSTD - VIDIOC_SUBDEV_QUERYSTD - Sense the video standard received by the current input
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_QUERYSTD, v4l2_std_id *argp )
-    :name: VIDIOC_QUERYSTD
+.. c:macro:: VIDIOC_QUERYSTD
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_QUERYSTD, v4l2_std_id *argp )
-    :name: VIDIOC_SUBDEV_QUERYSTD
+``int ioctl(int fd, VIDIOC_QUERYSTD, v4l2_std_id *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_QUERYSTD
+
+``int ioctl(int fd, VIDIOC_SUBDEV_QUERYSTD, v4l2_std_id *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to :c:type:`v4l2_std_id`.
 
-
 Description
 ===========
 
@@ -58,7 +58,6 @@ or output.
    standard is valid they will have to stop streaming, set the new
    standard, allocate new buffers and start streaming again.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index afc35cd7b614..c1c88e00b106 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_REQBUFS:
 
@@ -11,19 +12,18 @@ Name
 
 VIDIOC_REQBUFS - Initiate Memory Mapping, User Pointer I/O or DMA buffer I/O
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_REQBUFS, struct v4l2_requestbuffers *argp )
-    :name: VIDIOC_REQBUFS
+.. c:macro:: VIDIOC_REQBUFS
 
+``int ioctl(int fd, VIDIOC_REQBUFS, struct v4l2_requestbuffers *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_requestbuffers`.
@@ -69,7 +69,6 @@ fds are closed. A ``count`` value of zero frees or orphans all buffers, after
 aborting or finishing any DMA in progress, an implicit
 :ref:`VIDIOC_STREAMOFF <VIDIOC_STREAMON>`.
 
-
 .. c:type:: v4l2_requestbuffers
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -158,7 +157,6 @@ aborting or finishing any DMA in progress, an implicit
         :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
         :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst b/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst
index fb09ea31cad7..1948f31c2dbc 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-s-hw-freq-seek.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_S_HW_FREQ_SEEK:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_S_HW_FREQ_SEEK - Perform a hardware frequency seek
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_S_HW_FREQ_SEEK, struct v4l2_hw_freq_seek *argp )
-    :name: VIDIOC_S_HW_FREQ_SEEK
+.. c:macro:: VIDIOC_S_HW_FREQ_SEEK
 
+``int ioctl(int fd, VIDIOC_S_HW_FREQ_SEEK, struct v4l2_hw_freq_seek *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_hw_freq_seek`.
 
-
 Description
 ===========
 
@@ -59,7 +58,6 @@ set.
 If this ioctl is called from a non-blocking filehandle, then ``EAGAIN``
 error code is returned and no seek takes place.
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_hw_freq_seek
@@ -116,7 +114,6 @@ error code is returned and no seek takes place.
       - Reserved for future extensions. Applications must set the array to
 	zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-streamon.rst b/Documentation/userspace-api/media/v4l/vidioc-streamon.rst
index d9623aa7c425..0bc86f06947b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-streamon.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-streamon.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_STREAMON:
 
@@ -11,22 +12,22 @@ Name
 
 VIDIOC_STREAMON - VIDIOC_STREAMOFF - Start or stop streaming I/O
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_STREAMON, const int *argp )
-    :name: VIDIOC_STREAMON
+.. c:macro:: VIDIOC_STREAMON
 
-.. c:function:: int ioctl( int fd, VIDIOC_STREAMOFF, const int *argp )
-    :name: VIDIOC_STREAMOFF
+``int ioctl(int fd, VIDIOC_STREAMON, const int *argp)``
 
+.. c:macro:: VIDIOC_STREAMOFF
+
+``int ioctl(int fd, VIDIOC_STREAMOFF, const int *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to an integer.
@@ -84,7 +85,6 @@ state as mentioned above.
    no notion of starting or stopping "now". Buffer timestamps can be used
    to synchronize with other events.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
index 932e8416f11c..17acf3fd8396 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL - Enumerate frame intervals
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, struct v4l2_subdev_frame_interval_enum * argp )
-    :name: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL
+.. c:macro:: VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL
 
+``int ioctl(int fd, VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, struct v4l2_subdev_frame_interval_enum * argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_subdev_frame_interval_enum`.
 
-
 Description
 ===========
 
@@ -97,7 +96,6 @@ multiple pads of the same sub-device is not defined.
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
index 3c480573df59..8016fba7023f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_SUBDEV_ENUM_FRAME_SIZE:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_SUBDEV_ENUM_FRAME_SIZE - Enumerate media bus frame sizes
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, struct v4l2_subdev_frame_size_enum * argp )
-    :name: VIDIOC_SUBDEV_ENUM_FRAME_SIZE
+.. c:macro:: VIDIOC_SUBDEV_ENUM_FRAME_SIZE
 
+``int ioctl(int fd, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, struct v4l2_subdev_frame_size_enum * argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_subdev_frame_size_enum`.
 
-
 Description
 ===========
 
@@ -62,7 +61,6 @@ current values of V4L2 controls. See
 :ref:`VIDIOC_SUBDEV_G_FMT` for more
 information about try formats.
 
-
 .. c:type:: v4l2_subdev_frame_size_enum
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -103,7 +101,6 @@ information about try formats.
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
index 3b6a8044c391..1fd950e34a0b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_SUBDEV_ENUM_MBUS_CODE:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_SUBDEV_ENUM_MBUS_CODE - Enumerate media bus formats
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_ENUM_MBUS_CODE, struct v4l2_subdev_mbus_code_enum * argp )
-    :name: VIDIOC_SUBDEV_ENUM_MBUS_CODE
+.. c:macro:: VIDIOC_SUBDEV_ENUM_MBUS_CODE
 
+``int ioctl(int fd, VIDIOC_SUBDEV_ENUM_MBUS_CODE, struct v4l2_subdev_mbus_code_enum * argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_subdev_mbus_code_enum`.
 
-
 Description
 ===========
 
@@ -47,7 +46,6 @@ other pads of the sub-device, as well as on the current active links.
 See :ref:`VIDIOC_SUBDEV_G_FMT` for more
 information about the try formats.
 
-
 .. c:type:: v4l2_subdev_mbus_code_enum
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
index 45c988b13ba6..2d78b4f5928d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_SUBDEV_G_CROP:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_SUBDEV_G_CROP - VIDIOC_SUBDEV_S_CROP - Get or set the crop rectangle on a subdev pad
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_CROP, struct v4l2_subdev_crop *argp )
-    :name: VIDIOC_SUBDEV_G_CROP
+.. c:macro:: VIDIOC_SUBDEV_G_CROP
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_CROP, const struct v4l2_subdev_crop *argp )
-    :name: VIDIOC_SUBDEV_S_CROP
+``int ioctl(int fd, VIDIOC_SUBDEV_G_CROP, struct v4l2_subdev_crop *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_S_CROP
+
+``int ioctl(int fd, VIDIOC_SUBDEV_S_CROP, const struct v4l2_subdev_crop *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_subdev_crop`.
 
-
 Description
 ===========
 
@@ -76,7 +76,6 @@ rectangle doesn't match the device capabilities. They must instead
 modify the rectangle to match what the hardware can provide. The
 modified format should be as close as possible to the original request.
 
-
 .. c:type:: v4l2_subdev_crop
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -101,7 +100,6 @@ modified format should be as close as possible to the original request.
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
index 76ce46f53c76..90b9bbfb61dd 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_SUBDEV_G_FMT:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_SUBDEV_G_FMT - VIDIOC_SUBDEV_S_FMT - Get or set the data format on a subdev pad
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_FMT, struct v4l2_subdev_format *argp )
-    :name: VIDIOC_SUBDEV_G_FMT
+.. c:macro:: VIDIOC_SUBDEV_G_FMT
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_FMT, struct v4l2_subdev_format *argp )
-    :name: VIDIOC_SUBDEV_S_FMT
+``int ioctl(int fd, VIDIOC_SUBDEV_G_FMT, struct v4l2_subdev_format *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_S_FMT
+
+``int ioctl(int fd, VIDIOC_SUBDEV_S_FMT, struct v4l2_subdev_format *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_subdev_format`.
 
-
 Description
 ===========
 
@@ -81,7 +81,6 @@ doesn't match the device capabilities. They must instead modify the
 format to match what the hardware can provide. The modified format
 should be as close as possible to the original request.
 
-
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_subdev_format
@@ -108,7 +107,6 @@ should be as close as possible to the original request.
 	the array to zero.
 
 
-
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
 .. _v4l2-subdev-format-whence:
@@ -125,7 +123,6 @@ should be as close as possible to the original request.
       - 1
       - Active formats, applied to the hardware.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
index 7e0b177e70aa..3a50f8b2843d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_SUBDEV_G_FRAME_INTERVAL:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_SUBDEV_G_FRAME_INTERVAL - VIDIOC_SUBDEV_S_FRAME_INTERVAL - Get or set the frame interval on a subdev pad
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_FRAME_INTERVAL, struct v4l2_subdev_frame_interval *argp )
-    :name: VIDIOC_SUBDEV_G_FRAME_INTERVAL
+.. c:macro:: VIDIOC_SUBDEV_G_FRAME_INTERVAL
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_FRAME_INTERVAL, struct v4l2_subdev_frame_interval *argp )
-    :name: VIDIOC_SUBDEV_S_FRAME_INTERVAL
+``int ioctl(int fd, VIDIOC_SUBDEV_G_FRAME_INTERVAL, struct v4l2_subdev_frame_interval *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_S_FRAME_INTERVAL
+
+``int ioctl(int fd, VIDIOC_SUBDEV_S_FRAME_INTERVAL, struct v4l2_subdev_frame_interval *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_subdev_frame_interval`.
 
-
 Description
 ===========
 
@@ -74,7 +74,6 @@ Sub-devices that support the frame interval ioctls should implement them
 on a single pad only. Their behaviour when supported on multiple pads of
 the same sub-device is not defined.
 
-
 .. c:type:: v4l2_subdev_frame_interval
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -95,7 +94,6 @@ the same sub-device is not defined.
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
index 948903a34d6f..f35b9562df21 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_SUBDEV_G_SELECTION:
 
@@ -11,27 +12,26 @@ Name
 
 VIDIOC_SUBDEV_G_SELECTION - VIDIOC_SUBDEV_S_SELECTION - Get or set selection rectangles on a subdev pad
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_G_SELECTION, struct v4l2_subdev_selection *argp )
-    :name: VIDIOC_SUBDEV_G_SELECTION
+.. c:macro:: VIDIOC_SUBDEV_G_SELECTION
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_S_SELECTION, struct v4l2_subdev_selection *argp )
-    :name: VIDIOC_SUBDEV_S_SELECTION
+``int ioctl(int fd, VIDIOC_SUBDEV_G_SELECTION, struct v4l2_subdev_selection *argp)``
 
+.. c:macro:: VIDIOC_SUBDEV_S_SELECTION
+
+``int ioctl(int fd, VIDIOC_SUBDEV_S_SELECTION, struct v4l2_subdev_selection *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_subdev_selection`.
 
-
 Description
 ===========
 
@@ -58,7 +58,6 @@ There are two types of selection targets: actual and bounds. The actual
 targets are the targets which configure the hardware. The BOUNDS target
 will return a rectangle that contain all possible actual rectangles.
 
-
 Discovering supported features
 ------------------------------
 
@@ -69,7 +68,6 @@ return ``EINVAL``.
 Selection targets and flags are documented in
 :ref:`v4l2-selections-common`.
 
-
 .. c:type:: v4l2_subdev_selection
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
@@ -100,7 +98,6 @@ Selection targets and flags are documented in
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
index e806385ba176..949d9775b03d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_SUBDEV_QUERYCAP:
 
@@ -11,24 +12,22 @@ Name
 
 VIDIOC_SUBDEV_QUERYCAP - Query sub-device capabilities
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_QUERYCAP, struct v4l2_subdev_capability *argp )
-    :name: VIDIOC_SUBDEV_QUERYCAP
+.. c:macro:: VIDIOC_SUBDEV_QUERYCAP
 
+``int ioctl(int fd, VIDIOC_SUBDEV_QUERYCAP, struct v4l2_subdev_capability *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_subdev_capability`.
 
-
 Description
 ===========
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
index 67827671bbaa..d1ad35164033 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subscribe-event.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
 
 .. _VIDIOC_SUBSCRIBE_EVENT:
 .. _VIDIOC_UNSUBSCRIBE_EVENT:
@@ -12,34 +13,32 @@ Name
 
 VIDIOC_SUBSCRIBE_EVENT - VIDIOC_UNSUBSCRIBE_EVENT - Subscribe or unsubscribe event
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, VIDIOC_SUBSCRIBE_EVENT, struct v4l2_event_subscription *argp )
-    :name: VIDIOC_SUBSCRIBE_EVENT
+.. c:macro:: VIDIOC_SUBSCRIBE_EVENT
 
-.. c:function:: int ioctl( int fd, VIDIOC_UNSUBSCRIBE_EVENT, struct v4l2_event_subscription *argp )
-    :name: VIDIOC_UNSUBSCRIBE_EVENT
+``int ioctl(int fd, VIDIOC_SUBSCRIBE_EVENT, struct v4l2_event_subscription *argp)``
 
+.. c:macro:: VIDIOC_UNSUBSCRIBE_EVENT
+
+``int ioctl(int fd, VIDIOC_UNSUBSCRIBE_EVENT, struct v4l2_event_subscription *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <func-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`v4l2_event_subscription`.
 
-
 Description
 ===========
 
 Subscribe or unsubscribe V4L2 event. Subscribed events are dequeued by
 using the :ref:`VIDIOC_DQEVENT` ioctl.
 
-
 .. tabularcolumns:: |p{4.6cm}|p{4.4cm}|p{8.7cm}|
 
 .. c:type:: v4l2_event_subscription
@@ -72,7 +71,6 @@ using the :ref:`VIDIOC_DQEVENT` ioctl.
 	the array to zero.
 
 
-
 .. tabularcolumns:: |p{6.8cm}|p{2.2cm}|p{8.5cm}|
 
 .. _event-flags:
@@ -107,7 +105,6 @@ using the :ref:`VIDIOC_DQEVENT` ioctl.
 	Think carefully when you set this flag so you won't get into
 	situations like that.
 
-
 Return Value
 ============
 
-- 
2.26.2

