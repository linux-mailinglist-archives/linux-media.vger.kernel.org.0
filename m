Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 062C251B8A4
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 09:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343693AbiEEH0z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 03:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbiEEH0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 03:26:53 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64374551D;
        Thu,  5 May 2022 00:23:14 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id hf18so2600407qtb.0;
        Thu, 05 May 2022 00:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eYcDk46TN6nQtTEcA5D5pYs+CgfowD70wBO1ZsW6mP8=;
        b=L5YkWRro6bHHIMO2DQyaPONTjmtw840QccTR/ymhRm+rNUTTbotKs/0DOPJMEDPJrN
         IW70dci0F0726gpu+p8o1v+8Qfu6cO6uj8ywmwieZASI7FlA0B0XJewxIydsW6HuBfO/
         DefmCDjEGro6eONFwVOelJlzB9jFFUwUkY5I7HtH/oLScgba1tX6DeTnIz2hiyErwFTJ
         2Lkoi8a1heFdbE0UfM566/hk1O1M6ohAbE98qelqoD5V+pYWTASawYE/qZA8F0DHC/PT
         uA4x+MRll03l+4tYCP0Qv7kQfMk8JHnJmC8bRYMKJrh9NBZ1JAu8xtfeQ52Pdi/vBevd
         42yA==
X-Gm-Message-State: AOAM533t16jQ5XpDFdeEtv8zRaKYh+nQOiqESdCnmBWJAjWP5scj4/o3
        Ys5PZjzzk3GXSe2z/BGiqcd0fOp9FcMqiA==
X-Google-Smtp-Source: ABdhPJyOZuEequcB5PiJHOlmJQogC11Tg7GcYThR8EwqrFR0Fa+kMufoO2PSj9ojQZ5XN0V0qyUGNQ==
X-Received: by 2002:a05:622a:6184:b0:2f1:e213:9c7 with SMTP id hh4-20020a05622a618400b002f1e21309c7mr22374595qtb.467.1651735393797;
        Thu, 05 May 2022 00:23:13 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id w27-20020ac84d1b000000b002f39b99f685sm452195qtv.31.2022.05.05.00.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 00:23:13 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id s30so6188191ybi.8;
        Thu, 05 May 2022 00:23:13 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr20419980yba.380.1651735392873; Thu, 05
 May 2022 00:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220504190609.94375-1-biju.das.jz@bp.renesas.com> <20220504190609.94375-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220504190609.94375-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 May 2022 09:23:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGkd=fqvj7Yue7Q6RhuhrgxCrB5BhV-6Q4F3evY1g=qQ@mail.gmail.com>
Message-ID: <CAMuHMdXGkd=fqvj7Yue7Q6RhuhrgxCrB5BhV-6Q4F3evY1g=qQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] media: renesas: vsp1: Add support to
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Wed, May 4, 2022 at 9:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As the resets DT property is mandatory, and is present in all .dtsi
> in mainline, add support to perform deassert/assert using reference
> counted reset handle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v9->v10:
>  * Moved {deassert,assert} calls to vsp1_pm_runtime_{resume,suspend}

Thanks for the update!

> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -631,13 +633,21 @@ static int __maybe_unused vsp1_pm_runtime_resume(struct device *dev)
>         struct vsp1_device *vsp1 = dev_get_drvdata(dev);
>         int ret;
>
> +       ret = reset_control_deassert(vsp1->rstc);
> +       if (ret < 0)
> +               return ret;
> +
>         if (vsp1->info) {
>                 ret = vsp1_device_init(vsp1);
>                 if (ret < 0)

Missing reset_control_assert().

>                         return ret;
>         }
>
> -       return rcar_fcp_enable(vsp1->fcp);
> +       ret = rcar_fcp_enable(vsp1->fcp);
> +       if (ret < 0)
> +               reset_control_assert(vsp1->rstc);
> +
> +       return ret;
>  }
>
>  static const struct dev_pm_ops vsp1_pm_ops = {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
