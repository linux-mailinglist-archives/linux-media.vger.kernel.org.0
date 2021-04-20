Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C94365E64
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 19:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbhDTRUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 13:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbhDTRUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 13:20:21 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522F0C06174A;
        Tue, 20 Apr 2021 10:19:49 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id h15so8336994pfv.2;
        Tue, 20 Apr 2021 10:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MWCVnhZVx0e/HXHCYM4X9zm933kcphgizH/ZXwVIjJY=;
        b=o4rSqFhGbLO5aWgw112v9IVMdBP0QMN4U5o5Ye8d0YmMHQgnqFxepdqdulgACL4Bcz
         oC2Xtotv6lcnX+H6FPQYFkst3ro+h7ASxcUTzi8kCz48WlT//V984UkhTboO9khC0ALd
         T2j3EMsE1eUf+3cg2DekArkXONg/F/aamZ9xL65pR8qZOy6IszOMHIgPxWvhd5Py7NLV
         ierJWhuNIL+05VCTbtFrjag4GYwXWjQCYVjSeOvR2wHMp9XWHMbVq49FuCzHnXsVaZrJ
         SHGvch8VbTr8JCyT9FKs1Dvd9PGYcRxR4+zDo3CToYcQE+feUNGjZpnmR0JtgMYoDzk4
         GzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MWCVnhZVx0e/HXHCYM4X9zm933kcphgizH/ZXwVIjJY=;
        b=jeuzAyhV0yGML4Eib+bmIXEBoiu+mfmih3VqIdtN4EtKB7XdAqOQVJzDlndgsnpVe8
         lPp8QLpl32e3awI8iZFMhXyBG0+jxSFUh1GvSR2X4JaJH1c7sYg6qa5yOjDs97DcsF8L
         iubF1bprt/psH190Ho4PcytEao2TpvkiJzWclWr2rfR9GAluKQdhrjObfe44dG4r1Pvx
         3HZTXq4loz56EHtQ0POPSP9eGAAzmaY5Ad+MKFbAKhPeIip++E236ymVJjI3BistYPmz
         0qLnpsHWmdz4PTfSg2pmGvyR20tNDfg7DdmU4OdYc5L5zPlbxSN2BSKI8ANoqetnHdE6
         gYzg==
X-Gm-Message-State: AOAM530xAE12vladqZsJ0yH6EHUgPtjymELDIygGzfHvIqYdOsEB3XgY
        q8hTPqnXtvryXgP4Pq8ACos=
X-Google-Smtp-Source: ABdhPJyd+fTaLhmffOWYXLPSqTbYPTdHGn1dydQZd/k5VPkLtNx9ZpeiGBj6zTXxgyc6M0S1kL37KQ==
X-Received: by 2002:a62:b412:0:b029:21f:6b06:7bdd with SMTP id h18-20020a62b4120000b029021f6b067bddmr25767526pfn.51.1618939188862;
        Tue, 20 Apr 2021 10:19:48 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id n85sm1728924pfd.170.2021.04.20.10.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:19:48 -0700 (PDT)
Date:   Tue, 20 Apr 2021 22:49:43 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] staging: media: atomisp: improve function argument
 alignment
Message-ID: <20210420171943.GC193332@localhost>
References: <cover.1618859059.git.drv@mailo.com>
 <9b517e04d1a9b56dc14494a246d70915d51b1839.1618859059.git.drv@mailo.com>
 <401d7d5a-70b7-3443-8612-eb4812e22af1@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <401d7d5a-70b7-3443-8612-eb4812e22af1@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 20, 2021 at 03:24:32PM +0200, Hans Verkuil wrote:
> On 19/04/2021 21:12, Deepak R Varma wrote:
> > Improve multi-line function argument alignment according to the code style
> > guidelines. Resolves checkpatch feedback: "Alignment should match
> > open parenthesis".
> > 
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> 
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Deepak R Varma <mh12gx2825@gmail.com>' != 'Signed-off-by: Deepak R Varma
> <drv@mailo.com>'
> 
> Which email should I use? Ideally you should post from the same email
> as the Signed-off-by.

I am really sorry for this. I was trying to set up mutt to handle both
my accounts and guess that led to this issue. I will resubmit the patch
set with the appropriate email match. Will that be okay?

Thank you,
deepak.

> 
> Regards,
> 
> 	Hans
> 
> > ---
> >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
> >  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
> >  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > index 2b71de722ec3..6be3ee1d93a5 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > @@ -192,8 +192,8 @@ static int __gc0310_buf_reg_array(struct i2c_client *client,
> >  }
> >  
> >  static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
> > -	struct gc0310_write_ctrl *ctrl,
> > -	const struct gc0310_reg *next)
> > +					     struct gc0310_write_ctrl *ctrl,
> > +					     const struct gc0310_reg *next)
> >  {
> >  	if (ctrl->index == 0)
> >  		return 1;
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > index 78147ffb6099..6ba4a8adff7c 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > @@ -171,8 +171,8 @@ static int __gc2235_buf_reg_array(struct i2c_client *client,
> >  }
> >  
> >  static int __gc2235_write_reg_is_consecutive(struct i2c_client *client,
> > -	struct gc2235_write_ctrl *ctrl,
> > -	const struct gc2235_reg *next)
> > +					     struct gc2235_write_ctrl *ctrl,
> > +					     const struct gc2235_reg *next)
> >  {
> >  	if (ctrl->index == 0)
> >  		return 1;
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > index eecefcd734d0..aec7392fd1de 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > @@ -212,8 +212,8 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
> >  }
> >  
> >  static int __ov2722_write_reg_is_consecutive(struct i2c_client *client,
> > -	struct ov2722_write_ctrl *ctrl,
> > -	const struct ov2722_reg *next)
> > +					     struct ov2722_write_ctrl *ctrl,
> > +					     const struct ov2722_reg *next)
> >  {
> >  	if (ctrl->index == 0)
> >  		return 1;
> > 
> 
