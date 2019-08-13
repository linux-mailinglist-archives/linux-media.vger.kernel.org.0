Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8A58B875
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 14:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfHMMV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 08:21:58 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50867 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726453AbfHMMV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 08:21:58 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xVoFhLI2vqTdhxVoKh9duu; Tue, 13 Aug 2019 14:21:56 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Fuqian Huang <huangfq.daxian@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Fixes and i2c conversions
Message-ID: <0ce80e1f-46c1-6184-b0c1-fc99d0908725@xs4all.nl>
Date:   Tue, 13 Aug 2019 14:21:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIAW6dZ5nZfbwByQJJVexxOLIkJO9Wly4Bh32azDLK9vQr/v1/v3WzbXKwb2ZcK+gBulkCF+i3M6OEHAhKkSAH6QTn0OszcavG3lL8Oqnq2uHVTGrZ9f
 4RSfv75E9QAgB8D6MGqWwJN0KBGzPBznu3pBJHLZDwm78RkrheN7wvg612+OatwU53YoIDKbRArIU/lazgDMYh6A+DY8DdS1LFzRDKb9/ozRtXgRmz5+Y+Ii
 1tyejIH4wbO/lGstnyUrQprUHYk/XHZL0aVZTYc88e5FLRRtmx5Xg2Qyh3L+BfYBy3dL48TZiDDNmJyp2uWJ7PzoB/hXkhgErZVn+CPvbDidtSAY/7fnN3U/
 aipwwkaf8d/RootzNyNZMYVn1g4xX7EW3DlhtQWQBXuZCezCjXZNrM8ySco/jUSAaW5yl9Xli6xf0FStBXZAgbSVEw1lGQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ae27c563a6185d47a904c2d71b72580266cb9d86:

  Merge tag 'v5.3-rc4' into patchwork (2019-08-12 13:22:54 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4k

for you to fetch changes up to dbffad6384421cc9dfee27ab6a922ec14ba9ae9a:

  MAINTAINERS: Remove zoran driver (2019-08-13 13:59:04 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Denis Efremov (2):
      MAINTAINERS: hantro: Fix typo in a filepath
      MAINTAINERS: Remove zoran driver

Fuqian Huang (3):
      media: pvrusb2: use kzalloc instead of kmalloc and memset
      media: ngene: Remove call to memset after pci_alloc_consistent
      media: exynos4-is: Remove call to memset after dma_alloc_coherent

Geert Uytterhoeven (1):
      media: fdp1: Reduce FCP not found message level to debug

Jernej Skrabec (2):
      media: cedrus: Remove dst_bufs from context
      media: cedrus: Don't set chroma size for scale & rotation

Kieran Bingham (7):
      media: i2c: adv748x: Convert to new i2c device probe()
      media: radio: si4713: Convert to new i2c device probe()
      media: radio: si470x: Convert to new i2c device probe()
      media: i2c: smiapp: Convert to new i2c device probe()
      media: i2c: s5c73m3: Convert to new i2c device probe()
      media: i2c: et8ek8: Convert to new i2c device probe()
      media: i2c: Convert to new i2c device probe()

Matthias Brugger (1):
      media: mtk-mdp: fix reference count on old device tree

Nishka Dasgupta (2):
      media: platform: mtk-mdp: mtk_mdp_core: Add of_node_put() before goto
      media: i2c: tvp5150: Add of_node_put() before goto

Wolfram Sang (14):
      media: dvb-frontends: cxd2820r_core: convert to i2c_new_dummy_device
      media: dvb-frontends: mn88443x: convert to i2c_new_dummy_device
      media: dvb-frontends: mn88472: convert to i2c_new_dummy_device
      media: dvb-frontends: mn88473: convert to i2c_new_dummy_device
      media: i2c: ad9389b: convert to i2c_new_dummy_device
      media: i2c: adv7180: convert to i2c_new_dummy_device
      media: i2c: adv7511-v4l2: convert to i2c_new_dummy_device
      media: usb: go7007: s2250-board: convert to i2c_new_dummy_device
      media: i2c: tda1997x: prevent potential NULL pointer access
      media: i2c: adv7842: convert to i2c_new_dummy_device
      media: cxd2820r: don't check retval after our own assignemt
      media: mn88472: don't check retval after our own assignemt
      media: mn88473: don't check retval after our own assignemt
      media: zd1301_demod: don't check retval after our own assignemt

 MAINTAINERS                                       | 10 +---------
 drivers/media/dvb-frontends/cxd2820r_core.c       |  9 ++++-----
 drivers/media/dvb-frontends/mn88443x.c            |  6 +++---
 drivers/media/dvb-frontends/mn88472.c             | 18 ++++++++----------
 drivers/media/dvb-frontends/mn88473.c             | 18 ++++++++----------
 drivers/media/dvb-frontends/zd1301_demod.c        |  3 +--
 drivers/media/i2c/ad9389b.c                       |  6 +++---
 drivers/media/i2c/adv7180.c                       | 12 ++++++------
 drivers/media/i2c/adv7343.c                       |  5 ++---
 drivers/media/i2c/adv748x/adv748x-core.c          | 13 ++-----------
 drivers/media/i2c/adv7511-v4l2.c                  | 18 +++++++++---------
 drivers/media/i2c/adv7842.c                       |  9 ++++++---
 drivers/media/i2c/et8ek8/et8ek8_driver.c          |  5 ++---
 drivers/media/i2c/imx274.c                        |  5 ++---
 drivers/media/i2c/max2175.c                       |  5 ++---
 drivers/media/i2c/mt9m001.c                       |  5 ++---
 drivers/media/i2c/mt9m111.c                       |  5 ++---
 drivers/media/i2c/ov2640.c                        |  5 ++---
 drivers/media/i2c/ov2659.c                        |  5 ++---
 drivers/media/i2c/ov5640.c                        |  5 ++---
 drivers/media/i2c/ov5645.c                        |  5 ++---
 drivers/media/i2c/ov5647.c                        |  5 ++---
 drivers/media/i2c/ov772x.c                        |  5 ++---
 drivers/media/i2c/ov7740.c                        |  5 ++---
 drivers/media/i2c/ov9650.c                        |  5 ++---
 drivers/media/i2c/s5c73m3/s5c73m3-core.c          |  5 ++---
 drivers/media/i2c/s5k5baf.c                       |  5 ++---
 drivers/media/i2c/s5k6a3.c                        |  5 ++---
 drivers/media/i2c/smiapp/smiapp-core.c            |  5 ++---
 drivers/media/i2c/tc358743.c                      |  5 ++---
 drivers/media/i2c/tda1997x.c                      |  9 +++++++--
 drivers/media/i2c/ths8200.c                       |  5 ++---
 drivers/media/i2c/tvp5150.c                       |  9 ++++++---
 drivers/media/i2c/tvp7002.c                       |  4 ++--
 drivers/media/pci/ngene/ngene-core.c              |  4 ----
 drivers/media/platform/exynos4-is/fimc-is.c       |  1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c     |  9 +++++++--
 drivers/media/platform/rcar_fdp1.c                |  2 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c     |  5 ++---
 drivers/media/radio/si4713/si4713.c               |  5 ++---
 drivers/media/usb/go7007/s2250-board.c            |  6 +++---
 drivers/media/usb/pvrusb2/pvrusb2-eeprom.c        |  3 +--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c           |  3 +--
 drivers/staging/media/sunxi/cedrus/cedrus.h       |  4 +---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c  |  4 ++--
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c    |  3 ---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 22 ----------------------
 47 files changed, 126 insertions(+), 189 deletions(-)
