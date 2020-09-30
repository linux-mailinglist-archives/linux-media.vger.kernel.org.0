Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD68127E983
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 15:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730409AbgI3NZw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 09:25:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730229AbgI3NZ0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:26 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 458B02193E;
        Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472320;
        bh=vVPYebmGndVlK3Z/0axuxsBRSroJl7wcuCH5ZfI2DFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d5Xq4PM+xYq7T8eAlX9JhtSPpscYVxRmIZHTA9hRMvfRZSaviuP4mMCDt5VqW/DmG
         yoPxWA+o4icGg3uk8N0+1nAr6q8NQAKbgaKneCaulafnXF+fhXq1XNQiDuzSZpKvkE
         Xxi4R6Z14akaKefn1MC7utO9UETjHbDvKRGR1Sjw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6g-001XJU-8A; Wed, 30 Sep 2020 15:25:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 14/52] media: docs: make DVB documents more compatible with Sphinx 3.1+
Date:   Wed, 30 Sep 2020 15:24:37 +0200
Message-Id: <ef93c2bcf50b562704a45bc3b35b0e79e4f39e94.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 .../dvb/audio-bilingual-channel-select.rst      |  7 +++----
 .../media/dvb/audio-channel-select.rst          |  8 +++-----
 .../media/dvb/audio-clear-buffer.rst            |  8 ++++----
 .../userspace-api/media/dvb/audio-continue.rst  |  7 +++----
 .../userspace-api/media/dvb/audio-fclose.rst    |  7 +------
 .../userspace-api/media/dvb/audio-fopen.rst     |  7 +------
 .../userspace-api/media/dvb/audio-fwrite.rst    |  7 +------
 .../media/dvb/audio-get-capabilities.rst        |  8 +++-----
 .../media/dvb/audio-get-status.rst              |  8 +++-----
 .../userspace-api/media/dvb/audio-pause.rst     |  9 ++++-----
 .../userspace-api/media/dvb/audio-play.rst      |  7 +++----
 .../media/dvb/audio-select-source.rst           |  8 +++-----
 .../media/dvb/audio-set-av-sync.rst             |  8 +++-----
 .../media/dvb/audio-set-bypass-mode.rst         |  9 ++++-----
 .../userspace-api/media/dvb/audio-set-id.rst    |  9 ++++-----
 .../userspace-api/media/dvb/audio-set-mixer.rst |  9 ++++-----
 .../userspace-api/media/dvb/audio-set-mute.rst  |  8 +++-----
 .../media/dvb/audio-set-streamtype.rst          | 10 +++-------
 .../userspace-api/media/dvb/audio-stop.rst      |  9 ++++-----
 .../userspace-api/media/dvb/ca-fclose.rst       |  7 ++-----
 .../userspace-api/media/dvb/ca-fopen.rst        |  7 +------
 .../userspace-api/media/dvb/ca-get-cap.rst      |  8 ++++----
 .../media/dvb/ca-get-descr-info.rst             |  9 +++++----
 .../userspace-api/media/dvb/ca-get-msg.rst      | 10 ++++------
 .../media/dvb/ca-get-slot-info.rst              |  9 ++++-----
 .../userspace-api/media/dvb/ca-reset.rst        |  9 ++++-----
 .../userspace-api/media/dvb/ca-send-msg.rst     |  9 ++++-----
 .../userspace-api/media/dvb/ca-set-descr.rst    |  8 ++++----
 .../userspace-api/media/dvb/dmx-add-pid.rst     | 10 ++++------
 .../userspace-api/media/dvb/dmx-expbuf.rst      | 11 ++++-------
 .../userspace-api/media/dvb/dmx-fclose.rst      |  9 +++------
 .../userspace-api/media/dvb/dmx-fopen.rst       |  5 +----
 .../userspace-api/media/dvb/dmx-fread.rst       |  7 ++-----
 .../userspace-api/media/dvb/dmx-fwrite.rst      |  6 ++----
 .../media/dvb/dmx-get-pes-pids.rst              | 12 +++++-------
 .../userspace-api/media/dvb/dmx-get-stc.rst     | 12 +++++-------
 .../userspace-api/media/dvb/dmx-mmap.rst        | 15 ++++++---------
 .../userspace-api/media/dvb/dmx-munmap.rst      | 14 +++++---------
 .../userspace-api/media/dvb/dmx-qbuf.rst        | 17 ++++++++---------
 .../userspace-api/media/dvb/dmx-querybuf.rst    |  9 ++++-----
 .../userspace-api/media/dvb/dmx-remove-pid.rst  | 10 ++++------
 .../userspace-api/media/dvb/dmx-reqbufs.rst     |  9 ++++-----
 .../media/dvb/dmx-set-buffer-size.rst           | 10 ++++------
 .../userspace-api/media/dvb/dmx-set-filter.rst  | 12 +++++-------
 .../media/dvb/dmx-set-pes-filter.rst            | 13 ++++---------
 .../userspace-api/media/dvb/dmx-start.rst       | 11 ++++-------
 .../userspace-api/media/dvb/dmx-stop.rst        |  9 ++++-----
 .../media/dvb/fe-diseqc-recv-slave-reply.rst    |  9 ++++-----
 .../media/dvb/fe-diseqc-reset-overload.rst      |  9 ++++-----
 .../media/dvb/fe-diseqc-send-burst.rst          | 10 ++++------
 .../media/dvb/fe-diseqc-send-master-cmd.rst     |  9 ++++-----
 .../dvb/fe-dishnetwork-send-legacy-cmd.rst      | 10 ++++------
 .../media/dvb/fe-enable-high-lnb-voltage.rst    | 10 ++++------
 .../userspace-api/media/dvb/fe-get-event.rst    | 12 ++++--------
 .../userspace-api/media/dvb/fe-get-frontend.rst | 12 ++++--------
 .../userspace-api/media/dvb/fe-get-info.rst     | 11 ++++-------
 .../userspace-api/media/dvb/fe-get-property.rst | 15 +++++++--------
 .../userspace-api/media/dvb/fe-read-ber.rst     |  9 ++++-----
 .../media/dvb/fe-read-signal-strength.rst       |  9 ++++-----
 .../userspace-api/media/dvb/fe-read-snr.rst     |  9 ++++-----
 .../userspace-api/media/dvb/fe-read-status.rst  | 11 ++++-------
 .../media/dvb/fe-read-uncorrected-blocks.rst    |  9 ++++-----
 .../media/dvb/fe-set-frontend-tune-mode.rst     | 10 ++++------
 .../userspace-api/media/dvb/fe-set-frontend.rst | 11 ++++-------
 .../userspace-api/media/dvb/fe-set-tone.rst     | 10 ++++------
 .../userspace-api/media/dvb/fe-set-voltage.rst  | 10 ++++------
 .../media/dvb/frontend_f_close.rst              |  8 ++------
 .../userspace-api/media/dvb/frontend_f_open.rst | 10 ++--------
 .../userspace-api/media/dvb/net-add-if.rst      |  9 ++++-----
 .../userspace-api/media/dvb/net-get-if.rst      | 10 ++++------
 .../userspace-api/media/dvb/net-remove-if.rst   | 10 ++++------
 .../media/dvb/video-clear-buffer.rst            |  8 +++-----
 .../userspace-api/media/dvb/video-command.rst   | 10 ++++------
 .../userspace-api/media/dvb/video-continue.rst  |  8 +++-----
 .../media/dvb/video-fast-forward.rst            | 10 +++-------
 .../userspace-api/media/dvb/video-fclose.rst    |  6 +-----
 .../userspace-api/media/dvb/video-fopen.rst     |  6 +-----
 .../userspace-api/media/dvb/video-freeze.rst    |  8 +++-----
 .../userspace-api/media/dvb/video-fwrite.rst    |  6 +-----
 .../media/dvb/video-get-capabilities.rst        |  8 +++-----
 .../userspace-api/media/dvb/video-get-event.rst |  8 +++-----
 .../media/dvb/video-get-frame-count.rst         |  8 +++-----
 .../userspace-api/media/dvb/video-get-pts.rst   |  8 +++-----
 .../userspace-api/media/dvb/video-get-size.rst  |  8 +++-----
 .../media/dvb/video-get-status.rst              |  7 +++----
 .../userspace-api/media/dvb/video-play.rst      |  8 +++-----
 .../media/dvb/video-select-source.rst           |  7 +++----
 .../userspace-api/media/dvb/video-set-blank.rst |  8 +++-----
 .../media/dvb/video-set-display-format.rst      |  8 +++-----
 .../media/dvb/video-set-format.rst              |  9 +++------
 .../media/dvb/video-set-streamtype.rst          |  8 +++-----
 .../media/dvb/video-slowmotion.rst              | 10 +++-------
 .../media/dvb/video-stillpicture.rst            |  8 +++-----
 .../userspace-api/media/dvb/video-stop.rst      |  8 +++-----
 .../media/dvb/video-try-command.rst             |  8 +++-----
 95 files changed, 329 insertions(+), 534 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst b/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
index ba4f48b30d29..33b5363317f1 100644
--- a/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
+++ b/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_BILINGUAL_CHANNEL_SELECT:
 
@@ -16,9 +17,9 @@ AUDIO_BILINGUAL_CHANNEL_SELECT
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, AUDIO_BILINGUAL_CHANNEL_SELECT, struct *audio_channel_select)
-    :name: AUDIO_BILINGUAL_CHANNEL_SELECT
+.. c:macro:: AUDIO_BILINGUAL_CHANNEL_SELECT
 
+``int ioctl(int fd, AUDIO_BILINGUAL_CHANNEL_SELECT, struct audio_channel_select *select)``
 
 Arguments
 ---------
@@ -39,7 +40,6 @@ Arguments
 
        -  Select the output format of the audio (mono left/right, stereo).
 
-
 Description
 -----------
 
@@ -50,7 +50,6 @@ for MPEG decoders controlled through V4L2.
 This ioctl call asks the Audio Device to select the requested channel
 for bilingual streams if possible.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-channel-select.rst b/Documentation/userspace-api/media/dvb/audio-channel-select.rst
index ba83b639d955..74093df92a68 100644
--- a/Documentation/userspace-api/media/dvb/audio-channel-select.rst
+++ b/Documentation/userspace-api/media/dvb/audio-channel-select.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_CHANNEL_SELECT:
 
@@ -16,9 +17,9 @@ AUDIO_CHANNEL_SELECT
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, AUDIO_CHANNEL_SELECT, struct *audio_channel_select)
-    :name: AUDIO_CHANNEL_SELECT
+.. c:macro:: AUDIO_CHANNEL_SELECT
 
+``int ioctl(int fd, AUDIO_CHANNEL_SELECT, struct audio_channel_select *select)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -40,7 +40,6 @@ Arguments
 
        -  Select the output format of the audio (mono left/right, stereo).
 
-
 Description
 -----------
 
@@ -50,7 +49,6 @@ V4L2 ``V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK`` control instead.
 This ioctl call asks the Audio Device to select the requested channel if
 possible.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-clear-buffer.rst b/Documentation/userspace-api/media/dvb/audio-clear-buffer.rst
index 7035a40c0e3a..a0ebb0278260 100644
--- a/Documentation/userspace-api/media/dvb/audio-clear-buffer.rst
+++ b/Documentation/userspace-api/media/dvb/audio-clear-buffer.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_CLEAR_BUFFER:
 
@@ -16,8 +17,9 @@ AUDIO_CLEAR_BUFFER
 Synopsis
 --------
 
-.. c:function:: int  ioctl(int fd, AUDIO_CLEAR_BUFFER)
-    :name: AUDIO_CLEAR_BUFFER
+.. c:macro:: AUDIO_CLEAR_BUFFER
+
+``int ioctl(int fd, AUDIO_CLEAR_BUFFER)``
 
 Arguments
 ---------
@@ -26,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -39,7 +40,6 @@ Description
 This ioctl call asks the Audio Device to clear all software and hardware
 buffers of the audio decoder device.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-continue.rst b/Documentation/userspace-api/media/dvb/audio-continue.rst
index c8d514a4eeb0..a2e9850f37f2 100644
--- a/Documentation/userspace-api/media/dvb/audio-continue.rst
+++ b/Documentation/userspace-api/media/dvb/audio-continue.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_CONTINUE:
 
@@ -16,9 +17,9 @@ AUDIO_CONTINUE
 Synopsis
 --------
 
-.. c:function:: int  ioctl(int fd, AUDIO_CONTINUE)
-    :name: AUDIO_CONTINUE
+.. c:macro:: AUDIO_CONTINUE
 
+``int ioctl(int fd, AUDIO_CONTINUE)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -40,7 +40,6 @@ Description
 This ioctl restarts the decoding and playing process previously paused
 with AUDIO_PAUSE command.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-fclose.rst b/Documentation/userspace-api/media/dvb/audio-fclose.rst
index c968177b1e3f..77857d578e83 100644
--- a/Documentation/userspace-api/media/dvb/audio-fclose.rst
+++ b/Documentation/userspace-api/media/dvb/audio-fclose.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _audio_fclose:
 
@@ -17,8 +18,6 @@ Synopsis
 --------
 
 .. c:function:: int close(int fd)
-    :name: dvb-audio-close
-
 
 Arguments
 ---------
@@ -27,20 +26,17 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
 
        -  File descriptor returned by a previous call to open().
 
-
 Description
 -----------
 
 This system call closes a previously opened audio device.
 
-
 Return Value
 ------------
 
@@ -48,7 +44,6 @@ Return Value
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EBADF``
diff --git a/Documentation/userspace-api/media/dvb/audio-fopen.rst b/Documentation/userspace-api/media/dvb/audio-fopen.rst
index d34001e038dc..774daaab3bad 100644
--- a/Documentation/userspace-api/media/dvb/audio-fopen.rst
+++ b/Documentation/userspace-api/media/dvb/audio-fopen.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _audio_fopen:
 
@@ -17,8 +18,6 @@ Synopsis
 --------
 
 .. c:function:: int open(const char *deviceName, int flags)
-    :name: dvb-audio-open
-
 
 Arguments
 ---------
@@ -27,7 +26,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  const char \*deviceName
@@ -60,7 +58,6 @@ Arguments
        -
        -  (blocking mode is the default)
 
-
 Description
 -----------
 
@@ -78,7 +75,6 @@ fail, and an error code will be returned. If the Audio Device is opened
 in O_RDONLY mode, the only ioctl call that can be used is
 AUDIO_GET_STATUS. All other call will return with an error code.
 
-
 Return Value
 ------------
 
@@ -88,7 +84,6 @@ Return Value
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``ENODEV``
diff --git a/Documentation/userspace-api/media/dvb/audio-fwrite.rst b/Documentation/userspace-api/media/dvb/audio-fwrite.rst
index d17ec719e231..7b096ac2b6c4 100644
--- a/Documentation/userspace-api/media/dvb/audio-fwrite.rst
+++ b/Documentation/userspace-api/media/dvb/audio-fwrite.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _audio_fwrite:
 
@@ -17,8 +18,6 @@ Synopsis
 --------
 
 .. c:function:: size_t write(int fd, const void *buf, size_t count)
-    :name: dvb-audio-write
-
 
 Arguments
 ---------
@@ -27,7 +26,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +44,6 @@ Arguments
 
        -  Size of buf.
 
-
 Description
 -----------
 
@@ -56,7 +53,6 @@ PES format. If O_NONBLOCK is not specified the function will block
 until buffer space is available. The amount of data to be transferred is
 implied by count.
 
-
 Return Value
 ------------
 
@@ -64,7 +60,6 @@ Return Value
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EPERM``
diff --git a/Documentation/userspace-api/media/dvb/audio-get-capabilities.rst b/Documentation/userspace-api/media/dvb/audio-get-capabilities.rst
index 33907e40e48c..6d9eb71dad17 100644
--- a/Documentation/userspace-api/media/dvb/audio-get-capabilities.rst
+++ b/Documentation/userspace-api/media/dvb/audio-get-capabilities.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_GET_CAPABILITIES:
 
@@ -16,9 +17,9 @@ AUDIO_GET_CAPABILITIES
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, AUDIO_GET_CAPABILITIES, unsigned int *cap)
-    :name: AUDIO_GET_CAPABILITIES
+.. c:macro:: AUDIO_GET_CAPABILITIES
 
+``int ioctl(int fd, AUDIO_GET_CAPABILITIES, unsigned int *cap)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -40,14 +40,12 @@ Arguments
 
        -  Returns a bit array of supported sound formats.
 
-
 Description
 -----------
 
 This ioctl call asks the Audio Device to tell us about the decoding
 capabilities of the audio hardware.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-get-status.rst b/Documentation/userspace-api/media/dvb/audio-get-status.rst
index 4213d076c6ed..7ae8db2e65e9 100644
--- a/Documentation/userspace-api/media/dvb/audio-get-status.rst
+++ b/Documentation/userspace-api/media/dvb/audio-get-status.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_GET_STATUS:
 
@@ -16,9 +17,9 @@ AUDIO_GET_STATUS
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, AUDIO_GET_STATUS, struct audio_status *status)
-    :name: AUDIO_GET_STATUS
+.. c:macro:: AUDIO_GET_STATUS
 
+``int ioctl(int fd, AUDIO_GET_STATUS, struct audio_status *status)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -40,14 +40,12 @@ Arguments
 
        -  Returns the current state of Audio Device.
 
-
 Description
 -----------
 
 This ioctl call asks the Audio Device to return the current state of the
 Audio Device.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-pause.rst b/Documentation/userspace-api/media/dvb/audio-pause.rst
index 2de74f1662cf..d37d1ddce4df 100644
--- a/Documentation/userspace-api/media/dvb/audio-pause.rst
+++ b/Documentation/userspace-api/media/dvb/audio-pause.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_PAUSE:
 
@@ -16,8 +17,9 @@ AUDIO_PAUSE
 Synopsis
 --------
 
-.. c:function:: int  ioctl(int fd, AUDIO_PAUSE)
-    :name: AUDIO_PAUSE
+.. c:macro:: AUDIO_PAUSE
+
+``int ioctl(int fd, AUDIO_PAUSE)``
 
 Arguments
 ---------
@@ -26,14 +28,12 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
 
        -  File descriptor returned by a previous call to open().
 
-
 Description
 -----------
 
@@ -41,7 +41,6 @@ This ioctl call suspends the audio stream being played. Decoding and
 playing are paused. It is then possible to restart again decoding and
 playing process of the audio stream using AUDIO_CONTINUE command.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-play.rst b/Documentation/userspace-api/media/dvb/audio-play.rst
index d4e4eacb8686..e591930b6ca7 100644
--- a/Documentation/userspace-api/media/dvb/audio-play.rst
+++ b/Documentation/userspace-api/media/dvb/audio-play.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_PLAY:
 
@@ -16,9 +17,9 @@ AUDIO_PLAY
 Synopsis
 --------
 
-.. c:function:: int  ioctl(int fd, AUDIO_PLAY)
-    :name: AUDIO_PLAY
+.. c:macro:: AUDIO_PLAY
 
+``int ioctl(int fd, AUDIO_PLAY)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -40,7 +40,6 @@ Description
 This ioctl call asks the Audio Device to start playing an audio stream
 from the selected source.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-select-source.rst b/Documentation/userspace-api/media/dvb/audio-select-source.rst
index fb09f914cb8f..6a0c0f365eb1 100644
--- a/Documentation/userspace-api/media/dvb/audio-select-source.rst
+++ b/Documentation/userspace-api/media/dvb/audio-select-source.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_SELECT_SOURCE:
 
@@ -16,9 +17,9 @@ AUDIO_SELECT_SOURCE
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, AUDIO_SELECT_SOURCE, struct audio_stream_source *source)
-    :name: AUDIO_SELECT_SOURCE
+.. c:macro:: AUDIO_SELECT_SOURCE
 
+``int ioctl(int fd, AUDIO_SELECT_SOURCE, struct audio_stream_source *source)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -40,7 +40,6 @@ Arguments
 
        -  Indicates the source that shall be used for the Audio stream.
 
-
 Description
 -----------
 
@@ -49,7 +48,6 @@ the input data. The possible sources are demux or memory. If
 AUDIO_SOURCE_MEMORY is selected, the data is fed to the Audio Device
 through the write command.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-set-av-sync.rst b/Documentation/userspace-api/media/dvb/audio-set-av-sync.rst
index 5bcb9b1ed19d..85a8016bf025 100644
--- a/Documentation/userspace-api/media/dvb/audio-set-av-sync.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-av-sync.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_SET_AV_SYNC:
 
@@ -16,9 +17,9 @@ AUDIO_SET_AV_SYNC
 Synopsis
 --------
 
-.. c:function:: int  ioctl(int fd, AUDIO_SET_AV_SYNC, boolean state)
-    :name: AUDIO_SET_AV_SYNC
+.. c:macro:: AUDIO_SET_AV_SYNC
 
+``int ioctl(int fd, AUDIO_SET_AV_SYNC, boolean state)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -44,14 +44,12 @@ Arguments
 
           FALSE: AV-sync OFF
 
-
 Description
 -----------
 
 This ioctl call asks the Audio Device to turn ON or OFF A/V
 synchronization.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst b/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
index f24a18bbb567..ecac02f1b2fc 100644
--- a/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_SET_BYPASS_MODE:
 
@@ -16,8 +17,9 @@ AUDIO_SET_BYPASS_MODE
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, AUDIO_SET_BYPASS_MODE, boolean mode)
-    :name: AUDIO_SET_BYPASS_MODE
+.. c:macro:: AUDIO_SET_BYPASS_MODE
+
+``int ioctl(int fd, AUDIO_SET_BYPASS_MODE, boolean mode)``
 
 Arguments
 ---------
@@ -26,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -44,7 +45,6 @@ Arguments
 
           FALSE: Bypass is enabled
 
-
 Description
 -----------
 
@@ -54,7 +54,6 @@ that can’t be handled by the Digital TV system shall be decoded. Dolby
 DigitalTM streams are automatically forwarded by the Digital TV subsystem if
 the hardware can handle it.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-set-id.rst b/Documentation/userspace-api/media/dvb/audio-set-id.rst
index 0227e1071d0c..39ad846d412d 100644
--- a/Documentation/userspace-api/media/dvb/audio-set-id.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-id.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_SET_ID:
 
@@ -16,8 +17,9 @@ AUDIO_SET_ID
 Synopsis
 --------
 
-.. c:function:: int  ioctl(int fd, AUDIO_SET_ID, int id)
-    :name: AUDIO_SET_ID
+.. c:macro:: AUDIO_SET_ID
+
+``int ioctl(int fd, AUDIO_SET_ID, int id)``
 
 Arguments
 ---------
@@ -26,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -39,7 +40,6 @@ Arguments
 
        -  audio sub-stream id
 
-
 Description
 -----------
 
@@ -51,7 +51,6 @@ other stream types. If the stream type is set the id just specifies the
 substream id of the audio stream and only the first 5 bits are
 recognized.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-set-mixer.rst b/Documentation/userspace-api/media/dvb/audio-set-mixer.rst
index 58f18cf8240d..45dbdf4801e0 100644
--- a/Documentation/userspace-api/media/dvb/audio-set-mixer.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-mixer.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_SET_MIXER:
 
@@ -16,8 +17,9 @@ AUDIO_SET_MIXER
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, AUDIO_SET_MIXER, struct audio_mixer *mix)
-    :name: AUDIO_SET_MIXER
+.. c:macro:: AUDIO_SET_MIXER
+
+``int ioctl(int fd, AUDIO_SET_MIXER, struct audio_mixer *mix)``
 
 Arguments
 ---------
@@ -26,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -39,13 +40,11 @@ Arguments
 
        -  mixer settings.
 
-
 Description
 -----------
 
 This ioctl lets you adjust the mixer settings of the audio decoder.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-set-mute.rst b/Documentation/userspace-api/media/dvb/audio-set-mute.rst
index 7ea7d8663e6b..987751f92967 100644
--- a/Documentation/userspace-api/media/dvb/audio-set-mute.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-mute.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_SET_MUTE:
 
@@ -16,9 +17,9 @@ AUDIO_SET_MUTE
 Synopsis
 --------
 
-.. c:function:: int  ioctl(int fd, AUDIO_SET_MUTE, boolean state)
-    :name: AUDIO_SET_MUTE
+.. c:macro:: AUDIO_SET_MUTE
 
+``int ioctl(int fd, AUDIO_SET_MUTE, boolean state)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -44,7 +44,6 @@ Arguments
 
           FALSE: Audio Un-mute
 
-
 Description
 -----------
 
@@ -55,7 +54,6 @@ V4L2 :ref:`VIDIOC_DECODER_CMD` with the
 This ioctl call asks the audio device to mute the stream that is
 currently being played.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/audio-set-streamtype.rst b/Documentation/userspace-api/media/dvb/audio-set-streamtype.rst
index d9f4924afdbe..77d73c74882f 100644
--- a/Documentation/userspace-api/media/dvb/audio-set-streamtype.rst
+++ b/Documentation/userspace-api/media/dvb/audio-set-streamtype.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_SET_STREAMTYPE:
 
@@ -16,9 +17,9 @@ AUDIO_SET_STREAMTYPE
 Synopsis
 --------
 
-.. c:function:: int  ioctl(fd, AUDIO_SET_STREAMTYPE, int type)
-    :name: AUDIO_SET_STREAMTYPE
+.. c:macro:: AUDIO_SET_STREAMTYPE
 
+``int ioctl(fd, AUDIO_SET_STREAMTYPE, int type)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -
 
        -  int fd
@@ -40,7 +40,6 @@ Arguments
 
        -  stream type
 
-
 Description
 -----------
 
@@ -48,7 +47,6 @@ This ioctl tells the driver which kind of audio stream to expect. This
 is useful if the stream offers several audio sub-streams like LPCM and
 AC3.
 
-
 Return Value
 ------------
 
@@ -57,12 +55,10 @@ appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
 
-
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EINVAL``
diff --git a/Documentation/userspace-api/media/dvb/audio-stop.rst b/Documentation/userspace-api/media/dvb/audio-stop.rst
index 3a2bc328626d..d77f786fd797 100644
--- a/Documentation/userspace-api/media/dvb/audio-stop.rst
+++ b/Documentation/userspace-api/media/dvb/audio-stop.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.audio
 
 .. _AUDIO_STOP:
 
@@ -16,8 +17,9 @@ AUDIO_STOP
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, AUDIO_STOP)
-    :name: AUDIO_STOP
+.. c:macro:: AUDIO_STOP
+
+``int ioctl(int fd, AUDIO_STOP)``
 
 Arguments
 ---------
@@ -26,21 +28,18 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
 
        -  File descriptor returned by a previous call to open().
 
-
 Description
 -----------
 
 This ioctl call asks the Audio Device to stop playing the current
 stream.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/ca-fclose.rst b/Documentation/userspace-api/media/dvb/ca-fclose.rst
index 00379ee7e9ed..27f217a350e7 100644
--- a/Documentation/userspace-api/media/dvb/ca-fclose.rst
+++ b/Documentation/userspace-api/media/dvb/ca-fclose.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.ca
 
 .. _ca_fclose:
 
@@ -11,26 +12,22 @@ Name
 
 Digital TV CA close()
 
-
 Synopsis
 --------
 
 .. c:function:: int close(int fd)
-    :name: dvb-ca-close
-
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <dvb-ca-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
 Description
 -----------
 
 This system call closes a previously opened CA device.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/ca-fopen.rst b/Documentation/userspace-api/media/dvb/ca-fopen.rst
index 9ca4bd1d8d5f..7f99908fff2c 100644
--- a/Documentation/userspace-api/media/dvb/ca-fopen.rst
+++ b/Documentation/userspace-api/media/dvb/ca-fopen.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.ca
 
 .. _ca_fopen:
 
@@ -11,13 +12,10 @@ Name
 
 Digital TV CA open()
 
-
 Synopsis
 --------
 
 .. c:function:: int open(const char *name, int flags)
-    :name: dvb-ca-open
-
 
 Arguments
 ---------
@@ -45,7 +43,6 @@ Arguments
        - open in non-blocking mode
          (blocking mode is the default)
 
-
 Description
 -----------
 
@@ -63,11 +60,9 @@ Only one user can open the CA Device in ``O_RDWR`` mode. All other
 attempts to open the device in this mode will fail, and an error code
 will be returned.
 
-
 Return Value
 ------------
 
-
 On success 0 is returned.
 
 On error -1 is returned, and the ``errno`` variable is set
diff --git a/Documentation/userspace-api/media/dvb/ca-get-cap.rst b/Documentation/userspace-api/media/dvb/ca-get-cap.rst
index 93742a5d941d..9b29513eeda8 100644
--- a/Documentation/userspace-api/media/dvb/ca-get-cap.rst
+++ b/Documentation/userspace-api/media/dvb/ca-get-cap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.ca
 
 .. _CA_GET_CAP:
 
@@ -11,19 +12,18 @@ Name
 
 CA_GET_CAP
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, CA_GET_CAP, struct ca_caps *caps)
-    :name: CA_GET_CAP
+.. c:macro:: CA_GET_CAP
 
+``int ioctl(fd, CA_GET_CAP, struct ca_caps *caps)``
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <dvb-ca-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
 ``caps``
   Pointer to struct :c:type:`ca_caps`.
diff --git a/Documentation/userspace-api/media/dvb/ca-get-descr-info.rst b/Documentation/userspace-api/media/dvb/ca-get-descr-info.rst
index be7dec053685..0cfdcdab33a8 100644
--- a/Documentation/userspace-api/media/dvb/ca-get-descr-info.rst
+++ b/Documentation/userspace-api/media/dvb/ca-get-descr-info.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.ca
 
 .. _CA_GET_DESCR_INFO:
 
@@ -11,18 +12,18 @@ Name
 
 CA_GET_DESCR_INFO
 
-
 Synopsis
 --------
 
-.. c:function:: int  ioctl(fd, CA_GET_DESCR_INFO, struct ca_descr_info *desc)
-    :name: CA_GET_DESCR_INFO
+.. c:macro:: CA_GET_DESCR_INFO
+
+``int ioctl(fd, CA_GET_DESCR_INFO, struct ca_descr_info *desc)``
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <dvb-ca-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
 ``desc``
   Pointer to struct :c:type:`ca_descr_info`.
diff --git a/Documentation/userspace-api/media/dvb/ca-get-msg.rst b/Documentation/userspace-api/media/dvb/ca-get-msg.rst
index e8802b4c5fa1..7c9a8d197343 100644
--- a/Documentation/userspace-api/media/dvb/ca-get-msg.rst
+++ b/Documentation/userspace-api/media/dvb/ca-get-msg.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.ca
 
 .. _CA_GET_MSG:
 
@@ -11,19 +12,18 @@ Name
 
 CA_GET_MSG
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, CA_GET_MSG, struct ca_msg *msg)
-    :name: CA_GET_MSG
+.. c:macro:: CA_GET_MSG
 
+``int ioctl(fd, CA_GET_MSG, struct ca_msg *msg)``
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <dvb-ca-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
 ``msg``
   Pointer to struct :c:type:`ca_msg`.
@@ -38,11 +38,9 @@ Receives a message via a CI CA module.
    Please notice that, on most drivers, this is done by reading from
    the /dev/adapter?/ca? device node.
 
-
 Return Value
 ------------
 
-
 On success 0 is returned.
 
 On error -1 is returned, and the ``errno`` variable is set
diff --git a/Documentation/userspace-api/media/dvb/ca-get-slot-info.rst b/Documentation/userspace-api/media/dvb/ca-get-slot-info.rst
index d283df335914..582444af7003 100644
--- a/Documentation/userspace-api/media/dvb/ca-get-slot-info.rst
+++ b/Documentation/userspace-api/media/dvb/ca-get-slot-info.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.ca
 
 .. _CA_GET_SLOT_INFO:
 
@@ -11,19 +12,18 @@ Name
 
 CA_GET_SLOT_INFO
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, CA_GET_SLOT_INFO, struct ca_slot_info *info)
-    :name: CA_GET_SLOT_INFO
+.. c:macro:: CA_GET_SLOT_INFO
 
+``int ioctl(fd, CA_GET_SLOT_INFO, struct ca_slot_info *info)``
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <cec-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
 ``info``
   Pointer to struct :c:type:`ca_slot_info`.
@@ -34,7 +34,6 @@ Description
 Returns information about a CA slot identified by
 :c:type:`ca_slot_info`.slot_num.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/ca-reset.rst b/Documentation/userspace-api/media/dvb/ca-reset.rst
index fc49ef2ffcdb..b01ca48f0b50 100644
--- a/Documentation/userspace-api/media/dvb/ca-reset.rst
+++ b/Documentation/userspace-api/media/dvb/ca-reset.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.ca
 
 .. _CA_RESET:
 
@@ -11,19 +12,18 @@ Name
 
 CA_RESET
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, CA_RESET)
-    :name: CA_RESET
+.. c:macro:: CA_RESET
 
+``int ioctl(fd, CA_RESET)``
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <cec-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
 Description
 -----------
@@ -31,7 +31,6 @@ Description
 Puts the Conditional Access hardware on its initial state. It should
 be called before start using the CA hardware.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/ca-send-msg.rst b/Documentation/userspace-api/media/dvb/ca-send-msg.rst
index cf423fe881b8..7dd2ab4ef675 100644
--- a/Documentation/userspace-api/media/dvb/ca-send-msg.rst
+++ b/Documentation/userspace-api/media/dvb/ca-send-msg.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.ca
 
 .. _CA_SEND_MSG:
 
@@ -11,24 +12,22 @@ Name
 
 CA_SEND_MSG
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, CA_SEND_MSG, struct ca_msg *msg)
-    :name: CA_SEND_MSG
+.. c:macro:: CA_SEND_MSG
 
+``int ioctl(fd, CA_SEND_MSG, struct ca_msg *msg)``
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <cec-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
 ``msg``
   Pointer to struct :c:type:`ca_msg`.
 
-
 Description
 -----------
 
diff --git a/Documentation/userspace-api/media/dvb/ca-set-descr.rst b/Documentation/userspace-api/media/dvb/ca-set-descr.rst
index a5c628a4d3cd..a740af34c872 100644
--- a/Documentation/userspace-api/media/dvb/ca-set-descr.rst
+++ b/Documentation/userspace-api/media/dvb/ca-set-descr.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.ca
 
 .. _CA_SET_DESCR:
 
@@ -11,19 +12,18 @@ Name
 
 CA_SET_DESCR
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, CA_SET_DESCR, struct ca_descr *desc)
-    :name: CA_SET_DESCR
+.. c:macro:: CA_SET_DESCR
 
+``int ioctl(fd, CA_SET_DESCR, struct ca_descr *desc)``
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <cec-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
 ``msg``
   Pointer to struct :c:type:`ca_descr`.
diff --git a/Documentation/userspace-api/media/dvb/dmx-add-pid.rst b/Documentation/userspace-api/media/dvb/dmx-add-pid.rst
index 3f08ecd88b0c..ea0c7dd91e05 100644
--- a/Documentation/userspace-api/media/dvb/dmx-add-pid.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-add-pid.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_ADD_PID:
 
@@ -11,24 +12,22 @@ Name
 
 DMX_ADD_PID
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, DMX_ADD_PID, __u16 *pid)
-    :name: DMX_ADD_PID
+.. c:macro:: DMX_ADD_PID
 
+``int ioctl(fd, DMX_ADD_PID, __u16 *pid)``
 
 Arguments
 ---------
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-dmx-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``pid``
    PID number to be filtered.
 
-
 Description
 -----------
 
@@ -36,7 +35,6 @@ This ioctl call allows to add multiple PIDs to a transport stream filter
 previously set up with :ref:`DMX_SET_PES_FILTER` and output equal to
 :c:type:`DMX_OUT_TSDEMUX_TAP <dmx_output>`.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/dmx-expbuf.rst b/Documentation/userspace-api/media/dvb/dmx-expbuf.rst
index cde2b78a35fa..5cdc2035e3b7 100644
--- a/Documentation/userspace-api/media/dvb/dmx-expbuf.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-expbuf.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_EXPBUF:
 
@@ -13,24 +14,22 @@ DMX_EXPBUF - Export a buffer as a DMABUF file descriptor.
 
 .. warning:: this API is still experimental
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, DMX_EXPBUF, struct dmx_exportbuffer *argp )
-    :name: DMX_EXPBUF
+.. c:macro:: DMX_EXPBUF
 
+``int ioctl(int fd, DMX_EXPBUF, struct dmx_exportbuffer *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <dmx_fopen>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`dmx_exportbuffer`.
 
-
 Description
 ===========
 
@@ -54,11 +53,9 @@ driver, on success. This is a DMABUF file descriptor. The application may
 pass it to other DMABUF-aware devices. It is recommended to close a DMABUF
 file when it is no longer used to allow the associated memory to be reclaimed.
 
-
 Examples
 ========
 
-
 .. code-block:: c
 
     int buffer_export(int v4lfd, enum dmx_buf_type bt, int index, int *dmafd)
diff --git a/Documentation/userspace-api/media/dvb/dmx-fclose.rst b/Documentation/userspace-api/media/dvb/dmx-fclose.rst
index af036792f13d..719ac1d4f686 100644
--- a/Documentation/userspace-api/media/dvb/dmx-fclose.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fclose.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _dmx_fclose:
 
@@ -11,27 +12,23 @@ Name
 
 Digital TV demux close()
 
-
 Synopsis
 --------
 
 .. c:function:: int close(int fd)
-    :name: dvb-dmx-close
-
 
 Arguments
 ---------
 
 ``fd``
   File descriptor returned by a previous call to
-  :c:func:`open() <dvb-dmx-open>`.
+  :c:func:`open()`.
 
 Description
 -----------
 
 This system call deactivates and deallocates a filter that was
-previously allocated via the :c:func:`open() <dvb-dmx-open>` call.
-
+previously allocated via the :c:func:`open()` call.
 
 Return Value
 ------------
diff --git a/Documentation/userspace-api/media/dvb/dmx-fopen.rst b/Documentation/userspace-api/media/dvb/dmx-fopen.rst
index 7117c9bc4325..8f0a2b831d4a 100644
--- a/Documentation/userspace-api/media/dvb/dmx-fopen.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fopen.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _dmx_fopen:
 
@@ -11,12 +12,10 @@ Name
 
 Digital TV demux open()
 
-
 Synopsis
 --------
 
 .. c:function:: int open(const char *deviceName, int flags)
-    :name: dvb-dmx-open
 
 Arguments
 ---------
@@ -47,7 +46,6 @@ Arguments
        - open in non-blocking mode
          (blocking mode is the default)
 
-
 Description
 -----------
 
@@ -68,7 +66,6 @@ affect the semantics of the ``open()`` call itself. A device opened
 in blocking mode can later be put into non-blocking mode (and vice versa)
 using the ``F_SETFL`` command of the fcntl system call.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/dmx-fread.rst b/Documentation/userspace-api/media/dvb/dmx-fread.rst
index c708a240abae..78e9daef595a 100644
--- a/Documentation/userspace-api/media/dvb/dmx-fread.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fread.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _dmx_fread:
 
@@ -11,18 +12,16 @@ Name
 
 Digital TV demux read()
 
-
 Synopsis
 --------
 
 .. c:function:: size_t read(int fd, void *buf, size_t count)
-    :name: dvb-dmx-read
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <dvb-ca-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
  ``buf``
    Buffer to be filled
@@ -44,7 +43,6 @@ to be transferred is implied by count.
    :c:type:`DMX_CHECK_CRC <dmx_sct_filter_params>` flag set,
    data that fails on CRC check will be silently ignored.
 
-
 Return Value
 ------------
 
@@ -75,6 +73,5 @@ appropriately.
        -  The driver failed to write to the callers buffer due to an
           invalid \*buf pointer.
 
-
 The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/Documentation/userspace-api/media/dvb/dmx-fwrite.rst b/Documentation/userspace-api/media/dvb/dmx-fwrite.rst
index bef565a35c59..e11ee0ba84a5 100644
--- a/Documentation/userspace-api/media/dvb/dmx-fwrite.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-fwrite.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _dmx_fwrite:
 
@@ -11,18 +12,16 @@ Name
 
 Digital TV demux write()
 
-
 Synopsis
 --------
 
 .. c:function:: ssize_t write(int fd, const void *buf, size_t count)
-    :name: dvb-dmx-write
 
 Arguments
 ---------
 
 ``fd``
-  File descriptor returned by a previous call to :c:func:`open() <dvb-ca-open>`.
+  File descriptor returned by a previous call to :c:func:`open()`.
 
 ``buf``
      Buffer with data to be written
@@ -40,7 +39,6 @@ digitally recorded Transport Stream. Matching filters have to be defined
 in the corresponding physical demux device, ``/dev/dvb/adapter?/demux?``.
 The amount of data to be transferred is implied by count.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/dmx-get-pes-pids.rst b/Documentation/userspace-api/media/dvb/dmx-get-pes-pids.rst
index e92d94d93b18..4f5f0505c0d5 100644
--- a/Documentation/userspace-api/media/dvb/dmx-get-pes-pids.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-get-pes-pids.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_GET_PES_PIDS:
 
@@ -11,23 +12,22 @@ Name
 
 DMX_GET_PES_PIDS
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, DMX_GET_PES_PIDS, __u16 pids[5])
-    :name: DMX_GET_PES_PIDS
+.. c:macro:: DMX_GET_PES_PIDS
+
+``int ioctl(fd, DMX_GET_PES_PIDS, __u16 pids[5])``
 
 Arguments
 ---------
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-dmx-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``pids``
     Array used to store 5 Program IDs.
 
-
 Description
 -----------
 
@@ -45,13 +45,11 @@ pids[DMX_PES_SUBTITLE]	3		first subtitle PID
 pids[DMX_PES_PCR]	4		first Program Clock Reference PID
 =======================	========	=======================================
 
-
 .. note::
 
 	A value equal to 0xffff means that the PID was not filled by the
 	Kernel.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/dmx-get-stc.rst b/Documentation/userspace-api/media/dvb/dmx-get-stc.rst
index 3762efcf1355..6ada74f6eb18 100644
--- a/Documentation/userspace-api/media/dvb/dmx-get-stc.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-get-stc.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_GET_STC:
 
@@ -11,23 +12,22 @@ Name
 
 DMX_GET_STC
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl( int fd, DMX_GET_STC, struct dmx_stc *stc)
-    :name: DMX_GET_STC
+.. c:macro:: DMX_GET_STC
+
+``int ioctl(int fd, DMX_GET_STC, struct dmx_stc *stc)``
 
 Arguments
 ---------
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-dmx-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``stc``
     Pointer to :c:type:`dmx_stc` where the stc data is to be stored.
 
-
 Description
 -----------
 
@@ -39,7 +39,6 @@ The result is returned in form of a ratio with a 64 bit numerator
 and a 32 bit denominator, so the real 90kHz STC value is
 ``stc->stc / stc->base``.
 
-
 Return Value
 ------------
 
@@ -61,6 +60,5 @@ appropriately.
 
        -  Invalid stc number.
 
-
 The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/Documentation/userspace-api/media/dvb/dmx-mmap.rst b/Documentation/userspace-api/media/dvb/dmx-mmap.rst
index efa9b04be700..8826c6226fb0 100644
--- a/Documentation/userspace-api/media/dvb/dmx-mmap.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-mmap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _dmx-mmap:
 
@@ -21,9 +22,7 @@ Synopsis
     #include <unistd.h>
     #include <sys/mman.h>
 
-
 .. c:function:: void *mmap( void *start, size_t length, int prot, int flags, int fd, off_t offset )
-    :name: dmx-mmap
 
 Arguments
 =========
@@ -54,7 +53,7 @@ Arguments
 
     ``MAP_FIXED`` requests that the driver selects no other address than
     the one specified. If the specified address cannot be used,
-    :ref:`mmap() <dmx-mmap>` will fail. If ``MAP_FIXED`` is specified,
+    :c:func:`mmap()` will fail. If ``MAP_FIXED`` is specified,
     ``start`` must be a multiple of the pagesize. Use of this option is
     discouraged.
 
@@ -69,17 +68,16 @@ Arguments
        flags.
 
 ``fd``
-    File descriptor returned by :ref:`open() <dmx_fopen>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``offset``
     Offset of the buffer in device memory, as returned by
     :ref:`DMX_QUERYBUF` ioctl.
 
-
 Description
 ===========
 
-The :ref:`mmap() <dmx-mmap>` function asks to map ``length`` bytes starting at
+The :c:func:`mmap()` function asks to map ``length`` bytes starting at
 ``offset`` in the memory of the device specified by ``fd`` into the
 application address space, preferably at address ``start``. This latter
 address is a hint only, and is usually specified as 0.
@@ -88,13 +86,12 @@ Suitable length and offset parameters are queried with the
 :ref:`DMX_QUERYBUF` ioctl. Buffers must be allocated with the
 :ref:`DMX_REQBUFS` ioctl before they can be queried.
 
-To unmap buffers the :ref:`munmap() <dmx-munmap>` function is used.
-
+To unmap buffers the :c:func:`munmap()` function is used.
 
 Return Value
 ============
 
-On success :ref:`mmap() <dmx-mmap>` returns a pointer to the mapped buffer. On
+On success :c:func:`mmap()` returns a pointer to the mapped buffer. On
 error ``MAP_FAILED`` (-1) is returned, and the ``errno`` variable is set
 appropriately. Possible error codes are:
 
diff --git a/Documentation/userspace-api/media/dvb/dmx-munmap.rst b/Documentation/userspace-api/media/dvb/dmx-munmap.rst
index 308a9593919c..66bbc11e5c40 100644
--- a/Documentation/userspace-api/media/dvb/dmx-munmap.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-munmap.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _dmx-munmap:
 
@@ -13,7 +14,6 @@ dmx-munmap - Unmap device memory
 
 .. warning:: This API is still experimental.
 
-
 Synopsis
 ========
 
@@ -22,33 +22,29 @@ Synopsis
     #include <unistd.h>
     #include <sys/mman.h>
 
-
 .. c:function:: int munmap( void *start, size_t length )
-    :name: dmx-munmap
 
 Arguments
 =========
 
 ``start``
     Address of the mapped buffer as returned by the
-    :ref:`mmap() <dmx-mmap>` function.
+    :c:func:`mmap()` function.
 
 ``length``
     Length of the mapped buffer. This must be the same value as given to
-    :ref:`mmap() <dmx-mmap>`.
-
+    :c:func:`mmap()`.
 
 Description
 ===========
 
-Unmaps a previously with the :ref:`mmap() <dmx-mmap>` function mapped
+Unmaps a previously with the :c:func:`mmap()` function mapped
 buffer and frees it, if possible.
 
-
 Return Value
 ============
 
-On success :ref:`munmap() <dmx-munmap>` returns 0, on failure -1 and the
+On success :c:func:`munmap()` returns 0, on failure -1 and the
 ``errno`` variable is set appropriately:
 
 EINVAL
diff --git a/Documentation/userspace-api/media/dvb/dmx-qbuf.rst b/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
index fcb1c55dd49a..17e70143c1b0 100644
--- a/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-qbuf.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_QBUF:
 
@@ -13,27 +14,26 @@ DMX_QBUF - DMX_DQBUF - Exchange a buffer with the driver
 
 .. warning:: this API is still experimental
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, DMX_QBUF, struct dmx_buffer *argp )
-    :name: DMX_QBUF
+.. c:macro:: DMX_QBUF
 
-.. c:function:: int ioctl( int fd, DMX_DQBUF, struct dmx_buffer *argp )
-    :name: DMX_DQBUF
+``int ioctl(int fd, DMX_QBUF, struct dmx_buffer *argp)``
 
+.. c:macro:: DMX_DQBUF
+
+``int ioctl(int fd, DMX_DQBUF, struct dmx_buffer *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <dmx_fopen>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`dmx_buffer`.
 
-
 Description
 ===========
 
@@ -60,13 +60,12 @@ the driver fills the remaining fields or returns an error code.
 
 By default ``DMX_DQBUF`` blocks when no buffer is in the outgoing
 queue. When the ``O_NONBLOCK`` flag was given to the
-:ref:`open() <dmx_fopen>` function, ``DMX_DQBUF`` returns
+:c:func:`open()` function, ``DMX_DQBUF`` returns
 immediately with an ``EAGAIN`` error code when no buffer is available.
 
 The struct :c:type:`dmx_buffer` structure is specified in
 :ref:`buffer`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/dmx-querybuf.rst b/Documentation/userspace-api/media/dvb/dmx-querybuf.rst
index df13e2b053c9..08ee9853d6b4 100644
--- a/Documentation/userspace-api/media/dvb/dmx-querybuf.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-querybuf.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_QUERYBUF:
 
@@ -13,24 +14,22 @@ DMX_QUERYBUF - Query the status of a buffer
 
 .. warning:: this API is still experimental
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, DMX_QUERYBUF, struct dvb_buffer *argp )
-    :name: DMX_QUERYBUF
+.. c:macro:: DMX_QUERYBUF
 
+``int ioctl(int fd, DMX_QUERYBUF, struct dvb_buffer *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <dmx_fopen>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`dvb_buffer`.
 
-
 Description
 ===========
 
diff --git a/Documentation/userspace-api/media/dvb/dmx-remove-pid.rst b/Documentation/userspace-api/media/dvb/dmx-remove-pid.rst
index ce408d0d7c77..f75b33e5e49a 100644
--- a/Documentation/userspace-api/media/dvb/dmx-remove-pid.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-remove-pid.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_REMOVE_PID:
 
@@ -11,24 +12,22 @@ Name
 
 DMX_REMOVE_PID
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, DMX_REMOVE_PID, __u16 *pid)
-    :name: DMX_REMOVE_PID
+.. c:macro:: DMX_REMOVE_PID
 
+``int ioctl(fd, DMX_REMOVE_PID, __u16 *pid)``
 
 Arguments
 ---------
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-dmx-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``pid``
     PID of the PES filter to be removed.
 
-
 Description
 -----------
 
@@ -37,7 +36,6 @@ transport stream filter, e. g. a filter previously set up with output
 equal to :c:type:`DMX_OUT_TSDEMUX_TAP <dmx_output>`, created via either
 :ref:`DMX_SET_PES_FILTER` or :ref:`DMX_ADD_PID`.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst b/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
index 433aed632f92..d2bb1909ec98 100644
--- a/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_REQBUFS:
 
@@ -13,19 +14,18 @@ DMX_REQBUFS - Initiate Memory Mapping and/or DMA buffer I/O
 
 .. warning:: this API is still experimental
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, DMX_REQBUFS, struct dmx_requestbuffers *argp )
-    :name: DMX_REQBUFS
+.. c:macro:: DMX_REQBUFS
 
+``int ioctl(int fd, DMX_REQBUFS, struct dmx_requestbuffers *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <dmx_fopen>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`dmx_requestbuffers`.
@@ -64,7 +64,6 @@ buffers, however this cannot succeed when any buffers are still mapped.
 A ``count`` value of zero frees all buffers, after aborting or finishing
 any DMA in progress.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/dmx-set-buffer-size.rst b/Documentation/userspace-api/media/dvb/dmx-set-buffer-size.rst
index e803cbab220b..13ce4092c2d2 100644
--- a/Documentation/userspace-api/media/dvb/dmx-set-buffer-size.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-set-buffer-size.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_SET_BUFFER_SIZE:
 
@@ -11,19 +12,18 @@ Name
 
 DMX_SET_BUFFER_SIZE
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl( int fd, DMX_SET_BUFFER_SIZE, unsigned long size)
-    :name: DMX_SET_BUFFER_SIZE
+.. c:macro:: DMX_SET_BUFFER_SIZE
 
+``int ioctl(int fd, DMX_SET_BUFFER_SIZE, unsigned long size)``
 
 Arguments
 ---------
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-dmx-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``size``
     Unsigned long size
@@ -36,11 +36,9 @@ filtered data. The default size is two maximum sized sections, i.e. if
 this function is not called a buffer size of ``2 * 4096`` bytes will be
 used.
 
-
 Return Value
 ------------
 
-
 On success 0 is returned.
 
 On error -1 is returned, and the ``errno`` variable is set
diff --git a/Documentation/userspace-api/media/dvb/dmx-set-filter.rst b/Documentation/userspace-api/media/dvb/dmx-set-filter.rst
index 4cd3db512b4e..f43455b7adae 100644
--- a/Documentation/userspace-api/media/dvb/dmx-set-filter.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-set-filter.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_SET_FILTER:
 
@@ -11,24 +12,23 @@ Name
 
 DMX_SET_FILTER
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl( int fd, DMX_SET_FILTER, struct dmx_sct_filter_params *params)
-    :name: DMX_SET_FILTER
+.. c:macro:: DMX_SET_FILTER
+
+``int ioctl(int fd, DMX_SET_FILTER, struct dmx_sct_filter_params *params)``
 
 Arguments
 ---------
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-dmx-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``params``
 
     Pointer to structure containing filter parameters.
 
-
 Description
 -----------
 
@@ -43,11 +43,9 @@ operation should be started immediately (without waiting for a
 :ref:`DMX_START` ioctl call). If a filter was previously set-up, this
 filter will be canceled, and the receive buffer will be flushed.
 
-
 Return Value
 ------------
 
-
 On success 0 is returned.
 
 On error -1 is returned, and the ``errno`` variable is set
diff --git a/Documentation/userspace-api/media/dvb/dmx-set-pes-filter.rst b/Documentation/userspace-api/media/dvb/dmx-set-pes-filter.rst
index 8e54fd2636ed..5bb682e4a88f 100644
--- a/Documentation/userspace-api/media/dvb/dmx-set-pes-filter.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-set-pes-filter.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_SET_PES_FILTER:
 
@@ -11,25 +12,22 @@ Name
 
 DMX_SET_PES_FILTER
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl( int fd, DMX_SET_PES_FILTER, struct dmx_pes_filter_params *params)
-    :name: DMX_SET_PES_FILTER
+.. c:macro:: DMX_SET_PES_FILTER
 
+``int ioctl(int fd, DMX_SET_PES_FILTER, struct dmx_pes_filter_params *params)``
 
 Arguments
 ---------
 
-
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-dmx-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``params``
     Pointer to structure containing filter parameters.
 
-
 Description
 -----------
 
@@ -38,7 +36,6 @@ provided. By a PES filter is meant a filter that is based just on the
 packet identifier (PID), i.e. no PES header or payload filtering
 capability is supported.
 
-
 Return Value
 ------------
 
@@ -54,7 +51,6 @@ appropriately.
     :stub-columns: 0
     :widths: 1 16
 
-
     -  .. row 1
 
        -  ``EBUSY``
@@ -64,6 +60,5 @@ appropriately.
 	  Make sure that these filters are stopped before starting this
 	  filter.
 
-
 The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/Documentation/userspace-api/media/dvb/dmx-start.rst b/Documentation/userspace-api/media/dvb/dmx-start.rst
index 6f1413e13936..aedccf952a14 100644
--- a/Documentation/userspace-api/media/dvb/dmx-start.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-start.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_START:
 
@@ -11,19 +12,18 @@ Name
 
 DMX_START
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl( int fd, DMX_START)
-    :name: DMX_START
+.. c:macro:: DMX_START
 
+``int ioctl(int fd, DMX_START)``
 
 Arguments
 ---------
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-dmx-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 Description
 -----------
@@ -31,7 +31,6 @@ Description
 This ioctl call is used to start the actual filtering operation defined
 via the ioctl calls :ref:`DMX_SET_FILTER` or :ref:`DMX_SET_PES_FILTER`.
 
-
 Return Value
 ------------
 
@@ -46,7 +45,6 @@ appropriately.
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EINVAL``
@@ -63,6 +61,5 @@ appropriately.
 	  Make sure that these filters are stopped before starting this
 	  filter.
 
-
 The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/Documentation/userspace-api/media/dvb/dmx-stop.rst b/Documentation/userspace-api/media/dvb/dmx-stop.rst
index cbc3956fd71d..8661e6772104 100644
--- a/Documentation/userspace-api/media/dvb/dmx-stop.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-stop.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.dmx
 
 .. _DMX_STOP:
 
@@ -11,19 +12,18 @@ Name
 
 DMX_STOP
 
-
 Synopsis
 --------
 
-.. c:function:: int ioctl( int fd, DMX_STOP)
-    :name: DMX_STOP
+.. c:macro:: DMX_STOP
 
+``int ioctl(int fd, DMX_STOP)``
 
 Arguments
 ---------
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-dmx-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 Description
 -----------
@@ -32,7 +32,6 @@ This ioctl call is used to stop the actual filtering operation defined
 via the ioctl calls :ref:`DMX_SET_FILTER` or :ref:`DMX_SET_PES_FILTER` and
 started via the :ref:`DMX_START` command.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/fe-diseqc-recv-slave-reply.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-recv-slave-reply.rst
index 115cced97e66..d9be817f0390 100644
--- a/Documentation/userspace-api/media/dvb/fe-diseqc-recv-slave-reply.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-recv-slave-reply.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_DISEQC_RECV_SLAVE_REPLY:
 
@@ -11,24 +12,22 @@ Name
 
 FE_DISEQC_RECV_SLAVE_REPLY - Receives reply from a DiSEqC 2.0 command
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_DISEQC_RECV_SLAVE_REPLY, struct dvb_diseqc_slave_reply *argp )
-    :name: FE_DISEQC_RECV_SLAVE_REPLY
+.. c:macro:: FE_DISEQC_RECV_SLAVE_REPLY
 
+``int ioctl(int fd, FE_DISEQC_RECV_SLAVE_REPLY, struct dvb_diseqc_slave_reply *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     pointer to struct :c:type:`dvb_diseqc_slave_reply`.
 
-
 Description
 ===========
 
diff --git a/Documentation/userspace-api/media/dvb/fe-diseqc-reset-overload.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-reset-overload.rst
index 5ffc34a6496e..d36f7d1157c6 100644
--- a/Documentation/userspace-api/media/dvb/fe-diseqc-reset-overload.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-reset-overload.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_DISEQC_RESET_OVERLOAD:
 
@@ -11,19 +12,18 @@ Name
 
 FE_DISEQC_RESET_OVERLOAD - Restores the power to the antenna subsystem, if it was powered off due - to power overload.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_DISEQC_RESET_OVERLOAD, NULL )
-    :name: FE_DISEQC_RESET_OVERLOAD
+.. c:macro:: FE_DISEQC_RESET_OVERLOAD
 
+``int ioctl(int fd, FE_DISEQC_RESET_OVERLOAD, NULL)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 Description
 ===========
@@ -33,7 +33,6 @@ this ioctl call restores the power to the bus. The call requires
 read/write access to the device. This call has no effect if the device
 is manually powered off. Not all Digital TV adapters support this ioctl.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
index fd59afe814f3..8fb73ee29951 100644
--- a/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_DISEQC_SEND_BURST:
 
@@ -11,24 +12,22 @@ Name
 
 FE_DISEQC_SEND_BURST - Sends a 22KHz tone burst for 2x1 mini DiSEqC satellite selection.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_DISEQC_SEND_BURST, enum fe_sec_mini_cmd tone )
-    :name: FE_DISEQC_SEND_BURST
+.. c:macro:: FE_DISEQC_SEND_BURST
 
+``int ioctl(int fd, FE_DISEQC_SEND_BURST, enum fe_sec_mini_cmd tone)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``tone``
     An integer enumered value described at :c:type:`fe_sec_mini_cmd`.
 
-
 Description
 ===========
 
@@ -39,7 +38,6 @@ read/write permissions.
 It provides support for what's specified at
 `Digital Satellite Equipment Control (DiSEqC) - Simple "ToneBurst" Detection Circuit specification. <http://www.eutelsat.com/files/contributed/satellites/pdf/Diseqc/associated%20docs/simple_tone_burst_detec.pdf>`__
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-diseqc-send-master-cmd.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-send-master-cmd.rst
index faa2a8364e10..c97029def2ee 100644
--- a/Documentation/userspace-api/media/dvb/fe-diseqc-send-master-cmd.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-send-master-cmd.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_DISEQC_SEND_MASTER_CMD:
 
@@ -11,25 +12,23 @@ Name
 
 FE_DISEQC_SEND_MASTER_CMD - Sends a DiSEqC command
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_DISEQC_SEND_MASTER_CMD, struct dvb_diseqc_master_cmd *argp )
-    :name: FE_DISEQC_SEND_MASTER_CMD
+.. c:macro:: FE_DISEQC_SEND_MASTER_CMD
 
+``int ioctl(int fd, FE_DISEQC_SEND_MASTER_CMD, struct dvb_diseqc_master_cmd *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     pointer to struct
     :c:type:`dvb_diseqc_master_cmd`
 
-
 Description
 ===========
 
diff --git a/Documentation/userspace-api/media/dvb/fe-dishnetwork-send-legacy-cmd.rst b/Documentation/userspace-api/media/dvb/fe-dishnetwork-send-legacy-cmd.rst
index 60d69bb6da71..d1dba74c55a9 100644
--- a/Documentation/userspace-api/media/dvb/fe-dishnetwork-send-legacy-cmd.rst
+++ b/Documentation/userspace-api/media/dvb/fe-dishnetwork-send-legacy-cmd.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_DISHNETWORK_SEND_LEGACY_CMD:
 
@@ -11,24 +12,22 @@ Name
 
 FE_DISHNETWORK_SEND_LEGACY_CMD
 
-
 Synopsis
 ========
 
-.. c:function:: int  ioctl(int fd, FE_DISHNETWORK_SEND_LEGACY_CMD, unsigned long cmd)
-    :name: FE_DISHNETWORK_SEND_LEGACY_CMD
+.. c:macro:: FE_DISHNETWORK_SEND_LEGACY_CMD
 
+``int ioctl(int fd, FE_DISHNETWORK_SEND_LEGACY_CMD, unsigned long cmd)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-fe-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``cmd``
     Sends the specified raw cmd to the dish via DISEqC.
 
-
 Description
 ===========
 
@@ -42,7 +41,6 @@ frontend, for Dish Network legacy switches.
 As support for this ioctl were added in 2004, this means that such
 dishes were already legacy in 2004.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-enable-high-lnb-voltage.rst b/Documentation/userspace-api/media/dvb/fe-enable-high-lnb-voltage.rst
index df0cc91384d9..40d7320f82f7 100644
--- a/Documentation/userspace-api/media/dvb/fe-enable-high-lnb-voltage.rst
+++ b/Documentation/userspace-api/media/dvb/fe-enable-high-lnb-voltage.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_ENABLE_HIGH_LNB_VOLTAGE:
 
@@ -11,19 +12,18 @@ Name
 
 FE_ENABLE_HIGH_LNB_VOLTAGE - Select output DC level between normal LNBf voltages or higher LNBf - voltages.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_ENABLE_HIGH_LNB_VOLTAGE, unsigned int high )
-    :name: FE_ENABLE_HIGH_LNB_VOLTAGE
+.. c:macro:: FE_ENABLE_HIGH_LNB_VOLTAGE
 
+``int ioctl(int fd, FE_ENABLE_HIGH_LNB_VOLTAGE, unsigned int high)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``high``
     Valid flags:
@@ -33,7 +33,6 @@ Arguments
     -  >0 - enables slightly higher voltages instead of 13/18V, in order
        to compensate for long antenna cables.
 
-
 Description
 ===========
 
@@ -41,7 +40,6 @@ Select output DC level between normal LNBf voltages or higher LNBf
 voltages between 0 (normal) or a value grater than 0 for higher
 voltages.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-get-event.rst b/Documentation/userspace-api/media/dvb/fe-get-event.rst
index 723bb3a4a630..f63029eca90e 100644
--- a/Documentation/userspace-api/media/dvb/fe-get-event.rst
+++ b/Documentation/userspace-api/media/dvb/fe-get-event.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_GET_EVENT:
 
@@ -13,24 +14,22 @@ FE_GET_EVENT
 
 .. attention:: This ioctl is deprecated.
 
-
 Synopsis
 ========
 
-.. c:function:: int  ioctl(int fd, FE_GET_EVENT, struct dvb_frontend_event *ev)
-    :name: FE_GET_EVENT
+.. c:macro:: FE_GET_EVENT
 
+``int ioctl(int fd, FE_GET_EVENT, struct dvb_frontend_event *ev)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-fe-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``ev``
     Points to the location where the event, if any, is to be stored.
 
-
 Description
 ===========
 
@@ -40,7 +39,6 @@ or non-blocking mode. In the latter case, the call fails immediately
 with errno set to ``EWOULDBLOCK``. In the former case, the call blocks until
 an event becomes available.
 
-
 Return Value
 ============
 
@@ -49,12 +47,10 @@ On success 0 is returned.
 On error -1 is returned, and the ``errno`` variable is set
 appropriately.
 
-
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EWOULDBLOCK``
diff --git a/Documentation/userspace-api/media/dvb/fe-get-frontend.rst b/Documentation/userspace-api/media/dvb/fe-get-frontend.rst
index 2bfc1f1a3dc5..40700533e7e7 100644
--- a/Documentation/userspace-api/media/dvb/fe-get-frontend.rst
+++ b/Documentation/userspace-api/media/dvb/fe-get-frontend.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_GET_FRONTEND:
 
@@ -13,32 +14,28 @@ FE_GET_FRONTEND
 
 .. attention:: This ioctl is deprecated.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl(int fd, FE_GET_FRONTEND, struct dvb_frontend_parameters *p)
-    :name: FE_GET_FRONTEND
+.. c:macro:: FE_GET_FRONTEND
 
+``int ioctl(int fd, FE_GET_FRONTEND, struct dvb_frontend_parameters *p)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-fe-open>`.
-
+    File descriptor returned by :c:func:`open()`.
 
 ``p``
     Points to parameters for tuning operation.
 
-
 Description
 ===========
 
 This ioctl call queries the currently effective frontend parameters. For
 this command, read-only access to the device is sufficient.
 
-
 Return Value
 ============
 
@@ -51,7 +48,6 @@ appropriately.
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EINVAL``
diff --git a/Documentation/userspace-api/media/dvb/fe-get-info.rst b/Documentation/userspace-api/media/dvb/fe-get-info.rst
index eba115c03471..2e5f0209846f 100644
--- a/Documentation/userspace-api/media/dvb/fe-get-info.rst
+++ b/Documentation/userspace-api/media/dvb/fe-get-info.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_GET_INFO:
 
@@ -12,24 +13,22 @@ Name
 FE_GET_INFO - Query Digital TV frontend capabilities and returns information
 about the - front-end. This call only requires read-only access to the device.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_GET_INFO, struct dvb_frontend_info *argp )
-    :name: FE_GET_INFO
+.. c:macro:: FE_GET_INFO
 
+``int ioctl(int fd, FE_GET_INFO, struct dvb_frontend_info *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     pointer to struct :c:type:`dvb_frontend_info`
 
-
 Description
 ===========
 
@@ -40,7 +39,6 @@ takes a pointer to dvb_frontend_info which is filled by the driver.
 When the driver is not compatible with this specification the ioctl
 returns an error.
 
-
 frontend capabilities
 =====================
 
@@ -49,7 +47,6 @@ supported only on some specific frontend types.
 
 The frontend capabilities are described at :c:type:`fe_caps`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-get-property.rst b/Documentation/userspace-api/media/dvb/fe-get-property.rst
index 10e1db172d8a..29363dc4a0c3 100644
--- a/Documentation/userspace-api/media/dvb/fe-get-property.rst
+++ b/Documentation/userspace-api/media/dvb/fe-get-property.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_GET_PROPERTY:
 
@@ -11,27 +12,26 @@ Name
 
 FE_SET_PROPERTY - FE_GET_PROPERTY - FE_SET_PROPERTY sets one or more frontend properties. - FE_GET_PROPERTY returns one or more frontend properties.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_GET_PROPERTY, struct dtv_properties *argp )
-    :name: FE_GET_PROPERTY
+.. c:macro:: FE_GET_PROPERTY
 
-.. c:function:: int ioctl( int fd, FE_SET_PROPERTY, struct dtv_properties *argp )
-    :name: FE_SET_PROPERTY
+``int ioctl(int fd, FE_GET_PROPERTY, struct dtv_properties *argp)``
 
+.. c:macro:: FE_SET_PROPERTY
+
+``int ioctl(int fd, FE_SET_PROPERTY, struct dtv_properties *argp)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``argp``
     Pointer to struct :c:type:`dtv_properties`.
 
-
 Description
 ===========
 
@@ -63,7 +63,6 @@ depends on the delivery system and on the device:
 
    -  This call only requires read-only access to the device.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-read-ber.rst b/Documentation/userspace-api/media/dvb/fe-read-ber.rst
index 2200eb1d06f9..f33f1dd20501 100644
--- a/Documentation/userspace-api/media/dvb/fe-read-ber.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-ber.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_READ_BER:
 
@@ -16,20 +17,19 @@ FE_READ_BER
 Synopsis
 ========
 
-.. c:function:: int  ioctl(int fd, FE_READ_BER, uint32_t *ber)
-    :name: FE_READ_BER
+.. c:macro:: FE_READ_BER
 
+``int ioctl(int fd, FE_READ_BER, uint32_t *ber)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-fe-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``ber``
     The bit error rate is stored into \*ber.
 
-
 Description
 ===========
 
@@ -37,7 +37,6 @@ This ioctl call returns the bit error rate for the signal currently
 received/demodulated by the front-end. For this command, read-only
 access to the device is sufficient.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-read-signal-strength.rst b/Documentation/userspace-api/media/dvb/fe-read-signal-strength.rst
index 4832efad2a2e..2b7d06145cb1 100644
--- a/Documentation/userspace-api/media/dvb/fe-read-signal-strength.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-signal-strength.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_READ_SIGNAL_STRENGTH:
 
@@ -16,20 +17,19 @@ FE_READ_SIGNAL_STRENGTH
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_READ_SIGNAL_STRENGTH, uint16_t *strength)
-    :name: FE_READ_SIGNAL_STRENGTH
+.. c:macro:: FE_READ_SIGNAL_STRENGTH
 
+``int ioctl(int fd, FE_READ_SIGNAL_STRENGTH, uint16_t *strength)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-fe-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``strength``
     The signal strength value is stored into \*strength.
 
-
 Description
 ===========
 
@@ -37,7 +37,6 @@ This ioctl call returns the signal strength value for the signal
 currently received by the front-end. For this command, read-only access
 to the device is sufficient.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-read-snr.rst b/Documentation/userspace-api/media/dvb/fe-read-snr.rst
index 141e4fc661c2..e44e559ab7e8 100644
--- a/Documentation/userspace-api/media/dvb/fe-read-snr.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-snr.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_READ_SNR:
 
@@ -16,20 +17,19 @@ FE_READ_SNR
 Synopsis
 ========
 
-.. c:function:: int  ioctl(int fd, FE_READ_SNR, int16_t *snr)
-    :name: FE_READ_SNR
+.. c:macro:: FE_READ_SNR
 
+``int ioctl(int fd, FE_READ_SNR, int16_t *snr)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-fe-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``snr``
     The signal-to-noise ratio is stored into \*snr.
 
-
 Description
 ===========
 
@@ -37,7 +37,6 @@ This ioctl call returns the signal-to-noise ratio for the signal
 currently received by the front-end. For this command, read-only access
 to the device is sufficient.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-read-status.rst b/Documentation/userspace-api/media/dvb/fe-read-status.rst
index ba61feb5e535..75c6ee60ac9c 100644
--- a/Documentation/userspace-api/media/dvb/fe-read-status.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-status.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_READ_STATUS:
 
@@ -11,25 +12,23 @@ Name
 
 FE_READ_STATUS - Returns status information about the front-end. This call only requires - read-only access to the device
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_READ_STATUS, unsigned int *status )
-    :name: FE_READ_STATUS
+.. c:macro:: FE_READ_STATUS
 
+``int ioctl(int fd, FE_READ_STATUS, unsigned int *status)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``status``
     pointer to a bitmask integer filled with the values defined by enum
     :c:type:`fe_status`.
 
-
 Description
 ===========
 
@@ -44,7 +43,6 @@ written.
    varies according with the architecture. This needs to be fixed in the
    future.
 
-
 int fe_status
 =============
 
@@ -52,7 +50,6 @@ The fe_status parameter is used to indicate the current state and/or
 state changes of the frontend hardware. It is produced using the enum
 :c:type:`fe_status` values on a bitmask
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-read-uncorrected-blocks.rst b/Documentation/userspace-api/media/dvb/fe-read-uncorrected-blocks.rst
index bf9746f8a671..653cd99a66f5 100644
--- a/Documentation/userspace-api/media/dvb/fe-read-uncorrected-blocks.rst
+++ b/Documentation/userspace-api/media/dvb/fe-read-uncorrected-blocks.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_READ_UNCORRECTED_BLOCKS:
 
@@ -16,20 +17,19 @@ FE_READ_UNCORRECTED_BLOCKS
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_READ_UNCORRECTED_BLOCKS, uint32_t *ublocks)
-    :name: FE_READ_UNCORRECTED_BLOCKS
+.. c:macro:: FE_READ_UNCORRECTED_BLOCKS
 
+``int ioctl(int fd, FE_READ_UNCORRECTED_BLOCKS, uint32_t *ublocks)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-fe-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``ublocks``
     The total number of uncorrected blocks seen by the driver so far.
 
-
 Description
 ===========
 
@@ -39,7 +39,6 @@ increment in block count during a specific time interval should be
 calculated. For this command, read-only access to the device is
 sufficient.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-set-frontend-tune-mode.rst b/Documentation/userspace-api/media/dvb/fe-set-frontend-tune-mode.rst
index f0e178e3a180..56923c1a66b0 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-frontend-tune-mode.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-frontend-tune-mode.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_SET_FRONTEND_TUNE_MODE:
 
@@ -11,19 +12,18 @@ Name
 
 FE_SET_FRONTEND_TUNE_MODE - Allow setting tuner mode flags to the frontend.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_SET_FRONTEND_TUNE_MODE, unsigned int flags )
-    :name: FE_SET_FRONTEND_TUNE_MODE
+.. c:macro:: FE_SET_FRONTEND_TUNE_MODE
 
+``int ioctl(int fd, FE_SET_FRONTEND_TUNE_MODE, unsigned int flags)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``flags``
     Valid flags:
@@ -37,14 +37,12 @@ Arguments
        is closed, this flag will be automatically turned off when the
        device is reopened read-write.
 
-
 Description
 ===========
 
 Allow setting tuner mode flags to the frontend, between 0 (normal) or
 ``FE_TUNE_MODE_ONESHOT`` mode
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-set-frontend.rst b/Documentation/userspace-api/media/dvb/fe-set-frontend.rst
index 2b169778e0d6..d1b857632059 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-frontend.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-frontend.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_SET_FRONTEND:
 
@@ -13,24 +14,22 @@ Name
 
 FE_SET_FRONTEND
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl(int fd, FE_SET_FRONTEND, struct dvb_frontend_parameters *p)
-    :name: FE_SET_FRONTEND
+.. c:macro:: FE_SET_FRONTEND
 
+``int ioctl(int fd, FE_SET_FRONTEND, struct dvb_frontend_parameters *p)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-fe-open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``p``
     Points to parameters for tuning operation.
 
-
 Description
 ===========
 
@@ -44,7 +43,6 @@ operation is initiated before the previous one was completed, the
 previous operation will be aborted in favor of the new one. This command
 requires read/write access to the device.
 
-
 Return Value
 ============
 
@@ -66,6 +64,5 @@ appropriately.
 
        -  Maximum supported symbol rate reached.
 
-
 Generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/Documentation/userspace-api/media/dvb/fe-set-tone.rst b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
index 944d54488e71..9f44bf946183 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-tone.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_SET_TONE:
 
@@ -11,24 +12,22 @@ Name
 
 FE_SET_TONE - Sets/resets the generation of the continuous 22kHz tone.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_SET_TONE, enum fe_sec_tone_mode tone )
-    :name: FE_SET_TONE
+.. c:macro:: FE_SET_TONE
 
+``int ioctl(int fd, FE_SET_TONE, enum fe_sec_tone_mode tone)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``tone``
     an integer enumered value described at :c:type:`fe_sec_tone_mode`
 
-
 Description
 ===========
 
@@ -45,7 +44,6 @@ this is done using the DiSEqC ioctls.
    capability of selecting the band. So, it is recommended that applications
    would change to SEC_TONE_OFF when the device is not used.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
index 73740be0e7dc..c66771830be1 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _FE_SET_VOLTAGE:
 
@@ -11,24 +12,22 @@ Name
 
 FE_SET_VOLTAGE - Allow setting the DC level sent to the antenna subsystem.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, FE_SET_VOLTAGE, enum fe_sec_voltage voltage )
-    :name: FE_SET_VOLTAGE
+.. c:macro:: FE_SET_VOLTAGE
 
+``int ioctl(int fd, FE_SET_VOLTAGE, enum fe_sec_voltage voltage)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``voltage``
     an integer enumered value described at :c:type:`fe_sec_voltage`
 
-
 Description
 ===========
 
@@ -49,7 +48,6 @@ power up the LNBf.
    the voltage to SEC_VOLTAGE_OFF while the device is not is used is
    recommended.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/frontend_f_close.rst b/Documentation/userspace-api/media/dvb/frontend_f_close.rst
index 96e15b4ee76d..52c323a85014 100644
--- a/Documentation/userspace-api/media/dvb/frontend_f_close.rst
+++ b/Documentation/userspace-api/media/dvb/frontend_f_close.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _frontend_f_close:
 
@@ -11,7 +12,6 @@ Name
 
 fe-close - Close a frontend device
 
-
 Synopsis
 ========
 
@@ -19,16 +19,13 @@ Synopsis
 
     #include <unistd.h>
 
-
 .. c:function:: int close( int fd )
-    :name: dvb-fe-close
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :c:func:`open() <dvb-fe-open>`.
-
+    File descriptor returned by :c:func:`open()`.
 
 Description
 ===========
@@ -37,7 +34,6 @@ This system call closes a previously opened front-end device. After
 closing a front-end device, its corresponding hardware might be powered
 down automatically.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/frontend_f_open.rst b/Documentation/userspace-api/media/dvb/frontend_f_open.rst
index 49a01dd58d03..bb37eded0870 100644
--- a/Documentation/userspace-api/media/dvb/frontend_f_open.rst
+++ b/Documentation/userspace-api/media/dvb/frontend_f_open.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.fe
 
 .. _frontend_f_open:
 
@@ -11,7 +12,6 @@ Name
 
 fe-open - Open a frontend device
 
-
 Synopsis
 ========
 
@@ -19,9 +19,7 @@ Synopsis
 
     #include <fcntl.h>
 
-
 .. c:function:: int open( const char *device_name, int flags )
-    :name: dvb-fe-open
 
 Arguments
 =========
@@ -44,7 +42,6 @@ Arguments
 
     Other flags have no effect.
 
-
 Description
 ===========
 
@@ -70,16 +67,14 @@ the specified mode. This implies that the corresponding hardware is
 powered up, and that other front-ends may have been powered down to make
 that possible.
 
-
 Return Value
 ============
 
-On success :ref:`open() <frontend_f_open>` returns the new file descriptor.
+On success :c:func:`open()` returns the new file descriptor.
 On error, -1 is returned, and the ``errno`` variable is set appropriately.
 
 Possible error codes are:
 
-
 On success 0 is returned, and :c:type:`ca_slot_info` is filled.
 
 On error -1 is returned, and the ``errno`` variable is set
@@ -105,6 +100,5 @@ appropriately.
        -  The limit on the total number of files open on the system has been
 	  reached.
 
-
 The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
diff --git a/Documentation/userspace-api/media/dvb/net-add-if.rst b/Documentation/userspace-api/media/dvb/net-add-if.rst
index 0859830b645e..022b4c626249 100644
--- a/Documentation/userspace-api/media/dvb/net-add-if.rst
+++ b/Documentation/userspace-api/media/dvb/net-add-if.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.net
 
 .. _NET_ADD_IF:
 
@@ -11,24 +12,22 @@ Name
 
 NET_ADD_IF - Creates a new network interface for a given Packet ID.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, NET_ADD_IF, struct dvb_net_if *net_if )
-    :name: NET_ADD_IF
+.. c:macro:: NET_ADD_IF
 
+``int ioctl(int fd, NET_ADD_IF, struct dvb_net_if *net_if)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``net_if``
     pointer to struct :c:type:`dvb_net_if`
 
-
 Description
 ===========
 
diff --git a/Documentation/userspace-api/media/dvb/net-get-if.rst b/Documentation/userspace-api/media/dvb/net-get-if.rst
index d8c9f939d62c..e99696c9db74 100644
--- a/Documentation/userspace-api/media/dvb/net-get-if.rst
+++ b/Documentation/userspace-api/media/dvb/net-get-if.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.net
 
 .. _NET_GET_IF:
 
@@ -11,24 +12,22 @@ Name
 
 NET_GET_IF - Read the configuration data of an interface created via - :ref:`NET_ADD_IF <net>`.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, NET_GET_IF, struct dvb_net_if *net_if )
-    :name: NET_GET_IF
+.. c:macro:: NET_GET_IF
 
+``int ioctl(int fd, NET_GET_IF, struct dvb_net_if *net_if)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``net_if``
     pointer to struct :c:type:`dvb_net_if`
 
-
 Description
 ===========
 
@@ -39,7 +38,6 @@ encapsulation type used on such interface. If the interface was not
 created yet with :ref:`NET_ADD_IF <net>`, it will return -1 and fill
 the ``errno`` with ``EINVAL`` error code.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/net-remove-if.rst b/Documentation/userspace-api/media/dvb/net-remove-if.rst
index ecbcacbaf9f7..ac88691c0423 100644
--- a/Documentation/userspace-api/media/dvb/net-remove-if.rst
+++ b/Documentation/userspace-api/media/dvb/net-remove-if.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.net
 
 .. _NET_REMOVE_IF:
 
@@ -11,31 +12,28 @@ Name
 
 NET_REMOVE_IF - Removes a network interface.
 
-
 Synopsis
 ========
 
-.. c:function:: int ioctl( int fd, NET_REMOVE_IF, int ifnum )
-    :name: NET_REMOVE_IF
+.. c:macro:: NET_REMOVE_IF
 
+``int ioctl(int fd, NET_REMOVE_IF, int ifnum)``
 
 Arguments
 =========
 
 ``fd``
-    File descriptor returned by :ref:`open() <frontend_f_open>`.
+    File descriptor returned by :c:func:`open()`.
 
 ``net_if``
     number of the interface to be removed
 
-
 Description
 ===========
 
 The NET_REMOVE_IF ioctl deletes an interface previously created via
 :ref:`NET_ADD_IF <net>`.
 
-
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/dvb/video-clear-buffer.rst b/Documentation/userspace-api/media/dvb/video-clear-buffer.rst
index fa1f2f49bdac..a7730559bbb2 100644
--- a/Documentation/userspace-api/media/dvb/video-clear-buffer.rst
+++ b/Documentation/userspace-api/media/dvb/video-clear-buffer.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_CLEAR_BUFFER:
 
@@ -16,9 +17,9 @@ VIDEO_CLEAR_BUFFER
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_CLEAR_BUFFER)
-    :name: VIDEO_CLEAR_BUFFER
+.. c:macro:: VIDEO_CLEAR_BUFFER
 
+``int ioctl(fd, VIDEO_CLEAR_BUFFER)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -40,14 +40,12 @@ Arguments
 
        -  Equals VIDEO_CLEAR_BUFFER for this command.
 
-
 Description
 -----------
 
 This ioctl call clears all video buffers in the driver and in the
 decoder hardware.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-command.rst b/Documentation/userspace-api/media/dvb/video-command.rst
index ef0da85d5f92..cae9445eb3af 100644
--- a/Documentation/userspace-api/media/dvb/video-command.rst
+++ b/Documentation/userspace-api/media/dvb/video-command.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_COMMAND:
 
@@ -16,9 +17,9 @@ VIDEO_COMMAND
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, VIDEO_COMMAND, struct video_command *cmd)
-    :name: VIDEO_COMMAND
+.. c:macro:: VIDEO_COMMAND
 
+``int ioctl(int fd, VIDEO_COMMAND, struct video_command *cmd)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  Commands the decoder.
 
-
 Description
 -----------
 
@@ -59,7 +58,7 @@ subset of the ``v4l2_decoder_cmd`` struct, so refer to the
 :ref:`VIDIOC_DECODER_CMD` documentation for
 more information.
 
-.. c:type:: struct video_command
+.. c:type:: video_command
 
 .. code-block:: c
 
@@ -89,7 +88,6 @@ more information.
 		};
 	};
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-continue.rst b/Documentation/userspace-api/media/dvb/video-continue.rst
index 9a767b50b23b..bc34bf3989e4 100644
--- a/Documentation/userspace-api/media/dvb/video-continue.rst
+++ b/Documentation/userspace-api/media/dvb/video-continue.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_CONTINUE:
 
@@ -16,9 +17,9 @@ VIDEO_CONTINUE
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_CONTINUE)
-    :name: VIDEO_CONTINUE
+.. c:macro:: VIDEO_CONTINUE
 
+``int ioctl(fd, VIDEO_CONTINUE)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -40,7 +40,6 @@ Arguments
 
        -  Equals VIDEO_CONTINUE for this command.
 
-
 Description
 -----------
 
@@ -50,7 +49,6 @@ V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
 This ioctl call restarts decoding and playing processes of the video
 stream which was played before a call to VIDEO_FREEZE was made.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-fast-forward.rst b/Documentation/userspace-api/media/dvb/video-fast-forward.rst
index c43a13c7ae75..e71fa8d6965b 100644
--- a/Documentation/userspace-api/media/dvb/video-fast-forward.rst
+++ b/Documentation/userspace-api/media/dvb/video-fast-forward.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_FAST_FORWARD:
 
@@ -16,9 +17,9 @@ VIDEO_FAST_FORWARD
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_FAST_FORWARD, int nFrames)
-    :name: VIDEO_FAST_FORWARD
+.. c:macro:: VIDEO_FAST_FORWARD
 
+``int ioctl(fd, VIDEO_FAST_FORWARD, int nFrames)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  The number of frames to skip.
 
-
 Description
 -----------
 
@@ -54,7 +53,6 @@ This ioctl call asks the Video Device to skip decoding of N number of
 I-frames. This call can only be used if VIDEO_SOURCE_MEMORY is
 selected.
 
-
 Return Value
 ------------
 
@@ -63,12 +61,10 @@ appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
 
-
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EPERM``
diff --git a/Documentation/userspace-api/media/dvb/video-fclose.rst b/Documentation/userspace-api/media/dvb/video-fclose.rst
index 27ccb2d6f961..01d24d548439 100644
--- a/Documentation/userspace-api/media/dvb/video-fclose.rst
+++ b/Documentation/userspace-api/media/dvb/video-fclose.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _video_fclose:
 
@@ -18,7 +19,6 @@ Synopsis
 
 .. c:function:: int close(int fd)
 
-
 Arguments
 ---------
 
@@ -26,20 +26,17 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
 
        -  File descriptor returned by a previous call to open().
 
-
 Description
 -----------
 
 This system call closes a previously opened video device.
 
-
 Return Value
 ------------
 
@@ -47,7 +44,6 @@ Return Value
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EBADF``
diff --git a/Documentation/userspace-api/media/dvb/video-fopen.rst b/Documentation/userspace-api/media/dvb/video-fopen.rst
index aa1dc6020fa7..1371b083e4e8 100644
--- a/Documentation/userspace-api/media/dvb/video-fopen.rst
+++ b/Documentation/userspace-api/media/dvb/video-fopen.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _video_fopen:
 
@@ -18,7 +19,6 @@ Synopsis
 
 .. c:function:: int open(const char *deviceName, int flags)
 
-
 Arguments
 ---------
 
@@ -26,7 +26,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  const char \*deviceName
@@ -59,7 +58,6 @@ Arguments
        -
        -  (blocking mode is the default)
 
-
 Description
 -----------
 
@@ -79,7 +77,6 @@ returned. If the Video Device is opened in O_RDONLY mode, the only
 ioctl call that can be used is VIDEO_GET_STATUS. All other call will
 return an error code.
 
-
 Return Value
 ------------
 
@@ -89,7 +86,6 @@ Return Value
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``ENODEV``
diff --git a/Documentation/userspace-api/media/dvb/video-freeze.rst b/Documentation/userspace-api/media/dvb/video-freeze.rst
index 93e0ae8e79d8..4321f257cb70 100644
--- a/Documentation/userspace-api/media/dvb/video-freeze.rst
+++ b/Documentation/userspace-api/media/dvb/video-freeze.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_FREEZE:
 
@@ -16,9 +17,9 @@ VIDEO_FREEZE
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_FREEZE)
-    :name: VIDEO_FREEZE
+.. c:macro:: VIDEO_FREEZE
 
+``int ioctl(fd, VIDEO_FREEZE)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -40,7 +40,6 @@ Arguments
 
        -  Equals VIDEO_FREEZE for this command.
 
-
 Description
 -----------
 
@@ -54,7 +53,6 @@ If VIDEO_SOURCE_MEMORY is selected in the ioctl call
 VIDEO_SELECT_SOURCE, the Digital TV subsystem will not decode any more data
 until the ioctl call VIDEO_CONTINUE or VIDEO_PLAY is performed.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-fwrite.rst b/Documentation/userspace-api/media/dvb/video-fwrite.rst
index 5ccdf78f11e1..a07fd7d7a40e 100644
--- a/Documentation/userspace-api/media/dvb/video-fwrite.rst
+++ b/Documentation/userspace-api/media/dvb/video-fwrite.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _video_fwrite:
 
@@ -18,7 +19,6 @@ Synopsis
 
 .. c:function:: size_t write(int fd, const void *buf, size_t count)
 
-
 Arguments
 ---------
 
@@ -26,7 +26,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -45,7 +44,6 @@ Arguments
 
        -  Size of buf.
 
-
 Description
 -----------
 
@@ -55,7 +53,6 @@ PES format, unless the capability allows other formats. If O_NONBLOCK
 is not specified the function will block until buffer space is
 available. The amount of data to be transferred is implied by count.
 
-
 Return Value
 ------------
 
@@ -63,7 +60,6 @@ Return Value
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EPERM``
diff --git a/Documentation/userspace-api/media/dvb/video-get-capabilities.rst b/Documentation/userspace-api/media/dvb/video-get-capabilities.rst
index 619f78a66b6c..01e09f56656c 100644
--- a/Documentation/userspace-api/media/dvb/video-get-capabilities.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-capabilities.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_GET_CAPABILITIES:
 
@@ -16,9 +17,9 @@ VIDEO_GET_CAPABILITIES
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_GET_CAPABILITIES, unsigned int *cap)
-    :name: VIDEO_GET_CAPABILITIES
+.. c:macro:: VIDEO_GET_CAPABILITIES
 
+``int ioctl(fd, VIDEO_GET_CAPABILITIES, unsigned int *cap)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  Pointer to a location where to store the capability information.
 
-
 Description
 -----------
 
@@ -54,7 +53,6 @@ This ioctl call asks the video device about its decoding capabilities.
 On success it returns and integer which has bits set according to the
 defines in section ??.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-get-event.rst b/Documentation/userspace-api/media/dvb/video-get-event.rst
index 29566a245fcd..90382bc36cfe 100644
--- a/Documentation/userspace-api/media/dvb/video-get-event.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-event.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_GET_EVENT:
 
@@ -16,9 +17,9 @@ VIDEO_GET_EVENT
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_GET_EVENT, struct video_event *ev)
-    :name: VIDEO_GET_EVENT
+.. c:macro:: VIDEO_GET_EVENT
 
+``int ioctl(fd, VIDEO_GET_EVENT, struct video_event *ev)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  Points to the location where the event, if any, is to be stored.
 
-
 Description
 -----------
 
@@ -93,7 +92,6 @@ appropriately. The generic error codes are described at the
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EWOULDBLOCK``
diff --git a/Documentation/userspace-api/media/dvb/video-get-frame-count.rst b/Documentation/userspace-api/media/dvb/video-get-frame-count.rst
index 5f65f8dba184..b48ac8c58a41 100644
--- a/Documentation/userspace-api/media/dvb/video-get-frame-count.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-frame-count.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_GET_FRAME_COUNT:
 
@@ -16,9 +17,9 @@ VIDEO_GET_FRAME_COUNT
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, VIDEO_GET_FRAME_COUNT, __u64 *pts)
-    :name: VIDEO_GET_FRAME_COUNT
+.. c:macro:: VIDEO_GET_FRAME_COUNT
 
+``int ioctl(int fd, VIDEO_GET_FRAME_COUNT, __u64 *pts)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -47,7 +47,6 @@ Arguments
        -  Returns the number of frames displayed since the decoder was
 	  started.
 
-
 Description
 -----------
 
@@ -58,7 +57,6 @@ control.
 This ioctl call asks the Video Device to return the number of displayed
 frames since the decoder was started.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-get-pts.rst b/Documentation/userspace-api/media/dvb/video-get-pts.rst
index 28655a1a9249..fedaff41be0b 100644
--- a/Documentation/userspace-api/media/dvb/video-get-pts.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-pts.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_GET_PTS:
 
@@ -16,9 +17,9 @@ VIDEO_GET_PTS
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, VIDEO_GET_PTS, __u64 *pts)
-    :name: VIDEO_GET_PTS
+.. c:macro:: VIDEO_GET_PTS
 
+``int ioctl(int fd, VIDEO_GET_PTS, __u64 *pts)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -51,7 +51,6 @@ Arguments
 	  but may also be a value close to it like the PTS of the last
 	  decoded frame or the last PTS extracted by the PES parser.
 
-
 Description
 -----------
 
@@ -62,7 +61,6 @@ control.
 This ioctl call asks the Video Device to return the current PTS
 timestamp.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-get-size.rst b/Documentation/userspace-api/media/dvb/video-get-size.rst
index a199afbfc1b1..de34331c5bd1 100644
--- a/Documentation/userspace-api/media/dvb/video-get-size.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-size.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_GET_SIZE:
 
@@ -16,9 +17,9 @@ VIDEO_GET_SIZE
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, VIDEO_GET_SIZE, video_size_t *size)
-    :name: VIDEO_GET_SIZE
+.. c:macro:: VIDEO_GET_SIZE
 
+``int ioctl(int fd, VIDEO_GET_SIZE, video_size_t *size)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  Returns the size and aspect ratio.
 
-
 Description
 -----------
 
@@ -62,7 +61,6 @@ This ioctl returns the size and aspect ratio.
 		video_format_t aspect_ratio;
 	} video_size_t;
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-get-status.rst b/Documentation/userspace-api/media/dvb/video-get-status.rst
index 3f29dac18a21..9b86fbf411d4 100644
--- a/Documentation/userspace-api/media/dvb/video-get-status.rst
+++ b/Documentation/userspace-api/media/dvb/video-get-status.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_GET_STATUS:
 
@@ -16,9 +17,9 @@ VIDEO_GET_STATUS
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_GET_STATUS, struct video_status *status)
-    :name: VIDEO_GET_STATUS
+.. c:macro:: VIDEO_GET_STATUS
 
+``int ioctl(fd, VIDEO_GET_STATUS, struct video_status *status)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  Returns the current status of the Video Device.
 
-
 Description
 -----------
 
diff --git a/Documentation/userspace-api/media/dvb/video-play.rst b/Documentation/userspace-api/media/dvb/video-play.rst
index 71db54d840cb..35ac8b98fdbf 100644
--- a/Documentation/userspace-api/media/dvb/video-play.rst
+++ b/Documentation/userspace-api/media/dvb/video-play.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_PLAY:
 
@@ -16,9 +17,9 @@ VIDEO_PLAY
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_PLAY)
-    :name: VIDEO_PLAY
+.. c:macro:: VIDEO_PLAY
 
+``int ioctl(fd, VIDEO_PLAY)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -40,7 +40,6 @@ Arguments
 
        -  Equals VIDEO_PLAY for this command.
 
-
 Description
 -----------
 
@@ -50,7 +49,6 @@ V4L2 :ref:`VIDIOC_DECODER_CMD` instead.
 This ioctl call asks the Video Device to start playing a video stream
 from the selected source.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-select-source.rst b/Documentation/userspace-api/media/dvb/video-select-source.rst
index 2e4ee53fa155..929a20985d53 100644
--- a/Documentation/userspace-api/media/dvb/video-select-source.rst
+++ b/Documentation/userspace-api/media/dvb/video-select-source.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_SELECT_SOURCE:
 
@@ -16,9 +17,9 @@ VIDEO_SELECT_SOURCE
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_SELECT_SOURCE, video_stream_source_t source)
-    :name: VIDEO_SELECT_SOURCE
+.. c:macro:: VIDEO_SELECT_SOURCE
 
+``int ioctl(fd, VIDEO_SELECT_SOURCE, video_stream_source_t source)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  Indicates which source shall be used for the Video stream.
 
-
 Description
 -----------
 
diff --git a/Documentation/userspace-api/media/dvb/video-set-blank.rst b/Documentation/userspace-api/media/dvb/video-set-blank.rst
index 5454fe7905bd..70249a6ba125 100644
--- a/Documentation/userspace-api/media/dvb/video-set-blank.rst
+++ b/Documentation/userspace-api/media/dvb/video-set-blank.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_SET_BLANK:
 
@@ -16,9 +17,9 @@ VIDEO_SET_BLANK
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_SET_BLANK, boolean mode)
-    :name: VIDEO_SET_BLANK
+.. c:macro:: VIDEO_SET_BLANK
 
+``int ioctl(fd, VIDEO_SET_BLANK, boolean mode)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -51,13 +51,11 @@ Arguments
        -
        -  FALSE: Show last decoded frame.
 
-
 Description
 -----------
 
 This ioctl call asks the Video Device to blank out the picture.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-set-display-format.rst b/Documentation/userspace-api/media/dvb/video-set-display-format.rst
index ada6113e2f2d..1de4f40ae732 100644
--- a/Documentation/userspace-api/media/dvb/video-set-display-format.rst
+++ b/Documentation/userspace-api/media/dvb/video-set-display-format.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_SET_DISPLAY_FORMAT:
 
@@ -16,9 +17,9 @@ VIDEO_SET_DISPLAY_FORMAT
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_SET_DISPLAY_FORMAT)
-    :name: VIDEO_SET_DISPLAY_FORMAT
+.. c:macro:: VIDEO_SET_DISPLAY_FORMAT
 
+``int ioctl(fd, VIDEO_SET_DISPLAY_FORMAT)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,14 +46,12 @@ Arguments
 
        -  Selects the video format to be used.
 
-
 Description
 -----------
 
 This ioctl call asks the Video Device to select the video format to be
 applied by the MPEG chip on the video.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-set-format.rst b/Documentation/userspace-api/media/dvb/video-set-format.rst
index 758a5d1642ab..bb64e37ae081 100644
--- a/Documentation/userspace-api/media/dvb/video-set-format.rst
+++ b/Documentation/userspace-api/media/dvb/video-set-format.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_SET_FORMAT:
 
@@ -16,9 +17,9 @@ VIDEO_SET_FORMAT
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_SET_FORMAT, video_format_t format)
-    :name: VIDEO_SET_FORMAT
+.. c:macro:: VIDEO_SET_FORMAT
 
+``int ioctl(fd, VIDEO_SET_FORMAT, video_format_t format)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  video format of TV as defined in section ??.
 
-
 Description
 -----------
 
@@ -72,12 +71,10 @@ appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
 
-
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EINVAL``
diff --git a/Documentation/userspace-api/media/dvb/video-set-streamtype.rst b/Documentation/userspace-api/media/dvb/video-set-streamtype.rst
index f3a99858b1db..1f31c048bdbc 100644
--- a/Documentation/userspace-api/media/dvb/video-set-streamtype.rst
+++ b/Documentation/userspace-api/media/dvb/video-set-streamtype.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_SET_STREAMTYPE:
 
@@ -16,9 +17,9 @@ VIDEO_SET_STREAMTYPE
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_SET_STREAMTYPE, int type)
-    :name: VIDEO_SET_STREAMTYPE
+.. c:macro:: VIDEO_SET_STREAMTYPE
 
+``int ioctl(fd, VIDEO_SET_STREAMTYPE, int type)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  stream type
 
-
 Description
 -----------
 
@@ -54,7 +53,6 @@ This ioctl tells the driver which kind of stream to expect being written
 to it. If this call is not used the default of video PES is used. Some
 drivers might not support this call and always expect PES.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-slowmotion.rst b/Documentation/userspace-api/media/dvb/video-slowmotion.rst
index 2ccb84d6a68b..1478fcc30cb8 100644
--- a/Documentation/userspace-api/media/dvb/video-slowmotion.rst
+++ b/Documentation/userspace-api/media/dvb/video-slowmotion.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_SLOWMOTION:
 
@@ -16,9 +17,9 @@ VIDEO_SLOWMOTION
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_SLOWMOTION, int nFrames)
-    :name: VIDEO_SLOWMOTION
+.. c:macro:: VIDEO_SLOWMOTION
 
+``int ioctl(fd, VIDEO_SLOWMOTION, int nFrames)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  The number of times to repeat each frame.
 
-
 Description
 -----------
 
@@ -54,7 +53,6 @@ This ioctl call asks the video device to repeat decoding frames N number
 of times. This call can only be used if VIDEO_SOURCE_MEMORY is
 selected.
 
-
 Return Value
 ------------
 
@@ -63,12 +61,10 @@ appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
 
-
 .. flat-table::
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  ``EPERM``
diff --git a/Documentation/userspace-api/media/dvb/video-stillpicture.rst b/Documentation/userspace-api/media/dvb/video-stillpicture.rst
index a04f9f3ed162..d25384222a20 100644
--- a/Documentation/userspace-api/media/dvb/video-stillpicture.rst
+++ b/Documentation/userspace-api/media/dvb/video-stillpicture.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_STILLPICTURE:
 
@@ -16,9 +17,9 @@ VIDEO_STILLPICTURE
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_STILLPICTURE, struct video_still_picture *sp)
-    :name: VIDEO_STILLPICTURE
+.. c:macro:: VIDEO_STILLPICTURE
 
+``int ioctl(fd, VIDEO_STILLPICTURE, struct video_still_picture *sp)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  Pointer to a location where an I-frame and size is stored.
 
-
 Description
 -----------
 
@@ -54,7 +53,6 @@ This ioctl call asks the Video Device to display a still picture
 (I-frame). The input data shall contain an I-frame. If the pointer is
 NULL, then the current displayed still picture is blanked.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-stop.rst b/Documentation/userspace-api/media/dvb/video-stop.rst
index 9318655dce23..96f61c5b48a2 100644
--- a/Documentation/userspace-api/media/dvb/video-stop.rst
+++ b/Documentation/userspace-api/media/dvb/video-stop.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_STOP:
 
@@ -16,9 +17,9 @@ VIDEO_STOP
 Synopsis
 --------
 
-.. c:function:: int ioctl(fd, VIDEO_STOP, boolean mode)
-    :name: VIDEO_STOP
+.. c:macro:: VIDEO_STOP
 
+``int ioctl(fd, VIDEO_STOP, boolean mode)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -56,7 +56,6 @@ Arguments
        -
        -  FALSE: Show last decoded frame.
 
-
 Description
 -----------
 
@@ -67,7 +66,6 @@ This ioctl call asks the Video Device to stop playing the current
 stream. Depending on the input parameter, the screen can be blanked out
 or displaying the last decoded frame.
 
-
 Return Value
 ------------
 
diff --git a/Documentation/userspace-api/media/dvb/video-try-command.rst b/Documentation/userspace-api/media/dvb/video-try-command.rst
index 430c36035329..79bf3dfb8a32 100644
--- a/Documentation/userspace-api/media/dvb/video-try-command.rst
+++ b/Documentation/userspace-api/media/dvb/video-try-command.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: DTV.video
 
 .. _VIDEO_TRY_COMMAND:
 
@@ -16,9 +17,9 @@ VIDEO_TRY_COMMAND
 Synopsis
 --------
 
-.. c:function:: int ioctl(int fd, VIDEO_TRY_COMMAND, struct video_command *cmd)
-    :name: VIDEO_TRY_COMMAND
+.. c:macro:: VIDEO_TRY_COMMAND
 
+``int ioctl(int fd, VIDEO_TRY_COMMAND, struct video_command *cmd)``
 
 Arguments
 ---------
@@ -27,7 +28,6 @@ Arguments
     :header-rows:  0
     :stub-columns: 0
 
-
     -  .. row 1
 
        -  int fd
@@ -46,7 +46,6 @@ Arguments
 
        -  Try a decoder command.
 
-
 Description
 -----------
 
@@ -59,7 +58,6 @@ subset of the ``v4l2_decoder_cmd`` struct, so refer to the
 :ref:`VIDIOC_TRY_DECODER_CMD <VIDIOC_DECODER_CMD>` documentation
 for more information.
 
-
 Return Value
 ------------
 
-- 
2.26.2

