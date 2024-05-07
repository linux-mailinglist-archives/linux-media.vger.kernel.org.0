Return-Path: <linux-media+bounces-10952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6578BD89E
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 602CDB2386C
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CBC171AF;
	Tue,  7 May 2024 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="diVmmJly"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A498464
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041536; cv=none; b=WIw6FlEfzFXDlTJAv5ke/3gU0klIQWqFuD5y7pJasWV+z5qk49gej6WuBtGAXgWtmUmMkf88EcGHSG8TFcD5BTFqrYDDsfnZQHiC8bz/AnEmPKWu6t4Npwm3WhwOvQXMyaA90ZVDMdGeO74BdcJ5Yaw3at3KzeG+EknzVKd87GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041536; c=relaxed/simple;
	bh=fThSWgc8tyPlNmgg199MmzAxcYc36jcgEXMeOK+ZiFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=epKT18uv+W7RzbU1OIxesX3+H69E7thmzYTkyhPne34N/XFwwefaiB0iiB6Cz6RXAK4BHa6NhCiwZ1pZpW6vHaaSKSiPUVCZWz+njDM1kZLrdcENzHggIt+vLeNEq+Ep0mDXL4iuW74reJunYTUzPrvlOdZil+J19IE5Ay1ebhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=diVmmJly; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041525; x=1715646325; i=herdler@nurfuerspam.de;
	bh=lg1nqTZxH3b16Q/XhziY3fRKTjJw531jHqheM6/v1V4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=diVmmJlyJ5BC058janaFt+3ru/J5t3EUTN1p6+j41hIPJMKFYJogtMnQcT0i+Kaf
	 EtHr7A8IWhEzRcWLtt9juU+4dJi71l0n4uF/OhNaYUjY9KYlboOQ7BZ26FYEGduh0
	 uXvL2xdHreW8ajrZ8BvKYJBZW8jsjQ9oArMpt7wu53vAoDz4HeL1+NrkPQEtLNUrA
	 QIS15/jdBzo9LXgVBA+mI0NjvgHcNAh5LB5r4JYDPlFcSYcTHmth6OvxEQ8dfxrEf
	 Odlck+33aeZUa7n3rA1NOfcrBTdBPgXvwIffKTq+c5DDuzYzk8Ft0Xh4Xd7kkAK13
	 Qj5K8I3WF33l0g3JHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU5b-1sZKnG17Z5-00eZOe; Tue, 07
 May 2024 02:25:25 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 01/21] media: av7110: remove old documentation files
Date: Tue,  7 May 2024 02:24:40 +0200
Message-Id: <20240507002500.81867-2-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240507002500.81867-1-herdler@nurfuerspam.de>
References: <20240507002500.81867-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QBiY7r7A9g+ygBIU5uWtxTYcIkNTV94mLMzmkJ0bzTRYyudlnWl
 mp63HOE+XLzjUsWjSuZUSQWrLhgyt+IaqGzx3CnxAeUv/bbz7xuANnEW9cYNhReE5f4yiWP
 wv6PLsaO3UTQ8J9pnV/6/Rv3yGlNyBX1p3NEgv8t8L7V0zFdi2ryiQ4DzIrb8N0n7bW3+M5
 IANU9qDwreuzhK4emaFGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MyrncktpJDc=;VimwN7lnI1yLey118/nzOEPe/7E
 OYlHRBMu9dPzhyuWOEOkEvJq4MARbt6RhqrRMfkxr9ONvCQbDEWuTdk1TDlcBBZ8Auz5sXrt3
 OpDzYw3OPDckmhy3/eEwa1vmdH4QXCGyJqHt5hKz7mIiGb7fY3PL3UuirkYRmuMA4yfEvf1oW
 K12nK5ht2Vhcsta4PaGC5vm7vQJj0ZuBYLwlDV2EXEGrD70n+SZzoM7spXVrqtKT1B9kO/UlK
 iolp/7oqh1Qg2XsCmvPH2wN7fKQf1j0+KBOg4qruZkQbwtx4nhAOm40GyRj+oY+Mh2OXA3C5E
 IWl+vI/y7TwSPgMF7r0ZE3jcMdXS8aASVeqhOeCJsbYcztgXyl+Xl1qXeTPhIaL04qSDuaqhQ
 S3eVU1cNxtuMDxWk47VUEVTwQ58uFpZXi0d04eOK9tu4JPpN4J+odVzN6ffl1UaIhn1FUm6dT
 6LOFV4zi+l6DEGhdpBLibgssNzODb8OKQ5rJUy2gO7REzolUMvKrMrf50bY+wQi9+P4FZitGT
 oVyIRdbYwNU1Y2qQGQujAXdTPFtvXt+wfKqzFcMQv5kqX9JbaAhfi1L8qoip+nXg3rZEqteQt
 TFzH/unrzGcFgzFEAAVrsVV0G4aCFbJ783yM4JhKUWOe3rEH5uB3UIy+LQOVeWTQGVUrnjMtU
 UoYbYJ8XRnGgOy1iWV//yNaN+o7KM00ktCnoQKmmGkhpYrxtxQKTXZh/MGdHoQSeGK+DokoSV
 FUCWhrK+sfr8tLEDRaDwXWn1XkNFDmVKksnCbvlySdMEXJmbEQXTQzWy+W1Wopm3kTtiZKdZI
 sGpvoP71QqOdH2KO4SR4fselj57LcykdtRJeHB9Cg1AOw=

The documentation has been update and is now at:
linux/Documentation/userspace-api/media/dvb/legacy_dvb_osd.rst
linux/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
linux/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst

The .rst files of the old documentation aren't necessary any more,
remove them.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/TODO             |   3 -
 .../av7110/audio-bilingual-channel-select.rst |  58 ----
 .../media/av7110/audio-channel-select.rst     |  57 ----
 .../media/av7110/audio-clear-buffer.rst       |  48 ----
 .../staging/media/av7110/audio-continue.rst   |  48 ----
 drivers/staging/media/av7110/audio-fclose.rst |  51 ----
 drivers/staging/media/av7110/audio-fopen.rst  | 103 --------
 drivers/staging/media/av7110/audio-fwrite.rst |  79 ------
 .../media/av7110/audio-get-capabilities.rst   |  54 ----
 .../staging/media/av7110/audio-get-status.rst |  54 ----
 drivers/staging/media/av7110/audio-pause.rst  |  49 ----
 drivers/staging/media/av7110/audio-play.rst   |  48 ----
 .../media/av7110/audio-select-source.rst      |  56 ----
 .../media/av7110/audio-set-av-sync.rst        |  58 ----
 .../media/av7110/audio-set-bypass-mode.rst    |  62 -----
 drivers/staging/media/av7110/audio-set-id.rst |  59 -----
 .../staging/media/av7110/audio-set-mixer.rst  |  53 ----
 .../staging/media/av7110/audio-set-mute.rst   |  62 -----
 .../media/av7110/audio-set-streamtype.rst     |  66 -----
 drivers/staging/media/av7110/audio-stop.rst   |  48 ----
 drivers/staging/media/av7110/audio.rst        |  27 --
 .../staging/media/av7110/audio_data_types.rst | 116 --------
 .../media/av7110/audio_function_calls.rst     |  30 ---
 .../media/av7110/video-clear-buffer.rst       |  54 ----
 .../staging/media/av7110/video-command.rst    |  96 -------
 .../staging/media/av7110/video-continue.rst   |  57 ----
 .../media/av7110/video-fast-forward.rst       |  72 -----
 drivers/staging/media/av7110/video-fclose.rst |  51 ----
 drivers/staging/media/av7110/video-fopen.rst  | 111 --------
 drivers/staging/media/av7110/video-freeze.rst |  61 -----
 drivers/staging/media/av7110/video-fwrite.rst |  79 ------
 .../media/av7110/video-get-capabilities.rst   |  61 -----
 .../staging/media/av7110/video-get-event.rst  | 105 --------
 .../media/av7110/video-get-frame-count.rst    |  65 -----
 .../staging/media/av7110/video-get-pts.rst    |  69 -----
 .../staging/media/av7110/video-get-size.rst   |  69 -----
 .../staging/media/av7110/video-get-status.rst |  72 -----
 drivers/staging/media/av7110/video-play.rst   |  57 ----
 .../media/av7110/video-select-source.rst      |  76 ------
 .../staging/media/av7110/video-set-blank.rst  |  64 -----
 .../media/av7110/video-set-display-format.rst |  60 -----
 .../staging/media/av7110/video-set-format.rst |  82 ------
 .../media/av7110/video-set-streamtype.rst     |  61 -----
 .../staging/media/av7110/video-slowmotion.rst |  72 -----
 .../media/av7110/video-stillpicture.rst       |  61 -----
 drivers/staging/media/av7110/video-stop.rst   |  74 ------
 .../media/av7110/video-try-command.rst        |  66 -----
 drivers/staging/media/av7110/video.rst        |  36 ---
 .../media/av7110/video_function_calls.rst     |  35 ---
 drivers/staging/media/av7110/video_types.rst  | 248 ------------------
 50 files changed, 3303 deletions(-)
 delete mode 100644 drivers/staging/media/av7110/TODO
 delete mode 100644 drivers/staging/media/av7110/audio-bilingual-channel-s=
elect.rst
 delete mode 100644 drivers/staging/media/av7110/audio-channel-select.rst
 delete mode 100644 drivers/staging/media/av7110/audio-clear-buffer.rst
 delete mode 100644 drivers/staging/media/av7110/audio-continue.rst
 delete mode 100644 drivers/staging/media/av7110/audio-fclose.rst
 delete mode 100644 drivers/staging/media/av7110/audio-fopen.rst
 delete mode 100644 drivers/staging/media/av7110/audio-fwrite.rst
 delete mode 100644 drivers/staging/media/av7110/audio-get-capabilities.rs=
t
 delete mode 100644 drivers/staging/media/av7110/audio-get-status.rst
 delete mode 100644 drivers/staging/media/av7110/audio-pause.rst
 delete mode 100644 drivers/staging/media/av7110/audio-play.rst
 delete mode 100644 drivers/staging/media/av7110/audio-select-source.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-av-sync.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-bypass-mode.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-id.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-mixer.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-mute.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-streamtype.rst
 delete mode 100644 drivers/staging/media/av7110/audio-stop.rst
 delete mode 100644 drivers/staging/media/av7110/audio.rst
 delete mode 100644 drivers/staging/media/av7110/audio_data_types.rst
 delete mode 100644 drivers/staging/media/av7110/audio_function_calls.rst
 delete mode 100644 drivers/staging/media/av7110/video-clear-buffer.rst
 delete mode 100644 drivers/staging/media/av7110/video-command.rst
 delete mode 100644 drivers/staging/media/av7110/video-continue.rst
 delete mode 100644 drivers/staging/media/av7110/video-fast-forward.rst
 delete mode 100644 drivers/staging/media/av7110/video-fclose.rst
 delete mode 100644 drivers/staging/media/av7110/video-fopen.rst
 delete mode 100644 drivers/staging/media/av7110/video-freeze.rst
 delete mode 100644 drivers/staging/media/av7110/video-fwrite.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-capabilities.rs=
t
 delete mode 100644 drivers/staging/media/av7110/video-get-event.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-frame-count.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-pts.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-size.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-status.rst
 delete mode 100644 drivers/staging/media/av7110/video-play.rst
 delete mode 100644 drivers/staging/media/av7110/video-select-source.rst
 delete mode 100644 drivers/staging/media/av7110/video-set-blank.rst
 delete mode 100644 drivers/staging/media/av7110/video-set-display-format.=
rst
 delete mode 100644 drivers/staging/media/av7110/video-set-format.rst
 delete mode 100644 drivers/staging/media/av7110/video-set-streamtype.rst
 delete mode 100644 drivers/staging/media/av7110/video-slowmotion.rst
 delete mode 100644 drivers/staging/media/av7110/video-stillpicture.rst
 delete mode 100644 drivers/staging/media/av7110/video-stop.rst
 delete mode 100644 drivers/staging/media/av7110/video-try-command.rst
 delete mode 100644 drivers/staging/media/av7110/video.rst
 delete mode 100644 drivers/staging/media/av7110/video_function_calls.rst
 delete mode 100644 drivers/staging/media/av7110/video_types.rst

diff --git a/drivers/staging/media/av7110/TODO b/drivers/staging/media/av7=
110/TODO
deleted file mode 100644
index 60062d844..000000000
=2D-- a/drivers/staging/media/av7110/TODO
+++ /dev/null
@@ -1,3 +0,0 @@
=2D- This driver is too old and relies on a different API.
-  Drop it from Kernel on a couple of versions.
=2D- Cleanup patches for the drivers here won't be accepted.
diff --git a/drivers/staging/media/av7110/audio-bilingual-channel-select.r=
st b/drivers/staging/media/av7110/audio-bilingual-channel-select.rst
deleted file mode 100644
index 33b536331..000000000
=2D-- a/drivers/staging/media/av7110/audio-bilingual-channel-select.rst
+++ /dev/null
@@ -1,58 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_BILINGUAL_CHANNEL_SELECT:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
-AUDIO_BILINGUAL_CHANNEL_SELECT
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_BILINGUAL_CHANNEL_SELECT
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_BILINGUAL_CHANNEL_SELECT
-
-``int ioctl(int fd, AUDIO_BILINGUAL_CHANNEL_SELECT, struct audio_channel_=
select *select)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  audio_channel_select_t ch
-
-       -  Select the output format of the audio (mono left/right, stereo)=
.
-
-Description
=2D-----------
-
-This ioctl is obsolete. Do not use in new drivers. It has been replaced
-by the V4L2 ``V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK`` control
-for MPEG decoders controlled through V4L2.
-
-This ioctl call asks the Audio Device to select the requested channel
-for bilingual streams if possible.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-channel-select.rst b/drive=
rs/staging/media/av7110/audio-channel-select.rst
deleted file mode 100644
index 74093df92..000000000
=2D-- a/drivers/staging/media/av7110/audio-channel-select.rst
+++ /dev/null
@@ -1,57 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_CHANNEL_SELECT:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_CHANNEL_SELECT
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_CHANNEL_SELECT
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_CHANNEL_SELECT
-
-``int ioctl(int fd, AUDIO_CHANNEL_SELECT, struct audio_channel_select *se=
lect)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  audio_channel_select_t ch
-
-       -  Select the output format of the audio (mono left/right, stereo)=
.
-
-Description
=2D-----------
-
-This ioctl is for Digital TV devices only. To control a V4L2 decoder use =
the
-V4L2 ``V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK`` control instead.
-
-This ioctl call asks the Audio Device to select the requested channel if
-possible.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-clear-buffer.rst b/drivers=
/staging/media/av7110/audio-clear-buffer.rst
deleted file mode 100644
index a0ebb0278..000000000
=2D-- a/drivers/staging/media/av7110/audio-clear-buffer.rst
+++ /dev/null
@@ -1,48 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_CLEAR_BUFFER:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_CLEAR_BUFFER
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_CLEAR_BUFFER
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_CLEAR_BUFFER
-
-``int ioctl(int fd, AUDIO_CLEAR_BUFFER)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-Description
=2D-----------
-
-This ioctl call asks the Audio Device to clear all software and hardware
-buffers of the audio decoder device.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-continue.rst b/drivers/sta=
ging/media/av7110/audio-continue.rst
deleted file mode 100644
index a2e9850f3..000000000
=2D-- a/drivers/staging/media/av7110/audio-continue.rst
+++ /dev/null
@@ -1,48 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_CONTINUE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_CONTINUE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_CONTINUE
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_CONTINUE
-
-``int ioctl(int fd, AUDIO_CONTINUE)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-Description
=2D-----------
-
-This ioctl restarts the decoding and playing process previously paused
-with AUDIO_PAUSE command.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-fclose.rst b/drivers/stagi=
ng/media/av7110/audio-fclose.rst
deleted file mode 100644
index 77857d578..000000000
=2D-- a/drivers/staging/media/av7110/audio-fclose.rst
+++ /dev/null
@@ -1,51 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _audio_fclose:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Digital TV audio close()
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-Digital TV audio close()
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:function:: int close(int fd)
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-Description
=2D-----------
-
-This system call closes a previously opened audio device.
-
-Return Value
=2D------------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``EBADF``
-
-       -  fd is not a valid open file descriptor.
diff --git a/drivers/staging/media/av7110/audio-fopen.rst b/drivers/stagin=
g/media/av7110/audio-fopen.rst
deleted file mode 100644
index 774daaab3..000000000
=2D-- a/drivers/staging/media/av7110/audio-fopen.rst
+++ /dev/null
@@ -1,103 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _audio_fopen:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Digital TV audio open()
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-Digital TV audio open()
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:function:: int open(const char *deviceName, int flags)
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  const char \*deviceName
-
-       -  Name of specific audio device.
-
-    -  .. row 2
-
-       -  int flags
-
-       -  A bit-wise OR of the following flags:
-
-    -  .. row 3
-
-       -
-       -  O_RDONLY read-only access
-
-    -  .. row 4
-
-       -
-       -  O_RDWR read/write access
-
-    -  .. row 5
-
-       -
-       -  O_NONBLOCK open in non-blocking mode
-
-    -  .. row 6
-
-       -
-       -  (blocking mode is the default)
-
-Description
=2D-----------
-
-This system call opens a named audio device (e.g.
-/dev/dvb/adapter0/audio0) for subsequent use. When an open() call has
-succeeded, the device will be ready for use. The significance of
-blocking or non-blocking mode is described in the documentation for
-functions where there is a difference. It does not affect the semantics
-of the open() call itself. A device opened in blocking mode can later be
-put into non-blocking mode (and vice versa) using the F_SETFL command
-of the fcntl system call. This is a standard system call, documented in
-the Linux manual page for fcntl. Only one user can open the Audio Device
-in O_RDWR mode. All other attempts to open the device in this mode will
-fail, and an error code will be returned. If the Audio Device is opened
-in O_RDONLY mode, the only ioctl call that can be used is
-AUDIO_GET_STATUS. All other call will return with an error code.
-
-Return Value
=2D------------
-
-.. tabularcolumns:: |p{2.5cm}|p{15.0cm}|
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``ENODEV``
-
-       -  Device driver not loaded/available.
-
-    -  .. row 2
-
-       -  ``EBUSY``
-
-       -  Device or resource busy.
-
-    -  .. row 3
-
-       -  ``EINVAL``
-
-       -  Invalid argument.
diff --git a/drivers/staging/media/av7110/audio-fwrite.rst b/drivers/stagi=
ng/media/av7110/audio-fwrite.rst
deleted file mode 100644
index 7b096ac2b..000000000
=2D-- a/drivers/staging/media/av7110/audio-fwrite.rst
+++ /dev/null
@@ -1,79 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _audio_fwrite:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-Digital TV audio write()
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-
-Name
=2D----
-
-Digital TV audio write()
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:function:: size_t write(int fd, const void *buf, size_t count)
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  void \*buf
-
-       -  Pointer to the buffer containing the PES data.
-
-    -  .. row 3
-
-       -  size_t count
-
-       -  Size of buf.
-
-Description
=2D-----------
-
-This system call can only be used if AUDIO_SOURCE_MEMORY is selected
-in the ioctl call AUDIO_SELECT_SOURCE. The data provided shall be in
-PES format. If O_NONBLOCK is not specified the function will block
-until buffer space is available. The amount of data to be transferred is
-implied by count.
-
-Return Value
=2D------------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``EPERM``
-
-       -  Mode AUDIO_SOURCE_MEMORY not selected.
-
-    -  .. row 2
-
-       -  ``ENOMEM``
-
-       -  Attempted to write more data than the internal buffer can hold.
-
-    -  .. row 3
-
-       -  ``EBADF``
-
-       -  fd is not a valid open file descriptor.
diff --git a/drivers/staging/media/av7110/audio-get-capabilities.rst b/dri=
vers/staging/media/av7110/audio-get-capabilities.rst
deleted file mode 100644
index 6d9eb71da..000000000
=2D-- a/drivers/staging/media/av7110/audio-get-capabilities.rst
+++ /dev/null
@@ -1,54 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_GET_CAPABILITIES:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_GET_CAPABILITIES
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_GET_CAPABILITIES
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_GET_CAPABILITIES
-
-``int ioctl(int fd, AUDIO_GET_CAPABILITIES, unsigned int *cap)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  unsigned int \*cap
-
-       -  Returns a bit array of supported sound formats.
-
-Description
=2D-----------
-
-This ioctl call asks the Audio Device to tell us about the decoding
-capabilities of the audio hardware.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-get-status.rst b/drivers/s=
taging/media/av7110/audio-get-status.rst
deleted file mode 100644
index 7ae8db2e6..000000000
=2D-- a/drivers/staging/media/av7110/audio-get-status.rst
+++ /dev/null
@@ -1,54 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_GET_STATUS:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_GET_STATUS
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_GET_STATUS
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_GET_STATUS
-
-``int ioctl(int fd, AUDIO_GET_STATUS, struct audio_status *status)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  struct audio_status \*status
-
-       -  Returns the current state of Audio Device.
-
-Description
=2D-----------
-
-This ioctl call asks the Audio Device to return the current state of the
-Audio Device.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-pause.rst b/drivers/stagin=
g/media/av7110/audio-pause.rst
deleted file mode 100644
index d37d1ddce..000000000
=2D-- a/drivers/staging/media/av7110/audio-pause.rst
+++ /dev/null
@@ -1,49 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_PAUSE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_PAUSE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_PAUSE
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_PAUSE
-
-``int ioctl(int fd, AUDIO_PAUSE)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-Description
=2D-----------
-
-This ioctl call suspends the audio stream being played. Decoding and
-playing are paused. It is then possible to restart again decoding and
-playing process of the audio stream using AUDIO_CONTINUE command.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-play.rst b/drivers/staging=
/media/av7110/audio-play.rst
deleted file mode 100644
index e591930b6..000000000
=2D-- a/drivers/staging/media/av7110/audio-play.rst
+++ /dev/null
@@ -1,48 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_PLAY:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_PLAY
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_PLAY
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_PLAY
-
-``int ioctl(int fd, AUDIO_PLAY)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-Description
=2D-----------
-
-This ioctl call asks the Audio Device to start playing an audio stream
-from the selected source.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-select-source.rst b/driver=
s/staging/media/av7110/audio-select-source.rst
deleted file mode 100644
index 6a0c0f365..000000000
=2D-- a/drivers/staging/media/av7110/audio-select-source.rst
+++ /dev/null
@@ -1,56 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_SELECT_SOURCE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_SELECT_SOURCE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_SELECT_SOURCE
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_SELECT_SOURCE
-
-``int ioctl(int fd, AUDIO_SELECT_SOURCE, struct audio_stream_source *sour=
ce)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  audio_stream_source_t source
-
-       -  Indicates the source that shall be used for the Audio stream.
-
-Description
=2D-----------
-
-This ioctl call informs the audio device which source shall be used for
-the input data. The possible sources are demux or memory. If
-AUDIO_SOURCE_MEMORY is selected, the data is fed to the Audio Device
-through the write command.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-set-av-sync.rst b/drivers/=
staging/media/av7110/audio-set-av-sync.rst
deleted file mode 100644
index 85a8016bf..000000000
=2D-- a/drivers/staging/media/av7110/audio-set-av-sync.rst
+++ /dev/null
@@ -1,58 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_SET_AV_SYNC:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_SET_AV_SYNC
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_SET_AV_SYNC
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_SET_AV_SYNC
-
-``int ioctl(int fd, AUDIO_SET_AV_SYNC, boolean state)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  boolean state
-
-       -  Tells the Digital TV subsystem if A/V synchronization shall be =
ON or OFF.
-
-          TRUE: AV-sync ON
-
-          FALSE: AV-sync OFF
-
-Description
=2D-----------
-
-This ioctl call asks the Audio Device to turn ON or OFF A/V
-synchronization.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-set-bypass-mode.rst b/driv=
ers/staging/media/av7110/audio-set-bypass-mode.rst
deleted file mode 100644
index 80d551a20..000000000
=2D-- a/drivers/staging/media/av7110/audio-set-bypass-mode.rst
+++ /dev/null
@@ -1,62 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_SET_BYPASS_MODE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_SET_BYPASS_MODE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_SET_BYPASS_MODE
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_SET_BYPASS_MODE
-
-``int ioctl(int fd, AUDIO_SET_BYPASS_MODE, boolean mode)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  boolean mode
-
-       -  Enables or disables the decoding of the current Audio stream in
-	  the Digital TV subsystem.
-
-          TRUE: Bypass is disabled
-
-          FALSE: Bypass is enabled
-
-Description
=2D-----------
-
-This ioctl call asks the Audio Device to bypass the Audio decoder and
-forward the stream without decoding. This mode shall be used if streams
-that can't be handled by the Digital TV system shall be decoded. Dolby
-DigitalTM streams are automatically forwarded by the Digital TV subsystem=
 if
-the hardware can handle it.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-set-id.rst b/drivers/stagi=
ng/media/av7110/audio-set-id.rst
deleted file mode 100644
index 39ad846d4..000000000
=2D-- a/drivers/staging/media/av7110/audio-set-id.rst
+++ /dev/null
@@ -1,59 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_SET_ID:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_SET_ID
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_SET_ID
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_SET_ID
-
-``int ioctl(int fd, AUDIO_SET_ID, int id)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  int id
-
-       -  audio sub-stream id
-
-Description
=2D-----------
-
-This ioctl selects which sub-stream is to be decoded if a program or
-system stream is sent to the video device. If no audio stream type is
-set the id has to be in [0xC0,0xDF] for MPEG sound, in [0x80,0x87] for
-AC3 and in [0xA0,0xA7] for LPCM. More specifications may follow for
-other stream types. If the stream type is set the id just specifies the
-substream id of the audio stream and only the first 5 bits are
-recognized.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-set-mixer.rst b/drivers/st=
aging/media/av7110/audio-set-mixer.rst
deleted file mode 100644
index 45dbdf480..000000000
=2D-- a/drivers/staging/media/av7110/audio-set-mixer.rst
+++ /dev/null
@@ -1,53 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_SET_MIXER:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_SET_MIXER
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_SET_MIXER
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_SET_MIXER
-
-``int ioctl(int fd, AUDIO_SET_MIXER, struct audio_mixer *mix)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  audio_mixer_t \*mix
-
-       -  mixer settings.
-
-Description
=2D-----------
-
-This ioctl lets you adjust the mixer settings of the audio decoder.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-set-mute.rst b/drivers/sta=
ging/media/av7110/audio-set-mute.rst
deleted file mode 100644
index 987751f92..000000000
=2D-- a/drivers/staging/media/av7110/audio-set-mute.rst
+++ /dev/null
@@ -1,62 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_SET_MUTE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_SET_MUTE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_SET_MUTE
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_SET_MUTE
-
-``int ioctl(int fd, AUDIO_SET_MUTE, boolean state)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  boolean state
-
-       -  Indicates if audio device shall mute or not.
-
-          TRUE: Audio Mute
-
-          FALSE: Audio Un-mute
-
-Description
=2D-----------
-
-This ioctl is for Digital TV devices only. To control a V4L2 decoder use =
the
-V4L2 :ref:`VIDIOC_DECODER_CMD` with the
-``V4L2_DEC_CMD_START_MUTE_AUDIO`` flag instead.
-
-This ioctl call asks the audio device to mute the stream that is
-currently being played.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio-set-streamtype.rst b/drive=
rs/staging/media/av7110/audio-set-streamtype.rst
deleted file mode 100644
index 77d73c748..000000000
=2D-- a/drivers/staging/media/av7110/audio-set-streamtype.rst
+++ /dev/null
@@ -1,66 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_SET_STREAMTYPE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_SET_STREAMTYPE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_SET_STREAMTYPE
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_SET_STREAMTYPE
-
-``int ioctl(fd, AUDIO_SET_STREAMTYPE, int type)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -
-
-       -  int type
-
-       -  stream type
-
-Description
=2D-----------
-
-This ioctl tells the driver which kind of audio stream to expect. This
-is useful if the stream offers several audio sub-streams like LPCM and
-AC3.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``EINVAL``
-
-       -  type is not a valid or supported stream type.
diff --git a/drivers/staging/media/av7110/audio-stop.rst b/drivers/staging=
/media/av7110/audio-stop.rst
deleted file mode 100644
index d77f786fd..000000000
=2D-- a/drivers/staging/media/av7110/audio-stop.rst
+++ /dev/null
@@ -1,48 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.audio
-
-.. _AUDIO_STOP:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-AUDIO_STOP
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-AUDIO_STOP
-
-.. attention:: This ioctl is deprecated
-
-Synopsis
=2D--------
-
-.. c:macro:: AUDIO_STOP
-
-``int ioctl(int fd, AUDIO_STOP)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-Description
=2D-----------
-
-This ioctl call asks the Audio Device to stop playing the current
-stream.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/audio.rst b/drivers/staging/medi=
a/av7110/audio.rst
deleted file mode 100644
index aa753336b..000000000
=2D-- a/drivers/staging/media/av7110/audio.rst
+++ /dev/null
@@ -1,27 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _dvb_audio:
-
-#######################
-Digital TV Audio Device
-#######################
-
-The Digital TV audio device controls the MPEG2 audio decoder of the Digit=
al
-TV hardware. It can be accessed through ``/dev/dvb/adapter?/audio?``. Dat=
a
-types and ioctl definitions can be accessed by including
-``linux/dvb/audio.h`` in your application.
-
-Please note that some Digital TV cards don't have their own MPEG decoder,=
 which
-results in the omission of the audio and video device.
-
-These ioctls were also used by V4L2 to control MPEG decoders implemented
-in V4L2. The use of these ioctls for that purpose has been made obsolete
-and proper V4L2 ioctls or controls have been created to replace that
-functionality.
-
-
-.. toctree::
-    :maxdepth: 1
-
-    audio_data_types
-    audio_function_calls
diff --git a/drivers/staging/media/av7110/audio_data_types.rst b/drivers/s=
taging/media/av7110/audio_data_types.rst
deleted file mode 100644
index 474452913..000000000
=2D-- a/drivers/staging/media/av7110/audio_data_types.rst
+++ /dev/null
@@ -1,116 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _audio_data_types:
-
-****************
-Audio Data Types
-****************
-
-This section describes the structures, data types and defines used when
-talking to the audio device.
-
-.. c:type:: audio_stream_source
-
-The audio stream source is set through the AUDIO_SELECT_SOURCE call
-and can take the following values, depending on whether we are replaying
-from an internal (demux) or external (user write) source.
-
-
-.. code-block:: c
-
-    typedef enum {
-	AUDIO_SOURCE_DEMUX,
-	AUDIO_SOURCE_MEMORY
-    } audio_stream_source_t;
-
-AUDIO_SOURCE_DEMUX selects the demultiplexer (fed either by the
-frontend or the DVR device) as the source of the video stream. If
-AUDIO_SOURCE_MEMORY is selected the stream comes from the application
-through the ``write()`` system call.
-
-
-.. c:type:: audio_play_state
-
-The following values can be returned by the AUDIO_GET_STATUS call
-representing the state of audio playback.
-
-
-.. code-block:: c
-
-    typedef enum {
-	AUDIO_STOPPED,
-	AUDIO_PLAYING,
-	AUDIO_PAUSED
-    } audio_play_state_t;
-
-
-.. c:type:: audio_channel_select
-
-The audio channel selected via AUDIO_CHANNEL_SELECT is determined by
-the following values.
-
-
-.. code-block:: c
-
-    typedef enum {
-	AUDIO_STEREO,
-	AUDIO_MONO_LEFT,
-	AUDIO_MONO_RIGHT,
-	AUDIO_MONO,
-	AUDIO_STEREO_SWAPPED
-    } audio_channel_select_t;
-
-
-.. c:type:: audio_status
-
-The AUDIO_GET_STATUS call returns the following structure informing
-about various states of the playback operation.
-
-
-.. code-block:: c
-
-    typedef struct audio_status {
-	boolean AV_sync_state;
-	boolean mute_state;
-	audio_play_state_t play_state;
-	audio_stream_source_t stream_source;
-	audio_channel_select_t channel_select;
-	boolean bypass_mode;
-	audio_mixer_t mixer_state;
-    } audio_status_t;
-
-
-.. c:type:: audio_mixer
-
-The following structure is used by the AUDIO_SET_MIXER call to set the
-audio volume.
-
-
-.. code-block:: c
-
-    typedef struct audio_mixer {
-	unsigned int volume_left;
-	unsigned int volume_right;
-    } audio_mixer_t;
-
-
-.. _audio_encodings:
-
-audio encodings
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-A call to AUDIO_GET_CAPABILITIES returns an unsigned integer with the
-following bits set according to the hardwares capabilities.
-
-
-.. code-block:: c
-
-     #define AUDIO_CAP_DTS    1
-     #define AUDIO_CAP_LPCM   2
-     #define AUDIO_CAP_MP1    4
-     #define AUDIO_CAP_MP2    8
-     #define AUDIO_CAP_MP3   16
-     #define AUDIO_CAP_AAC   32
-     #define AUDIO_CAP_OGG   64
-     #define AUDIO_CAP_SDDS 128
-     #define AUDIO_CAP_AC3  256
diff --git a/drivers/staging/media/av7110/audio_function_calls.rst b/drive=
rs/staging/media/av7110/audio_function_calls.rst
deleted file mode 100644
index fa5ba9539..000000000
=2D-- a/drivers/staging/media/av7110/audio_function_calls.rst
+++ /dev/null
@@ -1,30 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _audio_function_calls:
-
-********************
-Audio Function Calls
-********************
-
-.. toctree::
-    :maxdepth: 1
-
-    audio-fopen
-    audio-fclose
-    audio-fwrite
-    audio-stop
-    audio-play
-    audio-pause
-    audio-continue
-    audio-select-source
-    audio-set-mute
-    audio-set-av-sync
-    audio-set-bypass-mode
-    audio-channel-select
-    audio-bilingual-channel-select
-    audio-get-status
-    audio-get-capabilities
-    audio-clear-buffer
-    audio-set-id
-    audio-set-mixer
-    audio-set-streamtype
diff --git a/drivers/staging/media/av7110/video-clear-buffer.rst b/drivers=
/staging/media/av7110/video-clear-buffer.rst
deleted file mode 100644
index a7730559b..000000000
=2D-- a/drivers/staging/media/av7110/video-clear-buffer.rst
+++ /dev/null
@@ -1,54 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_CLEAR_BUFFER:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_CLEAR_BUFFER
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_CLEAR_BUFFER
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_CLEAR_BUFFER
-
-``int ioctl(fd, VIDEO_CLEAR_BUFFER)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_CLEAR_BUFFER for this command.
-
-Description
=2D-----------
-
-This ioctl call clears all video buffers in the driver and in the
-decoder hardware.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-command.rst b/drivers/stag=
ing/media/av7110/video-command.rst
deleted file mode 100644
index cae9445eb..000000000
=2D-- a/drivers/staging/media/av7110/video-command.rst
+++ /dev/null
@@ -1,96 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_COMMAND:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_COMMAND
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_COMMAND
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_COMMAND
-
-``int ioctl(int fd, VIDEO_COMMAND, struct video_command *cmd)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_COMMAND for this command.
-
-    -  .. row 3
-
-       -  struct video_command \*cmd
-
-       -  Commands the decoder.
-
-Description
=2D-----------
-
-This ioctl is obsolete. Do not use in new drivers. For V4L2 decoders
-this ioctl has been replaced by the
-:ref:`VIDIOC_DECODER_CMD` ioctl.
-
-This ioctl commands the decoder. The ``video_command`` struct is a
-subset of the ``v4l2_decoder_cmd`` struct, so refer to the
-:ref:`VIDIOC_DECODER_CMD` documentation for
-more information.
-
-.. c:type:: video_command
-
-.. code-block:: c
-
-	/* The structure must be zeroed before use by the application
-	This ensures it can be extended safely in the future. */
-	struct video_command {
-		__u32 cmd;
-		__u32 flags;
-		union {
-			struct {
-				__u64 pts;
-			} stop;
-
-			struct {
-				/* 0 or 1000 specifies normal speed,
-				1 specifies forward single stepping,
-				-1 specifies backward single stepping,
-				>1: playback at speed/1000 of the normal speed,
-				<-1: reverse playback at (-speed/1000) of the normal speed. */
-				__s32 speed;
-				__u32 format;
-			} play;
-
-			struct {
-				__u32 data[16];
-			} raw;
-		};
-	};
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-continue.rst b/drivers/sta=
ging/media/av7110/video-continue.rst
deleted file mode 100644
index bc34bf398..000000000
=2D-- a/drivers/staging/media/av7110/video-continue.rst
+++ /dev/null
@@ -1,57 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_CONTINUE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_CONTINUE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_CONTINUE
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_CONTINUE
-
-``int ioctl(fd, VIDEO_CONTINUE)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_CONTINUE for this command.
-
-Description
=2D-----------
-
-This ioctl is for Digital TV devices only. To control a V4L2 decoder use =
the
-V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
-
-This ioctl call restarts decoding and playing processes of the video
-stream which was played before a call to VIDEO_FREEZE was made.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-fast-forward.rst b/drivers=
/staging/media/av7110/video-fast-forward.rst
deleted file mode 100644
index e71fa8d69..000000000
=2D-- a/drivers/staging/media/av7110/video-fast-forward.rst
+++ /dev/null
@@ -1,72 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_FAST_FORWARD:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_FAST_FORWARD
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_FAST_FORWARD
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_FAST_FORWARD
-
-``int ioctl(fd, VIDEO_FAST_FORWARD, int nFrames)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_FAST_FORWARD for this command.
-
-    -  .. row 3
-
-       -  int nFrames
-
-       -  The number of frames to skip.
-
-Description
=2D-----------
-
-This ioctl call asks the Video Device to skip decoding of N number of
-I-frames. This call can only be used if VIDEO_SOURCE_MEMORY is
-selected.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``EPERM``
-
-       -  Mode VIDEO_SOURCE_MEMORY not selected.
diff --git a/drivers/staging/media/av7110/video-fclose.rst b/drivers/stagi=
ng/media/av7110/video-fclose.rst
deleted file mode 100644
index 01d24d548..000000000
=2D-- a/drivers/staging/media/av7110/video-fclose.rst
+++ /dev/null
@@ -1,51 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _video_fclose:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-dvb video close()
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-dvb video close()
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:function:: int close(int fd)
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-Description
=2D-----------
-
-This system call closes a previously opened video device.
-
-Return Value
=2D------------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``EBADF``
-
-       -  fd is not a valid open file descriptor.
diff --git a/drivers/staging/media/av7110/video-fopen.rst b/drivers/stagin=
g/media/av7110/video-fopen.rst
deleted file mode 100644
index 1371b083e..000000000
=2D-- a/drivers/staging/media/av7110/video-fopen.rst
+++ /dev/null
@@ -1,111 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _video_fopen:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-dvb video open()
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-dvb video open()
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:function:: int open(const char *deviceName, int flags)
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  const char \*deviceName
-
-       -  Name of specific video device.
-
-    -  .. row 2
-
-       -  int flags
-
-       -  A bit-wise OR of the following flags:
-
-    -  .. row 3
-
-       -
-       -  O_RDONLY read-only access
-
-    -  .. row 4
-
-       -
-       -  O_RDWR read/write access
-
-    -  .. row 5
-
-       -
-       -  O_NONBLOCK open in non-blocking mode
-
-    -  .. row 6
-
-       -
-       -  (blocking mode is the default)
-
-Description
=2D-----------
-
-This system call opens a named video device (e.g.
-/dev/dvb/adapter0/video0) for subsequent use.
-
-When an open() call has succeeded, the device will be ready for use. The
-significance of blocking or non-blocking mode is described in the
-documentation for functions where there is a difference. It does not
-affect the semantics of the open() call itself. A device opened in
-blocking mode can later be put into non-blocking mode (and vice versa)
-using the F_SETFL command of the fcntl system call. This is a standard
-system call, documented in the Linux manual page for fcntl. Only one
-user can open the Video Device in O_RDWR mode. All other attempts to
-open the device in this mode will fail, and an error-code will be
-returned. If the Video Device is opened in O_RDONLY mode, the only
-ioctl call that can be used is VIDEO_GET_STATUS. All other call will
-return an error code.
-
-Return Value
=2D------------
-
-.. tabularcolumns:: |p{2.5cm}|p{15.0cm}|
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``ENODEV``
-
-       -  Device driver not loaded/available.
-
-    -  .. row 2
-
-       -  ``EINTERNAL``
-
-       -  Internal error.
-
-    -  .. row 3
-
-       -  ``EBUSY``
-
-       -  Device or resource busy.
-
-    -  .. row 4
-
-       -  ``EINVAL``
-
-       -  Invalid argument.
diff --git a/drivers/staging/media/av7110/video-freeze.rst b/drivers/stagi=
ng/media/av7110/video-freeze.rst
deleted file mode 100644
index 4321f257c..000000000
=2D-- a/drivers/staging/media/av7110/video-freeze.rst
+++ /dev/null
@@ -1,61 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_FREEZE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_FREEZE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_FREEZE
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_FREEZE
-
-``int ioctl(fd, VIDEO_FREEZE)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_FREEZE for this command.
-
-Description
=2D-----------
-
-This ioctl is for Digital TV devices only. To control a V4L2 decoder use =
the
-V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
-
-This ioctl call suspends the live video stream being played. Decoding
-and playing are frozen. It is then possible to restart the decoding and
-playing process of the video stream using the VIDEO_CONTINUE command.
-If VIDEO_SOURCE_MEMORY is selected in the ioctl call
-VIDEO_SELECT_SOURCE, the Digital TV subsystem will not decode any more da=
ta
-until the ioctl call VIDEO_CONTINUE or VIDEO_PLAY is performed.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-fwrite.rst b/drivers/stagi=
ng/media/av7110/video-fwrite.rst
deleted file mode 100644
index a07fd7d7a..000000000
=2D-- a/drivers/staging/media/av7110/video-fwrite.rst
+++ /dev/null
@@ -1,79 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _video_fwrite:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-dvb video write()
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-dvb video write()
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:function:: size_t write(int fd, const void *buf, size_t count)
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  void \*buf
-
-       -  Pointer to the buffer containing the PES data.
-
-    -  .. row 3
-
-       -  size_t count
-
-       -  Size of buf.
-
-Description
=2D-----------
-
-This system call can only be used if VIDEO_SOURCE_MEMORY is selected
-in the ioctl call VIDEO_SELECT_SOURCE. The data provided shall be in
-PES format, unless the capability allows other formats. If O_NONBLOCK
-is not specified the function will block until buffer space is
-available. The amount of data to be transferred is implied by count.
-
-Return Value
=2D------------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``EPERM``
-
-       -  Mode VIDEO_SOURCE_MEMORY not selected.
-
-    -  .. row 2
-
-       -  ``ENOMEM``
-
-       -  Attempted to write more data than the internal buffer can hold.
-
-    -  .. row 3
-
-       -  ``EBADF``
-
-       -  fd is not a valid open file descriptor.
diff --git a/drivers/staging/media/av7110/video-get-capabilities.rst b/dri=
vers/staging/media/av7110/video-get-capabilities.rst
deleted file mode 100644
index 01e09f566..000000000
=2D-- a/drivers/staging/media/av7110/video-get-capabilities.rst
+++ /dev/null
@@ -1,61 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_GET_CAPABILITIES:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_GET_CAPABILITIES
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_GET_CAPABILITIES
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_GET_CAPABILITIES
-
-``int ioctl(fd, VIDEO_GET_CAPABILITIES, unsigned int *cap)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_GET_CAPABILITIES for this command.
-
-    -  .. row 3
-
-       -  unsigned int \*cap
-
-       -  Pointer to a location where to store the capability information=
.
-
-Description
=2D-----------
-
-This ioctl call asks the video device about its decoding capabilities.
-On success it returns and integer which has bits set according to the
-defines in section ??.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-get-event.rst b/drivers/st=
aging/media/av7110/video-get-event.rst
deleted file mode 100644
index 90382bc36..000000000
=2D-- a/drivers/staging/media/av7110/video-get-event.rst
+++ /dev/null
@@ -1,105 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_GET_EVENT:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_GET_EVENT
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_GET_EVENT
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_GET_EVENT
-
-``int ioctl(fd, VIDEO_GET_EVENT, struct video_event *ev)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_GET_EVENT for this command.
-
-    -  .. row 3
-
-       -  struct video_event \*ev
-
-       -  Points to the location where the event, if any, is to be stored=
.
-
-Description
=2D-----------
-
-This ioctl is for Digital TV devices only. To get events from a V4L2 deco=
der
-use the V4L2 :ref:`VIDIOC_DQEVENT` ioctl instead.
-
-This ioctl call returns an event of type video_event if available. If
-an event is not available, the behavior depends on whether the device is
-in blocking or non-blocking mode. In the latter case, the call fails
-immediately with errno set to ``EWOULDBLOCK``. In the former case, the ca=
ll
-blocks until an event becomes available. The standard Linux poll()
-and/or select() system calls can be used with the device file descriptor
-to watch for new events. For select(), the file descriptor should be
-included in the exceptfds argument, and for poll(), POLLPRI should be
-specified as the wake-up condition. Read-only permissions are sufficient
-for this ioctl call.
-
-.. c:type:: video_event
-
-.. code-block:: c
-
-	struct video_event {
-		__s32 type;
-	#define VIDEO_EVENT_SIZE_CHANGED	1
-	#define VIDEO_EVENT_FRAME_RATE_CHANGED	2
-	#define VIDEO_EVENT_DECODER_STOPPED 	3
-	#define VIDEO_EVENT_VSYNC 		4
-		long timestamp;
-		union {
-			video_size_t size;
-			unsigned int frame_rate;	/* in frames per 1000sec */
-			unsigned char vsync_field;	/* unknown/odd/even/progressive */
-		} u;
-	};
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``EWOULDBLOCK``
-
-       -  There is no event pending, and the device is in non-blocking mo=
de.
-
-    -  .. row 2
-
-       -  ``EOVERFLOW``
-
-       -  Overflow in event queue - one or more events were lost.
diff --git a/drivers/staging/media/av7110/video-get-frame-count.rst b/driv=
ers/staging/media/av7110/video-get-frame-count.rst
deleted file mode 100644
index b48ac8c58..000000000
=2D-- a/drivers/staging/media/av7110/video-get-frame-count.rst
+++ /dev/null
@@ -1,65 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_GET_FRAME_COUNT:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_GET_FRAME_COUNT
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_GET_FRAME_COUNT
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_GET_FRAME_COUNT
-
-``int ioctl(int fd, VIDEO_GET_FRAME_COUNT, __u64 *pts)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_GET_FRAME_COUNT for this command.
-
-    -  .. row 3
-
-       -  __u64 \*pts
-
-       -  Returns the number of frames displayed since the decoder was
-	  started.
-
-Description
=2D-----------
-
-This ioctl is obsolete. Do not use in new drivers. For V4L2 decoders
-this ioctl has been replaced by the ``V4L2_CID_MPEG_VIDEO_DEC_FRAME``
-control.
-
-This ioctl call asks the Video Device to return the number of displayed
-frames since the decoder was started.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-get-pts.rst b/drivers/stag=
ing/media/av7110/video-get-pts.rst
deleted file mode 100644
index fedaff41b..000000000
=2D-- a/drivers/staging/media/av7110/video-get-pts.rst
+++ /dev/null
@@ -1,69 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_GET_PTS:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_GET_PTS
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_GET_PTS
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_GET_PTS
-
-``int ioctl(int fd, VIDEO_GET_PTS, __u64 *pts)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_GET_PTS for this command.
-
-    -  .. row 3
-
-       -  __u64 \*pts
-
-       -  Returns the 33-bit timestamp as defined in ITU T-REC-H.222.0 /
-	  ISO/IEC 13818-1.
-
-	  The PTS should belong to the currently played frame if possible,
-	  but may also be a value close to it like the PTS of the last
-	  decoded frame or the last PTS extracted by the PES parser.
-
-Description
=2D-----------
-
-This ioctl is obsolete. Do not use in new drivers. For V4L2 decoders
-this ioctl has been replaced by the ``V4L2_CID_MPEG_VIDEO_DEC_PTS``
-control.
-
-This ioctl call asks the Video Device to return the current PTS
-timestamp.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-get-size.rst b/drivers/sta=
ging/media/av7110/video-get-size.rst
deleted file mode 100644
index de34331c5..000000000
=2D-- a/drivers/staging/media/av7110/video-get-size.rst
+++ /dev/null
@@ -1,69 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_GET_SIZE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_GET_SIZE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_GET_SIZE
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_GET_SIZE
-
-``int ioctl(int fd, VIDEO_GET_SIZE, video_size_t *size)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_GET_SIZE for this command.
-
-    -  .. row 3
-
-       -  video_size_t \*size
-
-       -  Returns the size and aspect ratio.
-
-Description
=2D-----------
-
-This ioctl returns the size and aspect ratio.
-
-.. c:type:: video_size_t
-
-.. code-block::c
-
-	typedef struct {
-		int w;
-		int h;
-		video_format_t aspect_ratio;
-	} video_size_t;
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-get-status.rst b/drivers/s=
taging/media/av7110/video-get-status.rst
deleted file mode 100644
index 9b86fbf41..000000000
=2D-- a/drivers/staging/media/av7110/video-get-status.rst
+++ /dev/null
@@ -1,72 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_GET_STATUS:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_GET_STATUS
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_GET_STATUS
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_GET_STATUS
-
-``int ioctl(fd, VIDEO_GET_STATUS, struct video_status *status)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_GET_STATUS for this command.
-
-    -  .. row 3
-
-       -  struct video_status \*status
-
-       -  Returns the current status of the Video Device.
-
-Description
=2D-----------
-
-This ioctl call asks the Video Device to return the current status of
-the device.
-
-.. c:type:: video_status
-
-.. code-block:: c
-
-	struct video_status {
-		int                   video_blank;   /* blank video on freeze? */
-		video_play_state_t    play_state;    /* current state of playback */
-		video_stream_source_t stream_source; /* current source (demux/memory) *=
/
-		video_format_t        video_format;  /* current aspect ratio of stream*=
/
-		video_displayformat_t display_format;/* selected cropping mode */
-	};
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-play.rst b/drivers/staging=
/media/av7110/video-play.rst
deleted file mode 100644
index 35ac8b98f..000000000
=2D-- a/drivers/staging/media/av7110/video-play.rst
+++ /dev/null
@@ -1,57 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_PLAY:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_PLAY
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_PLAY
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_PLAY
-
-``int ioctl(fd, VIDEO_PLAY)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_PLAY for this command.
-
-Description
=2D-----------
-
-This ioctl is for Digital TV devices only. To control a V4L2 decoder use =
the
-V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
-
-This ioctl call asks the Video Device to start playing a video stream
-from the selected source.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-select-source.rst b/driver=
s/staging/media/av7110/video-select-source.rst
deleted file mode 100644
index 929a20985..000000000
=2D-- a/drivers/staging/media/av7110/video-select-source.rst
+++ /dev/null
@@ -1,76 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_SELECT_SOURCE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_SELECT_SOURCE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_SELECT_SOURCE
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_SELECT_SOURCE
-
-``int ioctl(fd, VIDEO_SELECT_SOURCE, video_stream_source_t source)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_SELECT_SOURCE for this command.
-
-    -  .. row 3
-
-       -  video_stream_source_t source
-
-       -  Indicates which source shall be used for the Video stream.
-
-Description
=2D-----------
-
-This ioctl is for Digital TV devices only. This ioctl was also supported =
by the
-V4L2 ivtv driver, but that has been replaced by the ivtv-specific
-``IVTV_IOC_PASSTHROUGH_MODE`` ioctl.
-
-This ioctl call informs the video device which source shall be used for
-the input data. The possible sources are demux or memory. If memory is
-selected, the data is fed to the video device through the write command.
-
-.. c:type:: video_stream_source_t
-
-.. code-block:: c
-
-	typedef enum {
-		VIDEO_SOURCE_DEMUX, /* Select the demux as the main source */
-		VIDEO_SOURCE_MEMORY /* If this source is selected, the stream
-				comes from the user through the write
-				system call */
-	} video_stream_source_t;
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-set-blank.rst b/drivers/st=
aging/media/av7110/video-set-blank.rst
deleted file mode 100644
index 70249a6ba..000000000
=2D-- a/drivers/staging/media/av7110/video-set-blank.rst
+++ /dev/null
@@ -1,64 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_SET_BLANK:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_SET_BLANK
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_SET_BLANK
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_SET_BLANK
-
-``int ioctl(fd, VIDEO_SET_BLANK, boolean mode)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_SET_BLANK for this command.
-
-    -  .. row 3
-
-       -  boolean mode
-
-       -  TRUE: Blank screen when stop.
-
-    -  .. row 4
-
-       -
-       -  FALSE: Show last decoded frame.
-
-Description
=2D-----------
-
-This ioctl call asks the Video Device to blank out the picture.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-set-display-format.rst b/d=
rivers/staging/media/av7110/video-set-display-format.rst
deleted file mode 100644
index 1de4f40ae..000000000
=2D-- a/drivers/staging/media/av7110/video-set-display-format.rst
+++ /dev/null
@@ -1,60 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_SET_DISPLAY_FORMAT:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_SET_DISPLAY_FORMAT
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_SET_DISPLAY_FORMAT
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_SET_DISPLAY_FORMAT
-
-``int ioctl(fd, VIDEO_SET_DISPLAY_FORMAT)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_SET_DISPLAY_FORMAT for this command.
-
-    -  .. row 3
-
-       -  video_display_format_t format
-
-       -  Selects the video format to be used.
-
-Description
=2D-----------
-
-This ioctl call asks the Video Device to select the video format to be
-applied by the MPEG chip on the video.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-set-format.rst b/drivers/s=
taging/media/av7110/video-set-format.rst
deleted file mode 100644
index bb64e37ae..000000000
=2D-- a/drivers/staging/media/av7110/video-set-format.rst
+++ /dev/null
@@ -1,82 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_SET_FORMAT:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_SET_FORMAT
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_SET_FORMAT
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_SET_FORMAT
-
-``int ioctl(fd, VIDEO_SET_FORMAT, video_format_t format)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_SET_FORMAT for this command.
-
-    -  .. row 3
-
-       -  video_format_t format
-
-       -  video format of TV as defined in section ??.
-
-Description
=2D-----------
-
-This ioctl sets the screen format (aspect ratio) of the connected output
-device (TV) so that the output of the decoder can be adjusted
-accordingly.
-
-.. c:type:: video_format_t
-
-.. code-block:: c
-
-	typedef enum {
-		VIDEO_FORMAT_4_3,     /* Select 4:3 format */
-		VIDEO_FORMAT_16_9,    /* Select 16:9 format. */
-		VIDEO_FORMAT_221_1    /* 2.21:1 */
-	} video_format_t;
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``EINVAL``
-
-       -  format is not a valid video format.
diff --git a/drivers/staging/media/av7110/video-set-streamtype.rst b/drive=
rs/staging/media/av7110/video-set-streamtype.rst
deleted file mode 100644
index 1f31c048b..000000000
=2D-- a/drivers/staging/media/av7110/video-set-streamtype.rst
+++ /dev/null
@@ -1,61 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_SET_STREAMTYPE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_SET_STREAMTYPE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_SET_STREAMTYPE
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_SET_STREAMTYPE
-
-``int ioctl(fd, VIDEO_SET_STREAMTYPE, int type)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_SET_STREAMTYPE for this command.
-
-    -  .. row 3
-
-       -  int type
-
-       -  stream type
-
-Description
=2D-----------
-
-This ioctl tells the driver which kind of stream to expect being written
-to it. If this call is not used the default of video PES is used. Some
-drivers might not support this call and always expect PES.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-slowmotion.rst b/drivers/s=
taging/media/av7110/video-slowmotion.rst
deleted file mode 100644
index 1478fcc30..000000000
=2D-- a/drivers/staging/media/av7110/video-slowmotion.rst
+++ /dev/null
@@ -1,72 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_SLOWMOTION:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_SLOWMOTION
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_SLOWMOTION
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_SLOWMOTION
-
-``int ioctl(fd, VIDEO_SLOWMOTION, int nFrames)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_SLOWMOTION for this command.
-
-    -  .. row 3
-
-       -  int nFrames
-
-       -  The number of times to repeat each frame.
-
-Description
=2D-----------
-
-This ioctl call asks the video device to repeat decoding frames N number
-of times. This call can only be used if VIDEO_SOURCE_MEMORY is
-selected.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
-
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  ``EPERM``
-
-       -  Mode VIDEO_SOURCE_MEMORY not selected.
diff --git a/drivers/staging/media/av7110/video-stillpicture.rst b/drivers=
/staging/media/av7110/video-stillpicture.rst
deleted file mode 100644
index d25384222..000000000
=2D-- a/drivers/staging/media/av7110/video-stillpicture.rst
+++ /dev/null
@@ -1,61 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_STILLPICTURE:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_STILLPICTURE
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_STILLPICTURE
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_STILLPICTURE
-
-``int ioctl(fd, VIDEO_STILLPICTURE, struct video_still_picture *sp)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_STILLPICTURE for this command.
-
-    -  .. row 3
-
-       -  struct video_still_picture \*sp
-
-       -  Pointer to a location where an I-frame and size is stored.
-
-Description
=2D-----------
-
-This ioctl call asks the Video Device to display a still picture
-(I-frame). The input data shall contain an I-frame. If the pointer is
-NULL, then the current displayed still picture is blanked.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-stop.rst b/drivers/staging=
/media/av7110/video-stop.rst
deleted file mode 100644
index 96f61c5b4..000000000
=2D-- a/drivers/staging/media/av7110/video-stop.rst
+++ /dev/null
@@ -1,74 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_STOP:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_STOP
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_STOP
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_STOP
-
-``int ioctl(fd, VIDEO_STOP, boolean mode)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_STOP for this command.
-
-    -  .. row 3
-
-       -  Boolean mode
-
-       -  Indicates how the screen shall be handled.
-
-    -  .. row 4
-
-       -
-       -  TRUE: Blank screen when stop.
-
-    -  .. row 5
-
-       -
-       -  FALSE: Show last decoded frame.
-
-Description
=2D-----------
-
-This ioctl is for Digital TV devices only. To control a V4L2 decoder use =
the
-V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
-
-This ioctl call asks the Video Device to stop playing the current
-stream. Depending on the input parameter, the screen can be blanked out
-or displaying the last decoded frame.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video-try-command.rst b/drivers/=
staging/media/av7110/video-try-command.rst
deleted file mode 100644
index 79bf3dfb8..000000000
=2D-- a/drivers/staging/media/av7110/video-try-command.rst
+++ /dev/null
@@ -1,66 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-.. c:namespace:: DTV.video
-
-.. _VIDEO_TRY_COMMAND:
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-VIDEO_TRY_COMMAND
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Name
=2D----
-
-VIDEO_TRY_COMMAND
-
-.. attention:: This ioctl is deprecated.
-
-Synopsis
=2D--------
-
-.. c:macro:: VIDEO_TRY_COMMAND
-
-``int ioctl(int fd, VIDEO_TRY_COMMAND, struct video_command *cmd)``
-
-Arguments
=2D---------
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-
-    -  .. row 1
-
-       -  int fd
-
-       -  File descriptor returned by a previous call to open().
-
-    -  .. row 2
-
-       -  int request
-
-       -  Equals VIDEO_TRY_COMMAND for this command.
-
-    -  .. row 3
-
-       -  struct video_command \*cmd
-
-       -  Try a decoder command.
-
-Description
=2D-----------
-
-This ioctl is obsolete. Do not use in new drivers. For V4L2 decoders
-this ioctl has been replaced by the
-:ref:`VIDIOC_TRY_DECODER_CMD <VIDIOC_DECODER_CMD>` ioctl.
-
-This ioctl tries a decoder command. The ``video_command`` struct is a
-subset of the ``v4l2_decoder_cmd`` struct, so refer to the
-:ref:`VIDIOC_TRY_DECODER_CMD <VIDIOC_DECODER_CMD>` documentation
-for more information.
-
-Return Value
=2D------------
-
-On success 0 is returned, on error -1 and the ``errno`` variable is set
-appropriately. The generic error codes are described at the
-:ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/drivers/staging/media/av7110/video.rst b/drivers/staging/medi=
a/av7110/video.rst
deleted file mode 100644
index 808705b76..000000000
=2D-- a/drivers/staging/media/av7110/video.rst
+++ /dev/null
@@ -1,36 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _dvb_video:
-
-#######################
-Digital TV Video Device
-#######################
-
-The Digital TV video device controls the MPEG2 video decoder of the Digit=
al
-TV hardware. It can be accessed through **/dev/dvb/adapter0/video0**. Dat=
a
-types and ioctl definitions can be accessed by including
-**linux/dvb/video.h** in your application.
-
-Note that the Digital TV video device only controls decoding of the MPEG =
video
-stream, not its presentation on the TV or computer screen. On PCs this
-is typically handled by an associated video4linux device, e.g.
-**/dev/video**, which allows scaling and defining output windows.
-
-Some Digital TV cards don't have their own MPEG decoder, which results in=
 the
-omission of the audio and video device as well as the video4linux
-device.
-
-The ioctls that deal with SPUs (sub picture units) and navigation
-packets are only supported on some MPEG decoders made for DVD playback.
-
-These ioctls were also used by V4L2 to control MPEG decoders implemented
-in V4L2. The use of these ioctls for that purpose has been made obsolete
-and proper V4L2 ioctls or controls have been created to replace that
-functionality.
-
-
-.. toctree::
-    :maxdepth: 1
-
-    video_types
-    video_function_calls
diff --git a/drivers/staging/media/av7110/video_function_calls.rst b/drive=
rs/staging/media/av7110/video_function_calls.rst
deleted file mode 100644
index 20a897be5..000000000
=2D-- a/drivers/staging/media/av7110/video_function_calls.rst
+++ /dev/null
@@ -1,35 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _video_function_calls:
-
-********************
-Video Function Calls
-********************
-
-.. toctree::
-    :maxdepth: 1
-
-    video-fopen
-    video-fclose
-    video-fwrite
-    video-stop
-    video-play
-    video-freeze
-    video-continue
-    video-select-source
-    video-set-blank
-    video-get-status
-    video-get-frame-count
-    video-get-pts
-    video-get-event
-    video-command
-    video-try-command
-    video-get-size
-    video-set-display-format
-    video-stillpicture
-    video-fast-forward
-    video-slowmotion
-    video-get-capabilities
-    video-clear-buffer
-    video-set-streamtype
-    video-set-format
diff --git a/drivers/staging/media/av7110/video_types.rst b/drivers/stagin=
g/media/av7110/video_types.rst
deleted file mode 100644
index c4557d328..000000000
=2D-- a/drivers/staging/media/av7110/video_types.rst
+++ /dev/null
@@ -1,248 +0,0 @@
-.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
-
-.. _video_types:
-
-****************
-Video Data Types
-****************
-
-
-.. _video-format-t:
-
-video_format_t
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The ``video_format_t`` data type defined by
-
-
-.. code-block:: c
-
-    typedef enum {
-	VIDEO_FORMAT_4_3,     /* Select 4:3 format */
-	VIDEO_FORMAT_16_9,    /* Select 16:9 format. */
-	VIDEO_FORMAT_221_1    /* 2.21:1 */
-    } video_format_t;
-
-is used in the VIDEO_SET_FORMAT function (??) to tell the driver which
-aspect ratio the output hardware (e.g. TV) has. It is also used in the
-data structures video_status (??) returned by VIDEO_GET_STATUS (??)
-and video_event (??) returned by VIDEO_GET_EVENT (??) which report
-about the display format of the current video stream.
-
-
-.. _video-displayformat-t:
-
-video_displayformat_t
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-In case the display format of the video stream and of the display
-hardware differ the application has to specify how to handle the
-cropping of the picture. This can be done using the
-VIDEO_SET_DISPLAY_FORMAT call (??) which accepts
-
-
-.. code-block:: c
-
-    typedef enum {
-	VIDEO_PAN_SCAN,       /* use pan and scan format */
-	VIDEO_LETTER_BOX,     /* use letterbox format */
-	VIDEO_CENTER_CUT_OUT  /* use center cut out format */
-    } video_displayformat_t;
-
-as argument.
-
-
-.. _video-stream-source-t:
-
-video_stream_source_t
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The video stream source is set through the VIDEO_SELECT_SOURCE call
-and can take the following values, depending on whether we are replaying
-from an internal (demuxer) or external (user write) source.
-
-
-.. code-block:: c
-
-    typedef enum {
-	VIDEO_SOURCE_DEMUX, /* Select the demux as the main source */
-	VIDEO_SOURCE_MEMORY /* If this source is selected, the stream
-		       comes from the user through the write
-		       system call */
-    } video_stream_source_t;
-
-VIDEO_SOURCE_DEMUX selects the demultiplexer (fed either by the
-frontend or the DVR device) as the source of the video stream. If
-VIDEO_SOURCE_MEMORY is selected the stream comes from the application
-through the **write()** system call.
-
-
-.. _video-play-state-t:
-
-video_play_state_t
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The following values can be returned by the VIDEO_GET_STATUS call
-representing the state of video playback.
-
-
-.. code-block:: c
-
-    typedef enum {
-	VIDEO_STOPPED, /* Video is stopped */
-	VIDEO_PLAYING, /* Video is currently playing */
-	VIDEO_FREEZED  /* Video is freezed */
-    } video_play_state_t;
-
-
-.. c:type:: video_command
-
-struct video_command
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The structure must be zeroed before use by the application This ensures
-it can be extended safely in the future.
-
-
-.. code-block:: c
-
-    struct video_command {
-	__u32 cmd;
-	__u32 flags;
-	union {
-	    struct {
-		__u64 pts;
-	    } stop;
-
-	    struct {
-		/* 0 or 1000 specifies normal speed,
-		   1 specifies forward single stepping,
-		   -1 specifies backward single stepping,
-		   >>1: playback at speed/1000 of the normal speed,
-		   <-1: reverse playback at (-speed/1000) of the normal speed. */
-		__s32 speed;
-		__u32 format;
-	    } play;
-
-	    struct {
-		__u32 data[16];
-	    } raw;
-	};
-    };
-
-
-.. _video-size-t:
-
-video_size_t
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-
-.. code-block:: c
-
-    typedef struct {
-	int w;
-	int h;
-	video_format_t aspect_ratio;
-    } video_size_t;
-
-
-.. c:type:: video_event
-
-struct video_event
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The following is the structure of a video event as it is returned by the
-VIDEO_GET_EVENT call.
-
-
-.. code-block:: c
-
-    struct video_event {
-	__s32 type;
-    #define VIDEO_EVENT_SIZE_CHANGED    1
-    #define VIDEO_EVENT_FRAME_RATE_CHANGED  2
-    #define VIDEO_EVENT_DECODER_STOPPED     3
-    #define VIDEO_EVENT_VSYNC       4
-	long timestamp;
-	union {
-	    video_size_t size;
-	    unsigned int frame_rate;    /* in frames per 1000sec */
-	    unsigned char vsync_field;  /* unknown/odd/even/progressive */
-	} u;
-    };
-
-
-.. c:type:: video_status
-
-struct video_status
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The VIDEO_GET_STATUS call returns the following structure informing
-about various states of the playback operation.
-
-
-.. code-block:: c
-
-    struct video_status {
-	int                   video_blank;   /* blank video on freeze? */
-	video_play_state_t    play_state;    /* current state of playback */
-	video_stream_source_t stream_source; /* current source (demux/memory) */
-	video_format_t        video_format;  /* current aspect ratio of stream *=
/
-	video_displayformat_t display_format;/* selected cropping mode */
-    };
-
-If video_blank is set video will be blanked out if the channel is
-changed or if playback is stopped. Otherwise, the last picture will be
-displayed. play_state indicates if the video is currently frozen,
-stopped, or being played back. The stream_source corresponds to the
-selected source for the video stream. It can come either from the
-demultiplexer or from memory. The video_format indicates the aspect
-ratio (one of 4:3 or 16:9) of the currently played video stream.
-Finally, display_format corresponds to the selected cropping mode in
-case the source video format is not the same as the format of the output
-device.
-
-
-.. c:type:: video_still_picture
-
-struct video_still_picture
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-
-An I-frame displayed via the VIDEO_STILLPICTURE call is passed on
-within the following structure.
-
-
-.. code-block:: c
-
-    /* pointer to and size of a single iframe in memory */
-    struct video_still_picture {
-	char *iFrame;        /* pointer to a single iframe in memory */
-	int32_t size;
-    };
-
-
-.. _video_caps:
-
-video capabilities
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-A call to VIDEO_GET_CAPABILITIES returns an unsigned integer with the
-following bits set according to the hardwares capabilities.
-
-
-.. code-block:: c
-
-     /* bit definitions for capabilities: */
-     /* can the hardware decode MPEG1 and/or MPEG2? */
-     #define VIDEO_CAP_MPEG1   1
-     #define VIDEO_CAP_MPEG2   2
-     /* can you send a system and/or program stream to video device?
-	(you still have to open the video and the audio device but only
-	 send the stream to the video device) */
-     #define VIDEO_CAP_SYS     4
-     #define VIDEO_CAP_PROG    8
-     /* can the driver also handle SPU, NAVI and CSS encoded data?
-	(CSS API is not present yet) */
-     #define VIDEO_CAP_SPU    16
-     #define VIDEO_CAP_NAVI   32
-     #define VIDEO_CAP_CSS    64
=2D-
2.34.0


