Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BBF49C567
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 09:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbiAZIiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 03:38:08 -0500
Received: from gofer.mess.org ([88.97.38.141]:33661 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230519AbiAZIiH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 03:38:07 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DA04310008F; Wed, 26 Jan 2022 08:38:06 +0000 (UTC)
Date:   Wed, 26 Jan 2022 08:38:06 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.18] rc-core fixes
Message-ID: <YfEIbr83UfM+tBFX@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This series makes any IR receiver overflow visible to user space. It's been
tested in various ways to make sure it doesn't break anything.

The commit which fixes up the lirc.h uapi does not touch the copy of the file
in the tools directory, as it is being removed via the bpf tree, see 
https://www.spinics.net/lists/linux-media/msg206145.html

Thanks
Sean

The following changes since commit 7dc5fc6d3bd6779c4859d888221f47e986cb45b5:

  media: mtk-cir: simplify code (2022-01-24 01:38:32 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.18b

for you to fetch changes up to e2844c57587fa42d57872349fc71442bdca016b2:

  media: lirc: report ir receiver overflow (2022-01-26 08:34:18 +0000)

----------------------------------------------------------------
v5.18b

----------------------------------------------------------------
Sean Young (3):
      media: lirc: remove unused lirc features
      media: rc-core: rename ir_raw_event_reset to ir_raw_event_overflow
      media: lirc: report ir receiver overflow

 .../userspace-api/media/lirc.h.rst.exceptions          |  3 +++
 .../userspace-api/media/rc/lirc-dev-intro.rst          | 11 +++++++++--
 .../userspace-api/media/rc/lirc-get-features.rst       | 18 ------------------
 drivers/media/pci/cx23885/cx23885-input.c              |  2 +-
 drivers/media/rc/fintek-cir.c                          |  2 +-
 drivers/media/rc/igorplugusb.c                         |  2 +-
 drivers/media/rc/iguanair.c                            |  2 +-
 drivers/media/rc/ir-hix5hd2.c                          |  2 +-
 drivers/media/rc/ir-imon-decoder.c                     |  2 +-
 drivers/media/rc/ir-jvc-decoder.c                      |  2 +-
 drivers/media/rc/ir-mce_kbd-decoder.c                  |  2 +-
 drivers/media/rc/ir-nec-decoder.c                      |  2 +-
 drivers/media/rc/ir-rc5-decoder.c                      |  2 +-
 drivers/media/rc/ir-rc6-decoder.c                      |  2 +-
 drivers/media/rc/ir-rcmm-decoder.c                     |  2 +-
 drivers/media/rc/ir-sanyo-decoder.c                    |  4 ++--
 drivers/media/rc/ir-sharp-decoder.c                    |  2 +-
 drivers/media/rc/ir-sony-decoder.c                     |  2 +-
 drivers/media/rc/ir-xmp-decoder.c                      |  2 +-
 drivers/media/rc/ite-cir.c                             |  2 +-
 drivers/media/rc/lirc_dev.c                            | 17 ++++++++---------
 drivers/media/rc/nuvoton-cir.c                         |  2 +-
 drivers/media/rc/rc-core-priv.h                        |  2 +-
 drivers/media/rc/rc-ir-raw.c                           |  2 --
 drivers/media/rc/rc-loopback.c                         |  6 +++++-
 drivers/media/rc/st_rc.c                               |  2 +-
 drivers/media/rc/sunxi-cir.c                           |  2 +-
 drivers/media/rc/winbond-cir.c                         |  2 +-
 include/media/rc-core.h                                |  6 +++---
 include/uapi/linux/lirc.h                              | 15 +++++++--------
 30 files changed, 58 insertions(+), 66 deletions(-)
