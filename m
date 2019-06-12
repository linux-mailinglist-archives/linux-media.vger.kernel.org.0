Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E161741D7E
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 09:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731313AbfFLHTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 03:19:52 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:37017 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731310AbfFLHTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 03:19:52 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id axXuhANxEbiAgaxXyhBbXc; Wed, 12 Jun 2019 09:19:50 +0200
Subject: Re: [PATCH 5/7 RESEND] touchscreen/sur40: set device_caps in struct
 video_device
To:     Florian Echtler <floe@butterbrot.org>
Cc:     linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
 <1e12bc3d-3cb3-1f3d-b3bc-b25e3bf95523@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2f4c6635-c966-5257-32b0-3fd2eaa9df8e@xs4all.nl>
Date:   Wed, 12 Jun 2019 09:19:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1e12bc3d-3cb3-1f3d-b3bc-b25e3bf95523@xs4all.nl>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFRPG8E9ECl87bUb7C4ggSrPyCLnu8WQvzgU/XV/a1QtC6FiU+V9ReCpxxrW2BOyVb7lzfakOanfwUt0scqcrxJtYgnHjcYCvlUBM0Zocg0rdITDVWgX
 GOt+HN0sbuaLY4Ib6D8xckwzm8drBZAH1079FUFn96SzSR5javjf9OId4l+kW/wcf+AQjwpOgTUBe7VnsJthhm2jIthGgZ+CfrwuSYX06G6CUqMmjpbcOiIt
 5EBRCjWBH5420OBvtoQF3bYns+6+i2DIrY/j5B72/s0t00qj0ulut2I1bk9jzrriPytN3QTErYutqokz6tNpEEqq0gOPoA4fIg1uaL9ci7w=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Florian: ping!

Regards,

	Hans

On 6/4/19 2:36 PM, Hans Verkuil wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> But this only really works if all drivers use this, so convert
> this touchscreen driver accordingly.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Florian Echtler <floe@butterbrot.org>
> ---
> Resend, adding Dmitry and linux-input to the CC list.
> 
> Dmitry, if you want to take this through your tree, then that's OK by me.
> 
> Alternatively, it can go through the media tree, but then I need your Ack.
> 
> Regards,
> 
> 	Hans
> ---
>  drivers/input/touchscreen/sur40.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
> index 894843a7ec7b..8b18d0acf5e0 100644
> --- a/drivers/input/touchscreen/sur40.c
> +++ b/drivers/input/touchscreen/sur40.c
> @@ -933,10 +933,6 @@ static int sur40_vidioc_querycap(struct file *file, void *priv,
>  	strlcpy(cap->driver, DRIVER_SHORT, sizeof(cap->driver));
>  	strlcpy(cap->card, DRIVER_LONG, sizeof(cap->card));
>  	usb_make_path(sur40->usbdev, cap->bus_info, sizeof(cap->bus_info));
> -	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TOUCH |
> -		V4L2_CAP_READWRITE |
> -		V4L2_CAP_STREAMING;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>  @@ -1166,6 +1162,8 @@ static const struct video_device sur40_video_device = {
>  	.fops = &sur40_video_fops,
>  	.ioctl_ops = &sur40_video_ioctl_ops,
>  	.release = video_device_release_empty,
> +	.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TOUCH |
> +		       V4L2_CAP_READWRITE | V4L2_CAP_STREAMING,
>  };
>   /* USB-specific object needed to register this driver with the USB subsystem. */
> 

