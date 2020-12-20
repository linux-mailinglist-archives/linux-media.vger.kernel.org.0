Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 193D52DF5A0
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 15:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbgLTOP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 09:15:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49800 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727251AbgLTOP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 09:15:58 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB4D3593;
        Sun, 20 Dec 2020 15:15:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608473715;
        bh=mtycxV6Yp4+99KCEYE4NN9LxWCUweyK93tCjkQpZ3Q0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ldC7/1MBVBBf6A577AkoHnxnowXtRmaSLS7nCdYIOzGW6cyZhK8+uflrNoWXRTP2r
         qZabN3O9JiNuHxdgOHlrlJRpgccl+xhO/zSoy61G9GSIrzbN0n4sWRCafD+l5Z39it
         y+JT5Z3moHHqhnV08Bv/9ird34QYo1IROYY2KuLk=
Date:   Sun, 20 Dec 2020 16:15:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        syzbot <syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH 1/1] v4l: ioctl: Fix memory leak in video_usercopy
Message-ID: <X99cazC7wzN8N9Vo@pendragon.ideasonboard.com>
References: <20201220110651.13432-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201220110651.13432-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Sun, Dec 20, 2020 at 01:06:51PM +0200, Sakari Ailus wrote:
> When an IOCTL with argument size larger than 128 that also used array
> arguments were handled, two memory allocations were made but alas, only
> the latter one of them was released.

Alas, this fills my heart with sorrow indeed :-)

> This happened because there was only
> a single local variable to hold such a temporary allocation.
> 
> Fix this by adding separate variables to hold the pointers to the
> temporary allocations.
> 
> Reported-by: Arnd Bergmann <arnd@kernel.org>
> Reported-by: syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com
> Fixes: d14e6d76ebf7 ("[media] v4l: Add multi-planar ioctl handling code")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 31 +++++++++++++---------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 3198abdd538ce..f42a779948779 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3283,7 +3283,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  	       v4l2_kioctl func)
>  {
>  	char	sbuf[128];
> -	void    *mbuf = NULL;
> +	void    *mbuf = NULL, *array_buf = NULL;
>  	void	*parg = (void *)arg;
>  	long	err  = -EINVAL;
>  	bool	has_array_args;
> @@ -3318,27 +3318,21 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  	has_array_args = err;
>  
>  	if (has_array_args) {
> -		/*
> -		 * When adding new types of array args, make sure that the
> -		 * parent argument to ioctl (which contains the pointer to the
> -		 * array) fits into sbuf (so that mbuf will still remain
> -		 * unused up to here).
> -		 */
> -		mbuf = kvmalloc(array_size, GFP_KERNEL);
> +		array_buf = kvmalloc(array_size, GFP_KERNEL);
>  		err = -ENOMEM;
> -		if (NULL == mbuf)
> +		if (array_buf == NULL)
>  			goto out_array_args;
>  		err = -EFAULT;
>  		if (in_compat_syscall())
> -			err = v4l2_compat_get_array_args(file, mbuf, user_ptr,
> -							 array_size, orig_cmd,
> -							 parg);
> +			err = v4l2_compat_get_array_args(file, array_buf,
> +							 user_ptr, array_size,
> +							 orig_cmd, parg);
>  		else
> -			err = copy_from_user(mbuf, user_ptr, array_size) ?
> +			err = copy_from_user(array_buf, user_ptr, array_size) ?
>  								-EFAULT : 0;
>  		if (err)
>  			goto out_array_args;
> -		*kernel_ptr = mbuf;
> +		*kernel_ptr = array_buf;
>  	}
>  
>  	/* Handles IOCTL */
> @@ -3360,12 +3354,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  		if (in_compat_syscall()) {
>  			int put_err;
>  
> -			put_err = v4l2_compat_put_array_args(file, user_ptr, mbuf,
> -							     array_size, orig_cmd,
> +			put_err = v4l2_compat_put_array_args(file, user_ptr,
> +							     array_buf,
> +							     array_size,
> +							     orig_cmd,
>  							     parg);

orig_cmd and pargs would fit on the same line if you want to.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			if (put_err)
>  				err = put_err;
> -		} else if (copy_to_user(user_ptr, mbuf, array_size)) {
> +		} else if (copy_to_user(user_ptr, array_buf, array_size)) {
>  			err = -EFAULT;
>  		}
>  		goto out_array_args;
> @@ -3381,6 +3377,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  	if (video_put_user((void __user *)arg, parg, cmd, orig_cmd))
>  		err = -EFAULT;
>  out:
> +	kvfree(array_buf);
>  	kvfree(mbuf);
>  	return err;
>  }

-- 
Regards,

Laurent Pinchart
