Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 064F5364C0
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 21:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfFETdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 15:33:46 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42389 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbfFETdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 15:33:45 -0400
Received: by mail-lf1-f66.google.com with SMTP id y13so19959601lfh.9
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 12:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YIuAqTIpirq6QOjDNoodk08ZwhN6BFrwvKCFx4RhNwg=;
        b=TWD4tesSv2c9e2RrLe7zr9QEaQnFuwAWOXKyS7bGg8P5uGzKfc9gVWF1T9hoMrD+Zt
         PDoWE1242F0SVwYYF9gcg4z8lO1RYGZC3a9N8e0Fmj/r9PWw5guJ58sr0k6yutfU1PAo
         u96g187G6M++az10FNukTuH7mNwuX3TKff8paP6NMzszzbFQuyMxH9rtALHjp4EFspxR
         pAv4OqeflbsCfhY28B3ovgDuIxBC+O1OBlgPCWLTInNFamYtODaQjIZ2pdjYZ5dn9eku
         /9wf2DF3+eKcDEa1j6ggc7usadUYp59gyZ6eOXtwyOzXctfrYKEB+gDz5iiq6nivJNSx
         KkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YIuAqTIpirq6QOjDNoodk08ZwhN6BFrwvKCFx4RhNwg=;
        b=tX6GPNuPWCSMvjMdteN2NIKF+cOefenitUw48tFR8nPMGPUDMz5FFpFEh73Gah2e8V
         Gey3ge2GlnR9fGypO93VG8xm0vi4L7XoCozQb1+uYadW7C2L6tNIXINLViiw3HmUzKJL
         Y+bat+9Ajqwpve3QaIB21G90CUyF3O/AMeEUl5Wh1ZzVIzjEKZGXULbxOxgbwy3B98M2
         4KyhJPrwz2eAR4Ff2cxuY8gDSus0vNlXPDpJ5rWU+eHNRNALHIwZHkiHV3HdeCH4Uc1R
         gBE1ZRpP5hk+ciGD4wcc4l2Ri63fCMkK2bNia8h4hasp1t1SB1jvy1eiwk8VbNnNnSUM
         ICIQ==
X-Gm-Message-State: APjAAAWYRCG1Jjyk0tKJBiyD0C4rWmJZ0+Zvzuar7sQHJhB5r1gcBJcA
        XEeE18cdxSYvHSwZSi9me3o=
X-Google-Smtp-Source: APXvYqw6AvbLlMrddiSPlQmGPRoYKsnH/9AKH89Czd1QWKUBpGKE40cQaBQA285iCQ+9RWD2k2tB2Q==
X-Received: by 2002:a19:5007:: with SMTP id e7mr22788410lfb.76.1559763223676;
        Wed, 05 Jun 2019 12:33:43 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id m17sm573551lji.16.2019.06.05.12.33.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 12:33:42 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        m.felsch@pengutronix.de, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC 1/1] v4l2-subdev: Rework subdev format and selection macros to work without MC
Date:   Wed, 05 Jun 2019 21:33:41 +0200
Message-ID: <1846727.Tl316bQTBL@z50>
In-Reply-To: <20190604175731.20596-1-sakari.ailus@linux.intel.com>
References: <20190604175731.20596-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tuesday, June 4, 2019 7:57:31 PM CEST Sakari Ailus wrote:
> Rework the macros for accessing subdev try formats to work meaningfully
> and relatively safely without V4L2 sub-device uAPI (and without MC). This
> is done by simply reverting to accessing the pad number zero if
> CONFIG_VIDEO_V4L2_SUBDEV_API isn't enabled, and emitting a kernel warning
> if the pad is non-zero in that case.
> 
> The functions are seen useful if subdev uAPI is disabled for drivers that
> can work without the Kconfig option but benefit from the option if it's
> enabled.

I'm not sure which drivers you (we) consider valid users of those functions.  
Subdevice drivers only? Or other drivers which interact with subdevices as 
well?  An answer to that question determines my possible other comments.

Thanks,
Janusz

> As a by-product, the patch simplifies individual inline functions by
> removing two lines of code from each of them and moving the functionality
> to a common macro.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi guys,
> 
> This might not be pretty but should provide some comfort for drivers
> working with different Kconfig options. Comments are welcome...
> 
>  include/media/v4l2-subdev.h | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e1e3c18c3fd6..3328f302326b 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -930,6 +930,17 @@ struct v4l2_subdev_fh {
>  	container_of(fh, struct v4l2_subdev_fh, vfh)
>  
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
> +	(WARN_ON(!(__cfg)) ? NULL :		\
> +	 ((__sd)->entity.graph_obj.mdev ?				
\
> +	  (WARN_ON((__pad) >= (__sd)->entity.num_pads) ?		\
> +	   NULL : &(__cfg)[__pad].__field) :				
\
> +	  &(__cfg)[WARN_ON(__pad) && 0].__field))
> +#else /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> +#define __v4l2_subdev_get_try_field(__sd, __cfg, __pad, __field)	\
> +	(WARN_ON(!(__cfg)) ? NULL :				
	\
> +	 &(__cfg)[WARN_ON(__pad) && 0].__field)
> +#endif /* !CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
>  /**
>   * v4l2_subdev_get_try_format - ancillary routine to call
> @@ -944,9 +955,7 @@ static inline struct v4l2_mbus_framefmt
>  			    struct v4l2_subdev_pad_config *cfg,
>  			    unsigned int pad)
>  {
> -	if (WARN_ON(pad >= sd->entity.num_pads))
> -		pad = 0;
> -	return &cfg[pad].try_fmt;
> +	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_fmt);
>  }
>  
>  /**
> @@ -962,9 +971,7 @@ static inline struct v4l2_rect
>  			  struct v4l2_subdev_pad_config *cfg,
>  			  unsigned int pad)
>  {
> -	if (WARN_ON(pad >= sd->entity.num_pads))
> -		pad = 0;
> -	return &cfg[pad].try_crop;
> +	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_crop);
>  }
>  
>  /**
> @@ -980,11 +987,8 @@ static inline struct v4l2_rect
>  			     struct v4l2_subdev_pad_config *cfg,
>  			     unsigned int pad)
>  {
> -	if (WARN_ON(pad >= sd->entity.num_pads))
> -		pad = 0;
> -	return &cfg[pad].try_compose;
> +	return __v4l2_subdev_get_try_field(sd, cfg, pad, try_compose);
>  }
> -#endif
>  
>  extern const struct v4l2_file_operations v4l2_subdev_fops;
>  
> 




