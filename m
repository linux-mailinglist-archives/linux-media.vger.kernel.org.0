Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E72403E9E
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 19:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235624AbhIHRvo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 13:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhIHRvo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 13:51:44 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E68C061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 10:50:35 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id dc3so3421960ejb.10
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=vuSk6k+wa7pbmbqWvCvDdZqbC/SZgYreAXUEe3eNDTI=;
        b=CrZPXrbRVBTI1Aeeq3S3hJAKJib2O3JHOIozuY4W+uOWFio621qYyJ7hq1RO+8crgh
         wRDjLG+SqzqtDTHBtVhkPIB/T34XJ4owMRBT6j3Id9cEMkVbnt+iBJ9W3MQ+v4amOHmz
         gkeffzcDQEBIZk+ujoZFNjxsDJ1MuSZpSvfqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=vuSk6k+wa7pbmbqWvCvDdZqbC/SZgYreAXUEe3eNDTI=;
        b=q9w7hCRzTjAtmDExM5nGJ36hKkuquK0YgrnaPGm5W5EccIgmAmcvt9RxqTk2MlqrOj
         kbEctxns3VQfO95DbjTvd480LhQzV6Ux6B+0BPWz9EJg06gqoa7KfZrJkIStuxUNl1+o
         h7PGhng1kn3uEDElnfnRYrFl0ZWK1++ugUYgV3ajstqQz1StDpUKrsN1TRIavjm4M139
         OT3CI2oZPj5/BXwn73WbvR5Abpi9LnGcEPL6ZFiKJkMa+rfWcJ7ts3cIVk61HYIjFSna
         wJ9IbJg6KLpeSANApU/xZRJdDgod0+oRxAVKJ1ozzBz6Wo4C444Y7viNWt4LgoHNQXdz
         390g==
X-Gm-Message-State: AOAM533DzDQEM0g/1+8+CTZBuuoR0AmEnHpkQ4VMIjpGaD7AqRw32Lxz
        lzoAFbNrh1W7/VXKYVJcfZ6FWPEaMx/IZg==
X-Google-Smtp-Source: ABdhPJyLY5ZP+DrKCEiNDoixuHHNHP6eq1Kk0XYL+iCJY9nnpI/B5uHAvbhuiIkC29KGm61OMQLXTw==
X-Received: by 2002:a17:906:c1d0:: with SMTP id bw16mr1160810ejb.146.1631123434349;
        Wed, 08 Sep 2021 10:50:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w3sm1475271edc.42.2021.09.08.10.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 10:50:33 -0700 (PDT)
Date:   Wed, 8 Sep 2021 19:50:32 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
Message-ID: <YTj36NbUNxnn6uBU@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-9-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903184806.1680887-9-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 03, 2021 at 11:47:59AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The initial purpose is for igt tests, but this would also be useful for
> compositors that wait until close to vblank deadline to make decisions
> about which frame to show.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Needs userspace and I think ideally also some igts to make sure it works
and doesn't go boom.
-Daniel

> ---
>  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
>  include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 394e6e1e9686..f295772d5169 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -459,6 +459,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>  	return ret;
>  }
>  
> +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> +					unsigned long arg)
> +{
> +	struct sync_set_deadline ts;
> +
> +	if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> +		return -EFAULT;
> +
> +	if (ts.pad)
> +		return -EINVAL;
> +
> +	dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
> +
> +	return 0;
> +}
> +
>  static long sync_file_ioctl(struct file *file, unsigned int cmd,
>  			    unsigned long arg)
>  {
> @@ -471,6 +487,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
>  	case SYNC_IOC_FILE_INFO:
>  		return sync_file_ioctl_fence_info(sync_file, arg);
>  
> +	case SYNC_IOC_SET_DEADLINE:
> +		return sync_file_ioctl_set_deadline(sync_file, arg);
> +
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> index ee2dcfb3d660..f67d4ffe7566 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -67,6 +67,18 @@ struct sync_file_info {
>  	__u64	sync_fence_info;
>  };
>  
> +/**
> + * struct sync_set_deadline - set a deadline on a fence
> + * @tv_sec:	seconds elapsed since epoch
> + * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec
> + * @pad:	must be zero
> + */
> +struct sync_set_deadline {
> +	__s64	tv_sec;
> +	__s32	tv_nsec;
> +	__u32	pad;
> +};
> +
>  #define SYNC_IOC_MAGIC		'>'
>  
>  /**
> @@ -95,4 +107,12 @@ struct sync_file_info {
>   */
>  #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
>  
> +
> +/**
> + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> + *
> + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
> + */
> +#define SYNC_IOC_SET_DEADLINE	_IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
> +
>  #endif /* _UAPI_LINUX_SYNC_H */
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
