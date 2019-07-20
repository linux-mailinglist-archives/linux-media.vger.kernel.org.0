Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 112DD6EDEE
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2019 08:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfGTGP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jul 2019 02:15:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45660 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfGTGP4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jul 2019 02:15:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id r1so15068744pfq.12;
        Fri, 19 Jul 2019 23:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+RrIwEbaXX9G64W4Jxx7zZ9OtbwTvJNBWcorDjKSWOU=;
        b=XYCxoSzSIXPdboZhSSc9xmHBX2Hy0DUMYQ5+fu0NT8OdGQ2ZqFQ/Yo3G5TeK56sWfC
         IMNMyigWXWVsfQFssb0GY2k/Ayo/ZV8rB+yrk+XILxCVAp+PI191R17lztzhXrv3NodF
         rnC7Xr01ZjcvRr9Iwn8lCjksIF8cyAkd8f09+LK5QOlWYrCcERy/ZrjzDvJEdJiLUPNh
         /90DQ7GlXfWKQCKALRsbotf2JtwRbQo1t/UvdadsAX+mHUTo5kav2SGv8LKKMdJSnl7r
         xY3XO4SsvtFcpXi1juU3eWahsdK+hBF198sgdcaptRKuodD75eRsLRHLixEOtxnBobAB
         M0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+RrIwEbaXX9G64W4Jxx7zZ9OtbwTvJNBWcorDjKSWOU=;
        b=NWY9ffMq7F9/gUYuUutqS4NjyI0VOdiosC2kJBvflKapuELiIyqAxpoGB1Ngv8sH6B
         GW9czVwhUZFUKQ3qwUVO47hSIrkUBKY4xaaOAUTRKe4E6Rcsw1XUBWDPD0x1dM+AesJP
         bTRSwd2CGF8USHL2eX5aB1DkDlA2BshehVEwKPJHQuxwCbT9KSOxe8rCin5pW600gZ0t
         1nAIyqW2pEa1RMiGsepfZWiemXWMv7kSXIYJZzfM4gBjZ9CjyiMQkSsQsIH69zx+3ql6
         otJrD9kg4XG/dlUdCiSMsH1U3NnhyYutTBuZeC678dB8foarEKgELk7kZggv38bqcVQY
         m4eg==
X-Gm-Message-State: APjAAAXb3kIlrOhvSCWt1scYghS19M4jcWB+APQg8RtR3YG+nA1Twijj
        /MDGsKg4BFYdql177GlLmUw=
X-Google-Smtp-Source: APXvYqxs16AdKNXW4x8WREXvYXcYknN5210df7xau4yzdwvmT6HmhxieGIKtCzm38lziyjcdn3dcqA==
X-Received: by 2002:a63:1950:: with SMTP id 16mr58153174pgz.312.1563603354704;
        Fri, 19 Jul 2019 23:15:54 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([61.1.211.74])
        by smtp.gmail.com with ESMTPSA id h12sm37014410pje.12.2019.07.19.23.15.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 19 Jul 2019 23:15:53 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tskd08@gmail.com
Cc:     skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2] media:dvb-frontends:Remove dvb_pll_devcount and id module parameters.
Date:   Sat, 20 Jul 2019 11:43:02 +0530
Message-Id: <20190720061302.24047-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717141204.19433-1-bnvandana@gmail.com>
References: <20190717141204.19433-1-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

