Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38358A4357
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2019 10:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfHaIhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Aug 2019 04:37:41 -0400
Received: from gofer.mess.org ([88.97.38.141]:45005 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbfHaIhl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Aug 2019 04:37:41 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6B1C160688; Sat, 31 Aug 2019 09:37:39 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Antti Palosaari <crope@iki.fi>, Jan Pieter van Woerkom <jp@jpvw.nl>
Subject: [PATCH 1/2] media: rtl28xxu: set keymap for Astrometa DVB-T2
Date:   Sat, 31 Aug 2019 09:37:38 +0100
Message-Id: <20190831083739.18345-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks to Jan Pieter van Woerkom <jp@jpvw.nl> for providing the hardware.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 1a36bda28542..78ad9adfbeac 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1957,7 +1957,8 @@ static const struct usb_device_id rtl28xxu_id_table[] = {
 
 	/* RTL2832P devices: */
 	{ DVB_USB_DEVICE(USB_VID_HANFTEK, 0x0131,
-		&rtl28xxu_props, "Astrometa DVB-T2", NULL) },
+		&rtl28xxu_props, "Astrometa DVB-T2",
+		RC_MAP_ASTROMETA_T2HYBRID) },
 	{ DVB_USB_DEVICE(0x5654, 0xca42,
 		&rtl28xxu_props, "GoTView MasterHD 3", NULL) },
 	{ }
-- 
2.21.0

