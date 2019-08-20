Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF8A96B4A
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 23:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730895AbfHTVSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 17:18:52 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:47005 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730877AbfHTVSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 17:18:48 -0400
Received: by mail-io1-f68.google.com with SMTP id x4so216760iog.13
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2019 14:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rkcX3ujLe0beIts8QiTuw+UqZR+RRH2frURa/U9SR5U=;
        b=Je+V63T42q7O0zxEaUttv9WylC1e40RSiHQplf7gVB/RpIb+D1+5rPqVO28A3st+2Q
         ZIfd07o060NWzwGxQbu846Tk4N9cQLqzMFhkQb7brya8/zeu8dUa+zIOT8dcgP2yiaTK
         3Ta5C1L5VtRSaYTnHxTNrNK/qHxyHfh17aTmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rkcX3ujLe0beIts8QiTuw+UqZR+RRH2frURa/U9SR5U=;
        b=EBbtxWrG4qFR2mzzOQMXkRudvppE9naiaA6RH26YHy7sXM964OAk/Q1vUDKd1GZ5dP
         RAKpmhC7Ww5far+02BPcxm2QoB5LaIttPScBg+RHJTXeXMxyWrCCFsAIteToWLFZ8UuY
         XUYIBMYWO0vo5T4BxPLSYZ3OiuC3sBETm/15zMIhL6RCHJ7wznHqXfAUqFdH12QRw7Fw
         +RtYI2tdG7waOeQnXyTV7K1FqRu/e9LuTvpPaR0gdRV4ttbQDsb09y9mcXXt/oGLpnIx
         ecsOpMZh6ZM4ciP9TIu5fS8zAFyByTo+VVcRYl51TOpKWcIZGN8VqAsjHxmFeRO8lVR9
         O68Q==
X-Gm-Message-State: APjAAAW3VxdvMvrpEQpuOnUqJHNdKsZctBr1Kll43IHXCC9CyFK7QFl2
        aMot17vhwJozj8l3RLYB23/zEPJXyUo=
X-Google-Smtp-Source: APXvYqxtWQmqw8ESu9PLd5h199TTiQNt+P5/IXCPRB20heySWujYnU+6GNubrMthj484g9qSQKq88A==
X-Received: by 2002:a6b:610d:: with SMTP id v13mr36466055iob.226.1566335927967;
        Tue, 20 Aug 2019 14:18:47 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e12sm38441135iob.66.2019.08.20.14.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 14:18:47 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, andrealmeid@collabora.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 2/2] media: vimc: Fix gpf in rmmod path when stream is active
Date:   Tue, 20 Aug 2019 15:18:42 -0600
Message-Id: <d131406fcf6b554a9957d0b82b142982e1655332.1566334364.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1566334362.git.skhan@linuxfoundation.org>
References: <cover.1566334362.git.skhan@linuxfoundation.org>
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
index 73dc17f0d990..6cee911bf149 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -482,6 +482,7 @@ static void vimc_deb_release(struct v4l2_subdev *sd)
 	struct vimc_deb_device *vdeb =
 				container_of(sd, struct vimc_deb_device, sd);
 
+	vimc_pads_cleanup(vdeb->ved.pads);
 	kfree(vdeb);
 }
 
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 17da47a103ef..04c778f74972 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -338,6 +338,7 @@ static void vimc_sca_release(struct v4l2_subdev *sd)
 	struct vimc_sca_device *vsca =
 				container_of(sd, struct vimc_sca_device, sd);
 
+	vimc_pads_cleanup(vsca->ved.pads);
 	kfree(vsca);
 }
 
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index f6aea32175a2..b1e5d591cc3f 100644
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

