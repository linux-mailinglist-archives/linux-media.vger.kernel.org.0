Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C8D1F8B35
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 00:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgFNWnc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 18:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbgFNWnb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 18:43:31 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09313C03E969
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 15:43:30 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id d15so10127319edm.10
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 15:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1lprYkJAyOKBzMBK93xU+u9SELPnGpp6W2PGiHIuVVE=;
        b=kPQ+nCIobtuVJOw0grvTibWxlmGDjjahO9NjG44BUlkoB2sTgHGRV0XsX7QWMvwB9S
         neLYTlf0CCiyBpIVzhA2RHrp18f1EgUTB7whyM/6eEyH0WHvFLJQnNTj6OcSklQpRUDt
         QTBYg/aYZzL3oe+1154pAzoV1yA03zDNk6rctJf7dCatSMEhrVao+wH/2i87+aKo6RH8
         7U35KdFwGpzlwZZb1eOD9kmIH19b5i6npQG/6QBr82w+doAnSgG0Xr24PRGVuV1n3SVY
         3fHUpT3u0WMPmq+Ex/pJyFTq53zmVH36HextUqd8ZVqQdz3oUWrZxyaze3lcOv9QIb5D
         yWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1lprYkJAyOKBzMBK93xU+u9SELPnGpp6W2PGiHIuVVE=;
        b=CCC+dOtTgvfjKJ5YtGtywPKZGKFfgGvexUoXcZBapyTOnwaaGq3NPAcXCq3hVehrB5
         Vh59beDdokpYKveE79kyOdyJjR7PUb56Nkn9ukUb/SpHkBacaKKZtFdtXmRx750Bp0n0
         iq7j7j5zb5XeCVhVfzYzCqwT2qie9UrLqy8Ew1lZgH0fBk/gbkpA9hNqSzuFCzPzot9n
         rA/yp8CcHcxUMjEmylYy1Qkd2fcav5QFw6m9Ci9om7/nju7QzeH/RyBm5uMfl0Xsq0hT
         qlxAGa3lciKT4epYgz+t04P651O3kXAvm9CA3Jv6e86dOx0YGgOiWJJTBBO0VsmSdc2X
         d4fA==
X-Gm-Message-State: AOAM530oRECEH1dBBcSGr6vbKk9OQwjqk8XdXl5Cun5g9EB1QDVyxOjU
        BR3tMH3zzwpvAa/6wNvt65BpBm8qznkEnVceSeMfvA==
X-Google-Smtp-Source: ABdhPJwjlev+Zt10Pkqu14VpTVVHkmLlVD/cQ29TLqg5Wy8ANyOr/GB9Wf4L1DL+9ZM6adnp3wug9+KEMJyBO8xr1Nc=
X-Received: by 2002:aa7:c756:: with SMTP id c22mr21688074eds.239.1592174609436;
 Sun, 14 Jun 2020 15:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com> <20200521171101.GA243874@chromium.org>
 <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl> <CAAFQd5Ad_cnv0qztZOk9c2H0Y+XO6tRcRmS1t4dBw5qbG-d8Nw@mail.gmail.com>
 <CAAEAJfDboyra5XcEiviJP_3Kk-mDNZH5nstDa_7P7XCV7bu7Pg@mail.gmail.com>
 <20200610190356.GJ201868@chromium.org> <CAAEAJfDSr4ne7p2BG_vjLs0zLQ1O+cn4puiALdd2DyAHnTXadg@mail.gmail.com>
 <CAAFQd5BH3xLNGAtbdH0Wy9KqQo30SFL9q9rcjZz8M3eviyY=hA@mail.gmail.com>
In-Reply-To: <CAAFQd5BH3xLNGAtbdH0Wy9KqQo30SFL9q9rcjZz8M3eviyY=hA@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 14 Jun 2020 19:43:18 -0300
Message-ID: <CAAEAJfCyqHKtwV_mVFOmtAiaCWc-mLTt=TNh8XgRag32WeWEgw@mail.gmail.com>
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, yuzhao@chromium.org,
        zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 10 Jun 2020 at 16:26, Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Wed, Jun 10, 2020 at 9:14 PM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > On Wed, 10 Jun 2020 at 16:03, Tomasz Figa <tfiga@chromium.org> wrote:
> > >
> > > On Wed, Jun 10, 2020 at 03:52:39PM -0300, Ezequiel Garcia wrote:
> > > > Hi everyone,
> > > >
> > > > Thanks for the patch.
> > > >
> > > > On Wed, 10 Jun 2020 at 07:33, Tomasz Figa <tfiga@chromium.org> wrote:
> > > > >
> > > > > On Wed, Jun 10, 2020 at 12:29 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > > > > >
> > > > > > On 21/05/2020 19:11, Tomasz Figa wrote:
> > > > > > > Hi Jerry,
> > > > > > >
> > > > > > > On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
> > > > > > >> From: Pi-Hsun Shih <pihsun@chromium.org>
> > > > > > >>
> > > > > > >> Add two functions that can be used to stop new jobs from being queued /
> > > > > > >> continue running queued job. This can be used while a driver using m2m
> > > > > > >> helper is going to suspend / wake up from resume, and can ensure that
> > > > > > >> there's no job running in suspend process.
> > > [snip]
> > > > > >
> > > > > > I assume this will be part of a future patch series that calls these new functions?
> > > > >
> > > > > The mtk-jpeg encoder series depends on this patch as well, so I guess
> > > > > it would go together with whichever is ready first.
> > > > >
> > > > > I would also envision someone changing the other existing drivers to
> > > > > use the helpers, as I'm pretty much sure some of them don't handle
> > > > > suspend/resume correctly.
> > > > >
> > > >
> > > > This indeed looks very good. If I understood the issue properly,
> > > > the change would be useful for both stateless (e.g. hantro, et al)
> > > > and stateful (e.g. coda) codecs.
> > > >
> > > > Hantro uses pm_runtime_force_suspend, and I believe that
> > > > could is enough for proper suspend/resume operation.
> > >
> > > Unfortunately, no. :(
> > >
> > > If the decoder is already decoding a frame, that would forcefully power
> > > off the hardware and possibly even cause a system lockup if we are
> > > unlucky to gate a clock in the middle of a bus transaction.
> > >
> >
> > pm_runtime_force_suspend calls pm_runtime_disable, which
> > says:
> >
> > """
> >  Increment power.disable_depth for the device and if it was zero previously,
> >  cancel all pending runtime PM requests for the device and wait for all
> >  operations in progress to complete.
> > """
> >
> > Doesn't this mean it waits for the current job (if there is one) and
> > prevents any new jobs to be issued?
> >
>
> I'd love if the PM runtime subsystem handled job management of all the
> driver subsystems automatically, but at the moment it's not aware of
> any jobs. :) The description says as much as it says - it stops any
> internal jobs of the PM subsystem - i.e. asynchronous suspend/resume
> requests. It doesn't have any awareness of V4L2 M2M jobs.
>

Doh, of course. I saw "pending requests" and
somehow imagined it would wait for the runtime_put.

I see now that these patches are the way to go.

> > > I just inspected the code now and actually found one more bug in its
> > > power management handling. device_run() calls clk_bulk_enable() before
> > > pm_runtime_get_sync(), but only the latter is guaranteed to actually
> > > power on the relevant power domains, so we end up clocking unpowered
> > > hardware.
> > >
> >
> > How about we just move clk_enable/disable to runtime PM?
> >
> > Since we use autosuspend delay, it theoretically has
> > some impact, which is why I was refraining from doing so.
> >
> > I can't decide if this impact would be marginal or significant.
> >
>
> I'd also refrain from doing this. Clock gating corresponds to the
> bigger part of the power savings from runtime power management, since
> it stops the dynamic power consumption and only leaves the static
> leakage. That said, the Hantro IP blocks have some internal clock
> gating as well, so it might not be as pronounced, depending on the
> custom vendor integration logic surrounding the Hantro hardware.
>

OK, I agree. We need to fix this issue then,
changing the order of the calls.

> Actually even if autosuspend is not used, the runtime PM subsystem has
> some internal back-off mechanism based on measured power on and power
> off latencies. The driver should call pm_runtime_get_sync() first and
> then enable any necessary clocks. I can see that currently inside the
> resume callback we have some hardware accesses. If those really need
> to be there, they should be surrounded with appropriate clock enable
> and clock disable calls.
>

Currently, it's only used by imx8mq, and it's enclosed
by clk_bulk_prepare_enable/disable_unprepare.

I am quite sure the prepare/unprepare usage is an oversight
on our side, but it doesn't do any harm either.

Moving the clock handling to hantro_runtime_resume is possible,
but looks like just low-hanging fruit.

> > > >
> > > > I'm not seeing any code in CODA to handle this, so not sure
> > > > how it's handling suspend/resume.
> > > >
> > > > Maybe we can have CODA as the first user, given it's a well-maintained
> > > > driver and should be fairly easy to test.
> > >
> > > I remember checking a number of drivers using the m2m helpers randomly
> > > and none of them implemented suspend/resume correctly. I suppose that
> > > was not discovered because normally the userspace itself would stop the
> > > operation before the system is suspended, although it's not an API
> > > guarantee.
> > >
> >
> > Indeed. Do you have any recomendations for how we could
> > test this case to make sure we are handling it correctly?
>
> I'd say that a simple offscreen command line gstreamer/ffmpeg decode
> with suspend/resume loop in another session should be able to trigger
> some issues.
>

I can try to fix the above clk/pm issue and take this helper
on the same series, if that's useful.

Thanks,
Ezequiel
