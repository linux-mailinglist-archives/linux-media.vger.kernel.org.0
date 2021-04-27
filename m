Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3968F36C1A6
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 11:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235146AbhD0JXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 05:23:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:33426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229938AbhD0JXk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 05:23:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64C6B6100B;
        Tue, 27 Apr 2021 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619515377;
        bh=mETsHWHJFjweReeiHIdDntI2gC9ErHyRmi7GGdO1Me8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cCzcG+yb+hGg8qBGDRs+1VUHDqPZWt84Wx3wIMLNN4e0Y/95F2zGyAdCJX4EBlwRU
         NjVBGuXtj41ZElmpkJpOtNVvnPehF73RRe0iGmVFmI6CXi29U7I3KraBMCWxNF+rJx
         gEeTwq+6ju13/7vdihq99/9UyzBpZCejElDhn5CiGCFTN13keERSMerkUIqETHMt3y
         wm8OlWzfcUM460bpVHHnSm2f4Zdtt83M6GfpMdlWa0SyuI+8LhVxSsxq1xW3Wt+JhI
         gFWtcWcFDgpseYiymNIOFHZZifrvbrmndQsOJkks7YTUszynMX90v+WeUV+D6AEDII
         baYjgQAH12f2A==
Date:   Tue, 27 Apr 2021 11:22:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 17/78] staging: media: vde: use
 pm_runtime_resume_and_get()
Message-ID: <20210427112250.5d40c4f4@coco.lan>
In-Reply-To: <2349831b-e7cd-d38d-fc19-5fabf06f773e@gmail.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <0eeb886803679cd908cb4576d35b2314993abd2c.1619191723.git.mchehab+huawei@kernel.org>
        <2349831b-e7cd-d38d-fc19-5fabf06f773e@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

Em Sat, 24 Apr 2021 10:35:22 +0300
Dmitry Osipenko <digetx@gmail.com> escreveu:

> 24.04.2021 09:44, Mauro Carvalho Chehab =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to dea=
l with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors.
> >=20
> > Use the new API, in order to cleanup the error check logic.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/staging/media/tegra-vde/vde.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/me=
dia/tegra-vde/vde.c
> > index 28845b5bafaf..8936f140a246 100644
> > --- a/drivers/staging/media/tegra-vde/vde.c
> > +++ b/drivers/staging/media/tegra-vde/vde.c
> > @@ -775,9 +775,9 @@ static int tegra_vde_ioctl_decode_h264(struct tegra=
_vde *vde,
> >  	if (ret)
> >  		goto release_dpb_frames;
> > =20
> > -	ret =3D pm_runtime_get_sync(dev);
> > +	ret =3D pm_runtime_resume_and_get(dev);
> >  	if (ret < 0)
> > -		goto put_runtime_pm;
> > +		goto unlock;
> > =20
> >  	/*
> >  	 * We rely on the VDE registers reset value, otherwise VDE
> > @@ -843,6 +843,8 @@ static int tegra_vde_ioctl_decode_h264(struct tegra=
_vde *vde,
> >  put_runtime_pm:
> >  	pm_runtime_mark_last_busy(dev);
> >  	pm_runtime_put_autosuspend(dev);
> > +
> > +unlock:
> >  	mutex_unlock(&vde->lock);
> > =20
> >  release_dpb_frames:
> > @@ -1069,8 +1071,8 @@ static int tegra_vde_probe(struct platform_device=
 *pdev)
> >  	 * power-cycle it in order to put hardware into a predictable lower
> >  	 * power state.
> >  	 */
> > -	pm_runtime_get_sync(dev);
> > -	pm_runtime_put(dev);
> > +	if (pm_runtime_resume_and_get(dev) >=3D 0)
> > +		pm_runtime_put(dev);
> > =20
> >  	return 0;
> > =20
> > @@ -1088,8 +1090,9 @@ static int tegra_vde_remove(struct platform_devic=
e *pdev)
> >  {
> >  	struct tegra_vde *vde =3D platform_get_drvdata(pdev);
> >  	struct device *dev =3D &pdev->dev;
> > +	int ret;
> > =20
> > -	pm_runtime_get_sync(dev);
> > +	ret =3D pm_runtime_resume_and_get(dev);
> >  	pm_runtime_dont_use_autosuspend(dev);
> >  	pm_runtime_disable(dev);
> > =20
> > @@ -1097,7 +1100,8 @@ static int tegra_vde_remove(struct platform_devic=
e *pdev)
> >  	 * Balance RPM state, the VDE power domain is left ON and hardware
> >  	 * is clock-gated. It's safe to reboot machine now.
> >  	 */
> > -	pm_runtime_put_noidle(dev);
> > +	if (ret >=3D 0)
> > +		pm_runtime_put_noidle(dev);
> >  	clk_disable_unprepare(vde->clk);
> > =20
> >  	misc_deregister(&vde->miscdev);
> >  =20
>=20
> Hello Mauro,
>=20
> Thank you very much for the patch. It looks to me that the original
> variant was a bit simpler, this patch adds more code lines without
> changing the previous behaviour. Or am I missing something?

While on several places the newer code is simpler, the end goal here is
to replace all occurrences of pm_runtime_get_sync() from the media=20
subsystem, due to the number of problems we're having with this:

1. despite its name, this is actually a PM runtime resume call,
   but some developers didn't seem to realize that, as I got this
   pattern on some drivers:

        pm_runtime_get_sync(&client->dev);
        pm_runtime_disable(&client->dev);
        pm_runtime_set_suspended(&client->dev);
        pm_runtime_put_noidle(&client->dev);

   It makes no sense to resume PM just to suspend it again ;-)

   The name of the new variant is a lot clearer:
	pm_runtime_resume_and_get()

2. Usual *_get() methods only increment their use count on success,
   but pm_runtime_get_sync() increments it unconditionally. Due to
   that, several drivers were mistakenly not calling
   pm_runtime_put_noidle() when it fails;

3. Consistency: we did similar changes subsystem wide with
   for instance strlcpy() and strcpy() that got replaced by
   strscpy(). Having all drivers using the same known-to-be-safe
   methods is a good thing;

4. Prevent newer drivers to copy-and-paste a code that it would
   be easier to break if they don't truly understand what's behind
   the scenes.

Thanks,
Mauro
