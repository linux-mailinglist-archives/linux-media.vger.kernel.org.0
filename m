Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650383073B6
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 11:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhA1K2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 05:28:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:33540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231322AbhA1K23 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 05:28:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B72D264DCC;
        Thu, 28 Jan 2021 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611829667;
        bh=wwU8OFYVzVt6se2+5ttQHLkgGL1oe+PguRgfDyMdE8U=;
        h=Date:From:To:Cc:Subject:From;
        b=r6s7h71cZEf8v0T33BJHaYr8sEWAa5f+39oqWVHc+YY/VhQsjDXNcX/LcROuqXYat
         ovuT9Mc598WuBQDHdQSWQ42FhEm4FtWphQmhU6tlghWyVy/1b85ue9oo838pSzNinB
         SZ4nFfS9omPLPMg4b9Uc8QZog6ejSYRYhHUvqOVZiz9jQxS8FZWYmrBHwJOck3vq8w
         /6V2xQr5CN9Nj9ahn6IXatOzdpi8ALTaM79YnaBqBvioo3e4rUSGRORUofRivPCfZC
         G/W6P/F/cFSBiUt+ubwkF8q9ehQt0fitWSdWi3SWWSakDsHGUoqoL3zAAXiXvVWUcR
         Sgx/CA0Z7C3yg==
Date:   Thu, 28 Jan 2021 11:27:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.11-rc6] media fixes
Message-ID: <20210128112738.67242607@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-2

For:
  - a V4L2 core regression at videobuf2 when checking for single-plane
    dmabuf;
  - a change at uAPI header v4l2-subdev.h, fixing a breakage
    as BIT() macro is not available in userspace;
  - fix some regressions at RC core due to the usage of microseconds
    everywhere on it;
  - a fix for a race condition at RC core;
  - a rename on a newly-introduced kAPI symbol (v4l2_get_link_rate),
    currently used only by a single driver.
  - Regression fixes at rcar-vin, cedrus, ite-cir, hantro, css, venus 
    and cec drivers.

Regards,
Mauro

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.11-2

for you to fetch changes up to e081863ab48d9b2eee9e899cbd05752a2a30308d:

  media: hantro: Fix reset_raw_fmt initialization (2021-01-26 19:16:27 +0100)

----------------------------------------------------------------
media fixes for v5.11-rc6

----------------------------------------------------------------
Colin Ian King (1):
      media: rcar-vin: fix return, use ret instead of zero

Hans Verkuil (1):
      media: v4l2-subdev.h: BIT() is not available in userspace

Jernej Skrabec (1):
      media: cedrus: Fix H264 decoding

Matthias Reichl (2):
      media: rc: fix timeout handling after switch to microsecond durations
      media: rc: ite-cir: fix min_timeout calculation

Naushir Patuck (1):
      media: Revert "media: videobuf2: Fix length check for single plane dmabuf queueing"

Ricardo Ribalda (1):
      media: hantro: Fix reset_raw_fmt initialization

Sakari Ailus (3):
      media: ccs-pll: Fix link frequency for C-PHY
      media: ccs: Get static data version minor correctly
      media: v4l: common: Fix naming of v4l2_get_link_rate

Sean Young (1):
      media: rc: ensure that uevent can be read directly after rc device register

Stanimir Varbanov (1):
      media: venus: core: Fix platform driver shutdown

Yannick Fertre (1):
      media: cec: add stm32 driver

 drivers/media/cec/platform/Makefile              | 1 +
 drivers/media/common/videobuf2/videobuf2-v4l2.c  | 3 +--
 drivers/media/i2c/ccs-pll.c                      | 8 +-------
 drivers/media/i2c/ccs/ccs-data.c                 | 2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c         | 2 +-
 drivers/media/platform/qcom/venus/core.c         | 2 ++
 drivers/media/platform/rcar-vin/rcar-core.c      | 2 +-
 drivers/media/rc/ir-mce_kbd-decoder.c            | 2 +-
 drivers/media/rc/ite-cir.c                       | 2 +-
 drivers/media/rc/rc-main.c                       | 8 ++++----
 drivers/media/rc/serial_ir.c                     | 2 +-
 drivers/media/v4l2-core/v4l2-common.c            | 4 ++--
 drivers/staging/media/hantro/hantro_v4l2.c       | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 2 +-
 include/media/v4l2-common.h                      | 4 ++--
 include/uapi/linux/v4l2-subdev.h                 | 2 +-
 16 files changed, 22 insertions(+), 26 deletions(-)

