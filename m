Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74305398A5F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 15:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhFBN05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 09:26:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:39086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229607AbhFBN0z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 09:26:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B824613E1;
        Wed,  2 Jun 2021 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622640312;
        bh=qHHLGuHBemx0UKH6oNwa5plGSJM0T2B9DQ8jFJeW12A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CnLplKVSCBUpxgBD3kNV3RBM7m4l3hRfFjJI99bHZ1J+bzCzOSw/B3SyUAJ2jk2ny
         22KkcDshopcC+odXpodk8vxgkdEQxxtl+3KO/xJmcSP9BaThz9BGZH+iPE8Tenl72m
         4gYlbii6nFR7MOKpqanpeaWiY+0x6+/Yzym29HXzyNrYYshS6d0m8QAtj2fl14zfzt
         +Z2m0iAd7uCgNy+ErPelDu8SJX/1WS9zZnOt10AV4bYY2k1/qTxU6tNsfj1DEnAa0l
         9+tutk3KVqJrcmhwxYim70Hjliu8bfvkua1OUZIMXW9QN+SSuDXDW3vp+RszhDAPSn
         ZErnx7bW42vmw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loQru-006UPH-1o; Wed, 02 Jun 2021 15:25:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 3/3] media: docs: move DVB audio/video docs to staging
Date:   Wed,  2 Jun 2021 15:25:09 +0200
Message-Id: <d0a651714b4c24222672d48f2effdbb3796f1395.1622639751.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622639751.git.mchehab+huawei@kernel.org>
References: <cover.1622639751.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only upstream driver using the API described there is the
av7110 driver.

As the driver was moved to staging, move the API bits to staging
as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/Makefile    | 10 +----
 .../media/audio.h.rst.exceptions              | 19 ---------
 .../userspace-api/media/dvb/headers.rst       |  7 ----
 .../media/dvb/legacy_dvb_apis.rst             |  7 ----
 .../media/video.h.rst.exceptions              | 39 -------------------
 .../audio-bilingual-channel-select.rst        |  0
 .../media/av7110}/audio-channel-select.rst    |  0
 .../media/av7110}/audio-clear-buffer.rst      |  0
 .../staging/media/av7110}/audio-continue.rst  |  0
 .../staging/media/av7110}/audio-fclose.rst    |  0
 .../staging/media/av7110}/audio-fopen.rst     |  0
 .../staging/media/av7110}/audio-fwrite.rst    |  0
 .../media/av7110}/audio-get-capabilities.rst  |  0
 .../media/av7110}/audio-get-status.rst        |  0
 .../staging/media/av7110}/audio-pause.rst     |  0
 .../staging/media/av7110}/audio-play.rst      |  0
 .../media/av7110}/audio-select-source.rst     |  0
 .../media/av7110}/audio-set-av-sync.rst       |  0
 .../media/av7110}/audio-set-bypass-mode.rst   |  0
 .../staging/media/av7110}/audio-set-id.rst    |  0
 .../staging/media/av7110}/audio-set-mixer.rst |  0
 .../staging/media/av7110}/audio-set-mute.rst  |  0
 .../media/av7110}/audio-set-streamtype.rst    |  0
 .../staging/media/av7110}/audio-stop.rst      |  0
 .../staging/media/av7110}/audio.rst           |  0
 .../media/av7110}/audio_data_types.rst        |  0
 .../media/av7110}/audio_function_calls.rst    |  0
 .../media/av7110}/video-clear-buffer.rst      |  0
 .../staging/media/av7110}/video-command.rst   |  0
 .../staging/media/av7110}/video-continue.rst  |  0
 .../media/av7110}/video-fast-forward.rst      |  0
 .../staging/media/av7110}/video-fclose.rst    |  0
 .../staging/media/av7110}/video-fopen.rst     |  0
 .../staging/media/av7110}/video-freeze.rst    |  0
 .../staging/media/av7110}/video-fwrite.rst    |  0
 .../media/av7110}/video-get-capabilities.rst  |  0
 .../staging/media/av7110}/video-get-event.rst |  0
 .../media/av7110}/video-get-frame-count.rst   |  0
 .../staging/media/av7110}/video-get-pts.rst   |  0
 .../staging/media/av7110}/video-get-size.rst  |  0
 .../media/av7110}/video-get-status.rst        |  0
 .../staging/media/av7110}/video-play.rst      |  0
 .../media/av7110}/video-select-source.rst     |  0
 .../staging/media/av7110}/video-set-blank.rst |  0
 .../av7110}/video-set-display-format.rst      |  0
 .../media/av7110}/video-set-format.rst        |  0
 .../media/av7110}/video-set-streamtype.rst    |  0
 .../media/av7110}/video-slowmotion.rst        |  0
 .../media/av7110}/video-stillpicture.rst      |  0
 .../staging/media/av7110}/video-stop.rst      |  0
 .../media/av7110}/video-try-command.rst       |  0
 .../staging/media/av7110}/video.rst           |  0
 .../media/av7110}/video_function_calls.rst    |  0
 .../staging/media/av7110}/video_types.rst     |  0
 54 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/userspace-api/media/audio.h.rst.exceptions
 delete mode 100644 Documentation/userspace-api/media/video.h.rst.exceptions
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-bilingual-channel-select.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-channel-select.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-clear-buffer.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-continue.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-fclose.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-fopen.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-fwrite.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-get-capabilities.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-get-status.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-pause.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-play.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-select-source.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-set-av-sync.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-set-bypass-mode.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-set-id.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-set-mixer.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-set-mute.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-set-streamtype.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio-stop.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio_data_types.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio_function_calls.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-clear-buffer.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-command.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-continue.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-fast-forward.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-fclose.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-fopen.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-freeze.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-fwrite.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-get-capabilities.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-get-event.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-get-frame-count.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-get-pts.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-get-size.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-get-status.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-play.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-select-source.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-set-blank.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-set-display-format.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-set-format.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-set-streamtype.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-slowmotion.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-stillpicture.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-stop.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video-try-command.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video_function_calls.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video_types.rst (100%)

diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
index 81a4a1a53bce..00922aa7efde 100644
--- a/Documentation/userspace-api/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -7,8 +7,8 @@ PARSER = $(srctree)/Documentation/sphinx/parse-headers.pl
 UAPI = $(srctree)/include/uapi/linux
 KAPI = $(srctree)/include/linux
 
-FILES = audio.h.rst ca.h.rst dmx.h.rst frontend.h.rst net.h.rst video.h.rst \
-	  videodev2.h.rst media.h.rst cec.h.rst lirc.h.rst
+FILES = ca.h.rst dmx.h.rst frontend.h.rst net.h.rst \
+	videodev2.h.rst media.h.rst cec.h.rst lirc.h.rst
 
 TARGETS := $(addprefix $(BUILDDIR)/, $(FILES))
 
@@ -21,9 +21,6 @@ quiet_gen_rst = echo '  PARSE   $(patsubst $(srctree)/%,%,$<)'; \
 
 silent_gen_rst = ${gen_rst}
 
-$(BUILDDIR)/audio.h.rst: ${UAPI}/dvb/audio.h ${PARSER} $(SRC_DIR)/audio.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
 $(BUILDDIR)/ca.h.rst: ${UAPI}/dvb/ca.h ${PARSER} $(SRC_DIR)/ca.h.rst.exceptions
 	@$($(quiet)gen_rst)
 
@@ -36,9 +33,6 @@ $(BUILDDIR)/frontend.h.rst: ${UAPI}/dvb/frontend.h ${PARSER} $(SRC_DIR)/frontend
 $(BUILDDIR)/net.h.rst: ${UAPI}/dvb/net.h ${PARSER} $(SRC_DIR)/net.h.rst.exceptions
 	@$($(quiet)gen_rst)
 
-$(BUILDDIR)/video.h.rst: ${UAPI}/dvb/video.h ${PARSER} $(SRC_DIR)/video.h.rst.exceptions
-	@$($(quiet)gen_rst)
-
 $(BUILDDIR)/videodev2.h.rst: ${UAPI}/videodev2.h ${PARSER} $(SRC_DIR)/videodev2.h.rst.exceptions
 	@$($(quiet)gen_rst)
 
diff --git a/Documentation/userspace-api/media/audio.h.rst.exceptions b/Documentation/userspace-api/media/audio.h.rst.exceptions
deleted file mode 100644
index cf6620477f73..000000000000
--- a/Documentation/userspace-api/media/audio.h.rst.exceptions
+++ /dev/null
@@ -1,19 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-# Ignore header name
-ignore define _DVBAUDIO_H_
-
-# Undocumented audio caps, as this is a deprecated API anyway
-ignore define AUDIO_CAP_DTS
-ignore define AUDIO_CAP_LPCM
-ignore define AUDIO_CAP_MP1
-ignore define AUDIO_CAP_MP2
-ignore define AUDIO_CAP_MP3
-ignore define AUDIO_CAP_AAC
-ignore define AUDIO_CAP_OGG
-ignore define AUDIO_CAP_SDDS
-ignore define AUDIO_CAP_AC3
-
-# some typedefs should point to struct/enums
-replace typedef audio_mixer_t :c:type:`audio_mixer`
-replace typedef audio_status_t :c:type:`audio_status`
diff --git a/Documentation/userspace-api/media/dvb/headers.rst b/Documentation/userspace-api/media/dvb/headers.rst
index 9743ffc35096..88c3eb33a89e 100644
--- a/Documentation/userspace-api/media/dvb/headers.rst
+++ b/Documentation/userspace-api/media/dvb/headers.rst
@@ -14,10 +14,3 @@ Digital TV uAPI headers
 .. kernel-include:: $BUILDDIR/ca.h.rst
 
 .. kernel-include:: $BUILDDIR/net.h.rst
-
-Legacy uAPI
-***********
-
-.. kernel-include:: $BUILDDIR/audio.h.rst
-
-.. kernel-include:: $BUILDDIR/video.h.rst
diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
index 6104879d728a..b97d56ee543c 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_apis.rst
@@ -11,11 +11,6 @@ The APIs described here **should not** be used on new drivers or applications.
 The DVBv3 frontend API has issues with new delivery systems, including
 DVB-S2, DVB-T2, ISDB, etc.
 
-There's just one driver for a very legacy hardware using the Digital TV
-audio and video APIs. No modern drivers should use it. Instead, audio and
-video should be using the V4L2 and ALSA APIs, and the pipelines should
-be set via the Media Controller API.
-
 .. attention::
 
    The APIs described here doesn't necessarily reflect the current
@@ -28,5 +23,3 @@ be set via the Media Controller API.
     :maxdepth: 1
 
     frontend_legacy_dvbv3_api
-    video
-    audio
diff --git a/Documentation/userspace-api/media/video.h.rst.exceptions b/Documentation/userspace-api/media/video.h.rst.exceptions
deleted file mode 100644
index ea9de59ad8b7..000000000000
--- a/Documentation/userspace-api/media/video.h.rst.exceptions
+++ /dev/null
@@ -1,39 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-# Ignore header name
-ignore define _UAPI_DVBVIDEO_H_
-
-# This is a deprecated obscure API. Just ignore things we don't know
-ignore define VIDEO_CMD_PLAY
-ignore define VIDEO_CMD_STOP
-ignore define VIDEO_CMD_FREEZE
-ignore define VIDEO_CMD_CONTINUE
-ignore define VIDEO_CMD_FREEZE_TO_BLACK
-ignore define VIDEO_CMD_STOP_TO_BLACK
-ignore define VIDEO_CMD_STOP_IMMEDIATELY
-ignore define VIDEO_PLAY_FMT_NONE
-ignore define VIDEO_PLAY_FMT_GOP
-ignore define VIDEO_VSYNC_FIELD_UNKNOWN
-ignore define VIDEO_VSYNC_FIELD_ODD
-ignore define VIDEO_VSYNC_FIELD_EVEN
-ignore define VIDEO_VSYNC_FIELD_PROGRESSIVE
-ignore define VIDEO_EVENT_SIZE_CHANGED
-ignore define VIDEO_EVENT_FRAME_RATE_CHANGED
-ignore define VIDEO_EVENT_DECODER_STOPPED
-ignore define VIDEO_EVENT_VSYNC
-ignore define VIDEO_CAP_MPEG1
-ignore define VIDEO_CAP_MPEG2
-ignore define VIDEO_CAP_SYS
-ignore define VIDEO_CAP_PROG
-ignore define VIDEO_CAP_SPU
-ignore define VIDEO_CAP_NAVI
-ignore define VIDEO_CAP_CSS
-
-# some typedefs should point to struct/enums
-replace typedef video_format_t :c:type:`video_format`
-replace typedef video_system_t :c:type:`video_system`
-replace typedef video_displayformat_t :c:type:`video_displayformat`
-replace typedef video_size_t :c:type:`video_size`
-replace typedef video_stream_source_t :c:type:`video_stream_source`
-replace typedef video_play_state_t :c:type:`video_play_state`
-replace typedef video_navi_pack_t :c:type:`video_navi_pack`
diff --git a/Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst b/drivers/staging/media/av7110/audio-bilingual-channel-select.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-bilingual-channel-select.rst
rename to drivers/staging/media/av7110/audio-bilingual-channel-select.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-channel-select.rst b/drivers/staging/media/av7110/audio-channel-select.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-channel-select.rst
rename to drivers/staging/media/av7110/audio-channel-select.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-clear-buffer.rst b/drivers/staging/media/av7110/audio-clear-buffer.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-clear-buffer.rst
rename to drivers/staging/media/av7110/audio-clear-buffer.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-continue.rst b/drivers/staging/media/av7110/audio-continue.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-continue.rst
rename to drivers/staging/media/av7110/audio-continue.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-fclose.rst b/drivers/staging/media/av7110/audio-fclose.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-fclose.rst
rename to drivers/staging/media/av7110/audio-fclose.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-fopen.rst b/drivers/staging/media/av7110/audio-fopen.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-fopen.rst
rename to drivers/staging/media/av7110/audio-fopen.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-fwrite.rst b/drivers/staging/media/av7110/audio-fwrite.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-fwrite.rst
rename to drivers/staging/media/av7110/audio-fwrite.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-get-capabilities.rst b/drivers/staging/media/av7110/audio-get-capabilities.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-get-capabilities.rst
rename to drivers/staging/media/av7110/audio-get-capabilities.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-get-status.rst b/drivers/staging/media/av7110/audio-get-status.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-get-status.rst
rename to drivers/staging/media/av7110/audio-get-status.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-pause.rst b/drivers/staging/media/av7110/audio-pause.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-pause.rst
rename to drivers/staging/media/av7110/audio-pause.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-play.rst b/drivers/staging/media/av7110/audio-play.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-play.rst
rename to drivers/staging/media/av7110/audio-play.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-select-source.rst b/drivers/staging/media/av7110/audio-select-source.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-select-source.rst
rename to drivers/staging/media/av7110/audio-select-source.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-set-av-sync.rst b/drivers/staging/media/av7110/audio-set-av-sync.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-set-av-sync.rst
rename to drivers/staging/media/av7110/audio-set-av-sync.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst b/drivers/staging/media/av7110/audio-set-bypass-mode.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-set-bypass-mode.rst
rename to drivers/staging/media/av7110/audio-set-bypass-mode.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-set-id.rst b/drivers/staging/media/av7110/audio-set-id.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-set-id.rst
rename to drivers/staging/media/av7110/audio-set-id.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-set-mixer.rst b/drivers/staging/media/av7110/audio-set-mixer.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-set-mixer.rst
rename to drivers/staging/media/av7110/audio-set-mixer.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-set-mute.rst b/drivers/staging/media/av7110/audio-set-mute.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-set-mute.rst
rename to drivers/staging/media/av7110/audio-set-mute.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-set-streamtype.rst b/drivers/staging/media/av7110/audio-set-streamtype.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-set-streamtype.rst
rename to drivers/staging/media/av7110/audio-set-streamtype.rst
diff --git a/Documentation/userspace-api/media/dvb/audio-stop.rst b/drivers/staging/media/av7110/audio-stop.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio-stop.rst
rename to drivers/staging/media/av7110/audio-stop.rst
diff --git a/Documentation/userspace-api/media/dvb/audio.rst b/drivers/staging/media/av7110/audio.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio.rst
rename to drivers/staging/media/av7110/audio.rst
diff --git a/Documentation/userspace-api/media/dvb/audio_data_types.rst b/drivers/staging/media/av7110/audio_data_types.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio_data_types.rst
rename to drivers/staging/media/av7110/audio_data_types.rst
diff --git a/Documentation/userspace-api/media/dvb/audio_function_calls.rst b/drivers/staging/media/av7110/audio_function_calls.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/audio_function_calls.rst
rename to drivers/staging/media/av7110/audio_function_calls.rst
diff --git a/Documentation/userspace-api/media/dvb/video-clear-buffer.rst b/drivers/staging/media/av7110/video-clear-buffer.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-clear-buffer.rst
rename to drivers/staging/media/av7110/video-clear-buffer.rst
diff --git a/Documentation/userspace-api/media/dvb/video-command.rst b/drivers/staging/media/av7110/video-command.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-command.rst
rename to drivers/staging/media/av7110/video-command.rst
diff --git a/Documentation/userspace-api/media/dvb/video-continue.rst b/drivers/staging/media/av7110/video-continue.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-continue.rst
rename to drivers/staging/media/av7110/video-continue.rst
diff --git a/Documentation/userspace-api/media/dvb/video-fast-forward.rst b/drivers/staging/media/av7110/video-fast-forward.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-fast-forward.rst
rename to drivers/staging/media/av7110/video-fast-forward.rst
diff --git a/Documentation/userspace-api/media/dvb/video-fclose.rst b/drivers/staging/media/av7110/video-fclose.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-fclose.rst
rename to drivers/staging/media/av7110/video-fclose.rst
diff --git a/Documentation/userspace-api/media/dvb/video-fopen.rst b/drivers/staging/media/av7110/video-fopen.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-fopen.rst
rename to drivers/staging/media/av7110/video-fopen.rst
diff --git a/Documentation/userspace-api/media/dvb/video-freeze.rst b/drivers/staging/media/av7110/video-freeze.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-freeze.rst
rename to drivers/staging/media/av7110/video-freeze.rst
diff --git a/Documentation/userspace-api/media/dvb/video-fwrite.rst b/drivers/staging/media/av7110/video-fwrite.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-fwrite.rst
rename to drivers/staging/media/av7110/video-fwrite.rst
diff --git a/Documentation/userspace-api/media/dvb/video-get-capabilities.rst b/drivers/staging/media/av7110/video-get-capabilities.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-get-capabilities.rst
rename to drivers/staging/media/av7110/video-get-capabilities.rst
diff --git a/Documentation/userspace-api/media/dvb/video-get-event.rst b/drivers/staging/media/av7110/video-get-event.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-get-event.rst
rename to drivers/staging/media/av7110/video-get-event.rst
diff --git a/Documentation/userspace-api/media/dvb/video-get-frame-count.rst b/drivers/staging/media/av7110/video-get-frame-count.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-get-frame-count.rst
rename to drivers/staging/media/av7110/video-get-frame-count.rst
diff --git a/Documentation/userspace-api/media/dvb/video-get-pts.rst b/drivers/staging/media/av7110/video-get-pts.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-get-pts.rst
rename to drivers/staging/media/av7110/video-get-pts.rst
diff --git a/Documentation/userspace-api/media/dvb/video-get-size.rst b/drivers/staging/media/av7110/video-get-size.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-get-size.rst
rename to drivers/staging/media/av7110/video-get-size.rst
diff --git a/Documentation/userspace-api/media/dvb/video-get-status.rst b/drivers/staging/media/av7110/video-get-status.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-get-status.rst
rename to drivers/staging/media/av7110/video-get-status.rst
diff --git a/Documentation/userspace-api/media/dvb/video-play.rst b/drivers/staging/media/av7110/video-play.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-play.rst
rename to drivers/staging/media/av7110/video-play.rst
diff --git a/Documentation/userspace-api/media/dvb/video-select-source.rst b/drivers/staging/media/av7110/video-select-source.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-select-source.rst
rename to drivers/staging/media/av7110/video-select-source.rst
diff --git a/Documentation/userspace-api/media/dvb/video-set-blank.rst b/drivers/staging/media/av7110/video-set-blank.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-set-blank.rst
rename to drivers/staging/media/av7110/video-set-blank.rst
diff --git a/Documentation/userspace-api/media/dvb/video-set-display-format.rst b/drivers/staging/media/av7110/video-set-display-format.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-set-display-format.rst
rename to drivers/staging/media/av7110/video-set-display-format.rst
diff --git a/Documentation/userspace-api/media/dvb/video-set-format.rst b/drivers/staging/media/av7110/video-set-format.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-set-format.rst
rename to drivers/staging/media/av7110/video-set-format.rst
diff --git a/Documentation/userspace-api/media/dvb/video-set-streamtype.rst b/drivers/staging/media/av7110/video-set-streamtype.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-set-streamtype.rst
rename to drivers/staging/media/av7110/video-set-streamtype.rst
diff --git a/Documentation/userspace-api/media/dvb/video-slowmotion.rst b/drivers/staging/media/av7110/video-slowmotion.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-slowmotion.rst
rename to drivers/staging/media/av7110/video-slowmotion.rst
diff --git a/Documentation/userspace-api/media/dvb/video-stillpicture.rst b/drivers/staging/media/av7110/video-stillpicture.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-stillpicture.rst
rename to drivers/staging/media/av7110/video-stillpicture.rst
diff --git a/Documentation/userspace-api/media/dvb/video-stop.rst b/drivers/staging/media/av7110/video-stop.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-stop.rst
rename to drivers/staging/media/av7110/video-stop.rst
diff --git a/Documentation/userspace-api/media/dvb/video-try-command.rst b/drivers/staging/media/av7110/video-try-command.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video-try-command.rst
rename to drivers/staging/media/av7110/video-try-command.rst
diff --git a/Documentation/userspace-api/media/dvb/video.rst b/drivers/staging/media/av7110/video.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video.rst
rename to drivers/staging/media/av7110/video.rst
diff --git a/Documentation/userspace-api/media/dvb/video_function_calls.rst b/drivers/staging/media/av7110/video_function_calls.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video_function_calls.rst
rename to drivers/staging/media/av7110/video_function_calls.rst
diff --git a/Documentation/userspace-api/media/dvb/video_types.rst b/drivers/staging/media/av7110/video_types.rst
similarity index 100%
rename from Documentation/userspace-api/media/dvb/video_types.rst
rename to drivers/staging/media/av7110/video_types.rst
-- 
2.31.1

