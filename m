Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1DE21D500
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgGMLa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:30:59 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42053 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729457AbgGMLa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:30:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uwfYj6z2lGLmCuwfejB4uQ; Mon, 13 Jul 2020 13:30:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594639855; bh=Ij0NkbKl+uW5tAtjyQHiQCDuup36LREd1FEUKtx66Wo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=AZ8t31T5v81zDNPFvXNPKujGHQqz8zK4VjFovFv9sKZe2PaUNsOSF2xnpLxawTxtQ
         7JEsMOmS15ohWz+8udlyxA71Y8LG7tBQmhJdOY7cC7eAGxYcrLhRcqmU49L3OnhyVf
         WT76y4JL1NtHvaCmx4hjrXI3btcqij0oK5eHSQG+H1UvLs8Gg1JbX24LJ54rAwuESI
         ZSWm5o+HFm8iufmBrW6IJx1kthR9gaOxI9qP16X0tpa86Demk9ZJyJoWBaKmmkiKsE
         PC2kzm1q3cIPeUJt+vwxIsiHBlsjnlYQJ8c1/B3m7AaFDofdB1GwFWmL3uwxTFuaPV
         BWMfIwZ3sspiA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 5/7] media/usb: use vb2_video_unregister_device()
Date:   Mon, 13 Jul 2020 13:30:46 +0200
Message-Id: <20200713113048.1150542-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfITdU6KSQPq0aTLGGd39zJCYiZtad316SmmXci8O8UNejsZFEZHqcxUtF275BloNCixNV/d8/OE9NMMXcZahWIWn9RvOPVf0xuQJKNc7ofLXrhPG/kTt
 paAKeumLiUbj+viRIqWtZIJEwXhwxNYk6Cg7HT5otZZVuG2Xoc322OuU5UMoZcp8zo92yWQJaITtUfENBbHFE5rSzRY1Pryp8SEF4a1Dc3EE2J61ekKEHiwE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use vb2_video_unregister_device() to automatically stop streaming
at unregister time.

This avoids the use of vb2_queue_release() which should not be
called by drivers that set vdev->queue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/au0828/au0828-video.c  | 12 ++++--------
 drivers/media/usb/dvb-usb/cxusb-analog.c | 13 +++----------
 drivers/media/usb/usbtv/usbtv-video.c    |  4 +---
 3 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 51b8d14fb4dc..aa5bc6a2ae20 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -938,8 +938,8 @@ int au0828_analog_unregister(struct au0828_dev *dev)
 		return 0;
 
 	mutex_lock(&au0828_sysfs_lock);
-	video_unregister_device(&dev->vdev);
-	video_unregister_device(&dev->vbi_dev);
+	vb2_video_unregister_device(&dev->vdev);
+	vb2_video_unregister_device(&dev->vbi_dev);
 	mutex_unlock(&au0828_sysfs_lock);
 
 	v4l2_device_disconnect(&dev->v4l2_dev);
@@ -2011,8 +2011,7 @@ int au0828_analog_register(struct au0828_dev *dev,
 	if (retval != 0) {
 		dprintk(1, "unable to register video device (error = %d).\n",
 			retval);
-		ret = -ENODEV;
-		goto err_reg_vdev;
+		return -ENODEV;
 	}
 
 	/* Register the vbi device */
@@ -2040,10 +2039,7 @@ int au0828_analog_register(struct au0828_dev *dev,
 	return 0;
 
 err_reg_vbi_dev:
-	video_unregister_device(&dev->vdev);
-err_reg_vdev:
-	vb2_queue_release(&dev->vb_vidq);
-	vb2_queue_release(&dev->vb_vbiq);
+	vb2_video_unregister_device(&dev->vdev);
 	return ret;
 }
 
diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index 001cae648797..e93183ddd797 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -1615,8 +1615,6 @@ static void cxusb_medion_videodev_release(struct video_device *vdev)
 
 	cxusb_vprintk(dvbdev, OPS, "video device release\n");
 
-	vb2_queue_release(vdev->queue);
-
 	video_device_release(vdev);
 }
 
@@ -1647,8 +1645,7 @@ static int cxusb_medion_register_analog_video(struct dvb_usb_device *dvbdev)
 	cxdev->videodev = video_device_alloc();
 	if (!cxdev->videodev) {
 		dev_err(&dvbdev->udev->dev, "video device alloc failed\n");
-		ret = -ENOMEM;
-		goto ret_qrelease;
+		return -ENOMEM;
 	}
 
 	cxdev->videodev->device_caps = videocaps;
@@ -1674,10 +1671,6 @@ static int cxusb_medion_register_analog_video(struct dvb_usb_device *dvbdev)
 
 ret_vrelease:
 	video_device_release(cxdev->videodev);
-
-ret_qrelease:
-	vb2_queue_release(&cxdev->videoqueue);
-
 	return ret;
 }
 
@@ -1820,7 +1813,7 @@ int cxusb_medion_register_analog(struct dvb_usb_device *dvbdev)
 	return 0;
 
 ret_vunreg:
-	video_unregister_device(cxdev->videodev);
+	vb2_video_unregister_device(cxdev->videodev);
 
 ret_unregister:
 	v4l2_device_put(&cxdev->v4l2dev);
@@ -1836,7 +1829,7 @@ void cxusb_medion_unregister_analog(struct dvb_usb_device *dvbdev)
 	cxusb_vprintk(dvbdev, OPS, "unregistering analog\n");
 
 	video_unregister_device(cxdev->radiodev);
-	video_unregister_device(cxdev->videodev);
+	vb2_video_unregister_device(cxdev->videodev);
 
 	v4l2_device_put(&cxdev->v4l2dev);
 	wait_for_completion(&cxdev->v4l2_release);
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index c89efcd46163..3b4a2e769230 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -872,7 +872,6 @@ static void usbtv_release(struct v4l2_device *v4l2_dev)
 
 	v4l2_device_unregister(&usbtv->v4l2_dev);
 	v4l2_ctrl_handler_free(&usbtv->ctrl);
-	vb2_queue_release(&usbtv->vb2q);
 	kfree(usbtv);
 }
 
@@ -954,7 +953,6 @@ int usbtv_video_init(struct usbtv *usbtv)
 v4l2_fail:
 ctrl_fail:
 	v4l2_ctrl_handler_free(&usbtv->ctrl);
-	vb2_queue_release(&usbtv->vb2q);
 
 	return ret;
 }
@@ -965,7 +963,7 @@ void usbtv_video_free(struct usbtv *usbtv)
 	mutex_lock(&usbtv->v4l2_lock);
 
 	usbtv_stop(usbtv);
-	video_unregister_device(&usbtv->vdev);
+	vb2_video_unregister_device(&usbtv->vdev);
 	v4l2_device_disconnect(&usbtv->v4l2_dev);
 
 	mutex_unlock(&usbtv->v4l2_lock);
-- 
2.27.0

