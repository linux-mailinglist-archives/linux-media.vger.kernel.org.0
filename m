Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 427193632EA
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 03:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236844AbhDRBQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 21:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhDRBQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 21:16:26 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759A3C06174A;
        Sat, 17 Apr 2021 18:15:59 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id 10so11957536pfl.1;
        Sat, 17 Apr 2021 18:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qqQD+Z+nB253nZVtVgtT7wguG++YUWkZJfAWayHbIMA=;
        b=rSZgdiq/JQSjvPadvBL8HXojf3/Yvg9cZO4T/kfRY2AtMpT4CIvkRo2KbqTJQ9zsWY
         +dj/U6eCvVTaeSE4rkkUswZ8DL5XtJ0YB+icdwdqdW5L39s5ExKP0YdYcIv38FXl2ABp
         suihlOUE0sTHhMmcg46tC4WaHRaAeNNLkbsjCquHu8j/7f+vYHSsnlFmsh6xZADaEIMe
         ouXMXgYP6oPcrfEYzSZZ01O9pzCcT6cKcplxNIpgwrW2egYnceFku7AnDAG0kAOoV5Fx
         HtXXQU4Z3qUKThoeUffoUXlWJjSf/RJSLMGAWENTB9/2D66E/AQ/ke5GaHNLGJRd0Ww8
         WdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qqQD+Z+nB253nZVtVgtT7wguG++YUWkZJfAWayHbIMA=;
        b=m1KtyBL0pCK7KsfKSEgOpWG/5F+36AQ4lfoWol8sQ49QZfWWqCrDFKMCaoIaVMTtmi
         O5Z5sVDFxblIZGIAf1+pnRQOg00LwnlHrFMxGyVhq42RbXa9G82mdjvjbUS4+agIh2qu
         haRDXw75g3Nb6isYCWa29IVfVG5cWkr0oaxRgDmXQnBWMaMz+WehSX76AsdPYwU+x08U
         faQhphAkwEi4zG9lRanBAwR8Jxmp5DxhH/m9IDP6EV1N+t62tMsJt0gRLQ9Ps/8n/Xtc
         TDYmoXnYoa3I5qAm4Jkqpc1saXUPHNZarn2UKiE8pj5/LBQKaHRqBSKFRf5LlGmCYL43
         UAuA==
X-Gm-Message-State: AOAM5327ttkhcOGTNJMGyoOC6Z5nhm4JmX7ZWIVKJQxsIZYcpeR/O+t/
        +nOqwh3GYXHCogAAk3+pJwg=
X-Google-Smtp-Source: ABdhPJyr+az8NIkaFWezrqNfAZqgCpRd5QpWgpKzKFc4q+YbvntIZuMF2sJgqA4PT374h/CbaesWkA==
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id n15-20020a62e50f0000b02902148e4aae46mr13989383pff.73.1618708558555;
        Sat, 17 Apr 2021 18:15:58 -0700 (PDT)
Received: from ashish-NUC8i5BEH ([122.177.44.217])
        by smtp.gmail.com with ESMTPSA id r14sm9943710pjz.43.2021.04.17.18.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 18:15:58 -0700 (PDT)
From:   Ashish Kalra <eashishkalra@gmail.com>
X-Google-Original-From: Ashish Kalra <ashish@ashish-NUC8i5BEH>
Date:   Sun, 18 Apr 2021 06:45:52 +0530
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     'Mauro Carvalho Chehab' <mchehab@kernel.org>,
        Ashish Kalra <eashishkalra@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: atomisp: silence "dubious: !x | !y" warning
Message-ID: <20210418011552.GA4023@ashish-NUC8i5BEH>
References: <20210417153627.GA50228@ashish-NUC8i5BEH>
 <20210417205613.5c1aac74@coco.lan>
 <509f019decae433cab6cb367cdfa6fa9@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509f019decae433cab6cb367cdfa6fa9@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 17, 2021 at 09:31:32PM +0000, David Laight wrote:
> From: Mauro Carvalho Chehab
> > Sent: 17 April 2021 19:56
> > 
> > Em Sat, 17 Apr 2021 21:06:27 +0530
> > Ashish Kalra <eashishkalra@gmail.com> escreveu:
> > 
> > > Upon running sparse, "warning: dubious: !x | !y" is brought to notice
> > > for this file.  Logical and bitwise OR are basically the same in this
> > > context so it doesn't cause a runtime bug.  But let's change it to
> > > logical OR to make it cleaner and silence the Sparse warning.
> 
> The old code is very likely to by slightly more efficient.
> 
> It may not matter here, but it might in a really hot path.
> 
> Since !x | !y and !x || !y always have the same value
> why is sparse complaining at all.
> 
> 	David
This warning is coming from sparse as per below explanation

As the name suggests, a "bitwise" expression is one that is restricted to
only a certain "bitwise" operations that make sense within that class. In
particular, you can't mix a "bitwise" class with a normal integer
expression
Warning:
int __bitwise i;
int __bitwise j;
the two variables "i" and "j" are _not_ compatible, simply because they
were declared separately, while in the case of
	int __bitwise i, j;
they _are_ compatible.

https://yarchive.net/comp/linux/sparse.html
> 
> > >
> > > Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
> > > ---
> > >  .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > > index 358cb7d2cd4c..3b850bb2d39d 100644
> > > --- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > > +++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > > @@ -58,7 +58,7 @@ sh_css_vf_downscale_log2(
> > >  	unsigned int ds_log2 = 0;
> > >  	unsigned int out_width;
> > >
> > > -	if ((!out_info) | (!vf_info))
> > > +	if ((!out_info) || (!vf_info))
> > 
> > 
> > While here, please get rid of the unneeded parenthesis:
> > 
> > 	if (!out_info || !vf_info)
> > 
> > 
> > >  		return -EINVAL;
> > >
> > >  	out_width = out_info->res.width;
> > 
> > 
> > 
> > Thanks,
> > Mauro
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
