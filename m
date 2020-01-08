Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF3E13422C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 13:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgAHMuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 07:50:13 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:35461 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727119AbgAHMuN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 07:50:13 -0500
Received: from [IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1]
 ([IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pAmliVll0pLtbpAmoiGecW; Wed, 08 Jan 2020 13:50:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578487811; bh=H2+t43okaBIKRvGIOuP5kmsW5BwgjyZnoQGSGxkQ8Ig=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vt+FE/ZJGKKE0J79ujxDBd0pb5/6evfq2arQ6xZOxP0nFfDSXDRe0/+SDdzBmWwu1
         GuKWQ/EzygccQi1GCh3jG0oimwXIsXtKuMu+0onF6XtSTC7oH7vAwcEjrPu+uavzDI
         rdwLnI7jMYM39ypT4EzlYwEXj4umSPU/7GDwUH+OiLBEsZyyVlmh32Z4MslmUtizJ/
         TskJ2nh6R5zhOanj/SOuin9dtGw0ClY/KIBPa8kTxcPR45MSbw6RL8XnE6KoaSreG+
         o+tzFdhReZ+f039i+ekaEIirmuvXMrVbB6Gc5ul8vTusgFKL67xx2RsUi49rzVAiQi
         4RyNJjybL8yiQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] v2: Various fixes
Message-ID: <8dc5aad1-ae76-85f5-de05-8a7d2b340a3e@xs4all.nl>
Date:   Wed, 8 Jan 2020 13:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFFsELe5PleO0EwHpZJvTBlVRQ24Tr1AENmtPu6s02t1vin72zVEikWtlzFjrtTVG2S8UrNmnUcrAXoH/Fm/e4gGWvaXa/9lGDeLUA/gdKl0ozLdmdyf
 kqloC41u5FHbR4iwbrLOyIl13/23WAgzvXOk97qmI+dAKcI2Px11g+AcYXVP5TG82WygN3Nc+cDYUloBUHRxBclz2+mxBBn1HYqD1QXmuaotdx4VQRf6imNg
 UsfRjzSR72rbhwQRkFECsKszadE6AeIX5kkuCb3PEDoIKBW0SaAnrCFt1XGJXuDp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1 (https://patchwork.linuxtv.org/patch/60987/):

Added missing Signed-off-by for my revert patch.

Regards,

	Hans

The following changes since commit 1dc8b65c944e5cfce3d830a5b97b42be185a1984:

  media: v4l2-core: only zero-out ioctl-read buffers (2020-01-08 13:27:58 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6h

for you to fetch changes up to 15ae773937f42867ea965cf6d0358b7bf88d05c2:

  cec: remove unused functions (2020-01-08 13:46:29 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aditya Pakki (2):
      media: cx231xx: replace BUG_ON with recovery code
      media: saa7146: Avoid using BUG_ON as an assertion

Daniel Gomez (1):
      media: v4l2: Fix fourcc names for 12b and 14b packed bayer

Dmitry Osipenko (3):
      media: staging: tegra-vde: Select IOVA unconditionally in Kconfig
      media: staging: tegra-vde: Sort headers alphabetically
      media: staging: tegra-vde: Use __maybe_unused attribute instead of ifdef

Hans Verkuil (2):
      Revert "media: v4l2: Fix fourcc names for BAYER12P"
      cec: remove unused functions

Helen Koike (1):
      media: v4l2-rect.h: fix v4l2_rect_map_inside() top/left adjustments

Jia-Ju Bai (1):
      media: sti: bdisp: fix a possible sleep-in-atomic-context bug in bdisp_device_run()

Ma Feng (1):
      media: pvrusb2: Remove unneeded semicolon and add newline

Wolfram Sang (5):
      media: pci: cx23885: convert to i2c_new_scanned_device
      media: pci: cx88: convert to i2c_new_scanned_device
      media: pci: bt8xx: convert to i2c_new_scanned_device
      media: pci: cx18: convert to i2c_new_scanned_device
      media: pci: ivtv: convert to i2c_new_scanned_device

 Documentation/media/uapi/v4l/pixfmt-srggb12p.rst |  2 +-
 Documentation/media/uapi/v4l/pixfmt-srggb14p.rst |  2 +-
 drivers/media/cec/cec-core.c                     | 21 +--------------------
 drivers/media/cec/cec-notifier.c                 | 37 ++-----------------------------------
 drivers/media/cec/cec-priv.h                     |  2 +-
 drivers/media/common/saa7146/saa7146_video.c     |  6 ++++--
 drivers/media/pci/bt8xx/bttv-input.c             |  6 +++---
 drivers/media/pci/cx18/cx18-i2c.c                |  2 +-
 drivers/media/pci/cx23885/cx23885-i2c.c          |  4 ++--
 drivers/media/pci/cx88/cx88-input.c              |  2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c                |  6 +++---
 drivers/media/pci/ivtv/ivtv-i2c.h                |  2 +-
 drivers/media/platform/sti/bdisp/bdisp-hw.c      |  6 +++---
 drivers/media/usb/cx231xx/cx231xx-i2c.c          |  3 ++-
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c      |  4 ++--
 drivers/staging/media/tegra-vde/Kconfig          |  2 +-
 drivers/staging/media/tegra-vde/vde.c            |  6 ++----
 drivers/staging/media/tegra-vde/vde.h            |  2 +-
 include/media/cec-notifier.h                     | 27 ---------------------------
 include/media/cec.h                              | 46 ----------------------------------------------
 include/media/v4l2-rect.h                        |  8 ++++----
 21 files changed, 36 insertions(+), 160 deletions(-)
