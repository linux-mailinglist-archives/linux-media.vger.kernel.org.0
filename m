Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7451356CF
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 11:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgAIK0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 05:26:49 -0500
Received: from gofer.mess.org ([88.97.38.141]:34749 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728614AbgAIK0t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jan 2020 05:26:49 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5217CC638D; Thu,  9 Jan 2020 10:26:48 +0000 (GMT)
Date:   Thu, 9 Jan 2020 10:26:48 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.6] RC & DVB (c)
Message-ID: <20200109102647.GA27599@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here a bunch of trival patches to move to i2c_new_client_device() and a
patch to fix iguanair probing.

Thanks
Sean


The following changes since commit e6111647934562849ba052052ffbc673b935a9fe:

  media: cec: remove unused functions (2020-01-08 14:38:06 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.6c

for you to fetch changes up to f8081e8c07970961b149abbe559fb0eb3b4faec6:

  media: iguanair: fix endpoint sanity check (2020-01-08 19:52:58 +0000)

----------------------------------------------------------------
v5.6c

----------------------------------------------------------------
Johan Hovold (1):
      media: iguanair: fix endpoint sanity check

Wolfram Sang (15):
      media: dvb-core: dvbdev: convert to use i2c_new_client_device()
      media: dvb-frontends: cxd2820r_core: convert to use i2c_new_client_device()
      media: dvb-frontends: lgdt330x: convert to use i2c_new_client_device()
      media: dvb-frontends: m88ds3103: convert to use i2c_new_client_device()
      media: dvb-frontends: ts2020: convert to use i2c_new_client_device()
      media: pci: cx23885: cx23885-dvb: convert to use i2c_new_client_device()
      media: pci: saa7164: saa7164-dvb: convert to use i2c_new_client_device()
      media: pci: smipcie: smipcie-main: convert to use i2c_new_client_device()
      media: platform: sti: c8sectpfe: c8sectpfe-dvb: convert to use i2c_new_client_device()
      media: usb: dvb-usb-v2: af9035: convert to use i2c_new_client_device()
      media: usb: dvb-usb-v2: anysee: convert to use i2c_new_client_device()
      media: usb: dvb-usb-v2: rtl28xxu: convert to use i2c_new_client_device()
      media: usb: dvb-usb-v2: zd1301: convert to use i2c_new_client_device()
      media: usb: dvb-usb: dib0700_devices: convert to use i2c_new_client_device()
      media: usb: dvb-usb: dw2102: convert to use i2c_new_client_device()

 drivers/media/dvb-core/dvbdev.c                    |   4 +-
 drivers/media/dvb-frontends/cxd2820r_core.c        |   4 +-
 drivers/media/dvb-frontends/lgdt330x.c             |   4 +-
 drivers/media/dvb-frontends/m88ds3103.c            |   4 +-
 drivers/media/dvb-frontends/ts2020.c               |   4 +-
 drivers/media/pci/cx23885/cx23885-dvb.c            | 114 ++++++++++-----------
 drivers/media/pci/saa7164/saa7164-dvb.c            |  24 ++---
 drivers/media/pci/smipcie/smipcie-main.c           |   4 +-
 .../media/platform/sti/c8sectpfe/c8sectpfe-dvb.c   |   5 +-
 drivers/media/rc/iguanair.c                        |   2 +-
 drivers/media/usb/dvb-usb-v2/af9035.c              |   4 +-
 drivers/media/usb/dvb-usb-v2/anysee.c              |   4 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |  40 ++++----
 drivers/media/usb/dvb-usb-v2/zd1301.c              |   4 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c        |   8 +-
 drivers/media/usb/dvb-usb/dw2102.c                 |   8 +-
 16 files changed, 115 insertions(+), 122 deletions(-)
