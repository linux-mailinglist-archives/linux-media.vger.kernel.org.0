Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44D72903FA
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 13:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406155AbgJPL0i convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 16 Oct 2020 07:26:38 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35528 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405448AbgJPL0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 07:26:37 -0400
Received: by mail-oi1-f195.google.com with SMTP id w141so2044661oia.2;
        Fri, 16 Oct 2020 04:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+tUY23Fnh3h/GUDvCPSO5j6kFLC3m6/J+eXR/e+9gis=;
        b=OY6jTR2PEiiI3M8FICkaBN2p+/I/v/ZDzSdcY+otgYgb27/h4+dzBqE1loJ4m96n+P
         QQK9WzCQwGuVpmigluqXIlSlg72VbPKojflugmxtBGB7dLSXSyM+lRfPYh5N3JrdwYK7
         mobBXm2XCYWEC3X0+VuhyjDIg4FtUpGhOW4LbfVhzY6KJuw5IBzJodcIuIrOxM/D+hQ8
         2dcZaj4qNgtSMRys9hn6gvimHTvVu0Ll8UIw7BVmlWKqefbGNxEHPYCvv0EtyNvp826n
         4ofBkF/R5nxuL2z6DM/oKpbXX7FdBdtW385fhX80ZQikz9HzYeiJw/bFQFdgzf8Fw5Bo
         8+8Q==
X-Gm-Message-State: AOAM531wxxKP2K7T0tUYkiDBEKCxPesVvSA310uHGEBq/FaoC+MQLDcY
        l+EECev/yrRONOS4hgvDkcgEMQfI98wsdY+/BSg=
X-Google-Smtp-Source: ABdhPJzJxpTR69NUAVkUWUX3gX1LbNWNYPglOpaeIaONbhmS67DHnmzw4TpWpRKbNYJcwWDEwgLLGL+bSTDsfyNoUDk=
X-Received: by 2002:aca:c490:: with SMTP id u138mr2109166oif.54.1602847596494;
 Fri, 16 Oct 2020 04:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWnchxP=s84SArS9XWg+uZESVXbkfOXWrpbpwUqNRk91g@mail.gmail.com> <20201016104629.xy4fb23ibglwh574@oden.dyn.berto.se>
In-Reply-To: <20201016104629.xy4fb23ibglwh574@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Oct 2020 13:26:25 +0200
Message-ID: <CAMuHMdW85WQ7zsdVrjuUTQ+RNsBA6fEnTajjpYp9a+rnZtwmOA@mail.gmail.com>
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

Hi Niklas,

On Fri, Oct 16, 2020 at 12:46 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2020-10-16 09:06:20 +0200, Geert Uytterhoeven wrote:
> > On Fri, Oct 16, 2020 at 4:01 AM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > This series add suspend and resume support directly to R-Car VIN and
> > > indirectly to R-Car CSI-2 and other subdevices in the VIN capture
> > > pipeline. The capture pipeline is stopped when suspending and started
> > > when resuming, all while retaining the buffers provided from user-space.
> > > This makes the start and stop of the pipeline transparent from an
> > > application point of view.
> > >
> > > As the pipeline is switched off subdevices that poweroff themself when
> > > not in use (such as R-Car CSI-2) are also switched off and are
> > > indirectly serviced by the suspend support in VIN.
> >
> > Thanks for your series!
> >
> > > This work is based on-top of the media-tree and is tested on both R-Car
> > > Gen2 and Gen3 without any regressions.
> >
> > FTR: did you test on Gen3 with both s2idle and s2ram, the latter powering
> > off the SoC?
>
> I have only been able to test it with s2idle. My issue is that s2ram
> fails to reconnect the Ethernet (ravb) and I use nfsroot. If I instead
> use a initramfs I can resume from s2ram but I don't have the setup to
> test capture in that environment.

>     [  347.775223] libphy: ravb_mii: probed
>     [  347.782808] mdio_bus e6800000.ethernet-ffffffff: MDIO device at address 0 is missing.
>     [  347.794508] ravb e6800000.ethernet eth0: failed to connect PHY
>     [  347.802223] PM: dpm_run_callback(): ravb_resume+0x0/0x190 returns -2
>     [  347.808739] PM: Device e6800000.ethernet failed to resume: error -2
>     [  347.929701] ata1: link resume succeeded after 1 retries
>     [  347.989934] OOM killer enabled.
>     [  347.993184] Restarting tasks ... done.
>     [  348.004321] PM: suspend exit
>     [  348.039400] ata1: SATA link down (SStatus 0 SControl 300)
>     [  529.376515] nfs: server 10.0.1.1 not responding, still trying
>     [  529.376702] nfs: server 10.0.1.1 not responding, still trying
>     [  529.385628] nfs: server 10.0.1.1 not responding, still trying
>     ** Board never reaches user-space **
>
> Is there a known fix for this?

Please try cherry-picking commit 77972b55fb9d35d4 ("Revert "ravb: Fixed
to be able to unload modules"") from v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
