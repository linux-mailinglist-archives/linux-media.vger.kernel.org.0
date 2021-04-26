Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C9036B427
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 15:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbhDZNd7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 09:33:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230250AbhDZNd7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 09:33:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C97B861157;
        Mon, 26 Apr 2021 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619443997;
        bh=KQQLpT4AI0vALszGg4C/76UWqxG1p2jCwpuYs8Uth+c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rrJxWff9viv2SpQ1stnDkHN0QiY4YIYVZmmPqOfR8pTgUYiwKOM7mqhqKM3c6ZzdV
         gwnwpAIAsIMGl3N5kiMluQI6zzrWn0vbLkEda7V6MFo74kNiJZ+Mlaq9bWnAxovjig
         fybT/I85zYf/Z9Q8CuDdkZPuFAACPXVyYEnR+0QPDrQTcUhzDNVXjatCJoGvzmhHQw
         t6at5QwqjNwzJLqZ18dg1L7IcuujCdx3+tUBVMNyhyeEtydVNdS0Hp2Y/3OA6RGKo9
         3d5VnrHcoai6bVG3lcr8K46Q0cjjoqomqn6vqKnAe/Fy0oeoEdRSe7W9soiV4CHtUM
         RzzoTfaV0BAfw==
Date:   Mon, 26 Apr 2021 15:33:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linuxarm <linuxarm@huawei.com>, mauro.chehab@huawei.com,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 69/78] media: rcar-vin: use pm_runtime_resume_and_get()
Message-ID: <20210426153311.150f5b4f@coco.lan>
In-Reply-To: <CAMuHMdWRxy76Dq0NYAUNKATaCx+tVMSO43HP+urFrukDQ_pTkg@mail.gmail.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <dc7f4bc45cd6be79d19d1a4027fb6f35dfb45a03.1619191723.git.mchehab+huawei@kernel.org>
        <CAMuHMdWRxy76Dq0NYAUNKATaCx+tVMSO43HP+urFrukDQ_pTkg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 24 Apr 2021 11:12:31 +0200
Geert Uytterhoeven <geert@linux-m68k.org> escreveu:

> Hi Mauro,
> 
> On Sat, Apr 24, 2021 at 8:46 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors.
> >
> > Use the new API, in order to cleanup the error check logic.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Thanks for your patch!
> 
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -408,7 +408,7 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
> >
> >  static void rcsi2_exit_standby(struct rcar_csi2 *priv)
> >  {
> > -       pm_runtime_get_sync(priv->dev);
> > +       pm_runtime_resume_and_get(priv->dev);  
> 
> I believe this part is incorrect: on failure[*], the refcount will now
> be decremented, and in a subsequent call to rcsi2_enter_standby(), the
> refcount will be decremented again due to the call to pm_runtime_put().

I see your point.

> [*] On e.g. R-Car SoCs, this can never fail.  This is the reason why
>     many R-Car (and SuperH) drivers never check the result of
>     pm_runtime_get_sync().  So the refcount "imbalances" were actually
>     introduced by the various "clean up" patches to add return value
>     checking, which now need another round of fixing...

It sounds dangerous to assume that. I'm not a PM expert, but, at least
looking at drivers/base/power/runtime.c, there are two situations where the
core itself will return an error, even if the PM callback never return
errors[1], and more could be added in the future:

        if (dev->power.runtime_error)
                retval = -EINVAL;
        else if (dev->power.disable_depth > 0)
                retval = -EACCES;

[1] see rpm_resume() function

IMO, the right thing here would be to check it at resume time,
and to handle it properly.

> 
> >         reset_control_deassert(priv->rstc);
> >  }  
> 
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -1458,11 +1458,9 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
> >         u32 vnmc;
> >         int ret;
> >
> > -       ret = pm_runtime_get_sync(vin->dev);
> > -       if (ret < 0) {
> > -               pm_runtime_put_noidle(vin->dev);
> > +       ret = pm_runtime_resume_and_get(vin->dev);
> > +       if (ret < 0)
> >                 return ret;
> > -       }  
> 
> This change (and the change below) is correct, as the logic before/after
> is equivalent.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 



Thanks,
Mauro
