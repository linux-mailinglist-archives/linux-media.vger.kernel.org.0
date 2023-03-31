Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BFD6D241F
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 17:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbjCaPjQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 31 Mar 2023 11:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCaPjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 11:39:16 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA524C35;
        Fri, 31 Mar 2023 08:39:14 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-545e907790fso306010277b3.3;
        Fri, 31 Mar 2023 08:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680277154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bgd1v9r38Hx8sUxhoLjxobImk6YKVHUgGgN0pJ0Zhro=;
        b=AaCnNE/ho4bILmY+7dzXhvah7ppm3CAbYKCjeZdYX2TGrTzLhwDMhbs48fMhRQYiu1
         mS6dZpKbPJ24ffjR4p8hVbTTimMULjo4jkTg4eqRmp3bUnMeaSSIf9Q/pfA+eeOV6G/0
         fT7yJTDmpAa7W+BOyoPk3eLhuD2z4iZjiZTX+/T/XCrmxz3l3LoS3EALNVJgbLAeavL8
         CCrKywrIsv0Akdjq//TS9XeyuP0Qp1Tz36l9PGeVav3pj9Q5WcqSweHbOta2OgDDv8Pd
         QrABs6Hit34XzuGn7tlZDQ72ZCUF4w9dzNlwt+Vt2roegfKn9hLqapbFGWK/XoepCnhk
         iKUw==
X-Gm-Message-State: AAQBX9dye61dYstEuAD8IQCaF5HV4wZ+pyoZL2VO1nvtNzn5q7eDqZO2
        ms9kMzWQvLHl0rVmqWO9wv6DvzgoXiRuSw==
X-Google-Smtp-Source: AKy350ao2v7Etyf69vUUhcQU98JbcE8i8Fm+gfo3B0YbvoIYMmjEDKms+WNz+0rrkNH6xy3ZMy1xDA==
X-Received: by 2002:a81:a08f:0:b0:541:6158:fa85 with SMTP id x137-20020a81a08f000000b005416158fa85mr22818060ywg.19.1680277153953;
        Fri, 31 Mar 2023 08:39:13 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 75-20020a810a4e000000b00545a0818481sm595217ywk.17.2023.03.31.08.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 08:39:13 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id e65so27826629ybh.10;
        Fri, 31 Mar 2023 08:39:13 -0700 (PDT)
X-Received: by 2002:a25:2749:0:b0:a99:de9d:d504 with SMTP id
 n70-20020a252749000000b00a99de9dd504mr17930157ybn.12.1680277153144; Fri, 31
 Mar 2023 08:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230331141431.3820311-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWXxUy67noYCq3d2HOKD0rvzmoL=xPGHZ=0GjToJosNNA@mail.gmail.com> <ZCb8pZic2NILOER/@oden.dyn.berto.se>
In-Reply-To: <ZCb8pZic2NILOER/@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 31 Mar 2023 17:39:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7OX_Sda6HX9+zDWBtAvKBocrWPL0Y0=4Ont5v-4=i6w@mail.gmail.com>
Message-ID: <CAMuHMdX7OX_Sda6HX9+zDWBtAvKBocrWPL0Y0=4Ont5v-4=i6w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: falcon-csi-dsi: Set bus-type for MAX96712
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Mar 31, 2023 at 5:30 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2023-03-31 17:08:50 +0200, Geert Uytterhoeven wrote:
> > On Fri, Mar 31, 2023 at 4:15 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Specify the bus-type property for all three connected MAX96712.
> >
> > Probably this can use a little bit more explanation?
> > E.g. what does not work?
>
> Everything works both with and without this patch. This is done in
> preparation to making the property mandatory. The default behavior when
> parsing a node without this property is to default to D-PHY. So this is
> just playing it safe and future prof tings as the default parsing comes
> from the V4L2 core and not the driver itself.

OK. I realized most of that after reading your other patch...

> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Does this need a Fixes: tag?
> > Fixes: 283252132cb578cf ("arm64: dts: renesas: falcon-csi-dsi: Add and
> > connect MAX96712")
> >
> > Note that a backport to v6.1 and earlier will depend on a backport of
> > commit f7eeb00845934851 ("media: dt-bindings: media: Add macros for
> > video interface bus types") in v6.2, too.
>
> In a perfect word it would. But since the change is backward compatible
> I'm not sure it's worth the effort given the dependency on the macro
> definitions? If you think this is a good idea maybe a separate patch
> posted for stable that uses the numerical values directly?

OK, so no Fixes needed.
And if someone wants to backport it (renesas-bsp?), xe can backport the
latter, too (in fact renesas-bsp already did).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
