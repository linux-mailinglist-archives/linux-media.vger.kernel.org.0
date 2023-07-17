Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3930755958
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 04:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbjGQCFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 22:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjGQCFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 22:05:34 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471ECE56
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 19:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
 s=s31663417; t=1689559512; x=1690164312; i=herdler@nurfuerspam.de;
 bh=zpPEwoLIr/iNiPbNtEcE5ZhXxxruNZ+mE/4Gbi8nV3Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=rV3mSN915c1l3PzGsningE+Hik8t7axsJhHI0aN6UcxpJrHWwe9uNEr5wrGzM5V3w8Xa+BK
 IPYIMhTeahnhcUcXF/RwNIoko5o4wQCtz9tZiZN00aF5OYuqU+GYdcVr9/8FLSBZbfn4a4+LX
 1f+FnJZdDD7eRe1obpWR1JbUaJxO6Gtf4gwHplzTy4rl5B0okqz7v9I9l6uxx4ZuLPcMotzFs
 cJTZ4ath8IYxbH7SvvBl5hs2zy7zzqozB5AmGfnj3Z7tUcYVK7biJtYkuSszaH0NAnNgT+PV4
 L5gifmcJDv6bKQMG+MQq061D9e/vJtbTyiTWZt8sGpmNSc/akeZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.179.15]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6lpG-1qIV78298Q-008ItF; Mon, 17
 Jul 2023 04:05:12 +0200
From:   Stefan Herdler <herdler@nurfuerspam.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: [PATCH v3 4/6] Add documentation for audio.h (function calls)
Date:   Mon, 17 Jul 2023 04:04:44 +0200
Message-Id: <20230717020446.28877-5-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20230717020446.28877-1-herdler@nurfuerspam.de>
References: <20230717020446.28877-1-herdler@nurfuerspam.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ao8J8m3ShWYI4m+ivYmupt8np2B1oSESb3V59fFU/WfZouwem2N
 uJFZLD11NnoEVBIt1dV8OUiVO3mtaijfTJVwe4+t2XtvgQ89l3O/8JbSL6vU1iuuKlJMXyO
 Chyc5AJ/whA7rSDVBR9Kn0fZxZOEy+TxWHMe7JQSbikJwsg4ZzPYC9XeWF4kaz9gFni2gjX
 zQEtEC2I7ZNdLZM/hEFlg==
UI-OutboundReport: notjunk:1;M01:P0:4Djc9HzJiP8=;5G6XjQBlu+j7hNYpKriXdcvgvmP
 BdWlC+AYFmUTbG8Myydjhks14JsTWd1lN28F1EIXQI6xoG8OEcs3we6bN2iwL8ct32DC6SZzw
 1g/iWGhbODiH8Ook98vFWAlZBLEtN3uDOqBb0GZLhnpCRABltKC0DNAuEjAlRtwSbXMR0SGxB
 cxmT3t+DSBsEYb3nr6WLoTE4C72QHypJvWnx+i/gDIN2dN/HI0NC826P7ZjoT4DU3Tp/TcIXz
 u6HEhPezG5MrDVuGr2SNRFLTf83yjKBv7H0zBXx9x50TqGcXTbuopfVFEq/8TVpnxKte5orRk
 GteU8c5Z8xqm+jbg3fbrb/0rZP6DGHyK8dbLVtJUfuPuOVOf7JaMyOe8ZzFN8NE0XIT6b0Jq7
 SU+qoRA3+lwHGT1qkELhdJvKnx/u6AHCCNgVJ/bAWkeDN4z6eHFHu89hZz0fRtozqeeGzbZ7W
 RcXwJM/G6ClgMe+VJUFbWItcCNUXLmx3aG61UO7u5ZJCyU+nxZhhQEhRZYbReY8PfROi+9dO1
 ciP6sQDpUabUTDUKeeJiSXlszlVlEffuKqZnYkZ0YMvQoBN4h0A5dJV81tI4Q/9GTiGW229up
 ssdSR3mCO7G3UFJRMpvhC4icOJB50pRnmYuDe5BSJEqAxo3jOC25bljNssWFrdnZ2jgdKGfqe
 qomK+FVUtY9j+gY4eK0A4+b5UIsVwB2y+5t0SoQ4WF8YwwYWGebdq+10m337g/NjqjIpuVil+
 XGg4nBy8ctmiVW31b4pY1ue2Qtexz+f70KXN4oxHZ4/BxSVSmnXHt5U7eNr/Kzcar4OJ4+No/
 YCubRtWfqeq0mKZ+ve0E5L8wAswaOt6hAZ/wKgoHJY2FeIzgN4qqnCe1Yf1yitCFuU9nfI5sc
 eF/thnvTDvnocCJOJOOjNXD5Q28ppjQQ9SzXN7j7yhamxyGY+b7y6S/DIkYZPZ4RBlmJMs7XW
 DHQhDZAzc+mH6xSnleJ+Ara9Pew=
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NO_DNS_FOR_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Step 2: Add documentation for function calls.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Possibly unused:
AUDIO_SET_ID
AUDIO_SET_STREAMTYPE
AUDIO_BILINGUAL_CHANNEL_SELECT



> +
> +AUDIO_SET_ID
> +------------
> +
> +AUDIO_SET_STREAMTYPE
> +--------------------
This ioctls are dealing with stream types and IDs defined in
ITU-T H.222.0. The intention is pretty clear when reading the introduction
of Annex Q there.
However this ioctls doesn't seem to be used anywhere.



>> +
>> +AUDIO_BILINGUAL_CHANNEL_SELECT
>> +------------------------------
>> +
>
[...]
>
> IMO, this is also another problematic API. Its name seems to be related
> to language selection. However, multi-language usually uses different
> PIDs. Maybe in the past they used to place two languages at the same
> PID, one at the left channel and the other at the right one?

It seems to be intended this way.
This kind multi-language was popular in the beginning of DVB, but it has
been mostly replaced by multiple PIDs.

The AV7110 uses AUDIO_CHANNEL_SELECT for the same purpose.
This 2 ioctls look redundant to me and AUDIO_BILINGUAL_CHANNEL_SELECT
doesn't seem to be used at all.



 .../media/dvb/legacy_dvb_audio.rst            | 1195 +++++++++++++++++
 1 file changed, 1195 insertions(+)

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/=
Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
index 4c994f8c97e5..45d330c33caf 100644
=2D-- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
@@ -445,3 +445,1198 @@ Description

 A call to `AUDIO_GET_CAPABILITIES`_ returns an unsigned integer with the
 following bits set according to the hardwares capabilities.
+
+
+-----
+
+
+Audio Function Calls
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+
+AUDIO_STOP
+----------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_STOP
+
+.. code-block:: c
+
+	 int ioctl(int fd, int request =3D AUDIO_STOP)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  File descriptor returned by a previous call to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  :cspan:`1` Equals ``AUDIO_STOP`` for this command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Audio Device to stop playing the current
+stream.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_PLAY
+----------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_PLAY
+
+.. code-block:: c
+
+	 int  ioctl(int fd, int request =3D AUDIO_PLAY)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  File descriptor returned by a previous call to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  :cspan:`1` Equals ``AUDIO_PLAY`` for this command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Audio Device to start playing an audio stream
+from the selected source.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_PAUSE
+-----------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_PAUSE
+
+.. code-block:: c
+
+	 int  ioctl(int fd, int request =3D AUDIO_PAUSE)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_PAUSE`` for this command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call suspends the audio stream being played. Decoding and
+playing are paused. It is then possible to restart again decoding and
+playing process of the audio stream using `AUDIO_CONTINUE`_ command.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_CONTINUE
+--------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_CONTINUE
+
+.. code-block:: c
+
+	 int  ioctl(int fd, int request =3D AUDIO_CONTINUE)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_CONTINUE`` for this command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl restarts the decoding and playing process previously paused
+with `AUDIO_PAUSE`_ command.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_SELECT_SOURCE
+-------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_SELECT_SOURCE
+
+.. code-block:: c
+
+	 int ioctl(int fd, int request =3D AUDIO_SELECT_SOURCE,
+	 audio_stream_source_t source)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_SELECT_SOURCE`` for this command.
+
+    -  ..
+
+       -  `audio_stream_source_t`_ ``source``
+
+       -  Indicates the source that shall be used for the Audio stream.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call informs the audio device which source shall be used for
+the input data. The possible sources are demux or memory. If
+``AUDIO_SOURCE_MEMORY`` is selected, the data is fed to the Audio Device
+through the write command. If ``AUDIO_SOURCE_DEMUX`` is selected, the dat=
a
+is directly transferred from the onboard demux-device to the decoder.
+Note: This only supports DVB-devices with one demux and one decoder so fa=
r.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_SET_MUTE
+--------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_SET_MUTE
+
+.. code-block:: c
+
+	 int  ioctl(int fd, int request =3D AUDIO_SET_MUTE, int state)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  :cspan:`1` Equals ``AUDIO_SET_MUTE`` for this command.
+
+    -  ..
+
+       -  :rspan:`2` ``int state``
+
+       -  :cspan:`1` Indicates if audio device shall mute or not.
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
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl is for DVB devices only. To control a V4L2 decoder use the
+V4L2 :ref:`VIDIOC_DECODER_CMD` with the
+``V4L2_DEC_CMD_START_MUTE_AUDIO`` flag instead.
+
+This ioctl call asks the audio device to mute the stream that is
+currently being played.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_SET_AV_SYNC
+-----------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_SET_AV_SYNC
+
+.. code-block:: c
+
+	 int  ioctl(int fd, int request =3D AUDIO_SET_AV_SYNC, int state)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  :cspan:`1` Equals ``AUDIO_AV_SYNC`` for this command.
+
+    -  ..
+
+       -  :rspan:`2` ``int state``
+
+       -  :cspan:`1` Tells the DVB subsystem if A/V synchronization
+          shall be ON or OFF.
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
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Audio Device to turn ON or OFF A/V
+synchronization.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_SET_BYPASS_MODE
+---------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_SET_BYPASS_MODE
+
+.. code-block:: c
+
+	 int ioctl(int fd, int request =3D AUDIO_SET_BYPASS_MODE, int mode)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  :cspan:`1` Equals ``AUDIO_SET_BYPASS_MODE`` for this command.
+
+    -  ..
+
+       -  :rspan:`2` ``int mode``
+
+       -  :cspan:`1` Enables or disables the decoding of the current
+          Audio stream in the DVB subsystem.
+    -  ..
+
+       -  TRUE  ( !=3D 0 )
+
+       -  Disable bypass
+
+    -  ..
+
+       -  FALSE ( =3D=3D 0 )
+
+       -  Enable bypass
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Audio Device to bypass the Audio decoder and
+forward the stream without decoding. This mode shall be used if streams
+that can=E2=80=99t be handled by the DVB system shall be decoded. Dolby
+DigitalTM streams are automatically forwarded by the DVB subsystem if
+the hardware can handle it.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_CHANNEL_SELECT
+--------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_CHANNEL_SELECT
+
+.. code-block:: c
+
+	 int ioctl(int fd, int request =3D AUDIO_CHANNEL_SELECT,
+	 audio_channel_select_t)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_CHANNEL_SELECT`` for this command.
+
+    -  ..
+
+       -  `audio_channel_select_t`_ ``ch``
+
+       -  Select the output format of the audio (mono left/right, stereo)=
.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl is for DVB devices only. To control a V4L2 decoder use the
+V4L2 ``V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK`` control instead.
+
+This ioctl call asks the Audio Device to select the requested channel if
+possible.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_GET_STATUS
+----------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_GET_STATUS
+
+.. code-block:: c
+
+	 int ioctl(int fd, int request =3D AUDIO_GET_STATUS,
+	 struct audio_status *status)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals AUDIO_GET_STATUS for this command.
+
+    -  ..
+
+       -  ``struct`` `audio_status`_ ``*status``
+
+       -  Returns the current state of Audio Device.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Audio Device to return the current state of the
+Audio Device.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_GET_CAPABILITIES
+----------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_GET_CAPABILITIES
+
+.. code-block:: c
+
+	 int ioctl(int fd, int request =3D AUDIO_GET_CAPABILITIES,
+	 unsigned int *cap)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_GET_CAPABILITIES`` for this command.
+
+    -  ..
+
+       -  ``unsigned int *cap``
+
+       -  Returns a bit array of supported sound formats.
+          Bits are defined in `audio encodings`_.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Audio Device to tell us about the decoding
+capabilities of the audio hardware.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_CLEAR_BUFFER
+------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_CLEAR_BUFFER
+
+.. code-block:: c
+
+	 int  ioctl(int fd, int request =3D AUDIO_CLEAR_BUFFER)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_CLEAR_BUFFER`` for this command.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl call asks the Audio Device to clear all software and hardware
+buffers of the audio decoder device.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_SET_ID
+------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_SET_ID
+
+.. code-block:: c
+
+	 int  ioctl(int fd, int request =3D AUDIO_SET_ID, int id)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_SET_ID`` for this command.
+
+    -  ..
+
+       -  ``int id``
+
+       -  Audio sub-stream id.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl selects which sub-stream is to be decoded if a program or
+system stream is sent to the video device.
+
+If no audio stream type is set the id has to be in range [0xC0,0xDF]
+for MPEG sound, in [0x80,0x87] for AC3 and in [0xA0,0xA7] for LPCM.
+See ITU-T H.222.0 | ISO/IEC 13818-1 for further description.
+
+If the stream type is set with `AUDIO_SET_STREAMTYPE`_, specifies the
+id just the sub-stream id of the audio stream and only the first 5 bits
+(& 0x1F) are recognized.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_SET_MIXER
+---------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_SET_MIXER
+
+.. code-block:: c
+
+	 int ioctl(int fd, int request =3D AUDIO_SET_MIXER, audio_mixer_t *mix)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_SET_MIXER`` for this command.
+
+    -  ..
+
+       -  ``audio_mixer_t *mix``
+
+       -  Mixer settings.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl lets you adjust the mixer settings of the audio decoder.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+AUDIO_SET_STREAMTYPE
+--------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_SET_STREAMTYPE
+
+.. code-block:: c
+
+	 int  ioctl(fd, int request =3D AUDIO_SET_STREAMTYPE, int type)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_SET_STREAMTYPE`` for this command.
+
+    -  ..
+
+       -  ``int type``
+
+       -  Stream type.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl tells the driver which kind of audio stream to expect. This
+is useful if the stream offers several audio sub-streams like LPCM and
+AC3.
+
+Stream types defined in ITU-T H.222.0 | ISO/IEC 13818-1 are used.
+
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``EINVAL``
+
+       -  Type is not a valid or supported stream type.
+
+
+-----
+
+
+AUDIO_BILINGUAL_CHANNEL_SELECT
+------------------------------
+
+Synopsis
+~~~~~~~~
+
+.. c:macro:: AUDIO_BILINGUAL_CHANNEL_SELECT
+
+.. code-block:: c
+
+	 int ioctl(int fd, int request =3D AUDIO_BILINGUAL_CHANNEL_SELECT,
+	 audio_channel_select_t)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``int request``
+
+       -  Equals ``AUDIO_BILINGUAL_CHANNEL_SELECT`` for this command.
+
+    -  ..
+
+       -  ``audio_channel_select_t ch``
+
+       -  Select the output format of the audio (mono left/right, stereo)=
.
+
+Description
+~~~~~~~~~~~
+
+.. attention:: Do **not** use in new drivers!
+             See: :ref:`legacy_dvb_decoder_notes`
+
+This ioctl has been replaced by the V4L2
+``V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK`` control
+for MPEG decoders controlled through V4L2.
+
+This ioctl call asks the Audio Device to select the requested channel
+for bilingual streams if possible.
+
+Return Value
+~~~~~~~~~~~~
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+
+-----
+
+
+open()
+------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    #include <fcntl.h>
+
+.. c:function:: int  open(const char *deviceName, int flags)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``const char *deviceName``
+
+       -  Name of specific audio device.
+
+    -  ..
+
+       -  :rspan:`3` ``int flags``
+
+       -  :cspan:`1` A bit-wise OR of the following flags:
+
+    -  ..
+
+       -  ``O_RDONLY``
+
+       -  read-only access
+
+    -  ..
+
+       -  ``O_RDWR``
+
+       -  read/write access
+
+    -  ..
+
+       -  ``O_NONBLOCK``
+       -  | Open in non-blocking mode
+          | (blocking mode is the default)
+
+Description
+~~~~~~~~~~~
+
+This system call opens a named audio device (e.g.
+``/dev/dvb/adapter0/audio0``) for subsequent use. When an open() call has
+succeeded, the device will be ready for use. The significance of
+blocking or non-blocking mode is described in the documentation for
+functions where there is a difference. It does not affect the semantics
+of the open() call itself. A device opened in blocking mode can later be
+put into non-blocking mode (and vice versa) using the F_SETFL command
+of the fcntl system call. This is a standard system call, documented in
+the Linux manual page for fcntl. Only one user can open the Audio Device
+in O_RDWR mode. All other attempts to open the device in this mode will
+fail, and an error code will be returned. If the Audio Device is opened
+in O_RDONLY mode, the only ioctl call that can be used is
+`AUDIO_GET_STATUS`_. All other call will return with an error code.
+
+Return Value
+~~~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``ENODEV``
+
+       -  Device driver not loaded/available.
+
+    -  ..
+
+       -  ``EBUSY``
+
+       -  Device or resource busy.
+
+    -  ..
+
+       -  ``EINVAL``
+
+       -  Invalid argument.
+
+
+-----
+
+
+close()
+-------
+
+Synopsis
+~~~~~~~~
+
+.. c:function:: 	int close(int fd)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+Description
+~~~~~~~~~~~
+
+This system call closes a previously opened audio device.
+
+Return Value
+~~~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``EBADF``
+
+       -  Fd is not a valid open file descriptor.
+
+-----
+
+
+write()
+-------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+	 size_t write(int fd, const void *buf, size_t count)
+
+Arguments
+~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``int fd``
+
+       -  :cspan:`1` File descriptor returned by a previous call
+          to `open()`_.
+
+    -  ..
+
+       -  ``void *buf``
+
+       -  Pointer to the buffer containing the PES data.
+
+    -  ..
+
+       -  ``size_t count``
+
+       -  Size of buf.
+
+Description
+~~~~~~~~~~~
+
+This system call can only be used if ``AUDIO_SOURCE_MEMORY`` is selected
+in the ioctl call `AUDIO_SELECT_SOURCE`_. The data provided shall be in
+PES format. If ``O_NONBLOCK`` is not specified the function will block
+until buffer space is available. The amount of data to be transferred is
+implied by count.
+
+Return Value
+~~~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    -  ..
+
+       -  ``EPERM``
+
+       -  :cspan:`1` Mode ``AUDIO_SOURCE_MEMORY`` not selected.
+
+    -  ..
+
+       -  ``ENOMEM``
+
+       -  Attempted to write more data than the internal buffer can hold.
+
+    -  ..
+
+       -  ``EBADF``
+
+       -  Fd is not a valid open file descriptor.
=2D-
2.34.0

