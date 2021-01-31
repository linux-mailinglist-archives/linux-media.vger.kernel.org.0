Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39728309D8E
	for <lists+linux-media@lfdr.de>; Sun, 31 Jan 2021 16:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhAaPcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Jan 2021 10:32:00 -0500
Received: from gofer.mess.org ([88.97.38.141]:35789 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232842AbhAaP3J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Jan 2021 10:29:09 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1F56AC6357; Sun, 31 Jan 2021 15:28:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1612106899; bh=Vo7BecIAl/FuLn8GaFjX9pK6EVHEf4CCjsPW9w2dc+w=;
        h=Date:From:To:Subject:From;
        b=fj+iCSqRDyBllAbs1CFSeocaj9mnNo5Mp/g+O09M3el0AzNOAsgRQ/FKhOp8w2+ia
         UbaPGyu3Kyg37uEtJ6DkAYVvpwne57nFP5+GbSIusy+caMig3N1L6ChXHk8qG8BAHI
         Q1O7edNI3RlpnTlBcWNVxkg268/qZM1fRa9Mq663tcN9H/0J8LHtY0ZqSRPOgR+ady
         dcGGhHyZ8yld+N1MdbeIywgGMYnpe9QjepeqDfLiXmqHCZpTaM6b4zmFgZT7ngGK50
         l38b+U923L9g8NKAx32SGD8g+kauC0H7wcK/Cq+1XeqbQwBamG88CtWlT3kzNV/TBi
         hXGAgK1QGie0A==
Date:   Sun, 31 Jan 2021 15:28:18 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.12] MaxLinear 692 and smipcie-ir fix
Message-ID: <20210131152818.GA6521@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit f0ddb4e9911665b9ad68fe94e0faaaff5953902e:

  media: venus: venc: set IDR period to FW only for H264 & HEVC (2021-01-27 16:22:36 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.12c

for you to fetch changes up to 6284bdc5744cd73f8aec543379752075245d0268:

  media: smipcie: fix interrupt handling and IR timeout (2021-01-31 15:14:37 +0000)

----------------------------------------------------------------
v5.12c

----------------------------------------------------------------
Brad Love (4):
      mxl692: MaxLinear 692 ATSC demod/tuner driver
      em28xx-core: Fix TS2 active led
      em28xx-core: Fix i2c error debug
      em28xx: Add support for Hauppauge USB QuadHD

Sean Young (1):
      media: smipcie: fix interrupt handling and IR timeout

 drivers/media/dvb-frontends/Kconfig       |    9 +
 drivers/media/dvb-frontends/Makefile      |    1 +
 drivers/media/dvb-frontends/mxl692.c      | 1378 +++++++++++++++++++++++++++++
 drivers/media/dvb-frontends/mxl692.h      |   38 +
 drivers/media/dvb-frontends/mxl692_defs.h |  548 ++++++++++++
 drivers/media/pci/smipcie/smipcie-ir.c    |   46 +-
 drivers/media/usb/em28xx/Kconfig          |    1 +
 drivers/media/usb/em28xx/em28xx-cards.c   |   46 +
 drivers/media/usb/em28xx/em28xx-core.c    |    4 +-
 drivers/media/usb/em28xx/em28xx-dvb.c     |   26 +
 drivers/media/usb/em28xx/em28xx-i2c.c     |    6 +-
 drivers/media/usb/em28xx/em28xx.h         |    1 +
 12 files changed, 2082 insertions(+), 22 deletions(-)
 create mode 100644 drivers/media/dvb-frontends/mxl692.c
 create mode 100644 drivers/media/dvb-frontends/mxl692.h
 create mode 100644 drivers/media/dvb-frontends/mxl692_defs.h
