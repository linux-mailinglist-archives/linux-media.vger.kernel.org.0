Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0239A05F
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392269AbfHVTp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:45:26 -0400
Received: from mailoutvs32.siol.net ([185.57.226.223]:56133 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732015AbfHVTp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:45:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id ED8855249F5;
        Thu, 22 Aug 2019 21:45:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id o4jM-KUmUx1X; Thu, 22 Aug 2019 21:45:16 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id ABA345249EB;
        Thu, 22 Aug 2019 21:45:16 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 4195A5249F2;
        Thu, 22 Aug 2019 21:45:14 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org
Cc:     pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        jernej.skrabec@siol.net, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
        jonas@kwiboo.se
Subject: [PATCH 3/8] media: docs-rst: Document m2m stateless video decoder interface
Date:   Thu, 22 Aug 2019 21:44:55 +0200
Message-Id: <20190822194500.2071-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190822194500.2071-1-jernej.skrabec@siol.net>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

Documents the protocol that user-space should follow when
communicating with stateless video decoders.

The stateless video decoding API makes use of the new request and tags
APIs. While it has been implemented with the Cedrus driver so far, it
should probably still be considered staging for a short while.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/media/uapi/v4l/dev-mem2mem.rst  |   1 +
 .../media/uapi/v4l/dev-stateless-decoder.rst  | 424 ++++++++++++++++++
 2 files changed, 425 insertions(+)
 create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rs=
t

diff --git a/Documentation/media/uapi/v4l/dev-mem2mem.rst b/Documentation=
/media/uapi/v4l/dev-mem2mem.rst
index caa05f5f6380..70953958cee6 100644
--- a/Documentation/media/uapi/v4l/dev-mem2mem.rst
+++ b/Documentation/media/uapi/v4l/dev-mem2mem.rst
@@ -46,3 +46,4 @@ devices are given in the following sections.
     :maxdepth: 1
=20
     dev-decoder
+    dev-stateless-decoder
diff --git a/Documentation/media/uapi/v4l/dev-stateless-decoder.rst b/Doc=
umentation/media/uapi/v4l/dev-stateless-decoder.rst
new file mode 100644
index 000000000000..4a26646eeec5
--- /dev/null
+++ b/Documentation/media/uapi/v4l/dev-stateless-decoder.rst
@@ -0,0 +1,424 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _stateless_decoder:
+
+**************************************************
+Memory-to-memory Stateless Video Decoder Interface
+**************************************************
+
+A stateless decoder is a decoder that works without retaining any kind o=
f state
+between processed frames. This means that each frame is decoded independ=
ently
+of any previous and future frames, and that the client is responsible fo=
r
+maintaining the decoding state and providing it to the decoder with each
+decoding request. This is in contrast to the stateful video decoder inte=
rface,
+where the hardware and driver maintain the decoding state and all the cl=
ient
+has to do is to provide the raw encoded stream and dequeue decoded frame=
s in
+display order.
+
+This section describes how user-space ("the client") is expected to comm=
unicate
+with stateless decoders in order to successfully decode an encoded strea=
m.
+Compared to stateful codecs, the decoder/client sequence is simpler, but=
 the
+cost of this simplicity is extra complexity in the client which is respo=
nsible
+for maintaining a consistent decoding state.
+
+Stateless decoders make use of the :ref:`media-request-api`. A stateless
+decoder must expose the ``V4L2_BUF_CAP_SUPPORTS_REQUESTS`` capability on=
 its
+``OUTPUT`` queue when :c:func:`VIDIOC_REQBUFS` or :c:func:`VIDIOC_CREATE=
_BUFS`
+are invoked.
+
+Depending on the encoded formats supported by the decoder, a single deco=
ded
+frame may be the result of several decode requests (for instance, H.264 =
streams
+with multiple slices per frame). Decoders that support such formats must=
 also
+expose the ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` capability on =
their
+``OUTPUT`` queue.
+
+Querying capabilities
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+1. To enumerate the set of coded formats supported by the decoder, the c=
lient
+   calls :c:func:`VIDIOC_ENUM_FMT` on the ``OUTPUT`` queue.
+
+   * The driver must always return the full set of supported ``OUTPUT`` =
formats,
+     irrespective of the format currently set on the ``CAPTURE`` queue.
+
+   * Simultaneously, the driver must restrain the set of values returned=
 by
+     codec-specific capability controls (such as H.264 profiles) to the =
set
+     actually supported by the hardware.
+
+2. To enumerate the set of supported raw formats, the client calls
+   :c:func:`VIDIOC_ENUM_FMT` on the ``CAPTURE`` queue.
+
+   * The driver must return only the formats supported for the format cu=
rrently
+     active on the ``OUTPUT`` queue.
+
+   * Depending on the currently set ``OUTPUT`` format, the set of suppor=
ted raw
+     formats may depend on the value of some codec-dependent controls.
+     The client is responsible for making sure that these controls are s=
et
+     before querying the ``CAPTURE`` queue. Failure to do so will result=
 in the
+     default values for these controls being used, and a returned set of=
 formats
+     that may not be usable for the media the client is trying to decode=
.
+
+3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect support=
ed
+   resolutions for a given format, passing desired pixel format in
+   :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
+
+4. Supported profiles and levels for the current ``OUTPUT`` format, if
+   applicable, may be queried using their respective controls via
+   :c:func:`VIDIOC_QUERYCTRL`.
+
+Initialization
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+1. Set the coded format on the ``OUTPUT`` queue via :c:func:`VIDIOC_S_FM=
T`.
+
+   * **Required fields:**
+
+     ``type``
+         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
+
+     ``pixelformat``
+         a coded pixel format.
+
+     ``width``, ``height``
+         coded width and height parsed from the stream.
+
+     other fields
+         follow standard semantics.
+
+   .. note::
+
+      Changing the ``OUTPUT`` format may change the currently set ``CAPT=
URE``
+      format. The driver will derive a new ``CAPTURE`` format from the
+      ``OUTPUT`` format being set, including resolution, colorimetry
+      parameters, etc. If the client needs a specific ``CAPTURE`` format=
,
+      it must adjust it afterwards.
+
+2. Call :c:func:`VIDIOC_S_EXT_CTRLS` to set all the controls (parsed hea=
ders,
+   etc.) required by the ``OUTPUT`` format to enumerate the ``CAPTURE`` =
formats.
+
+3. Call :c:func:`VIDIOC_G_FMT` for ``CAPTURE`` queue to get the format f=
or the
+   destination buffers parsed/decoded from the bytestream.
+
+   * **Required fields:**
+
+     ``type``
+         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
+
+   * **Returned fields:**
+
+     ``width``, ``height``
+         frame buffer resolution for the decoded frames.
+
+     ``pixelformat``
+         pixel format for decoded frames.
+
+     ``num_planes`` (for _MPLANE ``type`` only)
+         number of planes for pixelformat.
+
+     ``sizeimage``, ``bytesperline``
+         as per standard semantics; matching frame buffer format.
+
+   .. note::
+
+      The value of ``pixelformat`` may be any pixel format supported for=
 the
+      ``OUTPUT`` format, based on the hardware capabilities. It is sugge=
sted
+      that the driver chooses the preferred/optimal format for the curre=
nt
+      configuration. For example, a YUV format may be preferred over an =
RGB
+      format, if an additional conversion step would be required for RGB=
.
+
+4. *[optional]* Enumerate ``CAPTURE`` formats via :c:func:`VIDIOC_ENUM_F=
MT` on
+   the ``CAPTURE`` queue. The client may use this ioctl to discover whic=
h
+   alternative raw formats are supported for the current ``OUTPUT`` form=
at and
+   select one of them via :c:func:`VIDIOC_S_FMT`.
+
+   .. note::
+
+      The driver will return only formats supported for the currently se=
lected
+      ``OUTPUT`` format and currently set controls, even if more formats=
 may be
+      supported by the decoder in general.
+
+      For example, a decoder may support YUV and RGB formats for
+      resolutions 1920x1088 and lower, but only YUV for higher resolutio=
ns (due
+      to hardware limitations). After setting a resolution of 1920x1088 =
or lower
+      as the ``OUTPUT`` format, :c:func:`VIDIOC_ENUM_FMT` may return a s=
et of
+      YUV and RGB pixel formats, but after setting a resolution higher t=
han
+      1920x1088, the driver will not return RGB pixel formats, since the=
y are
+      unsupported for this resolution.
+
+5. *[optional]* Choose a different ``CAPTURE`` format than suggested via
+   :c:func:`VIDIOC_S_FMT` on ``CAPTURE`` queue. It is possible for the c=
lient to
+   choose a different format than selected/suggested by the driver in
+   :c:func:`VIDIOC_G_FMT`.
+
+    * **Required fields:**
+
+      ``type``
+          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
+
+      ``pixelformat``
+          a raw pixel format.
+
+      ``width``, ``height``
+         frame buffer resolution of the decoded stream; typically unchan=
ged from
+         what was returned with :c:func:`VIDIOC_G_FMT`, but it may be di=
fferent
+         if the hardware supports composition and/or scaling.
+
+   After performing this step, the client must perform step 3 again in o=
rder
+   to obtain up-to-date information about the buffers size and layout.
+
+6. Allocate source (bytestream) buffers via :c:func:`VIDIOC_REQBUFS` on
+   ``OUTPUT`` queue.
+
+    * **Required fields:**
+
+      ``count``
+          requested number of buffers to allocate; greater than zero.
+
+      ``type``
+          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
+
+      ``memory``
+          follows standard semantics.
+
+    * **Return fields:**
+
+      ``count``
+          actual number of buffers allocated.
+
+    * If required, the driver will adjust ``count`` to be equal or bigge=
r to the
+      minimum of required number of ``OUTPUT`` buffers for the given for=
mat and
+      requested count. The client must check this value after the ioctl =
returns
+      to get the actual number of buffers allocated.
+
+7. Allocate destination (raw format) buffers via :c:func:`VIDIOC_REQBUFS=
` on the
+   ``CAPTURE`` queue.
+
+    * **Required fields:**
+
+      ``count``
+          requested number of buffers to allocate; greater than zero. Th=
e client
+          is responsible for deducing the minimum number of buffers requ=
ired
+          for the stream to be properly decoded (taking e.g. reference f=
rames
+          into account) and pass an equal or bigger number.
+
+      ``type``
+          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
+
+      ``memory``
+          follows standard semantics. ``V4L2_MEMORY_USERPTR`` is not sup=
ported
+          for ``CAPTURE`` buffers.
+
+    * **Return fields:**
+
+      ``count``
+          adjusted to allocated number of buffers, in case the codec req=
uires
+          more buffers than requested.
+
+    * The driver must adjust count to the minimum of required number of
+      ``CAPTURE`` buffers for the current format, stream configuration a=
nd
+      requested count. The client must check this value after the ioctl
+      returns to get the number of buffers allocated.
+
+8. Allocate requests (likely one per ``OUTPUT`` buffer) via
+    :c:func:`MEDIA_IOC_REQUEST_ALLOC` on the media device.
+
+9. Start streaming on both ``OUTPUT`` and ``CAPTURE`` queues via
+    :c:func:`VIDIOC_STREAMON`.
+
+Decoding
+=3D=3D=3D=3D=3D=3D=3D=3D
+
+For each frame, the client is responsible for submitting at least one re=
quest to
+which the following is attached:
+
+* The amount of encoded data expected by the codec for its current
+  configuration, as a buffer submitted to the ``OUTPUT`` queue. Typicall=
y, this
+  corresponds to one frame worth of encoded data, but some formats may a=
llow (or
+  require) different amounts per unit.
+* All the metadata needed to decode the submitted encoded data, in the f=
orm of
+  controls relevant to the format being decoded.
+
+The amount of data and contents of the source ``OUTPUT`` buffer, as well=
 as the
+controls that must be set on the request, depend on the active coded pix=
el
+format and might be affected by codec-specific extended controls, as sta=
ted in
+documentation of each format.
+
+If there is a possibility that the decoded frame will require one or mor=
e
+decode requests after the current one in order to be produced, then the =
client
+must set the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag on the ``OUTPUT=
``
+buffer. This will result in the (potentially partially) decoded ``CAPTUR=
E``
+buffer not being made available for dequeueing, and reused for the next =
decode
+request if the timestamp of the next ``OUTPUT`` buffer has not changed.
+
+A typical frame would thus be decoded using the following sequence:
+
+1. Queue an ``OUTPUT`` buffer containing one unit of encoded bytestream =
data for
+   the decoding request, using :c:func:`VIDIOC_QBUF`.
+
+    * **Required fields:**
+
+      ``index``
+          index of the buffer being queued.
+
+      ``type``
+          type of the buffer.
+
+      ``bytesused``
+          number of bytes taken by the encoded data frame in the buffer.
+
+      ``flags``
+          the ``V4L2_BUF_FLAG_REQUEST_FD`` flag must be set. Additionall=
y, if
+          we are not sure that the current decode request is the last on=
e needed
+          to produce a fully decoded frame, then
+          ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` must also be set.
+
+      ``request_fd``
+          must be set to the file descriptor of the decoding request.
+
+      ``timestamp``
+          must be set to a unique value per frame. This value will be pr=
opagated
+          into the decoded frame's buffer and can also be used to use th=
is frame
+          as the reference of another. If using multiple decode requests=
 per
+          frame, then the timestamps of all the ``OUTPUT`` buffers for a=
 given
+          frame must be identical. If the timestamp changes, then the cu=
rrently
+          held ``CAPTURE`` buffer will be made available for dequeuing a=
nd the
+          current request will work on a new ``CAPTURE`` buffer.
+
+2. Set the codec-specific controls for the decoding request, using
+   :c:func:`VIDIOC_S_EXT_CTRLS`.
+
+    * **Required fields:**
+
+      ``which``
+          must be ``V4L2_CTRL_WHICH_REQUEST_VAL``.
+
+      ``request_fd``
+          must be set to the file descriptor of the decoding request.
+
+      other fields
+          other fields are set as usual when setting controls. The ``con=
trols``
+          array must contain all the codec-specific controls required to=
 decode
+          a frame.
+
+   .. note::
+
+      It is possible to specify the controls in different invocations of
+      :c:func:`VIDIOC_S_EXT_CTRLS`, or to overwrite a previously set con=
trol, as
+      long as ``request_fd`` and ``which`` are properly set. The control=
s state
+      at the moment of request submission is the one that will be consid=
ered.
+
+   .. note::
+
+      The order in which steps 1 and 2 take place is interchangeable.
+
+3. Submit the request by invoking :c:func:`MEDIA_REQUEST_IOC_QUEUE` on t=
he
+   request FD.
+
+    If the request is submitted without an ``OUTPUT`` buffer, or if some=
 of the
+    required controls are missing from the request, then
+    :c:func:`MEDIA_REQUEST_IOC_QUEUE` will return ``-ENOENT``. If more t=
han one
+    ``OUTPUT`` buffer is queued, then it will return ``-EINVAL``.
+    :c:func:`MEDIA_REQUEST_IOC_QUEUE` returning non-zero means that no
+    ``CAPTURE`` buffer will be produced for this request.
+
+``CAPTURE`` buffers must not be part of the request, and are queued
+independently. They are returned in decode order (i.e. the same order as=
 coded
+frames were submitted to the ``OUTPUT`` queue).
+
+Runtime decoding errors are signaled by the dequeued ``CAPTURE`` buffers
+carrying the ``V4L2_BUF_FLAG_ERROR`` flag. If a decoded reference frame =
has an
+error, then all following decoded frames that refer to it also have the
+``V4L2_BUF_FLAG_ERROR`` flag set, although the decoder will still try to
+produce (likely corrupted) frames.
+
+Buffer management while decoding
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+Contrary to stateful decoders, a stateless decoder does not perform any =
kind of
+buffer management: it only guarantees that dequeued ``CAPTURE`` buffers =
can be
+used by the client for as long as they are not queued again. "Used" here
+encompasses using the buffer for compositing or display.
+
+A dequeued capture buffer can also be used as the reference frame of ano=
ther
+buffer.
+
+A frame is specified as reference by converting its timestamp into nanos=
econds,
+and storing it into the relevant member of a codec-dependent control str=
ucture.
+The :c:func:`v4l2_timeval_to_ns` function must be used to perform that
+conversion. The timestamp of a frame can be used to reference it as soon=
 as all
+its units of encoded data are successfully submitted to the ``OUTPUT`` q=
ueue.
+
+A decoded buffer containing a reference frame must not be reused as a de=
coding
+target until all the frames referencing it have been decoded. The safest=
 way to
+achieve this is to refrain from queueing a reference buffer until all th=
e
+decoded frames referencing it have been dequeued. However, if the driver=
 can
+guarantee that buffers queued to the ``CAPTURE`` queue are processed in =
queued
+order, then user-space can take advantage of this guarantee and queue a
+reference buffer when the following conditions are met:
+
+1. All the requests for frames affected by the reference frame have been
+   queued, and
+
+2. A sufficient number of ``CAPTURE`` buffers to cover all the decoded
+   referencing frames have been queued.
+
+When queuing a decoding request, the driver will increase the reference =
count of
+all the resources associated with reference frames. This means that the =
client
+can e.g. close the DMABUF file descriptors of reference frame buffers if=
 it
+won't need them afterwards.
+
+Seeking
+=3D=3D=3D=3D=3D=3D=3D
+In order to seek, the client just needs to submit requests using input b=
uffers
+corresponding to the new stream position. It must however be aware that
+resolution may have changed and follow the dynamic resolution change seq=
uence in
+that case. Also depending on the codec used, picture parameters (e.g. SP=
S/PPS
+for H.264) may have changed and the client is responsible for making sur=
e that a
+valid state is sent to the decoder.
+
+The client is then free to ignore any returned ``CAPTURE`` buffer that c=
omes
+from the pre-seek position.
+
+Pausing
+=3D=3D=3D=3D=3D=3D=3D
+
+In order to pause, the client can just cease queuing buffers onto the ``=
OUTPUT``
+queue. Without source bytestream data, there is no data to process and t=
he codec
+will remain idle.
+
+Dynamic resolution change
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+If the client detects a resolution change in the stream, it will need to=
 perform
+the initialization sequence again with the new resolution:
+
+1. If the last submitted request resulted in a ``CAPTURE`` buffer being
+   held by the use of the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag, t=
hen the
+   last frame is not available on the ``CAPTURE`` queue. In this case, a
+   ``V4L2_DEC_CMD_FLUSH`` command shall be sent. This will make the driv=
er
+   dequeue the held ``CAPTURE`` buffer.
+
+2. Wait until all submitted requests have completed and dequeue the
+   corresponding output buffers.
+
+3. Call :c:func:`VIDIOC_STREAMOFF` on both the ``OUTPUT`` and ``CAPTURE`=
`
+   queues.
+
+4. Free all ``CAPTURE`` buffers by calling :c:func:`VIDIOC_REQBUFS` on t=
he
+   ``CAPTURE`` queue with a buffer count of zero.
+
+5. Perform the initialization sequence again (minus the allocation of
+   ``OUTPUT`` buffers), with the new resolution set on the ``OUTPUT`` qu=
eue.
+   Note that due to resolution constraints, a different format may need =
to be
+   picked on the ``CAPTURE`` queue.
+
+Drain
+=3D=3D=3D=3D=3D
+
+If the last submitted request resulted in a ``CAPTURE`` buffer being
+held by the use of the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag, then=
 the
+last frame is not available on the ``CAPTURE`` queue. In this case, a
+``V4L2_DEC_CMD_FLUSH`` command shall be sent. This will make the driver
+dequeue the held ``CAPTURE`` buffer.
+
+After that, in order to drain the stream on a stateless decoder, the cli=
ent
+just needs to wait until all the submitted requests are completed.
--=20
2.22.1

