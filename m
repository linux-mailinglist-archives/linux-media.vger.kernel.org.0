Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E928C5117CA
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 14:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234755AbiD0MoK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 08:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbiD0Mn4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 08:43:56 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAA743AF3;
        Wed, 27 Apr 2022 05:40:45 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id o11so969990qtp.13;
        Wed, 27 Apr 2022 05:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l1nABhjoOdDs7fypArNHIeBpkNkciobjy4sTScLur10=;
        b=zxO3gTRXRmOlRsXAI11MrQlt8IiuMc2bNOW4PG96RaeNimeDriKvC0acfOMSlgjzNr
         DLMOhaW/Kta6EqZb+dtMJtUTRcNfiFNWyTjxVWdpmlpGIKEI9o9/rpMUKUa57eWKZf8P
         HYKOsZcuN/gmUXcP4AIJAKPjrv9vP0mF4PgStbnrgyeQipRwx5Zjg5PiBQhepnLno18W
         NniZLzmLck8qZpj6uyL6y09uBGzATc36bxy2W1S4jE/uf8tPRKg6arwgow7GaCR0vWAD
         txrLJvbMd7xGWEEzH2u/2lkzcjklYZmjzb7RzIT7QHdBRJ6K0SAc9j5FbvNWHiKSc7Sn
         yKcQ==
X-Gm-Message-State: AOAM533SNU5yGFI++nuELJ3b0iUHhQnhnBUIOe7Gh3oYqbfeKTz78Ib/
        MyDq5ThghY1/WefWjFXOA1I8KFpdDFN20Q==
X-Google-Smtp-Source: ABdhPJxxMrNdFcbzlb5n7YMLROflbny1oYSqbWNI2hslGL8KVzyY6/0ppMkPyJSeFsR4Vof9Jo0qhQ==
X-Received: by 2002:a05:622a:256:b0:2e1:a01b:a538 with SMTP id c22-20020a05622a025600b002e1a01ba538mr18924408qtx.167.1651063244862;
        Wed, 27 Apr 2022 05:40:44 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 22-20020ac85916000000b002f3402e34a3sm10195346qty.55.2022.04.27.05.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 05:40:44 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id s30so3113438ybi.8;
        Wed, 27 Apr 2022 05:40:44 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr24979926ybp.613.1651063244228; Wed, 27
 Apr 2022 05:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220419181757.63346-1-biju.das.jz@bp.renesas.com> <20220419181757.63346-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220419181757.63346-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 14:40:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXVrZNqeegRXXU-rVgyGMe2AdS_z-jstNapeLCOGpzEQ@mail.gmail.com>
Message-ID: <CAMuHMdUXVrZNqeegRXXU-rVgyGMe2AdS_z-jstNapeLCOGpzEQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] media: renesas: vsp1: Add support for VSP software version
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Tue, Apr 19, 2022 at 8:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The VSPD block on RZ/G2L does not have a version register.
>
> This patch adds support for adding VSP software version based on
> device match.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v8:
>  * New patch

Thanks for your patch!

> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -812,11 +812,43 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>         },
>  };
>
> +static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
> +{
> +       const struct vsp1_device_info *info;
> +       unsigned int i;
> +
> +       /*
> +        * Try the info stored in match data first for devices that don't have
> +        * a version register.
> +        */
> +       info = of_device_get_match_data(vsp1->dev);
> +       if (info) {
> +               vsp1->version = VI6_IP_VERSION_VSP_SW | info->version | info->soc;
> +               return info;
> +       }
> +
> +       vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> +
> +       for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> +               info = &vsp1_device_infos[i];
> +
> +               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version)
> +                       break;

return info? ...

> +       }
> +
> +       if (i == ARRAY_SIZE(vsp1_device_infos)) {

... so this check is no longer needed.

> +               dev_err(vsp1->dev, "unsupported IP version 0x%08x\n",
> +                       vsp1->version);
> +               return NULL;
> +       }
> +
> +       return info;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
