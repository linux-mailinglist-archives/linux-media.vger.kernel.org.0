Return-Path: <linux-media+bounces-4299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 622F683FAFF
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E585F1F241E1
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 23:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F5C481B9;
	Sun, 28 Jan 2024 23:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="JdZW72jZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9304C60C
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 23:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706484832; cv=none; b=m1ICFudK6dhhGKEcJAAFhgO/cjXFWGV98k0C0iLnEdtAqB93AOULlYegdkCxSXE/YYQLT3xjI39ALOUF/HsjUk24AxXQlw3UXoZSrrQ4HhoH9t9mgrd+zYqJRI7TRdsA6FMpb48EJAwC9OqKaRkmBMAELqM1hQjvZbOnhTOkcww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706484832; c=relaxed/simple;
	bh=DhSqolOh58HA52HSdY83ytbpZ01+iNSJ8UQ3NzlGgYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pym7lqWsmgHACjKdOVdhTAXFXfiOkEK+DzPQY2RFRCXPIYxzNj23jFxNcf/BLwx6e0HsgGi3iBiPIYcquwVGpcA+74AJVjE6RgH+70/MAAb8cmvxwWBpWKPsCUciXLOCNJcV3lLgMjy97ntsR3mIYEjmzYFqoBB+9SlGN4ZHWtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=JdZW72jZ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
	s=s31663417; t=1706484820; x=1707089620; i=herdler@nurfuerspam.de;
	bh=DhSqolOh58HA52HSdY83ytbpZ01+iNSJ8UQ3NzlGgYU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=JdZW72jZkgqrzZDrK7QUAeHujDwnkcufhVn0VDQ2nUW+oCb+yEDePmH5XhQT6lhv
	 MvvRM8xiF9Y7TYdGEszv02z7b9Q5H0xVbLYPOM5VMSzwB+ZB0NXGo9RkEI+zmGjkE
	 Fs8MOzSQF34f/5/38YC0rxsL1IEej50Pv7Z1v1zNQ1FyHrDu7leyGpPmI4nRz2VI2
	 wbSWTsdkVsNzn8X7AozPbIxUf2WggRXARmeNKSDdFHPFnm5qjRMu9drhoEu55qsS7
	 p9UXEa88bT5qZTckaXmc6rYkE7dWuOlmA91iOMIQ+TJLv/qHWipJrFKC6DnQe75EH
	 COvDqqibhBwYgRSQcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.173.202]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWzk3-1rb28g47IX-00XHxq; Mon, 29
 Jan 2024 00:33:40 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v4 3/6] media: docs: uAPI: dvb/audio: completing the documentation (data types)
Date: Mon, 29 Jan 2024 00:32:46 +0100
Message-Id: <20240128233249.32794-4-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:cZIir0we4dzcAKZXRMwzg7mgT+VoiZXUPoSmeZG5ww6QBpEmnT5
 k5wsRhGJZQhg3RllDVTLBgf8igVSMYzQgsZmWIvUs2eXfSGz4u4+zbxkYg7jKMAXP2dp8dd
 LkdRIqXzi96SlQtWFt3oN0PwWB1+6UJiYrMQhdzUXU+M1PUzsKAnvipC6GIIZdQjQt6zvM8
 xgB7qEB3Fm7ZexO81HpJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sCQD8kpEXG8=;+P2i05pzINgX/zEpEvnxARF7DyB
 cC/Wl79WCQQ2LrT9rDFa/E4rQStxPGXpUr5aIKUTmshIoaX4IjTkGpSLZytFHd/pNlZBs+Srk
 /odZk/0REaqXklikZ5YxHBqGJEhE2gtzcCWvU+rF0f01h4K9kay2eojd9EnyIDHUm0Gg67SP4
 JMeNT70Hjca4erF/6bs67+F6+svkdD/hLTj2/4pydBAskoNDj16ydlj0ApIy02GgRUiC8UE83
 1Uw77IGu0xWUVU8ID8ViPuK0shfljBcGapkI33Vnc2fCmjb4KPkSQTD1mREqrNS813VZP16nK
 EYdkgPjUkLSNllFyxqQFOJ3k2iyvH1Ch+bWi2m/ugJNSectV/0wLj+hW+Bnx/FmRP+SL9dInY
 eL2xRXJV/k8ypXNKOiGWqSzZ/h0C4p7DI0aTc42eB8OSe4RJYuQwHSfv5zzn6lWVjYy/a9OBe
 QEeXp5YBt/GjBcTNdxweLlDvHFcmDe71phWk5SFHqxiQrtUHsBjd8uQ84lV9rlqn3hnHnFfxk
 5kNGgImChBS14r+oW9R8teMsHPBjTYR1GQ1VqhKcgUI9pUqor8hd4DONcYef0lpD4hJgKh3hv
 Lnglbv+HZTnU9P7GrNBb6WbvMPVSW0dRlc7hnUH1oeHFbBWThWBvaR52kzRKR1ohDZAwQc7PO
 XTCz5FcBELW8Y6P1L2c+WaO4XhcSA80cUKleDWLWMWdx66UrGDKtSTlH6DZ0RiC71UStZd9bV
 nQsz8qAOQ+DVDpnjZRYc89mKvy9NqJkpu2G2nW+OKUhBGV6AGitO27HTdtas7T6h2aGY+cDTE
 6KwSfCdwR/fU4VtF6hD8qz7wQnodNAi+QilmjpqFXHD3OSnaQp6qfD118B54u59RRX9hV+qXB
 qgzgn6mWGrujg772PO0ja67sspkUVdx6ykcOrW4zdbpbVnt6D+YsfDZV/fXwU4x+jvJ9xyRYt
 nzVj1e6hKe0nUgFKDCT8ww5+Er0=

The existing documentation of the legacy DVB Decoder API was incomplete.

Revising the documentation, adding missing parts and arranging the
documentation files new.

This patch contains the documentation of the data types defined in
audio.h.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--

Changes since v3:
* Adjust title and description to better match existing documentation.
* Change reference from :c:enum:`dmx_output` to :c:type: to silence the
  warning from the kernel test robot.


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
+functionality. Use :ref:`V4L2 ioctls<audio>` for new drivers!
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
+Output selection: :c:type:`dmx_output` ``DMX_OUT_DECODER``.
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


