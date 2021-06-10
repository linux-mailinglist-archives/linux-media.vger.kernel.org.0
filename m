Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D473A287F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 11:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhFJJka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 05:40:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:59860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230055AbhFJJka (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 05:40:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63E7E613E3;
        Thu, 10 Jun 2021 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623317914;
        bh=H0ZhLfr/5Hg/IZlJSy+dpLmyl0DCA+2od95bDkRhhnY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RI0mhbUXHuKpeEbO9MAxYjA8RKfjDQf1lEw+dbXcDpKRbNBnpp/W1apVaWbK5KuoK
         jLPU8IIzH24YvfPJXsMU8mfbAqP0e9nbh2VMjLw1UJ+F8LxF4ZNXTYfcIe+orZf0Gq
         T8RnL8mPkQ2ovbgVtkrTwvEIRGnyrwC9FLv8gdyoCz6GeiY4jn+a0E7u8fD3lQ7Iz5
         LXRjwrUf8qn0/7B5ukhu16vHExHUApTrqbw0/Ho/YtPtgTwh8Ys2EA2VLNTWETL86e
         IuiiQH2W6JWMX+p2z1idS4A7ZYF2wW0cGzSwAD64FXrHMVKhfhWm6Uq/hTIHO8wMuv
         ZM6GhiGSMkI+g==
Date:   Thu, 10 Jun 2021 11:38:27 +0200
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
Message-ID: <20210610113827.57db9e77@coco.lan>
In-Reply-To: <cd524923-93f0-e15c-816f-595a80184206@microchip.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <975645970144b6c8401ab9bd1243619978a868a9.1620207353.git.mchehab+huawei@kernel.org>
        <20210505130835.000006b7@Huawei.com>
        <cd524923-93f0-e15c-816f-595a80184206@microchip.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 10 Jun 2021 09:04:07 +0000
<Eugen.Hristev@microchip.com> escreveu:

> >> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> >> index fe3ec8d0eaee..ce8e1351fa53 100644
> >> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> >> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> >> @@ -294,9 +294,13 @@ static int isc_wait_clk_stable(struct clk_hw *hw)
> >>   static int isc_clk_prepare(struct clk_hw *hw)
> >>   {
> >>        struct isc_clk *isc_clk = to_isc_clk(hw);
> >> +     int ret;
> >>
> >> -     if (isc_clk->id == ISC_ISPCK)
> >> -             pm_runtime_get_sync(isc_clk->dev);
> >> +     if (isc_clk->id == ISC_ISPCK) {
> >> +             ret = pm_runtime_resume_and_get(isc_clk->dev);
> >> +             if (ret < 0)
> >> +                     return ret;
> >> +     }  
> 
> Hi Mauro,
> 
> With this patch, the ISC is broken on latest media tree. It looks like 
> pm_runtime_resume_and_get for the ISC_ISPCK clock returns -ENOACCESS and 
> thus, the probe of the driver fails:
> 
> atmel-sama5d2-isc f0008000.isc: failed to enable ispck: -13
> atmel-sama5d2-isc: probe of f0008000.isc failed with error -13
> 
> 
> Could you point out how I could fix this ? Maybe the isc_clk->dev is not 
> properly handled/initialized in some other part of the code ?

Looking at RPM implementation:

	static int rpm_resume(struct device *dev, int rpmflags)
	{
...
        if (dev->power.runtime_error)
                retval = -EINVAL;
        else if (dev->power.disable_depth == 1 && dev->power.is_suspended
            && dev->power.runtime_status == RPM_ACTIVE)
                retval = 1;
        else if (dev->power.disable_depth > 0)
                retval = -EACCES;
...

It sounds that RPM is disabled for this clock. Did you call
pm_runtime_enable() before calling isc_clk_prepare()?

Thanks,
Mauro
