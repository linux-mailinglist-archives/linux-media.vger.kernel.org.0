Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B77B85CEF9
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 14:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfGBMAd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 08:00:33 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34536 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfGBMAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 08:00:33 -0400
Received: by mail-lj1-f196.google.com with SMTP id p17so16628234ljg.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2019 05:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3rD4eqnP/8/ZndxBIYdMIiCeLtjYowP1AkwQMurBvd4=;
        b=o7ycuNObMi1QLqIfTZyWs9wbnKhtDp1Uf11mjTCrPy1HF43aXn0DVa8NAxWSifO3sk
         1gW3xhUPXFkFmLU3gEh3Cj7kcpBUXFTIlLo3xmIig863/a1wM2JwyXvZ5BoNV5APDVOn
         ahtqoJZtTUOxeRkAVadDrVu3ucTksiTmAp0WfCjfK0byvVLvtNxR9+LLfvn+NPTQidjl
         aFTP4IBoYzYaR/aubXE3mlZQ5ev0qtT98gnHu2zLqH3hGy8YipSbUtS+Z7RfdQoQqEtR
         S+wmaQbWZo4pA8v4bT5Ggv6jR4be7JCmfjpV+QJehIu6zMVgdTaUVMRAPffkABDX4mgi
         jUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3rD4eqnP/8/ZndxBIYdMIiCeLtjYowP1AkwQMurBvd4=;
        b=RwkSCF3p/LjcZHRE8fWtrZWJKh7seGNgJvy6Si1RNfPuPk807FZe7NFymKo0pG+/w5
         I84t1sP2kOpvriUVhoAIlynYLf9fIHap+NHZ3ziHZYJSuhOl3EDSWEWRNGkqQ/YHyJeD
         ISlG/MN1o6ED1dM6Hzl6fyltwPKc1g4J5TI6dl+a5RIl3BTvul+ACinsFbE4cks1Qd3W
         r8I6m4dD86PoLdMrIFJf2U5d0FjisWEgAuvDHCrL6Rx2EDRzRxIVVYRsIyBeKEMsS7i/
         wAo8ZQxmHJAnlwNgx+56V0NPUkg7CdwamBCzr9hGUN+ZkIXpdQVSqaTuP9U2gnrGrLIK
         YZ0w==
X-Gm-Message-State: APjAAAWiNHLdmsLFTEb7mgc6aKrjfqYaA5AJk281G8rTUoGvxm2v4rCK
        qIzk/FhkhbcHqbT5tOD0IdOgTntaJj4=
X-Google-Smtp-Source: APXvYqwhv9MwFiprooQWu9FOeDHczLSp+X8UNLhGgagNeA65ZWlTDlLZORz23Iyi7iGXPTUONpFseg==
X-Received: by 2002:a2e:7c15:: with SMTP id x21mr17182012ljc.55.1562068831258;
        Tue, 02 Jul 2019 05:00:31 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id e14sm2879278lfd.84.2019.07.02.05.00.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 05:00:30 -0700 (PDT)
Date:   Tue, 2 Jul 2019 14:00:30 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] rcar-vin: Clean up correct notifier in error path
Message-ID: <20190702120030.GF11004@bigcity.dyn.berto.se>
References: <20190702012458.31828-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUtVmmRNJCWnYHcNkxBCkV4xvbUBCNzhvxYuj4Vyx5Nsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUtVmmRNJCWnYHcNkxBCkV4xvbUBCNzhvxYuj4Vyx5Nsw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 2019-07-02 13:42:44 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Jul 2, 2019 at 3:25 AM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > When adding the v4l2_async_notifier_cleanup() callas the wrong notifier
> > was cleaned up if the parallel notifier registration failed. Fix this by
> > cleaning up the correct one.
> >
> > Fixes: 9863bc8695bc36e3 ("media: rcar-vin: Cleanup notifier in error path")
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thank you, this fixes the following boot regression on koelsch:

Indeed it does, but this patch only address the symptom and fixes the 
problem in the error path, VIN is still broken on Gen2 with this patch.  
The patch which fixes the regression is,

    https://www.mail-archive.com/linux-media@vger.kernel.org/msg148213.html

> 
> Unable to handle kernel NULL pointer dereference at virtual address 000001d8
> pgd = (ptrval)
> [000001d8] *pgd=00000000
> Internal error: Oops: 5 [#1] SMP ARM
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> 5.2.0-rc7-shmobile-07178-g1a639e48dea73e76 #280
> Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> PC is at __v4l2_async_notifier_cleanup+0xc/0x70
> LR is at v4l2_async_notifier_cleanup+0x1c/0x2c
> pc : [<c0556580>]    lr : [<c0556c78>]    psr: 20000013
> sp : eb08ddc8  ip : 00000000  fp : 00000018
> r10: 00000000  r9 : eb1a5410  r8 : c0c04c08
> r7 : eb1a5400  r6 : ffffffea  r5 : 000001c8  r4 : c0c61854
> r3 : eb08b740  r2 : 00000000  r1 : 00000000  r0 : 000001c8
> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: 4000406a  DAC: 00000051
> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> Stack: (0xeb08ddc8 to 0xeb08e000)
> ddc0:                   c0c61854 000001c8 ffffffea eb1a5400 c0c04c08 c0556c78
> dde0: ea940040 ffffffea ffffffea c057661c c0575c9c c0ff7148 00000001 0286d9e6
> de00: 00000000 eb1a5410 00000000 c0c637bc c0cbe13c 00000000 c0c637bc 00000000
> de20: 00000018 c04408b4 eb1a5410 00000000 c0cbe24c c043ef0c eb1a5410 c0c637bc
> de40: c0c637bc c043f4f8 00000000 c0b54844 c0b6f4b0 c043f354 c0c637bc eb1a5410
> de60: 00000000 00000000 eb1a5410 c0c637bc c043f4f8 00000000 c0b54844 c043f4e0
> de80: 00000000 eb1a5410 c0c637bc c043f5a4 eb1a5410 c0c04c08 c0c637bc c043d6c4
> dea0: c0b6f4b0 eb150f58 eb1aefb4 0286d9e6 00000000 c0c637bc ea956f80 00000000
> dec0: c0c51c50 c043ddf4 c09c6620 c09c6621 00000072 c0c637bc c0c7c840 c0c04c08
> dee0: c0b34c88 c043ffc0 ffffe000 c0c7c840 c0c04c08 c0b01050 00000000 c09fa420
> df00: 00000000 c013ad00 00000000 c0b0078c c09f93a4 000000d4 00000006 00000006
> df20: 00000000 c09fa434 000000d3 c09fa434 c0b54820 ebfffbe9 ebfffbf1 0286d9e6
> df40: 00000000 0286d9e6 c0c7c840 00000007 c0c7c840 c0c83f00 c0b5483c c0c83f00
> df60: c0b54844 c0b013ec 00000006 00000006 00000000 c0b0078c c074a3d0 000000d4
> df80: 00000000 00000000 c074a3d0 00000000 00000000 00000000 00000000 00000000
> dfa0: 00000000 c074a3d8 00000000 c01010e8 00000000 00000000 00000000 00000000
> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [<c0556580>] (__v4l2_async_notifier_cleanup) from [<c0556c78>]
> (v4l2_async_notifier_cleanup+0x1c/0x2c)
> [<c0556c78>] (v4l2_async_notifier_cleanup) from [<c057661c>]
> (rcar_vin_probe+0x4f8/0x5a4)
> [<c057661c>] (rcar_vin_probe) from [<c04408b4>] (platform_drv_probe+0x48/0x94)
> [<c04408b4>] (platform_drv_probe) from [<c043ef0c>] (really_probe+0x1f0/0x2b8)
> [<c043ef0c>] (really_probe) from [<c043f354>] (driver_probe_device+0x140/0x15c)
> [<c043f354>] (driver_probe_device) from [<c043f4e0>]
> (device_driver_attach+0x44/0x5c)
> [<c043f4e0>] (device_driver_attach) from [<c043f5a4>]
> (__driver_attach+0xac/0xb4)
> [<c043f5a4>] (__driver_attach) from [<c043d6c4>] (bus_for_each_dev+0x64/0xa0)
> [<c043d6c4>] (bus_for_each_dev) from [<c043ddf4>] (bus_add_driver+0x148/0x1a8)
> [<c043ddf4>] (bus_add_driver) from [<c043ffc0>] (driver_register+0xac/0xf0)
> [<c043ffc0>] (driver_register) from [<c0b01050>] (do_one_initcall+0xa8/0x1d4)
> [<c0b01050>] (do_one_initcall) from [<c0b013ec>]
> (kernel_init_freeable+0x270/0x2cc)
> [<c0b013ec>] (kernel_init_freeable) from [<c074a3d8>] (kernel_init+0x8/0x10c)
> [<c074a3d8>] (kernel_init) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
