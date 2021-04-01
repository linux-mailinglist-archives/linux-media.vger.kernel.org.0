Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A4F352131
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 22:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbhDAU63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 16:58:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:39298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233710AbhDAU63 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Apr 2021 16:58:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA96F606A5;
        Thu,  1 Apr 2021 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617310709;
        bh=yEfAj33X/M6Ig0AFvQgAR+NEY0HL62e7KQs+a/f97xI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MAY7R2WNL8JQCEYCn9A8RqhEANTSmnGgTMaJlRIFIC8La4XPRDe+EaiwjZk96P2HV
         jME6kYBfLQHlGgL1f9om+wEXV6Ove8eMkksWy527sZaBnuU8Xnfi7NpqaD/y01C936
         dfOE1GifziV2XrXmsM+shZOhNkUnP8OX6rMUAnZ4=
Date:   Thu, 1 Apr 2021 22:58:25 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Anirudh Rayabharam <mail@anirudhrb.com>
Cc:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pvrusb2: fix warning in pvr2_i2c_core_done
Message-ID: <YGYz8Z0sWYhb9lb/@kroah.com>
References: <20210401123338.3937-1-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401123338.3937-1-mail@anirudhrb.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 01, 2021 at 06:03:38PM +0530, Anirudh Rayabharam wrote:
> syzbot has reported the following warning in pvr2_i2c_done:
> 
> 	sysfs group 'power' not found for kobject '1-0043'
> 
> When the device is disconnected (pvr_hdw_disconnect), the i2c adapter is
> not unregistered along with the USB and vl42 teardown. As part of the
> USB device disconnect, the sysfs files of the subdevices are also
> deleted. So, by the time pvr_i2c_core_done is called by
> pvr_context_destroy, the sysfs files have been deleted.
> 
> To fix this, unregister the i2c adapter too in pvr_hdw_disconnect. Make
> the device deregistration code shared by calling pvr_hdw_disconnect from
> pvr2_hdw_destory.
> 
> Reported-and-tested-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index f4a727918e35..791227787ff5 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -2676,9 +2676,7 @@ void pvr2_hdw_destroy(struct pvr2_hdw *hdw)
>  		pvr2_stream_destroy(hdw->vid_stream);
>  		hdw->vid_stream = NULL;
>  	}
> -	pvr2_i2c_core_done(hdw);
> -	v4l2_device_unregister(&hdw->v4l2_dev);
> -	pvr2_hdw_remove_usb_stuff(hdw);
> +	pvr2_hdw_disconnect(hdw);
>  	mutex_lock(&pvr2_unit_mtx);
>  	do {
>  		if ((hdw->unit_number >= 0) &&
> @@ -2705,6 +2703,7 @@ void pvr2_hdw_disconnect(struct pvr2_hdw *hdw)
>  {
>  	pvr2_trace(PVR2_TRACE_INIT,"pvr2_hdw_disconnect(hdw=%p)",hdw);
>  	LOCK_TAKE(hdw->big_lock);
> +	pvr2_i2c_core_done(hdw);
>  	LOCK_TAKE(hdw->ctl_lock);
>  	pvr2_hdw_remove_usb_stuff(hdw);
>  	LOCK_GIVE(hdw->ctl_lock);
> -- 
> 2.26.2

Looks sane to me, nice work tracking this down.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
