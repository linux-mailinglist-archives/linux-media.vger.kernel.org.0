Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38BCA755952
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 04:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjGQCFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 22:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjGQCF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 22:05:29 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245DC9D
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 19:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
 s=s31663417; t=1689559512; x=1690164312; i=herdler@nurfuerspam.de;
 bh=Kss5ubkzTmur5RmuyIrKijs5qjP5XaPUNd6sW7J8Q7M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TNU4q0t2LHYs4EfLv7+RxtwL33YAzF06fc75YlkUZVxSI0akTI7k1PTGG2VDQIFEE2IwdJU
 ls4Xz5aRF3lGDd5BV4poA21+qcFvwlqIC3CxwUG9NByusGgPQoxGOfgnkDY921gxRO+HmT1s7
 V6kHQO00YpBz7J/EjtYWjsQPg8s5M0BSSpYlJmb4X/HSOD+S80btUYHNJsrz7UeQOrmeBxcjn
 2P6Lfbcru7OEooEWI1Odx8Yh1iy7O0zZTM720I+SAWbYJu8jRJiEcuhtxH1aOOr3yhSt1MaKU
 Jtz7QRVUwt6uTQyW5RyjHaZUe2lxF0JcnSupb5GHmcESHZnGWvng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.179.15]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zBb-1pr9yN11b1-0153hc; Mon, 17
 Jul 2023 04:05:12 +0200
From:   Stefan Herdler <herdler@nurfuerspam.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: [PATCH v3 3/6] Add documentation for audio.h (data types)
Date:   Mon, 17 Jul 2023 04:04:43 +0200
Message-Id: <20230717020446.28877-4-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20230717020446.28877-1-herdler@nurfuerspam.de>
References: <20230717020446.28877-1-herdler@nurfuerspam.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZTx7sbSeHZyo7TNbVAA19K7daQMirKbHvUWaRKkdWA/7b8SIbE0
 ympILij097PEsEHHQ3veKghBMxU9FCrm9wIXyCxHD3/U8xn6GVgRPpdB3HqvDeXsibh0TSE
 sjvgn03MqaOOFtPmtTHs+E0mrCE/v4oAAG7ZA1Lg7jHmhakeVza2wVERGNJlfyGSNnUYeWz
 IeobN421Fz6jm1tCaZ+Pg==
UI-OutboundReport: notjunk:1;M01:P0:ayySXucW28o=;l/skPjbCBsXB6ks6nERHjCTYxpX
 VKePwRh/qD0Bnl+YHeIpuFXO9igBF+yqB22dYQU0BeXJtXgwc7oWexlRO13t7FHDsljmgxaXw
 ymVx9jR1NuKBAosuYILke9G+wP+VFzbz9TfdMHL+4p7U+dxKXpn6xExFNLp2VFEWKbP9Rv6s3
 w0mOVJR6OePAZCknIZ6HW0ouWkpRq66EJ75WBG+d2+yVtmsWFTb9EHmz3c0OgOsp7q97XJdzw
 wR7delkcOBmZuYwyjJ/iR2bqdqJW/3JCDqDP6ItBv9Wl3s3orIQjFhsRtBsCFzv5lQFfHvANk
 JbinuxNaHfJnpAog1Xm4nQjY9JFIrUZPbA43U6uPc9atchOka4SE86CE7jxjN/HjMVQiwSVDc
 UKvEfdbTn5TuvCmgS67nnoGZTdw7JV47rYb5cXZYd8LG9h+txGhJH1mAi5xQYENftKiaAENC/
 LCpjSyRGwOwxn4pJVD0WdwzPI2PHNX8/rJCZffoE6b1fpHVqKuzGOCB8+48ec5zV3fby1d+5/
 r9IfEwPttrShj6n8Va7InzRdNDzDG5MdR4duJbukb0UfdFS8F0X2mKT6SCNsgWAWK+OWKdIhZ
 cxNTcr7csEAwV2yDtrFDk0zmF08n1rLNDHqqhs2A9Fxod3W6BVYOQZ+KjGigWl2Dq7x2HI26v
 /hArrQ/a+4KAfE/gE6AtvqfB4rNmxOshmDaJiide5PfxZSdJxYZRNQ9w3YoLr256FHQPdw5Sn
 dTrPRR3eOXBj5tYqkyaHPfwVDshdJGg8+3XQfYBS8DeUx9VKJM/IHwmocVBWgJ2Kl1NPlEXF3
 hk/oJMjm2uCW1jpES2slq+SqgzzdTjVwwXHke8yk1COyStfgG3R7GTwLakFPpbCTLnj014KpI
 dzGFEJlqSSpRS6set8ZqLGFe6RMpFbsZPNPKBZx2wcOSXRaXXkgoQ4xAbXB3/4+sofCo9csQ7
 BqmVI/BZzdFimF55TKHT2kwOr4k=
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,URIBL_ABUSE_SURBL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new documentation file for audio.h
Step 1: data types only

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 .../media/dvb/legacy_dvb_audio.rst            | 447 ++++++++++++++++++
 1 file changed, 447 insertions(+)
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_audio=
.rst

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/=
Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
new file mode 100644
index 000000000000..4c994f8c97e5
=2D-- /dev/null
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
@@ -0,0 +1,447 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later OR GPL-2.0
+
+.. c:namespace:: dtv.legacy.audio
+
+.. _dvb_audio:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+DVB Audio Device
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+The DVB audio device controls the MPEG2 audio decoder of the DVB
+hardware. It can be accessed through ``/dev/dvb/adapter?/audio?``. Data
+types and ioctl definitions can be accessed by including
+``linux/dvb/audio.h`` in your application.
+
+Please note that most DVB cards don=E2=80=99t have their own MPEG decoder=
, which
+results in the omission of the audio and video device.
+
+These ioctls were also used by V4L2 to control MPEG decoders implemented
+in V4L2. The use of these ioctls for that purpose has been made obsolete
+and proper V4L2 ioctls or controls have been created to replace that
+functionality. Use :ref:`V4L2 ioctls<video>` for new drivers!
+
+
+Audio Data Types
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This section describes the structures, data types and defines used when
+talking to the audio device.
+
+
+-----
+
+
+audio_stream_source_t
+---------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:enum:: audio_stream_source_t
+
+.. code-block:: c
+
+    typedef enum {
+    AUDIO_SOURCE_DEMUX,
+    AUDIO_SOURCE_MEMORY
+    } audio_stream_source_t;
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
+       -  ``AUDIO_SOURCE_DEMUX``
+
+       -  :cspan:`1` Selects the demultiplexer (fed either by the fronten=
d
+          or the DVR device) as the source of the video stream.
+
+    -  ..
+
+       -  ``AUDIO_SOURCE_MEMORY``
+
+       -  Selects the stream from the application that comes through
+          the `write()`_ system call.
+
+Description
+~~~~~~~~~~~
+
+The audio stream source is set through the `AUDIO_SELECT_SOURCE`_ call
+and can take the following values, depending on whether we are replaying
+from an internal (demux) or external (user write) source.
+
+The data fed to the decoder is also controlled by the PID-filter.
+Output selection: :c:enum:`dmx_output` ``DMX_OUT_DECODER``.
+
+
+-----
+
+
+audio_play_state_t
+------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:enum:: audio_play_state_t
+
+.. code-block:: c
+
+    typedef enum {
+	AUDIO_STOPPED,
+	AUDIO_PLAYING,
+	AUDIO_PAUSED
+    } audio_play_state_t;
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
+       -  ``AUDIO_STOPPED``
+
+       -  Audio is stopped.
+
+    -  ..
+
+       -  ``AUDIO_PLAYING``
+
+       -  Audio is currently playing.
+
+    -  ..
+
+       -  ``AUDIO_PAUSE``
+
+       -  Audio is frozen.
+
+Description
+~~~~~~~~~~~
+
+This values can be returned by the `AUDIO_GET_STATUS`_ call
+representing the state of audio playback.
+
+
+-----
+
+
+audio_channel_select_t
+----------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:enum:: audio_channel_select_t
+
+.. code-block:: c
+
+    typedef enum {
+	AUDIO_STEREO,
+	AUDIO_MONO_LEFT,
+	AUDIO_MONO_RIGHT,
+	AUDIO_MONO,
+	AUDIO_STEREO_SWAPPED
+    } audio_channel_select_t;
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
+       -  ``AUDIO_STEREO``
+
+       -  Stereo.
+
+    -  ..
+
+       -  ``AUDIO_MONO_LEFT``
+
+       -  Mono, select left stereo channel as source.
+
+    -  ..
+
+       -  ``AUDIO_MONO_RIGHT``
+
+       -  Mono, select right stereo channel as source.
+
+    -  ..
+
+       -  ``AUDIO_MONO``
+
+       -  Mono source only.
+
+    -  ..
+
+       -  ``AUDIO_STEREO_SWAPPED``
+
+       -  Stereo, swap L & R.
+
+Description
+~~~~~~~~~~~
+
+The audio channel selected via `AUDIO_CHANNEL_SELECT`_ is determined by
+this values.
+
+
+-----
+
+
+audio_mixer_t
+-------------
+
+Synopsis
+~~~~~~~~
+
+.. c:struct:: audio_mixer
+
+.. code-block:: c
+
+    typedef struct audio_mixer {
+	unsigned int volume_left;
+	unsigned int volume_right;
+    } audio_mixer_t;
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
+       -  ``unsigned int volume_left``
+
+       -  Volume left channel.
+          Valid range: 0 ... 255
+
+    -  ..
+
+       -  ``unsigned int volume_right``
+
+       -  Volume right channel.
+          Valid range: 0 ... 255
+
+Description
+~~~~~~~~~~~
+
+This structure is used by the `AUDIO_SET_MIXER`_ call to set the
+audio volume.
+
+
+-----
+
+
+audio_status
+------------
+
+Synopsis
+~~~~~~~~
+
+.. c:struct:: audio_status
+
+.. code-block:: c
+
+    typedef struct audio_status {
+	int AV_sync_state;
+	int mute_state;
+	audio_play_state_t play_state;
+	audio_stream_source_t stream_source;
+	audio_channel_select_t channel_select;
+	int bypass_mode;
+	audio_mixer_t mixer_state;
+    } audio_status_t;
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
+       -  :rspan:`2` ``int AV_sync_state``
+
+       -  :cspan:`1` Shows if A/V synchronization is ON or OFF.
+
+    -  ..
+
+       -  TRUE  ( !=3D 0 )
+
+       -  AV-sync ON.
+
+    -  ..
+
+       -  FALSE ( =3D=3D 0 )
+
+       -  AV-sync OFF.
+
+    -  ..
+
+       -  :rspan:`2` ``int mute_state``
+
+       -  :cspan:`1` Indicates if audio is muted or not.
+
+    -  ..
+
+       -  TRUE  ( !=3D 0 )
+
+       -  mute audio
+
+    -  ..
+
+       -  FALSE ( =3D=3D 0 )
+
+       -  unmute audio
+
+    -  ..
+
+       -  `audio_play_state_t`_ ``play_state``
+
+       -  Current playback state.
+
+    -  ..
+
+       -  `audio_stream_source_t`_ ``stream_source``
+
+       -  Current source of the data.
+
+    -  ..
+
+       -  :rspan:`2` ``int bypass_mode``
+
+       -  :cspan:`1` Is the decoding of the current Audio stream in
+          the DVB subsystem enabled or disabled.
+
+    -  ..
+
+       -  TRUE  ( !=3D 0 )
+
+       -  Bypass disabled.
+
+    -  ..
+
+       -  FALSE ( =3D=3D 0 )
+
+       -  Bypass enabled.
+
+    -  ..
+
+       -  `audio_mixer_t`_ ``mixer_state``
+
+       -  Current volume settings.
+
+Description
+~~~~~~~~~~~
+
+The `AUDIO_GET_STATUS`_ call returns this structure as information
+about various states of the playback operation.
+
+
+-----
+
+
+audio encodings
+---------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+     #define AUDIO_CAP_DTS    1
+     #define AUDIO_CAP_LPCM   2
+     #define AUDIO_CAP_MP1    4
+     #define AUDIO_CAP_MP2    8
+     #define AUDIO_CAP_MP3   16
+     #define AUDIO_CAP_AAC   32
+     #define AUDIO_CAP_OGG   64
+     #define AUDIO_CAP_SDDS 128
+     #define AUDIO_CAP_AC3  256
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
+       -  ``AUDIO_CAP_DTS``
+
+       -  :cspan:`1` The hardware accepts DTS audio tracks.
+
+    -  ..
+
+       -  ``AUDIO_CAP_LPCM``
+
+       -   The hardware accepts uncompressed audio with
+           Linear Pulse-Code Modulation (LPCM)
+
+    -  ..
+
+       -  ``AUDIO_CAP_MP1``
+
+       -  The hardware accepts MPEG-1 Audio Layer 1.
+
+    -  ..
+
+       -  ``AUDIO_CAP_MP2``
+
+       -  The hardware accepts MPEG-1 Audio Layer 2.
+          Also known as MUSICAM.
+
+    -  ..
+
+       -  ``AUDIO_CAP_MP3``
+
+       -  The hardware accepts MPEG-1 Audio Layer III.
+          Commomly known as .mp3.
+
+    -  ..
+
+       -  ``AUDIO_CAP_AAC``
+
+       -  The hardware accepts AAC (Advanced Audio Coding).
+
+    -  ..
+
+       -  ``AUDIO_CAP_OGG``
+
+       -  The hardware accepts Vorbis audio tracks.
+
+    -  ..
+
+       -  ``AUDIO_CAP_SDDS``
+
+       -  The hardware accepts Sony Dynamic Digital Sound (SDDS).
+
+    -  ..
+
+       -  ``AUDIO_CAP_AC3``
+
+       -  The hardware accepts Dolby Digital ATSC A/52 audio.
+          Also known as AC-3.
+
+Description
+~~~~~~~~~~~
+
+A call to `AUDIO_GET_CAPABILITIES`_ returns an unsigned integer with the
+following bits set according to the hardwares capabilities.
=2D-
2.34.0

