Return-Path: <linux-media+bounces-4300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CCE83FB00
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76BB81F2423A
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 23:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0814E4596E;
	Sun, 28 Jan 2024 23:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="E4to4+i8"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF24A335BC
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 23:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706484833; cv=none; b=GErd/PyRNUTUCkhdEslEdbmiDnYqX2g+p38gK/rULiwf7y4bV7c+2c+Vv9m/5uy92pI12P0NrLx2fmVF72liP/UkqpfAlP59U/9eBWuw2KVQN2udUIvXHXOztCxBwTFSzq1cd3EcKRFljQTwfrCV1UhpZcfbvI4nd1KWlzekdQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706484833; c=relaxed/simple;
	bh=RTSjYeCNSqWYtAfxfQJyFMQRH2o76daM99KR5iSO0H0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XyAyMMfvPep8w9hVl/BNpKp/veYKZSByFpB5FJ4SLXybZUbm9c9hl2ALne/OCo/VcwIcG4i/9BgIWRAXy5kxUBEkVowdrdII79En88e+DauALCD1ZHPYymLNg2C7dBFXP0U6AobaPq7QMUrNCbhNxA9jZgxVDfYOptf+IXz3Nzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=E4to4+i8; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
	s=s31663417; t=1706484820; x=1707089620; i=herdler@nurfuerspam.de;
	bh=RTSjYeCNSqWYtAfxfQJyFMQRH2o76daM99KR5iSO0H0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=E4to4+i8HQUdILHGu+TyfU0sj3AbPZstROfkqVPPuPXtmJn2JEkRGd/MYxHluKuQ
	 EEw8BlJYGyUQUNUvXICb1KYPVXetIln+aRHQwIaugXv1mqMExvTb+R5Ty9eCtZa3Z
	 Z305B6ik56ed1c+MzG64waSE6rZw3HspvCseuBL2NznudbvJD6v/OmXTALBGCaVgK
	 0jc/v8Gt/vpTRqgQewlw/PBi03fqiak7NZHUMxYvOiXyKs08JrLW/dmvPRW/83Hqk
	 ZpggHdTv/7nHYXFgwzQBmqFYLtOmMUBgRRvVOh1+cG7sp5U1Iydz25B7BulzSUJ0Z
	 ApP9Pu+GAuNkXz8Qqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.173.202]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUowV-1rdCw12I4n-00QhJi; Mon, 29
 Jan 2024 00:33:40 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v4 5/6] media: docs: uAPI: dvb/video: completing the documentation (data types)
Date: Mon, 29 Jan 2024 00:32:48 +0100
Message-Id: <20240128233249.32794-6-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240128233249.32794-1-herdler@nurfuerspam.de>
References: <20240128233249.32794-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NqfoNDL9OqY4xoqUnq4gk5ePC7w/1EMdWm5IsIqLwO0glRUJCdD
 qqu6CtRRYO9dKX2PpWHXggF00ID8mqIEEC5c3wgFoNCmSKGPPjNrrcWtY0t0pAI7S6ZQbsQ
 U3ecPBbV1OK1YhC9h1PDIlwE1XExbIjO8Y3C+9QbLxwq9dcsSjn1Rak3p5josKSzOB2x3nh
 vbt8fc4xt6UGP9100K9Rg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gxt48r0+T1E=;fCP9/uN8wN2IB25mC/SqKXkGMX8
 7zzFBojpPRLLkmcVUoEB+ssPCUHk1Dq1GeeHKImhlqTG9nxKSPAUUIh04BIqKiqgYmC/mgO1J
 RUALYkG/Pg6CsprkScYq2F6iWH+99Wu8RrbyhuSpVrK4eILLwxClCCrCBsEWp5fJvGr5o0+Cp
 EqpVMyirbjPvfC5trpGLVimCqcULSee22HbttoYOeQuSw4QM9tzny0G2AGBZOmIEYC+TQvpRA
 Xz2ulPdxjb2/CNz02IhOjAmCjTA7+qr/p9bq2uYr1GSb+srgPtBy4eRjGR/eCt2E0HSrK/fBL
 lpnJAZGBu+E86sLflLQ/HuoUG+2+7b5o11GkKBZ8o6WssvP6UeFE+525EpJpIfmeVzwsm8jx+
 3o0Sps+JLDQEZqYs3ZwBOAEzpuxltAlnVIlsYoUIUZc5zFMCeQoApY2+8Z7e1eys1C6dTlR53
 sFaPI2Aen5kWjtOvJYLpl4efVYXlmKnpjy2IbH+jv8NLY8Ea48ugJYyRBgeRFLFssWlDYcOzq
 gwnRFfJpP0TLnYkRhLugl/6o354jZ271Rc/m3xbWIWk3FhK7mKFGMCEF7vtmmMHkDjhxrQ+zP
 OOiAkE5WZshi6qYmfDPoGqNd2wDwdsFOIUQCVQRZTa2SBmb4tRCmcXAvG3+Uycl8E9HC+HdFo
 QQl6auxkvreyKwUrEaXTb/vDVY/8zlrYigIvqvizY84tqQMApL/4WeejyLuCY7WtJAyvsMHxL
 /kuIm55iSEGYzjMQKQvPrBsh4Y2bDFWJN5tkPzR4FOrUmoHotgi8B+x9bb+OVPUinPoXYl7v5
 vI52ppIleLPtHCcS83Vr3aanwd4fIoTig7gcvXHI7LsU5sRZqVRXuE3YBOk444CRgUSK9dEWJ
 nnhFyRof2Iyb1H1Ey692rie8dQg8rJb/vZn/z8M8N6bXNZ+eD817X8Z/ifrmXicv6eyPtqzcR
 iwdyM1vXxNaDW3d22pgxRLB5b64=

The existing documentation of the legacy DVB Decoder API was incomplete.

Revising the documentation, adding missing parts and arranging the
documentation files new.

This patch contains the documentation of the data types defined in
video.h.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Changes since v3:
* Adjust title and description to better match existing documentation.


[PATCH v3] ------------------------------------------------------------

Possibly left overs from DVD-API ? :
 video_attributes_t
 VIDEO_CAP_SPU
 VIDEO_CAP_NAVI
 VIDEO_CAP_CSS
The only thing which is not in the documentation yet!
Can probably removed from header file too.

>> +
>> +video_stream_source_t
>> +---------------------
>> +
>> +The video stream source is set through the `VIDEO_SELECT_SOURCE`_ call
>> +and can take the following values, depending on whether we are replayi=
ng
>> +from an internal (demuxer) or external (user write) source.
>> +
>> +
>> +.. code-block:: c
>> +
>> +    typedef enum {
>> +	VIDEO_SOURCE_DEMUX, /* Select the demux as the main source */
>> +	VIDEO_SOURCE_MEMORY /* If this source is selected, the stream
>> +		       comes from the user through the write
>> +		       system call */
>> +    } video_stream_source_t;
>
> FYI, this carries the same problem as the audio one: this API is problem=
atic
> for modern hardware that has multiple tuners and demuxers. Setting up
> pipelines for audio and video decoding on modern hardware require a lot
> more than just demux/memory.

This kind of limitations are pretty well known for a while now, even to
normal users.
A good solution would be widely appreciated, I think.
Well, but back to topic ...


In case of the decoder we are are maybe lucky. One decoder with multiple
demuxers should theoretically already be possible without any changes.
The data fed to the decoder can be controlled by the PID filter output
selection DMX_OUT_DECODER.

There are existing multi tuner systems with one decoder controlled by this
API, but I don't know whether they do it this way or not.
A quick search wasn't very successful and at least the AV7110 should have
a hardware PID filter. More detailed research has to be done there to
answer the question.
However this topic is not directly part of the decoder API and I'm running
out of time, so I had to stop at this point.



 .../media/dvb/legacy_dvb_video.rst            | 798 ++++++++++++++++++
 1 file changed, 798 insertions(+)
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_video=
.rst

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst b/=
Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
new file mode 100644
index 000000000000..165fd6005a07
=2D-- /dev/null
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
@@ -0,0 +1,798 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later OR GPL-2.0
+
+.. c:namespace:: dtv.legacy.video
+
+.. _dvb_video:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+DVB Video Device
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+The DVB video device controls the MPEG2 video decoder of the DVB
+hardware. It can be accessed through ``/dev/dvb/adapter0/video0``. Data
+types and ioctl definitions can be accessed by including
+``linux/dvb/video.h`` in your application.
+
+Note that the DVB video device only controls decoding of the MPEG video
+stream, not its presentation on the TV or computer screen. On PCs this
+is typically handled by an associated video4linux device, e.g.
+``/dev/video``, which allows scaling and defining output windows.
+
+Most DVB cards don=E2=80=99t have their own MPEG decoder, which results i=
n the
+omission of the audio and video device as well as the video4linux
+device.
+
+These ioctls were also used by V4L2 to control MPEG decoders implemented
+in V4L2. The use of these ioctls for that purpose has been made obsolete
+and proper V4L2 ioctls or controls have been created to replace that
+functionality. Use :ref:`V4L2 ioctls<video>` for new drivers!
+
+
+Video Data Types
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+
+
+video_format_t
+--------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    typedef enum {
+	VIDEO_FORMAT_4_3,
+	VIDEO_FORMAT_16_9,
+	VIDEO_FORMAT_221_1
+    } video_format_t;
+
+Constants
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``VIDEO_FORMAT_4_3``
+
+       -  Select 4:3 format.
+
+    -  ..
+
+       -  ``VIDEO_FORMAT_16_9``
+
+       -  Select 16:9 format.
+
+    -  ..
+
+       -  ``VIDEO_FORMAT_221_1``
+
+       -  Select 2.21:1 format.
+
+Description
+~~~~~~~~~~~
+
+The ``video_format_t`` data type
+is used in the `VIDEO_SET_FORMAT`_ function to tell the driver which
+aspect ratio the output hardware (e.g. TV) has. It is also used in the
+data structures `video_status`_ returned by `VIDEO_GET_STATUS`_
+and `video_event`_ returned by `VIDEO_GET_EVENT`_ which report
+about the display format of the current video stream.
+
+
+-----
+
+
+video_displayformat_t
+---------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    typedef enum {
+	VIDEO_PAN_SCAN,
+	VIDEO_LETTER_BOX,
+	VIDEO_CENTER_CUT_OUT
+    } video_displayformat_t;
+
+Constants
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``VIDEO_PAN_SCAN``
+
+       -  Use pan and scan format.
+
+    -  ..
+
+       -  ``VIDEO_LETTER_BOX``
+
+       -  Use letterbox format.
+
+    -  ..
+
+       -  ``VIDEO_CENTER_CUT_OUT``
+
+       -  Use center cut out format.
+
+Description
+~~~~~~~~~~~
+
+In case the display format of the video stream and of the display
+hardware differ the application has to specify how to handle the
+cropping of the picture. This can be done using the
+`VIDEO_SET_DISPLAY_FORMAT`_ call which accepts this enum as argument.
+
+
+-----
+
+
+video_size_t
+------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    typedef struct {
+	int w;
+	int h;
+	video_format_t aspect_ratio;
+    } video_size_t;
+
+Variables
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int w``
+
+       -  Video width in pixels.
+
+    -  ..
+
+       -  ``int h``
+
+       -  Video height in pixels.
+
+    -  ..
+
+       -  `video_format_t`_ ``aspect_ratio``
+
+       -  Aspect ratio.
+
+Description
+~~~~~~~~~~~
+
+Used in the struct `video_event`_. It stores the resolution and
+aspect ratio of the video.
+
+
+-----
+
+
+video_stream_source_t
+---------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    typedef enum {
+	VIDEO_SOURCE_DEMUX,
+	VIDEO_SOURCE_MEMORY
+    } video_stream_source_t;
+
+Constants
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``VIDEO_SOURCE_DEMUX``
+
+       -  :cspan:`1` Select the demux as the main source.
+
+    -  ..
+
+       -  ``VIDEO_SOURCE_MEMORY``
+
+       -  If this source is selected, the stream
+          comes from the user through the write
+          system call.
+
+Description
+~~~~~~~~~~~
+
+The video stream source is set through the `VIDEO_SELECT_SOURCE`_ call
+and can take the following values, depending on whether we are replaying
+from an internal (demuxer) or external (user write) source.
+VIDEO_SOURCE_DEMUX selects the demultiplexer (fed either by the
+frontend or the DVR device) as the source of the video stream. If
+VIDEO_SOURCE_MEMORY is selected the stream comes from the application
+through the `write()`_ system call.
+
+
+-----
+
+
+video_play_state_t
+------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    typedef enum {
+	VIDEO_STOPPED,
+	VIDEO_PLAYING,
+	VIDEO_FREEZED
+    } video_play_state_t;
+
+Constants
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``VIDEO_STOPPED``
+
+       -  Video is stopped.
+
+    -  ..
+
+       -  ``VIDEO_PLAYING``
+
+       -  Video is currently playing.
+
+    -  ..
+
+       -  ``VIDEO_FREEZED``
+
+       -  Video is frozen.
+
+Description
+~~~~~~~~~~~
+
+This values can be returned by the `VIDEO_GET_STATUS`_ call
+representing the state of video playback.
+
+
+-----
+
+
+struct video_command
+--------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    struct video_command {
+	__u32 cmd;
+	__u32 flags;
+	union {
+	    struct {
+		__u64 pts;
+	    } stop;
+
+	    struct {
+		__s32 speed;
+		__u32 format;
+	    } play;
+
+	    struct {
+		__u32 data[16];
+	    } raw;
+	};
+    };
+
+
+Variables
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``__u32 cmd``
+
+       -  `Decoder command`_
+
+    -  ..
+
+       -  ``__u32 flags``
+
+       -  Flags for the `Decoder command`_.
+
+    -  ..
+
+       -  ``struct stop``
+
+       -  ``__u64 pts``
+
+       -  MPEG PTS
+
+    -  ..
+
+       -  :rspan:`5` ``stuct play``
+
+       -  :rspan:`4` ``__s32 speed``
+
+       -   0 or 1000 specifies normal speed,
+
+    -  ..
+
+       -   1:  specifies forward single stepping,
+
+    -  ..
+
+       -   -1: specifies backward single stepping,
+
+    -  ..
+
+       -   >1: playback at speed / 1000 of the normal speed
+
+    -  ..
+
+       -   <-1: reverse playback at ( -speed / 1000 ) of the normal speed=
.
+
+    -  ..
+
+       -  ``__u32 format``
+
+       -  `Play input formats`_
+
+    -  ..
+
+       -  ``__u32 data[16]``
+
+       -  Reserved
+
+Description
+~~~~~~~~~~~
+
+The structure must be zeroed before use by the application. This ensures
+it can be extended safely in the future.
+
+
+-----
+
+
+Predefined decoder commands and flags
+-------------------------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    #define VIDEO_CMD_PLAY                      (0)
+    #define VIDEO_CMD_STOP                      (1)
+    #define VIDEO_CMD_FREEZE                    (2)
+    #define VIDEO_CMD_CONTINUE                  (3)
+
+    #define VIDEO_CMD_FREEZE_TO_BLACK      (1 << 0)
+
+    #define VIDEO_CMD_STOP_TO_BLACK        (1 << 0)
+    #define VIDEO_CMD_STOP_IMMEDIATELY     (1 << 1)
+
+    #define VIDEO_PLAY_FMT_NONE                 (0)
+    #define VIDEO_PLAY_FMT_GOP                  (1)
+
+    #define VIDEO_VSYNC_FIELD_UNKNOWN           (0)
+    #define VIDEO_VSYNC_FIELD_ODD               (1)
+    #define VIDEO_VSYNC_FIELD_EVEN              (2)
+    #define VIDEO_VSYNC_FIELD_PROGRESSIVE       (3)
+
+Constants
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  :rspan:`3` _`Decoder command`
+
+       -  ``VIDEO_CMD_PLAY``
+
+       -  Start playback.
+
+    -  ..
+
+       -  ``VIDEO_CMD_STOP``
+
+       -  Stop playback.
+
+    -  ..
+
+       -  ``VIDEO_CMD_FREEZE``
+
+       -  Freeze playback.
+
+    -  ..
+
+       -  ``VIDEO_CMD_CONTINUE``
+
+       -  Continue playback after freeze.
+
+    -  ..
+
+       -  Flags for ``VIDEO_CMD_FREEZE``
+
+       -  ``VIDEO_CMD_FREEZE_TO_BLACK``
+
+       -  Show black picture on freeze.
+
+    -  ..
+
+       -  :rspan:`1` Flags for ``VIDEO_CMD_STOP``
+
+       -  ``VIDEO_CMD_STOP_TO_BLACK``
+
+       -  Show black picture on stop.
+
+    -  ..
+
+       -  ``VIDEO_CMD_STOP_IMMEDIATELY``
+
+       -  Stop immediately, without emptying buffers.
+
+    -  ..
+
+       -  :rspan:`1` _`Play input formats`
+
+       -  ``VIDEO_PLAY_FMT_NONE``
+
+       -  The decoder has no special format requirements
+
+    -  ..
+
+       -  ``VIDEO_PLAY_FMT_GOP``
+
+       -  The decoder requires full GOPs
+
+    -  ..
+
+       -  :rspan:`3` Field order
+
+       -  ``VIDEO_VSYNC_FIELD_UNKNOWN``
+
+       -  FIELD_UNKNOWN can be used if the hardware does not know
+          whether the Vsync is for an odd, even or progressive
+          (i.e. non-interlaced) field.
+
+    -  ..
+
+       -  ``VIDEO_VSYNC_FIELD_ODD``
+
+       -  Vsync is for an odd field.
+
+    -  ..
+
+       -  ``VIDEO_VSYNC_FIELD_EVEN``
+
+       -  Vsync is for an even field.
+
+    -  ..
+
+       -  ``VIDEO_VSYNC_FIELD_PROGRESSIVE``
+
+       -  progressive (i.e. non-interlaced)
+
+
+-----
+
+
+video_event
+-----------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    struct video_event {
+	__s32 type;
+    #define VIDEO_EVENT_SIZE_CHANGED        1
+    #define VIDEO_EVENT_FRAME_RATE_CHANGED  2
+    #define VIDEO_EVENT_DECODER_STOPPED     3
+    #define VIDEO_EVENT_VSYNC               4
+	long timestamp;
+	union {
+	    video_size_t size;
+	    unsigned int frame_rate;
+	    unsigned char vsync_field;
+	} u;
+    };
+
+Variables
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  :rspan:`4` ``__s32 type``
+
+       -  :cspan:`1` Event type.
+
+    -  ..
+
+       -  ``VIDEO_EVENT_SIZE_CHANGED``
+
+       -  Size changed.
+
+    -  ..
+
+       -  ``VIDEO_EVENT_FRAME_RATE_CHANGED``
+
+       -  Framerate changed.
+
+    -  ..
+
+       -  ``VIDEO_EVENT_DECODER_STOPPED``
+
+       -  Decoder stopped.
+
+    -  ..
+
+       -  ``VIDEO_EVENT_VSYNC``
+
+       -  Vsync occurred.
+
+    -  ..
+
+       -  ``long timestamp``
+
+       -  :cspan:`1` MPEG PTS at occurrence.
+
+    -  ..
+
+       -  :rspan:`2` ``union u``
+
+       -  `video_size_t`_ size
+
+       -  Resolution and aspect ratio of the video.
+
+    -  ..
+
+       -  ``unsigned int frame_rate``
+
+       -  in frames per 1000sec
+
+    -  ..
+
+       -  ``unsigned char vsync_field``
+
+       -  | unknown / odd / even / progressive
+          | See: `Predefined decoder commands and flags`_
+
+Description
+~~~~~~~~~~~
+
+This is the structure of a video event as it is returned by the
+`VIDEO_GET_EVENT`_ call. See there for more details.
+
+
+-----
+
+
+video_status
+------------
+
+Synopsis
+~~~~~~~~
+
+The `VIDEO_GET_STATUS`_ call returns the following structure informing
+about various states of the playback operation.
+
+.. code-block:: c
+
+    struct video_status {
+	int                    video_blank;
+	video_play_state_t     play_state;
+	video_stream_source_t  stream_source;
+	video_format_t         video_format;
+	video_displayformat_t  display_format;
+    };
+
+Variables
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  :rspan:`2` ``int video_blank``
+
+       -  :cspan:`1` Show blank video on freeze?
+
+    -  ..
+
+       -  TRUE  ( !=3D 0 )
+
+       -  Blank screen when freeze.
+
+    -  ..
+
+       -  FALSE ( =3D=3D 0 )
+
+       -  Show last decoded frame.
+
+    -  ..
+
+       -  `video_play_state_t`_ ``play_state``
+
+       -  Current state of playback.
+
+    -  ..
+
+       -  `video_stream_source_t`_ ``stream_source``
+
+       -  Current source (demux/memory).
+
+    -  ..
+
+       -  `video_format_t`_ ``video_format``
+
+       -  Current aspect ratio of stream.
+
+    -  ..
+
+       -  `video_displayformat_t`_ ``display_format``
+
+       -  Applied cropping mode.
+
+Description
+~~~~~~~~~~~
+
+If ``video_blank`` is set ``TRUE`` video will be blanked out if the
+channel is changed or if playback is stopped. Otherwise, the last picture
+will be displayed. ``play_state`` indicates if the video is currently
+frozen, stopped, or being played back. The ``stream_source`` corresponds
+to the selected source for the video stream. It can come either from the
+demultiplexer or from memory. The ``video_format`` indicates the aspect
+ratio (one of 4:3 or 16:9) of the currently played video stream.
+Finally, ``display_format`` corresponds to the applied cropping mode in
+case the source video format is not the same as the format of the output
+device.
+
+
+-----
+
+
+video_still_picture
+-------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    struct video_still_picture {
+    char *iFrame;
+    int32_t size;
+    };
+
+Variables
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``char *iFrame``
+
+       -  Pointer to a single iframe in memory.
+
+    -  ..
+
+       -  ``int32_t size``
+
+       -  Size of the iframe.
+
+
+Description
+~~~~~~~~~~~
+
+An I-frame displayed via the `VIDEO_STILLPICTURE`_ call is passed on
+within this structure.
+
+
+-----
+
+
+video capabilities
+------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    #define VIDEO_CAP_MPEG1   1
+    #define VIDEO_CAP_MPEG2   2
+    #define VIDEO_CAP_SYS     4
+    #define VIDEO_CAP_PROG    8
+
+Constants
+~~~~~~~~~
+Bit definitions for capabilities:
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``VIDEO_CAP_MPEG1``
+
+       -  :cspan:`1` The hardware can decode MPEG1.
+
+    -  ..
+
+       -  ``VIDEO_CAP_MPEG2``
+
+       -  The hardware can decode MPEG2.
+
+    -  ..
+
+       -  ``VIDEO_CAP_SYS``
+
+       -  The video device accepts system stream.
+
+          You still have to open the video and the audio device
+          but only send the stream to the video device.
+
+    -  ..
+
+       -  ``VIDEO_CAP_PROG``
+
+       -  The video device accepts program stream.
+
+          You still have to open the video and the audio device
+          but only send the stream to the video device.
+
+Description
+~~~~~~~~~~~
+
+A call to `VIDEO_GET_CAPABILITIES`_ returns an unsigned integer with the
+following bits set according to the hardware's capabilities.
=2D-
2.34.0


