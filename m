Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1A944E58B
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 12:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbhKLL04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 06:26:56 -0500
Received: from comms.puri.sm ([159.203.221.185]:53656 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233994AbhKLL04 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 06:26:56 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 8A8FBDFA6F;
        Fri, 12 Nov 2021 03:23:35 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id F1GOtOt6xPQQ; Fri, 12 Nov 2021 03:23:34 -0800 (PST)
Message-ID: <ab8929d22461300f0f167ab44e1b5c902dde5fcd.camel@puri.sm>
Subject: [BUG] media: imx: imx7-media-csi issue with vb2 is hanging /
 freezing the system
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com,
        slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org
Cc:     linux-imx@nxp.com, kernel@puri.sm, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date:   Fri, 12 Nov 2021 12:23:29 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi Laurent and all who it may concern,

Ever since I switches to using imx7-media-csi on imx8mq I have seen a
bug that hangs /freezes the system so that I can't really save a trace
or get logs for it. It happens not every time when starting streaming,
but sometimes - when starting to stream frames.

It kind of looks like a lock not released or something similar, but
some race condition might happen since it's happening every 2 to 10
times.

For me, when it fails, it fails the first time when starting to stream
after rebooting. If it succeeds that first time, it continues to
succeed, until I reboot.

The last logs I can see currently in the failing case are

[   37.811693] videobuf2_common: [cap-00000000e2303470]
__setup_offsets: buffer 0, plane 0 offset 0x00000000
[   37.824161] videobuf2_common: [cap-00000000e2303470]
__setup_offsets: buffer 1, plane 0 offset 0x003d0000
[   37.836844] videobuf2_common: [cap-00000000e2303470]
__setup_offsets: buffer 2, plane 0 offset 0x007a0000
[   37.849406] videobuf2_common: [cap-00000000e2303470]
__setup_offsets: buffer 3, plane 0 offset 0x00b70000
[   37.860091] videobuf2_common: [cap-00000000e2303470]
__vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
[   37.870770] videobuf2_common: [cap-00000000e2303470] vb2_mmap:
buffer 0, plane 0 successfully mapped
[   37.880155] videobuf2_common: [cap-00000000e2303470] vb2_mmap:
buffer 1, plane 0 successfully mapped
[   37.889532] videobuf2_common: [cap-00000000e2303470] vb2_mmap:
buffer 2, plane 0 successfully mapped
[   37.898880] videobuf2_common: [cap-00000000e2303470] vb2_mmap:
buffer 3, plane 0 successfully mapped
[   37.908127] videobuf2_common: [cap-00000000e2303470] vb2_core_qbuf:
qbuf of buffer 0 succeeded
[   37.916949] videobuf2_common: [cap-00000000e2303470] vb2_core_qbuf:
qbuf of buffer 1 succeeded
[   37.925659] videobuf2_common: [cap-00000000e2303470] vb2_core_qbuf:
qbuf of buffer 2 succeeded
[   37.934395] videobuf2_common: [cap-00000000e2303470] vb2_core_qbuf:
qbuf of buffer 3 succeeded
[   38.077613] videobuf2_common: [cap-00000000e2303470]
vb2_core_streamon: successful
[   38.085523] videobuf2_common: [cap-00000000e2303470]
__vb2_wait_for_done_vb: will sleep waiting for buffers


but sometimes I see it hang a few lines later:

[   60.996573] videobuf2_common: [cap-00000000eb3bac3a]
__vb2_wait_for_done_vb: will sleep waiting for b
uffers
[   61.048564] imx7_csi_vb2_buf_done: start
[   61.052514] videobuf2_common: vb2_buffer_done: start
[   61.057478] videobuf2_common: [cap-00000000eb3bac3a]
vb2_buffer_done: done processing on buffer 0, st
ate: done
[   61.067479] videobuf2_common: [cap-00000000eb3bac3a]
__vb2_buf_mem_finish: call_memop(0, finish)
[   61.076268] videobuf2_common: vb2_buffer_done: waking up done_wq


the vb2 logs with advanced debugging preceding these, are identical in
the success and failing case.

With the exact same sensor driver but the nxp CSI driver
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/mx6s_capture.c?h=imx_5.4.0_8dxlphantom_er
is never happened (and the mipi driver is most likely not the issue
since it's controller config that should be exactly the same as well).

In the success case then imx7_csi_vb2_buf_done() gets called then.

I'm quite confident now that it's a bug in imx7-media-csi since it uses
the buffers.

So what's happening? I really don't yet know. Any idea?

thank you,

                                 martin



and the success case continues like so (with some more debug prints
that in mainline):

[   26.493415] videobuf2_common: [cap-00000000500f079b]
__vb2_wait_for_done_vb: will sleep waiting for b
uffers
[   26.531273] imx7_csi_vb2_buf_done: start
[   26.535238] videobuf2_common: [cap-00000000500f079b]
vb2_buffer_done: done processing on buffer 0, st
ate: done
[   26.545261] videobuf2_common: vb2_buffer_done: waking up done_wq
[   26.551284] imx_media_capture_device_next_buf: start
[   26.551294] videobuf2_common: [cap-00000000500f079b]
__vb2_wait_for_done_vb: loop done
[   26.556259] imx_media_capture_device_next_buf: ok
[   26.563269] imx7_csi_vb2_buf_done: start

and so on

