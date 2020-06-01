Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8AD1EB223
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 01:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgFAXWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 19:22:06 -0400
Received: from jpvw.nl ([80.127.100.2]:38814 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbgFAXWG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jun 2020 19:22:06 -0400
X-Greylist: delayed 1918 seconds by postgrey-1.27 at vger.kernel.org; Mon, 01 Jun 2020 19:22:05 EDT
Received: from jp by jpvw.nl with local (Exim 4.93)
        (envelope-from <jp@jpvw.nl>)
        id 1jftFu-0000oO-22; Tue, 02 Jun 2020 00:50:06 +0200
Date:   Tue, 2 Jun 2020 00:50:06 +0200
From:   Jan Pieter van Woerkom <jp@jpvw.nl>
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>
Subject: [PATCH] media: dvbsky: MyGica Mini USB sticks: add DVB-(T/C) to
 dvbsky_id_table
Message-ID: <20200601225006.GA2951@jpvw.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MyGica Mini USB sticks: add DVB-(T/C) to dvbsky_id_table

Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
---
diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c	2020-06-01 01:49:15.000000000 +0200
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c	2020-06-01 21:01:32.287670677 +0200
@@ -778,16 +778,16 @@
 		&dvbsky_s960_props, "Terratec Cinergy S2 Rev.4",
 		RC_MAP_DVBSKY) },
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230,
-		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230",
+		&mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
-		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
+		&mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C_LITE,
-		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C Lite",
+		&mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C Lite",
 		NULL) },
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
-		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C v2",
+		&mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C v2",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
 	{ }
 };
