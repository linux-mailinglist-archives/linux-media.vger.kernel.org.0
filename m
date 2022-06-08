Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 828E0543095
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 14:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239316AbiFHMgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 08:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239222AbiFHMgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 08:36:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3FA1B9A48
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 05:36:33 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u23so33043886lfc.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/LdWDWdRoOk0cE/d/55wUE4sguHEBk5WdYZtIA6mO60=;
        b=ncjCbenm2QRZINItHJM/uOwt0TyPUA74Y2IcJ4gv3TEH/elraHL2TiJilLR0brqhFN
         xF+hVTUJ0BUtzjDY2VeVuiNSKl0XLX5OImCtuY3RcAXYqskFxta26COn8cNK2tewDMn6
         HxhDqFBsHUNZGAf/cPRFygN9q00NOYnP/lJp6Fxh6l6vg9C6vao3KXmEwQGnRV/GC215
         N5l3RWHHlxVDRse47aqPbJjVaoFDoK00oDmL6qCQWuAQHZk64hi1vc7TY5Uy43Clb5B6
         8mIhDHvBLTmdxcKoj6AQkSoo4EIm4dHyxQpF+ZC9HqCd1kVkfRqGjdmN5SMREntTCPLZ
         HK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/LdWDWdRoOk0cE/d/55wUE4sguHEBk5WdYZtIA6mO60=;
        b=3vnqHTi5jZABgSBmSaQGfGMCr4sMW0H9r7Qbk2sN7WtY0Zt/JiTKZ6Zf5a5umXaS+P
         zU3fTegUDeIqx4PBnGeLhqbe8rJxQe9koGl5yM9c4w9Emgd7/aQWsG4td6dcV7yXZmhH
         OxX+qgaRQEsed6Wp8zg+2ErQnlz5b3yHk85qNtGQGQxT8ljrcy66r/6iQ7MA6P26JnAv
         hYMg9APKhIheur5MqhIIHB9c0DAD7ik28uPjGiVXhVLS4VQlRzVRd+iXDkw/1NhLa3UP
         MXJ0xNQ5CjOw7xzecdzC2/zGqZwDiHXNCxBD5LdfP0F9/9Y/c1FJ5QAbtcw2bvMBDgqH
         Wmiw==
X-Gm-Message-State: AOAM530qQ4KIz584Yz8KCUlCAMST9g3KNZwkcvst7ZKi/DZeJtgLPmCX
        fY3K7fFwNQqDAv9qosT6YfQ5zHBwoUjH5Q==
X-Google-Smtp-Source: ABdhPJwV74EzmSXjjiDSet9dMmtul8TB5G2AKrFerpSOr5LZGxTUJMoVREXNT5Fkx8LYjglWS778yQ==
X-Received: by 2002:a05:6512:a95:b0:479:2b1e:25c3 with SMTP id m21-20020a0565120a9500b004792b1e25c3mr13614646lfu.655.1654691791420;
        Wed, 08 Jun 2022 05:36:31 -0700 (PDT)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id e26-20020ac2547a000000b004791f9ea46esm2162247lfn.231.2022.06.08.05.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:36:30 -0700 (PDT)
Date:   Wed, 8 Jun 2022 14:36:29 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] media: rcar-{csi2,vin}: Move to full Virtual
 Channel routing per CSI-2 IP
Message-ID: <YqCXzX+rpFb5V03n@oden.dyn.berto.se>
References: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se>
 <20220124124858.571363-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUvtGKnL=bzty4wYoCJ3vqm0PYunJV1jwyYUwB84mQusQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUvtGKnL=bzty4wYoCJ3vqm0PYunJV1jwyYUwB84mQusQ@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URI_HEX autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for your bug report.

The issue looks to be related to the nested V4L2 async notifiers. I 
tried to recreate the DT setup on M3-N but failed to trigger the issue.  
I will try to get hold of an Ebisu board and try to trigger the issue 
and get back to you.

On 2022-06-08 12:16:48 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, Jan 24, 2022 at 8:13 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
> > routing was centred around the CHSEL register which multiplexes the
> > different parallel buses that sit between the CSI-2 receivers source
> > side and the VIN dma engines. This was a bad design as the multiplexing
> > do allow for only a few combinations and do not play nice with many
> > video streams in the system.
> >
> > For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
> > given CSI-2 receiver to be used together with the scaler.
> >
> > Later datasheets have expanded the documentation and it is now possible
> > to improve on this design by allowing any Virtual Channel to be routed
> > to any R-Car VIN instance, provided that there exists a parallel bus
> > between them. This increases the flexibility as all Virtual Channels can
> > now be used together with the scaler for example.
> >
> > The redesign is not however perfect. While the new design allows for
> > many more routes, two constrains limit a small portion of routes that
> > was possible in the old design but are no more.
> >
> > - It is no longer possible to route the same CSI-2 and VC to more then
> >   one VIN at a time. This was theoretically possible before if the
> >   specific SoC allowed for the same CSI-2 and VC to be routed to two
> >   different VIN capture groups.
> >
> > - It is no longer possible to simultaneously mix links from two CSI-2 IP
> >   blocks to the same VIN capture group.
> >
> >   For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
> >   capture from CSI40. While VIN{4,5,6,7} is still free to capture from
> >   any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
> >   are disabled that VIN capture group is free again to capture from any
> >   other CSI-2 IP it is connected to.
> >
> > At the core of the redesign is greater cooperator of the R-Car VIN and
> > CSI-2 drivers in configuring the routing. The VIN driver is after this
> > change only responsible to configure the full VIN capture groups
> > parallel buses to be to a particular CSI-2 IP. While the configuration
> > of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
> > IP output ports is handled by the CSI-2 driver.
> >
> > Before this change the CSI-2 Virtual Channel to output port was static
> > in the CSI-2 driver and the different links only manipulated the VIN
> > capture groups CHSEL register. With this change both the CHSEl register
> > and the CSI-2 routing VCDT registers are modified for greater
> > flexibility.
> >
> > This change touches both the R-Car VIN and R-Car CSI-2 drivers in the
> > same commit as both drivers cooperate closely and one change without the
> > other would more or less break video capture.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Thanks for your patch, which is now commit 3e52419ec04f9769 ("media:
> rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP")
> in v5.18-rc1.
> 
> This patch causes, depending on probe order, either one of the two
> failures below (with some debug info added) on Ebisu-4D (but not
> on Salvator-X(S)):
> 
>   1. rcar-vin: probe of e6ef5000.video failed with error -22
> 
>      Probing e6500000.i2c
>      Probing adv748x
>        adv748x 0-0070: Endpoint
> /soc/i2c@e6500000/video-receiver@70/ports/port@7/endpoint on port 7
>        adv748x 0-0070: Endpoint
> /soc/i2c@e6500000/video-receiver@70/ports/port@8/endpoint on port 8
>        adv748x 0-0070: Endpoint
> /soc/i2c@e6500000/video-receiver@70/ports/port@a/endpoint on port 10
>      Probing feaa0000.csi2
>        Probing e6ef4000.video
>          rcar-csi2 feaa0000.csi2: Consider updating driver rcar-csi2
> to match on endpoints
>          rcar-vin e6ef4000.video: Device registered as video0
>        Probing e6ef5000.video
>          rcar-vin e6ef5000.video: Device registered as video1
>          rcar-vin e6ef4000.video: Removing video0
>          rcar-vin e6ef5000.video: Removing video1
>          rcar-vin e6ef5000.video: Notifier registration failed
>          rcar-vin e6ef5000.video: rcar_vin_probe: rvin_csi2_init()
> returned -EINVAL
>          rcar-vin: probe of e6ef5000.video failed with error -22
> 
>      This is seen with v5.18-rc1 and later, but somehow I never noticed before.
> 
>   2. rcar-csi2: probe of feaa0000.csi2 failed with error -22
> 
>      Probing e6500000.i2c
>      Probing adv748x
>        adv748x 0-0070: Endpoint
> /soc/i2c@e6500000/video-receiver@70/ports/port@7/endpoint on port 7
>        adv748x 0-0070: Endpoint
> /soc/i2c@e6500000/video-receiver@70/ports/port@8/endpoint on port 8
>        adv748x 0-0070: Endpoint
> /soc/i2c@e6500000/video-receiver@70/ports/port@a/endpoint on port 10
>      Probing feaa0000.csi2
>        rcar-csi2 feaa0000.csi2: Consider updating driver rcar-csi2 to
> match on endpoints
>          Probing e6ef4000
>            rcar-vin e6ef4000.video: Device registered as video0
>          Probing e6ef5000
>            rcar-vin e6ef5000.video: Device registered as video1
>        rcar-vin e6ef4000.video: Removing video0
>        rcar-vin e6ef5000.video: Removing video1
>        rcar-csi2 feaa0000.csi2: rcsi2_probe:
> v4l2_async_register_subdev() returned -EINVAL
>        rcar-csi2: probe of feaa0000.csi2 failed with error -22
> 
>      This is seen with[1], and did draw my attention, as it causes
>      a big splat later:
> 
>          [  OK  ] Started D-Bus System Message Bus.
>          Unable to handle kernel NULL pointer dereference at virtual
> address 0000000000000000
>          Unable to handle kernel NULL pointer dereference at virtual
> address 0000000000000000
>          Mem abort info:
>            ESR = 0x0000000096000004
>          Mem abort info:
>            ESR = 0x0000000096000004
>            EC = 0x25: DABT (current EL), IL = 32 bits
>            SET = 0, FnV = 0
>            EC = 0x25: DABT (current EL), IL = 32 bits
>            EA = 0, S1PTW = 0
>            FSC = 0x04: level 0 translation fault
>            SET = 0, FnV = 0
>          Data abort info:
>            ISV = 0, ISS = 0x00000004
>            EA = 0, S1PTW = 0
>            FSC = 0x04: level 0 translation fault
>            CM = 0, WnR = 0
>          user pgtable: 4k pages, 48-bit VAs, pgdp=000000004ec45000
>          [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
>          Data abort info:
>          Internal error: Oops: 96000004 [#1] PREEMPT SMP
>          CPU: 0 PID: 374 Comm: v4l_id Tainted: G        W
> 5.19.0-rc1-arm64-renesas-00799-gc13c3e49e8bd #1660
>            ISV = 0, ISS = 0x00000004
>          Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
>          pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>            CM = 0, WnR = 0
>          pc : subdev_open+0x8c/0x128
>          lr : subdev_open+0x78/0x128
>          sp : ffff80000aadba60
>          x29: ffff80000aadba60 x28: 0000000000000000 x27: ffff80000aadbc58
>          x26: 0000000000020000 x25: ffff00000b3aaf00 x24: 0000000000000000
>          x23: ffff00000c331c00 x22: ffff000009aa61b8 x21: ffff000009aa6000
>          x20: ffff000008bae3e8 x19: ffff00000c3fe200 x18: 0000000000000000
>          x17: ffff800076945000 x16: ffff800008004000 x15: 00008cc6bf550c7c
>          x14: 000000000000038f x13: 000000000000001a x12: ffff00007fba8618
>          x11: 0000000000000001 x10: 0000000000000000 x9 : ffff800009253954
>          x8 : ffff00000b3aaf00 x7 : 0000000000000004 x6 : 000000000000001a
>          x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000001
>          x2 : 0000000100000001 x1 : 0000000000000000 x0 : 0000000000000000
>          Call trace:
>           subdev_open+0x8c/0x128
>           v4l2_open+0xa4/0x120
>           chrdev_open+0x78/0x178
>           do_dentry_open+0xfc/0x398
>           vfs_open+0x28/0x30
>           path_openat+0x584/0x9c8
>           do_filp_open+0x80/0x108
>           do_sys_openat2+0x20c/0x2d8
>           user pgtable: 4k pages, 48-bit VAs, pgdp=000000004ec53000
>           do_sys_open+0x54/0xa0
>           __arm64_sys_openat+0x20/0x28
>           invoke_syscall+0x40/0xf8
>           el0_svc_common.constprop.0+0xf0/0x110
>           do_el0_svc+0x20/0x78
>           el0_svc+0x48/0xd0
>           el0t_64_sync_handler+0xb0/0xb8
>           el0t_64_sync+0x148/0x14c
>          Code: f9405280 f9400400 b40000e0 f9400280 (f9400000)
>          ---[ end trace 0000000000000000 ]---
> 
>      Adding debug prints to subdev_open() shows the opened files are
>      v4l-subdev1 and v4l-subdev2, which correspond to subdevs on
>      /soc/e6500000.i2c/i2c-0/0-0070.
> 
> Reverting this commit fixes the issue.
> 
> [1] "[PATCH v2 0/9] deferred_probe_timeout logic clean up"
>     https://lore.kernel.org/r/20220601070707.3946847-1-saravanak@google.com
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
Kind Regards,
Niklas Söderlund
