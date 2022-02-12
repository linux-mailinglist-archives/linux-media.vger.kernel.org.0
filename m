Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A02B4B3675
	for <lists+linux-media@lfdr.de>; Sat, 12 Feb 2022 17:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237364AbiBLQc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Feb 2022 11:32:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235480AbiBLQc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Feb 2022 11:32:26 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61A71A8
        for <linux-media@vger.kernel.org>; Sat, 12 Feb 2022 08:32:22 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B2E27101BFE; Sat, 12 Feb 2022 16:32:19 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
Subject: [PATCH 0/2] Fix rtl28xxu nec/rc5 receiver
Date:   Sat, 12 Feb 2022 16:32:17 +0000
Message-Id: <cover.1644683294.git.sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since forever rc-core has used the timeout for two separate purposes:
the raw IR timeout and the key up delay. This problem has now shown
itself in issues with the rtl28xxu driver, so these two patches split
the timeout and then fix the rtl28xxu driver, which is now very
responsive.

Sean Young (2):
  media: rc-core: split IR timeout into rawir timeout and keyup delay
  media: rtl28xxu: improve IR receiver

 drivers/hid/hid-picolcd_cir.c               |  3 ++-
 drivers/media/cec/core/cec-core.c           |  2 +-
 drivers/media/cec/platform/seco/seco-cec.c  |  2 +-
 drivers/media/pci/cx88/cx88-input.c         |  3 ++-
 drivers/media/pci/saa7134/saa7134-input.c   |  3 ++-
 drivers/media/pci/smipcie/smipcie-ir.c      |  3 ++-
 drivers/media/rc/ene_ir.c                   | 11 ++++----
 drivers/media/rc/fintek-cir.c               |  3 ++-
 drivers/media/rc/gpio-ir-recv.c             |  3 ++-
 drivers/media/rc/igorplugusb.c              |  5 ++--
 drivers/media/rc/iguanair.c                 |  2 +-
 drivers/media/rc/ir-hix5hd2.c               |  3 ++-
 drivers/media/rc/ir-mce_kbd-decoder.c       |  2 +-
 drivers/media/rc/ir_toy.c                   |  3 ++-
 drivers/media/rc/ite-cir.c                  |  3 ++-
 drivers/media/rc/lirc_dev.c                 |  6 ++---
 drivers/media/rc/mceusb.c                   |  9 ++++---
 drivers/media/rc/meson-ir.c                 |  3 ++-
 drivers/media/rc/mtk-cir.c                  |  3 ++-
 drivers/media/rc/nuvoton-cir.c              |  3 ++-
 drivers/media/rc/rc-ir-raw.c                | 10 ++++----
 drivers/media/rc/rc-loopback.c              |  5 ++--
 drivers/media/rc/rc-main.c                  |  8 +++---
 drivers/media/rc/redrat3.c                  |  5 ++--
 drivers/media/rc/serial_ir.c                |  7 +++---
 drivers/media/rc/st_rc.c                    |  8 ++++--
 drivers/media/rc/streamzap.c                |  5 ++--
 drivers/media/rc/sunxi-cir.c                |  7 +++---
 drivers/media/rc/ttusbir.c                  |  3 ++-
 drivers/media/rc/winbond-cir.c              |  3 ++-
 drivers/media/rc/xbox_remote.c              |  2 +-
 drivers/media/usb/dvb-usb-v2/dvb_usb.h      |  3 ++-
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c |  3 ++-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c     | 28 +++++++++++++++++++--
 include/media/rc-core.h                     | 11 +++++---
 35 files changed, 120 insertions(+), 63 deletions(-)

-- 
2.34.1

