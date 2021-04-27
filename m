Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8259236C61E
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236180AbhD0Mf1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:35:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235428AbhD0Mf0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:35:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90CBE60FDB;
        Tue, 27 Apr 2021 12:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619526883;
        bh=2u2zN97nbfniLslz6+tVNkTFqx3EDnz7hhOVKt92qRc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sKzOuoFEa/Wvf/ILU8eTcUFqo+b4qV0l1RKh9EhORzhyatWwOH4rvATRmwObNkF0c
         bNEX5xgvL3ug7N5JpnVzytvoMP/twQvedUN7z2g8T4aMGKjkiv7kUBVEi+xh34aG/e
         8qsI+9KrRkgQe9JlOQrC7IONDp8fLnLQsZmrCocRtXgd9VNgIiWhAUDiafc0V3xPeD
         FYotF73zLpWUNEUls2dIAi0CKlDUvlSs0bRhwL+HAokEZIVi7RaR4Us6/ee/evpezL
         54ZRi70XgRnQumI0zsliwvG7z9CZRXMtfjryoF2ZfnC10Z4H5YkL/18IR/f1otNKUh
         e8GWYFESdmQWQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lbMvY-0002Wx-DN; Tue, 27 Apr 2021 14:34:57 +0200
Date:   Tue, 27 Apr 2021 14:34:56 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 17/78] staging: media: vde: use
 pm_runtime_resume_and_get()
Message-ID: <YIgE8PfASn6nua5B@hovoldconsulting.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <0eeb886803679cd908cb4576d35b2314993abd2c.1619191723.git.mchehab+huawei@kernel.org>
 <2349831b-e7cd-d38d-fc19-5fabf06f773e@gmail.com>
 <20210427112250.5d40c4f4@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210427112250.5d40c4f4@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 27, 2021 at 11:22:50AM +0200, Mauro Carvalho Chehab wrote:
> Hi Dmitry,
> 
> Em Sat, 24 Apr 2021 10:35:22 +0300
> Dmitry Osipenko <digetx@gmail.com> escreveu:
> 
> > 24.04.2021 09:44, Mauro Carvalho Chehab пишет:
> > > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > added pm_runtime_resume_and_get() in order to automatically handle
> > > dev->power.usage_count decrement on errors.
> > > 
> > > Use the new API, in order to cleanup the error check logic.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  drivers/staging/media/tegra-vde/vde.c | 16 ++++++++++------
> > >  1 file changed, 10 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> > > index 28845b5bafaf..8936f140a246 100644
> > > --- a/drivers/staging/media/tegra-vde/vde.c
> > > +++ b/drivers/staging/media/tegra-vde/vde.c
> > > @@ -775,9 +775,9 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
> > >  	if (ret)
> > >  		goto release_dpb_frames;
> > >  
> > > -	ret = pm_runtime_get_sync(dev);
> > > +	ret = pm_runtime_resume_and_get(dev);
> > >  	if (ret < 0)
> > > -		goto put_runtime_pm;
> > > +		goto unlock;
> > >  
> > >  	/*
> > >  	 * We rely on the VDE registers reset value, otherwise VDE
> > > @@ -843,6 +843,8 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
> > >  put_runtime_pm:
> > >  	pm_runtime_mark_last_busy(dev);
> > >  	pm_runtime_put_autosuspend(dev);
> > > +
> > > +unlock:
> > >  	mutex_unlock(&vde->lock);
> > >  
> > >  release_dpb_frames:
> > > @@ -1069,8 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
> > >  	 * power-cycle it in order to put hardware into a predictable lower
> > >  	 * power state.
> > >  	 */
> > > -	pm_runtime_get_sync(dev);
> > > -	pm_runtime_put(dev);
> > > +	if (pm_runtime_resume_and_get(dev) >= 0)
> > > +		pm_runtime_put(dev);
> > >  
> > >  	return 0;
> > >  
> > > @@ -1088,8 +1090,9 @@ static int tegra_vde_remove(struct platform_device *pdev)
> > >  {
> > >  	struct tegra_vde *vde = platform_get_drvdata(pdev);
> > >  	struct device *dev = &pdev->dev;
> > > +	int ret;
> > >  
> > > -	pm_runtime_get_sync(dev);
> > > +	ret = pm_runtime_resume_and_get(dev);
> > >  	pm_runtime_dont_use_autosuspend(dev);
> > >  	pm_runtime_disable(dev);
> > >  
> > > @@ -1097,7 +1100,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
> > >  	 * Balance RPM state, the VDE power domain is left ON and hardware
> > >  	 * is clock-gated. It's safe to reboot machine now.
> > >  	 */
> > > -	pm_runtime_put_noidle(dev);
> > > +	if (ret >= 0)
> > > +		pm_runtime_put_noidle(dev);
> > >  	clk_disable_unprepare(vde->clk);
> > >  
> > >  	misc_deregister(&vde->miscdev);
> > >   
> > 
> > Hello Mauro,
> > 
> > Thank you very much for the patch. It looks to me that the original
> > variant was a bit simpler, this patch adds more code lines without
> > changing the previous behaviour. Or am I missing something?

I agree, the above does not look like an improvement at all.

> While on several places the newer code is simpler, the end goal here is
> to replace all occurrences of pm_runtime_get_sync() from the media 
> subsystem, due to the number of problems we're having with this:
> 
> 1. despite its name, this is actually a PM runtime resume call,
>    but some developers didn't seem to realize that, as I got this
>    pattern on some drivers:
> 
>         pm_runtime_get_sync(&client->dev);
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
>         pm_runtime_put_noidle(&client->dev);
> 
>    It makes no sense to resume PM just to suspend it again ;-)

It very well may. You're resuming the device and leaving it a defined
power state before balancing the PM count, cleaning up and unbinding the
driver.

>    The name of the new variant is a lot clearer:
> 	pm_runtime_resume_and_get()

For people not used to the API perhaps.

> 2. Usual *_get() methods only increment their use count on success,
>    but pm_runtime_get_sync() increments it unconditionally. Due to
>    that, several drivers were mistakenly not calling
>    pm_runtime_put_noidle() when it fails;

As I mentioned elsewhere, all pm_runtime_get calls increment the usage
count so the API is consistent.
 
> 3. Consistency: we did similar changes subsystem wide with
>    for instance strlcpy() and strcpy() that got replaced by
>    strscpy(). Having all drivers using the same known-to-be-safe
>    methods is a good thing;

There's no know-to-be safe API. People will find ways to get this wrong
too.

And the old interface isn't going away from the kernel even if you
manage to not use it in media.

> 4. Prevent newer drivers to copy-and-paste a code that it would
>    be easier to break if they don't truly understand what's behind
>    the scenes.

Johan
