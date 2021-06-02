Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6B4398A5E
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 15:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhFBN05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 09:26:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:39070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229593AbhFBN0z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 09:26:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63DE06024A;
        Wed,  2 Jun 2021 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622640312;
        bh=FV+x3WxqlmUwMsQyV+Gb3ENhCp68U7GBVBr1EI3Wgv8=;
        h=From:To:Cc:Subject:Date:From;
        b=TlQWh4JsQYBN9CkhhCoASBSgDddqLirbSLtxwZwAF8/U8RJA83feGs1sSd6q0chAL
         Vhs2Ca7ZuWZGisyAUEiTJj51SPYptRxORRPGHX7FUlezF3u7Dln01EjYLo3dBZaEV6
         FwsO9zixrSnyZxlpInhv/vKHJ2pnoFRbvSzs4maruafEdtOHE33Gtm0ihp0lu/ybD0
         t2XUMp5m19MGp25Nr6ajPXzRpgNnQqs3Z5O0T2bqMJHj5/NrDFi/HqUY0SchZddy4c
         4t6dJqo8UIO4oN5oC8iA1Y2Vhnj2qs5sovufIkuhhOPXRv6ExtZM7D38FcqpL6qf6u
         JYszKQ35B6txw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loQrt-006UP6-UK; Wed, 02 Jun 2021 15:25:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 0/3] Move audio/video/osd APIs to be together with av7110
Date:   Wed,  2 Jun 2021 15:25:06 +0200
Message-Id: <cover.1622639751.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ivtv is abusing a DVB API, as this is a V4L2 driver only.
While this got fixed several years ago, a backward-compat code
was added on that time (2016) by
commit 6689638025a9 ("[media] ivtv: mark DVB "borrowed" ioctls as deprecated").

It is time to drop support for it.

With that, the only remaining upstream driver to use those APIs is the
av7110, which is now at staging. So, move the API to staging too, in order
to be together with the driver that will retire on a couple of versions.

Mauro Carvalho Chehab (3):
  media: ivtv: get rid of DVB deprecated ioctls
  media: dvb header files: move some headers to staging
  media: docs: move DVB audio/video docs to staging

 Documentation/userspace-api/media/Makefile    |  10 +-
 .../media/audio.h.rst.exceptions              |  19 --
 .../userspace-api/media/dvb/headers.rst       |   7 -
 .../media/dvb/legacy_dvb_apis.rst             |   7 -
 .../media/video.h.rst.exceptions              |  39 ----
 drivers/media/pci/ivtv/Kconfig                |  12 -
 drivers/media/pci/ivtv/ivtv-driver.h          |   2 -
 drivers/media/pci/ivtv/ivtv-ioctl.c           | 221 ------------------
 .../audio-bilingual-channel-select.rst        |   0
 .../media/av7110}/audio-channel-select.rst    |   0
 .../media/av7110}/audio-clear-buffer.rst      |   0
 .../staging/media/av7110}/audio-continue.rst  |   0
 .../staging/media/av7110}/audio-fclose.rst    |   0
 .../staging/media/av7110}/audio-fopen.rst     |   0
 .../staging/media/av7110}/audio-fwrite.rst    |   0
 .../media/av7110}/audio-get-capabilities.rst  |   0
 .../media/av7110}/audio-get-status.rst        |   0
 .../staging/media/av7110}/audio-pause.rst     |   0
 .../staging/media/av7110}/audio-play.rst      |   0
 .../media/av7110}/audio-select-source.rst     |   0
 .../media/av7110}/audio-set-av-sync.rst       |   0
 .../media/av7110}/audio-set-bypass-mode.rst   |   0
 .../staging/media/av7110}/audio-set-id.rst    |   0
 .../staging/media/av7110}/audio-set-mixer.rst |   0
 .../staging/media/av7110}/audio-set-mute.rst  |   0
 .../media/av7110}/audio-set-streamtype.rst    |   0
 .../staging/media/av7110}/audio-stop.rst      |   0
 .../staging/media/av7110}/audio.h             |   0
 .../staging/media/av7110}/audio.rst           |   0
 .../media/av7110}/audio_data_types.rst        |   0
 .../media/av7110}/audio_function_calls.rst    |   0
 drivers/staging/media/av7110/av7110.h         |   7 +-
 .../staging/media/av7110}/osd.h               |   0
 .../media/av7110}/video-clear-buffer.rst      |   0
 .../staging/media/av7110}/video-command.rst   |   0
 .../staging/media/av7110}/video-continue.rst  |   0
 .../media/av7110}/video-fast-forward.rst      |   0
 .../staging/media/av7110}/video-fclose.rst    |   0
 .../staging/media/av7110}/video-fopen.rst     |   0
 .../staging/media/av7110}/video-freeze.rst    |   0
 .../staging/media/av7110}/video-fwrite.rst    |   0
 .../media/av7110}/video-get-capabilities.rst  |   0
 .../staging/media/av7110}/video-get-event.rst |   0
 .../media/av7110}/video-get-frame-count.rst   |   0
 .../staging/media/av7110}/video-get-pts.rst   |   0
 .../staging/media/av7110}/video-get-size.rst  |   0
 .../media/av7110}/video-get-status.rst        |   0
 .../staging/media/av7110}/video-play.rst      |   0
 .../media/av7110}/video-select-source.rst     |   0
 .../staging/media/av7110}/video-set-blank.rst |   0
 .../av7110}/video-set-display-format.rst      |   0
 .../media/av7110}/video-set-format.rst        |   0
 .../media/av7110}/video-set-streamtype.rst    |   0
 .../media/av7110}/video-slowmotion.rst        |   0
 .../media/av7110}/video-stillpicture.rst      |   0
 .../staging/media/av7110}/video-stop.rst      |   0
 .../media/av7110}/video-try-command.rst       |   0
 .../staging/media/av7110}/video.h             |   0
 .../staging/media/av7110}/video.rst           |   0
 .../media/av7110}/video_function_calls.rst    |   0
 .../staging/media/av7110}/video_types.rst     |   0
 61 files changed, 6 insertions(+), 318 deletions(-)
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
 rename {include/uapi/linux/dvb => drivers/staging/media/av7110}/audio.h (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio_data_types.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/audio_function_calls.rst (100%)
 rename {include/uapi/linux/dvb => drivers/staging/media/av7110}/osd.h (100%)
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
 rename {include/uapi/linux/dvb => drivers/staging/media/av7110}/video.h (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video_function_calls.rst (100%)
 rename {Documentation/userspace-api/media/dvb => drivers/staging/media/av7110}/video_types.rst (100%)

-- 
2.31.1


