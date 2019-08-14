Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFBE8CCD3
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 09:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfHNHbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 03:31:37 -0400
Received: from gofer.mess.org ([88.97.38.141]:53241 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726880AbfHNHbg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 03:31:36 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D2261603F6; Wed, 14 Aug 2019 08:31:35 +0100 (BST)
Date:   Wed, 14 Aug 2019 08:31:35 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.4] RC & DVB
Message-ID: <20190814073135.avafdlmfjml3cqqs@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Another batch of patches. 

Thanks,

Sean

The following changes since commit 0dc99e042a4cfbc1e27572d523d2a1dbaf402cbf:

  media: MAINTAINERS: Remove zoran driver (2019-08-13 11:55:34 -0300)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.4c

for you to fetch changes up to 782079130b459fccaa1eddf7630d9694a0de2b69:

  media: rc: imon: Allow iMON RC protocol for ffdc 7e device (2019-08-14 08:18:19 +0100)

----------------------------------------------------------------
Colin Ian King (1):
      media: stv0900_core: remove redundant assignment to variables mclk, div and ad_div

Darius Rad (1):
      media: rc: imon: Allow iMON RC protocol for ffdc 7e device

Fuqian Huang (3):
      media/usb: Use kmemdup rather than duplicating its implementation
      media/tuners: Use kmemdup rather than duplicating its implementation
      media/dvb: Use kmemdup rather than duplicating its implementation

Luke Nowakowski-Krijger (1):
      media: dvb_frontend.h: Fix shifting signed 32-bit value problem

Masahiro Yamada (1):
      media: rc: add include guard to rc-map.h

Sean Young (6):
      media: imon_raw: simplify and explain bit operations
      media: imon_raw: prevent "nonsensical timing event of duration 0"
      selftests: ir: fix ir_loopback test failure
      media: em28xx: modules workqueue not inited for 2nd device
      media: rc: imon-rsc keymap has incorrect mappings
      media: tm6000: double free if usb disconnect while streaming

Wolfram Sang (1):
      media: ir-kbd-i2c: convert to i2c_new_dummy_device()

 drivers/media/dvb-core/dvbdev.c             |  3 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c |  5 ++--
 drivers/media/dvb-frontends/stv0900_core.c  |  2 +-
 drivers/media/i2c/ir-kbd-i2c.c              | 11 ++++----
 drivers/media/rc/imon.c                     |  7 ++++-
 drivers/media/rc/imon_raw.c                 | 43 +++++++++++++++++++++++------
 drivers/media/rc/keymaps/rc-imon-rsc.c      |  7 +++--
 drivers/media/tuners/tuner-xc2028.c         |  3 +-
 drivers/media/tuners/xc4000.c               |  3 +-
 drivers/media/usb/em28xx/em28xx-cards.c     |  4 +--
 drivers/media/usb/tm6000/tm6000-dvb.c       |  3 ++
 drivers/media/usb/zr364xx/zr364xx.c         |  4 +--
 include/media/dvb_frontend.h                | 21 +++++++-------
 include/media/rc-map.h                      |  5 ++++
 tools/testing/selftests/ir/ir_loopback.c    |  6 ++--
 15 files changed, 80 insertions(+), 47 deletions(-)
