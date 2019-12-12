Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A68211CD63
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 13:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbfLLMnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 07:43:53 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:47743 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729092AbfLLMnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 07:43:53 -0500
Received: from [IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65]
 ([IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fNoqiZWGlGyJwfNosiyAKz; Thu, 12 Dec 2019 13:43:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576154630; bh=M8q42La2aoIo3d0AV49CaAjrlZO1k0y0IFPGZdp7R14=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=X0oCmUXP9+S7pIl05v5s+RkVjrurZ2mr3Kgfi3AgMefOiq5sH6IAWpB83PBqbgQwc
         mcS+4pyy3LgHohmvjXcOxyC6EDtBOjpocWP5eVUx2hFGMTyX/+eZqZuFo4NyE2Cm53
         Rg1ADVjLmpGvUQQTrcVI1ZBc/GU335Itkd6ZhVmIc06jmdYaodZENBY/q/xOOsJW4W
         QDA4cvIxzJscFOX/cUjyj5+PqNjzBAhYjBJaGNA7+8EzVnBiwD8paCfwQF8TxSx5uU
         vX3ZEg9lkjVueQWxQyGtdPjH2uJbZ5nmVBTfFg1qrtfHNHv4MZX6qHbcPSs28tYtew
         JwgdOGNFdomGw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Takashi Iwai <tiwai@suse.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] ALSA PCM API updates
Message-ID: <babeeeca-d646-d313-ee47-e8b7f2caa57d@xs4all.nl>
Date:   Thu, 12 Dec 2019 13:43:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAm34ayAFPWxyvqp1K4tDn/TbRASPzJsiHmiU0TtD1ZbOTyFCLDpiD10VZHq/baJH8X3H2wWOpIj7KgfU6A+qau1J97C2m/ZHfrnN4HF3H5+20ECYQoK
 43ur/4jtbRRYMe0EMumMnuxDOIQ0FvcjJT2ulbVNotnZyb3EbHVSJgwuueuNm/T9dO+dhdeix+VlUcG+Wx9XS6aDZX4Do8FSfhkny+zdsU4qULZWKxOlkcDw
 alpeyGqDyxXz6VX7wEp8vTVxVL+/3LEGRQrAuyFSUWI67iZuNN8pt319uzbE2dMu
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2099ef02c6c024751e4d16ace67dd6b910c875e4:

  media: dt-bindings: media: cal: convert binding to yaml (2019-12-09 11:43:47 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6c

for you to fetch changes up to c8c450ba4381186a302417e2e9e6284b86d2a8a3:

  media: Drop superfluous ioctl PCM ops (2019-12-12 13:28:47 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Takashi Iwai (14):
      media: solo6x10: Use managed buffer allocation
      media: tw686x: Use managed buffer allocation
      media: usbtv: Use managed buffer allocation
      media: cobalt: Clean up ALSA PCM API usages
      media: cx18: Clean up ALSA PCM API usages
      media: ivtv: Clean up ALSA PCM API usages
      media: cs231xx: Clean up ALSA PCM API usages
      media: em28xx: Clean up ALSA PCM API usages
      media: go7007: Clean up ALSA PCM API usages
      media: tm6000: Clean up ALSA PCM API usages
      media: cobalt: Drop superfluous ioctl PCM ops
      media: cx18: Drop superfluous ioctl PCM ops
      media: ivtv: Drop superfluous ioctl PCM ops
      media: Drop superfluous ioctl PCM ops

 drivers/media/pci/cobalt/cobalt-alsa-pcm.c | 69 +++---------------------------------------------
 drivers/media/pci/cx18/cx18-alsa-pcm.c     | 75 +---------------------------------------------------
 drivers/media/pci/cx23885/cx23885-alsa.c   |  1 -
 drivers/media/pci/cx25821/cx25821-alsa.c   |  1 -
 drivers/media/pci/cx88/cx88-alsa.c         |  1 -
 drivers/media/pci/ivtv/ivtv-alsa-pcm.c     | 76 +----------------------------------------------------
 drivers/media/pci/saa7134/saa7134-alsa.c   |  1 -
 drivers/media/pci/solo6x10/solo6x10-g723.c | 24 ++++-------------
 drivers/media/pci/tw686x/tw686x-audio.c    | 16 +-----------
 drivers/media/usb/cx231xx/cx231xx-audio.c  | 79 +------------------------------------------------------
 drivers/media/usb/em28xx/em28xx-audio.c    | 87 +------------------------------------------------------------
 drivers/media/usb/go7007/snd-go7007.c      | 25 +++---------------
 drivers/media/usb/tm6000/tm6000-alsa.c     | 82 +--------------------------------------------------------
 drivers/media/usb/usbtv/usbtv-audio.c      | 29 +--------------------
 14 files changed, 19 insertions(+), 547 deletions(-)
