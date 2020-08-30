Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2149B256D6C
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 13:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgH3LWo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 07:22:44 -0400
Received: from gofer.mess.org ([88.97.38.141]:54361 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgH3LWn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 07:22:43 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 21416C63F6; Sun, 30 Aug 2020 12:22:42 +0100 (BST)
Date:   Sun, 30 Aug 2020 12:22:41 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.10] DVB & RC fixes
Message-ID: <20200830112241.GA21060@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

I've tested most of my IR hardware to make sure this patch set does not
regress.

Thanks,
Sean

The following changes since commit 07d999f0d9463ea0d1f76e0f8921ea363d805767:

  media: open.rst: document mc-centric and video-node-centric (2020-08-29 10:41:03 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.10b

for you to fetch changes up to f294df6a0c5bc3866f9b2cd2e756e665908c669a:

  media: rc: rename ir_lirc_* functions to lirc_* (2020-08-30 09:41:39 +0100)

----------------------------------------------------------------
v5.10b

----------------------------------------------------------------
Alex Bee (1):
      media: dvb_usb_pctv452e: use ISL6423 voltage regulator per default

Jason Yan (1):
      media: mxl5xx: remove unused including <linux/version.h>

Sean Young (3):
      media: rc: rename lirc char dev region to "lirc"
      media: rc: harmonize infrared durations to microseconds
      media: rc: rename ir_lirc_* functions to lirc_*

Tom Rix (1):
      media: dvb-frontends/cxd2099: report errors

 drivers/hid/hid-picolcd_cir.c              | 10 ++--
 drivers/media/cec/core/cec-core.c          |  2 +-
 drivers/media/cec/platform/seco/seco-cec.c |  2 +-
 drivers/media/common/siano/smsir.c         |  4 +-
 drivers/media/dvb-frontends/cxd2099.c      | 14 +++--
 drivers/media/dvb-frontends/mxl5xx.c       |  1 -
 drivers/media/i2c/cx25840/cx25840-ir.c     |  2 +-
 drivers/media/pci/cx23885/cx23888-ir.c     |  2 +-
 drivers/media/pci/cx88/cx88-input.c        |  4 +-
 drivers/media/pci/smipcie/smipcie-ir.c     |  7 +--
 drivers/media/rc/ene_ir.c                  | 18 +++---
 drivers/media/rc/fintek-cir.c              |  8 +--
 drivers/media/rc/igorplugusb.c             |  6 +-
 drivers/media/rc/iguanair.c                |  4 +-
 drivers/media/rc/imon_raw.c                |  2 +-
 drivers/media/rc/ir-hix5hd2.c              |  8 +--
 drivers/media/rc/ir-imon-decoder.c         | 10 ++--
 drivers/media/rc/ir-jvc-decoder.c          |  6 +-
 drivers/media/rc/ir-mce_kbd-decoder.c      |  8 +--
 drivers/media/rc/ir-nec-decoder.c          |  6 +-
 drivers/media/rc/ir-rc5-decoder.c          |  6 +-
 drivers/media/rc/ir-rc6-decoder.c          |  6 +-
 drivers/media/rc/ir-rcmm-decoder.c         | 18 +++---
 drivers/media/rc/ir-sanyo-decoder.c        |  6 +-
 drivers/media/rc/ir-sharp-decoder.c        |  6 +-
 drivers/media/rc/ir-sony-decoder.c         |  6 +-
 drivers/media/rc/ir-xmp-decoder.c          | 15 ++---
 drivers/media/rc/ir_toy.c                  | 14 ++---
 drivers/media/rc/ite-cir.c                 | 10 ++--
 drivers/media/rc/ite-cir.h                 |  4 +-
 drivers/media/rc/lirc_dev.c                | 95 ++++++++++++++----------------
 drivers/media/rc/mceusb.c                  | 12 ++--
 drivers/media/rc/meson-ir.c                |  4 +-
 drivers/media/rc/mtk-cir.c                 |  4 +-
 drivers/media/rc/nuvoton-cir.c             | 10 ++--
 drivers/media/rc/nuvoton-cir.h             |  2 +-
 drivers/media/rc/rc-core-priv.h            | 21 ++++---
 drivers/media/rc/rc-ir-raw.c               | 14 ++---
 drivers/media/rc/rc-loopback.c             |  8 +--
 drivers/media/rc/rc-main.c                 | 10 ++--
 drivers/media/rc/redrat3.c                 | 17 +++---
 drivers/media/rc/serial_ir.c               | 10 ++--
 drivers/media/rc/sir_ir.c                  |  2 +-
 drivers/media/rc/st_rc.c                   |  6 +-
 drivers/media/rc/streamzap.c               | 10 +---
 drivers/media/rc/sunxi-cir.c               |  4 +-
 drivers/media/rc/ttusbir.c                 | 18 +++---
 drivers/media/rc/winbond-cir.c             | 10 ++--
 drivers/media/rc/xbox_remote.c             |  2 +-
 drivers/media/usb/au0828/au0828-input.c    |  8 +--
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c    |  4 +-
 drivers/media/usb/dvb-usb/Kconfig          |  1 +
 drivers/media/usb/dvb-usb/pctv452e.c       | 26 ++++++--
 drivers/media/usb/dvb-usb/technisat-usb2.c |  4 +-
 include/media/rc-core.h                    | 11 ++--
 55 files changed, 264 insertions(+), 264 deletions(-)
