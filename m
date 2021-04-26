Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A26436B807
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 19:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235626AbhDZRX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 13:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235079AbhDZRX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 13:23:27 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D295FC061574;
        Mon, 26 Apr 2021 10:22:43 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n2so3552394wrm.0;
        Mon, 26 Apr 2021 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g5ISx3ZFufig4gVWW7AEl+hfObZvr1QFht5u3c6PaWQ=;
        b=WinhkBt3HrjbxFH7MkFPXJt70xlZRcSr+UoYuzdd6S/TOpr5tKwHSF1Ipl6uZXFxzt
         OH0gbFlw0NthX9FamnTeIISKPqSl6ihrGIwtcb4we3MOjcNHFqIxjUe4jAP99pYRyRcz
         +2RHCVkih1XuCK/gPqSS12dGNZvFgi4JrS0brOYCQhGyAHcuNdAkCYoPsL0HcHF2hd0p
         OVZRizgLnoSlG8whGR5Dv0UeJRJSgMRnW7Ur3uBgMYSl8XjAswbj7CyxK7cjdNfVEeOQ
         AGiR1B6o6u4jF8VNWmz9XjVZkGLcdshdnWJvdGgoaV/tm/E4CEnauM9Vdh/AG+N0GzeY
         YJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g5ISx3ZFufig4gVWW7AEl+hfObZvr1QFht5u3c6PaWQ=;
        b=MYYcpzkhVTL6WtpuO+RqNcO4+6Gg1nEEzmUBRr1/4RPfQ69jatDsldeQcHgqfovuoy
         AY5c9+uYNojJiMPGVRobd6zcxPvFJdG1BpqdMik4OLBnsbcvzG8WF9u03BjYUzY6910A
         owd0tnvUHaUyXwDzDFaRYxISSfJG2PzLWv7ZGKjtq0mgaXgoZU+hXrhFKqSoeyUOHySk
         hkV/4/ychGOkjgHyVw2C18Dz3hP4tNFrLnmZN3gorj6Rmb6QdNpWhBTmD4nPtBFUOvyc
         4me0GAt2ClPN9cumEPBulK1MsZU3smUFvUUx1d1sXzaBECgHPHiPrjVjYAtLoGZHyIta
         CJ/Q==
X-Gm-Message-State: AOAM530ZqOF8q6qgWdD2NHeEHYVTB9X0YvJN206e5MTJC+oIphzxlLz7
        8xgF4cYFxu7SsHRGC5dLKWE=
X-Google-Smtp-Source: ABdhPJz14BukFC3vUHYMTTqKZJulA0hhVx6VfLnchhTPquG4dlpmuyvbAVdsx9kKw+p4vXSYAMjgKg==
X-Received: by 2002:a5d:58d8:: with SMTP id o24mr10850742wrf.288.1619457762602;
        Mon, 26 Apr 2021 10:22:42 -0700 (PDT)
Received: from agape.jhs ([5.171.81.25])
        by smtp.gmail.com with ESMTPSA id p5sm5987373wma.45.2021.04.26.10.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 10:22:42 -0700 (PDT)
Date:   Mon, 26 Apr 2021 19:22:39 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/6] staging: media: atomisp: balance braces
 around if...else block
Message-ID: <20210426172238.GA1409@agape.jhs>
References: <cover.1619199344.git.drv@mailo.com>
 <71220662c5facd746e56288cc74786c96fa3c5a7.1619199344.git.drv@mailo.com>
 <20210426095610.GA1418@agape.jhs>
 <YIbOfjrPG+NIH4wV@192.168.1.8>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIbOfjrPG+NIH4wV@192.168.1.8>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 26, 2021 at 08:00:22PM +0530, Deepak R Varma wrote:
> On Mon, Apr 26, 2021 at 11:56:11AM +0200, Fabio Aiuto wrote:
> > On Sun, Apr 25, 2021 at 02:12:20PM +0530, Deepak R Varma wrote:
> > > Balance braces around the if else blocks as per the code style guidelines.
> > > Resolves checkpatch script CHECK / WARNING feedback messages.
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > > 
> > > Changes since v2:
> > >    - None.
> > > Changes since v1:
> > >    - None.
> > > 
> > >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c  | 4 ++--
> > >  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 4 ++--
> > >  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
> > >  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c  | 7 ++++---
> > >  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 4 ++--
> > >  5 files changed, 12 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > index 6be3ee1d93a5..d68a2bcc9ae1 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > @@ -872,9 +872,9 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
> > >  {
> > >  	int ret;
> > >  
> > > -	if (on == 0)
> > > +	if (on == 0) {
> > >  		return power_down(sd);
> > > -	else {
> > > +	} else {
> > >  		ret = power_up(sd);
> > >  		if (!ret)
> > >  			return gc0310_init(sd);
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > > index 6ba4a8adff7c..e722c639b60d 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > > @@ -658,9 +658,9 @@ static int gc2235_s_power(struct v4l2_subdev *sd, int on)
> > >  {
> > >  	int ret;
> > >  
> > > -	if (on == 0)
> > > +	if (on == 0) {
> > >  		ret = power_down(sd);
> > > -	else {
> > > +	} else {
> > >  		ret = power_up(sd);
> > >  		if (!ret)
> > >  			ret = __gc2235_init(sd);
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > > index f5de81132177..465fc4468442 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > > @@ -568,9 +568,9 @@ static int power_down(struct v4l2_subdev *sd)
> > >  
> > >  static int mt9m114_s_power(struct v4l2_subdev *sd, int power)
> > >  {
> > > -	if (power == 0)
> > > +	if (power == 0) {
> > >  		return power_down(sd);
> > > -	else {
> > > +	} else {
> > >  		if (power_up(sd))
> > >  			return -EINVAL;
> > >  
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> > > index c90730513438..92c52431bd8f 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> > > @@ -461,11 +461,12 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
> > >  	ret = ov2680_read_reg(client, 1, OV2680_FLIP_REG, &val);
> > >  	if (ret)
> > >  		return ret;
> > > -	if (value) {
> > > +
> > > +	if (value)
> > >  		val |= OV2680_FLIP_MIRROR_BIT_ENABLE;
> > > -	} else {
> > > +	else
> > >  		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
> > > -	}
> > > +
> > 
> > Hi Deepak,
> > 
> > what you did above is not what is written in the commit message
> > description about. Here unneeded bracks are removed in both
> > branches, is not a matter of braces balancing.
> 
> Okay. I was thinking adding where necessary and removing where not
> would lead to expected balancing.
> I will send this as a separate patch in this patch set. Is it okay to
> add a new patch to the set now?

yes, a patchset from vN to v(N + 1) is allowed to increase in patch number,
at least in my experience.

> 
> Thank you,
> deepak.
> 
> > 
> > thank you,
> > 
> > fabio 
> > 
> > >  	ret = ov2680_write_reg(client, 1,
> > >  			       OV2680_FLIP_REG, val);
> > >  	if (ret)
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > > index aec7392fd1de..d046a9804f63 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > > @@ -772,9 +772,9 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
> > >  {
> > >  	int ret;
> > >  
> > > -	if (on == 0)
> > > +	if (on == 0) {
> > >  		return power_down(sd);
> > > -	else {
> > > +	} else {
> > >  		ret = power_up(sd);
> > >  		if (!ret)
> > >  			return ov2722_init(sd);
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > > 
> > > 
> 
> 

thank you,

fabio
