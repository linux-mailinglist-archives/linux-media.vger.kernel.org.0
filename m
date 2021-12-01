Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A881465505
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 19:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244486AbhLASTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 13:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244478AbhLASTv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 13:19:51 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5083CC061748
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 10:16:30 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so1480549pjb.1
        for <linux-media@vger.kernel.org>; Wed, 01 Dec 2021 10:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Fjo/oLhM/GI33DECaidoRno6lOPTrQDXq4YeW1u3XI=;
        b=Gy/mI/syDjgmJ/Dy5HSB0lekRFIu1fZjXrSHJRAyRpEjIvsMYeuD7jd9Gl+/dViRyQ
         bX7H/U8ylCShghMTxCO2moMoFwVRephY825eJHoHYIsCBrCSTGr5lkGv0EVJCxBJCTjC
         XKWTHHeI4L0kX6Cm8I0VJGnBecIMJN05ZjnxWJF4pIjeSiGX31iD106ZbDpbwRBH3ncL
         GQspUzeaq+6ISOEZHY9XlWQRXZMBJvMLiLqaYwPf9HtglHgZUBhMgSXHJZwlcKZdu2JF
         kvW6WGURB6KwscUjDn/Y5mtcbI6S1JQUSwK+OOMpZYnpnAwCy3Qgvhf8sAIwj+oy1ks2
         C3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Fjo/oLhM/GI33DECaidoRno6lOPTrQDXq4YeW1u3XI=;
        b=QscuC+qU40NeguNOWuYAyIEC6t2bJB3JYFVPj5oap1Asp2P6+5RMbhFlp6tF25LNie
         nGHRm493Jq5/bGjgqlVcbHbgf8olgFev4HGbbg8oEJiftGrDuhgopq2Atqnv4N4SaDst
         LLROcP/oRtg+dP72bwIOy0+CEjKiNU7xQ3M+2xj9Z6SD9R/NwWWFYAmngHGZsR0X6oZX
         KwWpqjNyX4236mqW4mEvswiCvV/jFDVO/iwJZ61EONoeFfTET9n7wEReunLdUllArYSw
         tdF45XvyHtZXvVTAWVMGk6f3jbmAb3I/oZR5FE3E5VNsqLFEWzOfi9Hg1gzKgh0/DK68
         lZWA==
X-Gm-Message-State: AOAM532OsmNUdk1zdgpjYCuKbw2ES/P51umhCaWwJp+RkPIgNKyFWaWY
        nVu4dO7i355OLSu1TRMegO1uTluz9p7cz44/81rU6A==
X-Google-Smtp-Source: ABdhPJwttCSPFnI/f0Y+73jbxauzbId1+8+EbhmZWwrFdssLOLUTnHuIDjdXa+sBopTO83KHL5/G+HdxFmuxHV6QOCE=
X-Received: by 2002:a17:90b:33d0:: with SMTP id lk16mr9513215pjb.66.1638382589692;
 Wed, 01 Dec 2021 10:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20211201013329.15875-1-aford173@gmail.com> <CAJ+vNU1jENmWAR_5E98Vgb53ctxjxSWJewPW0YC4Yp4DuYTn3g@mail.gmail.com>
 <7216bc863d89faa9fdc5cd8d44c319f7a6d88159.camel@pengutronix.de>
In-Reply-To: <7216bc863d89faa9fdc5cd8d44c319f7a6d88159.camel@pengutronix.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 1 Dec 2021 10:16:18 -0800
Message-ID: <CAJ+vNU2PxgdN414Ufd4NAG5CJgnftNSAHDGpt9Nj+RfgkNmxaw@mail.gmail.com>
Subject: Re: [RFC V2 0/2] arm64: imx8mm: Enable Hantro VPUs
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Adam Ford <aford173@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 1, 2021 at 9:32 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Tim,
>
> Am Mittwoch, dem 01.12.2021 um 09:23 -0800 schrieb Tim Harvey:
> > On Tue, Nov 30, 2021 at 5:33 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
> > > to be related to the video decoders used on the i.MX8MQ, but because of
> > > how the Mini handles the power domains, the VPU driver does not need to
> > > handle all the functions, nor does it support the post-processor,
> > > so a new compatible flag is required.
> > >
> > > With the suggestion from Hans Verkuil, I was able to get the G2 splat to go away
> > > with changes to FORCE_MAX_ZONEORDER, but I found I could also set cma=512M, however
> > > it's unclear to me if that's an acceptable alternative.
> > >
> > > At the suggestion of Ezequiel Garcia and Nicolas Dufresne I have some
> > > results from Fluster. However, the G2 VPU appears to fail most tests.
> > >
> > > ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> > > Ran 90/135 tests successfully               in 76.431 secs
> > >
> > >  ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> > > Ran 55/61 tests successfully               in 21.454 secs
> > >
> > > ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> > > Ran 0/303 tests successfully               in 20.016 secs
> > >
> > > Each day seems to show more and more G2 submissions, and gstreamer seems to be
> > > still working on the VP9, so I am not sure if I should drop G2 as well.
> > >
> > >
> > > Adam Ford (2):
> > >   media: hantro: Add support for i.MX8M Mini
> > >   arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2
> > >
> > >  arch/arm64/boot/dts/freescale/imx8mm.dtsi   | 41 +++++++++++++++
> > >  drivers/staging/media/hantro/hantro_drv.c   |  2 +
> > >  drivers/staging/media/hantro/hantro_hw.h    |  2 +
> > >  drivers/staging/media/hantro/imx8m_vpu_hw.c | 57 +++++++++++++++++++++
> > >  4 files changed, 102 insertions(+)
> > >
> >
> > Adam,
> >
> > That's for the patches!
> >
> > I tested just this series on top of v5.16-rc3 on an
> > imx8mm-venice-gw73xx-0x and found that if I loop fluster I can end up
> > getting a hang within 10 to 15 mins or so when imx8m_blk_ctrl_power_on
> > is called for VPUMIX pd :
> > while [ 1 ]; do uptime; ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0; done
> > ...
> > [  618.838436] imx-pgc imx-pgc-domain.6: failed to command PGC
> > [  618.844407] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
> >
> > I added prints in imx_pgc_power_{up,down} and
> > imx8m_blk_ctrl_power_{on,off} to get some more context
> > ...
> > Ran 55/61 tests successfully               in 8.685 secs
> >  17:16:34 up 17 min,  0 users,  load average: 3.97, 2.11, 0.93
> > ********************************************************************************
> > ********************
> > Running test suite VP8-TEST-VECTORS with decoder GStreamer-VP8-V4L2SL-Gst1.0
> > Using 4 parallel job(s)
> > ********************************************************************************
> > ********************
> >
> > [TEST SUITE      ] (DECODER                    ) TEST VECTOR               ... R
> > ESULT
> > ----------------------------------------------------------------------
> > [ 1023.114806] imx8m_blk_ctrl_power_on vpublk-g1
> > [ 1023.119669] imx_pgc_power_up vpumix
> > [ 1023.124307] imx-pgc imx-pgc-domain.6: failed to command PGC
> > [ 1023.130006] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
> >
> > While this wouldn't be an issue with this series it does indicate we
> > still have something racy in blk-ctrl. Can you reproduce this (and if
> > not what kernel are you based on)? Perhaps you or Lucas have some
> > ideas?
> >
> Did you have "[PATCH] soc: imx: gpcv2: Synchronously suspend MIX
> domains" applied when running those tests? It has only recently been
> picked up by Shawn and may have an influence on the bus domain
> behavior.
>

Lucas,

Good point. I did have that originally before I started pruning down
to the bare minimum to reproduce the issue.

I added it back and now I have the following:
arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2
media: hantro: Add support for i.MX8M Mini
soc: imx: gpcv2: keep i.MX8MM VPU-H1 bus clock active
soc: imx: gpcv2: Synchronously suspend MIX domains
Linux 5.16-rc3

Here's the latest with that patch:
...
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2SL-Gst1.0)
vp80-00-comprehensive-007 ... Success
[  316.632373] imx8m_blk_ctrl_power_off vpublk-g1
[  316.636908] imx_pgc_power_down vpu-g1
[  316.640983] imx_pgc_power_down vpumix
[  316.756869] imx8m_blk_ctrl_power_on vpublk-g1
[  316.761360] imx_pgc_power_up vpumix
[  316.765985] imx-pgc imx-pgc-domain.6: failed to command PGC
[  316.772743] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
^^^ hang

I believe there is some sort of simple test I can do to power the gpu
up/down to test as well but not clear what that is.

Tim
