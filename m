Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7A655AE09
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 03:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbiFZBpB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 21:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbiFZBpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 21:45:00 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E2FE0D2
        for <linux-media@vger.kernel.org>; Sat, 25 Jun 2022 18:44:58 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id m184so3324080wme.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jun 2022 18:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Xb5NuOLp/j9ntQT/YU4HfkFxSgqXKpMhTUxBBY0gEs=;
        b=JUpWGi1fmS97xV+qyM4VZLiIsCCGZ4557nXq632K/v/Opqp/2NWoj9IrybGMSvTheD
         Qsv15sbdWJj+Y7yLrCwj2qSp/xsqaDk+D2yqjBpu/9jn9hAq15D26INFCm88xwgZixnC
         U3o5eBRI1h7LEDeHS3z4clLRtvqD4sZrsviOYykI9EWy/ej0MwbrLWxcM6aAvKZmMj4p
         kyUI+7wpbuNTFLF4gQoWRHiYeYgbclrCAX6cDm8O6JGL627v9Ljs32QicZbNJeQ3ds5u
         69nQYenGRzwFiFwgG/4FYFbH2KdtmolPObKq5Z5uKku1SndWpGUYNWmwuB5q/XBGLEjl
         Vg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Xb5NuOLp/j9ntQT/YU4HfkFxSgqXKpMhTUxBBY0gEs=;
        b=ualhnYJoVW+eUPDNBhB7gqIV26tXoH3e+iMvbJn0N1IxLPY1wTBAqC+GiaarUZN5dK
         KIWFX1n8+53XqMPmOy6J1XnHUJ6ku06/tt0FQX/jHvfuDsIJb9ReQsGE/9H2riKqN56p
         3u2I0mOU1Hdx2yTW9hNgOhyTPcKTXI7z9J3FtS508IF90os8Ghg2p6QlVyjpG+sAMf03
         7sccvCBcmgfzcRHVjf/kvSFGYaEd6insTPz/z/jwTX6lbCl2raN90yQbwHVSn4wFWS6Q
         1VhCv0Ua+ge3EDkN+GpuKDAchyOPz7mnQMduVPcq4X4s9OzjwaslP4UrqqpzGV/imI2V
         mT5w==
X-Gm-Message-State: AJIora+svBVsGai63xHEFZ+nlnBXhr0bWY05bD/SehN4cwhJQq4v1YoR
        Yrp5sybHDlJtKq5453ojzGGK7YYoQu6N8534
X-Google-Smtp-Source: AGRyM1vlxmsLNQURg1X0NlBIDcvPktrPFJML4o0WgzYXX6VCoy/CuAr2IgpmJj0nLqeF7+3gyquc3g==
X-Received: by 2002:a7b:c450:0:b0:3a0:32ec:efa9 with SMTP id l16-20020a7bc450000000b003a032ecefa9mr11934544wmi.12.1656207897390;
        Sat, 25 Jun 2022 18:44:57 -0700 (PDT)
Received: from localhost.localdomain ([84.255.184.16])
        by smtp.gmail.com with ESMTPSA id m22-20020a05600c3b1600b00397402ae674sm12489818wms.11.2022.06.25.18.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 18:44:57 -0700 (PDT)
From:   Mazin Al Haddad <mazinalhaddad05@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sean@mess.org, mudongliangabcd@gmail.com,
        skhan@linuxfoundation.org,
        Mazin Al Haddad <mazinalhaddad05@gmail.com>,
        syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com
Subject: [RFC PATCH] media: dvb-usb: fix memory leak in dvb_usb_adapter_init()
Date:   Sun, 26 Jun 2022 04:44:24 +0300
Message-Id: <20220626014423.86262-1-mazinalhaddad05@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a memory leak in dvb_usb_adapter_init() found by syzkaller. The 
problem is due to the error path exiting before incrementing 
num_adapters_initalized which is used to kfree() adapter's private data. 
There are multiple error paths that dvb_usb_adapter_init() can exit from 
including one before the problematic allocation itself. Fix it by adding a 
variable to the dvb_usb_device struct that counts the successful 
allocations for each dvb adapter's private data and use it to kfree the 
objects in dvb_usb_adapter_exit.

BUG: memory leak
unreferenced object 0xffff8881172f1a00 (size 512):
  comm "kworker/0:2", pid 139, jiffies 4294994873 (age 10.960s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff844af012>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:75 [inline]
    [<ffffffff844af012>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]
    [<ffffffff844af012>] dvb_usb_device_init.cold+0x4e5/0x79e drivers/media/usb/dvb-usb/dvb-usb-init.c:308
    [<ffffffff830db21d>] dib0700_probe+0x8d/0x1b0 drivers/media/usb/dvb-usb/dib0700_core.c:883
    [<ffffffff82d3fdc7>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<ffffffff8274ab37>] call_driver_probe drivers/base/dd.c:542 [inline]
    [<ffffffff8274ab37>] really_probe.part.0+0xe7/0x310 drivers/base/dd.c:621
    [<ffffffff8274ae6c>] really_probe drivers/base/dd.c:583 [inline]
    [<ffffffff8274ae6c>] __driver_probe_device+0x10c/0x1e0 drivers/base/dd.c:752
    [<ffffffff8274af6a>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:782
    [<ffffffff8274b786>] __device_attach_driver+0xf6/0x140 drivers/base/dd.c:899
    [<ffffffff82747c87>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:427
    [<ffffffff8274b352>] __device_attach+0x122/0x260 drivers/base/dd.c:970
    [<ffffffff827498f6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:487
    [<ffffffff82745cdb>] device_add+0x5fb/0xdf0 drivers/base/core.c:3405
    [<ffffffff82d3d202>] usb_set_configuration+0x8f2/0xb80 drivers/usb/core/message.c:2170
    [<ffffffff82d4dbfc>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82d3f49c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff8274ab37>] call_driver_probe drivers/base/dd.c:542 [inline]
    [<ffffffff8274ab37>] really_probe.part.0+0xe7/0x310 drivers/base/dd.c:621
    [<ffffffff8274ae6c>] really_probe drivers/base/dd.c:583 [inline]
    [<ffffffff8274ae6c>] __driver_probe_device+0x10c/0x1e0 drivers/base/dd.c:752

Link: https://syzkaller.appspot.com/bug?id=4d54f8bf7b98eecf6cd76ed5aaea883c5d9e502a
Reported-by: syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com
Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
---
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 7 ++++++-
 drivers/media/usb/dvb-usb/dvb-usb.h      | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 61439c8f33ca..bbee86c70cc5 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -77,6 +77,7 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
 				err("no memory for priv for adapter %d.", n);
 				return -ENOMEM;
 			}
+			d->num_adap_priv_initialized++;
 		}
 
 		ret = dvb_usb_adapter_stream_init(adap);
@@ -125,8 +126,12 @@ static int dvb_usb_adapter_exit(struct dvb_usb_device *d)
 		dvb_usb_adapter_frontend_exit(&d->adapter[n]);
 		dvb_usb_adapter_dvb_exit(&d->adapter[n]);
 		dvb_usb_adapter_stream_exit(&d->adapter[n]);
-		kfree(d->adapter[n].priv);
 	}
+
+	for (n = 0; n < d->num_adap_priv_initialized; n++)
+		kfree(d->adapter[n].priv);
+
+	d->num_adapters_initialized = 0;
 	d->num_adapters_initialized = 0;
 	d->state &= ~DVB_USB_STATE_DVB;
 	return 0;
diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 0990aa4a17bb..1bfc33db3b52 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -483,6 +483,7 @@ struct dvb_usb_device {
 	struct i2c_adapter i2c_adap;
 
 	int                    num_adapters_initialized;
+	int		       num_adap_priv_initialized;
 	struct dvb_usb_adapter adapter[MAX_NO_OF_ADAPTER_PER_DEVICE];
 
 	/* remote control */
-- 
2.36.1

