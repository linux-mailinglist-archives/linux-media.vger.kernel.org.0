Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEF26C0037
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 10:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjCSJBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Mar 2023 05:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjCSJBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Mar 2023 05:01:46 -0400
X-Greylist: delayed 2307 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 19 Mar 2023 02:01:44 PDT
Received: from bootes.sytes.net (unknown [88.85.206.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7180524736
        for <linux-media@vger.kernel.org>; Sun, 19 Mar 2023 02:01:44 -0700 (PDT)
Received: from localhost.lan ([127.0.0.1] helo=bootes.localnet)
        by bootes.sytes.net with esmtp (Exim 4.94.2)
        (envelope-from <alex@bootes.sytes.net>)
        id 1pdoJv-0007YA-B8
        for linux-media@vger.kernel.org; Sun, 19 Mar 2023 13:23:15 +0500
From:   Alex Volkov <alex@bootes.sytes.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH] IR remote control for AVerMedia TD310
Date:   Sun, 19 Mar 2023 13:23:15 +0500
Message-ID: <2273969.FyfRTN5kjP@bootes>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        MAY_BE_FORGED,PDS_RDNS_DYNAMIC_FP,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
        RDNS_DYNAMIC,SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Uses NEC defaults as other non-eeprom devices.

Signed-off-by: Alex Volkov <alex@bootes.sytes.net>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 1e9c8d01523b..50f0979395f2 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -862,6 +862,9 @@ static int af9035_read_config(struct dvb_usb_device *d)
 		if ((le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_AVERMEDIA) &&
 		    (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_AVERMEDIA_TD310)) {
 			state->it930x_addresses = 1;
+			/* TD310 RC works with NEC defaults */
+			state->ir_mode = 0x05;
+			state->ir_type = 0x00;
 		}
 		return 0;
 	}
@@ -2060,6 +2063,11 @@ static const struct dvb_usb_device_properties it930x_props = {
 	.tuner_attach = it930x_tuner_attach,
 	.tuner_detach = it930x_tuner_detach,
 	.init = it930x_init,
+	/*
+	 * dvb_usbv2_remote_init() calls rc_config() only for those devices
+	 * which have non-empty rc_map, so it's safe to enable it for every IT930x
+	 */
+	.get_rc_config = af9035_get_rc_config,
 	.get_stream_config = af9035_get_stream_config,
 
 	.get_adapter_count = af9035_get_adapter_count,
@@ -2151,7 +2159,7 @@ static const struct usb_device_id af9035_id_table[] = {
 	{ DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
 		&it930x_props, "ITE 9303 Generic", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
-		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
+		&it930x_props, "AVerMedia TD310 DVB-T2", RC_MAP_AVERMEDIA_RM_KS) },
 	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
 		&it930x_props, "Logilink VG0022A", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_TC2_STICK,
-- 
2.30.2




