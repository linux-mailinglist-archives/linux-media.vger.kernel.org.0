Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9DE3C14DB
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 16:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbhGHOIe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 10:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbhGHOIb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 10:08:31 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC082C06175F
        for <linux-media@vger.kernel.org>; Thu,  8 Jul 2021 07:05:48 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id q18so15979872lfc.7
        for <linux-media@vger.kernel.org>; Thu, 08 Jul 2021 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+ufeDaT21nhfjyw9cGKcTF4DhPlIZOpHjYFDyar4c80=;
        b=yd+yEGhyMUFdP96YEq6tUr2UKmT88Fqpc8AabAPB3Tm+U4NkT4AdV4KkYJAP0M692e
         p9ESEGnndHj3aSYYH8dxioBLRrEm2E0FmKk/coZeHJmJDCi5rThZHOzOl9EJFfwwjjL5
         fqp5hkacWXxdFTvTnCr2oU92Q/H2OZE6TWnmG26fB+u/89tRkeYyF4mr/S8B+B2p6fkT
         pcfHAN5XiIJwKG55Mc1q0lG8n6hQtP4h2Or2WY0tTxgz0rKNUSJ3p8Tz1uFPNBEQIi5s
         fxAKNuykLj8dPVrzU6C6Z2a2EG/CEVCg8ASY0IaZjK92jYfzyW/6YGECNM9S7nKi84xo
         bpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+ufeDaT21nhfjyw9cGKcTF4DhPlIZOpHjYFDyar4c80=;
        b=gtDEzL5qg9SuKnQu0Xu8bDK6dcRr0+YIK3rPtu4klE9fLY32i0Nz2AE97BX7kVFeV5
         VJsnxDB5GL7BhgN6L/XaNQcPXquYpsHrbwwK93DpNfCEv4UvnJwkNP5VXf9nY/HedX4Y
         XsRAXof8tK0jGKRDDojSaDcInRSPdEZvgaRAzr69NuCnKVI8XEl63UI/L9j0KRLJl96n
         bIxEe3JUXQdH+Vi/9zg+6JEJYwGPAyZ3up03u6/MZqDU1Sl4rYdOffawlM6O+Odvyu9Z
         H+35DrouKnQI0gI8nLvvioAyCIe+zwB+lvryAa8L8uNPljqJ3uMriqvcCfRFe3p26rJV
         8hhw==
X-Gm-Message-State: AOAM530h8agRtY0Ft0NizKRBOVWH+Zoi2Ts4st2kjk6w3AwEmXPK9N3F
        AJp/oV2QjLboqNXcxCNkn9cHDD9rchV+jr9A
X-Google-Smtp-Source: ABdhPJwbyic1KcHLfh4DDFokLyxNZWUWvGjQK5G7cLvltJuoB9pGf8NFVC/BUbICWI3eMgLak1Z3Ug==
X-Received: by 2002:ac2:532e:: with SMTP id f14mr23553093lfh.103.1625753146590;
        Thu, 08 Jul 2021 07:05:46 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id z13sm222403lfb.40.2021.07.08.07.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 07:05:45 -0700 (PDT)
Date:   Thu, 8 Jul 2021 16:05:43 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] rcar-vin: Refactor controls creation for video
 device
Message-ID: <YOcGN3n7w0NAobdo@oden.dyn.berto.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-2-niklas.soderlund+renesas@ragnatech.se>
 <20210706160401.xssshab7nkxroxnp@uno.localdomain>
 <YOSBxLV86PX63AWm@oden.dyn.berto.se>
 <20210706165803.jepqksw4slo3xkyc@uno.localdomain>
 <20210708134040.GB3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708134040.GB3@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 2021-07-08 16:40:40 +0300, Sakari Ailus wrote:
> Hi Niklas, Jacopo,
> 
> On Tue, Jul 06, 2021 at 06:58:03PM +0200, Jacopo Mondi wrote:
> > > > > @@ -522,10 +543,8 @@ static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
> > > > >  	rvin_v4l2_unregister(vin);
> > > > >  	vin->parallel.subdev = NULL;
> > > > >
> > > > > -	if (!vin->info->use_mc) {
> > > > > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > > > -		vin->vdev.ctrl_handler = NULL;
> > > > > -	}
> > > > > +	if (!vin->info->use_mc)
> > > >
> > > > I know it was there already, but give that rvin_parallel_notify_unbind()
> > > > is only registered for parallel, can this happen ?
> > >
> > > Yes, on Gen2 where we don't use a media-graph.
> > >
> > 
> > Ah correct, for gen3 the controls are freed elsewhere, right!
> > 
> > Thanks for the clarification
> 
> I already had the set in my tree but I can throw it out if you'd prefer to
> send v2 instead. At least I noticed only minor matters in the comments.

There is one small issue in a cleanup path in 4/11 that should be fixed 
and it's always good to get the small things fixed. If I have a v2 out 
before end of day tomorrow could you refresh what you have in your tree?

> 
> -- 
> Regards,
> 
> Sakari Ailus

-- 
Regards,
Niklas Söderlund
