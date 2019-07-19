Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73DE76E1C2
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 09:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfGSHdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 03:33:18 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45311 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfGSHdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 03:33:17 -0400
Received: by mail-pf1-f194.google.com with SMTP id r1so13781486pfq.12;
        Fri, 19 Jul 2019 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=Z/1Ns8Q5yQIoK5C+2IG3JQc28kJqQvVZmZq7uJ5ipgc=;
        b=UiZmpTr+u3YKoSEeBOrFLdcCqLEi7IurP+F7llSzQfwr5IuTlXBqo/ShZh6FW9KVPE
         mOKeeM3POF/NWvyFKlODuRAOJ90AicrzhdLqR8lN+IpFmko3u3zv4aeiSo3Z8eLPvSmF
         oPX8CAtYRrn3ESihThCM3o9OotJGEI28DjPcBmYTcShdaPJiiKEYSMuZoAA4zDVRmxz5
         FCW0vVZ1SYFzb0hwHZRLeFUmDE4yiMUjM41Tg9sbRGbgoB6VxmAd6qR4wloHTSOgHuh0
         0mcm8s3rCMZ5c+UGYL6EgE4BORaSxmGggL9HadWHvtHudLFKhKO7QR5tQ4fkDzbrwpzK
         Dddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=Z/1Ns8Q5yQIoK5C+2IG3JQc28kJqQvVZmZq7uJ5ipgc=;
        b=kJeqbOei37Gll14cfJv0MxiEjbeZISYqDMjoVhug7Pcj2pryhaStH4lwz+AUAb+V0P
         H3asWUSngVRPH1CmpiSUzYIo6ZihdgYWWjNAftPEju7L959XsrDXH/BbG0VuZpsWmJcI
         n7fd4qUp47CVcxpnuaVeTefBAN68reY53+2liL9Q3zH9sFAp5Ct66XkOw9APf1BoqTHq
         fqteV43FOIUUkS4IdsL1sSP+aKUx+Q4z1Vo1TikDgPpwMQmXqcE2zWNNVFz6a+pbXn3d
         JJQD3VDktdaA3EdfeDb1IKuGUxafz6Soo2OBxR2+ZLaZbpLrZN4DNNNd4iWmxzrJ2YI2
         Wr8w==
X-Gm-Message-State: APjAAAVjNL829kLROnMzpT6LD/B4RwDSq7v75JQELBsPFI4ZEaQx8nG8
        9HUY4FE7C94uLBooZ9gWk3c=
X-Google-Smtp-Source: APXvYqx7TYyvr0dBFlh8DOt1DM2OnzcSFCUygKZIR9W/g1JV6SUeSyDex+Fzb/s2EE/7XGtx9vUqfw==
X-Received: by 2002:a17:90a:338b:: with SMTP id n11mr55423791pjb.21.1563521596791;
        Fri, 19 Jul 2019 00:33:16 -0700 (PDT)
Received: from [192.168.1.10] ([117.248.75.47])
        by smtp.gmail.com with ESMTPSA id 2sm53221155pgm.39.2019.07.19.00.33.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jul 2019 00:33:16 -0700 (PDT)
To:     syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com
Cc:     allison@lohutok.net, hverkuil-cisco@xs4all.nl,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        rfontana@redhat.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Akihiro TSUKADA <tskd08@gmail.com>
From:   Vandana BN <bnvandana@gmail.com>
Subject: KASAN: global-out-of-bounds Read in dvb_pll_attach
Message-ID: <dd743f2b-4f86-196b-bdae-16c3286c8904@gmail.com>
Date:   Fri, 19 Jul 2019 13:03:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------20606FF4D637D5321B11CAC1"
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------20606FF4D637D5321B11CAC1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

#syz test: https://github.com/google/kasan.git usb-fuzzer


--------------20606FF4D637D5321B11CAC1
Content-Type: text/x-patch;
 name="0001-media-dvb-frontends-Remove-dvb_pll_devcount-and-id-m.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-media-dvb-frontends-Remove-dvb_pll_devcount-and-id-m.pa";
 filename*1="tch"

From 47fdaac830354fdf1775cd6e41a545148557e6e7 Mon Sep 17 00:00:00 2001
From: Vandana BN <bnvandana@gmail.com>
Date: Wed, 17 Jul 2019 02:48:06 +0530
Subject: [PATCH] media:dvb-frontends:Remove dvb_pll_devcount and id module
 parameters.

Syzbot reported global-out-of-bounds Read in dvb_pll_attach, while
accessing id[dvb_pll_devcount], because dvb_pll_devcount was 65,
that is more than size of 'id' which is DVB_PLL_MAX(64).

Fix would be to check if DVB_PLL_MAX devices are attached and if so return
NULL from dvb_pll_attach(). But this will put a limit on the number of
devices that can be attached.
Also dvb_pll_devcount and "id" module parameter are used for debugging
purpose to override/force PLL type.
So this patch removes these module parameters.

Reported-by: syz...@syzkaller.appspotmail.com

usb 1-1: dvb_usb_v2: will pass the complete MPEG2 transport stream to the
software demuxer
dvbdev: DVB: registering new adapter (774 Friio White ISDB-T USB2.0)
usb 1-1: media controller created
dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
tc90522 0-0018: Toshiba TC90522 attached.
usb 1-1: DVB: registering adapter 0 frontend 0 (Toshiba TC90522 ISDB-T
module)...
dvbdev: dvb_create_media_entity: media entity 'Toshiba TC90522 ISDB-T
module' registered.
==================================================================
BUG: KASAN: global-out-of-bounds in dvb_pll_attach+0x6c5/0x830
drivers/media/dvb-frontends/dvb-pll.c:798
Read of size 4 at addr ffffffff89c9e5e0 by task kworker/0:1/12

CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.2.0-rc6+ #13
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  dvb_pll_attach+0x6c5/0x830 drivers/media/dvb-frontends/dvb-pll.c:798
  dvb_pll_probe+0xfe/0x174 drivers/media/dvb-frontends/dvb-pll.c:877
  i2c_device_probe+0x790/0xaa0 drivers/i2c/i2c-core-base.c:389
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  i2c_new_client_device+0x5b3/0xc40 drivers/i2c/i2c-core-base.c:778
  i2c_new_device+0x19/0x50 drivers/i2c/i2c-core-base.c:821
  dvb_module_probe+0xf9/0x220 drivers/media/dvb-core/dvbdev.c:985
  friio_tuner_attach+0x125/0x1d0 drivers/media/usb/dvb-usb-v2/gl861.c:536
  dvb_usbv2_adapter_frontend_init
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:675 [inline]
  dvb_usbv2_adapter_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:804
[inline]
  dvb_usbv2_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:865 [inline]
  dvb_usbv2_probe.cold+0x24dc/0x255d
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:980
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the variable:
  id+0x100/0x120

Memory state around the buggy address:
  ffffffff89c9e480: fa fa fa fa 00 00 fa fa fa fa fa fa 00 00 00 00
  ffffffff89c9e500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffffffff89c9e580: 00 00 00 00 00 00 00 00 00 00 00 00 fa fa fa fa
                                                        ^
  ffffffff89c9e600: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
  ffffffff89c9e680: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
==================================================================

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/dvb-frontends/dvb-pll.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-frontends/dvb-pll.c
index ba0c49107bd2..c3a04751e9cf 100644
--- a/drivers/media/dvb-frontends/dvb-pll.c
+++ b/drivers/media/dvb-frontends/dvb-pll.c
@@ -33,19 +33,11 @@ struct dvb_pll_priv {
 	u32 bandwidth;
 };
 
-#define DVB_PLL_MAX 64
-
-static unsigned int dvb_pll_devcount;
 
 static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "enable verbose debug messages");
 
-static unsigned int id[DVB_PLL_MAX] =
-	{ [ 0 ... (DVB_PLL_MAX-1) ] = DVB_PLL_UNDEFINED };
-module_param_array(id, int, NULL, 0644);
-MODULE_PARM_DESC(id, "force pll id to use (DEBUG ONLY)");
-
 /* ----------------------------------------------------------- */
 
 struct dvb_pll_desc {
@@ -795,10 +787,6 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
 	b1[0] = 0;
 	msg.buf = b1;
 
-	if ((id[dvb_pll_devcount] > DVB_PLL_UNDEFINED) &&
-	    (id[dvb_pll_devcount] < ARRAY_SIZE(pll_list)))
-		pll_desc_id = id[dvb_pll_devcount];
-
 	BUG_ON(pll_desc_id < 1 || pll_desc_id >= ARRAY_SIZE(pll_list));
 
 	desc = pll_list[pll_desc_id];
@@ -825,7 +813,7 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
 	priv->pll_i2c_address = pll_addr;
 	priv->i2c = i2c;
 	priv->pll_desc = desc;
-	priv->nr = dvb_pll_devcount++;
+	priv->nr = pll_desc_id;
 
 	memcpy(&fe->ops.tuner_ops, &dvb_pll_tuner_ops,
 	       sizeof(struct dvb_tuner_ops));
@@ -846,13 +834,12 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
 
 	fe->tuner_priv = priv;
 
-	if ((debug) || (id[priv->nr] == pll_desc_id)) {
+	if (debug) {
 		dprintk("dvb-pll[%d]", priv->nr);
 		if (i2c != NULL)
 			pr_cont(" %d-%04x", i2c_adapter_id(i2c), pll_addr);
 		pr_cont(": id# %d (%s) attached, %s\n", pll_desc_id, desc->name,
-		       id[priv->nr] == pll_desc_id ?
-				"insmod option" : "autodetected");
+				"insmod option");
 	}
 
 	kfree(b1);
-- 
2.17.1


--------------20606FF4D637D5321B11CAC1--
