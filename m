Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5145B3A94AE
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbhFPIFc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:59826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232180AbhFPIF0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:05:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A0DD6054E;
        Wed, 16 Jun 2021 08:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623830600;
        bh=ncVQbKvI+5ZDzKcl17LQck+CzDMFm6fJjp6HiCL65d0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UAxJ+V3Ka3GiqQPvQFw14fFvacfVGwvqaByAJ2vZQHxMP/ZijqBsrbmKf5HsmaNuM
         SD6y985sWOEGiflOMmb9aB1Dl2nfW68UGr3Ve62aY92b04+zFr9sR7kgCbKRzHTP0y
         lITqks6LYLpk8EX7u0rHFczgjeo8YRow2j4UlMxtckHjXECTt6DCFfq20rYvIKuKe/
         7fF2DKseD4FRKL5IqHFZgrZ3DCcYF4XCioPoKxZMGuScy3H5llKd0QtclfKPP82KXM
         0JGMSyvdOXUVXKTaNigx5j7h0aXA4swFfzYpDiBn0+JXZL3LZ+8PA2K7o0hoH6WtR5
         PE71/cVh2yylA==
Date:   Wed, 16 Jun 2021 10:03:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     <Eugen.Hristev@microchip.com>
Cc:     <Jonathan.Cameron@Huawei.com>, <linuxarm@huawei.com>,
        <mauro.chehab@huawei.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <mchehab@kernel.org>,
        <Nicolas.Ferre@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 08/25] media: atmel: properly get pm_runtime
Message-ID: <20210616100314.143a5bb5@coco.lan>
In-Reply-To: <e25d024e-4fa6-dd67-b97a-1d2640f2b560@microchip.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <975645970144b6c8401ab9bd1243619978a868a9.1620207353.git.mchehab+huawei@kernel.org>
        <20210505130835.000006b7@Huawei.com>
        <cd524923-93f0-e15c-816f-595a80184206@microchip.com>
        <20210610113827.57db9e77@coco.lan>
        <e25d024e-4fa6-dd67-b97a-1d2640f2b560@microchip.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 10 Jun 2021 12:00:42 +0000
<Eugen.Hristev@microchip.com> escreveu:

> On 6/10/21 12:38 PM, Mauro Carvalho Chehab wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Em Thu, 10 Jun 2021 09:04:07 +0000
> > <Eugen.Hristev@microchip.com> escreveu:
> >   
> >>>> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> >>>> index fe3ec8d0eaee..ce8e1351fa53 100644
> >>>> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> >>>> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> >>>> @@ -294,9 +294,13 @@ static int isc_wait_clk_stable(struct clk_hw *hw)
> >>>>    static int isc_clk_prepare(struct clk_hw *hw)
> >>>>    {
> >>>>         struct isc_clk *isc_clk = to_isc_clk(hw);
> >>>> +     int ret;
> >>>>
> >>>> -     if (isc_clk->id == ISC_ISPCK)
> >>>> -             pm_runtime_get_sync(isc_clk->dev);
> >>>> +     if (isc_clk->id == ISC_ISPCK) {
> >>>> +             ret = pm_runtime_resume_and_get(isc_clk->dev);
> >>>> +             if (ret < 0)
> >>>> +                     return ret;
> >>>> +     }  
> >>
> >> Hi Mauro,
> >>
> >> With this patch, the ISC is broken on latest media tree. It looks like
> >> pm_runtime_resume_and_get for the ISC_ISPCK clock returns -ENOACCESS and
> >> thus, the probe of the driver fails:
> >>
> >> atmel-sama5d2-isc f0008000.isc: failed to enable ispck: -13
> >> atmel-sama5d2-isc: probe of f0008000.isc failed with error -13
> >>
> >>
> >> Could you point out how I could fix this ? Maybe the isc_clk->dev is not
> >> properly handled/initialized in some other part of the code ?  
> > 
> > Looking at RPM implementation:
> > 
> >          static int rpm_resume(struct device *dev, int rpmflags)
> >          {
> > ...
> >          if (dev->power.runtime_error)
> >                  retval = -EINVAL;
> >          else if (dev->power.disable_depth == 1 && dev->power.is_suspended
> >              && dev->power.runtime_status == RPM_ACTIVE)
> >                  retval = 1;
> >          else if (dev->power.disable_depth > 0)
> >                  retval = -EACCES;
> > ...
> > 
> > It sounds that RPM is disabled for this clock. Did you call
> > pm_runtime_enable() before calling isc_clk_prepare()?
> > 
> > Thanks,
> > Mauro
> >   
> 
> I tried to call pm_runtime_enable for the clk at clk_init time, but 
> doing that makes the runtime for the ISC fail like this:
> 
> atmel-sama5d2-isc f0008000.isc: Unbalanced pm_runtime_enable!

Making RPM balanced is complex ;-)

Yet, clearly there's something weird at the PM code. I mean,
ignoring a -ENOACCESS error like the original code sounds wrong,
as it basically means that pm_runtime_get_sync() were doing
nothing (except by incrementing a refcount).

Some drivers call clk_prepare()/clk_unprepare() at their
.prepare/.unprepare ops. Those functions internally call
RPM get logic recursively, to ensure that the RPM
state of the parents are also at the right state.

Thanks,
Mauro
