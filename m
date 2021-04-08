Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BC1358005
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhDHJ4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbhDHJ4b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 05:56:31 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23661C061760
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 02:56:21 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8508DC63A5; Thu,  8 Apr 2021 10:56:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1617875777; bh=WyqYnlsoi0peSp3FaXWYk97X6GrfGsxW385Ju+V/fCQ=;
        h=Date:From:To:Subject:From;
        b=CPu9do+l6HUL1fxmeLJg5TlBVkxJJ7VTEy9Wevdtww8Fk/SAU8ZtnA9T0DyMhj59O
         Pf8AxOxEJAQC1DYUYcdEVvmFa1BYnBL8TN4pGFKuMNYivsn7nCEp9jEjY4kYB7XhBF
         tDZOwQJ/nyq5vClLmlWu2scEyP6QjI898BNnc4EDEgyfWLi0TW3c317xGgFkhI9FWb
         wXo5EL9QVbHSPtK7E3hXy4SKQL0pKeJHtsZP2ofr83CJRXCm3daS8a2tpAlmmziSvF
         BU8kCSp+19aTYCvRveyx13Er6uB3BvPJJrVKyEEgg6esFx0ZrhI09/Q7lMqttanEVe
         WqyEI/n3pJ39g==
Date:   Thu, 8 Apr 2021 10:56:17 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 FOR v5.13] DVB & RC fixes
Message-ID: <20210408095617.GA22332@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time with some checkpatch oversights fixed. The
"avoid -Wempty-body warning" commits still produce some checkpatch warnings,
but they do get rid of warnings during W=1 builds.

Thanks
Sean

The following changes since commit c1c1d437b1f0a84de6b53416026f7ea1ef3df996:

  MAINTAINERS: update ovti,ov2680.yaml reference (2021-04-07 10:01:07 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.13b

for you to fetch changes up to 9e0bdaa53918137111dc29e97d2e1f151337e89d:

  media: mxl692: remove impossible condition (2021-04-08 10:45:22 +0100)

----------------------------------------------------------------
v5.13b

----------------------------------------------------------------
Andre Przywara (1):
      dt-bindings: media: IR: Add H616 IR compatible string

Arnd Bergmann (4):
      media: dvb-usb-remote: fix dvb_usb_nec_rc_key_to_event type mismatch
      media: rc: remove zte zx ir driver
      media: flexcop: avoid -Wempty-body warning
      media: dvb-usb: avoid -Wempty-body warnings

Christian Hewitt (1):
      media: rc: add keymaps for mecool-kii-pro/kiii-pro remotes

Colin Ian King (1):
      media: dvb-frontends: Remove redundant error check on variable ret

Hao Fang (1):
      media: rc: ir-hix5hd2: use the correct HiSilicon copyright

Jiapeng Chong (1):
      media: mxl692: remove impossible condition

Pavel Skripkin (1):
      media: dvb-usb: fix memory leak in dvb_usb_adapter_init

Sean Young (1):
      media: ite-cir: probe of ITE8708 on ASUS PN50 fails

 .../bindings/media/allwinner,sun4i-a10-ir.yaml     |  16 +-
 Documentation/devicetree/bindings/media/rc.yaml    |   2 +
 .../devicetree/bindings/media/zx-irdec.txt         |  14 --
 drivers/media/common/b2c2/flexcop.h                |   6 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |   3 -
 drivers/media/dvb-frontends/mxl692.c               |   2 +-
 drivers/media/pci/b2c2/flexcop-pci.c               |   6 +-
 drivers/media/rc/Kconfig                           |  11 --
 drivers/media/rc/Makefile                          |   1 -
 drivers/media/rc/ir-hix5hd2.c                      |   2 +-
 drivers/media/rc/ite-cir.c                         |   2 +-
 drivers/media/rc/keymaps/Makefile                  |   2 +
 drivers/media/rc/keymaps/rc-mecool-kii-pro.c       |  91 +++++++++++
 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c      |  88 ++++++++++
 drivers/media/rc/zx-irdec.c                        | 181 ---------------------
 drivers/media/usb/b2c2/flexcop-usb.c               |   8 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c           |  20 ++-
 drivers/media/usb/dvb-usb/dvb-usb.h                |  16 +-
 include/media/rc-map.h                             |   2 +
 19 files changed, 229 insertions(+), 244 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/zx-irdec.txt
 create mode 100644 drivers/media/rc/keymaps/rc-mecool-kii-pro.c
 create mode 100644 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c
 delete mode 100644 drivers/media/rc/zx-irdec.c
