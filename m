Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9468A2F4FA3
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 17:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbhAMQO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 11:14:29 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:38273 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726003AbhAMQO3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 11:14:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id zimDkKApjAiIczimGkeE1o; Wed, 13 Jan 2021 17:13:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610554425; bh=HzrXUilug86PLx1Vw8PZd+vVdhpakB6XRCIlfqxWffA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eMdbUMTlQ5fjxDK5qjM0B3ZvLHCL54r7qmaSKEhictc0sXWCNB04tIym5sTKWU9Jn
         S4IJQYeJt9j7NsQAltsJN0gAHR27UsglLLs7Z7Qedi2NqYQcUL4825aSBA+bWujY4k
         EyDzPcE8z94FiLwJbO1frwM08iIo+7CgDPxc+ZJ/aq8eteyyzbj1q3Efji2i2pL7+P
         P7vWEhgG/oTw8LRrbj/OVPf9wm0prTebfRtlufp5OxKPn6O8q0CPiLwFxDY8P/imRw
         u70fetlUUushTvx59YdzvvSIJYV+PUbHmz1iZj5iFVW/BsJxOVVTkFSzpQ42Z32Ntu
         FRj9aKEoYEjjg==
Subject: Re: [PATCH] media: zr364xx: fix memory leaks in probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Antoine Jacquet <royale@zerezo.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
References: <X/WMfVDCsxRghKHH@mwanda>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <196887f5-677f-0aeb-5f5c-fb4a918d6128@xs4all.nl>
Date:   Wed, 13 Jan 2021 17:13:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X/WMfVDCsxRghKHH@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDXh2XWp6fTGeyDWm3kbeTQQ3axRB7wBD3Y4RGogQGVoH/5MrSX/GpUR0Gm9U6r/pqcSNsUghVzESuyjFfq0uRB2XtdVPhJgaBnOqBrxSiw1prrKH5sa
 j9EBAgbwD7DEi9DsqDitffkj+6hAhrnG+XR6QR2a5I2A8re+QCbkENsP2z6IuGO00nbLsJ0T0DY1lohKUQCa7Owst048gVtgdKnv7TSKCsuJj4PGLHW2Novi
 yGUtyWuY93nWdBzF/iSzXGJsak5XQBtWNtMC0q2rsmkgeZOnn2GMDF6P3psAkxT2ZMMjVS5qUoTPeytevqqwDLgKiRNPkyKFd5FkdcbT/82KvbtL0gCHTVBM
 Q8I2ksbniHXAORxnDJYK9+O4/crQujL04tSt3wUmTkbPwopf5/YW0q5SAA2s+hZIxiLlPEGySkuWuqBabrjR4jvpyBNZG/WsiJFv5qhsQJEZnyR197Nu3pP2
 h6L2ONjqLmjcSVt1m6DQ+UdBI0L8c8CYTk+0dwl40zlQeGR5E5cORXyTSI/yoUAmu5/y6XqNqpv6lFRfbJkBoBtmcyZTBSHfhN9Rm1P33MI4HOeQAdjBbD6O
 VRA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 06/01/2021 11:10, Dan Carpenter wrote:
> Syzbot discovered that the probe error handling doesn't clean up the
> resources allocated in zr364xx_board_init().  There are several
> related bugs in this code so I have re-written the error handling.
> 
> 1)  Introduce a new function zr364xx_board_uninit() which cleans up
>     the resources in zr364xx_board_init().
> 2)  In zr364xx_board_init() if the call to zr364xx_start_readpipe()
>     fails then release the "cam->buffer.frame[i].lpvbits" memory
>     before returning.  This way every function either allocates
>     everything successfully or it cleans up after itself.
> 3)  Re-write the probe function so that each failure path goto frees
>     the most recent allocation.  That way we don't free anything
>     before it has been allocated and we can also verify that
>     everything is freed.
> 4)  Originally, in the probe function the "cam->v4l2_dev.release"
>     pointer was set to "zr364xx_release" near the start but I moved
>     that assignment to the end, after everything had succeeded.  The
>     release function was never actually called during the probe cleanup
>     process, but with this change I wanted to make it clear that we
>     don't want to call zr364xx_release() until everything is
>     allocated successfully.
> 
> Next I re-wrote the zr364xx_release() function.  Ideally this would
> have been a simple matter of copy and pasting the cleanup code from
> probe and adding an additional call to video_unregister_device().  But
> there are several quirks to note.
> 
> 1)  The original code never called video_unregister_device().  In other
>     words, this is an additional bugfix.

Not a bug, see below.

> 2)  The probe function does not call videobuf_mmap_free() and I don't
>     know where the videobuf_mmap is allocated.  I left the code as-is to
>     avoid introducing a bug in code I don't understand.
> 3)  The zr364xx_board_uninit() has a call to zr364xx_stop_readpipe()
>     which is a change from the original behavior with regards to
>     unloading the driver.  Calling zr364xx_stop_readpipe() on a stopped
>     pipe is not a problem so this is safe and is potentially a bugfix.
> 
> Reported-by: syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/usb/zr364xx/zr364xx.c | 50 ++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
> index 1e1c6b4d1874..62a232f995a7 100644
> --- a/drivers/media/usb/zr364xx/zr364xx.c
> +++ b/drivers/media/usb/zr364xx/zr364xx.c
> @@ -1181,15 +1181,11 @@ static int zr364xx_open(struct file *file)
>  	return err;
>  }
>  
> -static void zr364xx_release(struct v4l2_device *v4l2_dev)
> +static void zr364xx_board_uninit(struct zr364xx_camera *cam)
>  {
> -	struct zr364xx_camera *cam =
> -		container_of(v4l2_dev, struct zr364xx_camera, v4l2_dev);
>  	unsigned long i;
>  
> -	v4l2_device_unregister(&cam->v4l2_dev);
> -
> -	videobuf_mmap_free(&cam->vb_vidq);
> +	zr364xx_stop_readpipe(cam);
>  
>  	/* release sys buffers */
>  	for (i = 0; i < FRAMES; i++) {
> @@ -1200,9 +1196,20 @@ static void zr364xx_release(struct v4l2_device *v4l2_dev)
>  		cam->buffer.frame[i].lpvbits = NULL;
>  	}
>  
> -	v4l2_ctrl_handler_free(&cam->ctrl_handler);
>  	/* release transfer buffer */
>  	kfree(cam->pipe->transfer_buffer);
> +}
> +
> +static void zr364xx_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct zr364xx_camera *cam =
> +		container_of(v4l2_dev, struct zr364xx_camera, v4l2_dev);
> +
> +	videobuf_mmap_free(&cam->vb_vidq);
> +	video_unregister_device(&cam->vdev);

video_unregister_device() is called in the disconnect function, so calling it again
here is wrong (it detects that the video device is already unregistered, so this
effectively is a NOP).

I have tested this patch with an actual zr364xx device without this line and it works
fine. So you can add my:

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

for a v2 without this spurious video_unregister_device().

The v4l2_dev.release() callback is called when all video devices are unregistered
and when all open filehandles to those video devices are closed, i.e. it is called
when the very last user is gone.

Regards,

	Hans

> +	v4l2_ctrl_handler_free(&cam->ctrl_handler);
> +	zr364xx_board_uninit(cam);
> +	v4l2_device_unregister(&cam->v4l2_dev);
>  	kfree(cam);
>  }
>  
> @@ -1376,11 +1383,14 @@ static int zr364xx_board_init(struct zr364xx_camera *cam)
>  	/* start read pipe */
>  	err = zr364xx_start_readpipe(cam);
>  	if (err)
> -		goto err_free;
> +		goto err_free_frames;
>  
>  	DBG(": board initialized\n");
>  	return 0;
>  
> +err_free_frames:
> +	for (i = 0; i < FRAMES; i++)
> +		vfree(cam->buffer.frame[i].lpvbits);
>  err_free:
>  	kfree(cam->pipe->transfer_buffer);
>  	cam->pipe->transfer_buffer = NULL;
> @@ -1409,12 +1419,10 @@ static int zr364xx_probe(struct usb_interface *intf,
>  	if (!cam)
>  		return -ENOMEM;
>  
> -	cam->v4l2_dev.release = zr364xx_release;
>  	err = v4l2_device_register(&intf->dev, &cam->v4l2_dev);
>  	if (err < 0) {
>  		dev_err(&udev->dev, "couldn't register v4l2_device\n");
> -		kfree(cam);
> -		return err;
> +		goto free_cam;
>  	}
>  	hdl = &cam->ctrl_handler;
>  	v4l2_ctrl_handler_init(hdl, 1);
> @@ -1423,7 +1431,7 @@ static int zr364xx_probe(struct usb_interface *intf,
>  	if (hdl->error) {
>  		err = hdl->error;
>  		dev_err(&udev->dev, "couldn't register control\n");
> -		goto fail;
> +		goto unregister;
>  	}
>  	/* save the init method used by this camera */
>  	cam->method = id->driver_info;
> @@ -1496,7 +1504,7 @@ static int zr364xx_probe(struct usb_interface *intf,
>  	if (!cam->read_endpoint) {
>  		err = -ENOMEM;
>  		dev_err(&intf->dev, "Could not find bulk-in endpoint\n");
> -		goto fail;
> +		goto unregister;
>  	}
>  
>  	/* v4l */
> @@ -1507,10 +1515,11 @@ static int zr364xx_probe(struct usb_interface *intf,
>  
>  	/* load zr364xx board specific */
>  	err = zr364xx_board_init(cam);
> -	if (!err)
> -		err = v4l2_ctrl_handler_setup(hdl);
>  	if (err)
> -		goto fail;
> +		goto unregister;
> +	err = v4l2_ctrl_handler_setup(hdl);
> +	if (err)
> +		goto board_uninit;
>  
>  	spin_lock_init(&cam->slock);
>  
> @@ -1525,16 +1534,21 @@ static int zr364xx_probe(struct usb_interface *intf,
>  	err = video_register_device(&cam->vdev, VFL_TYPE_VIDEO, -1);
>  	if (err) {
>  		dev_err(&udev->dev, "video_register_device failed\n");
> -		goto fail;
> +		goto free_handler;
>  	}
> +	cam->v4l2_dev.release = zr364xx_release;
>  
>  	dev_info(&udev->dev, DRIVER_DESC " controlling device %s\n",
>  		 video_device_node_name(&cam->vdev));
>  	return 0;
>  
> -fail:
> +free_handler:
>  	v4l2_ctrl_handler_free(hdl);
> +board_uninit:
> +	zr364xx_board_uninit(cam);
> +unregister:
>  	v4l2_device_unregister(&cam->v4l2_dev);
> +free_cam:
>  	kfree(cam);
>  	return err;
>  }
> 

