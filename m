Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453902DF52C
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 12:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgLTLKM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 06:10:12 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:41361 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727291AbgLTLKL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 06:10:11 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qwaYkRcz68AynqwackjwCk; Sun, 20 Dec 2020 12:09:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1608462567; bh=q8ilWY1qGyiTeZdgJd88aLkPFq/KCfKtmyIVxGZQLP0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=edXKEkOFDiPEfn5zvs2R5ilkbYHyHyDqv8NkM3Etha/qWIMDP/wMXj0TnHfKbxj9f
         2/6SG0/y9NQbZY8+Sqz/PH69DkLBYMhp8/js660/kdKyCoFissFnNH4AECdnK/eJcS
         D69Rkw0KiZluhRdbgpJgD4YdwNCVeuWK7nlGeU7jVcFbzNhP7TAKYlqKRYQMWqgslt
         n25c56KLGKYXUHH1KwpUYSnUA4JcYLFN91zNfBq2mT7VNCzbcDfBEonAtNpZa1WvH6
         L+uitSBcXMxwP4Be1ylvajxcaiF7THWrQV+dghkMeRK/+On40L1sRihz2qwF7Vj2oy
         f4n11NcjLcjEA==
Subject: Re: [PATCH 1/1] v4l: ioctl: Fix memory leak in video_usercopy
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        syzbot <syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <20201220110651.13432-1-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2db0cf77-680c-3a67-19b1-43c342467c82@xs4all.nl>
Date:   Sun, 20 Dec 2020 12:09:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201220110651.13432-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCaK1SSCXt5ylbHGsL1+8d0YMWdeQCJH76C750TWjAhiqa0+oYaAv6WUozT70zkN2JOITxesAV9LccQOK8KPsDsDlmUVlEMnl8nS+KxB+38kUafUNow9
 LQB1hsawbgLi1GQggvlY8xTNTklroRiGJYW0ASB33yPerPx9MCbpkeXYk6+vswjFExxZpzcROs7NIiS7/UT0gLNLwEwXLmzvLbcSq3fPjNAS1Fs/Bdn7eQqk
 H45sNVE68vCTM+1Yv3oPGjO4RBZEf+Pmq68CTc90Zlc/fDZPwj4YBDzTSM80JyddxHkKIQO4qGl/Wbwns1p/oeiKbNDJk9d0Zo1Qioq/A1kYbRIOAUW88RNi
 1VvXxFBGfK0qfmpDlAnzQZotvw5JJiRcef/OZ3f43lSg0X6spmzZcKpLl0wSWv4DEnTApKTPQI4B67cjKeSq85dDeLmueEplIp2gnaUBo+GZHWCiW/iMtOmJ
 SZS/5/sI7Pb7Toiv/gY2JNRu0YN5bEhFEdXjUM0c4C9oqTgmfK8GJz+JJk/idL68L/9H156eGGPy4yvk
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/12/2020 12:06, Sakari Ailus wrote:
> When an IOCTL with argument size larger than 128 that also used array
> arguments were handled, two memory allocations were made but alas, only
> the latter one of them was released. This happened because there was only
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

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

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
> 

