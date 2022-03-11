Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5F3E4D6057
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 12:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348175AbiCKLD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 06:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239577AbiCKLD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 06:03:57 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4BF1118;
        Fri, 11 Mar 2022 03:02:52 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id c4so7006206qtx.1;
        Fri, 11 Mar 2022 03:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dENfo9gO0b1pTsO4dzfVrH92BU65Hwt+u9hDhomrtzg=;
        b=jsvdgq+wxgCEND9wZJ9suYrVBgkniZnG5TRua64sE/n1be8ljFp44aRd9Vl606w8bm
         YUq7SDtRHTiS8EjsqAu1vOmUnATmZxtvnbwYOAqw54T3hRbPcAIWdmvq3dgolZWNGpRL
         gJL5w0etkdiLjGjsYgxpi3++ltPULtOoEnclXZgBlnu3b+vX/wFkCMKJUK5e1Qh5kveL
         o7k9R9JTWFhDGeeyDw0E7lodAJluy/hRbmOJf8YVgOQNSFHzk89z48nytiBp/tMNg0rt
         bW4IUZ3rtsKuKHdjWNMcbHEylvKTgaMx5gUJYzlcMBNchMzn+GsrdQ6ZVwPowyDzrCnC
         8vew==
X-Gm-Message-State: AOAM532khIAQjd9TDqn3gkJVkHgKEgNwz6axC8PwaN0qWyj9Xg6RA8G9
        GXlLRke6FgrxTrL6gEysgZxlAAETVMtFIA==
X-Google-Smtp-Source: ABdhPJw/prIQ5nVvU/TS7RQFThTAtU4PHYz44d8OVp79mMtfE0HMBh247243gwoNGsxsLxDNt2Zslw==
X-Received: by 2002:a05:622a:15ca:b0:2e1:a754:ffab with SMTP id d10-20020a05622a15ca00b002e1a754ffabmr7500809qty.486.1646996571547;
        Fri, 11 Mar 2022 03:02:51 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id t7-20020a05622a01c700b002e1b3555c2fsm2496463qtw.26.2022.03.11.03.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 03:02:51 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id g26so16386416ybj.10;
        Fri, 11 Mar 2022 03:02:50 -0800 (PST)
X-Received: by 2002:a25:bc8f:0:b0:628:8649:5c4b with SMTP id
 e15-20020a25bc8f000000b0062886495c4bmr7339485ybk.207.1646996569857; Fri, 11
 Mar 2022 03:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20220311103803.25239-1-biju.das.jz@bp.renesas.com> <20220311103803.25239-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220311103803.25239-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Mar 2022 12:02:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXR_8LzzK+S4S3WAbHbDTBcGj3T9U5jPUv84RifQCqC-A@mail.gmail.com>
Message-ID: <CAMuHMdXR_8LzzK+S4S3WAbHbDTBcGj3T9U5jPUv84RifQCqC-A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: vsp1: Add support for RZ/G2L VSPD
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

On Fri, Mar 11, 2022 at 11:38 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The RZ/G2L VSPD provides a single VSPD instance. It has the following
> sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
>
> The VSPD block on RZ/G2L does not have a version register, so added a
> new compatible string "renesas,rzg2l-vsp2" with a data pointer containing
> the info structure. Also the reset line is shared with the DU module.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Fixed version comparison in vsp1_lookup()

Thanks for the update!

> --- a/drivers/media/platform/vsp1/vsp1_lif.c
> +++ b/drivers/media/platform/vsp1/vsp1_lif.c
> @@ -130,13 +131,15 @@ static void lif_configure_stream(struct vsp1_entity *entity,
>                         VI6_LIF_CTRL_REQSEL | VI6_LIF_CTRL_LIF_EN);
>
>         /*
> -        * On R-Car V3M the LIF0 buffer attribute register has to be set to a
> -        * non-default value to guarantee proper operation (otherwise artifacts
> -        * may appear on the output). The value required by the manual is not
> -        * explained but is likely a buffer size or threshold.
> +        * On R-Car V3M and RZ/G2L the LIF0 buffer attribute register has to be
> +        * set to a non-default value to guarantee proper operation (otherwise
> +        * artifacts may appear on the output). The value required by the
> +        * manual is not explained but is likely a buffer size or threshold.
>          */
> -       if ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
> -           (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> +       if (((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
> +           (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M)) ||
> +           ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
> +            VI6_IP_VERSION_MODEL_VSPD_RZG2L))
>                 vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
>                                VI6_LIF_LBA_LBA0 |
>                                (1536 << VI6_LIF_LBA_LBA1_SHIFT));

LGTM, although using a feature bit in vsp1_device_info, or just a
switch() statement here, would probably be better.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
