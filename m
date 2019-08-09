Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204B488538
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 23:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbfHIVp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 17:45:58 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39861 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728188AbfHIVpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 17:45:54 -0400
Received: by mail-ot1-f66.google.com with SMTP id r21so132180629otq.6
        for <linux-media@vger.kernel.org>; Fri, 09 Aug 2019 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8bv0VJFvcUca4dNFjkReaJ6w8K5woMhiQ/onkgnpeg=;
        b=coaW+EFbAMuceCGUBT8pJ/YDD+TnpNU0zyfWayKUPOymm32egeIGxjcQDzd/Tcs/zn
         lY/ewx0Sqd/l2YR0gIlQh5Kjfzf5EpyKc78HGQ+YXYWW+uKzVk06cTisXHX0JoAEG4kZ
         ukQJbmoVvy4sfaOcfM0OU0LGSpjOD6+JPp3Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8bv0VJFvcUca4dNFjkReaJ6w8K5woMhiQ/onkgnpeg=;
        b=nVU6S9VsvFs8Fhm6QVtcxhrVbFLEne/bO1HKeajKCEa3V0lZCv65HPPYdKxI3V88Ec
         1DlHs34HrKUJ6BwbQw12ZQJZN2GH5f2QWT/X9nMpCzzsbOuAs9Y53y33mvQPxUxK7fb6
         WI/yIk0liclGrZtuSbVZqD9l3ic3Uyn7uG2SYw2lNZ6znmGaKM6SYLdOR0VvaBz0ZbfA
         LIHBuLs188Lkt05ljSsetk0j9A2ezXkmyx/OSrTaVvw3c1FlhWvxxyVQ/syYyuLOOEdc
         W2vzmKF/CjaeF5RO7ird/C7dZOUqlLvglHYiRK28mCr0l1TG6gXho5mjVadLNfAIc4hz
         HJ3w==
X-Gm-Message-State: APjAAAXIuyiYH+ClokZHebmbqz+ZcHQQdrjprnnBCsQ6O0WOYOoLSxj9
        No+AMNWXVgqTPWIXrgvi1YKRDg==
X-Google-Smtp-Source: APXvYqxaftLcNmxLkz2YDb7ubn2cO8ZuF5CD6gIUlXfbvU4C91kVGJRxpuMwXPDTJDhWtthGZuh4Uw==
X-Received: by 2002:a05:6602:8e:: with SMTP id h14mr9560463iob.305.1565387153481;
        Fri, 09 Aug 2019 14:45:53 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id n17sm75861623iog.63.2019.08.09.14.45.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 14:45:53 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: vimc: Fix gpf in rmmod path when stream is active
Date:   Fri,  9 Aug 2019 15:45:43 -0600
Message-Id: <1ec378f927ed2462258d0657c6355bf916618a0e.1565386364.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1565386363.git.skhan@linuxfoundation.org>
References: <cover.1565386363.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If vimc module is removed while streaming is in progress, sensor
subdev unregister runs into general protection fault when it tries
to unregister media entities.

vimc_ent_sd_unregister() is fixed to call vimc_pads_cleanup() to
release media pads after v4l2_device_unregister_subdev() is done
unregistering the subdev and stop accessing media objects.

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
 drivers/media/platform/vimc/vimc-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
index 03016f204d05..abace5e0b4d3 100644
--- a/drivers/media/platform/vimc/vimc-common.c
+++ b/drivers/media/platform/vimc/vimc-common.c
@@ -373,7 +373,7 @@ EXPORT_SYMBOL_GPL(vimc_ent_sd_register);
 void vimc_ent_sd_unregister(struct vimc_ent_device *ved, struct v4l2_subdev *sd)
 {
 	media_entity_cleanup(ved->ent);
-	vimc_pads_cleanup(ved->pads);
 	v4l2_device_unregister_subdev(sd);
+	vimc_pads_cleanup(ved->pads);
 }
 EXPORT_SYMBOL_GPL(vimc_ent_sd_unregister);
-- 
2.17.1

