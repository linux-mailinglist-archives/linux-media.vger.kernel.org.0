Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B062C830F
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 12:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgK3LSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 06:18:17 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50055 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725902AbgK3LSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 06:18:16 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id jhBRkmT1KkGBYjhBVkUelv; Mon, 30 Nov 2020 12:17:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606735053; bh=OC9ea8HZxvPJi0Nvtju/i5YzA1QkLLog/ef02+Xbqo0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=t9Jfhe45ZV44DM5DW3HYhcymd4joAMOC6LzCAGsUaEdnpXT+8V4bmhh/JRDXxUFha
         hn2IPToxh2UCLnnUGwWiY4lfzXBOmETQkxeuomkYythOQN12iMSyaNe1UUfMKG1J0C
         jPpsMF1358DyMQINGnoBlh423FOILZvZkNIBpaFWzKP1vWx7IPSLu+pS6A3exgvf4Z
         f59S3u0c+npyY6nfRfRYKqDCc6MFwxuYhsp/K0VnCs+0ZtFRDGqq/i/3QV8geYqlqV
         4ckkZzlqt2JZZ+w6yRIbmmb59Eol15Z3GB7zr0huqGjilBoJ6sEcdHPCRJya05f1Bb
         t/OcaKkQveErw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] vivid: fix 'disconnect' error injection
Message-ID: <74c0afae-3925-29c2-fa73-6c773c8d10c6@xs4all.nl>
Date:   Mon, 30 Nov 2020 12:17:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEDqp1/iRCTDi5ZvFr4mGu9lBwB+yJ3NYB382Oc88AwsOcKsOqmSjmj8DXXkgHyE2TSory/wkKEr4xa4Zh1j8JHFgmAGwB/jS+el9zLjhsMan5Cd4mw0
 VWTKO43QgYn/eCYfUdwr/WdhCyDCZkwP8bGG9Fp9dlowCmk9+ZY/ZSAjLuSNL4Y5X7UBeRBlKQDd8RWW5o9pxFHE43BqFz4cfr4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 'disconnect' error injection functionality suffered from bit rot.

New device nodes were added without updating vivid_user_gen_s_ctrl(), so
that function had to be updated for the new device nodes.

Also, vivid didn't check if specific device nodes were actually ever created,
so the vivid_is_last_user() would fail on that (it would return true
instead of false in that case).

Finally, selecting Disconnect, then unbind the vivid driver would fail since
the remove() would think that the device nodes were already unregistered.
Keep track of whether disconnect was pressed and re-register the device nodes
in remove() before doing the real unregister.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index aa8d350fd682..5ddd31fdf102 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -547,11 +547,13 @@ static int vivid_s_fmt_cap_mplane(struct file *file, void *priv,
 	return vidioc_s_fmt_vid_cap_mplane(file, priv, f);
 }

-static bool vivid_is_in_use(struct video_device *vdev)
+static bool vivid_is_in_use(bool valid, struct video_device *vdev)
 {
 	unsigned long flags;
 	bool res;

+	if (!valid)
+		return false;
 	spin_lock_irqsave(&vdev->fh_lock, flags);
 	res = !list_empty(&vdev->fh_list);
 	spin_unlock_irqrestore(&vdev->fh_lock, flags);
@@ -560,20 +562,45 @@ static bool vivid_is_in_use(struct video_device *vdev)

 static bool vivid_is_last_user(struct vivid_dev *dev)
 {
-	unsigned uses = vivid_is_in_use(&dev->vid_cap_dev) +
-			vivid_is_in_use(&dev->vid_out_dev) +
-			vivid_is_in_use(&dev->vbi_cap_dev) +
-			vivid_is_in_use(&dev->vbi_out_dev) +
-			vivid_is_in_use(&dev->sdr_cap_dev) +
-			vivid_is_in_use(&dev->radio_rx_dev) +
-			vivid_is_in_use(&dev->radio_tx_dev) +
-			vivid_is_in_use(&dev->meta_cap_dev) +
-			vivid_is_in_use(&dev->meta_out_dev) +
-			vivid_is_in_use(&dev->touch_cap_dev);
+	unsigned uses = vivid_is_in_use(dev->has_vid_cap, &dev->vid_cap_dev) +
+			vivid_is_in_use(dev->has_vid_out, &dev->vid_out_dev) +
+			vivid_is_in_use(dev->has_vbi_cap, &dev->vbi_cap_dev) +
+			vivid_is_in_use(dev->has_vbi_out, &dev->vbi_out_dev) +
+			vivid_is_in_use(dev->has_radio_rx, &dev->radio_rx_dev) +
+			vivid_is_in_use(dev->has_radio_tx, &dev->radio_tx_dev) +
+			vivid_is_in_use(dev->has_sdr_cap, &dev->sdr_cap_dev) +
+			vivid_is_in_use(dev->has_meta_cap, &dev->meta_cap_dev) +
+			vivid_is_in_use(dev->has_meta_out, &dev->meta_out_dev) +
+			vivid_is_in_use(dev->has_touch_cap, &dev->touch_cap_dev);

 	return uses == 1;
 }

+static void vivid_reconnect(struct vivid_dev *dev)
+{
+	if (dev->has_vid_cap)
+		set_bit(V4L2_FL_REGISTERED, &dev->vid_cap_dev.flags);
+	if (dev->has_vid_out)
+		set_bit(V4L2_FL_REGISTERED, &dev->vid_out_dev.flags);
+	if (dev->has_vbi_cap)
+		set_bit(V4L2_FL_REGISTERED, &dev->vbi_cap_dev.flags);
+	if (dev->has_vbi_out)
+		set_bit(V4L2_FL_REGISTERED, &dev->vbi_out_dev.flags);
+	if (dev->has_radio_rx)
+		set_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
+	if (dev->has_radio_tx)
+		set_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
+	if (dev->has_sdr_cap)
+		set_bit(V4L2_FL_REGISTERED, &dev->sdr_cap_dev.flags);
+	if (dev->has_meta_cap)
+		set_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
+	if (dev->has_meta_out)
+		set_bit(V4L2_FL_REGISTERED, &dev->meta_out_dev.flags);
+	if (dev->has_touch_cap)
+		set_bit(V4L2_FL_REGISTERED, &dev->touch_cap_dev.flags);
+	dev->disconnect_error = false;
+}
+
 static int vivid_fop_release(struct file *file)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -581,23 +608,15 @@ static int vivid_fop_release(struct file *file)

 	mutex_lock(&dev->mutex);
 	if (!no_error_inj && v4l2_fh_is_singular_file(file) &&
-	    !video_is_registered(vdev) && vivid_is_last_user(dev)) {
+	    dev->disconnect_error && !video_is_registered(vdev) &&
+	    vivid_is_last_user(dev)) {
 		/*
 		 * I am the last user of this driver, and a disconnect
 		 * was forced (since this video_device is unregistered),
 		 * so re-register all video_device's again.
 		 */
 		v4l2_info(&dev->v4l2_dev, "reconnect\n");
-		set_bit(V4L2_FL_REGISTERED, &dev->vid_cap_dev.flags);
-		set_bit(V4L2_FL_REGISTERED, &dev->vid_out_dev.flags);
-		set_bit(V4L2_FL_REGISTERED, &dev->vbi_cap_dev.flags);
-		set_bit(V4L2_FL_REGISTERED, &dev->vbi_out_dev.flags);
-		set_bit(V4L2_FL_REGISTERED, &dev->sdr_cap_dev.flags);
-		set_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
-		set_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
-		set_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
-		set_bit(V4L2_FL_REGISTERED, &dev->meta_out_dev.flags);
-		set_bit(V4L2_FL_REGISTERED, &dev->touch_cap_dev.flags);
+		vivid_reconnect(dev);
 	}
 	mutex_unlock(&dev->mutex);
 	if (file->private_data == dev->overlay_cap_owner)
@@ -1968,6 +1987,8 @@ static int vivid_remove(struct platform_device *pdev)
 		if (!dev)
 			continue;

+		if (dev->disconnect_error)
+			vivid_reconnect(dev);
 #ifdef CONFIG_MEDIA_CONTROLLER
 		media_device_unregister(&dev->mdev);
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index 99e69b8f770f..9c2d1470b597 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -303,6 +303,7 @@ struct vivid_dev {
 	struct fb_fix_screeninfo	fb_fix;

 	/* Error injection */
+	bool				disconnect_error;
 	bool				queue_setup_error;
 	bool				buf_prepare_error;
 	bool				start_streaming_error;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 334130568dcb..11e3b5617f52 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -107,14 +107,27 @@ static int vivid_user_gen_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case VIVID_CID_DISCONNECT:
 		v4l2_info(&dev->v4l2_dev, "disconnect\n");
-		clear_bit(V4L2_FL_REGISTERED, &dev->vid_cap_dev.flags);
-		clear_bit(V4L2_FL_REGISTERED, &dev->vid_out_dev.flags);
-		clear_bit(V4L2_FL_REGISTERED, &dev->vbi_cap_dev.flags);
-		clear_bit(V4L2_FL_REGISTERED, &dev->vbi_out_dev.flags);
-		clear_bit(V4L2_FL_REGISTERED, &dev->sdr_cap_dev.flags);
-		clear_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
-		clear_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
-		clear_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
+		dev->disconnect_error = true;
+		if (dev->has_vid_cap)
+			clear_bit(V4L2_FL_REGISTERED, &dev->vid_cap_dev.flags);
+		if (dev->has_vid_out)
+			clear_bit(V4L2_FL_REGISTERED, &dev->vid_out_dev.flags);
+		if (dev->has_vbi_cap)
+			clear_bit(V4L2_FL_REGISTERED, &dev->vbi_cap_dev.flags);
+		if (dev->has_vbi_out)
+			clear_bit(V4L2_FL_REGISTERED, &dev->vbi_out_dev.flags);
+		if (dev->has_radio_rx)
+			clear_bit(V4L2_FL_REGISTERED, &dev->radio_rx_dev.flags);
+		if (dev->has_radio_tx)
+			clear_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
+		if (dev->has_sdr_cap)
+			clear_bit(V4L2_FL_REGISTERED, &dev->sdr_cap_dev.flags);
+		if (dev->has_meta_cap)
+			clear_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
+		if (dev->has_meta_out)
+			clear_bit(V4L2_FL_REGISTERED, &dev->meta_out_dev.flags);
+		if (dev->has_touch_cap)
+			clear_bit(V4L2_FL_REGISTERED, &dev->touch_cap_dev.flags);
 		break;
 	case VIVID_CID_BUTTON:
 		dev->button_pressed = 30;
