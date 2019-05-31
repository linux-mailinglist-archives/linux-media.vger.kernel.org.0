Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E03314D9
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 20:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfEaSkb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 14:40:31 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46612 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbfEaSkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 14:40:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id m15so2260072ljg.13
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U0wScvKxFKE7JbkPIXZuIR0g3LhuFRFR9jDGWqQO4/w=;
        b=PHoFyR+2LxA2Emwm26VpdCXsVh5KhaVNgx4EdrS3fa35u4kTOyh/OV0TXBG2eTcJ23
         jv7vDAwuDFTZlsDI7429SFg/wzMiFQD7bgYu+uGCC8YbMa8wbJXCaNd842uotjxtX0NE
         4t1Q3E8/ibRp/+RiMUPEJi2poy1jcAeeIT3BOnFm+l7tw4x6waO2AVdc6PvGFP0Clpjs
         OqOoyOjH2CFQQvwtrYmdY+dLBnAhva1ETxtSD+vy6SnVy7vFVJi/gkx68bKMEOWwfxV3
         NAGReQgGccQls7hLr4ljMzeMtjEKX6yjb7X158bmop2J8QTtc859XxAKU8xdcxVjUvgW
         08Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U0wScvKxFKE7JbkPIXZuIR0g3LhuFRFR9jDGWqQO4/w=;
        b=uoMSfNeA8TGDqU5hYYPf/WaQaKz8dDXVp1OQ+LjYLA88YOw2IfMLuqDRUN57xGtC2X
         bUYwZt7a5jmLYDPTD6tib8mP2NuV4O+TE60Udfq8iuSxT0Ou8M8Zojll68j/9VzKj99u
         O2T5lW35BSIRRejLYV6Md3sz2aCQtbsJzPnIQBBVkxPu9eFZPtgSeoMdNp71UK0mVb2W
         IB4LNQHY2BjKcQQs0ZEVZSp+ACONeFwV54ySyKMmL/BZa0Nls77xOWzcLj3HCTnDgrty
         6pLru10BHMKyTnIf0KJRpGE+Pyw8fWCEphDrc1KpoN5sE/JpYoKPDH1Nj3+bIHfCA1u4
         obyQ==
X-Gm-Message-State: APjAAAWoncsx/g+IGOlBO+xJpVjbhwjhKiVpPiovGI8StC6l8Z80OVQD
        DOkKerYmBCgeWQDZbHHbh2Q=
X-Google-Smtp-Source: APXvYqwRlB9cZml7nIRuxSqwDYOqw6f2+SORdOLK8uAcCUwv0qs2mOUDLrklc3u2YWArfj5a2OXblQ==
X-Received: by 2002:a2e:9d43:: with SMTP id y3mr5848398ljj.154.1559328029508;
        Fri, 31 May 2019 11:40:29 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id n1sm1296533lfl.77.2019.05.31.11.40.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 11:40:28 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RESEND PATCH 1/1] v4l2-subdev: Try formats are only available if subdev API is enabled
Date:   Fri, 31 May 2019 20:40:26 +0200
Message-ID: <4923128.VWv0Upv8b6@z50>
In-Reply-To: <20190531115426.15697-1-sakari.ailus@linux.intel.com>
References: <20190531115426.15697-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Friday, May 31, 2019 1:54:26 PM CEST Sakari Ailus wrote:
> Return an error for which == V4L2_SUBDEV_FORMAT_TRY if
> CONFIG_VIDEO_V4L2_SUBDEV_API is not enabled.  This is because the try
> formats are not available in that case. 

As far as I can see, there are 21 V4L2 subdevice drivers which don't support 
V4L2 subdev API but implement V4L2_SUBDEV_FORMAT_TRY operation mode somehow.  
Someone already took that decision in the past and replaced video operation 
callbacks with pad operation callbacks supporting V4L2_SUBDEV_FORMAT_TRY 
without the requirement for V4L2 subdev API support.

With this change in place, those drivers will loose that functionality if 
built without CONFIG_VIDEO_V4L2_SUBDEV_API, but will happily work as before 
otherwise.  That's probably not exactly what you intended.

> Do the check here so that drivers
> don't need to.

So only beneficiaries of this change will be V4L2 subdevice drivers which don't 
support V4L2 subdev API and don't support V4L2_SUBDEV_FORMAT_TRY.  Existing 
drivers of that kind already have that check in place and I can hardly imagine 
someone is going to optimize them by removing it.  Any new drivers will 
probably support V4L2 subdev API from the beginning so they'll not benefit from 
this patch at all as they won't build without CONFIG_VIDEO_V4L2_SUBDEV_API.

I think that if a driver doesn't support V4L2_SUBDEV_FORMAT_TRY, it should 
simply check for that value itself and respond accordingly, no matter if it 
supports V4L2 subdev API or not.  As time passes, old drivers will be either 
depreciated or refreshed to handle V4L2_SUBDEV_FORMAT_TRY the V4L2 subdev API 
way, as we would like them to.

Thanks,
Janusz


> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Depends-on: ("media: v4l2-subdev: Verify v4l2_subdev_call() pad config 
argument")
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/
v4l2-subdev.c
> index 34219e489be27..88b4b9d7c41be 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -122,7 +122,10 @@ static int subdev_close(struct file *file)
>  
>  static inline int check_which(__u32 which)
>  {
> -	if (which != V4L2_SUBDEV_FORMAT_TRY &&
> +	if (
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> +	    which != V4L2_SUBDEV_FORMAT_TRY &&
> +#endif
>  	    which != V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return -EINVAL;
>  
> 




