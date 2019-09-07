Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40FFAAC41B
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 04:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405470AbfIGCmb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 22:42:31 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41835 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393821AbfIGCma (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 22:42:30 -0400
Received: by mail-io1-f67.google.com with SMTP id r26so17166323ioh.8
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 19:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMqJ+s9da9e5FqMyqaGNajQm8pg7G7WbQPk1E5tDal0=;
        b=PZlJ3QTi+5/X0sVnWVqmbmX7XHWPEkIp3HqRn6OaOxRExnapIUcpb714WQVNI6CgSn
         EeqdMRbCgnkDfSHe4kqtyVzGvVuT+M5GPeSl98FnmetiCGkstxe6PC0g4RDssp+ayI0h
         2Syj2EAUlOYaO49sbiwg+uZZKi7HUMfmn+Hok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMqJ+s9da9e5FqMyqaGNajQm8pg7G7WbQPk1E5tDal0=;
        b=bSvSjCPWDITxkG35nAU/ie9gDLuu+53dPt9tm4/gNRRzfnMCkHpDlyUgm7tVLBZaT1
         BqWg5pHhL/FBncErJAM2m/p6Oxnwa3oZIxbdgpcn+K3pVsMZkNZjgGYjocYpTYIrTG0k
         MByOEP6yxrpDCxLkuQuU5+DezEfJbbd4J5ox1iZTjHgxazsm1H7pRwdXnSb6OSju4LBz
         1dWmpLVz8n71V9/JUsgXhkvgyhgb+Z4jexJBfzJuAWmWJ6PwZfsNjr5WD4kDpDJFxfB0
         huIgF3xwICQJ/YQ2rukOmqXNYxZSKrV7yiGr8MY1xgftJygEay9En0BqTUrUEDrv6XYQ
         EvtQ==
X-Gm-Message-State: APjAAAWc1Rj/Z1tDu3sBkIHu7yGpM77RK3enhlDsA61FZDVft0Xf7+Tk
        2tjgl6Cm8Mxx46f3WL5GKHZrYQ==
X-Google-Smtp-Source: APXvYqxplYwTH0esO212i6/ENMGo887VMfAYx4mcWwhSyTBKOEQoFAbszDu5nyy54nPgx1HrR2Gpeg==
X-Received: by 2002:a02:3446:: with SMTP id z6mr13663787jaz.105.1567824149008;
        Fri, 06 Sep 2019 19:42:29 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b7sm6441427iod.78.2019.09.06.19.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 19:42:28 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com,
        skhan@linuxfoundation.org, andrealmeid@collabora.com,
        dafna.hirschfeld@collabora.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] media: vimc: Fix gpf in rmmod path when stream is active
Date:   Fri,  6 Sep 2019 20:42:16 -0600
Message-Id: <2421a0ea4bec8c5084121ecdbc9213c331239f3d.1567822793.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1567822792.git.skhan@linuxfoundation.org>
References: <cover.1567822792.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If vimc module is removed while streaming is in progress, sensor subdev
unregister runs into general protection fault when it tries to unregister
media entities. This is a common subdev problem related to releasing
pads from v4l2_device_unregister_subdev() before calling unregister.
Unregister references pads during unregistering subdev.

The sd release handler is the right place for releasing all sd resources
including pads. The release handlers currently release all resources
except the pads.

Fix v4l2_device_unregister_subdev() not release pads and release pads
from the sd_int_op release handlers.

kernel: [ 4136.715839] general protection fault: 0000 [#1] SMP PTI
kernel: [ 4136.715847] CPU: 2 PID: 1972 Comm: bash Not tainted 5.3.0-rc2+ #4
kernel: [ 4136.715850] Hardware name: Dell Inc. OptiPlex 790/0HY9JP, BIOS A18 09/24/2013
kernel: [ 4136.715858] RIP: 0010:media_gobj_destroy.part.16+0x1f/0x60
kernel: [ 4136.715863] Code: ff 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 55 48 89 fe 48 89 e5 53 48 89 fb 48 c7 c7 00 7f cf b0 e8 24 fa ff ff 48 8b 03 <48> 83 80 a0 00 00 00 01 48 8b 43 18 48 8b 53 10 48 89 42 08 48 89
kernel: [ 4136.715866] RSP: 0018:ffff9b2248fe3cb0 EFLAGS: 00010246
kernel: [ 4136.715870] RAX: bcf2bfbfa0d63c2f RBX: ffff88c3eb37e9c0 RCX: 00000000802a0018
kernel: [ 4136.715873] RDX: ffff88c3e4f6a078 RSI: ffff88c3eb37e9c0 RDI: ffffffffb0cf7f00
kernel: [ 4136.715876] RBP: ffff9b2248fe3cb8 R08: 0000000001000002 R09: ffffffffb0492b00
kernel: [ 4136.715879] R10: ffff9b2248fe3c28 R11: 0000000000000001 R12: 0000000000000038
kernel: [ 4136.715881] R13: ffffffffc09a1628 R14: ffff88c3e4f6a028 R15: fffffffffffffff2
kernel: [ 4136.715885] FS:  00007f8389647740(0000) GS:ffff88c465500000(0000) knlGS:0000000000000000
kernel: [ 4136.715888] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: [ 4136.715891] CR2: 000055d008f80fd8 CR3: 00000001996ec005 CR4: 00000000000606e0
kernel: [ 4136.715894] Call Trace:
kernel: [ 4136.715903]  media_gobj_destroy+0x14/0x20
kernel: [ 4136.715908]  __media_device_unregister_entity+0xb3/0xe0
kernel: [ 4136.715915]  media_device_unregister_entity+0x30/0x40
kernel: [ 4136.715920]  v4l2_device_unregister_subdev+0xa8/0xe0
kernel: [ 4136.715928]  vimc_ent_sd_unregister+0x1e/0x30 [vimc]
kernel: [ 4136.715933]  vimc_sen_rm+0x16/0x20 [vimc]
kernel: [ 4136.715938]  vimc_remove+0x3e/0xa0 [vimc]
kernel: [ 4136.715945]  platform_drv_remove+0x25/0x50
kernel: [ 4136.715951]  device_release_driver_internal+0xe0/0x1b0
kernel: [ 4136.715956]  device_driver_detach+0x14/0x20
kernel: [ 4136.715960]  unbind_store+0xd1/0x130
kernel: [ 4136.715965]  drv_attr_store+0x27/0x40
kernel: [ 4136.715971]  sysfs_kf_write+0x48/0x60
kernel: [ 4136.715976]  kernfs_fop_write+0x128/0x1b0
kernel: [ 4136.715982]  __vfs_write+0x1b/0x40
kernel: [ 4136.715987]  vfs_write+0xc3/0x1d0
kernel: [ 4136.715993]  ksys_write+0xaa/0xe0
kernel: [ 4136.715999]  __x64_sys_write+0x1a/0x20
kernel: [ 4136.716005]  do_syscall_64+0x5a/0x130
kernel: [ 4136.716010]  entry_SYSCALL_64_after_hwframe+0x4
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/media/platform/vimc/vimc-common.c  | 3 +--
 drivers/media/platform/vimc/vimc-debayer.c | 1 +
 drivers/media/platform/vimc/vimc-scaler.c  | 1 +
 drivers/media/platform/vimc/vimc-sensor.c  | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index 7e1ae0b12f1e..a3120f4f7a90 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -375,7 +375,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 {
 	int ret;
 
-	/* Allocate the pads */
+	/* Allocate the pads. Should be released from the sd_int_op release */
 	ved->pads = vimc_pads_init(num_pads, pads_flag);
 	if (IS_ERR(ved->pads))
 		return PTR_ERR(ved->pads);
@@ -424,7 +424,6 @@ EXPORT_SYMBOL_GPL(vimc_ent_sd_register);
 void vimc_ent_sd_unregister(struct vimc_ent_device *ved, struct v4l2_subdev *sd)
 {
 	media_entity_cleanup(ved->ent);
-	vimc_pads_cleanup(ved->pads);
 	v4l2_device_unregister_subdev(sd);
 }
 EXPORT_SYMBOL_GPL(vimc_ent_sd_unregister);
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 00850f2501ad..b38b55f51a24 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -482,6 +482,7 @@ static void vimc_deb_release(struct v4l2_subdev *sd)
 	struct vimc_deb_device *vdeb =
 				container_of(sd, struct vimc_deb_device, sd);
 
+	vimc_pads_cleanup(vdeb->ved.pads);
 	kfree(vdeb);
 }
 
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 28a947950a0b..05db5070e268 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -338,6 +338,7 @@ static void vimc_sca_release(struct v4l2_subdev *sd)
 	struct vimc_sca_device *vsca =
 				container_of(sd, struct vimc_sca_device, sd);
 
+	vimc_pads_cleanup(vsca->ved.pads);
 	kfree(vsca);
 }
 
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 1f15637ca8bb..46dc6a535abe 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -291,6 +291,7 @@ static void vimc_sen_release(struct v4l2_subdev *sd)
 
 	v4l2_ctrl_handler_free(&vsen->hdl);
 	tpg_free(&vsen->tpg);
+	vimc_pads_cleanup(vsen->ved.pads);
 	kfree(vsen);
 }
 
-- 
2.20.1

