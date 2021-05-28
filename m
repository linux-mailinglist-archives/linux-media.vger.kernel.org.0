Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A060D3944AF
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 16:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbhE1O6x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 10:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236854AbhE1O6e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 10:58:34 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C59C061344;
        Fri, 28 May 2021 07:56:40 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id o27so4324307qkj.9;
        Fri, 28 May 2021 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b9+9w75fRz1FwVKb4mTM82fVuffe3lmGj10rEC8QhT8=;
        b=Wy76Sv4AtgBSfbImUwDTGffqAAwqD10bpBKMLf65ktN+3VSBS1qJLSCJ24cdKP4hna
         chrIMw6Ow4g6oMSSj8WzDZU3Y0YhikS+Yow8XOZ6hXLCBF5LyOM3FyseCK9RoQoQy+Ro
         c9IY1MR8P56kEi+GCuVWrMfi204nNoRZU1oTPabNZ7+jSLII6n6csYXQ9cLHw+XxmDb4
         vev8TugphrZo0OzuvxsZSH2BSdGeUHkp8nQzIMXCPRB7c7GDIMnyCjb7Qt1nwdx9utVy
         gdR2uYcw2nJBclZfLlp+6oSpeK3tOEaO2Kbp4BVf1+bmhOm6lN236U7RkD49L0Aos+Fu
         SmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b9+9w75fRz1FwVKb4mTM82fVuffe3lmGj10rEC8QhT8=;
        b=hTNN19uCyD3uTxSOJukKpw/4dvR9ifhWRBXODwdh/fry/d1v9iW39+BAHJJti8xWMQ
         +BApbZUdwouGkxHN+2Ivy8XTKRJlUdEyUlCFABq2FtXYecAixS6oc2oB4J5dNSS9rt2v
         N2c+t6xRYxkFBncVtBP8ButOyaNJJ8l0hTRB2IeRXRyHqSnVWHc8dOiTZBPiah/pOVgN
         QDKIrT6T29xZw6nQTeAbssI60u6yEf6orHGgmMhMzEMw5IdouQZfUIKOdfpzJlhJMOEs
         jPIvbUxif0lqKx6RQv3AO6k6Hd+ZNhsTE+El2cGdiuf/WxpW+qw6Load5wG8/uIyAmzx
         cpuA==
X-Gm-Message-State: AOAM533YYOxCuPlwe37BgNQ6OHc8cYFz+daXl7cGlX04xqHrhCH/PLuN
        L23/168EimsmQHm2it3s5gQ=
X-Google-Smtp-Source: ABdhPJzTqTOm7PGIS1rva4SBBmgalq+99orUQlgs2+tNDb3PWcO23e+Xo3Bz89L4eXwCONQ2UyvByQ==
X-Received: by 2002:a05:620a:22ca:: with SMTP id o10mr4223431qki.258.1622213799977;
        Fri, 28 May 2021 07:56:39 -0700 (PDT)
Received: from ?IPv6:2804:14c:125:811b:fbbc:3360:40c4:fb64? ([2804:14c:125:811b:fbbc:3360:40c4:fb64])
        by smtp.gmail.com with ESMTPSA id v18sm3592086qkv.34.2021.05.28.07.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 May 2021 07:56:39 -0700 (PDT)
Subject: Re: [PATCH v5] media: em28xx: Fix race condition between open and
 init function
To:     Hillf Danton <hdanton@sina.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     mchehab@kernel.org, skhan@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
References: <20210507193457.14819-1-igormtorrente@gmail.com>
 <20210528075257.2469-1-hdanton@sina.com>
From:   Igor Torrente <igormtorrente@gmail.com>
Message-ID: <c8bd80bd-e6d1-2c47-c606-351cba92e04a@gmail.com>
Date:   Fri, 28 May 2021 11:56:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210528075257.2469-1-hdanton@sina.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hillf,

On 5/28/21 4:52 AM, Hillf Danton wrote:
> On 07/05/2021 21:34, Igor Matheus Andrade Torrente wrote:
>> Fixes a race condition - for lack of a more precise term - between
>> em28xx_v4l2_open and em28xx_v4l2_init, by detaching the v4l2_dev
>> struct from the em28xx_v4l2, and managing the em28xx_v4l2 and v4l2_dev
>> life-time with the v4l2_dev->release() callback.
> 
> This is a bit more complicated than the rare race deserves and IMHO rcu can
> help detect it.
> 
> The diff below 1) frees em28xx_v4l2 through rcu 2) checks race under rcu lock
> on the open side.
> 
> Note it is only for idea and thoughts are welcome if it makes sense to you.
> 

I didn't know what was the purpose of rcu, so I took some minutes to 
study it.

If I understood correctly it solves the issue more easily and with way 
fewer changes in the existing code.

Hans, what do you think?

> 
> +++ x/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2113,6 +2113,13 @@ static int radio_s_tuner(struct file *fi
>   	return 0;
>   }
>   
> +static void em28xx_v4l2_rcufn(struct rcu_head *r)
> +{
> +	struct em28xx_v4l2 *v4l2 = container_of(r, struct em28xx_v4l2, rcu);
> +
> +	kfree(v4l2);
> +}
> +
>   /*
>    * em28xx_free_v4l2() - Free struct em28xx_v4l2
>    *
> @@ -2125,7 +2132,13 @@ static void em28xx_free_v4l2(struct kref
>   	struct em28xx_v4l2 *v4l2 = container_of(ref, struct em28xx_v4l2, ref);
>   
>   	v4l2->dev->v4l2 = NULL;
> -	kfree(v4l2);
> +	call_rcu(&v4l2->rcu, em28xx_v4l2_rcufn);
> +}
> +
> +static void em28xx_put_v4l2(struct em28xx_v4l2 *v4l2)
> +{
> +	if (v4l2)
> +		kref_put(&v4l2->ref, em28xx_free_v4l2);
>   }
>   
>   /*
> @@ -2136,10 +2149,18 @@ static int em28xx_v4l2_open(struct file
>   {
>   	struct video_device *vdev = video_devdata(filp);
>   	struct em28xx *dev = video_drvdata(filp);
> -	struct em28xx_v4l2 *v4l2 = dev->v4l2;
> +	struct em28xx_v4l2 *v4l2;
>   	enum v4l2_buf_type fh_type = 0;
>   	int ret;
>   
> +	rcu_read_lock();
> +	v4l2 = dev->v4l2;
> +	ret = v4l2 && kref_get_unless_zero(&v4l2->ref);
> +	rcu_read_unlock();
> +
> +	if (!ret)
> +		return -ENODEV;
> +
>   	switch (vdev->vfl_type) {
>   	case VFL_TYPE_VIDEO:
>   		fh_type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> @@ -2150,6 +2171,7 @@ static int em28xx_v4l2_open(struct file
>   	case VFL_TYPE_RADIO:
>   		break;
>   	default:
> +		em28xx_put_v4l2(v4l2);
>   		return -EINVAL;
>   	}
>   
> @@ -2157,8 +2179,10 @@ static int em28xx_v4l2_open(struct file
>   			video_device_node_name(vdev), v4l2_type_names[fh_type],
>   			v4l2->users);
>   
> -	if (mutex_lock_interruptible(&dev->lock))
> +	if (mutex_lock_interruptible(&dev->lock)) {
> +		em28xx_put_v4l2(v4l2);
>   		return -ERESTARTSYS;
> +	}
>   
>   	ret = v4l2_fh_open(filp);
>   	if (ret) {
> @@ -2166,6 +2190,7 @@ static int em28xx_v4l2_open(struct file
>   			"%s: v4l2_fh_open() returned error %d\n",
>   		       __func__, ret);
>   		mutex_unlock(&dev->lock);
> +		em28xx_put_v4l2(v4l2);
>   		return ret;
>   	}
>   
> @@ -2188,7 +2213,6 @@ static int em28xx_v4l2_open(struct file
>   	}
>   
>   	kref_get(&dev->ref);
> -	kref_get(&v4l2->ref);
>   	v4l2->users++;
>   
>   	mutex_unlock(&dev->lock);
> 

Thanks,
---
Igor M. A. Torrente
