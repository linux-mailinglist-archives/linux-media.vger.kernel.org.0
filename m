Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDC8B118A43
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 14:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfLJN7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 08:59:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:51723 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727370AbfLJN7D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 08:59:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E494DAD85;
        Tue, 10 Dec 2019 13:58:59 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Andy Walls <awalls@md.metrocast.net>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Ismael Luceno <ismael@iodev.co.uk>
Subject: [PATCH for-5.6 00/14] media: ALSA PCM API updates
Date:   Tue, 10 Dec 2019 14:58:35 +0100
Message-Id: <20191210135849.15607-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this is a patch set to adapt the latest ALSA PCM API to media
drivers.  Basically these are merely cleanups, as shown in diffstat,
and there should be no functional changes.

As the corresponding ALSA PCM API change is found in 5.5-rc1, please
apply these on 5.5-rc1 or later.  Or if you prefer, I can merge them
through sound tree, too.  Let me know.


thanks,

Takashi

===

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

 drivers/media/pci/cobalt/cobalt-alsa-pcm.c | 69 ++----------------------
 drivers/media/pci/cx18/cx18-alsa-pcm.c     | 75 +-------------------------
 drivers/media/pci/cx23885/cx23885-alsa.c   |  1 -
 drivers/media/pci/cx25821/cx25821-alsa.c   |  1 -
 drivers/media/pci/cx88/cx88-alsa.c         |  1 -
 drivers/media/pci/ivtv/ivtv-alsa-pcm.c     | 76 +-------------------------
 drivers/media/pci/saa7134/saa7134-alsa.c   |  1 -
 drivers/media/pci/solo6x10/solo6x10-g723.c | 24 ++-------
 drivers/media/pci/tw686x/tw686x-audio.c    | 16 +-----
 drivers/media/usb/cx231xx/cx231xx-audio.c  | 79 +--------------------------
 drivers/media/usb/em28xx/em28xx-audio.c    | 87 +-----------------------------
 drivers/media/usb/go7007/snd-go7007.c      | 25 ++-------
 drivers/media/usb/tm6000/tm6000-alsa.c     | 82 +---------------------------
 drivers/media/usb/usbtv/usbtv-audio.c      | 29 +---------
 14 files changed, 19 insertions(+), 547 deletions(-)

-- 
2.16.4

