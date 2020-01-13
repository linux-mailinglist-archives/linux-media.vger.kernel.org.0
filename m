Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3AD6139BF9
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 22:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbgAMVzm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 16:55:42 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52400 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgAMVzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 16:55:42 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 51694291319
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v4 4/6] media: vimc: capture: crash fix - synchronize call to vb2_queue_release when unregistering
Date:   Mon, 13 Jan 2020 23:55:04 +0200
Message-Id: <20200113215506.13329-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
References: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vb2_queue_release is called from vimc_cap_unregister.
`vb2_queue_release` stops the streaming in case
streaming is on and therefore it should be synchronized
with other streaming ioctls using the vdev's lock.
Currently the call is not synchronized and this cause
race conditions.

Using the following script:

while [ 1 ]; do
media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480],"Debayer A":0[fmt:SBGGR8_1X8/640x480]'

v4l2-ctl -d2 -v width=1920,height=1440
v4l2-ctl -d0 -v pixelformat=BA81
v4l2-ctl --stream-mmap -d /dev/video2 &
echo -n vimc.0 >/sys/bus/platform/drivers/vimc/unbind
echo -n vimc.0 >/sys/bus/platform/drivers/vimc/bind
done

The following crash appeared:

[  101.909376] BUG: kernel NULL pointer dereference, address: 0000000000000009
[  101.909661] #PF: supervisor read access in kernel mode
[  101.909835] #PF: error_code(0x0000) - not-present page
[  101.910048] PGD 0 P4D 0
[  101.910223] Oops: 0000 [#1] SMP NOPTI
[  101.910475] CPU: 0 PID: 1167 Comm: v4l2-ctl Not tainted 5.5.0-rc1+ #5
[  101.910716] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1ubuntu1 04/01/2014
[  101.911294] RIP: 0010:vb2_vmalloc_put_userptr+0x15/0x90 [videobuf2_vmalloc]
[  101.911671] Code: 89 df 5b e9 0d e6 29 c6 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 41 55 41 54 55 48 89 fd 53 4c 8b 65 08 48 8b 3f <41> 80 7c 24 09 00 75 65 48 81 e7 00 f0 ff ff 45 8b 6c 24 04 75 44
[  101.912329] RSP: 0018:ffff9b0c42253df0 EFLAGS: 00000286
[  101.912557] RAX: ffffffffc03bc1a0 RBX: ffff9095b37e1400 RCX: 0000000000000001
[  101.912818] RDX: 0000000000000004 RSI: 0000000000000003 RDI: ffff9b0c4229d000
[  101.913088] RBP: ffff9095b37d1480 R08: 0000000000000000 R09: ffff9b0c42253db8
[  101.913352] R10: ffff9095b37df858 R11: ffff9095b3444b50 R12: 0000000000000000
[  101.913598] R13: ffff9095b371c5b8 R14: 0000000000000004 R15: 0000000000000000
[  101.913896] FS:  00007fe62d779240(0000) GS:ffff9095bfc00000(0000) knlGS:0000000000000000
[  101.914202] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  101.914418] CR2: 0000000000000009 CR3: 0000000233392000 CR4: 00000000000006f0
[  101.914738] Call Trace:
[  101.915604]  __vb2_queue_free+0xf8/0x210 [videobuf2_common]
[  101.915876]  vb2_core_queue_release+0x34/0x40 [videobuf2_common]
[  101.916086]  _vb2_fop_release+0x7d/0x90 [videobuf2_v4l2]
[  101.916307]  v4l2_release+0x9e/0xf0 [videodev]
[  101.916499]  __fput+0xb6/0x250
[  101.916688]  task_work_run+0x7e/0xa0
[  101.916842]  exit_to_usermode_loop+0xaa/0xb0
[  101.917018]  do_syscall_64+0x10b/0x160
[  101.917175]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  101.917463] RIP: 0033:0x7fe62cf4c421
[  101.917575] Code: f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 8b 05 ea cf 20 00 85 c0 75 16 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 3f f3 c3 0f 1f 44 00 00 53 89 fb 48 83 ec 10

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-capture.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index c5a645f98c66..314fda6db112 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -339,7 +339,9 @@ void vimc_cap_unregister(struct vimc_ent_device *ved)
 	struct vimc_cap_device *vcap =
 		container_of(ved, struct vimc_cap_device, ved);
 
+	mutex_lock(&vcap->lock);
 	vb2_queue_release(&vcap->queue);
+	mutex_unlock(&vcap->lock);
 	video_unregister_device(&vcap->vdev);
 }
 
-- 
2.17.1

