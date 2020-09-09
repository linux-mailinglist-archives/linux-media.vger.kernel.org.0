Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3D2263472
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 19:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730083AbgIIRUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 13:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728954AbgIIP0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Sep 2020 11:26:14 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB19C0619C2;
        Wed,  9 Sep 2020 08:13:33 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id 185so2675532oie.11;
        Wed, 09 Sep 2020 08:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CdaV3sDds66XXA89qA8qa8FAmNjF4GIYWa4lEyrs0nA=;
        b=CNGkYrVSh0ClcYmHGxQgDwF7dCr96BWhYxsE6aP8mh20b5vV01X2/lMWGA79bkvGhr
         wKYyOgldmSK4cb1368I4Rz5KapuKQN0cMeoyXUVj6HtShkBkWqtXqs+BgOmOtZOsKF3C
         sy0Mbzv7kw79Tdhk83AZkR5ArV4V2dzmAbjXnt0UwieBy1c49V1TDp8LJOqTetBLiLtc
         4y6VzuCYPCUecBRwa8LBYS0yL/Ayh/vtyX6niqp0ZOZNWVniKXhQ9rpuZk/YKCGdW359
         +syUwZl0k+mYlI0anKzm/gKoGX6JKYXuHao4wFiKggrOFdFHmDceIV7vGcVasYC4zwGI
         bYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CdaV3sDds66XXA89qA8qa8FAmNjF4GIYWa4lEyrs0nA=;
        b=GT5XHmYEZgzduU8tTkxdzwRscFP3IgIC57VeevhQ2wQCfsIa2C7ixHUtQZXDoOBOzx
         IeAKwnKfMqw55Yo5V832UEYbS4mjsAzqNzKt4buo5t7O2mnF3o4OUGR86G0BEej4QDM2
         snvi72OLOog2nbaC/vgarISXE5xqeQhDE9gMovXpATQfDN5EY8pl98W48GdUd2DGREYs
         CPC7AzFevLbb+FMCZ7ulAN/p5K83vsUFNOOmB+lSacAmD5dbDlE5z3soBJ+19ZMsbvCR
         CGrGTvYnWnC/jL8oUkN2KA4dpMi0bpWbotA3HFDbmlSsLgZok8cR5ToagH/OopxyJxSC
         txvg==
X-Gm-Message-State: AOAM532WJP+vd8J41wHKTxgL2vgMl6uKRbkK3iIaA3zbSY5p/r0Z7oTu
        i+9VUY4astI2cRm6mL/l3Ck=
X-Google-Smtp-Source: ABdhPJznUhCxaV9IJdYf3pJWQqcvHstvsFmPzksNL3TXEXGH0e39wsbjw0gg+Ci1aSTs2gwQ8xJ/+A==
X-Received: by 2002:a05:6808:287:: with SMTP id z7mr1002509oic.99.1599664412805;
        Wed, 09 Sep 2020 08:13:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j66sm393156otc.74.2020.09.09.08.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 08:13:32 -0700 (PDT)
Subject: Re: [kbuild] Re: [PATCH v2 5/5] media: uvcvideo: Abort uvc_v4l2_open
 if video device is unregistered
To:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200909121941.GY8321@kadam>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <3e5525e5-f403-7e0d-bfb3-e5569d2a8c8d@roeck-us.net>
Date:   Wed, 9 Sep 2020 08:13:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909121941.GY8321@kadam>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/9/20 5:19 AM, Dan Carpenter wrote:
> Hi Guenter,
> 
> url:    https://github.com/0day-ci/linux/commits/Guenter-Roeck/media-uvcvideo-Fix-race-conditions/20200909-121927 
> base:   git://linuxtv.org/media_tree.git master
> config: x86_64-randconfig-m001-20200909 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/media/usb/uvc/uvc_v4l2.c:553 uvc_v4l2_open() warn: possible memory leak of 'handle'
> 

Good catch. It is also missing a call to usb_autopm_put_interface().
I'll fix that in v3.

Thanks,
Guenter

> # https://github.com/0day-ci/linux/commit/50911975ff9b21d08ff5408e496683b8ac567b1c 
> git remote add linux-review https://github.com/0day-ci/linux 
> git fetch --no-tags linux-review Guenter-Roeck/media-uvcvideo-Fix-race-conditions/20200909-121927
> git checkout 50911975ff9b21d08ff5408e496683b8ac567b1c
> vim +/handle +553 drivers/media/usb/uvc/uvc_v4l2.c
> 
> bec43661b1dc00 drivers/media/video/uvc/uvc_v4l2.c Hans Verkuil     2008-12-30  530  static int uvc_v4l2_open(struct file *file)
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  531  {
> 35f02a681b72ec drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-06-28  532  	struct uvc_streaming *stream;
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  533  	struct uvc_fh *handle;
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  534  	int ret = 0;
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  535  
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  536  	uvc_trace(UVC_TRACE_CALLS, "uvc_v4l2_open\n");
> 35f02a681b72ec drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-06-28  537  	stream = video_drvdata(file);
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  538  
> 35f02a681b72ec drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-06-28  539  	ret = usb_autopm_get_interface(stream->dev->intf);
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  540  	if (ret < 0)
> 716fdee110ceb8 drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-09-29  541  		return ret;
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  542  
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  543  	/* Create the device handle. */
> f14d4988c28e52 drivers/media/usb/uvc/uvc_v4l2.c   Laurent Pinchart 2018-01-16  544  	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
>                                                                                         ^^^^^^^^^^^^^^^^
> 
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  545  	if (handle == NULL) {
> 35f02a681b72ec drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-06-28  546  		usb_autopm_put_interface(stream->dev->intf);
> 716fdee110ceb8 drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-09-29  547  		return -ENOMEM;
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  548  	}
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  549  
> 17706f5653a90f drivers/media/usb/uvc/uvc_v4l2.c   Laurent Pinchart 2013-04-25  550  	mutex_lock(&stream->dev->lock);
> 50911975ff9b21 drivers/media/usb/uvc/uvc_v4l2.c   Guenter Roeck    2020-09-08  551  	if (!video_is_registered(&stream->vdev)) {
> 50911975ff9b21 drivers/media/usb/uvc/uvc_v4l2.c   Guenter Roeck    2020-09-08  552  		mutex_unlock(&stream->dev->lock);
> 50911975ff9b21 drivers/media/usb/uvc/uvc_v4l2.c   Guenter Roeck    2020-09-08 @553  		return -ENODEV;
>                                                                                                 ^^^^^^^^^^^^^^
> kfree(handle);
> 
> 50911975ff9b21 drivers/media/usb/uvc/uvc_v4l2.c   Guenter Roeck    2020-09-08  554  	}
> 17706f5653a90f drivers/media/usb/uvc/uvc_v4l2.c   Laurent Pinchart 2013-04-25  555  	if (stream->dev->users == 0) {
> 17706f5653a90f drivers/media/usb/uvc/uvc_v4l2.c   Laurent Pinchart 2013-04-25  556  		ret = uvc_status_start(stream->dev, GFP_KERNEL);
> 35f02a681b72ec drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-06-28  557  		if (ret < 0) {
> 17706f5653a90f drivers/media/usb/uvc/uvc_v4l2.c   Laurent Pinchart 2013-04-25  558  			mutex_unlock(&stream->dev->lock);
> a82a45f65377b0 drivers/media/usb/uvc/uvc_v4l2.c   Oliver Neukum    2013-01-10  559  			usb_autopm_put_interface(stream->dev->intf);
> 04a37e0f32f988 drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-05-19  560  			kfree(handle);
> 716fdee110ceb8 drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-09-29  561  			return ret;
> 04a37e0f32f988 drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-05-19  562  		}
> 04a37e0f32f988 drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-05-19  563  	}
> 04a37e0f32f988 drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-05-19  564  
> 17706f5653a90f drivers/media/usb/uvc/uvc_v4l2.c   Laurent Pinchart 2013-04-25  565  	stream->dev->users++;
> 17706f5653a90f drivers/media/usb/uvc/uvc_v4l2.c   Laurent Pinchart 2013-04-25  566  	mutex_unlock(&stream->dev->lock);
> 17706f5653a90f drivers/media/usb/uvc/uvc_v4l2.c   Laurent Pinchart 2013-04-25  567  
> d8da7513bcf983 drivers/media/usb/uvc/uvc_v4l2.c   Hans Verkuil     2015-03-09  568  	v4l2_fh_init(&handle->vfh, &stream->vdev);
> b4012002f3a398 drivers/media/video/uvc/uvc_v4l2.c Hans de Goede    2012-04-08  569  	v4l2_fh_add(&handle->vfh);
> 8e113595edf074 drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-07-01  570  	handle->chain = stream->chain;
> 35f02a681b72ec drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-06-28  571  	handle->stream = stream;
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  572  	handle->state = UVC_HANDLE_PASSIVE;
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  573  	file->private_data = handle;
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  574  
> 716fdee110ceb8 drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2009-09-29  575  	return 0;
> c0efd232929c2c drivers/media/video/uvc/uvc_v4l2.c Laurent Pinchart 2008-06-30  576  }
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org 
> 
> 
> _______________________________________________
> kbuild mailing list -- kbuild@lists.01.org
> To unsubscribe send an email to kbuild-leave@lists.01.org
> 

