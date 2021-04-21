Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6844D366638
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235604AbhDUHWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbhDUHWy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:22:54 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B29C06174A;
        Wed, 21 Apr 2021 00:22:21 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z5so11587878edr.11;
        Wed, 21 Apr 2021 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N9Lu+2EkyPc97u3JeBNOPqYRH3WJQAnr+EGGrDKay8E=;
        b=LzfoePVob4Bl1Emm/wtoROFlrI0nj71/IeNXz/DLjHWOBMx6EPuz5L4P7yaSiaVMQX
         WgNcjSmK9m65HFTKwNoCrqtK3sQz+f2PrBGUIcF/SoTmEFMDmwpD1C1nm6WpwLx4ZF+f
         qGx/z2efX4mC12XzvJufdpo7oiqOtsz3zjnTVdmb/zEMj3BydWNQfoZuW7cdUWKaQWFg
         nawYky0ruz1u8sbHymhhDI8wu0IZpdKhGa7sKZ0WXR0yCeQP3QCqjmsHZWYOaOZtjUCu
         GQEnGwmQOCamvys5/TpUh9wpOm1yY4Rst0MS6CrxLoCinPSYUVPw4xUOL7w2rHi91Izj
         d8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N9Lu+2EkyPc97u3JeBNOPqYRH3WJQAnr+EGGrDKay8E=;
        b=qzVGd7yk562/E32nudcvSp/rlRX+3U0GCeoUN1f7t5v15U54NwxMsZQFSqIlvHPG49
         ok1Cg40j2dDZ1v0tWQXAPV8fs7FVUaXQOf5FmhzEh7BIcZVsZrJM9Bb7vdx03K+ey1Yh
         1WRBoNHnQDfkrvHpPhJKv7h9ZF2Ieti2uG4FfxILTcYDqa2v2TdqOdRGKtPyMQH7vatb
         nTHp+iBw8F8c3sYiPx97von2LAw30yZaTrgZTGJsnScXwUIdnPNazrKsy++AoPiiubDm
         bASe6y2WaReKYZsaFzhbrm8QLczfhCag3fqM7jjIrxI1ZYsuYaiK9yZTLuWwu3eQXDsH
         sFfg==
X-Gm-Message-State: AOAM530YX81s8d7wrPQHV+GC5RMz+8qjpzzIjR5/bBVP8njl/llPa0wg
        tBQhK1e6l3hQ/VzicYcGEIJ22ncR5vk=
X-Google-Smtp-Source: ABdhPJzHn6OUCv5g7dvApzrkAjmKrENzNxDgZkdOlTiceuQITIcNEsH57QsZojBKRuoi+wxrOj+DQg==
X-Received: by 2002:a05:6402:19a:: with SMTP id r26mr36512414edv.44.1618989740204;
        Wed, 21 Apr 2021 00:22:20 -0700 (PDT)
Received: from agape.jhs ([5.171.81.65])
        by smtp.gmail.com with ESMTPSA id l3sm2028913edr.2.2021.04.21.00.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:22:19 -0700 (PDT)
Date:   Wed, 21 Apr 2021 09:22:17 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <mh12gx2825@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: media: atomisp: use printk with KERN
 facility level
Message-ID: <20210421072216.GB1418@agape.jhs>
References: <cover.1618859059.git.drv@mailo.com>
 <4947abeebc2cecca43137675519a2fb48577d3e5.1618859059.git.drv@mailo.com>
 <20210420083522.GA1411@agape.jhs>
 <20210420171353.GA193332@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420171353.GA193332@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 20, 2021 at 10:43:53PM +0530, Deepak R Varma wrote:
> On Tue, Apr 20, 2021 at 10:35:23AM +0200, Fabio Aiuto wrote:
> > Hi Deepak,
> > 
> > On Tue, Apr 20, 2021 at 12:46:40AM +0530, Deepak R Varma wrote:
> > > printk() without KERN_<LEVEL> facility is flagged by checkpatch as a
> > > warning. It is better to use pr_info() which comes with an
> > > inbuilt KERN_INFO level.
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > index b572551f1a0d..a0f3c5c32f94 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > @@ -1020,7 +1020,7 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > -	printk("%s: before gc0310_write_reg_array %s\n", __func__,
> > > +	pr_info("%s: before gc0310_write_reg_array %s\n", __func__,
> > >  	       gc0310_res[dev->fmt_idx].desc);
> > 
> > in a driver is best recommended to replace a raw printk call
> > with a dev_*() log. Check few lines above here to see
> > how it is done.
> 
> Hello Fabio,
> thank you for the feedback. Should I resubmit this patch with additional
> printk() / pr_info() replacement by dev_*()? OR send in a new patch with
> this change? Just want to make sure I am not including more than one
> change type in the patch.
> 
> deepak.
> 

Hi Deepak,

what I would do is to just resend this patch with replacement by dev_*(),
which is just one change. Then if you want to replace all other
raw printk/pr_*() occurrences is matter of another separate
patch/series.

> > 
> > 
> > >  	ret = startup(sd);
> > >  	if (ret) {
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > 
> > 
> > thank you,
> > 
> > fabio

thank you,

fabio
