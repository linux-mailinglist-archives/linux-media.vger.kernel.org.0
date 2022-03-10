Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D054D43A4
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 10:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240867AbiCJJmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 04:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbiCJJmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 04:42:33 -0500
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54EC43DA6C;
        Thu, 10 Mar 2022 01:41:32 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id 85so3919418qkm.9;
        Thu, 10 Mar 2022 01:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IQ8D/NDQm2RasjovckkbRSyRXzYNZRTM0Xf4GKyvmBc=;
        b=cF4bTmfeehH4zljYEfpD0cUCWRscG218OX9pBToqQ1W0IOL54jfXyjqZI546tyoi+s
         zaPbopufe27oiCR/gqaY0o3AtEAWFt9eQUwACIB+LOAd+i8dIyKk5Yk5TOnIJC2dzTUB
         YdE7+/cJcmUpY/qzAs+QK35o0xIKM4PwMuw4LZJBaEhYQV2BYyFA7EbWQhUb9IyX7YI9
         3YFUJCvhcbNQpVAL8VW24krdUWNo9MPDcLdv90SwNcMpu1bxScR92vPHoFQErrTU3Qmp
         BQA0NXFPS2kasnFm29rxcOFglqMejc80UItAAnB/Wg7KNK/ULaTx7DKBz1zsViMZoEoN
         sVCw==
X-Gm-Message-State: AOAM530CR/H2iH46+trb/J9/bYPBqHqmlCy4+xUabnPM7ObpvpUgtn9/
        Tdl4mcrBqUqOSkGcuElVaiyKSd0h8JcYEg==
X-Google-Smtp-Source: ABdhPJwDIRCQD3N0ZjkSL5aW35lvhvxoBr5jslZ9croX+NzhaMU19eSacIbpU9w6tWWRdeD4iY4PlA==
X-Received: by 2002:a37:b443:0:b0:649:1d8f:cc37 with SMTP id d64-20020a37b443000000b006491d8fcc37mr2372489qkf.539.1646905290812;
        Thu, 10 Mar 2022 01:41:30 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 145-20020a370897000000b0067b30c65415sm2093820qki.75.2022.03.10.01.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 01:41:30 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id l2so9735295ybe.8;
        Thu, 10 Mar 2022 01:41:30 -0800 (PST)
X-Received: by 2002:a25:bc8f:0:b0:628:8649:5c4b with SMTP id
 e15-20020a25bc8f000000b0062886495c4bmr3049304ybk.207.1646905289891; Thu, 10
 Mar 2022 01:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com> <20220309194521.7028-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220309194521.7028-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Mar 2022 10:41:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8kuqD31n8wkkuu_UFc6aMnr3LrfD4rNboxO6wJqcF4Q@mail.gmail.com>
Message-ID: <CAMuHMdV8kuqD31n8wkkuu_UFc6aMnr3LrfD4rNboxO6wJqcF4Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

On Wed, Mar 9, 2022 at 8:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The RZ/G2L VSPD provides a single VSPD instance. It has the following
> sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
>
> The VSPD block on RZ/G2L does not have a version register, so added a
> new compatible string "renesas,vsp2-rzg2l" with a data pointer containing
> the info structure. Also the reset line is shared with the DU module
> so devm_reset_control_get_shared() call is used in case of RZ/G2L.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v1:
>  * Used data pointer containing info structure to retrieve version information
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/

Thanks for the update!

> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c

> @@ -841,7 +849,14 @@ static int vsp1_probe(struct platform_device *pdev)
>         if (irq < 0)
>                 return irq;
>
> -       vsp1->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +       vsp1->info = of_device_get_match_data(&pdev->dev);
> +       if (vsp1->info) {
> +               vsp1->version = vsp1->info->version;
> +               vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
> +       } else {
> +               vsp1->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);

Making the reset control shared or exclusive dependent on the presence
of match data looks fragile to me.  I think you want to check the IP
version instead (ideally, the SoC, as this is an integration feature).
Or just make it shared unconditionally (in the previous patch)?

> +       }
> +
>         if (IS_ERR(vsp1->rstc))
>                 return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
>                                      "failed to get reset ctrl\n");
> @@ -874,13 +889,15 @@ static int vsp1_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto done;
>
> -       vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> +       if (!vsp1->info) {
> +               vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
>
> -       for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> -               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> -                   vsp1_device_infos[i].version) {
> -                       vsp1->info = &vsp1_device_infos[i];
> -                       break;
> +               for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> +                       if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> +                           vsp1_device_infos[i].version) {
> +                               vsp1->info = &vsp1_device_infos[i];
> +                               break;
> +                       }
>                 }
>         }
>
> @@ -943,6 +960,7 @@ static int vsp1_remove(struct platform_device *pdev)
>  static const struct of_device_id vsp1_of_match[] = {
>         { .compatible = "renesas,vsp1" },
>         { .compatible = "renesas,vsp2" },
> +       { .compatible = "renesas,vsp2-rzg2l", .data = &vsp1_device_infos[14] },
>         { },

Is VI6_IP_VERSION_MODEL_VSPD_RZG2L = 0x1b an official number?
If yes, it might make sense to change the compatible value to
"renesas,vsp2-0x1b".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
