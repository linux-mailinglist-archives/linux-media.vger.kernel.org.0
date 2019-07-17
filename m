Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E68EF6BDE7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 16:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbfGQOMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 10:12:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41623 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfGQOMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 10:12:22 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so10910655pff.8;
        Wed, 17 Jul 2019 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4s7YPj0sRs5ZowClSZ1agTnqtfmEiokOlFXuNb237V0=;
        b=V11DzqkChmijR3NqfYxVhUUbqkCH9ei1WMLUAwJ75245s0ObUTdGjXQh9MqPcXfaBt
         IVVRs9wUqj0PrO7UgfW/RTcdZ3AwCeZVgQ7GU8b8bcJdwASMxUW7BfyyYHJ58PERk/M5
         YpS5iYl7WhELPZVUN5LjlXvYfZkSfkdr0+nnc70Lbdsu/O3MrTX6kykO5yyNxkyYxSD0
         9fS3TQ3d8o/0B+jttafuxDUaZZ40zGfzA0HtRrO4Yvy6HaNqJBPrsdO9vFL55qAWnKuy
         TuhnuoDAEdBFyng1PfgY8qe7FtnANW3tyUzOZ8/CwDcBjCB2Pkaxqw6RBNUiK9ZNJTqR
         aJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4s7YPj0sRs5ZowClSZ1agTnqtfmEiokOlFXuNb237V0=;
        b=IZJRxNvqz4mDhINzlBhPh9qZIBpqetjN/OyEmLNuY6F7ubVFHxR2pV+69WsHuxdB/h
         aRTg8E6M8rb7pND197eD/vWj2M5Rs0Q52s9ZlTqDTrGPvNfBUTA3Jc7yRfgYHU9KU0/5
         K1JBoscS5MEG0hfjh2WP2SVMAeMASYWAIfO6DaYs1VOaWYBhB+dVeMB9Iltly4k/0LUa
         rpxhc5mK8f5uFRC2l16tu4ZjMNgP7Gosrr+tvdjfSqbHMXFbrcktK6R0kYN1Et37dtME
         le4meaNrkof8EcLjz8lzU5XLPTzfiFhnB2IJhSoNR3b4AtO2wvwPJPf2HkW6poWaEyl4
         tuKg==
X-Gm-Message-State: APjAAAVKVpXHC11Y0WVuzSwuP1oM7PV4OuQ+1Jp3xXt7RPJEtx9diZBc
        SgpfRJJqzdrNOEr595x/Jnc=
X-Google-Smtp-Source: APXvYqznGX4+JEme6lKbDB5vR5tkrbLnL36X6Bm6n+RzroQYGlgvIKo2t5wrcridRZsW1hlXxTvSTQ==
X-Received: by 2002:a65:448a:: with SMTP id l10mr16735169pgq.327.1563372740190;
        Wed, 17 Jul 2019 07:12:20 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.248.76.70])
        by smtp.gmail.com with ESMTPSA id s43sm27565680pjb.10.2019.07.17.07.12.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 07:12:19 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] media:dvb-frontends:Return if Max devices are added in dvb_pll_attach().
Date:   Wed, 17 Jul 2019 19:42:04 +0530
Message-Id: <20190717141204.19433-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported global-out-of-bounds Read in dvb_pll_attach, while
accessing id[dvb_pll_devcount], because dvb_pll_devcount was 65,
that is more than size of 'id' which is DVB_PLL_MAX(64).

Fix is to check if DVB_PLL_MAX devices are attached and if so return
NULL from dvb_pll_attach().

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
 drivers/media/dvb-frontends/dvb-pll.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-frontends/dvb-pll.c
index ba0c49107bd2..c850f1d69bce 100644
--- a/drivers/media/dvb-frontends/dvb-pll.c
+++ b/drivers/media/dvb-frontends/dvb-pll.c
@@ -788,6 +788,9 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
 	int ret;
 	const struct dvb_pll_desc *desc;

+	if (dvb_pll_devcount > DVB_PLL_MAX - 1)
+		return NULL;
+
 	b1 = kmalloc(1, GFP_KERNEL);
 	if (!b1)
 		return NULL;
-- 
2.17.1

