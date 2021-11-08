Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEF9447EC1
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 12:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239173AbhKHLWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 06:22:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239162AbhKHLWO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 06:22:14 -0500
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9D2C061714;
        Mon,  8 Nov 2021 03:19:29 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k2gNm2oajDjkdk2gQmU3Mr; Mon, 08 Nov 2021 12:19:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636370366; bh=Ky8XM/01XWa0edP78+WtL2jODV50J0htg2vvJs2UIiA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lqIphr/4zDulLlBDdfblG0FMVJr77OPGcp7IsE7+7Qx/f8mPPTHNCZ6GYkPCnu2nA
         NvgYi9AmUA6IeJ5QPwRzBDU2Cn/3Ldd5EKclgB9RDUe+TprNlbpq6yU5Fx6BInvw2U
         RAK3oo9ojPvJ4obgDOwHB/g3O7kUXDyXJTaeuSdzVlHe3r/iCD3N5aUCZZ3w+fM0/n
         e5d9eUBoE/8Pn9JxpzQZLlpmEDu7ZsD6nHO+RN0PqQd5DAQvCXC82ag1omcKYjzj6H
         TJx39pHvOLn5klkayP/wGlui+WufPS8VGdiAJMEqPq2VAOPTHvwtUX+PaKYbd3XDKX
         1uRfeBue411jQ==
Subject: Re: [PATCH] media: v4l2-core: fix VIDIOC_DQEVENT handling on non-x86
To:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211026055010.1569728-1-arnd@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5f36583b-05a0-bf9a-7eb2-6851442c99cc@xs4all.nl>
Date:   Mon, 8 Nov 2021 12:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026055010.1569728-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfB3Dy+mRq5ZuVaA1+sX0+p7XDIk6PW3ieM0HAEs6LdxzPx8e6iD5psWi9z4zgWhMnAt4RE5vIiGY5ZDCI1K8Q1B5Uf5ytreqK/ziQag5UQk+OElV/6G+
 ZKf7eKlgr9DvOxMj+GCI0e5vSNYv+0m/liGATCh5+aga8RfBSHIHrs0XlBVie6LMv1JbuuLbGuzb+S74EYUCwJR7Y+gK1gE3LBTmDEgFzC2bCgngOSIF6OBp
 H7zqjn8vcQkHEZe8z9GK5nWHxRxgvP7/WJ8o8BM2HDbBEjTC9ODFOMdhxakfRjUlLa4CghtS0MkBNo5LZHt7ClygxfxqMkhqJOdfqUei7JqzOcuO9/Heewbt
 2B9n9Kzi9CLsjd1hX5/MZTjFtmjzlWlGfKH2Fw+cRiBX77TLLT+r2W4mBtxvXpYYuMVqhn1ncBaSf/v0kth/jpG3jmDk+A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

I tested this and it looks good.

One question: is support for arch/x86 (x86_64-linux-muslx32-native) supposed to work?
It fails for me when I test this. It's not related to this patch, it is failing for
pretty much any compat ioctl.

In any case, I'm accepting this patch.

Regards,

	Hans

On 26/10/2021 07:49, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> My previous bugfix addressed an API inconsistency found by syzbot,
> and it correctly fixed the issue on x86-64 machines, which now behave
> correctly for both native and compat tasks.
> 
> Unfortunately, John found that the patch broke compat mode on all other
> architectures, as they can no longer rely on the VIDIOC_DQEVENT_TIME32
> code from the native handler as a fallback in the compat code.
> 
> The best way I can see for addressing this is to generalize the
> VIDIOC_DQEVENT32_TIME32 code from x86 and use that for all architectures,
> leaving only the VIDIOC_DQEVENT32 variant as x86 specific. The original
> code was trying to be clever and use the same conversion helper for native
> 32-bit code and compat mode, but that turned out to be too obscure so
> even I missed that bit I had introduced myself when I made the fix.
> 
> Fixes: c344f07aa1b4 ("media: v4l2-core: ignore native time32 ioctls on 64-bit")
> Reported-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 41 ++++++++-----------
>  1 file changed, 17 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 8176769a89fa..0f3d6b5667b0 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -751,10 +751,6 @@ static int put_v4l2_ext_controls32(struct v4l2_ext_controls *p64,
>  /*
>   * x86 is the only compat architecture with different struct alignment
>   * between 32-bit and 64-bit tasks.
> - *
> - * On all other architectures, v4l2_event32 and v4l2_event32_time32 are
> - * the same as v4l2_event and v4l2_event_time32, so we can use the native
> - * handlers, converting v4l2_event to v4l2_event_time32 if necessary.
>   */
>  struct v4l2_event32 {
>  	__u32				type;
> @@ -772,21 +768,6 @@ struct v4l2_event32 {
>  	__u32				reserved[8];
>  };
>  
> -#ifdef CONFIG_COMPAT_32BIT_TIME
> -struct v4l2_event32_time32 {
> -	__u32				type;
> -	union {
> -		compat_s64		value64;
> -		__u8			data[64];
> -	} u;
> -	__u32				pending;
> -	__u32				sequence;
> -	struct old_timespec32		timestamp;
> -	__u32				id;
> -	__u32				reserved[8];
> -};
> -#endif
> -
>  static int put_v4l2_event32(struct v4l2_event *p64,
>  			    struct v4l2_event32 __user *p32)
>  {
> @@ -802,7 +783,22 @@ static int put_v4l2_event32(struct v4l2_event *p64,
>  	return 0;
>  }
>  
> +#endif
> +
>  #ifdef CONFIG_COMPAT_32BIT_TIME
> +struct v4l2_event32_time32 {
> +	__u32				type;
> +	union {
> +		compat_s64		value64;
> +		__u8			data[64];
> +	} u;
> +	__u32				pending;
> +	__u32				sequence;
> +	struct old_timespec32		timestamp;
> +	__u32				id;
> +	__u32				reserved[8];
> +};
> +
>  static int put_v4l2_event32_time32(struct v4l2_event *p64,
>  				   struct v4l2_event32_time32 __user *p32)
>  {
> @@ -818,7 +814,6 @@ static int put_v4l2_event32_time32(struct v4l2_event *p64,
>  	return 0;
>  }
>  #endif
> -#endif
>  
>  struct v4l2_edid32 {
>  	__u32 pad;
> @@ -880,9 +875,7 @@ static int put_v4l2_edid32(struct v4l2_edid *p64,
>  #define VIDIOC_QUERYBUF32_TIME32	_IOWR('V',  9, struct v4l2_buffer32_time32)
>  #define VIDIOC_QBUF32_TIME32		_IOWR('V', 15, struct v4l2_buffer32_time32)
>  #define VIDIOC_DQBUF32_TIME32		_IOWR('V', 17, struct v4l2_buffer32_time32)
> -#ifdef CONFIG_X86_64
>  #define	VIDIOC_DQEVENT32_TIME32		_IOR ('V', 89, struct v4l2_event32_time32)
> -#endif
>  #define VIDIOC_PREPARE_BUF32_TIME32	_IOWR('V', 93, struct v4l2_buffer32_time32)
>  #endif
>  
> @@ -936,10 +929,10 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
>  #ifdef CONFIG_X86_64
>  	case VIDIOC_DQEVENT32:
>  		return VIDIOC_DQEVENT;
> +#endif
>  #ifdef CONFIG_COMPAT_32BIT_TIME
>  	case VIDIOC_DQEVENT32_TIME32:
>  		return VIDIOC_DQEVENT;
> -#endif
>  #endif
>  	}
>  	return cmd;
> @@ -1032,10 +1025,10 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
>  #ifdef CONFIG_X86_64
>  	case VIDIOC_DQEVENT32:
>  		return put_v4l2_event32(parg, arg);
> +#endif
>  #ifdef CONFIG_COMPAT_32BIT_TIME
>  	case VIDIOC_DQEVENT32_TIME32:
>  		return put_v4l2_event32_time32(parg, arg);
> -#endif
>  #endif
>  	}
>  	return 0;
> 

