Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D30058DDC
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 00:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfF0WUY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 18:20:24 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43089 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfF0WUY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 18:20:24 -0400
Received: by mail-qk1-f196.google.com with SMTP id m14so3166353qka.10;
        Thu, 27 Jun 2019 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pHwqVupckS7iQ/Vo8HGZ1yqr6p+z2egzqb95y8RNiPg=;
        b=ey/CguYMNjzs5Wf+bFIERswkUx+TInEm+IUNWdLwoN9wduV874WGCcpyYSTuUy51g+
         eiBKIewiIohO/1tyRkkRIRrwIxboExJFVHmzHUJG2LGJXkukJ0119eFQ6II1RAvBSjWx
         Lt+YodTeVhEhBXecml0hApRX5dVVp0Nrmz+IsB+00HT6TAm1u23tKquNQ73jhIuAr5MV
         FvMkYMPBAsSN3YEixXTLGZAyFDs1l1D5tRoPxLwyLZhIJV6DObdq8H/WKSAy9axf3oq1
         0O7V4hAx0PEF/Hm7CW7w6EMAseRbwDgNGfxmkcmoYJgNghsJIWxwcIqZFJBoNTcQXUOZ
         rdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pHwqVupckS7iQ/Vo8HGZ1yqr6p+z2egzqb95y8RNiPg=;
        b=FKtI+2TVIWgvztuwQaUh1unIikzLcBOQiYt4SsMCNMir3HsfPdaIidrAnnoc1N909V
         W+f9LVJsWMdjClx1jpL0GoGAHO2ERo3Y+XRz58UoqgfM6lf7HoVMhDspWlrRq33CB0yM
         SEl4sxSjQQC58RaUyk+0UWbZITbm8wVpvy6o3VH2IiyBtS77fugY0JuEroz2tu3yltYw
         RU7b4nOs1VsA+wSCH1RHmo4sApD1Ts+B/7Rg399LE5Bd5oqRZPF1w2SL3K/83T4MUN0s
         8rw43avKNHSQeuaxvG2BdCA3/DPOFPjV38pFVw4ueYzU5IPQLT9eeC80sFngone7kOTD
         w1Tw==
X-Gm-Message-State: APjAAAV6t8BsyNLVBPD3iw7YOWcZ57OkLKQVqQoHnzYAr9xk0B/H/Je+
        050biyZANfj/vUVf2yK3Y/6Cbwto
X-Google-Smtp-Source: APXvYqxl9Fa+EGoj4vPrZ5xnM5JnECxMrNXTrs0KC1zx+TpDFaiEZPL0DjqEdVIRaEgrJNgSTZUc+g==
X-Received: by 2002:ae9:e887:: with SMTP id a129mr5678787qkg.347.1561674022903;
        Thu, 27 Jun 2019 15:20:22 -0700 (PDT)
Received: from willemb.nyc.corp.google.com ([2620:0:1003:315:55eb:ba49:fa6:b843])
        by smtp.gmail.com with ESMTPSA id o33sm203092qtk.67.2019.06.27.15.20.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 15:20:22 -0700 (PDT)
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, linux-kernel@vger.kernel.org,
        Willem de Bruijn <willemb@google.com>,
        syzbot <syzkaller@googlegroups.com>
Subject: [PATCH] media: gp8psk: check return value in gp8psk_power_ctrl
Date:   Thu, 27 Jun 2019 18:20:20 -0400
Message-Id: <20190627222020.45909-1-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Willem de Bruijn <willemb@google.com>

One caller of gp8psk_power_ctrl fails to check the return value.

Syzbot KMSAN found a use of uninitialized data. This path is also
exercised when no such device exists, as in this cloud environment.

Argument status is not set if gp8psk_power_ctrl returns early.

Tests its return value in this case, too.

BUG: KMSAN: uninit-value in gp8psk_power_ctrl+0x33e/0xca0 drivers/media/usb/dvb-usb/gp8psk.c:193
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.1.0+ #1
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x191/0x1f0 lib/dump_stack.c:113
 kmsan_report+0x130/0x2a0 mm/kmsan/kmsan.c:622
 __msan_warning+0x75/0xe0 mm/kmsan/kmsan_instr.c:310
 gp8psk_power_ctrl+0x33e/0xca0 drivers/media/usb/dvb-usb/gp8psk.c:193
 dvb_usb_device_power_ctrl drivers/media/usb/dvb-usb/dvb-usb-init.c:226 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:160 [inline]
 dvb_usb_device_init+0x15ad/0x2cc0 drivers/media/usb/dvb-usb/dvb-usb-init.c:277
 gp8psk_usb_probe+0xa2/0x190 drivers/media/usb/dvb-usb/gp8psk.c:307
 usb_probe_interface+0xd66/0x1320 drivers/usb/core/driver.c:361
 really_probe+0xdae/0x1d80 drivers/base/dd.c:513
 driver_probe_device+0x1b3/0x4f0 drivers/base/dd.c:671
 __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:778
 bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
 __device_attach+0x454/0x730 drivers/base/dd.c:844
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:891
 bus_probe_device+0x137/0x390 drivers/base/bus.c:514
 device_add+0x288d/0x30e0 drivers/base/core.c:2106
 usb_set_configuration+0x30dc/0x3750 drivers/usb/core/message.c:2027
 generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
 usb_probe_device+0x14c/0x200 drivers/usb/core/driver.c:266
 [..snip..]

Reported-by: syzbot <syzkaller@googlegroups.com>
Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 drivers/media/usb/dvb-usb/gp8psk.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/gp8psk.c b/drivers/media/usb/dvb-usb/gp8psk.c
index 1282f701f1857..b666644f06d7b 100644
--- a/drivers/media/usb/dvb-usb/gp8psk.c
+++ b/drivers/media/usb/dvb-usb/gp8psk.c
@@ -184,9 +184,13 @@ static int gp8psk_power_ctrl(struct dvb_usb_device *d, int onoff)
 {
 	u8 status, buf;
 	int gp_product_id = le16_to_cpu(d->udev->descriptor.idProduct);
+	int ret;
 
 	if (onoff) {
-		gp8psk_usb_in_op(d, GET_8PSK_CONFIG,0,0,&status,1);
+		ret = gp8psk_usb_in_op(d, GET_8PSK_CONFIG, 0, 0, &status, 1);
+		if (ret)
+			return ret;
+
 		if (! (status & bm8pskStarted)) {  /* started */
 			if(gp_product_id == USB_PID_GENPIX_SKYWALKER_CW3K)
 				gp8psk_usb_out_op(d, CW3K_INIT, 1, 0, NULL, 0);
-- 
2.22.0.410.gd8fdbe21b5-goog

