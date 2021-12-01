Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6974655D9
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 19:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352471AbhLASzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 13:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236195AbhLASzq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 13:55:46 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F06C061574;
        Wed,  1 Dec 2021 10:52:25 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id e3so105942335edu.4;
        Wed, 01 Dec 2021 10:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BMzdVODYEZDmXhkwbbPDAazGb6BZUuwpFxeDdPySxIE=;
        b=ReAy6hasuXqYIrFJ7S3NpVZS1JFAevPR19/lQmR1bHNEQDmhpNdJ/UeP7MCq9beRyB
         1ylgmvHcEyp+N65ViJX7tIekOty3XaPzimhshatCVWE9o3jZtVHS4uBpNA+/jiau6u+B
         8f52DdghmuuL0Ga4Vq8ZQyXN/V+CCcT3QfnRqQM3yIl0NdPoNt4ikP8Q7gWvSork0pS9
         md5AMzOmANU8HRiAcDuGdlfnoqRlbFdDVoRSbhy0mOsCHHzXFpbs2ix1DxExIDcGhDmq
         FKU43jx7TZi3liscMwaLc4jWqWFTIddqHruzTzXx79PeF55pkmLvOVHicyQ6iU1l1vq8
         KUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BMzdVODYEZDmXhkwbbPDAazGb6BZUuwpFxeDdPySxIE=;
        b=op5znqgpRL+kFLbs2vgxm6DVrQkTT/NlD3erFCs7kdc63fUpT37++QTaI0+diRye3v
         a7KWbMe5H/diz8a83vi2Iu0Tb2njEYritP12ROCUfdc9cULNdR7l2dUSLQyz5pkb+jzT
         vnlbiK2HMZ0/qJcESi1MknafITZPkz1Zjx1BxHpkobvw/gtHvXHSrl3YEYtjWkNX41W9
         kK81jA/hsOUwrRGIF6iGJUxYiIkjFyJWV2o+125mFFrXh83nn1L0Hlm/Ahk8ktc4yEYd
         JOowkRY1MvY8BvttgHSEXGPXZ80isBzjK7tYJjucIVCWzxKr4ZUaVMcaXp8xqQ2f4lsX
         JzFg==
X-Gm-Message-State: AOAM532PvaDM69wWnGh99wCzCYrddt4MD3ZYf9Xd0CitqwUd6BKQqvlS
        bq1crAjLddYVP/j5fKHKl0wtZUw4Xa85uHX4uz0=
X-Google-Smtp-Source: ABdhPJx+rl7Qwmu/4HGJxjJrkWNwt6ZRSPo2a9mPfbdm+lQz6cmlLkP1lX7RtTrjddIktVkjKN2hPVs+VniYrlLhZXs=
X-Received: by 2002:a05:6402:27c7:: with SMTP id c7mr11077490ede.0.1638384743727;
 Wed, 01 Dec 2021 10:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20211201013329.15875-1-aford173@gmail.com> <CAJ+vNU1jENmWAR_5E98Vgb53ctxjxSWJewPW0YC4Yp4DuYTn3g@mail.gmail.com>
 <7216bc863d89faa9fdc5cd8d44c319f7a6d88159.camel@pengutronix.de>
 <CAJ+vNU2PxgdN414Ufd4NAG5CJgnftNSAHDGpt9Nj+RfgkNmxaw@mail.gmail.com> <ccfc08bbb6ec0debd523bd106e7eff4a747aaa23.camel@pengutronix.de>
In-Reply-To: <ccfc08bbb6ec0debd523bd106e7eff4a747aaa23.camel@pengutronix.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 1 Dec 2021 12:52:12 -0600
Message-ID: <CAHCN7xKfRj3f03kC5TuBv-Te1OyeWNRe2aaqJNaW9VdHgbWqbg@mail.gmail.com>
Subject: Re: [RFC V2 0/2] arm64: imx8mm: Enable Hantro VPUs
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Tim Harvey <tharvey@gateworks.com>,
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

On Wed, Dec 1, 2021 at 12:37 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Mittwoch, dem 01.12.2021 um 10:16 -0800 schrieb Tim Harvey:
> > On Wed, Dec 1, 2021 at 9:32 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > >
> > > Hi Tim,
> > >
> > > Am Mittwoch, dem 01.12.2021 um 09:23 -0800 schrieb Tim Harvey:
> > > > On Tue, Nov 30, 2021 at 5:33 PM Adam Ford <aford173@gmail.com> wrote:
> > > > >
> > > > > The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
> > > > > to be related to the video decoders used on the i.MX8MQ, but because of
> > > > > how the Mini handles the power domains, the VPU driver does not need to
> > > > > handle all the functions, nor does it support the post-processor,
> > > > > so a new compatible flag is required.
> > > > >
> > > > > With the suggestion from Hans Verkuil, I was able to get the G2 splat to go away
> > > > > with changes to FORCE_MAX_ZONEORDER, but I found I could also set cma=512M, however
> > > > > it's unclear to me if that's an acceptable alternative.
> > > > >
> > > > > At the suggestion of Ezequiel Garcia and Nicolas Dufresne I have some
> > > > > results from Fluster. However, the G2 VPU appears to fail most tests.
> > > > >
> > > > > ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> > > > > Ran 90/135 tests successfully               in 76.431 secs
> > > > >
> > > > >  ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> > > > > Ran 55/61 tests successfully               in 21.454 secs
> > > > >
> > > > > ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> > > > > Ran 0/303 tests successfully               in 20.016 secs
> > > > >
> > > > > Each day seems to show more and more G2 submissions, and gstreamer seems to be
> > > > > still working on the VP9, so I am not sure if I should drop G2 as well.
> > > > >
> > > > >
> > > > > Adam Ford (2):
> > > > >   media: hantro: Add support for i.MX8M Mini
> > > > >   arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2
> > > > >
> > > > >  arch/arm64/boot/dts/freescale/imx8mm.dtsi   | 41 +++++++++++++++
> > > > >  drivers/staging/media/hantro/hantro_drv.c   |  2 +
> > > > >  drivers/staging/media/hantro/hantro_hw.h    |  2 +
> > > > >  drivers/staging/media/hantro/imx8m_vpu_hw.c | 57 +++++++++++++++++++++
> > > > >  4 files changed, 102 insertions(+)
> > > > >
> > > >
> > > > Adam,
> > > >
> > > > That's for the patches!
> > > >
> > > > I tested just this series on top of v5.16-rc3 on an
> > > > imx8mm-venice-gw73xx-0x and found that if I loop fluster I can end up
> > > > getting a hang within 10 to 15 mins or so when imx8m_blk_ctrl_power_on
> > > > is called for VPUMIX pd :
> > > > while [ 1 ]; do uptime; ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0; done
> > > > ...
> > > > [  618.838436] imx-pgc imx-pgc-domain.6: failed to command PGC
> > > > [  618.844407] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
> > > >
> > > > I added prints in imx_pgc_power_{up,down} and
> > > > imx8m_blk_ctrl_power_{on,off} to get some more context
> > > > ...
> > > > Ran 55/61 tests successfully               in 8.685 secs
> > > >  17:16:34 up 17 min,  0 users,  load average: 3.97, 2.11, 0.93
> > > > ********************************************************************************
> > > > ********************
> > > > Running test suite VP8-TEST-VECTORS with decoder GStreamer-VP8-V4L2SL-Gst1.0
> > > > Using 4 parallel job(s)
> > > > ********************************************************************************
> > > > ********************
> > > >
> > > > [TEST SUITE      ] (DECODER                    ) TEST VECTOR               ... R
> > > > ESULT
> > > > ----------------------------------------------------------------------
> > > > [ 1023.114806] imx8m_blk_ctrl_power_on vpublk-g1
> > > > [ 1023.119669] imx_pgc_power_up vpumix
> > > > [ 1023.124307] imx-pgc imx-pgc-domain.6: failed to command PGC
> > > > [ 1023.130006] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
> > > >
> > > > While this wouldn't be an issue with this series it does indicate we
> > > > still have something racy in blk-ctrl. Can you reproduce this (and if
> > > > not what kernel are you based on)? Perhaps you or Lucas have some
> > > > ideas?
> > > >
> > > Did you have "[PATCH] soc: imx: gpcv2: Synchronously suspend MIX
> > > domains" applied when running those tests? It has only recently been
> > > picked up by Shawn and may have an influence on the bus domain
> > > behavior.
> > >
> >
> > Lucas,
> >
> > Good point. I did have that originally before I started pruning down
> > to the bare minimum to reproduce the issue.
> >
> > I added it back and now I have the following:
> > arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2
> > media: hantro: Add support for i.MX8M Mini
> > soc: imx: gpcv2: keep i.MX8MM VPU-H1 bus clock active
> > soc: imx: gpcv2: Synchronously suspend MIX domains
> > Linux 5.16-rc3
> >
> > Here's the latest with that patch:
> > ...
> > [VP8-TEST-VECTORS] (GStreamer-VP8-V4L2SL-Gst1.0)
> > vp80-00-comprehensive-007 ... Success
> > [  316.632373] imx8m_blk_ctrl_power_off vpublk-g1
> > [  316.636908] imx_pgc_power_down vpu-g1
> > [  316.640983] imx_pgc_power_down vpumix
> > [  316.756869] imx8m_blk_ctrl_power_on vpublk-g1
> > [  316.761360] imx_pgc_power_up vpumix
> > [  316.765985] imx-pgc imx-pgc-domain.6: failed to command PGC
> > [  316.772743] imx8m-blk-ctrl 38330000.blk-ctrl: failed to power up bus domain
> > ^^^ hang
>
> Hm, I wonder if there's some broken error handling here somewhere, as a
> failure to power up a domain shouldn't lead to a hang.
>
> However, that doesn't explain why the PGC isn't completing the request.
> Can you try to extend the timeout some more. Even though I think that
> 1msec should already be generous. Can you dump the content of the
> GPC_PU_PGC_SW_PUP_REQ and GPC_A53_PU_PGC_PUP_STATUSn (all 3 of them)
> registers, when the failure condition is hit?

I submitted a patch [1]  to enable the commented-out if statement
which waits for the handshake if the gpc domain was invoked by the
blk-ctrl or we knew if the bus clock was operational.

I am not 100% certain it can work as-is with the vpumix, but based on
what I've seen from my testing, it's not hanging or causing errors.

[1] - https://lore.kernel.org/linux-arm-kernel/20211120194900.1309914-1-aford173@gmail.com/T/

I didn't have it applied to my latest RFC for the G1 and G2 because I
had not noticed a change in behavior one way or the other with that
patch.

adam
>
> Regards,
> Lucas
>
