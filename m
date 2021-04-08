Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5234B357EE1
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhDHJOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:14:34 -0400
Received: from gofer.mess.org ([88.97.38.141]:43911 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhDHJOd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 05:14:33 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CEE55C63A5; Thu,  8 Apr 2021 10:14:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1617873261; bh=h4OjBtUyYNtPvrdXtUmcPJfwZoZTodJM/ta4ICg8r3E=;
        h=Date:From:To:Subject:From;
        b=UMrQXY+wixp4RICO02UpkC6eGUzq1Aeb337aflh9FlVITZIeeTNHh1MbrHy0iRMcp
         BtlbhsMQDEQDDY8nJ/i8JhyTg8zGuXp7gUfp9YQsyx+PEUXi1V0nnZpmjik8wre2zc
         gCT+M9TNaoaVacXp/ib4WhoTiQkOs+3gba/zU7oDg1QUDUhCsXNW7MVTBY4Is4BX40
         EK186uGU6pVQqg3iLcn//oEuAKaAcqYdxwPZWDP3qVX3SyaS4ap35SEL93qArW+Kmy
         zGuR2bp2I6sy/KIDWvFjLfc5jbxeQdKcCK10rdnviRplkGjf3vEQMuvJYPnisGXoep
         9rfJLYw7XWzLw==
Date:   Thu, 8 Apr 2021 10:14:21 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.13] DVB & RC fixes
Message-ID: <20210408091421.GA22127@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit c1c1d437b1f0a84de6b53416026f7ea1ef3df996:

  MAINTAINERS: update ovti,ov2680.yaml reference (2021-04-07 10:01:07 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.13b

for you to fetch changes up to 7633bc825e7ba3fb02127a1f446655cdbcf70fa4:

  media: mxl692: remove impossible condition (2021-04-08 09:51:09 +0100)

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
 drivers/media/common/b2c2/flexcop.h                |   2 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |   3 -
 drivers/media/dvb-frontends/mxl692.c               |   2 +-
 drivers/media/pci/b2c2/flexcop-pci.c               |   2 +-
 drivers/media/rc/Kconfig                           |  11 --
 drivers/media/rc/Makefile                          |   1 -
 drivers/media/rc/ir-hix5hd2.c                      |   2 +-
 drivers/media/rc/ite-cir.c                         |   2 +-
 drivers/media/rc/keymaps/Makefile                  |   2 +
 drivers/media/rc/keymaps/rc-mecool-kii-pro.c       |  91 +++++++++++
 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c      |  88 ++++++++++
 drivers/media/rc/zx-irdec.c                        | 181 ---------------------
 drivers/media/usb/b2c2/flexcop-usb.c               |   4 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c           |  20 ++-
 drivers/media/usb/dvb-usb/dvb-usb.h                |   7 +-
 include/media/rc-map.h                             |   2 +
 19 files changed, 218 insertions(+), 234 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/zx-irdec.txt
 create mode 100644 drivers/media/rc/keymaps/rc-mecool-kii-pro.c
 create mode 100644 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c
 delete mode 100644 drivers/media/rc/zx-irdec.c
