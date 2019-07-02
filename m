Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 292E95CEA4
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 13:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfGBLm5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 2 Jul 2019 07:42:57 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43702 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfGBLm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 07:42:57 -0400
Received: by mail-oi1-f193.google.com with SMTP id w79so12774096oif.10;
        Tue, 02 Jul 2019 04:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bJI15M1lNesTntAXAM/ozuP5Ee6t6JIQ8B0NTdr6ieE=;
        b=F/47u6PNIvhi3tgS3HK/OL68Q2MBHqoMxnznh+IWgIJf+ZIIKZx+1qc26l7T/5G7h5
         gX84lencspLBchtCvCq428QVRDe1LTeaYPrQqku8dWIwd637//wfwXBC8vsGjPjjxycx
         t6q6GscMil0Hso7qrXUfQMjSh2K5TIgtowXvprOv3Sf7hwMvo0h9fWLd7oZ4BUDE1FJR
         FWFBdKhJfHUk+BTcj/Wc0cqTT4jwpDbuMdJf+BIZzGFs2bEXzwi0HpSUwkJKWHkUFfUo
         x+HF6/+XdvIeTuO4FPWo4sAYbJX2uVZewCFa6H6MsAekNpf5TtBG37GGGbULJUKRLrwI
         b1Tw==
X-Gm-Message-State: APjAAAWv1wJmbQP3+sdomr8Z/pL4TGgPF5+oXrbYyq96llaqrfRKH+I7
        ZnslErYLTs7l4NHGPg1NZhm/ppael4jTsgT+k/ZdBQZT
X-Google-Smtp-Source: APXvYqwVEMx9Aretqzhmk+0YjG/If+fC6Y/QIzL8ZEUbzPTZtc+nWGFqjYfu6sgkbi8BsyCEtl+BLZP3XjW9Lbe8jnA=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr2510723oif.148.1562067776280;
 Tue, 02 Jul 2019 04:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190702012458.31828-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190702012458.31828-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Jul 2019 13:42:44 +0200
Message-ID: <CAMuHMdUtVmmRNJCWnYHcNkxBCkV4xvbUBCNzhvxYuj4Vyx5Nsw@mail.gmail.com>
Subject: Re: [PATCH] rcar-vin: Clean up correct notifier in error path
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Jul 2, 2019 at 3:25 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When adding the v4l2_async_notifier_cleanup() callas the wrong notifier
> was cleaned up if the parallel notifier registration failed. Fix this by
> cleaning up the correct one.
>
> Fixes: 9863bc8695bc36e3 ("media: rcar-vin: Cleanup notifier in error path")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thank you, this fixes the following boot regression on koelsch:

Unable to handle kernel NULL pointer dereference at virtual address 000001d8
pgd = (ptrval)
[000001d8] *pgd=00000000
Internal error: Oops: 5 [#1] SMP ARM
CPU: 1 PID: 1 Comm: swapper/0 Not tainted
5.2.0-rc7-shmobile-07178-g1a639e48dea73e76 #280
Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
PC is at __v4l2_async_notifier_cleanup+0xc/0x70
LR is at v4l2_async_notifier_cleanup+0x1c/0x2c
pc : [<c0556580>]    lr : [<c0556c78>]    psr: 20000013
sp : eb08ddc8  ip : 00000000  fp : 00000018
r10: 00000000  r9 : eb1a5410  r8 : c0c04c08
r7 : eb1a5400  r6 : ffffffea  r5 : 000001c8  r4 : c0c61854
r3 : eb08b740  r2 : 00000000  r1 : 00000000  r0 : 000001c8
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 4000406a  DAC: 00000051
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xeb08ddc8 to 0xeb08e000)
ddc0:                   c0c61854 000001c8 ffffffea eb1a5400 c0c04c08 c0556c78
dde0: ea940040 ffffffea ffffffea c057661c c0575c9c c0ff7148 00000001 0286d9e6
de00: 00000000 eb1a5410 00000000 c0c637bc c0cbe13c 00000000 c0c637bc 00000000
de20: 00000018 c04408b4 eb1a5410 00000000 c0cbe24c c043ef0c eb1a5410 c0c637bc
de40: c0c637bc c043f4f8 00000000 c0b54844 c0b6f4b0 c043f354 c0c637bc eb1a5410
de60: 00000000 00000000 eb1a5410 c0c637bc c043f4f8 00000000 c0b54844 c043f4e0
de80: 00000000 eb1a5410 c0c637bc c043f5a4 eb1a5410 c0c04c08 c0c637bc c043d6c4
dea0: c0b6f4b0 eb150f58 eb1aefb4 0286d9e6 00000000 c0c637bc ea956f80 00000000
dec0: c0c51c50 c043ddf4 c09c6620 c09c6621 00000072 c0c637bc c0c7c840 c0c04c08
dee0: c0b34c88 c043ffc0 ffffe000 c0c7c840 c0c04c08 c0b01050 00000000 c09fa420
df00: 00000000 c013ad00 00000000 c0b0078c c09f93a4 000000d4 00000006 00000006
df20: 00000000 c09fa434 000000d3 c09fa434 c0b54820 ebfffbe9 ebfffbf1 0286d9e6
df40: 00000000 0286d9e6 c0c7c840 00000007 c0c7c840 c0c83f00 c0b5483c c0c83f00
df60: c0b54844 c0b013ec 00000006 00000006 00000000 c0b0078c c074a3d0 000000d4
df80: 00000000 00000000 c074a3d0 00000000 00000000 00000000 00000000 00000000
dfa0: 00000000 c074a3d8 00000000 c01010e8 00000000 00000000 00000000 00000000
dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[<c0556580>] (__v4l2_async_notifier_cleanup) from [<c0556c78>]
(v4l2_async_notifier_cleanup+0x1c/0x2c)
[<c0556c78>] (v4l2_async_notifier_cleanup) from [<c057661c>]
(rcar_vin_probe+0x4f8/0x5a4)
[<c057661c>] (rcar_vin_probe) from [<c04408b4>] (platform_drv_probe+0x48/0x94)
[<c04408b4>] (platform_drv_probe) from [<c043ef0c>] (really_probe+0x1f0/0x2b8)
[<c043ef0c>] (really_probe) from [<c043f354>] (driver_probe_device+0x140/0x15c)
[<c043f354>] (driver_probe_device) from [<c043f4e0>]
(device_driver_attach+0x44/0x5c)
[<c043f4e0>] (device_driver_attach) from [<c043f5a4>]
(__driver_attach+0xac/0xb4)
[<c043f5a4>] (__driver_attach) from [<c043d6c4>] (bus_for_each_dev+0x64/0xa0)
[<c043d6c4>] (bus_for_each_dev) from [<c043ddf4>] (bus_add_driver+0x148/0x1a8)
[<c043ddf4>] (bus_add_driver) from [<c043ffc0>] (driver_register+0xac/0xf0)
[<c043ffc0>] (driver_register) from [<c0b01050>] (do_one_initcall+0xa8/0x1d4)
[<c0b01050>] (do_one_initcall) from [<c0b013ec>]
(kernel_init_freeable+0x270/0x2cc)
[<c0b013ec>] (kernel_init_freeable) from [<c074a3d8>] (kernel_init+0x8/0x10c)
[<c074a3d8>] (kernel_init) from [<c01010e8>] (ret_from_fork+0x14/0x2c)

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
