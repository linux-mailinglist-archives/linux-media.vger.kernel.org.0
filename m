Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 754BA8F4E5
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 21:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733049AbfHOTmT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 15:42:19 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44802 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733039AbfHOTmT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 15:42:19 -0400
Received: by mail-io1-f67.google.com with SMTP id j4so1529176iop.11
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g/o3EIuOgBberLg/fgVO+y01nT1mvbxjkqxkgN3Qppw=;
        b=X1PvC/Tp7650/s8PEeIqJQOpNwOsfIFWUBcf9LGGG9AkhuUx8FAutlgrXBkTdrwRS8
         Ejzf7iFRl8AAThASsPgN+sWomptP6ti3D2Zmt5SoiR5S57JW/U2IyCTWbQ7Ek6qRtLP1
         ghFhYaCNd8vxZ6XCORKpCf/DE9phg0RQ84Z0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g/o3EIuOgBberLg/fgVO+y01nT1mvbxjkqxkgN3Qppw=;
        b=CQOUh+SxSrpdxxG+CfatBj9UeRC8Nc0Jg8KX/yhNzt3jdQ//2Biz8n8hgXFQ13zon9
         UCv8bAGU0DoMVHyColLnwkYV8VA/kWVwsonSE0BfLwFKTb6XuXTs9Hct+DmE1ioiBUNv
         bXcQGeAUzv5ZlHlFuB7BTJWRNdkRJa/2DcARQyMh5OWj3HmPxVKjpcoHVgt+3IlaSAKW
         oXrWAtpZuVEkEZ1LzcwDgzKvqtR7+NIc6MEzxWaEILMJFOPa5Uns7QDPpsZIQwEQqh9Q
         NA3xGh6fFkERGhMv7l1RS7/DR8/6hrwyMnsoMCvnptYNjGeHeUbRv0xIl+0ME2q37sOj
         CWjA==
X-Gm-Message-State: APjAAAWIxozHSxO1oMMxVgXikaFfmy1DRizXmiXolsIZA6KQAqx29IVy
        92zYkBXnyqR6BmzzEneu04RMySIy0XY=
X-Google-Smtp-Source: APXvYqw1oovwnjXvPuC+l/awHROr3NEIuDFvKuqtLKJtEj231yNB8L7rapFFyHdYVTiwNdQkwNM2Ig==
X-Received: by 2002:a5e:9701:: with SMTP id w1mr7403803ioj.294.1565898138349;
        Thu, 15 Aug 2019 12:42:18 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j16sm3624268iok.34.2019.08.15.12.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2019 12:42:17 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, andrealmeid@collabora.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: vimc: Fix gpf in rmmod path when stream is active
Date:   Thu, 15 Aug 2019 13:42:13 -0600
Message-Id: <bfbdbd8072ff811ba1e16784488da592ccd79ed0.1565740213.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1565740213.git.skhan@linuxfoundation.org>
References: <cover.1565740213.git.skhan@linuxfoundation.org>
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
index 03016f204d05..d6b1e543891b 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -324,7 +324,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
 {
 	int ret;
 
-	/* Allocate the pads */
+	/* Allocate the pads. Should be released from the sd_int_op release */
 	ved->pads = vimc_pads_init(num_pads, pads_flag);
 	if (IS_ERR(ved->pads))
 		return PTR_ERR(ved->pads);
@@ -373,7 +373,6 @@ EXPORT_SYMBOL_GPL(vimc_ent_sd_register);
 void vimc_ent_sd_unregister(struct vimc_ent_device *ved, struct v4l2_subdev *sd)
 {
 	media_entity_cleanup(ved->ent);
-	vimc_pads_cleanup(ved->pads);
 	v4l2_device_unregister_subdev(sd);
 }
 EXPORT_SYMBOL_GPL(vimc_ent_sd_unregister);
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 3b4e73c10a03..8c561498020c 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -501,6 +501,7 @@ static void vimc_deb_release(struct v4l2_subdev *sd)
 	struct vimc_deb_device *vdeb =
 				container_of(sd, struct vimc_deb_device, sd);
 
+	vimc_pads_cleanup(vdeb->ved.pads);
 	kfree(vdeb);
 }
 
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index cb5eb42de69d..9eeb1159dc78 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -332,6 +332,7 @@ static void vimc_sca_release(struct v4l2_subdev *sd)
 	struct vimc_sca_device *vsca =
 				container_of(sd, struct vimc_sca_device, sd);
 
+	vimc_pads_cleanup(vsca->ved.pads);
 	kfree(vsca);
 }
 
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 70b195b817a4..27c54f5dab37 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -266,6 +266,7 @@ static void vimc_sen_release(struct v4l2_subdev *sd)
 
 	v4l2_ctrl_handler_free(&vsen->hdl);
 	tpg_free(&vsen->tpg);
+	vimc_pads_cleanup(vsen->ved.pads);
 	kfree(vsen);
 }
 
-- 
2.17.1

