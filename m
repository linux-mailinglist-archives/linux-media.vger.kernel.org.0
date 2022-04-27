Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4912E5116F2
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 14:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234591AbiD0MrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 08:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234583AbiD0MrR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 08:47:17 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460231FC0FE;
        Wed, 27 Apr 2022 05:44:06 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id e17so927732qvj.11;
        Wed, 27 Apr 2022 05:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1aIkrZLkxSOb+1aLOrPpk/IwAIHc80iuuJoQotmLqj8=;
        b=fgtHwNRgfU0CHrG12Y9u/GLT8gMyxq3b7ZBF2Z0oLjkln/CWWvpXTZwdsNiMYUYCYJ
         WOqiC6A7t38PKrOqV64cNWfRT2Hteu9Ja5EOMqiLrjqLXnUYBCknPDWwDvlcpD4RrzBR
         WN2M3XavpJyIy2SimC2frFgKUOyAg6qCmg69t+H0sv1nhr0sC7JNmYTZ28GAQJhaJUvx
         30RlQuTvqWSTVD7wwgaZIy/jLRbtJfL7gVAmWiYNJapnfDpmo7FoMYD2xUtRQU+UV09Z
         YTw4l9vBO4+xCVgjzUivnINi6QuXCEws8NoZ+ZX3ClA0DJGR9odVr1rvfz3iwzeKByT3
         850A==
X-Gm-Message-State: AOAM532jEar8YMBqVWt/8U0Yq3KKYP73EDHKXssz5fjp00kC4mbEWYWd
        VJxc+XtHw6EeIMvbQlY5QuWY0ptRqxUk+A==
X-Google-Smtp-Source: ABdhPJx6i7wXbF8Bx9/MC8afjwn67VarQX6fDWMH8i78hvm2xPj5j1WzIY4VtLasbReeEigs8OxaKg==
X-Received: by 2002:a05:6214:174:b0:456:3bb4:4b94 with SMTP id y20-20020a056214017400b004563bb44b94mr8948073qvs.87.1651063445085;
        Wed, 27 Apr 2022 05:44:05 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id c3-20020ac85a83000000b002f36b61b0d3sm4872635qtc.47.2022.04.27.05.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 05:44:04 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2f7d621d1caso16814897b3.11;
        Wed, 27 Apr 2022 05:44:04 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr26546307ywi.449.1651063444534; Wed, 27
 Apr 2022 05:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220419181757.63346-1-biju.das.jz@bp.renesas.com> <20220419181757.63346-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220419181757.63346-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 14:43:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVv6e+ydQGeEdtsy1g9u1OLY+ZO_7EKw8SU4HapXcfa+w@mail.gmail.com>
Message-ID: <CAMuHMdVv6e+ydQGeEdtsy1g9u1OLY+ZO_7EKw8SU4HapXcfa+w@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA
 feature bit
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Tue, Apr 19, 2022 at 8:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per HW manual V3M and RZ/G2L SoC's has non zero LIF buffer
> attributes. So introduce a feature bit for handling the same.
>
> This patch also add separate device info structure for V3M and V3H
> SoC, as both these SoC's share the same model ID, but V3H does not
> have VSP1_HAS_NON_ZERO_LBA feature bit.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v8:
>  * New patch

Thanks for your patch!

> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -782,6 +782,7 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>         }, {
>                 .version = VI6_IP_VERSION_MODEL_VSPD_V3,
>                 .model = "VSP2-D",
> +               .soc = VI6_IP_VERSION_SOC_V3H,
>                 .gen = 3,
>                 .features = VSP1_HAS_BRS | VSP1_HAS_BRU,
>                 .lif_count = 1,
> @@ -789,6 +790,17 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>                 .uif_count = 1,
>                 .wpf_count = 1,
>                 .num_bru_inputs = 5,
> +       }, {
> +               .version = VI6_IP_VERSION_MODEL_VSPD_V3,
> +               .model = "VSP2-D",
> +               .soc = VI6_IP_VERSION_SOC_V3M,
> +               .gen = 3,
> +               .features = VSP1_HAS_BRS | VSP1_HAS_BRU | VSP1_HAS_NON_ZERO_LBA,
> +               .lif_count = 1,
> +               .rpf_count = 5,
> +               .uif_count = 1,
> +               .wpf_count = 1,
> +               .num_bru_inputs = 5,
>         }, {
>                 .version = VI6_IP_VERSION_MODEL_VSPDL_GEN3,
>                 .model = "VSP2-DL",
> @@ -832,8 +844,12 @@ static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
>         for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
>                 info = &vsp1_device_infos[i];
>
> -               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version)
> +               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version) {
> +                       if (info->version == VI6_IP_VERSION_MODEL_VSPD_V3 &&
> +                           ((vsp1->version & VI6_IP_VERSION_SOC_MASK) != info->soc))

This check looks fragile to me.
What about

    if (info->soc && (vsp1->version & VI6_IP_VERSION_SOC_MASK) != info->soc))

?

> +                               continue;
>                         break;
> +               }
>         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
