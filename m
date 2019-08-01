Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29EF27D5B2
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 08:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbfHAGqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 02:46:51 -0400
Received: from gofer.mess.org ([88.97.38.141]:57391 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbfHAGqv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Aug 2019 02:46:51 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4AC5C60AAE; Thu,  1 Aug 2019 07:46:49 +0100 (BST)
Date:   Thu, 1 Aug 2019 07:46:49 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.4] dvb/rc fixes
Message-ID: <20190801064649.vmpshqgyokriz2hh@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is another dvb/rc pull request. Note the dvb-pll id module parameter
removal, see discussion on the list. More to come, I'm travelling and
this is all I have time for now.

Thanks
Sean

The following changes since commit 4590c07462fbff4ecbfe1deec44431c16191bd19:

  media: via-camera: convert to the vb2 framework (2019-07-30 12:18:34 -0400)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.4b

for you to fetch changes up to 2bf04320e965144e6cada7cd8a1cb5252c6a61da:

  dt-bindings: media: sunxi-ir: Add H6 compatible (2019-08-01 15:24:01 +0900)

----------------------------------------------------------------
Arnd Bergmann (1):
      media: don't drop front-end reference count for ->detach

Clément Péron (6):
      dt-bindings: media: sunxi-ir: Add A31 compatible
      media: rc: Introduce sunxi_ir_quirks
      media: rc: sunxi: Add A31 compatible
      media: rc: sunxi: Add RXSTA bits definition
      dt-bindings: media: sunxi-ir: Add A64 compatible
      dt-bindings: media: sunxi-ir: Add H6 compatible

Oliver Neukum (1):
      media: iguanair: add sanity checks

Sean Young (2):
      media: lirc: document BPF IR decoding
      media: rc: describe rc protocols and their scancodes

Vandana BN (1):
      media: dvb-frontends: Remove id module parameter

Wolfram Sang (2):
      media: ir-kbd-i2c: convert to i2c_new_dummy_device()
      media: ir-kbd-i2c: remove outdated comments

 .../devicetree/bindings/media/sunxi-ir.txt         |  11 +-
 Documentation/media/uapi/rc/lirc-dev-intro.rst     |  57 ++-
 Documentation/media/uapi/rc/lirc-read.rst          |   3 +-
 Documentation/media/uapi/rc/lirc-write.rst         |   3 +-
 Documentation/media/uapi/rc/rc-protos.rst          | 456 +++++++++++++++++++++
 Documentation/media/uapi/rc/remote_controllers.rst |   1 +
 drivers/media/dvb-core/dvb_frontend.c              |   4 +-
 drivers/media/dvb-frontends/dvb-pll.c              |  19 +-
 drivers/media/i2c/ir-kbd-i2c.c                     |  17 +-
 drivers/media/rc/iguanair.c                        |  15 +-
 drivers/media/rc/sunxi-cir.c                       |  88 +++-
 drivers/media/usb/dvb-usb/pctv452e.c               |   8 -
 12 files changed, 600 insertions(+), 82 deletions(-)
 create mode 100644 Documentation/media/uapi/rc/rc-protos.rst
