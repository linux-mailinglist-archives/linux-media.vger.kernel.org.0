Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5116049AF0E
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 10:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1454398AbiAYI7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 03:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1453990AbiAYI47 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 03:56:59 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AD5C049659
        for <linux-media@vger.kernel.org>; Tue, 25 Jan 2022 00:02:54 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:1137:e00:5903:19ba:8e99:7984])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 902951F43DF6;
        Tue, 25 Jan 2022 08:02:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1643097772;
        bh=mRWyYPD25EmQc8phqM/FG1Cd29sqr2lIW7VOtpB6p6U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W7zkI2X11EdZoIdo0toBM55Khwb2tJrA/TMJ5ewsll4zrUkikOb2cIpUhinP5+T2k
         nl228PrkYZVRRzDG5+AbVTM4IjrEjnhRw0X11A//SWjgvB/+ebnPkzkNDN1C9VSsgE
         8vsEdXnnWkgH8LbXK1GKpYB2SBMNlFO4faTHrIlbrbjq1iw/xBIwhoaemQeh9SCMuN
         VZNS4huGNe0P0zi+as+7bjkGx7SZKZMPVoCWsgCNqqRuDv6L9346K3kJZ2+QQDRkBa
         atE546op7lZlZK89Oz2V1/vOyZnn/cu8bx12mZAAkd0LVhayhTPFDUcylHFbqK0rTp
         zMW4teGscCSlg==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        hch@lst.de, dafna3@gmail.com
Subject: [PATCH v2 2/4] media: stk1160: If start stream fails, return buffers with VB2_BUF_STATE_QUEUED
Date:   Tue, 25 Jan 2022 10:02:11 +0200
Message-Id: <20220125080213.30090-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125080213.30090-1-dafna.hirschfeld@collabora.com>
References: <20220125080213.30090-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the callback 'start_streaming' fails, then all
queued buffers in the driver should be returned with
state 'VB2_BUF_STATE_QUEUED'. Currently, they are
returned with 'VB2_BUF_STATE_ERROR' which is wrong.
Fix this. This also fixes the warning:

[   65.583633] WARNING: CPU: 5 PID: 593 at drivers/media/common/videobuf2/videobuf2-core.c:1612 vb2_start_streaming+0xd4/0x160 [videobuf2_common]
[   65.585027] Modules linked in: snd_usb_audio snd_hwdep snd_usbmidi_lib snd_rawmidi snd_soc_hdmi_codec dw_hdmi_i2s_audio saa7115 stk1160 videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc crct10dif_ce panfrost snd_soc_simple_card snd_soc_audio_graph_card snd_soc_spdif_tx snd_soc_simple_card_utils gpu_sched phy_rockchip_pcie snd_soc_rockchip_i2s rockchipdrm analogix_dp dw_mipi_dsi dw_hdmi cec drm_kms_helper drm rtc_rk808 rockchip_saradc industrialio_triggered_buffer kfifo_buf rockchip_thermal pcie_rockchip_host ip_tables x_tables ipv6
[   65.589383] CPU: 5 PID: 593 Comm: v4l2src0:src Tainted: G        W         5.16.0-rc4-62408-g32447129cb30-dirty #14
[   65.590293] Hardware name: Radxa ROCK Pi 4B (DT)
[   65.590696] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   65.591304] pc : vb2_start_streaming+0xd4/0x160 [videobuf2_common]
[   65.591850] lr : vb2_start_streaming+0x6c/0x160 [videobuf2_common]
[   65.592395] sp : ffff800012bc3ad0
[   65.592685] x29: ffff800012bc3ad0 x28: 0000000000000000 x27: ffff800012bc3cd8
[   65.593312] x26: 0000000000000000 x25: ffff00000d8a7800 x24: 0000000040045612
[   65.593938] x23: ffff800011323000 x22: ffff800012bc3cd8 x21: ffff00000908a8b0
[   65.594562] x20: ffff00000908a8c8 x19: 00000000fffffff4 x18: ffffffffffffffff
[   65.595188] x17: 000000040044ffff x16: 00400034b5503510 x15: ffff800011323f78
[   65.595813] x14: ffff000013163886 x13: ffff000013163885 x12: 00000000000002ce
[   65.596439] x11: 0000000000000028 x10: 0000000000000001 x9 : 0000000000000228
[   65.597064] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff726c5e78
[   65.597690] x5 : ffff800012bc3990 x4 : 0000000000000000 x3 : ffff000009a34880
[   65.598315] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000007cd99f0
[   65.598940] Call trace:
[   65.599155]  vb2_start_streaming+0xd4/0x160 [videobuf2_common]
[   65.599672]  vb2_core_streamon+0x17c/0x1a8 [videobuf2_common]
[   65.600179]  vb2_streamon+0x54/0x88 [videobuf2_v4l2]
[   65.600619]  vb2_ioctl_streamon+0x54/0x60 [videobuf2_v4l2]
[   65.601103]  v4l_streamon+0x3c/0x50 [videodev]
[   65.601521]  __video_do_ioctl+0x1a4/0x428 [videodev]
[   65.601977]  video_usercopy+0x320/0x828 [videodev]
[   65.602419]  video_ioctl2+0x3c/0x58 [videodev]
[   65.602830]  v4l2_ioctl+0x60/0x90 [videodev]
[   65.603227]  __arm64_sys_ioctl+0xa8/0xe0
[   65.603576]  invoke_syscall+0x54/0x118
[   65.603911]  el0_svc_common.constprop.3+0x84/0x100
[   65.604332]  do_el0_svc+0x34/0xa0
[   65.604625]  el0_svc+0x1c/0x50
[   65.604897]  el0t_64_sync_handler+0x88/0xb0
[   65.605264]  el0t_64_sync+0x16c/0x170
[   65.605587] ---[ end trace 578e0ba07742170d ]---

Fixes: 8ac456495a33d ("[media] stk1160: Stop device and unqueue buffers when start_streaming() fails")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/usb/stk1160/stk1160-core.c |  2 +-
 drivers/media/usb/stk1160/stk1160-v4l.c  | 10 +++++-----
 drivers/media/usb/stk1160/stk1160.h      |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-core.c b/drivers/media/usb/stk1160/stk1160-core.c
index 4e1698f78818..ce717502ea4c 100644
--- a/drivers/media/usb/stk1160/stk1160-core.c
+++ b/drivers/media/usb/stk1160/stk1160-core.c
@@ -403,7 +403,7 @@ static void stk1160_disconnect(struct usb_interface *interface)
 	/* Here is the only place where isoc get released */
 	stk1160_uninit_isoc(dev);
 
-	stk1160_clear_queue(dev);
+	stk1160_clear_queue(dev, VB2_BUF_STATE_ERROR);
 
 	video_unregister_device(&dev->vdev);
 	v4l2_device_disconnect(&dev->v4l2_dev);
diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index 6a4eb616d516..1aa953469402 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -258,7 +258,7 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 	stk1160_uninit_isoc(dev);
 out_stop_hw:
 	usb_set_interface(dev->udev, 0, 0);
-	stk1160_clear_queue(dev);
+	stk1160_clear_queue(dev, VB2_BUF_STATE_QUEUED);
 
 	mutex_unlock(&dev->v4l_lock);
 
@@ -306,7 +306,7 @@ static int stk1160_stop_streaming(struct stk1160 *dev)
 
 	stk1160_stop_hw(dev);
 
-	stk1160_clear_queue(dev);
+	stk1160_clear_queue(dev, VB2_BUF_STATE_ERROR);
 
 	stk1160_dbg("streaming stopped\n");
 
@@ -745,7 +745,7 @@ static const struct video_device v4l_template = {
 /********************************************************************/
 
 /* Must be called with both v4l_lock and vb_queue_lock hold */
-void stk1160_clear_queue(struct stk1160 *dev)
+void stk1160_clear_queue(struct stk1160 *dev, enum vb2_buffer_state vb2_state)
 {
 	struct stk1160_buffer *buf;
 	unsigned long flags;
@@ -756,7 +756,7 @@ void stk1160_clear_queue(struct stk1160 *dev)
 		buf = list_first_entry(&dev->avail_bufs,
 			struct stk1160_buffer, list);
 		list_del(&buf->list);
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&buf->vb.vb2_buf, vb2_state);
 		stk1160_dbg("buffer [%p/%d] aborted\n",
 			    buf, buf->vb.vb2_buf.index);
 	}
@@ -766,7 +766,7 @@ void stk1160_clear_queue(struct stk1160 *dev)
 		buf = dev->isoc_ctl.buf;
 		dev->isoc_ctl.buf = NULL;
 
-		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&buf->vb.vb2_buf, vb2_state);
 		stk1160_dbg("buffer [%p/%d] aborted\n",
 			    buf, buf->vb.vb2_buf.index);
 	}
diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
index a31ea1c80f25..a70963ce8753 100644
--- a/drivers/media/usb/stk1160/stk1160.h
+++ b/drivers/media/usb/stk1160/stk1160.h
@@ -166,7 +166,7 @@ struct regval {
 int stk1160_vb2_setup(struct stk1160 *dev);
 int stk1160_video_register(struct stk1160 *dev);
 void stk1160_video_unregister(struct stk1160 *dev);
-void stk1160_clear_queue(struct stk1160 *dev);
+void stk1160_clear_queue(struct stk1160 *dev, enum vb2_buffer_state vb2_state);
 
 /* Provided by stk1160-video.c */
 int stk1160_alloc_isoc(struct stk1160 *dev);
-- 
2.17.1

