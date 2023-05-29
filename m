Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA9E7150B3
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 22:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjE2Ups (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 16:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjE2Upr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 16:45:47 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B7BC7
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 13:45:46 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-95fde138693so945950666b.0
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 13:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685393145; x=1687985145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7R3FPKbTWJLY+7i6BBPmrgd9L+dL7TFTDyT61Ll30oE=;
        b=nj3zUNvkEFdZe5oaMlf0dKuc+PXsQ5ttMjDktar1yzmPig16fR9oWyTpF4mTftPooc
         Sr7SLd8DtJkOgcMiGIK/zA6y22/FMiijXcepgahANShG5rELnJEtsRpgDCJj7AAtDKGa
         XLwScgu/jrc8Ob4tAcFjEf6t1O45WX2QZAbK4gQAOXRiT38ncBuDGuODxA6TT/1KBZdf
         JNg0coLhkjvQMTcyCMxZ/4pUFk7GS9aSm49woUFVcCf+QX6tRjO/YomEmiIFhvtnghJr
         WZHyDu4qWMIaw+TbMx8PqDJuUoBuBGxYqx2hss+6uIcUwBztQuJxwBqkgAa5KOpAk/Kh
         FZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685393145; x=1687985145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7R3FPKbTWJLY+7i6BBPmrgd9L+dL7TFTDyT61Ll30oE=;
        b=N8TwMrndk4mAPtZSvee0HreKY1PWJQvZcLXzFzsK08FWWGig7sVtkTWoKUgeTZ0ZOg
         ClomCLva4oblD3PCr1QhD/hyumy78W0FtuHRK+LsLxRm+lhbO6gg6TQYdYuiZIvINuA9
         XkV2YDMKZWs32X6vAF4kiz0F9BMoxrAPBchIck9FVGNbbmlbaV1uGEQYDq9Xna8tuLNC
         s6U3paaMTRsBJqmblJMIiwIFiyh9uL+Gk2GhnTfRZjCf9OMDVw6yPD5YGEYQp3oHw7I2
         M4ti5p6RnN2j5iuh7ampY6v30VcKd15UDwCKLMVu/SpuaAPZmNyE33Uf46n5Dh81oTrs
         BRgw==
X-Gm-Message-State: AC+VfDxwe1ulPZ/9XV//jQJgxlVe3WNeYJw4QxtsCnrxpxkfl2sT5B0e
        VYVXLTCOSDvuxe7xkufxRw6xB5JA3p8XHChv9YgIcBfMAsk=
X-Google-Smtp-Source: ACHHUZ6dBQLVeTggS7BrQZIwH0USzlV+sl8utSAh2F33q38rxWXSjwkj09vNDIoE2Mf8GbkG0A/xUakYNm9lMIHvQis=
X-Received: by 2002:a17:906:58d1:b0:94a:653b:ba41 with SMTP id
 e17-20020a17090658d100b0094a653bba41mr291658ejs.15.1685393145061; Mon, 29 May
 2023 13:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230517115635.31565-1-zelong.dong@amlogic.com> <20230517115635.31565-4-zelong.dong@amlogic.com>
In-Reply-To: <20230517115635.31565-4-zelong.dong@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 29 May 2023 22:45:34 +0200
Message-ID: <CAFBinCCSGdKfgEpdF5FmAyjb-wOM2HtsriuBDnePokgyu4PkXw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: rc: meson-ir: support MMIO regmaps to
 access registers
To:     zelong dong <zelong.dong@amlogic.com>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, May 17, 2023 at 1:56=E2=80=AFPM zelong dong <zelong.dong@amlogic.co=
m> wrote:
>
> From: Zelong Dong <zelong.dong@amlogic.com>
>
> Supports MMIO regmaps to access controller registers in Meson IR driver.
>
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  drivers/media/rc/meson-ir.c | 72 +++++++++++++++++++------------------
Kconfig also has to be updated with:
  select REGMAP_MMIO

Otherwise you can end up with a compile error: undefined reference to
`__devm_regmap_init_mmio_clk`
See a recent patch on this: [0]


Best regards,
Martin


[0] https://lore.kernel.org/lkml/20230228043423.19335-1-xry111@xry111.site/
