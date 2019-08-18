Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8700E91A37
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 01:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfHRXMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Aug 2019 19:12:31 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:41114 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbfHRXMb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Aug 2019 19:12:31 -0400
X-Greylist: delayed 1004 seconds by postgrey-1.27 at vger.kernel.org; Sun, 18 Aug 2019 19:12:29 EDT
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1hzU5Q-0005ur-5c; Mon, 19 Aug 2019 00:55:44 +0200
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7134: keep demod i2c gate open on Medion 7134
Date:   Mon, 19 Aug 2019 00:55:38 +0200
Message-Id: <20190818225538.302738-1-mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.22.1
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
To avoid this, let's just leave the gate permanently open so the eeprom
chips won't clash.

The demod firmware load is done with its i2c gate open anyway so it is not
affected by this change.

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/media/pci/saa7134/saa7134-dvb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/pci/saa7134/saa7134-dvb.c b/drivers/media/pci/saa7134/saa7134-dvb.c
index eb8377a95023..ace019ef6784 100644
--- a/drivers/media/pci/saa7134/saa7134-dvb.c
+++ b/drivers/media/pci/saa7134/saa7134-dvb.c
@@ -1264,6 +1264,20 @@ static int dvb_init(struct saa7134_dev *dev)
 					       &medion_cardbus,
 					       &dev->i2c_adap);
 		if (fe0->dvb.frontend) {
+			/*
+			 * The TV tuner on this board is actually NOT
+			 * behind the demod i2c gate.
+			 * However, the demod eeprom is indeed there and it
+			 * conflicts with the SAA7134 chip config eeprom
+			 * if the i2c gate is closed (since they have same
+			 * bus addresses) resulting in card PCI SVID / SSID
+			 * being garbage after a reboot from time to time.
+			 *
+			 * Let's just leave the gate permanently open -
+			 * saa7134_i2c_eeprom_md7134_gate() will open it for
+			 * us at probe time if it was closed for some reason.
+			 */
+			fe0->dvb.frontend->ops.i2c_gate_ctrl = NULL;
 			dvb_attach(simple_tuner_attach, fe0->dvb.frontend,
 				   &dev->i2c_adap, medion_cardbus.tuner_address,
 				   TUNER_PHILIPS_FMD1216ME_MK3);
