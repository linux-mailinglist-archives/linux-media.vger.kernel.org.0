Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A44EC755955
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 04:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjGQCFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 22:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjGQCFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 22:05:34 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9D2E54
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 19:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
 s=s31663417; t=1689559513; x=1690164313; i=herdler@nurfuerspam.de;
 bh=sZTEgP7BqvTzPt3tLwGoXfs/8ByTdpc5bJK1e4QRKUg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Lt1jF3LWTCCrjemLRBAkbpC8UK9PVBk7WQUkZ3nXbe+/cPClj5HxbtUZPdd7JCMOrjsUNS4
 sGco9azoThAWtXZP5J/+SkFWCkCvsa3ZW8ZsTrg7t0x80wIa3M35+rrYhGcZ1XMblE6So4hdN
 cC/QMqXBA/lqG2IYOZNTna5UQLqwtKxWBmupMHledchbVDlkv5ktQFBm46Ls1lDGyyhcVvzfc
 hx6ViRDi1OJWOMiT9OjAo3zgM7pfDGyNhbk9cukdNHYRy80z8k6Mmv4976oesC70vu6tNbVYd
 w5cqGy4xWNiiVJEirR9P9Yfsm55Hc6DnkjF2gSkRSEeC//7Oc6tQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.179.15]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHXBp-1q8HBR3NnF-00DVHK; Mon, 17
 Jul 2023 04:05:12 +0200
From:   Stefan Herdler <herdler@nurfuerspam.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: [PATCH v3 5/6] Add documentation for video.h (data types)
Date:   Mon, 17 Jul 2023 04:04:45 +0200
Message-Id: <20230717020446.28877-6-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20230717020446.28877-1-herdler@nurfuerspam.de>
References: <20230717020446.28877-1-herdler@nurfuerspam.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TOh6xpxLGlcajBXqNbDVf8Lb32jOievJLj41KO8jl8kXTUypo3P
 ga9wEm40r55Dp/zzadz8q1Ke1C4kAHqztpSV1c1d9pPwLp+TPieqca9C4BcKXdPVGWP88j9
 DK9+FHW+GXbvIwfZcGy+WvcpTE905WUk8OKiNONZSnavaDRqqxmL2j7Fj1i2qY+yJ/tRaN+
 62e18niOeteNJk3ykidlQ==
UI-OutboundReport: notjunk:1;M01:P0:LbiRKAGihis=;yJdoHiNLgxVu4PqMpHhI2kxz0LH
 YCA1DPnex//Y5rdfXqrSTWZknYBbb4mFwNGOUJA0uLTlTFmAVpxL8EeatvMjurtFpsndJQIUU
 6MZfRHihoRSnTQufHr88sNETO5hKUlyOGXN6PLoQjxiMlkKjje+yyEZdtZi00k85Ibo09KStx
 /i8rIeCKwGbCiqmpMWPkIste2eaIdySn2YOtpMP+kUc7gASxrSHgGTxaT2UBW0zZH3+yZ0WYq
 Y51LVhXNTT6poUqZH2eXDsxxJcQglUfv2qCjnpTqaJdc4YmSIMJdVP4NdElv8y+Lr8UUX3BPe
 dxQkjAfZKHGKvq+O/S2o+mmWrquWR4IRxRWGMbKnvb1vYMlnsT8X+cXwOeZ7yXZAn5xacVboS
 A7RsSbu/rhfjQ8mRD/rZM8mPYtvp5SnJuNODCpOBq2483dd5zIsOtaXITeTVI+t7Dkc+aNgz8
 eQaUKFo045yoXNa93n8pAEb61p6UktRCoAvMrjG2mXOqRPBSGoNgR2UI7N/Scf5ZA/sSI8Bfv
 p0Ijcr4Q8Z5DlySrxGqTppGxCFETfnpGll/ptQo1TEsfPF1zgY05LDBtusQuWrgwU4L30pfCv
 25WQTHVCTCOthGfdWNXzy/wIj2x1hCnrw6sC9u1I8XpsnweWeVVWeHoeDMxJ82gXOgvTlI06E
 I5kwsdvPNEXa8Yx7G6lS63Lfulp7WGYFNDMw7Q5anPxcaZMMrHXPCfbUsz5XM+vEeOSLizeY5
 QVnoez7T6h+eRT3GJyaUDivsQKgZ4Qa9zUg5scGrFFW/1Q6UUzu8yQ83PXeLq0q4//KUk7DH/
 kD6B4BgdbcHHBCOL0t1XMMDy06oGyzeC3V7ITzRHiHk87Nncj3YNaNDc9iVUmG0sDSvpaauJ1
 Bo01Qjvv6v2ixR4D6aGlhlyt1ArzRewzEkrWYm6DsYDmu2h0ys69Ns1LLN4CwkdRZQIPOVmq4
 oT0rktKnoe44/VKsOmRzxO2MbkM=
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NO_DNS_FOR_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new documentation file for video.h
Step 1: data types only

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Possibly left overs from DVD-API ? :
video_attributes_t
VIDEO_CAP_SPU
VIDEO_CAP_NAVI
VIDEO_CAP_CSS



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
I remember some DVB-cards, where, due to hardware limitations, only a
fraction of the tuners can be active simultaneously.
The user had to chose the active tuners while loading the driver. Which is
definitely not a ideal solution, because changing the reception path
without reloading the driver isn't possible.
A real solution would be widely appreciated, I think.
Well, but back to topic ...


In case of the decoder we are are maybe lucky. One decoder with multiple
demuxers should theoretically already be possible without any changes.
The data fed to the decoder can be controlled by the PID filter output
selection DMX_OUT_DECODER.

There are existing multi tuner systems with one decoder controlled by this
API, but I don't know whether they do it this way or not.
A quick search wasn't very successful and at least the AV7110 should have
a hardware PID filter. More detailed research has to be done there.
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

