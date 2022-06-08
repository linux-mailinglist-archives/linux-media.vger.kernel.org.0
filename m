Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6864B542D9C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 12:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236569AbiFHK2K convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 8 Jun 2022 06:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbiFHK1k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 06:27:40 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DD4FC836;
        Wed,  8 Jun 2022 03:17:01 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id i19so14132190qvu.13;
        Wed, 08 Jun 2022 03:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7RY3tqteIBx/wEp16WxUeRFbGQghh41I15j3qCfl9Ng=;
        b=azJ/m3Ac8a/l3dJ9rKBrCqujYOfmMWFgGoUvI1eJcSWhFt+umWa/z0U3yiZo9tiQfe
         jlSfD6CtxOozvOz3BmXJT7KomFWfm7dif9WQmFGEdcCcPH5+MXd24joktOFaBddVk1Yi
         uyXZkdJgGpHZbgxJjGiz6jq7f//ce4QRMX7+3HXlNd0BmOHkZs1mJ6kohVXfr9rJvTM1
         SS53IQ7cHiti63tNh79WpwcpkUrWGJXyL9cxxJ9wxCibWQmgxn2Dmyg7Wg0XOBgelUEi
         S8mS/ZZ0UNZ0+d1nW5CdPprv4S3ohf4Ce1HifBXl09wXeYWO2RQk9usYHhGZDeTFi224
         RW9Q==
X-Gm-Message-State: AOAM5338XnID1miNL8Ps4QZ86L4niboA0BXPmaXy/d6CcGlfztG1HGRj
        AMA6V/XadnpxeiZXooDeMfXSuPvi17nX/w==
X-Google-Smtp-Source: ABdhPJzYeKkvl1ypiLISIP8RluIZUZ2bSUL/+GGAj9iEg+vTkXKpeg66SdM7tYMOJFUqTaFVu9Gd4w==
X-Received: by 2002:a05:6214:628:b0:46b:188b:b8ac with SMTP id a8-20020a056214062800b0046b188bb8acmr14717570qvx.28.1654683420004;
        Wed, 08 Jun 2022 03:17:00 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id h2-20020a05620a244200b006a6d3fa430csm4701615qkn.58.2022.06.08.03.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 03:16:59 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id i39so7681310ybj.9;
        Wed, 08 Jun 2022 03:16:59 -0700 (PDT)
X-Received: by 2002:a25:d748:0:b0:65c:6b00:55af with SMTP id
 o69-20020a25d748000000b0065c6b0055afmr33184713ybg.365.1654683419337; Wed, 08
 Jun 2022 03:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se> <20220124124858.571363-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20220124124858.571363-4-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jun 2022 12:16:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvtGKnL=bzty4wYoCJ3vqm0PYunJV1jwyYUwB84mQusQ@mail.gmail.com>
Message-ID: <CAMuHMdUvtGKnL=bzty4wYoCJ3vqm0PYunJV1jwyYUwB84mQusQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: rcar-{csi2,vin}: Move to full Virtual
 Channel routing per CSI-2 IP
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URI_HEX autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Jan 24, 2022 at 8:13 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
> routing was centred around the CHSEL register which multiplexes the
> different parallel buses that sit between the CSI-2 receivers source
> side and the VIN dma engines. This was a bad design as the multiplexing
> do allow for only a few combinations and do not play nice with many
> video streams in the system.
>
> For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
> given CSI-2 receiver to be used together with the scaler.
>
> Later datasheets have expanded the documentation and it is now possible
> to improve on this design by allowing any Virtual Channel to be routed
> to any R-Car VIN instance, provided that there exists a parallel bus
> between them. This increases the flexibility as all Virtual Channels can
> now be used together with the scaler for example.
>
> The redesign is not however perfect. While the new design allows for
> many more routes, two constrains limit a small portion of routes that
> was possible in the old design but are no more.
>
> - It is no longer possible to route the same CSI-2 and VC to more then
>   one VIN at a time. This was theoretically possible before if the
>   specific SoC allowed for the same CSI-2 and VC to be routed to two
>   different VIN capture groups.
>
> - It is no longer possible to simultaneously mix links from two CSI-2 IP
>   blocks to the same VIN capture group.
>
>   For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
>   capture from CSI40. While VIN{4,5,6,7} is still free to capture from
>   any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
>   are disabled that VIN capture group is free again to capture from any
>   other CSI-2 IP it is connected to.
>
> At the core of the redesign is greater cooperator of the R-Car VIN and
> CSI-2 drivers in configuring the routing. The VIN driver is after this
> change only responsible to configure the full VIN capture groups
> parallel buses to be to a particular CSI-2 IP. While the configuration
> of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
> IP output ports is handled by the CSI-2 driver.
>
> Before this change the CSI-2 Virtual Channel to output port was static
> in the CSI-2 driver and the different links only manipulated the VIN
> capture groups CHSEL register. With this change both the CHSEl register
> and the CSI-2 routing VCDT registers are modified for greater
> flexibility.
>
> This change touches both the R-Car VIN and R-Car CSI-2 drivers in the
> same commit as both drivers cooperate closely and one change without the
> other would more or less break video capture.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch, which is now commit 3e52419ec04f9769 ("media:
rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP")
in v5.18-rc1.

This patch causes, depending on probe order, either one of the two
failures below (with some debug info added) on Ebisu-4D (but not
on Salvator-X(S)):

  1. rcar-vin: probe of e6ef5000.video failed with error -22

     Probing e6500000.i2c
     Probing adv748x
       adv748x 0-0070: Endpoint
/soc/i2c@e6500000/video-receiver@70/ports/port@7/endpoint on port 7
       adv748x 0-0070: Endpoint
/soc/i2c@e6500000/video-receiver@70/ports/port@8/endpoint on port 8
       adv748x 0-0070: Endpoint
/soc/i2c@e6500000/video-receiver@70/ports/port@a/endpoint on port 10
     Probing feaa0000.csi2
       Probing e6ef4000.video
         rcar-csi2 feaa0000.csi2: Consider updating driver rcar-csi2
to match on endpoints
         rcar-vin e6ef4000.video: Device registered as video0
       Probing e6ef5000.video
         rcar-vin e6ef5000.video: Device registered as video1
         rcar-vin e6ef4000.video: Removing video0
         rcar-vin e6ef5000.video: Removing video1
         rcar-vin e6ef5000.video: Notifier registration failed
         rcar-vin e6ef5000.video: rcar_vin_probe: rvin_csi2_init()
returned -EINVAL
         rcar-vin: probe of e6ef5000.video failed with error -22

     This is seen with v5.18-rc1 and later, but somehow I never noticed before.

  2. rcar-csi2: probe of feaa0000.csi2 failed with error -22

     Probing e6500000.i2c
     Probing adv748x
       adv748x 0-0070: Endpoint
/soc/i2c@e6500000/video-receiver@70/ports/port@7/endpoint on port 7
       adv748x 0-0070: Endpoint
/soc/i2c@e6500000/video-receiver@70/ports/port@8/endpoint on port 8
       adv748x 0-0070: Endpoint
/soc/i2c@e6500000/video-receiver@70/ports/port@a/endpoint on port 10
     Probing feaa0000.csi2
       rcar-csi2 feaa0000.csi2: Consider updating driver rcar-csi2 to
match on endpoints
         Probing e6ef4000
           rcar-vin e6ef4000.video: Device registered as video0
         Probing e6ef5000
           rcar-vin e6ef5000.video: Device registered as video1
       rcar-vin e6ef4000.video: Removing video0
       rcar-vin e6ef5000.video: Removing video1
       rcar-csi2 feaa0000.csi2: rcsi2_probe:
v4l2_async_register_subdev() returned -EINVAL
       rcar-csi2: probe of feaa0000.csi2 failed with error -22

     This is seen with[1], and did draw my attention, as it causes
     a big splat later:

         [  OK  ] Started D-Bus System Message Bus.
         Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000000
         Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000000
         Mem abort info:
           ESR = 0x0000000096000004
         Mem abort info:
           ESR = 0x0000000096000004
           EC = 0x25: DABT (current EL), IL = 32 bits
           SET = 0, FnV = 0
           EC = 0x25: DABT (current EL), IL = 32 bits
           EA = 0, S1PTW = 0
           FSC = 0x04: level 0 translation fault
           SET = 0, FnV = 0
         Data abort info:
           ISV = 0, ISS = 0x00000004
           EA = 0, S1PTW = 0
           FSC = 0x04: level 0 translation fault
           CM = 0, WnR = 0
         user pgtable: 4k pages, 48-bit VAs, pgdp=000000004ec45000
         [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
         Data abort info:
         Internal error: Oops: 96000004 [#1] PREEMPT SMP
         CPU: 0 PID: 374 Comm: v4l_id Tainted: G        W
5.19.0-rc1-arm64-renesas-00799-gc13c3e49e8bd #1660
           ISV = 0, ISS = 0x00000004
         Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
         pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
           CM = 0, WnR = 0
         pc : subdev_open+0x8c/0x128
         lr : subdev_open+0x78/0x128
         sp : ffff80000aadba60
         x29: ffff80000aadba60 x28: 0000000000000000 x27: ffff80000aadbc58
         x26: 0000000000020000 x25: ffff00000b3aaf00 x24: 0000000000000000
         x23: ffff00000c331c00 x22: ffff000009aa61b8 x21: ffff000009aa6000
         x20: ffff000008bae3e8 x19: ffff00000c3fe200 x18: 0000000000000000
         x17: ffff800076945000 x16: ffff800008004000 x15: 00008cc6bf550c7c
         x14: 000000000000038f x13: 000000000000001a x12: ffff00007fba8618
         x11: 0000000000000001 x10: 0000000000000000 x9 : ffff800009253954
         x8 : ffff00000b3aaf00 x7 : 0000000000000004 x6 : 000000000000001a
         x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000001
         x2 : 0000000100000001 x1 : 0000000000000000 x0 : 0000000000000000
         Call trace:
          subdev_open+0x8c/0x128
          v4l2_open+0xa4/0x120
          chrdev_open+0x78/0x178
          do_dentry_open+0xfc/0x398
          vfs_open+0x28/0x30
          path_openat+0x584/0x9c8
          do_filp_open+0x80/0x108
          do_sys_openat2+0x20c/0x2d8
          user pgtable: 4k pages, 48-bit VAs, pgdp=000000004ec53000
          do_sys_open+0x54/0xa0
          __arm64_sys_openat+0x20/0x28
          invoke_syscall+0x40/0xf8
          el0_svc_common.constprop.0+0xf0/0x110
          do_el0_svc+0x20/0x78
          el0_svc+0x48/0xd0
          el0t_64_sync_handler+0xb0/0xb8
          el0t_64_sync+0x148/0x14c
         Code: f9405280 f9400400 b40000e0 f9400280 (f9400000)
         ---[ end trace 0000000000000000 ]---

     Adding debug prints to subdev_open() shows the opened files are
     v4l-subdev1 and v4l-subdev2, which correspond to subdevs on
     /soc/e6500000.i2c/i2c-0/0-0070.

Reverting this commit fixes the issue.

[1] "[PATCH v2 0/9] deferred_probe_timeout logic clean up"
    https://lore.kernel.org/r/20220601070707.3946847-1-saravanak@google.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
