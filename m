Return-Path: <linux-media+bounces-4301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D820F83FB01
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A2421F2418E
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 23:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1834C600;
	Sun, 28 Jan 2024 23:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="UwanXjlD"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC844375
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 23:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706484833; cv=none; b=brhLps6oVIshFQEWGtM+YcBf4wIffTKF5vLOFytCkZ8SBF2k55CTQbZUG5hz9QV8ognH00Tl+j3Z9VZjeTH/tvhugtMDZqSV6UADbPI7zIyAvmQDJZa/E5xsZSxbKhpINb4DjyRourD5mIM0fkrQeNhKD4lnGuW9e+kgIfQuLog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706484833; c=relaxed/simple;
	bh=XpDoTMx9m7S5jcOVS8IvGTOUCH4QWYbpsdhIa+uoees=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dl2Q9/vBdow/bfRVkIJ7Ni/ZoZ8qICNTnq/b9OqbjIURPDnvuLMc0/BZazHRwsU2ceQbb5M93YkRSTTNv4hvURZZfzyqKggPUq7Ce/A+Al11l9E4pOEP0pB0l5uyyqYPKKXRI8e1ZvZhBqBrPDHhorwoJcT6SYd19KiI3Fb2dHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=UwanXjlD; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
	s=s31663417; t=1706484820; x=1707089620; i=herdler@nurfuerspam.de;
	bh=XpDoTMx9m7S5jcOVS8IvGTOUCH4QWYbpsdhIa+uoees=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=UwanXjlD7x7RLSQYE2Vhqn/opOGjfVfpRDGNV83sYdcXcfwunLQUDKhe7BcZhdTh
	 fDnyf9tkHMqdSPnPpN5Ss+Aorq4YFthu+lZA0W4GeQZZKtiwqT1dNiCUw0cNxNjkt
	 FQFtgOINEfgk3BgtK4vUWk66YyCZvRyMZRP6AdWx1WB/mOVhNXmvs7ICR/wqKI2Jy
	 0aa5XVjSBs+t2uEfm3FEwTRFImTFKUfmGzRvtzwSFxojJ5H7W2wxD/GVl1WUN6RJu
	 uUsNRFXuA+N4uoP00f3m7KcP1P+QuYA5gPWNh1rDfqYAcacPhnxMAVWQGsPp8cV7H
	 A59HSepCta9A8pgWIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.173.202]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ob6-1qxYv40uXO-015mZJ; Mon, 29
 Jan 2024 00:33:40 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v4 4/6] media: docs: uAPI: dvb/audio: completing the documentation (function calls)
Date: Mon, 29 Jan 2024 00:32:47 +0100
Message-Id: <20240128233249.32794-5-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:Utk7P/18bqBmKlTJGy164RysUOxrIXWV0Rqcf7b43O6Ar1InaR4
 ETk/RLih4xK0C8Y6PWa6eneo1Xu+7HcZ1A5mJ5q89DSMPhYRdmaqyXwdF8nL8bxtzkcxyd9
 EPSh7gTcWOhgv3U6EuqhupQrdE+JPEJLBMrcNIPtQvi9vsAdkDSJilH7qKa4jp677jamTk8
 7opIJQAXpBRNokgUSU14w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UQkO0Z0HASI=;UT8kXCnsahozs++hFd9vwvDuph1
 tqdmnfFx5Md02EEDO9Z8ZC62nzlG1CL9cwASKHvxoy7i+maqKdEbV6GD4a++t2xAvLwSUar74
 V8WG7p+nuxFOUcqfzE1YbjyIDdf3XmE6LgxRnO2DXOqYGaOEkjwNtw0vgMxFuw53bPlc7lHsa
 cI7h35YNGRz67eBPPAYOodpE7qoeIeW9ZMbMmzH7g2qhjl0LQmVbsw/Wvh9u0LNWKXO9u/l7U
 ZsWNasCrSyAf0MD8HFcSy3BwhPuhvn5N5N2j8KP9K82647cRUSJdUq71KhaFzm9Ylwgu5Vu0A
 nJloY54kOMELG8QhR1bztptQTS64/Y9Eihle9j8JRxx8W92RluK82ZoB3X/8pQW/Eu/Y+Oko4
 ScOiOsI10kJWiy1M+UsuYQQNYwzIS91S+jdOVtYKetRzbxBFsAQMoUOsfYrP2dBBCpglbX7OC
 VnHsRfBrhgpLKs1yOHlQeBqx8jbzYTp3rhgocIrXeCMEFTAj+GbMiGYu7WmRw5Dfas+B9T4ou
 l+LavFoWjTzk69nzejgRcPvTKuHyef9x+ZTv+hqqCug+Zvj/aa/Bmg3Tvzx/dYodf0TgXaBj/
 dEZcnfKzcDr8eS9pd8nZ28/qZ2Yz2PafEtsckSCitVKA93G6iV5b3evT5HcukHq1XVhTf6keN
 PPVdUm4rxgTD5vbtg/Zs7x+hQYYmBkdgeVaEcixH5qLYYaqo24nYa3cFhO+F3ynf9D9+uNNbQ
 rCdCTi58hd2L+ZL+8mYmSGNkTOiA9eEgEEqeXUqFTkRDofgHIznkqMpg1yP1X38BLrm14FOLm
 N35fnpLFJE5vVlflRNoiSECQuIjuLMKklrzYsFIIKjqhYJgkk+IqN3vDBNYhjeV6yGA0wnFo8
 4Sg6irGKjZcBX/QA7IaPYGV5q77ujTOOQy3OeeE/18VaIq1R/Sy/VaY+XV0GbOhE8RRPIWuhq
 yfu2OPQrtiAyzTKZcZAF6xmLNLg=

The existing documentation of the legacy DVB Decoder API was incomplete.

Revising the documentation, adding missing parts and arranging the
documentation files new.

This patch contains the documentation of the function calls defined in
audio.h.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Changes since v3:
* Adjust title and description to better match existing documentation.


[PATCH v3] ------------------------------------------------------------

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


