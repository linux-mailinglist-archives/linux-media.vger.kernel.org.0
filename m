Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A320D3A41A4
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 14:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhFKMF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 08:05:27 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60319 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229785AbhFKMF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 08:05:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id rfselCzgWhg8ZrfsilFn8C; Fri, 11 Jun 2021 14:03:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623413007; bh=4jGjcLEEROiW8l1hSGI1wzgehkd6cNlufZJvQnw9I0s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YUYRURGMG/cQHLgk+fvJHiH5kugf6b855+i9AWwGwMrReWaQBfypZ5dZy8xGtvt6s
         /Uul8Qeom/bvA4wwIwMFPaSFGv/r6MyvBud3v7QmVfAztJqm6/Gil4xoZvT+f9T+UY
         Z/BnfKN/BPWAkOcbaGxx8glVT6nlAOh9qCP9xPnkfY8kNuVzi2VQHGRhURusCSQbEf
         U2NHZ56n5PReRD118uZxYKaxBdNsOMiWYg1CorizqfPNowSEI2y2k/OoT2ifqsYoLw
         sdnKLueiDPwokN1Un4G4rqsMUtyDxA7M45nxO5EgAqn2b8QN0b2qQJlDbKGP6BMs5S
         MK5iArCYJnRYw==
Subject: Re: [PATCH v2 2/7] media: v4l2-core: explicitly clear ioctl input
 data
To:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20210610214305.4170835-1-arnd@kernel.org>
 <20210610214305.4170835-3-arnd@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a59eeddd-34bb-6b84-06b3-9fb1934d447e@xs4all.nl>
Date:   Fri, 11 Jun 2021 14:03:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210610214305.4170835-3-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIUyvu53YNzXcKPBXL+X+YcjBmHpKRNrFw9p9gw2KvebJSIHiLnEf6jMBy29QCnQfjOK7XcV6jj/0TJ2OsSbvWCJC3m9iwvEMyzVHeZ+7+RHXV6CZTGY
 SDbk3wiPPb7teag5EsQKPC7+hD4yXc5jzzsmjzcvKUJxddrVFxhgN9+kPL+IOf+7O0JlsnT9fjZOPBRoqL7ckOV4pDkyOuoHkFrdGbPaCXgxb1GBlXb/mr8+
 GD3U/iI8RRejfkih3qD+f1DMIeDJTfIXS/xiE2upwPruzi1I/rJI49ct1/2paQ3HlrgINQA8lWcacpxHA981+E74v0Cz5RlSsi+dV8SDZKj/RysUzxQ4MRMS
 xuuf2+V5itKYmjk5w0HkfMBdZwNp3OhHz4Z858dht+sLtU/kOrjgAC1vYg2rl8dQYvJ7Ywbr/w7K6io+VEtZWMTqj4KOloIJ9NSC816evySPCGkR0bOEo1GW
 eH7EQ4mlwa7QnuxJOghiD+4K28qB1w6XcvC8IGR75AEE/5z+uH5j1IWFLd0D4blh28MXMhyVi+rMUJ+IXcLb4TbIP29yDJuSC0K19C1pGkh0N4Z/IeQ77fa1
 ZU0wGN43GFiqNlmAxirLq+YqPE4iGbGyMUIoh0CtuSpHXWSsONYiDvRgNFjXyYrDPk6yNIsQvjClt17yQ7+OiwporUsnAyddNBFm9zV0Yh0tM9w+sKqBZozK
 VLanaAB7DDx248kv3i9CIt2kZtIPdCEa
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/06/2021 23:43, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As seen from a recent syzbot bug report, mistakes in the compat ioctl
> implementation can lead to uninitialized kernel stack data getting used
> as input for driver ioctl handlers.
> 
> The reported bug is now fixed, but it's possible that other related
> bugs are still present or get added in the future. As the drivers need
> to check user input already, the possible impact is fairly low, but it
> might still cause an information leak.
> 
> To be on the safe side, always clear the entire ioctl buffer before
> calling the conversion handler functions that are meant to initialize
> them.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 51 ++++++++++++++++------------
>  1 file changed, 29 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 58df927aec7e..bf5eb07296a5 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3122,12 +3122,23 @@ static int video_get_user(void __user *arg, void *parg,
>  
>  	if (cmd == real_cmd) {
>  		if (copy_from_user(parg, (void __user *)arg, n))
> -			err = -EFAULT;
> -	} else if (in_compat_syscall()) {
> -		err = v4l2_compat_get_user(arg, parg, cmd);
> -	} else {
> -		switch (cmd) {
> +			return -EFAULT;
> +
> +		/* zero out anything we don't copy from userspace */
> +		if (n < _IOC_SIZE(real_cmd))
> +			memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);

This should always happen, not just when cmd == real_cmd.

The comment is a bit misleading: besides zeroing what isn't copied from
userspace, it also zeroes copied fields based on INFO_FL_CLEAR_MASK.

With this change that no longer happens and v4l2-compliance starts complaining.

> +
> +		return 0;
> +	}
> +
> +	/* zero out whole buffer first to deal with missing emulation */
> +	memset(parg, 0, _IOC_SIZE(real_cmd));
> +
> +	if (in_compat_syscall())
> +		return v4l2_compat_get_user(arg, parg, cmd);
> +
>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
> +	switch (cmd) {
>  		case VIDIOC_QUERYBUF_TIME32:
>  		case VIDIOC_QBUF_TIME32:
>  		case VIDIOC_DQBUF_TIME32:

The 'case' statements need to be indented one tab less.

> @@ -3140,28 +3151,24 @@ static int video_get_user(void __user *arg, void *parg,
>  
>  			*vb = (struct v4l2_buffer) {
>  				.index		= vb32.index,
> -					.type		= vb32.type,
> -					.bytesused	= vb32.bytesused,
> -					.flags		= vb32.flags,
> -					.field		= vb32.field,
> -					.timestamp.tv_sec	= vb32.timestamp.tv_sec,
> -					.timestamp.tv_usec	= vb32.timestamp.tv_usec,
> -					.timecode	= vb32.timecode,
> -					.sequence	= vb32.sequence,
> -					.memory		= vb32.memory,
> -					.m.userptr	= vb32.m.userptr,
> -					.length		= vb32.length,
> -					.request_fd	= vb32.request_fd,
> +				.type		= vb32.type,
> +				.bytesused	= vb32.bytesused,
> +				.flags		= vb32.flags,
> +				.field		= vb32.field,
> +				.timestamp.tv_sec	= vb32.timestamp.tv_sec,
> +				.timestamp.tv_usec	= vb32.timestamp.tv_usec,
> +				.timecode	= vb32.timecode,
> +				.sequence	= vb32.sequence,
> +				.memory		= vb32.memory,
> +				.m.userptr	= vb32.m.userptr,
> +				.length		= vb32.length,
> +				.request_fd	= vb32.request_fd,

Can you put these whitespace changes in a separate patch?

>  			};
>  			break;
>  		}
> -#endif
> -		}
>  	}
> +#endif
>  
> -	/* zero out anything we don't copy from userspace */
> -	if (!err && n < _IOC_SIZE(real_cmd))
> -		memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
>  	return err;
>  }
>  
> 

I ended up with this code, and then my tests passed:

       if (cmd == real_cmd) {
                if (copy_from_user(parg, (void __user *)arg, n))
                        return -EFAULT;
        } else if (in_compat_syscall()) {
                memset(parg, 0, n);
                err = v4l2_compat_get_user(arg, parg, cmd);
        } else {
#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
                memset(parg, 0, n);
                switch (cmd) {
                case VIDIOC_QUERYBUF_TIME32:
                case VIDIOC_QBUF_TIME32:
                case VIDIOC_DQBUF_TIME32:
                case VIDIOC_PREPARE_BUF_TIME32: {
                        struct v4l2_buffer_time32 vb32;
                        struct v4l2_buffer *vb = parg;

                        if (copy_from_user(&vb32, arg, sizeof(vb32)))
                                return -EFAULT;

                        *vb = (struct v4l2_buffer) {
                                .index          = vb32.index,
                                        .type           = vb32.type,
                                        .bytesused      = vb32.bytesused,
                                        .flags          = vb32.flags,
                                        .field          = vb32.field,
                                        .timestamp.tv_sec       = vb32.timestamp.tv_sec,
                                        .timestamp.tv_usec      = vb32.timestamp.tv_usec,
                                        .timecode       = vb32.timecode,
                                        .sequence       = vb32.sequence,
                                        .memory         = vb32.memory,
                                        .m.userptr      = vb32.m.userptr,
                                        .length         = vb32.length,
                                        .request_fd     = vb32.request_fd,
                        };
                        break;
                }
                }
#endif
        }

        /* zero out anything we don't copy from userspace */
        if (!err && n < _IOC_SIZE(real_cmd))
                memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);

        return err;


That said, I also ran the regression tests on a i686 VM, and there I got a
bunch of failures, but that was *without* your patches, so I think something
unrelated broke. I'll have to dig more into this in the next few days.

But I wanted to get this out first, since this patch is clearly wrong.

Regards,

	Hans
