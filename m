Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5896D2404
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 17:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbjCaPav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 11:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbjCaPau (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 11:30:50 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EA11D2E7
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 08:30:47 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k37so29470011lfv.0
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1680276646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6A0iWjO3lEyBsPaMGHtQd+BJD8tKNmM9E/ONQ1qr1SM=;
        b=LkFgRfPeFp/22S5euUb4OH6Lb5B6FGAqmU6JcIMbkQMDclMy9HM2TsKtQGzptucalQ
         GRsYBVyRN51WNzia2nlyopOLglIN2uRM3O45Mv6b1phweAjPhXsiLG3riIDe7qkyPCws
         30F1DGBkW9tZrcKptQYOYgdDaeOepY5D3uf6gTfgs5nahxwLhTYbgbtpkezNoF6RQzoX
         Jo+CtOtcvYsJBMXbnAkc6NbePi9qp20UxIl8WpiieJ/EwpnUzyk6lqT5xrKvbs+6BN4f
         ZckBg0zrEIJgm4/nZbbwM1bZ4EOoUQtTbi6xLWHRaE6yjpKE2E8+pXPx4TTgJunzYqge
         1wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680276646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6A0iWjO3lEyBsPaMGHtQd+BJD8tKNmM9E/ONQ1qr1SM=;
        b=vqRjCTnpBgBE2W6r3diUKLFY6HZ9mUHaN0r4j7poqreYb+YvrbWnPDh76FEQEGsBdU
         gX+LlRMR2buRt+VS6fms1nDDa7a/Tq9kgdpTQTTgGphRiuRpeeE+DSVIWBMS+6fKggRi
         6EDIPSqQytuaXISBDgsqtKdHE1Lnb0qpAqx87KPe/EykQHlAksHd9rYIhdPpa32aGyJ3
         8S4pO4dDVfHXDA+TcnnuQTJwGd4PwHPC56ubmJy/z02S9NWT+mdi7eECzAAUZ3xp3tFF
         y+jcODT6JxlQHqXc8RozULrITnK+v6CSKtyVf1/J9TT80IH0pn6jtusJ/vfHG9y+78aD
         rM/A==
X-Gm-Message-State: AAQBX9dNxPjmvy+puUxvjsKn9UH/o4sO2/8zs0R8PTrzT0vLQ+woixcJ
        sXNYeucevPeBf+8ZmDc7G1veUw==
X-Google-Smtp-Source: AKy350YepSvuw2t6ZjhbyE64IUjssjT5anPkoiKQnBEdq9dZJrA10z16qjpoc2CUOMaPBfuz3d57Zw==
X-Received: by 2002:a05:6512:38a9:b0:4eb:10b:a8ed with SMTP id o9-20020a05651238a900b004eb010ba8edmr7665971lft.64.1680276646126;
        Fri, 31 Mar 2023 08:30:46 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id l13-20020ac24a8d000000b004b550c26949sm411994lfp.290.2023.03.31.08.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:30:45 -0700 (PDT)
Date:   Fri, 31 Mar 2023 17:30:45 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: falcon-csi-dsi: Set bus-type for
 MAX96712
Message-ID: <ZCb8pZic2NILOER/@oden.dyn.berto.se>
References: <20230331141431.3820311-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWXxUy67noYCq3d2HOKD0rvzmoL=xPGHZ=0GjToJosNNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWXxUy67noYCq3d2HOKD0rvzmoL=xPGHZ=0GjToJosNNA@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for your comments.

On 2023-03-31 17:08:50 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Thanks for your patch!
> 
> On Fri, Mar 31, 2023 at 4:15 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Specify the bus-type property for all three connected MAX96712.
> 
> Probably this can use a little bit more explanation?
> E.g. what does not work?

Everything works both with and without this patch. This is done in 
preparation to making the property mandatory. The default behavior when 
parsing a node without this property is to default to D-PHY. So this is 
just playing it safe and future prof tings as the default parsing comes 
from the V4L2 core and not the driver itself.

> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Does this need a Fixes: tag?
> Fixes: 283252132cb578cf ("arm64: dts: renesas: falcon-csi-dsi: Add and
> connect MAX96712")
> 
> Note that a backport to v6.1 and earlier will depend on a backport of
> commit f7eeb00845934851 ("media: dt-bindings: media: Add macros for
> video interface bus types") in v6.2, too.

In a perfect word it would. But since the change is backward compatible 
I'm not sure it's worth the effort given the dependency on the macro 
definitions? If you think this is a good idea maybe a separate patch 
posted for stable that uses the numerical values directly?

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund
