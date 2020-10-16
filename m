Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5B6290562
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 14:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405115AbgJPMj5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 16 Oct 2020 08:39:57 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37054 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394753AbgJPMj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 08:39:56 -0400
Received: by mail-ot1-f66.google.com with SMTP id m22so2249056ots.4;
        Fri, 16 Oct 2020 05:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lCRQOP5ULuZOcOrr6TE/sb1T1LnbsVEDIvfNHuZQ07g=;
        b=IaQX87TgCuccVR8SzXMOKlg7PL1cGBX0WR26G1w9XzslIUBUWn+IhF32rCsv1aXdae
         T5FGDfO1O3EWuq6yEoA4b45njSJfI1ZMXSDy/S17v3rUULbekHnGOTH3HDePphlHqEmG
         SWszmQkGeTyTOS4Qvwn9dqY9cyfanT7oHseHMXoN3RubFLR0XvaN24F8TRP2dZei7MeM
         rxPApH8YoS0syRfRPDymwTzinknxgyPbElz59XuVTfkoor0yXn+kNchd8HQx+su4GsdB
         gnq3hESTUeBbIJ2lBmRJPdWbgs/dpJ02xwg93hMbDHCLRKMWsMlIcWCvwpmfzlvH0Kco
         BUrA==
X-Gm-Message-State: AOAM5315h6hxDfrte3DKrhcJwA1apEd7MRugRUo14JAUA1oMkUa5dHXa
        tsWi0goamGwZoR1sr/CmPMZgXsyZwybxnbKbyu8=
X-Google-Smtp-Source: ABdhPJx08iCMGa+iHTfGzsTfjIwa800eYBhdeXbAzI92Qy2+JOw/73mbaVOc0u2+rDeR6rV06Rof/ds8as/KJ8ftuyc=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2365050otc.145.1602851995553;
 Fri, 16 Oct 2020 05:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWnchxP=s84SArS9XWg+uZESVXbkfOXWrpbpwUqNRk91g@mail.gmail.com>
 <20201016104629.xy4fb23ibglwh574@oden.dyn.berto.se> <CAMuHMdW85WQ7zsdVrjuUTQ+RNsBA6fEnTajjpYp9a+rnZtwmOA@mail.gmail.com>
 <20201016122347.qgnhbyvs6kmyitny@oden.dyn.berto.se>
In-Reply-To: <20201016122347.qgnhbyvs6kmyitny@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Oct 2020 14:39:44 +0200
Message-ID: <CAMuHMdUc=+bq2ezdVpnnXHrbr0CwmqSx=78CtOHDAEpQZ_osag@mail.gmail.com>
Subject: Re: [PATCH 0/5] rcar-vin: Support suspend and resume
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Oct 16, 2020 at 2:23 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2020-10-16 13:26:25 +0200, Geert Uytterhoeven wrote:
> > On Fri, Oct 16, 2020 at 12:46 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > On 2020-10-16 09:06:20 +0200, Geert Uytterhoeven wrote:
> > > > On Fri, Oct 16, 2020 at 4:01 AM Niklas Söderlund
> > > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > > This series add suspend and resume support directly to R-Car VIN and
> > > > > indirectly to R-Car CSI-2 and other subdevices in the VIN capture
> > > > > pipeline. The capture pipeline is stopped when suspending and started
> > > > > when resuming, all while retaining the buffers provided from user-space.
> > > > > This makes the start and stop of the pipeline transparent from an
> > > > > application point of view.
> > > > >
> > > > > As the pipeline is switched off subdevices that poweroff themself when
> > > > > not in use (such as R-Car CSI-2) are also switched off and are
> > > > > indirectly serviced by the suspend support in VIN.
> > > >
> > > > Thanks for your series!
> > > >
> > > > > This work is based on-top of the media-tree and is tested on both R-Car
> > > > > Gen2 and Gen3 without any regressions.
> > > >
> > > > FTR: did you test on Gen3 with both s2idle and s2ram, the latter powering
> > > > off the SoC?
> > >
> > > I have only been able to test it with s2idle. My issue is that s2ram
> > > fails to reconnect the Ethernet (ravb) and I use nfsroot. If I instead
> > > use a initramfs I can resume from s2ram but I don't have the setup to
> > > test capture in that environment.
> >
> > >     [  347.775223] libphy: ravb_mii: probed
> > >     [  347.782808] mdio_bus e6800000.ethernet-ffffffff: MDIO device at address 0 is missing.
> > >     [  347.794508] ravb e6800000.ethernet eth0: failed to connect PHY
> > >     [  347.802223] PM: dpm_run_callback(): ravb_resume+0x0/0x190 returns -2
> > >     [  347.808739] PM: Device e6800000.ethernet failed to resume: error -2
> > >     [  347.929701] ata1: link resume succeeded after 1 retries
> > >     [  347.989934] OOM killer enabled.
> > >     [  347.993184] Restarting tasks ... done.
> > >     [  348.004321] PM: suspend exit
> > >     [  348.039400] ata1: SATA link down (SStatus 0 SControl 300)
> > >     [  529.376515] nfs: server 10.0.1.1 not responding, still trying
> > >     [  529.376702] nfs: server 10.0.1.1 not responding, still trying
> > >     [  529.385628] nfs: server 10.0.1.1 not responding, still trying
> > >     ** Board never reaches user-space **
> > >
> > > Is there a known fix for this?
> >
> > Please try cherry-picking commit 77972b55fb9d35d4 ("Revert "ravb: Fixed
> > to be able to unload modules"") from v5.9.
>
> Thanks that did the trick!

Glad to hear that!

> Unfortunately it revealed a new problem related to capturing after a
> s2ram, the ADV7482 does not support s2ram and when it gets reset it no
> longer is possible to communicate to it over i2c. This in turn breaks
> the VIN s2ram test as of course it can not resume capture if it can't
> talk to the ADV7482.
>
> I reproduced this issue directly on top of v5.9. I'm not streaming at
> the time of s2ram. The test is to read the video standard reported by
> the AFE subdevice provided by the ADV7482 before and after s2ram. As
> shown it does not respond after a s2ram but unbind/bind it forcing it to
> reinit itself solves the issue.

I guess the pesky adv7482 needs its secondary addresses to be reprogrammed
in its resume handler?

> I think this issue needs to be resolved before I can truly verify the
> operation of this series post s2ram. Do you think this series should be
> held until then or does it bring enough value (s2idle) while not
> introducing any regressions? s2ram is just as broken before as after :-)

Well, my main worry is that it would hide a so far unknown s2ram resume
issue in the rcar-vin driver.  I've seen too many  "Add suspend/resume"
commits yielding drivers where suspend/resume still didn't work
afterwards.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
