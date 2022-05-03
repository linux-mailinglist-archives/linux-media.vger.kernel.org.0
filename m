Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5402518807
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 17:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237856AbiECPPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 11:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236394AbiECPPR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 11:15:17 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B112A3A5D8;
        Tue,  3 May 2022 08:11:44 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id h3so9021417qtn.4;
        Tue, 03 May 2022 08:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dBlUIN4uArZEAw4XyiVN/Z56678UVaC7n0hqGZPfc3o=;
        b=bYWideQ6TsJO1gWz6VIspQRpK7ShjIgWeTUgUPvhHHyvsUUi5nuvEcpme7ezriSysv
         xYsK9AEKIz0RsnCpTWj+3S554YZLJ5D+8UZDSHzno+9BT3SrkTP2MltDuLUFalARv2Je
         QLhYhHtLDUXlH4SAy6LsuBw6rpqmjEb5iI6hRwyj1lLD8SMhXlep3DRPKcKo8fJXC09w
         OJPJoOdHvO29rUZun4HFkKp0Y7O6w65Qj5oTqmQa3xubo0fod3GNnVSCPb11/Y4gC4w/
         Z/ZgxvQnqWi0SBbtXmzIA2934mrgtgOmlyRVsZJhv4ZFm1v5mSTQ0dnGvL1KkjfRZIKu
         tucA==
X-Gm-Message-State: AOAM530BoeUxFRJhDJCGwUsvcOI4QcgT8W9BOeNa0ffO8gF2ImRsblF0
        uL8ZdGYN/8NokWQg4ZpQu8tTPNwh+Lj2WA==
X-Google-Smtp-Source: ABdhPJxr8oSTgqLoM/Yl5vA/NbUw6Wb2oRLdELoXV+xAFsNEUWUThkNkg0PZYJBAygOiHAKPH992JA==
X-Received: by 2002:ac8:5b83:0:b0:2f3:a2f4:fe85 with SMTP id a3-20020ac85b83000000b002f3a2f4fe85mr10020110qta.649.1651590703649;
        Tue, 03 May 2022 08:11:43 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id f24-20020a37ad18000000b0069fc13ce23esm5860107qkm.111.2022.05.03.08.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 08:11:43 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2f7d621d1caso182669197b3.11;
        Tue, 03 May 2022 08:11:43 -0700 (PDT)
X-Received: by 2002:a81:547:0:b0:2f8:6e8:19d7 with SMTP id 68-20020a810547000000b002f806e819d7mr15738822ywf.383.1651590702992;
 Tue, 03 May 2022 08:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220428065333.3108-1-biju.das.jz@bp.renesas.com> <20220428065333.3108-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220428065333.3108-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 May 2022 17:11:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBVGUsuiVdaG+y-+G2Wz3aiKovZsw1K_GvZ6Azgx_zFg@mail.gmail.com>
Message-ID: <CAMuHMdUBVGUsuiVdaG+y-+G2Wz3aiKovZsw1K_GvZ6Azgx_zFg@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Thu, Apr 28, 2022 at 8:53 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As the resets DT property is mandatory, and is present in all .dtsi
> in mainline, add support to perform deassert/assert using reference
> counted reset handle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch!

Unfortunately this patch causes a lock-up during boot on the Koelsch
development board.

Adding some debug code reveals that the VSP1 registers are accessed
while the reset is still asserted:

| WARNING: CPU: 0 PID: 1 at
drivers/media/platform/renesas/vsp1/vsp1.h:121 vsp1_read+0x48/0x74
| reset not deasserted
| CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
5.18.0-rc5-shmobile-04787-g175dd1b77531-dirty #1230
| Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
|  unwind_backtrace from show_stack+0x10/0x14
|  show_stack from dump_stack_lvl+0x40/0x4c
|  dump_stack_lvl from __warn+0xa0/0x124
|  __warn from warn_slowpath_fmt+0x78/0xb0
|  warn_slowpath_fmt from vsp1_read+0x48/0x74
|  vsp1_read from vsp1_reset_wpf+0x14/0x90
|  vsp1_reset_wpf from vsp1_pm_runtime_resume+0x3c/0x1c0
|  vsp1_pm_runtime_resume from genpd_runtime_resume+0xfc/0x1bc

vsp1_pm_runtime_resume() initializes the VSP1.

|  genpd_runtime_resume from __rpm_callback+0x3c/0x114
|  __rpm_callback from rpm_callback+0x50/0x54
|  rpm_callback from rpm_resume+0x3e4/0x47c
|  rpm_resume from __pm_runtime_resume+0x38/0x50
|  __pm_runtime_resume from __device_attach+0xbc/0x148
|  __device_attach from bus_probe_device+0x28/0x80

__device_attach() calls "pm_runtime_get_sync(dev->parent)",
bypassing vsp1_device_get().
Hence it wakes the parent, but does not deassert reset.

|  bus_probe_device from device_add+0x560/0x784
|  device_add from cdev_device_add+0x20/0x58
|  cdev_device_add from media_devnode_register+0x1b8/0x28c
|  media_devnode_register from __media_device_register+0xb0/0x198
|  __media_device_register from vsp1_probe+0xf74/0xfe0
|  vsp1_probe from platform_probe+0x58/0xa8
|  platform_probe from really_probe+0x138/0x29c
|  really_probe from __driver_probe_device+0xc4/0xd8
|  __driver_probe_device from driver_probe_device+0x40/0xc0
|  driver_probe_device from __driver_attach+0xd4/0xe8
|  __driver_attach from bus_for_each_dev+0x64/0xa8
|  bus_for_each_dev from bus_add_driver+0x148/0x1a8
|  bus_add_driver from driver_register+0xac/0xf0
|  driver_register from do_one_initcall+0x70/0x16c
|  do_one_initcall from kernel_init_freeable+0x1ac/0x1f8
|  kernel_init_freeable from kernel_init+0x14/0x12c
|  kernel_init from ret_from_fork+0x14/0x2c

> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c

> @@ -567,7 +568,17 @@ static void vsp1_mask_all_interrupts(struct vsp1_device *vsp1)
>   */
>  int vsp1_device_get(struct vsp1_device *vsp1)
>  {
> -       return pm_runtime_resume_and_get(vsp1->dev);
> +       int ret;
> +
> +       ret = reset_control_deassert(vsp1->rstc);
> +       if (ret < 0)
> +               return ret;

Perhaps you can move the deassertion of the reset to
vsp1_pm_runtime_resume(), so it is called automatically on every
resume?

> +
> +       ret = pm_runtime_resume_and_get(vsp1->dev);
> +       if (ret < 0)
> +               reset_control_assert(vsp1->rstc);
> +
> +       return ret;
>  }
>
>  /*
> @@ -579,6 +590,7 @@ int vsp1_device_get(struct vsp1_device *vsp1)
>  void vsp1_device_put(struct vsp1_device *vsp1)
>  {
>         pm_runtime_put_sync(vsp1->dev);
> +       reset_control_assert(vsp1->rstc);

Likewise, move to vsp1_pm_runtime_suspend()?

>  }
>
>  /* -----------------------------------------------------------------------------


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
