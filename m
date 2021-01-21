Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DAC2FE332
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 07:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbhAUGrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 01:47:08 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:38066 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbhAUGq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 01:46:56 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L6fPsv127833;
        Thu, 21 Jan 2021 06:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=seQuyGYo9v2lH1z0iBy3n60lw8YL3g3G68Vu2n7+Hyw=;
 b=palL15T3H+fNI1xmekxgngojpb5Z645duxGw706fOh6iDdxPaj3PnYKQCaqVhpOav8WX
 Tm5oMg215PIbGmy3DGyfrCUhYaKS6sWvGyrKNXu+/uPvIEQCdDc7rD/0ZO+xm7hexDwk
 LOA8Wow4WyWzgpcg3PYwat/JVGsGt8veIfYyOqAhFY+2B1fPJPe6WYqmouwjKHPjRonh
 dk2SdLAtIsKi0CwBDFwQvMoSaHV/8f29l1nSA7BasreLOjd103k9tG5u1xyRMhtV7LFc
 brJ1FzopWO7yfmOTXW8VMnyNLmyIYguUyfNUWvrKjo8bHO+3jZwMVz/eo8xb9FdjUGCg rQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 3668qrduqk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jan 2021 06:46:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L6TrNI171311;
        Thu, 21 Jan 2021 06:44:08 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 3668rf71gr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Jan 2021 06:44:08 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10L6i74d014380;
        Thu, 21 Jan 2021 06:44:07 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 20 Jan 2021 22:44:06 -0800
Date:   Thu, 21 Jan 2021 09:44:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Antoine Jacquet <royale@zerezo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] media: zr364xx: fix memory leaks in probe()
Message-ID: <YAkisFB1Ly0e2pPe@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <196887f5-677f-0aeb-5f5c-fb4a918d6128@xs4all.nl>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210033
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210033
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot discovered that the probe error handling doesn't clean up the
resources allocated in zr364xx_board_init().  There are several
related bugs in this code so I have re-written the error handling.

1)  Introduce a new function zr364xx_board_uninit() which cleans up
    the resources in zr364xx_board_init().
2)  In zr364xx_board_init() if the call to zr364xx_start_readpipe()
    fails then release the "cam->buffer.frame[i].lpvbits" memory
    before returning.  This way every function either allocates
    everything successfully or it cleans up after itself.
3)  Re-write the probe function so that each failure path goto frees
    the most recent allocation.  That way we don't free anything
    before it has been allocated and we can also verify that
    everything is freed.
4)  Originally, in the probe function the "cam->v4l2_dev.release"
    pointer was set to "zr364xx_release" near the start but I moved
    that assignment to the end, after everything had succeeded.  The
    release function was never actually called during the probe cleanup
    process, but with this change I wanted to make it clear that we
    don't want to call zr364xx_release() until everything is
    allocated successfully.

Next I re-wrote the zr364xx_release() function.  Ideally this would
have been a simple matter of copy and pasting the cleanup code from
probe and adding an additional call to video_unregister_device().  But
there are a couple quirks to note.

1)  The probe function does not call videobuf_mmap_free() and I don't
    know where the videobuf_mmap is allocated.  I left the code as-is to
    avoid introducing a bug in code I don't understand.
2)  The zr364xx_board_uninit() has a call to zr364xx_stop_readpipe()
    which is a change from the original behavior with regards to
    unloading the driver.  Calling zr364xx_stop_readpipe() on a stopped
    pipe is not a problem so this is safe and is potentially a bugfix.

Reported-by: syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
v2: The first version introduced a double call of video_unregister_device()
    in the unload path.

 drivers/media/usb/zr364xx/zr364xx.c | 49 ++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index 1e1c6b4d1874..d29b861367ea 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -1181,15 +1181,11 @@ static int zr364xx_open(struct file *file)
 	return err;
 }
 
-static void zr364xx_release(struct v4l2_device *v4l2_dev)
+static void zr364xx_board_uninit(struct zr364xx_camera *cam)
 {
-	struct zr364xx_camera *cam =
-		container_of(v4l2_dev, struct zr364xx_camera, v4l2_dev);
 	unsigned long i;
 
-	v4l2_device_unregister(&cam->v4l2_dev);
-
-	videobuf_mmap_free(&cam->vb_vidq);
+	zr364xx_stop_readpipe(cam);
 
 	/* release sys buffers */
 	for (i = 0; i < FRAMES; i++) {
@@ -1200,9 +1196,19 @@ static void zr364xx_release(struct v4l2_device *v4l2_dev)
 		cam->buffer.frame[i].lpvbits = NULL;
 	}
 
-	v4l2_ctrl_handler_free(&cam->ctrl_handler);
 	/* release transfer buffer */
 	kfree(cam->pipe->transfer_buffer);
+}
+
+static void zr364xx_release(struct v4l2_device *v4l2_dev)
+{
+	struct zr364xx_camera *cam =
+		container_of(v4l2_dev, struct zr364xx_camera, v4l2_dev);
+
+	videobuf_mmap_free(&cam->vb_vidq);
+	v4l2_ctrl_handler_free(&cam->ctrl_handler);
+	zr364xx_board_uninit(cam);
+	v4l2_device_unregister(&cam->v4l2_dev);
 	kfree(cam);
 }
 
@@ -1376,11 +1382,14 @@ static int zr364xx_board_init(struct zr364xx_camera *cam)
 	/* start read pipe */
 	err = zr364xx_start_readpipe(cam);
 	if (err)
-		goto err_free;
+		goto err_free_frames;
 
 	DBG(": board initialized\n");
 	return 0;
 
+err_free_frames:
+	for (i = 0; i < FRAMES; i++)
+		vfree(cam->buffer.frame[i].lpvbits);
 err_free:
 	kfree(cam->pipe->transfer_buffer);
 	cam->pipe->transfer_buffer = NULL;
@@ -1409,12 +1418,10 @@ static int zr364xx_probe(struct usb_interface *intf,
 	if (!cam)
 		return -ENOMEM;
 
-	cam->v4l2_dev.release = zr364xx_release;
 	err = v4l2_device_register(&intf->dev, &cam->v4l2_dev);
 	if (err < 0) {
 		dev_err(&udev->dev, "couldn't register v4l2_device\n");
-		kfree(cam);
-		return err;
+		goto free_cam;
 	}
 	hdl = &cam->ctrl_handler;
 	v4l2_ctrl_handler_init(hdl, 1);
@@ -1423,7 +1430,7 @@ static int zr364xx_probe(struct usb_interface *intf,
 	if (hdl->error) {
 		err = hdl->error;
 		dev_err(&udev->dev, "couldn't register control\n");
-		goto fail;
+		goto unregister;
 	}
 	/* save the init method used by this camera */
 	cam->method = id->driver_info;
@@ -1496,7 +1503,7 @@ static int zr364xx_probe(struct usb_interface *intf,
 	if (!cam->read_endpoint) {
 		err = -ENOMEM;
 		dev_err(&intf->dev, "Could not find bulk-in endpoint\n");
-		goto fail;
+		goto unregister;
 	}
 
 	/* v4l */
@@ -1507,10 +1514,11 @@ static int zr364xx_probe(struct usb_interface *intf,
 
 	/* load zr364xx board specific */
 	err = zr364xx_board_init(cam);
-	if (!err)
-		err = v4l2_ctrl_handler_setup(hdl);
 	if (err)
-		goto fail;
+		goto unregister;
+	err = v4l2_ctrl_handler_setup(hdl);
+	if (err)
+		goto board_uninit;
 
 	spin_lock_init(&cam->slock);
 
@@ -1525,16 +1533,21 @@ static int zr364xx_probe(struct usb_interface *intf,
 	err = video_register_device(&cam->vdev, VFL_TYPE_VIDEO, -1);
 	if (err) {
 		dev_err(&udev->dev, "video_register_device failed\n");
-		goto fail;
+		goto free_handler;
 	}
+	cam->v4l2_dev.release = zr364xx_release;
 
 	dev_info(&udev->dev, DRIVER_DESC " controlling device %s\n",
 		 video_device_node_name(&cam->vdev));
 	return 0;
 
-fail:
+free_handler:
 	v4l2_ctrl_handler_free(hdl);
+board_uninit:
+	zr364xx_board_uninit(cam);
+unregister:
 	v4l2_device_unregister(&cam->v4l2_dev);
+free_cam:
 	kfree(cam);
 	return err;
 }
-- 
2.29.2

