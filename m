Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA123668FF
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 12:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238694AbhDUKRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 06:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbhDUKRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 06:17:10 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247C4C06174A;
        Wed, 21 Apr 2021 03:16:37 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id h20so21379104plr.4;
        Wed, 21 Apr 2021 03:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gDa9oTZfQRTnJaBXZvLtLg6d8IpAGa0lj0v6OYQNJ+c=;
        b=Wc/13pNsNqjLw2uUxT/IpQG7jmfX5ju7StOQiMj8ICk6WUZYtFoEBoi40Fjf9Z+CHM
         XpFEVCU675SZG87WERMj4bE/xUFPDHQTCyAjoFlszEp1DD/pRzS+qpqbnQPqDDNYsCWM
         3RnA650cqSQv5uUxCjjQiX2k1kRLhs89y8yh7ouWjcelPHkaNqmH2Q+s+aACbSQjO78F
         smArAeU2pAIZAO1rMWUzVNnRRzhDKmdrjspik1xiQTB5KSKJveWGo3NvwFaRIp/BlPPk
         V9ocAzbP5s2YKv7wGtEX16gjgTA3aM+1kt7VsO0yg32SExFOUvgs9oyAJEyY7xUL6Ofl
         +Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gDa9oTZfQRTnJaBXZvLtLg6d8IpAGa0lj0v6OYQNJ+c=;
        b=aQAfgI585gnE2k9IfXewPRRJloG9Q3FOt/JWdhEGw337cn88NNUeAqIEz2wj2jOWgv
         XZwC2kblz99mrMT2W6SVphQW2Np/BbNqbQumo4pAdEl8YWp8I+qZpe7WWxDOJE01MWkn
         Ea3BI/l1eQuPSQslJpiBTv8bwn9AaGSmUPkBj/8avym5pLeGvKCOW7NK5oLaCAuGIlW9
         3r8smr0wRFae5EXorxYGCZ3gDeaEaB0kVxYE3kConM0T6oS03QTZwo/lawjY5wZ+BNdt
         OnTXJEe0ysVPkUa7QPk3q0Y6ALiCAaA2BRxLjieC1OZVocy/W0LjsQc1l+5wInagyuBf
         URZg==
X-Gm-Message-State: AOAM531mLvHW/LRUQvkAY5DBwyLBAnWycg/20xCjUTtkQEAG68l09kkA
        +Y9tQfB44P7UVz7jwEQu3yo=
X-Google-Smtp-Source: ABdhPJycbAW/PUelPvUga866z6t6lXrR4uZfmFlYhqJvktcROY5zeLT0hwCQ3UrjSYma05M7qR72RA==
X-Received: by 2002:a17:902:8b81:b029:eb:5a4:9cae with SMTP id ay1-20020a1709028b81b02900eb05a49caemr33659303plb.13.1619000196723;
        Wed, 21 Apr 2021 03:16:36 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id n11sm1584135pff.96.2021.04.21.03.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 03:16:36 -0700 (PDT)
Date:   Wed, 21 Apr 2021 15:46:30 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: media: atomisp: use printk with KERN
 facility level
Message-ID: <20210421101630.GA216321@localhost>
References: <cover.1618859059.git.drv@mailo.com>
 <4947abeebc2cecca43137675519a2fb48577d3e5.1618859059.git.drv@mailo.com>
 <20210420083522.GA1411@agape.jhs>
 <20210420171353.GA193332@localhost>
 <20210421072216.GB1418@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421072216.GB1418@agape.jhs>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 09:22:17AM +0200, Fabio Aiuto wrote:
> On Tue, Apr 20, 2021 at 10:43:53PM +0530, Deepak R Varma wrote:
> > On Tue, Apr 20, 2021 at 10:35:23AM +0200, Fabio Aiuto wrote:
> > > Hi Deepak,
> > > 
> > > On Tue, Apr 20, 2021 at 12:46:40AM +0530, Deepak R Varma wrote:
> > > > printk() without KERN_<LEVEL> facility is flagged by checkpatch as a
> > > > warning. It is better to use pr_info() which comes with an
> > > > inbuilt KERN_INFO level.
> > > > 
> > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > ---
> > > >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > > index b572551f1a0d..a0f3c5c32f94 100644
> > > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > > @@ -1020,7 +1020,7 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
> > > >  		return -EINVAL;
> > > >  	}
> > > >  
> > > > -	printk("%s: before gc0310_write_reg_array %s\n", __func__,
> > > > +	pr_info("%s: before gc0310_write_reg_array %s\n", __func__,
> > > >  	       gc0310_res[dev->fmt_idx].desc);
> > > 
> > > in a driver is best recommended to replace a raw printk call
> > > with a dev_*() log. Check few lines above here to see
> > > how it is done.
> > 
> > Hello Fabio,
> > thank you for the feedback. Should I resubmit this patch with additional
> > printk() / pr_info() replacement by dev_*()? OR send in a new patch with
> > this change? Just want to make sure I am not including more than one
> > change type in the patch.
> > 
> > deepak.
> > 
> 
> Hi Deepak,
> 
> what I would do is to just resend this patch with replacement by dev_*(),
> which is just one change. Then if you want to replace all other
> raw printk/pr_*() occurrences is matter of another separate
> patch/series.
> 
Hi Fabio,
That sounds good. Thank you for your comments. I will resubmit the patch
set according to the feedbacks received.

Have a good day.
deepak.

> > > 
> > > 
> > > >  	ret = startup(sd);
> > > >  	if (ret) {
> > > > -- 
> > > > 2.25.1
> > > > 
> > > > 
> > > 
> > > 
> > > thank you,
> > > 
> > > fabio
> 
> thank you,
> 
> fabio
