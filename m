Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9605D2CA305
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387510AbgLAMpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:45:35 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:53491 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728987AbgLAMpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:45:34 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k51SkssSADuFjk51Xk2RYx; Tue, 01 Dec 2020 13:44:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606826692; bh=BXusA+CIrGWKf3/SqjzlEkdnmGnMvYpEsKkSCTIgqf4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=hPXZOzwnXkbSMENcwuqypNtDTdcNV+DfV300uarPRKeVyHLF/8/PyGIXnNHi99h/g
         fZMwpgsThI5xOtG/uYwh6RCbHRFel/fpuzqnOOn641JDqqNAvq1fbh7fELbP/v/nrE
         GWFT4SSqdP/2eygWjDa2xOOeUoLOa2OSWepfJTPoDOBIduBmJT8gH3EEo88gGQ1ab2
         dUGhhtPi7YHT+KxC2qZwZuxvoUPJtwmUQ4sNrLA9bDMW+dfYmy4O5JFm8XIP91xSXZ
         8l3FHpNFP2UcSWQQRIpRaXPEOxCh2xdoYgWnKfVWy9KjpqN7AEw0L+VAM4/+jEcMw5
         NGT7X/5Coa8Pw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Alexandre Courbot <gnurou@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 5/7] vivid: call v4l2_event_wake_all() on disconnect
Date:   Tue,  1 Dec 2020 13:44:44 +0100
Message-Id: <20201201124446.448595-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
References: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMpvkjAk6HI2j3BveW2MEiCLvzzeRn4nnBO1V+ZM2q1Y2N6RUcSw8tTmOeRBj720LACdfRQKS6lKxmZf0IA1VBi176pkOz94HuIUN5ejM+oQDNve9s2j
 FT/XqBztnHKZqx7uUyd4pwR0S6tIPGDzzwA7xgVn7c/LeKSY+gnXNsmLzw5HOTL2MWcXoaze0r0+PnSI3u3uZzUMrYLvah+1NqcbUsnrYnyw5CTF1POWvWj5
 iIfUzUGIFnPwd+jQq6loI/HX7KoQKJSH8XtwhtS8rvKvtXsmn3pF17jScEBzdmH+8vlxZI1DG/o6rvgJBh72CtGC12ghXWXpvLxcfsX5P+A=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the disconnect error injection control is set, then besides
faking unregistering the device nodes, also call v4l2_event_wake_all()
to ensure any userspace applications will wake up as per a 'normal'
unregister.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 38 +++++++++----------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 11e3b5617f52..7957eadf3e2b 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -100,6 +100,14 @@
 
 /* General User Controls */
 
+static void vivid_unregister_dev(bool valid, struct video_device *vdev)
+{
+	if (!valid)
+		return;
+	clear_bit(V4L2_FL_REGISTERED, &vdev->flags);
+	v4l2_event_wake_all(vdev);
+}
+
 static int vivid_user_gen_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_user_gen);
@@ -108,26 +116,16 @@ static int vivid_user_gen_s_ctrl(struct v4l2_ctrl *ctrl)
 	case VIVID_CID_DISCONNECT:
 		v4l2_info(&dev->v4l2_dev, "disconnect\n");
 		dev->disconnect_error = true;
-		if (dev->has_vid_cap)
-			clear_bit(V4L2_FL_REGISTERED, &dev->vid_cap_dev.flags);
-		if (dev->has_vid_out)
-			clear_bit(V4L2_FL_REGISTERED, &dev->vid_out_dev.flags);
-		if (dev->has_vbi_cap)
-			clear_bit(V4L2_FL_REGISTERED, &dev->vbi_cap_dev.flags);
-		if (dev->has_vbi_out)
-			clear_bit(V4L2_FL_REGISTERED, &dev->vbi_out_dev.flags);
-		if (dev->has_radio_rx)
-			clear_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
-		if (dev->has_radio_tx)
-			clear_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
-		if (dev->has_sdr_cap)
-			clear_bit(V4L2_FL_REGISTERED, &dev->sdr_cap_dev.flags);
-		if (dev->has_meta_cap)
-			clear_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
-		if (dev->has_meta_out)
-			clear_bit(V4L2_FL_REGISTERED, &dev->meta_out_dev.flags);
-		if (dev->has_touch_cap)
-			clear_bit(V4L2_FL_REGISTERED, &dev->touch_cap_dev.flags);
+		vivid_unregister_dev(dev->has_vid_cap, &dev->vid_cap_dev);
+		vivid_unregister_dev(dev->has_vid_out, &dev->vid_out_dev);
+		vivid_unregister_dev(dev->has_vbi_cap, &dev->vbi_cap_dev);
+		vivid_unregister_dev(dev->has_vbi_out, &dev->vbi_out_dev);
+		vivid_unregister_dev(dev->has_radio_rx, &dev->radio_rx_dev);
+		vivid_unregister_dev(dev->has_radio_tx, &dev->radio_tx_dev);
+		vivid_unregister_dev(dev->has_sdr_cap, &dev->sdr_cap_dev);
+		vivid_unregister_dev(dev->has_meta_cap, &dev->meta_cap_dev);
+		vivid_unregister_dev(dev->has_meta_out, &dev->meta_out_dev);
+		vivid_unregister_dev(dev->has_touch_cap, &dev->touch_cap_dev);
 		break;
 	case VIVID_CID_BUTTON:
 		dev->button_pressed = 30;
-- 
2.29.2

