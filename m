Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 647D196BE4
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 00:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730778AbfHTWGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 18:06:07 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:58440 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730092AbfHTWGH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 18:06:07 -0400
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1i0CGQ-00075L-K2; Wed, 21 Aug 2019 00:06:02 +0200
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Matthias Schwarzott <zzam@gentoo.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: saa7134: keep demod i2c gate closed on Medion 7134
Date:   Wed, 21 Aug 2019 00:05:54 +0200
Message-Id: <20190820220555.883092-1-mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Medion 7134 has two i2c eeproms on the same i2c bus sharing the same bus
addresses: the first one for SAA7134 chip config and the second one behind
TDA10046 DVB-T demod chip i2c gate storing its firmware.
The TV tuner on this board is not behind this i2c gate.

Due to the bus conflict described above, the card PCI SVID / SSID sometimes
gets garbled after a reboot, which makes it necessary to specify the card
model manually as an insmod option in order for it to be detected reliably.
To avoid this, let's just leave the gate permanently closed so the eeprom
chips won't clash.

The demod firmware load is done with its i2c gate closed anyway so it is
not affected by this change.

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
This replaces the "media: saa7134: keep demod i2c gate open on Medion 7134"
submission as it used an inverted open / closed terminology by mistake.

 drivers/media/pci/saa7134/saa7134-dvb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/pci/saa7134/saa7134-dvb.c b/drivers/media/pci/saa7134/saa7134-dvb.c
index eb8377a95023..f359cd5c006a 100644
--- a/drivers/media/pci/saa7134/saa7134-dvb.c
+++ b/drivers/media/pci/saa7134/saa7134-dvb.c
@@ -1264,6 +1264,20 @@ static int dvb_init(struct saa7134_dev *dev)
 					       &medion_cardbus,
 					       &dev->i2c_adap);
 		if (fe0->dvb.frontend) {
+			/*
+			 * The TV tuner on this board is actually NOT
+			 * behind the demod i2c gate.
+			 * However, the demod EEPROM is indeed there and it
+			 * conflicts with the SAA7134 chip config EEPROM
+			 * if the i2c gate is open (since they have same
+			 * bus addresses) resulting in card PCI SVID / SSID
+			 * being garbage after a reboot from time to time.
+			 *
+			 * Let's just leave the gate permanently closed -
+			 * saa7134_i2c_eeprom_md7134_gate() will close it for
+			 * us at probe time if it was open for some reason.
+			 */
+			fe0->dvb.frontend->ops.i2c_gate_ctrl = NULL;
 			dvb_attach(simple_tuner_attach, fe0->dvb.frontend,
 				   &dev->i2c_adap, medion_cardbus.tuner_address,
 				   TUNER_PHILIPS_FMD1216ME_MK3);
