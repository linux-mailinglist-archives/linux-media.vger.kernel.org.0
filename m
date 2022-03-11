Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7471B4D5F00
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 10:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347751AbiCKJ7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 04:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240844AbiCKJ7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 04:59:38 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B7F4199E;
        Fri, 11 Mar 2022 01:58:31 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id s15so6866354qtk.10;
        Fri, 11 Mar 2022 01:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BrEpZif76TmKwCPFDGrRusv6mAnQRTigyHyseK33rgE=;
        b=RORDpFG/B/3JWN5kUH0V1qUkYgJbOi5hf5yyPRDccaQnDXkddCO4GPLp7v4vamnTl/
         KUFs+dybgPWc2SdCryBBBMi92v9fjYWU9ZakjuhV7hm1UCA0GAiWxj1F5yejJaTuwBOJ
         LtuYn42Q63XN09Yg0cjSu9paCJvqOlL5WrzfcBAGvns69KF7lKTfj3vIeh8irhJIEFRD
         pqZnBz/iCF+4VytG+sCMYwq0xX8SvzhlmsUCb1JPkKZLtuwLv9SI4W7UeFwcyko12oSk
         Q4TiO+FjR8Gc1KNRAYUDLNNO9sZ4lykfDfpgRCjxK7BGH7Qo6ShXoeNebdebsytmvpG1
         RjQA==
X-Gm-Message-State: AOAM532mURMgX/sof+1+mgwLfAVFRrPOjmD/JplhWTshIouy8K8WWRCg
        hF2tcX/1KjWFPB7F8j3ALbfDrNoy0Z4daw==
X-Google-Smtp-Source: ABdhPJwbX1eWHKYXBbszynC40m+MAI49/kkBXGdVZRsw08hfXFjff//tNkDjVcnfJjL5uEMT9Mn+7A==
X-Received: by 2002:a05:622a:48f:b0:2dd:b41a:e206 with SMTP id p15-20020a05622a048f00b002ddb41ae206mr7415874qtx.274.1646992709482;
        Fri, 11 Mar 2022 01:58:29 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 75-20020a37044e000000b0067d47fb5aa4sm2875546qke.63.2022.03.11.01.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 01:58:28 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id j2so16286118ybu.0;
        Fri, 11 Mar 2022 01:58:28 -0800 (PST)
X-Received: by 2002:a25:c54a:0:b0:628:9d7f:866a with SMTP id
 v71-20020a25c54a000000b006289d7f866amr7460415ybe.546.1646992707870; Fri, 11
 Mar 2022 01:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20220310162814.22234-1-biju.das.jz@bp.renesas.com> <20220310162814.22234-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220310162814.22234-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Mar 2022 10:58:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4K3xJE=q4-yS+UOefvP4FT6U1uQQ1ig1S8QnwDYr_HQ@mail.gmail.com>
Message-ID: <CAMuHMdU4K3xJE=q4-yS+UOefvP4FT6U1uQQ1ig1S8QnwDYr_HQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: vsp1: Add support for RZ/G2L VSPD
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

On Thu, Mar 10, 2022 at 5:28 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
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
> v1->v2:
>  * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
>  * Added standalone device info for rzg2l-vsp2.
>  * Added vsp1_lookup helper function.
>  * Updated comments for LIF0 buffer attribute register
>  * Used last ID for rzg2l-vsp2.

Thanks for the update!

> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -814,11 +814,36 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>         },
>  };
>
> +static const struct vsp1_device_info rzg2l_vsp2_device_info = {
> +               .version = VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> +               .model = "VSP2-D",
> +               .gen = 3,
> +               .features = VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL,
> +               .lif_count = 1,
> +               .rpf_count = 2,
> +               .wpf_count = 1,
> +};
> +
> +static const struct vsp1_device_info *vsp1_lookup(struct vsp1_device *vsp1,
> +                                                 u32 version)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> +               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == version) {

While moving this block, you replaced the wrong side of the comparison
by "version".

> +                       vsp1->info = &vsp1_device_infos[i];
> +                       break;
> +               }

> @@ -874,24 +899,21 @@ static int vsp1_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto done;
>
> -       vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> -
> -       for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> -               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> -                   vsp1_device_infos[i].version) {
> -                       vsp1->info = &vsp1_device_infos[i];
> -                       break;
> -               }
> +       vsp1->info = of_device_get_match_data(&pdev->dev);
> +       if (!vsp1->info) {
> +               version = vsp1_read(vsp1, VI6_IP_VERSION);
> +               vsp1->info = vsp1_lookup(vsp1, version);
>         }

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
