Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50AB3365E4A
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 19:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbhDTROg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 13:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbhDTROd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 13:14:33 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83424C06138A;
        Tue, 20 Apr 2021 10:14:00 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id gq23-20020a17090b1057b0290151869af68bso1120687pjb.4;
        Tue, 20 Apr 2021 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R77m3F4i97NmmSVEA2bHSKCUsR1Gzu1DZmrx8rSZmnc=;
        b=VTRmmMAeH0YYoi+oBilo2Q4iN7ayI7LLhuBDsXA19erQB/nuBWQoLBc/VvIdfMH6sq
         dYS+sGWq+SrsopNpTBQk6bmsyrBAVLHhasYd8138OzFC59/yxnpBRcauLnl5FuPnoWEg
         XlsOD4/BpODTMOPdUymrVBRLNGZ/ss50LcWoln06ie/czZ6O2vHz0nYw4DJ0PiDUM5ur
         JW/Pb74D0CpdlW26QDI3YAunE4sAJWjcAHYj8laTUOhX/Ya6nleroFxhm3L5xDyZIaE4
         HfQeFrt2FrjP5r35I+frqiSocSIfjDTnVv6exrFhGYqcqvaAoCifzLte2/mtMmSkFbMS
         hOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R77m3F4i97NmmSVEA2bHSKCUsR1Gzu1DZmrx8rSZmnc=;
        b=LBEzQ/GEKd0oO9NtUVrM1UNWYZR+/RaVo6TNZRYt95U2CIRyL+iAo4qO7UFDKf191/
         Uz9JWqsOBpyefqtz7r3nTf6K3CH+ynTUvXkImXsJLD0cmAKO4FGf8tOsLk4+l+/jhVI/
         y7oJe301C4RFZ0dTqbYT0lhlEcBI7Bjcv7g1mPdIJhk3A/K5Asocri0UPIE84MpeLGJp
         H2L7kfAHSjGjtNchBxBTS2GWsSI1LAVvldls/ORE0Wu4RKFh1NKfobcu2UhtZglfY3tk
         /A8hDx5ywtKDYnccukIm+ViE50RBSz6dbBN4pAkFRpxMPQ9SbITjvM+1BGJ+RMthg0yT
         kVfw==
X-Gm-Message-State: AOAM532C8PgNcHW/jpM1CQvkiV2mnKSMoUMJSObb3JdOteE1PY4aUnWE
        QGmxJTaywrTxAQHqBiTTRU0=
X-Google-Smtp-Source: ABdhPJwYvfjmiYSQNfFp90LExzPEpgTLbSxxIMHwlXcbNKHtrHWWMDps1TqvHUb31ReFBoCNXf+XjA==
X-Received: by 2002:a17:90a:c788:: with SMTP id gn8mr5736725pjb.60.1618938840091;
        Tue, 20 Apr 2021 10:14:00 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id h11sm3035281pjs.52.2021.04.20.10.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:13:59 -0700 (PDT)
Date:   Tue, 20 Apr 2021 22:43:53 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: media: atomisp: use printk with KERN
 facility level
Message-ID: <20210420171353.GA193332@localhost>
References: <cover.1618859059.git.drv@mailo.com>
 <4947abeebc2cecca43137675519a2fb48577d3e5.1618859059.git.drv@mailo.com>
 <20210420083522.GA1411@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420083522.GA1411@agape.jhs>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 20, 2021 at 10:35:23AM +0200, Fabio Aiuto wrote:
> Hi Deepak,
> 
> On Tue, Apr 20, 2021 at 12:46:40AM +0530, Deepak R Varma wrote:
> > printk() without KERN_<LEVEL> facility is flagged by checkpatch as a
> > warning. It is better to use pr_info() which comes with an
> > inbuilt KERN_INFO level.
> > 
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > index b572551f1a0d..a0f3c5c32f94 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > @@ -1020,7 +1020,7 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
> >  		return -EINVAL;
> >  	}
> >  
> > -	printk("%s: before gc0310_write_reg_array %s\n", __func__,
> > +	pr_info("%s: before gc0310_write_reg_array %s\n", __func__,
> >  	       gc0310_res[dev->fmt_idx].desc);
> 
> in a driver is best recommended to replace a raw printk call
> with a dev_*() log. Check few lines above here to see
> how it is done.

Hello Fabio,
thank you for the feedback. Should I resubmit this patch with additional
printk() / pr_info() replacement by dev_*()? OR send in a new patch with
this change? Just want to make sure I am not including more than one
change type in the patch.

deepak.

> 
> 
> >  	ret = startup(sd);
> >  	if (ret) {
> > -- 
> > 2.25.1
> > 
> > 
> 
> 
> thank you,
> 
> fabio
