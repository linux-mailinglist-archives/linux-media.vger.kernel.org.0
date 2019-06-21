Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1134DF2E
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2019 04:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbfFUCsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 22:48:43 -0400
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.225]:37677 "EHLO
        cdptpa-cmomta03.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725911AbfFUCsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 22:48:42 -0400
Received: from [192.168.2.97] ([72.182.16.184])
        by cmsmtp with ESMTP
        id e9bShjPZMNkgMe9bUhoZl8; Fri, 21 Jun 2019 02:48:41 +0000
Subject: Re: [PATCH] hdpvr: fix locking and a missing msleep
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <62ff556b-cc69-bcd0-b81d-06e4bdd0f7ff@xs4all.nl>
From:   Keith Pyle <kpyle@austin.rr.com>
Message-ID: <dfa147ae-f29a-2780-187f-2b266ea7389e@austin.rr.com>
Date:   Thu, 20 Jun 2019 21:48:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <62ff556b-cc69-bcd0-b81d-06e4bdd0f7ff@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfIbpy666FIDcQe+AsOSxnNvKzvBqEWU/YZ/rC/KjeQg5Jhjt7TUvQN8yJBV5cNc60JP3+1hr6VcJ0ed/ASRNhwksp56GN+fxwVmqhQiQHRdAXXi+d92P
 TMu5npC1z20vQUQMUi21ffp/fhksE8aBC0wL61UEWyRFjvDtSABUeMh1kR/gCTzhAX7yXxJNuuvkh46Xi7qMJ/1kJEu33+JbNrc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/20/19 06:43, Hans Verkuil wrote:
> This driver has three locking issues:
>
> - The wait_event_interruptible() condition calls hdpvr_get_next_buffer(dev)
>    which uses a mutex, which is not allowed. Rewrite with list_empty_careful()
>    that doesn't need locking.
>
> - In hdpvr_read() the call to hdpvr_stop_streaming() didn't lock io_mutex,
>    but it should have since stop_streaming expects that.
>
> - In hdpvr_device_release() io_mutex was locked when calling flush_work(),
>    but there it shouldn't take that mutex since the work done by flush_work()
>    also wants to lock that mutex.
>
> There are also two other changes (suggested by Keith):
>
> - msecs_to_jiffies(4000); (a NOP) should have been msleep(4000).
> - Change v4l2_dbg to v4l2_info to always log if streaming had to be restarted.
>
> Reported-by: Keith Pyle <kpyle@austin.rr.com>
> Suggested-by: Keith Pyle <kpyle@austin.rr.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
This patch looks good.

I have repeated my tests and all passed (simple captures, capture with 
HD-PVR restart streaming) .   There were no lockdep reports and no 
process deadlocks.  The streaming restart now works and logs the restart 
in kern.log.

Keith
> ---
> diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
> index 3786ddcc0d18..5b3e67b80627 100644
> --- a/drivers/media/usb/hdpvr/hdpvr-video.c
> +++ b/drivers/media/usb/hdpvr/hdpvr-video.c
> @@ -435,7 +435,7 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
>   	/* wait for the first buffer */
>   	if (!(file->f_flags & O_NONBLOCK)) {
>   		if (wait_event_interruptible(dev->wait_data,
> -					     hdpvr_get_next_buffer(dev)))
> +					     !list_empty_careful(&dev->rec_buff_list)))
>   			return -ERESTARTSYS;
>   	}
>
> @@ -461,10 +461,17 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
>   				goto err;
>   			}
>   			if (!err) {
> -				v4l2_dbg(MSG_INFO, hdpvr_debug, &dev->v4l2_dev,
> -					"timeout: restart streaming\n");
> +				v4l2_info(&dev->v4l2_dev,
> +					  "timeout: restart streaming\n");
> +				mutex_lock(&dev->io_mutex);
>   				hdpvr_stop_streaming(dev);
> -				msecs_to_jiffies(4000);
> +				mutex_unlock(&dev->io_mutex);
> +				/*
> +				 * The FW needs about 4 seconds after streaming
> +				 * stopped before it is ready to restart
> +				 * streaming.
> +				 */
> +				msleep(4000);
>   				err = hdpvr_start_streaming(dev);
>   				if (err) {
>   					ret = err;
> @@ -1124,9 +1131,7 @@ static void hdpvr_device_release(struct video_device *vdev)
>   	struct hdpvr_device *dev = video_get_drvdata(vdev);
>
>   	hdpvr_delete(dev);
> -	mutex_lock(&dev->io_mutex);
>   	flush_work(&dev->worker);
> -	mutex_unlock(&dev->io_mutex);
>
>   	v4l2_device_unregister(&dev->v4l2_dev);
>   	v4l2_ctrl_handler_free(&dev->hdl);
>

