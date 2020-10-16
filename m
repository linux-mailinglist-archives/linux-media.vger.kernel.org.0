Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F67F2904FF
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 14:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407461AbgJPMXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 08:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405286AbgJPMXx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 08:23:53 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E01BC0613D3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 05:23:52 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c141so2615363lfg.5
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 05:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zRDLEPNwn+TPPh3w8o88mOifGrfGlRt2GyjvzmXXfJI=;
        b=kKA406UFyyg5DCAdgyk3Ng9B6jknK1Ag1tPNJVooXkJ2wuJna75UfEpynzkCSdvFNR
         NGLdRnM9+SH5jfBK1I+TZOeFLfosArHAZqqHtJaD8SnoTpm+ZSCRl2RpicS0vgV3ZEqS
         9k5bNRBAhJoxcj4oF0IcRYj1GrHCKDUKJ02HqXHD+WoXtSdrBCOrgcQEzt9BD3sTyVXf
         Xu/Z+XU51dAmgagRhVq3YoDXhiMgUE21KLOktlDesZi3DnlK+CSpj+pdqTrNhhPo9XlN
         RzmrW1rS8eDe5sAzrv7tE2DypB1mlHF+lD32aptqmK8yR61mrN3YwFRGfRWp+WEUqyQh
         Z0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zRDLEPNwn+TPPh3w8o88mOifGrfGlRt2GyjvzmXXfJI=;
        b=rEIofPAQYRbIFp8uIxrA+rR2IWX7MmeZMfny1netnxKkgQtltV5qXZ0gvqaKcG+r6U
         L+4j9FDhioFHfsCpPuRd42EyrPGw8WbSNPu7ebxbXhXWsZ2aR2MtaaBt5KHz7gn5DAWj
         J0LRD9ArUCbOxp5Oof5Tq1iZikYzkaUep4/2C58UCbKMjO88IU5Q6r8hwgAozLoWVoC0
         kXCk5Wp9UY/m0/+NroYEYxNMwLutWRJTPftIKK26kpQqGfWoVISRDfPMNDdg2suvPT1Z
         WWU1z17kiYs4gySUKkYyWS7PzBPNr1hiovX13uo/EmT5uvmIJNzSlv524+Q00k5hBOxC
         SAlQ==
X-Gm-Message-State: AOAM530Lj5Wyxen3ljSjmkH2cogJON+IaVIdRCOnEAGo6ywwAnMLUDFw
        cqBKHZR2AyfwLk6tNzCe2cNOHQ==
X-Google-Smtp-Source: ABdhPJwIozlt/WmV8OjO0WYspq+pZUof3DTNsICubQG7W4Fvd8pK1U/3zyWqV0i7OqUopyi7dIgdWQ==
X-Received: by 2002:a05:6512:211:: with SMTP id a17mr1102719lfo.217.1602851030244;
        Fri, 16 Oct 2020 05:23:50 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c131sm775777lfg.48.2020.10.16.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 05:23:48 -0700 (PDT)
Date:   Fri, 16 Oct 2020 14:23:47 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/5] rcar-vin: Support suspend and resume
Message-ID: <20201016122347.qgnhbyvs6kmyitny@oden.dyn.berto.se>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWnchxP=s84SArS9XWg+uZESVXbkfOXWrpbpwUqNRk91g@mail.gmail.com>
 <20201016104629.xy4fb23ibglwh574@oden.dyn.berto.se>
 <CAMuHMdW85WQ7zsdVrjuUTQ+RNsBA6fEnTajjpYp9a+rnZtwmOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW85WQ7zsdVrjuUTQ+RNsBA6fEnTajjpYp9a+rnZtwmOA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 2020-10-16 13:26:25 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, Oct 16, 2020 at 12:46 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2020-10-16 09:06:20 +0200, Geert Uytterhoeven wrote:
> > > On Fri, Oct 16, 2020 at 4:01 AM Niklas Söderlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > This series add suspend and resume support directly to R-Car VIN and
> > > > indirectly to R-Car CSI-2 and other subdevices in the VIN capture
> > > > pipeline. The capture pipeline is stopped when suspending and started
> > > > when resuming, all while retaining the buffers provided from user-space.
> > > > This makes the start and stop of the pipeline transparent from an
> > > > application point of view.
> > > >
> > > > As the pipeline is switched off subdevices that poweroff themself when
> > > > not in use (such as R-Car CSI-2) are also switched off and are
> > > > indirectly serviced by the suspend support in VIN.
> > >
> > > Thanks for your series!
> > >
> > > > This work is based on-top of the media-tree and is tested on both R-Car
> > > > Gen2 and Gen3 without any regressions.
> > >
> > > FTR: did you test on Gen3 with both s2idle and s2ram, the latter powering
> > > off the SoC?
> >
> > I have only been able to test it with s2idle. My issue is that s2ram
> > fails to reconnect the Ethernet (ravb) and I use nfsroot. If I instead
> > use a initramfs I can resume from s2ram but I don't have the setup to
> > test capture in that environment.
> 
> >     [  347.775223] libphy: ravb_mii: probed
> >     [  347.782808] mdio_bus e6800000.ethernet-ffffffff: MDIO device at address 0 is missing.
> >     [  347.794508] ravb e6800000.ethernet eth0: failed to connect PHY
> >     [  347.802223] PM: dpm_run_callback(): ravb_resume+0x0/0x190 returns -2
> >     [  347.808739] PM: Device e6800000.ethernet failed to resume: error -2
> >     [  347.929701] ata1: link resume succeeded after 1 retries
> >     [  347.989934] OOM killer enabled.
> >     [  347.993184] Restarting tasks ... done.
> >     [  348.004321] PM: suspend exit
> >     [  348.039400] ata1: SATA link down (SStatus 0 SControl 300)
> >     [  529.376515] nfs: server 10.0.1.1 not responding, still trying
> >     [  529.376702] nfs: server 10.0.1.1 not responding, still trying
> >     [  529.385628] nfs: server 10.0.1.1 not responding, still trying
> >     ** Board never reaches user-space **
> >
> > Is there a known fix for this?
> 
> Please try cherry-picking commit 77972b55fb9d35d4 ("Revert "ravb: Fixed
> to be able to unload modules"") from v5.9.

Thanks that did the trick!

Unfortunately it revealed a new problem related to capturing after a 
s2ram, the ADV7482 does not support s2ram and when it gets reset it no 
longer is possible to communicate to it over i2c. This in turn breaks 
the VIN s2ram test as of course it can not resume capture if it can't 
talk to the ADV7482.

I reproduced this issue directly on top of v5.9. I'm not streaming at 
the time of s2ram. The test is to read the video standard reported by 
the AFE subdevice provided by the ADV7482 before and after s2ram. As 
shown it does not respond after a s2ram but unbind/bind it forcing it to 
reinit itself solves the issue.

Test case:

    # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
    # v4l2-ctl --get-detected-standard -d $subdev
    # echo N > /sys/module/printk/parameters/console_suspend
    # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode 
    ** flipp SW23 off **
    # echo mem > /sys/power/state
    ** Waits 30+ seconds then switch SW23 on ** 
    # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
    # v4l2-ctl --get-detected-standard -d $subdev
    # echo 4-0070 > /sys/bus/i2c/drivers/adv748x/unbind
    # echo 4-0070 > /sys/bus/i2c/drivers/adv748x/bind
    # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
    # v4l2-ctl --get-detected-standard -d $subdev

Output:

    # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
    # echo $subdev
    /dev/v4l-subdev20
    # v4l2-ctl --get-detected-standard -d $subdev
    Video Standard = 0x000000ff
	    PAL-B/B1/G/H/I/D/D1/K
    # echo N > /sys/module/printk/parameters/console_suspend 
    # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
    # echo mem > /sys/power/state
    [  477.555286] PM: suspend entry (deep)
    [  477.560233] Filesystems sync: 0.000 seconds
    [  477.572660] Freezing user space processes ... (elapsed 0.002 seconds) done.
    [  477.575590] OOM killer disabled.
    [  477.575598] Freezing remaining freezable tasks ... (elapsed 0.002 seconds) done.
    [  477.587659] ravb e6800000.ethernet eth0: Link is Down
    [  477.857405] Disabling non-boot CPUs ...
    [  477.863418] CPU1: shutdown
    [  477.866275] psci: CPU1 killed (polled 0 ms)
    INFO:    ARM GICv2 driver initialized
    NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.2.0.6
    NOTICE:  BL2: PRR is R-Car M3N Ver.1.0
    NOTICE:  BL2: Board is Salvator-XS Rev.1.0
    NOTICE:  BL2: Boot device is HyperFlash(160MHz)
    NOTICE:  BL2: LCM state is CM
    NOTICE:  AVS setting succeeded. DVFS_SetVID=0x53
    NOTICE:  BL2: DDR3200(rev.0.40)
    NOTICE:  BL2: [WARM_BOOT]
    NOTICE:  BL2: DRAM Split is OFF
    NOTICE:  BL2: QoS is default setting(rev.0.09)
    NOTICE:  BL2: DRAM refresh interval 1.95 usec
    NOTICE:  BL2: Periodic Write DQ Training
    NOTICE:  BL2: CH0: 400000000 - 47fffffff, 2 GiB
    NOTICE:  BL2: FDT at 0xe6322508
    NOTICE:  BL2: v2.3(release):v2.3-188-g9935047b2086faa3
    NOTICE:  BL2: Built : 23:31:02, Jun 18 2020
    NOTICE:  BL2: Normal boot
    INFO:    BL2: Doing platform setup
    [  477.872578] Enabling non-boot CPUs ...
    [  477.876839] Detected PIPT I-cache on CPU1
    [  477.876897] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
    [  477.878379] CPU1 is up
    [  478.019935] usb usb2: root hub lost power or was reset
    [  478.025283] usb usb1: root hub lost power or was reset
    [  478.171928] usb usb4: root hub lost power or was reset
    [  478.178011] usb usb3: root hub lost power or was reset
    [  478.217119] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=197)
    [  478.341930] ata1: link resume succeeded after 1 retries
    [  478.403262] OOM killer enabled.
    [  478.406730] Restarting tasks ... done.
    [  478.417250] PM: suspend exit
    [  478.451992] ata1: SATA link down (SStatus 0 SControl 300)
    [  485.716683] ravb e6800000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
    # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
    # v4l2-ctl --get-detected-standard -d $subdev
    [  502.753723] adv748x 4-0070: error reading 63, 02
    [  502.866437] adv748x 4-0070: error reading 63, 02
    VIDIOC_QUERYSTD: failed: No such device or address
    # echo 4-0070 > /sys/bus/i2c/drivers/adv748x/unbind
    # echo 4-0070 > /sys/bus/i2c/drivers/adv748x/bind
    [  511.830105] adv748x 4-0070: Endpoint /soc/i2c@e66d8000/video-receiver@70/port@7/endpoint on port 7
    [  511.839766] adv748x 4-0070: Endpoint /soc/i2c@e66d8000/video-receiver@70/port@8/endpoint on port 8
    [  511.849682] adv748x 4-0070: Endpoint /soc/i2c@e66d8000/video-receiver@70/port@a/endpoint on port 10
    [  511.859509] adv748x 4-0070: Endpoint /soc/i2c@e66d8000/video-receiver@70/port@b/endpoint on port 11
    [  511.870845] adv748x 4-0070: chip found @ 0xe0 revision 2143
    # subdev=$(grep -l "adv748x 4-0070 afe" /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g')
    # v4l2-ctl --get-detected-standard -d $subdev
    Video Standard = 0x000000ff
	    PAL-B/B1/G/H/I/D/D1/K
    #

I think this issue needs to be resolved before I can truly verify the 
operation of this series post s2ram. Do you think this series should be 
held until then or does it bring enough value (s2idle) while not 
introducing any regressions? s2ram is just as broken before as after :-)

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
