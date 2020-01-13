Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A786C139BF5
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 22:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgAMVzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 16:55:19 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52340 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgAMVzT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 16:55:19 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 3C8C72912F1
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v4 0/6] media: vimc: race condition fixes
Date:   Mon, 13 Jan 2020 23:55:00 +0200
Message-Id: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a v4 of the formerly called patchset "media: vimc: release vimc in release cb of v4l2_device"

It solves several crashes and memory leaks that were detected in vimc when running a code
that constantly tries to stream the device and in parallel a code that constantly binds
and unbinds the device.

2 bugs are solved in this patchset:

1. Currently when the device is unbounded, the vimc entities are
released immediately. If the device is streaming,
the function `vimc_streamer_pipeline_terminate` is called when
unregistering the streaming capture device and it references the
already freed vimc entities.
The patchset solves this by deferring the release
to the release callback of v4l2_device. This ensures that
the vimc entities will be released after the last fh is closed
and so the streaming terminates before.
The detail of how to reproduce this bug are described in the patch:
"use-after-free fix - release vimc in the v4l_device release"
The bug is easily detected with a KASAN report.

2. Another bug occurs when calling vb2_queue_release from
vimc_cap_unregister. The call to `vb2_queue_release` cause
the streaming to stop in case streaming started, this cause race condition
when it is called in parallel to other system calls that are related to streaming.
I was able to detect two crashes. One is reported in the commit log of
"media: vimc: capture: crash fix - synchronize call to vb2_queue_release when unregistering"

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

This is because the call to `vb2_core_queue_release` is called in parallel both
from v4l2_release and from vimc_cap_unregister.

Another is

[  648.499742] vimc vimc.0: first entity in the pipe 'Scaler' is not a source
[  648.501570] BUG: kernel NULL pointer dereference, address: 0000000000000118
[  648.501904] #PF: supervisor read access in kernel mode
[  648.502108] #PF: error_code(0x0000) - not-present page
[  648.502412] PGD 0 P4D 0 
[  648.502863] Oops: 0000 [#1] SMP NOPTI
[  648.503163] CPU: 0 PID: 7039 Comm: v4l2-ctl Not tainted 5.5.0-rc1+ #5
[  648.503403] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1ubuntu1 04/01/2014
[  648.504158] RIP: 0010:mutex_lock+0x19/0x30
[  648.504416] Code: 00 66 66 66 66 90 be 02 00 00 00 e9 31 f8 ff ff 90 66 66 66 66 90 53 48 89 fb e8 32 e0 ff ff 65 48 8b 14 25 80 7d 01 00 31 c0 <3e> 48 0f b1 13 75 02 5b c3 48 89 df 5b eb c8 0f 1f 84 00 00 00 00
[  648.504953] RSP: 0018:ffffbdc2c08efc68 EFLAGS: 00000246
[  648.505140] RAX: 0000000000000000 RBX: 0000000000000118 RCX: ffff9e01b3bd7000
[  648.505363] RDX: ffff9e01b5fc9980 RSI: 0000000000000001 RDI: 0000000000000118
[  648.505601] RBP: ffff9e01b3bd7020 R08: 0000000000000000 R09: ffffffffc0198500
[  648.505815] R10: ffff9e01b532a4c0 R11: 0000000000000001 R12: ffff9e01b3bd7020
[  648.506029] R13: ffff9e01b4ff2dc0 R14: ffff9e01b3bd7810 R15: 0000000000000000
[  648.506270] FS:  00007fbd56f14240(0000) GS:ffff9e01b7c00000(0000) knlGS:0000000000000000
[  648.506515] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  648.506686] CR2: 0000000000000118 CR3: 0000000232ff4000 CR4: 00000000000006f0
[  648.506957] Call Trace:
[  648.508242]  media_pipeline_stop+0x1c/0x30 [mc]
[  648.508526]  vimc_cap_start_streaming+0x62/0x80 [vimc]
[  648.508689]  vb2_start_streaming+0x5c/0x110 [videobuf2_common]
[  648.508892]  vb2_core_streamon+0xf0/0x110 [videobuf2_common]
[  648.509116]  __video_do_ioctl+0x194/0x4b0 [videodev]
[  648.509392]  ? video_put_user+0x210/0x210 [videodev]
[  648.509561]  video_usercopy+0x1b3/0x510 [videodev]
[  648.509798]  v4l2_ioctl+0x45/0x50 [videodev]
[  648.510038]  do_vfs_ioctl+0xa0/0x670
[  648.510169]  ksys_ioctl+0x70/0x80
[  648.510282]  __x64_sys_ioctl+0x16/0x20
[  648.510410]  do_syscall_64+0x48/0x160
[  648.510537]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  648.510944] RIP: 0033:0x7fbd55e5a5d7

Caused when the call to vb2_core_queue_release is in parallel to the streamon
ioctl.

The last two patches:
media: mc-devnode.c: set devnode->media_dev to NULL upon release instead of unregister
media: vimc: Track the media device by calling v4l2_device_get/put

Make sure that the release callback of v4l2_dev will be called after the last
fh of the /dev/media* is closed. This is due to Hans Verkuil's comment:

https://lore.kernel.org/linux-media/a713212b-c760-f0c5-da5e-965d4fd87789@xs4all.nl/

The crashes are reproducible by running:

modprobe vimc
while [ 1 ]; do
    media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480],"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
    
    v4l2-ctl -d2 -v width=1920,height=1440
    v4l2-ctl -d0 -v pixelformat=BA81
    v4l2-ctl --stream-mmap -d /dev/video2 &
    echo -n vimc.0 >/sys/bus/platform/drivers/vimc/unbind
    echo -n vimc.0 >/sys/bus/platform/drivers/vimc/bind
done

It can be executed with
git clone https://gitlab.collabora.com/dafna/v4l2-crash-reproducers.git
cd cd v4l2-crash-reproducers/
./unbind-while-streaming.sh

Another thing I did in order to increase parallel execution is to add a patch to v4l-utils that deactivates the link
between "Debayer A" and the Scaler and activates the link between "RGB/YUV Input" and the Scaler.
https://gitlab.collabora.com/dafna/v4l-utils/commit/da0aa1802ea0b8e75cc1cf0d3bba3a379d58ba2e
and also load vimc with 'sca_mult=1'
This way the "RGB/YUV Capture" device is ready to stream right away without any configuration and so the script can be:

modprobe vimc sca_mult=1
while [ 1 ]; do
    v4l2-ctl --stream-mmap -d /dev/video2 &
    echo -n vimc.0 >/sys/bus/platform/drivers/vimc/unbind
    echo -n vimc.0 >/sys/bus/platform/drivers/vimc/bind
done

Changes since v3:
- add a more precise description of the first bug in the third patch and replace the crash report with the KASAN report
- add a fix to race condition when calling vb2_queue_release from unregistration while streaming.
- add a patch that makes sure that the release cb of v4l2_dev will execute after the last media fh in closed.

Patches Summary:

- The first patch replaces the usage of vimc_device.pdev.dev with vimc.mdev.dev
- The second patch allocates the vimc_device dynamically.
This is needed since the release of the device is deferred
and might run after the device is initialized again.
- The third patch solves the use-after-free bug by moving the release of the vimc_device
and all the vimc entities to the release callback of v4l2_device.
- The 4th patch locks vcap->lock before calling vb2_queue_release in the unregistration of the capture device
- The 5th patch is a preparation for the 8th patch - it makes sure that the devnode->media_dev is
set to null only after the mdev's release callback is called.
- the 6th patch implements a release callback for the media device that calls v4l2_device_put,
This make sure that the release callback of the v4l2_dev is called after the last /dev/media0 fh is closed.


Dafna Hirschfeld (6):
  media: vimc: replace vimc->pdev.dev with vimc->mdev.dev
  media: vimc: allocate vimc_device dynamically
  media: vimc: use-after-free fix - release vimc in the v4l_device
    release
  media: vimc: capture: crash fix - synchronize call to
    vb2_queue_release when unregistering
  media: mc-devnode.c: set devnode->media_dev to NULL upon release
    instead of unregister
  media: vimc: Track the media device by calling v4l2_device_get/put

 drivers/media/mc/mc-devnode.c              |   3 +-
 drivers/media/platform/vimc/vimc-capture.c |  20 ++--
 drivers/media/platform/vimc/vimc-common.c  |   2 -
 drivers/media/platform/vimc/vimc-common.h  |  30 +++---
 drivers/media/platform/vimc/vimc-core.c    | 111 +++++++++++++++------
 drivers/media/platform/vimc/vimc-debayer.c |  19 ++--
 drivers/media/platform/vimc/vimc-scaler.c  |  19 ++--
 drivers/media/platform/vimc/vimc-sensor.c  |  18 ++--
 8 files changed, 128 insertions(+), 94 deletions(-)

-- 
2.17.1

