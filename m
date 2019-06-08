Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2E4339A34
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 05:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbfFHDYd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 23:24:33 -0400
Received: from jp.dhs.org ([62.251.46.73]:40400 "EHLO jp.jpvw.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729815AbfFHDYc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 23:24:32 -0400
X-Greylist: delayed 2106 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Jun 2019 23:24:32 EDT
Received: from localhost ([::1])
        by jp.jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hZRQ4-0005Se-0y; Sat, 08 Jun 2019 04:49:24 +0200
To:     linux-media@vger.kernel.org
From:   JP <jp@jpvw.nl>
Subject: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
Cc:     Jan Pieter <raslal@live.com>
Message-ID: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
Date:   Sat, 8 Jun 2019 04:49:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I made the Mygica T230c2 work on kernel 5.1.7, but I have no idea

how to submit this. http://jpvw.nl/pub/test/dvb/linux-5.1.7-t230c2.patch


Please can someone help me out. It looks like the extra code in the

demodulator does not effect other drivers that use it. Tested with a

T230, they bothseem to work OK.


Jan Pieter van Woerkom



diff -ru a/drivers/media/dvb-frontends/si2168.c 
b/drivers/media/dvb-frontends/si2168.c
--- a/drivers/media/dvb-frontends/si2168.c    2019-06-04 
07:59:45.000000000 +0200
+++ b/drivers/media/dvb-frontends/si2168.c    2019-06-07 
22:49:21.226337473 +0200
@@ -91,8 +91,16 @@

      dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);

+    /* set ts clock freq to 10Mhz */
+       memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
+    cmd.wlen = 6;
+    cmd.rlen = 4;
+    ret = si2168_cmd_execute(client, &cmd);
+    if (ret) return ret;
+
      /* set TS_MODE property */
-    memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
+    memcpy(cmd.args, "\x14\x00\x01\x10\x00\x00", 6);
+    cmd.args[4] = dev->ts_mode & 0x30;
      if (acquire)
          cmd.args[4] |= dev->ts_mode;
      else
diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c 
b/drivers/media/usb/dvb-usb-v2/dvbsky.c
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-04 
07:59:45.000000000 +0200
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-07 
16:47:32.141530489 +0200
@@ -560,6 +560,9 @@
      si2168_config.i2c_adapter = &i2c_adapter;
      si2168_config.fe = &adap->fe[0];
      si2168_config.ts_mode = SI2168_TS_PARALLEL;
+    if (d->udev->descriptor.idProduct == USB_PID_MYGICA_T230C2)
+        si2168_config.ts_mode |= 0x20;
      si2168_config.ts_clock_inv = 1;

      state->i2c_client_demod = dvb_module_probe("si2168", NULL,
@@ -799,6 +802,9 @@
      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
          &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
          RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
+    { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
+        &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C2",
+        RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
      { }
  };
  MODULE_DEVICE_TABLE(usb, dvbsky_id_table);
diff -ru a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
--- a/include/media/dvb-usb-ids.h    2019-06-04 07:59:45.000000000 +0200
+++ b/include/media/dvb-usb-ids.h    2019-06-06 17:32:32.159187000 +0200
@@ -387,6 +387,7 @@
  #define USB_PID_MYGICA_D689                0xd811
  #define USB_PID_MYGICA_T230                0xc688
  #define USB_PID_MYGICA_T230C                0xc689
+#define USB_PID_MYGICA_T230C2                0xc68a
  #define USB_PID_ELGATO_EYETV_DIVERSITY            0x0011
  #define USB_PID_ELGATO_EYETV_DTT            0x0021
  #define USB_PID_ELGATO_EYETV_DTT_2            0x003f

