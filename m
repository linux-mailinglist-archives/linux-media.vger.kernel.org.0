Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B62A1F5BDE
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 21:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbgFJTOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 15:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbgFJTOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 15:14:52 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0859BC03E96F
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 12:14:52 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id q13so2219394edi.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hY1EqCjTHPxqFfI2Ha7phQq/vyBFFXs9xfoG48pRam8=;
        b=aJfwS8QKSiJ6H8efGbgr8JxwnYO1ycqGIy32HcO1eG3MGZPBt66ZyhwXGNS+ghpCA8
         MlCtqoDfJ8M3mbV1AgWLpGWf+BrKi4CjjSE3kapuXpX/wW+K7yKW/Wl7WT8jowM/Ie+q
         dLhJivuS+r93N3eMejYqC6BL/icw9TbscMS/1zgtaCagnljzPRliDuw0nNJm6Nu2lNR5
         wxcYpKvMkX70bEiohd4mCcUK6HDV5+JG8XRRb9tMfhGLnF/QWmnmCU+QP4L3ZZLa4KnY
         tJsgeBZGfHZQjF0s4mZCD+HuR/3RzUm1NynteTQZhsux6044q+WAmCrBTpi8exknwZ9N
         RJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hY1EqCjTHPxqFfI2Ha7phQq/vyBFFXs9xfoG48pRam8=;
        b=V291yuSH16zM/hKSU6TyvGMBnC1sXaH3LxinQYxi4JRlYZ2E8yUJru8pGQ84paUQv5
         tkkwFj14I6f8855WWzSuAD84Irwdy/rcTzhYDjQ/ZC0mGouwD3W36OlLJHz2X9NKjO5j
         AfsLIC/cnhTRr8x3XabAsM/udTf+OPQ4rD3wLfuvPffsGH8H85POmKVePzK0eDP2iq6e
         /E4P011Pvnoc8IvMwVNp4QAMYN5aGV2HwGWKa8Yr+BS/blc27UCvSX5GbzE0KRR9jE2F
         7D6QTiultfQ8OMfEDftMgZhtRjUbBeB5UFN4lXBpYS+pca5IphLsQ51XT4Sply+XPItA
         LByA==
X-Gm-Message-State: AOAM532Kz1w1zxJRRA4sh0F0B+fHnpH3giTld5c1oPh1ws97iB6TA8Zs
        7x41Q8V31QeIn6lCGQw3smEBLO91cO+qv1o7HkKpnw==
X-Google-Smtp-Source: ABdhPJz9i/RGn/VGDboPOGapRKfIYiBLxFTRAkrJWXFnfcy4J6pqbtf/64Ut6cbDRPpojftZ8tGKiCLnT+y4+PGXC7s=
X-Received: by 2002:a05:6402:1153:: with SMTP id g19mr3693132edw.127.1591816481715;
 Wed, 10 Jun 2020 12:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com> <20200521171101.GA243874@chromium.org>
 <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl> <CAAFQd5Ad_cnv0qztZOk9c2H0Y+XO6tRcRmS1t4dBw5qbG-d8Nw@mail.gmail.com>
 <CAAEAJfDboyra5XcEiviJP_3Kk-mDNZH5nstDa_7P7XCV7bu7Pg@mail.gmail.com> <20200610190356.GJ201868@chromium.org>
In-Reply-To: <20200610190356.GJ201868@chromium.org>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 10 Jun 2020 16:14:30 -0300
Message-ID: <CAAEAJfDSr4ne7p2BG_vjLs0zLQ1O+cn4puiALdd2DyAHnTXadg@mail.gmail.com>
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

On Wed, 10 Jun 2020 at 16:03, Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Wed, Jun 10, 2020 at 03:52:39PM -0300, Ezequiel Garcia wrote:
> > Hi everyone,
> >
> > Thanks for the patch.
> >
> > On Wed, 10 Jun 2020 at 07:33, Tomasz Figa <tfiga@chromium.org> wrote:
> > >
> > > On Wed, Jun 10, 2020 at 12:29 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > > >
> > > > On 21/05/2020 19:11, Tomasz Figa wrote:
> > > > > Hi Jerry,
> > > > >
> > > > > On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
> > > > >> From: Pi-Hsun Shih <pihsun@chromium.org>
> > > > >>
> > > > >> Add two functions that can be used to stop new jobs from being queued /
> > > > >> continue running queued job. This can be used while a driver using m2m
> > > > >> helper is going to suspend / wake up from resume, and can ensure that
> > > > >> there's no job running in suspend process.
> [snip]
> > > >
> > > > I assume this will be part of a future patch series that calls these new functions?
> > >
> > > The mtk-jpeg encoder series depends on this patch as well, so I guess
> > > it would go together with whichever is ready first.
> > >
> > > I would also envision someone changing the other existing drivers to
> > > use the helpers, as I'm pretty much sure some of them don't handle
> > > suspend/resume correctly.
> > >
> >
> > This indeed looks very good. If I understood the issue properly,
> > the change would be useful for both stateless (e.g. hantro, et al)
> > and stateful (e.g. coda) codecs.
> >
> > Hantro uses pm_runtime_force_suspend, and I believe that
> > could is enough for proper suspend/resume operation.
>
> Unfortunately, no. :(
>
> If the decoder is already decoding a frame, that would forcefully power
> off the hardware and possibly even cause a system lockup if we are
> unlucky to gate a clock in the middle of a bus transaction.
>

pm_runtime_force_suspend calls pm_runtime_disable, which
says:

"""
 Increment power.disable_depth for the device and if it was zero previously,
 cancel all pending runtime PM requests for the device and wait for all
 operations in progress to complete.
"""

Doesn't this mean it waits for the current job (if there is one) and
prevents any new jobs to be issued?

> I just inspected the code now and actually found one more bug in its
> power management handling. device_run() calls clk_bulk_enable() before
> pm_runtime_get_sync(), but only the latter is guaranteed to actually
> power on the relevant power domains, so we end up clocking unpowered
> hardware.
>

How about we just move clk_enable/disable to runtime PM?

Since we use autosuspend delay, it theoretically has
some impact, which is why I was refraining from doing so.

I can't decide if this impact would be marginal or significant.

> >
> > I'm not seeing any code in CODA to handle this, so not sure
> > how it's handling suspend/resume.
> >
> > Maybe we can have CODA as the first user, given it's a well-maintained
> > driver and should be fairly easy to test.
>
> I remember checking a number of drivers using the m2m helpers randomly
> and none of them implemented suspend/resume correctly. I suppose that
> was not discovered because normally the userspace itself would stop the
> operation before the system is suspended, although it's not an API
> guarantee.
>

Indeed. Do you have any recomendations for how we could
test this case to make sure we are handling it correctly?

> Best regards,
> Tomasz
