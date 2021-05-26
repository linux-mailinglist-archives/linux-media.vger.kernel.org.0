Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F827391894
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 15:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbhEZNRM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 09:17:12 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:33309 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232211AbhEZNRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 09:17:10 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ltNmlTk1ZWkKbltNplDI5H; Wed, 26 May 2021 15:15:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622034937; bh=EI3B+LNMCYgFK30T4XcTo3CVB8C276/abB7V41iMB3k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sO2IfvdxyOjAvsIVwHy0zaAXAIh8Met5e24EntS5BTrlvuOOA8vb3dS45qvlsU3lp
         JKtaHml5WpDfM40VwPD5WficCqfcCAvrC2hzkPZyoxok3I+ihytK+2h5wC1z3HeYqX
         Z3dCA8kP255ta6XDYcECVY6IyFyTV30INFOLGTa+EIjFBWRXoEc1lTc/ZwYTdWvFgz
         FQJ9hUOYCKRsybmXYyle6uLiSdD+C9UMdB4JPgVRo2l3mq0/Wbjoq2KdqNe/sm4MRf
         OzRtrkv0LGpjGaLl3ES+liMuN8m271bVw15iBG83Hpc/Uy8HeTv0LSWNXDyXxBNpr1
         TgjWVyoukoDeA==
Subject: Re: [PATCH 4/4] media: usb: cpia2: Fixed coding style issues
To:     Piyush Thange <pthange19@gmail.com>, mchehab@kernel.org,
        leon@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210430154314.3152-1-pthange19@gmail.com>
 <20210430154314.3152-4-pthange19@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7a3e11b0-272c-bef0-2256-ddd54797bfbf@xs4all.nl>
Date:   Wed, 26 May 2021 15:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430154314.3152-4-pthange19@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKrFY56gBYdLpAzdDDdZJTAMbTi/4MEO/2ii+2hvw+mAyuRKyfL2C3yVWSPY5Od42o6dJGrbKYBsHZD7oQYXyXkLsEHnMyTA1gQoSTG7GkAqDidhkEnz
 dRHI+zSoT8hsCyHV0Mp/VYU3RQVUUSDAbbD6mTcV2DxjDt9WpKYWMZjrRR64E6ly65DwaIcY9D9g0K063TnVQRychTLq5fSqnp5Z4h/dxhYxW2+7xQbHpPb5
 ROQ2k9P8lDuFMwiFKTSzUV/waXEqLbOyEI1xo2Y8C+S+fv+z07ucwOHxyumMdd/58f8EAe2fvEaRmaH5bdppSZytdOk4iDxzYKlDpsqHv5g=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/04/2021 17:43, Piyush Thange wrote:
> Addition of more fixes on coding style.
> 
> Signed-off-by: Piyush Thange <pthange19@gmail.com>
> ---
>  drivers/media/usb/cpia2/cpia2_v4l.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
> index 261ced144793..d950f9171208 100644
> --- a/drivers/media/usb/cpia2/cpia2_v4l.c
> +++ b/drivers/media/usb/cpia2/cpia2_v4l.c
> @@ -883,12 +883,12 @@ static int cpia2_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>  
>  	frame = find_earliest_filled_buffer(cam);
>  
> -	if(frame < 0 && file->f_flags&O_NONBLOCK)
> +	if (frame < 0 && file->f_flags&O_NONBLOCK)

Add spaces around & as well.

There is no need to split this up into four patches. Just post a single patch
for all these changes.

>  		return -EAGAIN;
>  
> -	if(frame < 0) {
> +	if (frame < 0) {
>  		/* Wait for a frame to become available */
> -		struct framebuf *cb=cam->curbuff;
> +		struct framebuf *cb = cam->curbuff;
>  		mutex_unlock(&cam->v4l2_lock);
>  		wait_event_interruptible(cam->wq_stream,
>  					 !video_is_registered(&cam->vdev) ||
> @@ -970,7 +970,7 @@ static int cpia2_mmap(struct file *file, struct vm_area_struct *area)
>  		return -ERESTARTSYS;
>  	retval = cpia2_remap_buffer(cam, area);
>  
> -	if(!retval)
> +	if (!retval)
>  		cam->stream_fh = file->private_data;
>  	mutex_unlock(&cam->v4l2_lock);
>  	return retval;
> @@ -1160,10 +1160,10 @@ void cpia2_unregister_camera(struct camera_data *cam)
>   *****************************************************************************/
>  static void __init check_parameters(void)
>  {
> -	if(buffer_size < PAGE_SIZE) {
> +	if (buffer_size < PAGE_SIZE) {
>  		buffer_size = PAGE_SIZE;
>  		LOG("buffer_size too small, setting to %d\n", buffer_size);
> -	} else if(buffer_size > 1024*1024) {
> +	} else if (buffer_size > 1024*1024) {

Add spaces around * as well. checkpatch.pl --strict warns about that!

Regards,

	Hans

>  		/* arbitrary upper limiit */
>  		buffer_size = 1024*1024;
>  		LOG("buffer_size ridiculously large, setting to %d\n",
> @@ -1173,15 +1173,15 @@ static void __init check_parameters(void)
>  		buffer_size &= ~(PAGE_SIZE-1);
>  	}
>  
> -	if(num_buffers < 1) {
> +	if (num_buffers < 1) {
>  		num_buffers = 1;
>  		LOG("num_buffers too small, setting to %d\n", num_buffers);
> -	} else if(num_buffers > VIDEO_MAX_FRAME) {
> +	} else if (num_buffers > VIDEO_MAX_FRAME) {
>  		num_buffers = VIDEO_MAX_FRAME;
>  		LOG("num_buffers too large, setting to %d\n", num_buffers);
>  	}
>  
> -	if(alternate < USBIF_ISO_1 || alternate > USBIF_ISO_6) {
> +	if (alternate < USBIF_ISO_1 || alternate > USBIF_ISO_6) {
>  		alternate = DEFAULT_ALT;
>  		LOG("alternate specified is invalid, using %d\n", alternate);
>  	}
> 

