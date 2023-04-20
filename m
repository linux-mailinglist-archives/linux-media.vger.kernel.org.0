Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 385C46E978B
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 16:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbjDTOsL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 20 Apr 2023 10:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjDTOsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 10:48:10 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F17649EA;
        Thu, 20 Apr 2023 07:48:09 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id t15so2386934ybb.1;
        Thu, 20 Apr 2023 07:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682002088; x=1684594088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmDRYCu7Jt3gKtDxjGvoyq8djfPIkMFFRvz5U28UbdA=;
        b=RR3rzs+PLTL82Qt8XkW3K5uY9dCVZXEo9UBWlAmzBFQPAmQR6euI3yJXWCNcSCz34P
         +vhruw8LUgS3Vh3NZHFwJ5RRRuPpo48lkSKoDEe+oht2wXV9XZC7fod+S+MlnYqkV2XX
         OdQE6PDBjZvIvxbiCIEkvyItWtE8E415F5BlzcjVZeTVJYIFm4VNWDu9hRz0L3Z0QCnw
         bFslnbnVnDR12FW/qz0tC9ZMweYLxITJEFs/w5+3oS56vceI5Rpu3KJowm8qmlgJ/j84
         638SDNipkZr8UNnacwaxsBwH/n/wj8CuvYKjYQim4vFveNk3odu6ea+1zm6lEJAaeTK3
         sLcw==
X-Gm-Message-State: AAQBX9cgKKhkaCV+rMHY0las0e6hgH5LwHX6Z5UpgcjXAUrl5olR3P+K
        OTVZug/Hrqnn0YZgoACHxDAT4aTq1q6nAMId
X-Google-Smtp-Source: AKy350YH1aRn+xnhJFHoVei8B4cPuzRlzuwZa6FxejeJAAIhMsbumu6r+Ih+OjcKLEnkFtm8CGyV6A==
X-Received: by 2002:a25:343:0:b0:b67:3785:823c with SMTP id 64-20020a250343000000b00b673785823cmr1340487ybd.36.1682002087260;
        Thu, 20 Apr 2023 07:48:07 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id p68-20020a254247000000b00b9570d01d27sm329995yba.56.2023.04.20.07.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 07:48:06 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54fbb713301so44313037b3.11;
        Thu, 20 Apr 2023 07:48:06 -0700 (PDT)
X-Received: by 2002:a0d:df95:0:b0:54c:27e7:b1fd with SMTP id
 i143-20020a0ddf95000000b0054c27e7b1fdmr1072994ywe.37.1682002086443; Thu, 20
 Apr 2023 07:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com> <20230411120810.368437-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230411120810.368437-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Apr 2023 16:47:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4NTcNL6MYEqTmRtPP3iTSNTfnoEttPwevFyXZ_Vk4aA@mail.gmail.com>
Message-ID: <CAMuHMdU4NTcNL6MYEqTmRtPP3iTSNTfnoEttPwevFyXZ_Vk4aA@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] drm: rzg2l-du: Add RZ/V2L DU Support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
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

On Tue, Apr 11, 2023 at 2:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for RZ/V2L DU. The RZ/V2L DU block is identical to
> RZ/G2L SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
> @@ -53,6 +53,7 @@ static const struct rcar_du_device_info rzg2l_du_r9a07g044_info = {
>
>  static const struct of_device_id rzg2l_du_of_table[] = {
>         { .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
> +       { .compatible = "renesas,r9a07g054-du", .data = &rzg2l_du_r9a07g044_info },
>         { /* sentinel */ }

So this change implies no fallback compatible value, OK.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
