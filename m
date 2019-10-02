Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4113AC9389
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 23:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfJBVef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 17:34:35 -0400
Received: from gofer.mess.org ([88.97.38.141]:33511 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfJBVef (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 17:34:35 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 696EBC6355; Wed,  2 Oct 2019 22:34:33 +0100 (BST)
Date:   Wed, 2 Oct 2019 22:34:33 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.5] DVB & RC (I)
Message-ID: <20191002213433.GA12192@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here we have a new i2c for gl861, minor cleanups for rc-core & dvb and
banishing procfs from the media tree and few usb ids.

Thanks,
Sean

The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:

  media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.5i

for you to fetch changes up to dee498705dfceae7ed5acef28a1a550fcbd0800b:

  media: flexcop-usb: fix NULL-ptr deref in flexcop_usb_transfer_init() (2019-10-02 22:25:40 +0100)

----------------------------------------------------------------
PR I

----------------------------------------------------------------
A Sun (1):
      media: mceusb: fix out of bounds read in MCE receiver buffer

Akihiro Tsukada (4):
      media: dvb-usb-v2/gl861: remove device-specific i2c algo
      media: dvb-usb-v2/gl861: remove an un-used header file
      media: dvb-frontends/tc90522: extend i2c algo to support some devices
      media: dvb-usb-gl861: support I2C read from tuner via demod

Andrei Koshkosh (1):
      media: dvbsky: use a single mutex and state buffers for all R/W ops

Antti Palosaari (1):
      media: gl861: re-implement I2C adapter logic

Colin Ian King (2):
      media: cxd2820r: make arrays tab static const, makes object smaller
      media: drxj: remove redundant assignment to variable rc

Dominik Danelski (1):
      media: em28xx: Add support for Magix Wideowandler 2

Flavius Georgescu (1):
      media: rc: Add support for another iMON 0xffdc device

Markus Elfring (1):
      media: rc: Use devm_platform_ioremap_resource() in tango_ir_probe()

Navid Emamdoost (1):
      media: rc: prevent memory leak in cx23888_ir_probe

Nishad Kamdar (2):
      media: rc: Use the correct style for SPDX License Identifier
      media: usb: tm6000: Use the correct style for SPDX License Identifier

Sean Young (6):
      media: saa7164: use debugfs rather than procfs for debugging file
      media: delete unused proc_fs.h include
      media: rc: mark input device as pointing stick
      media: rc: increase rc-mm tolerance and add debug message
      media: rtl28xxu: set keymap for Astrometa DVB-T2
      media: rtl28xxu: fix idle handling

Yang Yingliang (1):
      media: flexcop-usb: fix NULL-ptr deref in flexcop_usb_transfer_init()

 drivers/media/dvb-frontends/cxd2820r_c.c    |   2 +-
 drivers/media/dvb-frontends/cxd2820r_t.c    |   2 +-
 drivers/media/dvb-frontends/cxd2820r_t2.c   |   2 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c |   2 +-
 drivers/media/dvb-frontends/tc90522.c       |  27 +-
 drivers/media/dvb-frontends/tc90522.h       |   3 +
 drivers/media/pci/cx23885/cx23888-ir.c      |   5 +-
 drivers/media/pci/dm1105/dm1105.c           |   1 -
 drivers/media/pci/saa7164/saa7164-core.c    | 166 +++++++-----
 drivers/media/pci/smipcie/smipcie.h         |   1 -
 drivers/media/rc/imon.c                     |  61 ++++-
 drivers/media/rc/ir-rcmm-decoder.c          |   6 +-
 drivers/media/rc/mceusb.c                   | 141 +++++++---
 drivers/media/rc/rc-core-priv.h             |   2 +-
 drivers/media/rc/rc-main.c                  |   1 +
 drivers/media/rc/tango-ir.c                 |  14 +-
 drivers/media/usb/b2c2/flexcop-usb.c        |   8 +-
 drivers/media/usb/cx231xx/cx231xx-audio.c   |   1 -
 drivers/media/usb/dvb-usb-v2/dvb_usb.h      |   2 +
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c |   1 +
 drivers/media/usb/dvb-usb-v2/dvbsky.c       |  16 +-
 drivers/media/usb/dvb-usb-v2/gl861.c        | 391 +++++++++++-----------------
 drivers/media/usb/dvb-usb-v2/gl861.h        |  14 -
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c     |   6 +-
 drivers/media/usb/em28xx/em28xx-audio.c     |   1 -
 drivers/media/usb/em28xx/em28xx-cards.c     |  20 ++
 drivers/media/usb/em28xx/em28xx.h           |   1 +
 drivers/media/usb/tm6000/tm6000-regs.h      |   2 +-
 drivers/media/usb/tm6000/tm6000-usb-isoc.h  |   2 +-
 drivers/media/usb/tm6000/tm6000.h           |   2 +-
 drivers/media/usb/zr364xx/zr364xx.c         |   1 -
 31 files changed, 500 insertions(+), 404 deletions(-)
 delete mode 100644 drivers/media/usb/dvb-usb-v2/gl861.h
