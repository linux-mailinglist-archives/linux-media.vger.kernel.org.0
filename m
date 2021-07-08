Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872153C1478
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 15:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbhGHNnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 09:43:25 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:47346 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhGHNnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 09:43:24 -0400
Received: from hillosipuli.retiisi.eu (dbdx-ftd5cf51mv6xr7xy-3.rev.dnainternet.fi [IPv6:2001:14ba:8e7:f240:7911:3355:4753:76e6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 677581B00046;
        Thu,  8 Jul 2021 16:40:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1625751641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HA7fj3g19lq5gWcUZScZyYOrZAHayfatKYXa+0phdwE=;
        b=D0Z8hULfi2woY5IHAyG1L1rEExTTho78maYO/WMRKDEw0KYLVeHisQCvu0mxSE9ua17kGR
        Nb+ZP0TgD96D+raTue6VwMSS1YMTy30/rTJ0CKkeLoS/I/nNEpP+zCs7w5MHBDs2RU1+5T
        pUDLoCSIFHAkdt81WSCCleXsOa+Y/rsYkv309VT04DVCviAxC+VHQUlagTu+qx48wHrQ9D
        ryaQnckH+HDlL/JyxnXRRIAOq171xQK4rcafdQ/XbtMmrp4hvnPcFqU1oHBXUTvl0kQdbp
        zr7Zrqc1eQw3dizmFf90jCLCZNKZRK5dLioI0oekxKM+sUjeIaLMec1W8fhOHA==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1B4D6634C87;
        Thu,  8 Jul 2021 16:40:02 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1m1UGe-00020X-Gh; Thu, 08 Jul 2021 16:40:40 +0300
Date:   Thu, 8 Jul 2021 16:40:40 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] rcar-vin: Refactor controls creation for video
 device
Message-ID: <20210708134040.GB3@valkosipuli.retiisi.eu>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-2-niklas.soderlund+renesas@ragnatech.se>
 <20210706160401.xssshab7nkxroxnp@uno.localdomain>
 <YOSBxLV86PX63AWm@oden.dyn.berto.se>
 <20210706165803.jepqksw4slo3xkyc@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706165803.jepqksw4slo3xkyc@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1625751641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HA7fj3g19lq5gWcUZScZyYOrZAHayfatKYXa+0phdwE=;
        b=lpDaIAj7i/LDbLUzBW0XR3EuDJNvWF8YkIPbXW6y5uvBItWaLiyciaYukzkKCJyxolk5gU
        8RVsoeps0ONhm6Yo0TypigXhe8iwkGQV6/jX/ghemxPHuYMBsGrd2Sg4/74q7C69BO4ore
        D8ViuTxPBLgxDCKtv5+cDl4EiNm7fuQ9vOH0CGnfMfXFwZnRA89hS3LgJESnrDAZoV3IjT
        zhOZRPBpx2Wa6CigS6Dhq1WcKt0ujFooBfs4dmsTGZr1tQRFeznOqVxmmn6aWHFyCUw9TY
        pJ1HGoR+kCPG0eGkjnlc+De37/8rN8UL2yPYXeybePsF1O52FB4L6QEn7zRCuQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1625751641; a=rsa-sha256;
        cv=none;
        b=uKmsTRTr4R2qqxVzJsx+T7+7JcOAw1f7T8yzfJBI8QpWVmMXIUNeYqyEPEQ4hncALiPshb
        TafN8NnV2yLH8o/52Yv5do28Gg6UVZw/U2qrQdHIq1oj9ho/kQ+M5u70L/3iUjnRM7XWUE
        eaJzG6jb6NQhpi4Ps8U7NtkFeIofqRSBLiFdQ4oizAx/ijXfnxuAw4kEhvuCywb5B+R4Du
        V9z+q5Yrvzc3yBSyFvzGTX2NkIQydAonP5dga0QMC4sos5D83n0X9mj1RllrNEU37nkILH
        cmpYr8OcDaZZQgz/0Mvd9SlSYa/ruSRScMBMKkiQ60vF9llU6hYU122yolxEuA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas, Jacopo,

On Tue, Jul 06, 2021 at 06:58:03PM +0200, Jacopo Mondi wrote:
> > > > @@ -522,10 +543,8 @@ static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
> > > >  	rvin_v4l2_unregister(vin);
> > > >  	vin->parallel.subdev = NULL;
> > > >
> > > > -	if (!vin->info->use_mc) {
> > > > -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> > > > -		vin->vdev.ctrl_handler = NULL;
> > > > -	}
> > > > +	if (!vin->info->use_mc)
> > >
> > > I know it was there already, but give that rvin_parallel_notify_unbind()
> > > is only registered for parallel, can this happen ?
> >
> > Yes, on Gen2 where we don't use a media-graph.
> >
> 
> Ah correct, for gen3 the controls are freed elsewhere, right!
> 
> Thanks for the clarification

I already had the set in my tree but I can throw it out if you'd prefer to
send v2 instead. At least I noticed only minor matters in the comments.

-- 
Regards,

Sakari Ailus
