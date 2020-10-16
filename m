Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D80290379
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 12:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395483AbgJPKqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 06:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395479AbgJPKqd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 06:46:33 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D70C061755
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 03:46:32 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id a7so2258035lfk.9
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GxWpsonXHZk3zzIguQtFY3XPmOS5ItUSqY/CvWrQDc0=;
        b=uAVW5LZ0qDoTr11vN0BBe+1vX4rbwGvp1XMQ/KEaZr5f8W+mk4dcL3Hgw++zlnaVSB
         qzBQgmXWZ9vDUwe0nFRnajnG7HorEG1vaaUA/rpdEGxwwzHhy5FHmWiwsziwdjCV3n/o
         j1jhzHz4h1apXSkrGBMeve4P5jamP+ZkiIyooQ0d4wuURiXbv4zBbW3H8CDfSOyLr/tv
         cQhpOTL0DB8If7bRY6fYQM62OIylS7oWEHSrKuDZ/0JXEiwwp78Fd5tFQaeQkbW19orn
         gGsUmMlU7HLVhxT5SniR8+MJsn4664VJOAd/0NrqaADR2qS9LX4WILVoRV5lDg8iBMzV
         RgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GxWpsonXHZk3zzIguQtFY3XPmOS5ItUSqY/CvWrQDc0=;
        b=l8kPoMi6fVSmUEzWrE1Mph/m2bQ4SLrUJE87TUHdUvbHcG/nxuYZZRgVx6WfIV2ps1
         WKZmQ79EH/hemI4F1d16VkZgrCTnnYZvr9RJmKUufOrXZoAfF/t5qrhCnCUAjJhgkDTm
         uWowcd8luFzwYGsKY1sfpfiESUC9/G3eL6ORl+GEjddJI7vDQpmikWq0EyH6oKu+tfDm
         umgTJCz2C2UFCBEluuIESFtK+NudpgYtAwyB86p74ql5DTET9o6qD0B8Qzg1n+kyVwKc
         QVFixn87LgjGkjQtWWqBfmdZh7G3gNV4ZX2R3JG0eFTfRO+IcQEtDo8+EpTx5rMPtrHq
         fqIA==
X-Gm-Message-State: AOAM531htknGIp60GdqgHKDP48J95pRteJjDfw4BqY+BdYVudniLm/Ug
        n9YJ/SNg8bO6KWQPlH0rcKQl/BSTsuuI5g==
X-Google-Smtp-Source: ABdhPJwn+emKMSImv/ay6it3kVmAQdJapmCqNQeyL62QfTbrTgeXOFuxoVIoJrgyIbbuV0Xr3WfHKQ==
X-Received: by 2002:a19:350:: with SMTP id 77mr1194910lfd.92.1602845191026;
        Fri, 16 Oct 2020 03:46:31 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id z19sm704004lfr.46.2020.10.16.03.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 03:46:30 -0700 (PDT)
Date:   Fri, 16 Oct 2020 12:46:29 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/5] rcar-vin: Support suspend and resume
Message-ID: <20201016104629.xy4fb23ibglwh574@oden.dyn.berto.se>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWnchxP=s84SArS9XWg+uZESVXbkfOXWrpbpwUqNRk91g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWnchxP=s84SArS9XWg+uZESVXbkfOXWrpbpwUqNRk91g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 2020-10-16 09:06:20 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, Oct 16, 2020 at 4:01 AM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > This series add suspend and resume support directly to R-Car VIN and
> > indirectly to R-Car CSI-2 and other subdevices in the VIN capture
> > pipeline. The capture pipeline is stopped when suspending and started
> > when resuming, all while retaining the buffers provided from user-space.
> > This makes the start and stop of the pipeline transparent from an
> > application point of view.
> >
> > As the pipeline is switched off subdevices that poweroff themself when
> > not in use (such as R-Car CSI-2) are also switched off and are
> > indirectly serviced by the suspend support in VIN.
> 
> Thanks for your series!
> 
> > This work is based on-top of the media-tree and is tested on both R-Car
> > Gen2 and Gen3 without any regressions.
> 
> FTR: did you test on Gen3 with both s2idle and s2ram, the latter powering
> off the SoC?

I have only been able to test it with s2idle. My issue is that s2ram 
fails to reconnect the Ethernet (ravb) and I use nfsroot. If I instead 
use a initramfs I can resume from s2ram but I don't have the setup to 
test capture in that environment.

My procedure for s2idle that works with nfsroot is,

    # path=$(find /sys -path '/sys/devices/platform/*/ttySC0/power/wakeup')
    # echo enabled > $path
    # echo N > /sys/module/printk/parameters/console_suspend
    # echo s2idle > /sys/power/mem_slee
    # echo mem > /sys/power/state
    ** Wait a while and then wakeup using the console **
    #

My procedure for s2ram that does _not_ work with nfsroot (but do with 
initramfs). Both tests are done on a M3-N.

    # echo N > /sys/module/printk/parameters/console_suspend
    # echo on > /sys/bus/i2c/drivers/bd9571mwv/*/bd9571mwv-regulator*/backup_mode
    ** flipp SW23 off **
    # echo mem > /sys/power/state
    [  347.096336] PM: suspend entry (deep)
    [  347.104251] Filesystems sync: 0.003 seconds
    [  347.123751] Freezing user space processes ... (elapsed 0.007 seconds) done.
    [  347.138760] OOM killer disabled.
    [  347.142099] Freezing remaining freezable tasks ... (elapsed 0.002 seconds) done.
    [  347.167466] ravb e6800000.ethernet eth0: Link is Down
    [  347.440549] Disabling non-boot CPUs ...
    [  347.448805] CPU1: shutdown
    [  347.451731] psci: CPU1 killed (polled 0 ms)
    ** Waits 30+ seconds then switch SW23 on **
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
    [  347.461237] Enabling non-boot CPUs ...
    [  347.465551] Detected PIPT I-cache on CPU1
    [  347.465611] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
    [  347.468691] CPU1 is up
    [  347.607806] usb usb2: root hub lost power or was reset
    [  347.613594] usb usb1: root hub lost power or was reset
    [  347.767713] usb usb4: root hub lost power or was reset
    [  347.773424] usb usb3: root hub lost power or was reset
    [  347.775223] libphy: ravb_mii: probed
    [  347.782808] mdio_bus e6800000.ethernet-ffffffff: MDIO device at address 0 is missing.
    [  347.794508] ravb e6800000.ethernet eth0: failed to connect PHY
    [  347.802223] PM: dpm_run_callback(): ravb_resume+0x0/0x190 returns -2
    [  347.808739] PM: Device e6800000.ethernet failed to resume: error -2
    [  347.929701] ata1: link resume succeeded after 1 retries
    [  347.989934] OOM killer enabled.
    [  347.993184] Restarting tasks ... done.
    [  348.004321] PM: suspend exit
    [  348.039400] ata1: SATA link down (SStatus 0 SControl 300)
    [  529.376515] nfs: server 10.0.1.1 not responding, still trying
    [  529.376702] nfs: server 10.0.1.1 not responding, still trying
    [  529.385628] nfs: server 10.0.1.1 not responding, still trying
    ** Board never reaches user-space **

Is there a known fix for this?

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
