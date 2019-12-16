Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD7D120E74
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 16:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbfLPPvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 10:51:50 -0500
Received: from sauhun.de ([88.99.104.3]:41906 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728328AbfLPPvu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 10:51:50 -0500
Received: from localhost (p54B33297.dip0.t-ipconnect.de [84.179.50.151])
        by pokefinder.org (Postfix) with ESMTPSA id C22C32C04DF;
        Mon, 16 Dec 2019 16:51:47 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 00/16] media: use new API for creating client devices
Date:   Mon, 16 Dec 2019 16:51:27 +0100
Message-Id: <20191216155146.8803-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These media drivers create a new I2C client device with the deprecated
i2c_new_device() and check afterwards if the client exists and if a
driver is bound to it.

This series changes the drivers to use the now suggested
i2c_new_client_device() call and a new helper to check if the driver is
bound. This helper supports (for now) the old and the new API and is
also more readable.

The drivers were converted with the following coccinelle script:

@@
expression client;
statement S;
@@
        client =
-               i2c_new_device
+               i2c_new_client_device
                        (...);
        ... when != client
        if (
-               \( !client \| client == NULL \) || \( !client->dev.driver \| client->dev.driver == NULL \)
+               !i2c_client_has_driver(client)
                        ) {
                        S
                }

The helper has been tested on a Renesas Salvator-XS board (R-Car M3-N).
The rest was build tested by me and buildbot.

This series is based on v5.5-rc2 where the new helper was added. A
branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_device_with_driver

This series is largely the same as the last one sent out in November. It
was rebased to v5.5-rc2 and one Rev-tag added. The patch for v4l2-core
has been extended to use more new API. This series can be applied as is.
I think it should go via the media-tree.

Looking forward to comments.

Thanks and happy hacking,

   Wolfram


Wolfram Sang (16):
  media: dvb-core: dvbdev: convert to use i2c_new_client_device()
  media: dvb-frontends: cxd2820r_core: convert to use
    i2c_new_client_device()
  media: dvb-frontends: lgdt330x: convert to use i2c_new_client_device()
  media: dvb-frontends: m88ds3103: convert to use
    i2c_new_client_device()
  media: dvb-frontends: ts2020: convert to use i2c_new_client_device()
  media: pci: cx23885: cx23885-dvb: convert to use
    i2c_new_client_device()
  media: pci: saa7164: saa7164-dvb: convert to use
    i2c_new_client_device()
  media: pci: smipcie: smipcie-main: convert to use
    i2c_new_client_device()
  media: platform: sti: c8sectpfe: c8sectpfe-dvb: convert to use
    i2c_new_client_device()
  media: usb: dvb-usb-v2: af9035: convert to use i2c_new_client_device()
  media: usb: dvb-usb-v2: anysee: convert to use i2c_new_client_device()
  media: usb: dvb-usb-v2: rtl28xxu: convert to use
    i2c_new_client_device()
  media: usb: dvb-usb-v2: zd1301: convert to use i2c_new_client_device()
  media: usb: dvb-usb: dib0700_devices: convert to use
    i2c_new_client_device()
  media: usb: dvb-usb: dw2102: convert to use i2c_new_client_device()
  media: v4l2-core: v4l2-i2c: convert to new API with ERRPTR

 drivers/media/dvb-core/dvbdev.c               |   4 +-
 drivers/media/dvb-frontends/cxd2820r_core.c   |   4 +-
 drivers/media/dvb-frontends/lgdt330x.c        |   4 +-
 drivers/media/dvb-frontends/m88ds3103.c       |   4 +-
 drivers/media/dvb-frontends/ts2020.c          |   4 +-
 drivers/media/pci/cx23885/cx23885-dvb.c       | 114 +++++++++---------
 drivers/media/pci/saa7164/saa7164-dvb.c       |  20 +--
 drivers/media/pci/smipcie/smipcie-main.c      |   4 +-
 .../platform/sti/c8sectpfe/c8sectpfe-dvb.c    |   4 +-
 drivers/media/usb/dvb-usb-v2/af9035.c         |   4 +-
 drivers/media/usb/dvb-usb-v2/anysee.c         |   4 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c       |  36 +++---
 drivers/media/usb/dvb-usb-v2/zd1301.c         |   4 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c   |   8 +-
 drivers/media/usb/dvb-usb/dw2102.c            |   8 +-
 drivers/media/v4l2-core/v4l2-i2c.c            |  10 +-
 16 files changed, 115 insertions(+), 121 deletions(-)

-- 
2.20.1

