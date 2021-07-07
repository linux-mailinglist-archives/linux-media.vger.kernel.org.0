Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781693BE4BA
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 10:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhGGIyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 04:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbhGGIyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 04:54:10 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A40AC061574
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 01:51:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y42so2796111lfa.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jLchT84LhJZMHnnj03A5lsGVtSK6Svki7nJnsZ38D/4=;
        b=P5QtjVKPLLlAHEE0EKfF9YkDdwUSnYagPGonn1tx32lgjrL4w+nF+UQncBcN7g2hKV
         kosS4nFFHmSQE4JeVI3zIGx/KodeYaKsuCbbBt8rv1iUTKBZH7GeDx/O8AEi45pgtiq8
         kDCVzPd2RG33DxmTZWTMbq8/OvGrOTjfoOIHyAFu78AEsIsZUsXXiX8/Ke1nhv5bgCT+
         ACqZL3kVwRl81G/jFY2i1Wi4OUMBz/QUWGSmOQDCK7jf2l/4xdVjJxQ1Y9wP4ioAUSfV
         789jHhJ5fzLrD7udzRtG7KP/F2sVHkMcHoaBd7D3pNw6K1KmImsUGdjfoL/3GV79wlnc
         oshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jLchT84LhJZMHnnj03A5lsGVtSK6Svki7nJnsZ38D/4=;
        b=MOnfiVDEvLCf7k0eLqorfBoCbUzidjih+Imm8G/h+3k9bvxq2kh5+p6Xr2TBMAJji9
         aMkvDuHfAx9FlipfAZ/eQJwymMiuupd5gRocK6Zbe7QrOyknBCVuv3/NjWTbrPT8gI8a
         NVAqqCtflPdy+pdC7u0gdNE1ptKQesMeSpL/2iieYejJyEjjd3B0G2Tar0RQ4yUbonEA
         +qt0UlgqXq9CTi1LgPybzAzHXfuICS2mL8ZyExts0qdO6yjjqVU+qCyRyBbdCjTxQ6ft
         D34aDgLg29escbjub96/f7KvT+no2xAP/KpFi/0qmesioGQct6rG+ggr78imoSmK85uq
         9RaA==
X-Gm-Message-State: AOAM532vh8LJ5K6e+4yzY0qMx1bDr7on7mdXwr0euRvHZFAQXCTIIWP7
        Q8ovvVzuT8I07aBHynRPcwnYkg==
X-Google-Smtp-Source: ABdhPJxUPiKkcXyXSKTqLoNOTib4Cs9/aiSXp4+4bYCD8+xk2sn6worFnhqGVkYypEZ5Y1LVEmFk4w==
X-Received: by 2002:a19:6b14:: with SMTP id d20mr14194396lfa.562.1625647888737;
        Wed, 07 Jul 2021 01:51:28 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id d7sm1003993lfq.181.2021.07.07.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 01:51:27 -0700 (PDT)
Date:   Wed, 7 Jul 2021 10:51:27 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/11] rcar-vin: Improve reuse of parallel notifier
Message-ID: <YOVrD1Mkv9s9jK4/@oden.dyn.berto.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-5-niklas.soderlund+renesas@ragnatech.se>
 <20210706165141.adzayyndbfwzocpr@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210706165141.adzayyndbfwzocpr@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your feedback.

On 2021-07-06 18:51:41 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Tue, Apr 13, 2021 at 08:02:46PM +0200, Niklas Söderlund wrote:
> > In preparation for adding a new media graph layout move the code reuse
> > of the parallel notifier setup from probe directly to the current media
> > graph initialization function. This is needed as there will be no
> > parallel interface in the new graph layout.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-core.c | 48 ++++++++++-----------
> >  1 file changed, 22 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > index da23d55aa72b7f0d..81574bf33116ad59 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > @@ -702,9 +702,8 @@ static int rvin_parallel_init(struct rvin_dev *vin)
> >  	if (ret)
> >  		return ret;
> >
> > -	/* If using mc, it's fine not to have any input registered. */
> >  	if (!vin->parallel.asd)
> > -		return vin->info->use_mc ? 0 : -ENODEV;
> > +		return -ENODEV;
> 
> Nit: isn't it better to keep the error handling here ?

I'm trying to reduce the number of use_mc checks and if needed only keep 
it in code paths where it's relevant. I like moving it to the _csi2_ 
functions. But I agree _csi2_ is a bad prefix, it should likely be 
renamed somewhen in the future as it now really means _gen3_ minus v3u 
:-)

> 
> >
> >  	vin_dbg(vin, "Found parallel subdevice %pOF\n",
> >  		to_of_node(vin->parallel.asd->match.fwnode));
> > @@ -955,11 +954,9 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
> >
> >  static void rvin_csi2_cleanup(struct rvin_dev *vin)
> >  {
> > -	if (!vin->info->use_mc)
> > -		return;
> > -
> >  	rvin_group_notifier_cleanup(vin);
> >  	rvin_group_put(vin);
> > +	rvin_free_controls(vin);
> >  }
> >
> >  static int rvin_csi2_init(struct rvin_dev *vin)
> > @@ -979,11 +976,18 @@ static int rvin_csi2_init(struct rvin_dev *vin)
> >  	if (ret)
> >  		goto err_controls;
> >
> > -	ret = rvin_mc_parse_of_graph(vin);
> > -	if (ret)
> > +	/* It's OK to not have a parallel subdevice. */
> > +	ret = rvin_parallel_init(vin);
> > +	if (ret && ret != -ENODEV)
> >  		goto err_group;
> >
> > +	ret = rvin_mc_parse_of_graph(vin);
> > +	if (ret)
> > +		goto err_parallel;
> > +
> >  	return 0;
> > +err_parallel:
> > +	rvin_parallel_cleanup(vin);
> >  err_group:
> >  	rvin_group_put(vin);
> >  err_controls:
> > @@ -1469,27 +1473,20 @@ static int rcar_vin_probe(struct platform_device *pdev)
> >
> >  	platform_set_drvdata(pdev, vin);
> >
> > -	if (vin->info->use_mc) {
> > +	if (vin->info->use_mc)
> >  		ret = rvin_csi2_init(vin);
> > -		if (ret)
> > -			goto error_dma_unregister;
> > -	}
> > +	else
> > +		ret = rvin_parallel_init(vin);
> >
> > -	ret = rvin_parallel_init(vin);
> > -	if (ret)
> > -		goto error_group_unregister;
> > +	if (ret) {
> > +		rvin_dma_unregister(vin);
> > +		return ret;
> > +	}
> >
> >  	pm_suspend_ignore_children(&pdev->dev, true);
> >  	pm_runtime_enable(&pdev->dev);
> >
> >  	return 0;
> > -error_group_unregister:
> > -	rvin_free_controls(vin);
> > -	rvin_csi2_cleanup(vin);
> > -error_dma_unregister:
> > -	rvin_dma_unregister(vin);
> > -
> > -	return ret;
> 
> This looks much much better and seems correct to me!
> 
> >  }
> >
> >  static int rcar_vin_remove(struct platform_device *pdev)
> > @@ -1500,11 +1497,10 @@ static int rcar_vin_remove(struct platform_device *pdev)
> >
> >  	rvin_v4l2_unregister(vin);
> >
> > -	rvin_parallel_cleanup(vin);
> > -
> > -	rvin_csi2_cleanup(vin);
> > -
> > -	rvin_free_controls(vin);
> > +	if (vin->info->use_mc)
> > +		rvin_csi2_cleanup(vin);
> > +	else
> > +		rvin_parallel_cleanup(vin);
> 
> In the case use_mc == true but a parallel input was registered as well
> this won't clean up the parallel notifier it seems.

Good catch! rvin_parallel_cleanup() should be called from 
rvin_csi2_cleanup() as rvin_parallel_init() is called form 
rvin_csi2_init(). I will fix.

> 
> Does it hurt to clean it up unconditionally ?
> 
> Thanks
>   j
> >
> >  	rvin_dma_unregister(vin);
> >
> > --
> > 2.31.1
> >

-- 
Regards,
Niklas Söderlund
