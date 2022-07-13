Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27465734BD
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 12:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbiGMK4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 06:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235498AbiGMK4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 06:56:10 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6639BFF5A2;
        Wed, 13 Jul 2022 03:56:09 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id y3so11495827qtv.5;
        Wed, 13 Jul 2022 03:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nOiTLY7H3mOgy3upz5I1zJ8BCOeea4/fz964UtSygqo=;
        b=uB1JsbaWZOpbw1z5J18IihkKEswaznWVoKj9J+paKjgO8gqITtOEylM8gWcwavnPpM
         NU6/nCm8H621jyzpAPRivzNrjRGnSzmR7YUrmMAI+YpXhM/WVvu7pPpr6spQSHAXeYTX
         gpjLohMGiiadqOJl/sGH+2ob7Na9WrzDrk+EmWc7saULqcJ39wqCizgnEXDIKx8R1cge
         vWhz6Qz+ynGO0f0zvvpFsSaCG5Kc1Cr4fq9lgf7nH0m9PdJvqmK+UfF9cANog5wT6KZ9
         edr8slRn8wsQ+jzeOI+ZW7Afj7tB9WwkUVyMc21PDsT0SpyzQCbcLeA2VvR+9JNmaULj
         FVNA==
X-Gm-Message-State: AJIora/a8ocu1OQzHc+uFQmseVLeFJKaNp7ec87Tmc9MTXdNJR7c5Jua
        0L9SKh7YPR0At+pZIelEabN+BqbVh3cbDQ==
X-Google-Smtp-Source: AGRyM1v/H6aiD+uJPLbQc9H97/xaWhCuG8+CdOLtY43iIbO1JNxwmRXvm816xCLjBfMSRp7YmLazvw==
X-Received: by 2002:ac8:5c96:0:b0:31e:c39f:3d63 with SMTP id r22-20020ac85c96000000b0031ec39f3d63mr2269298qta.552.1657709768391;
        Wed, 13 Jul 2022 03:56:08 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id x21-20020a05620a0b5500b006af147d4876sm7411056qkg.30.2022.07.13.03.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 03:56:08 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id f73so18575766yba.10;
        Wed, 13 Jul 2022 03:56:07 -0700 (PDT)
X-Received: by 2002:a25:bc8e:0:b0:66e:fe43:645c with SMTP id
 e14-20020a25bc8e000000b0066efe43645cmr3149289ybk.202.1657709767646; Wed, 13
 Jul 2022 03:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
 <20220531141958.575616-3-biju.das.jz@bp.renesas.com> <20220713081856.GA14683@pengutronix.de>
 <OS0PR01MB59225D5ACA3BC7BAB2F47D1D86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXe6P+qg07wFCryqQt7EhTpKw8ZgSN6UjqxYy16eghXdw@mail.gmail.com> <20220713103216.GA10829@pengutronix.de>
In-Reply-To: <20220713103216.GA10829@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jul 2022 12:55:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9ULJVzxsBqkZvg2_XoxJPGqmduhjM9j_PCJDk-PdmqQ@mail.gmail.com>
Message-ID: <CAMuHMdX9ULJVzxsBqkZvg2_XoxJPGqmduhjM9j_PCJDk-PdmqQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

Hi Philipp,

On Wed, Jul 13, 2022 at 12:32 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Wed, Jul 13, 2022 at 11:27:56AM +0200, Geert Uytterhoeven wrote:
> [...]
> > Actually I suggested handling this in the VSP driver, as VSP seems
> > to be "special".
> >
> > >
> > > [1]
> > > https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220504184406.93788-1-biju.das.jz@bp.renesas.com/
>
> So reset_control_status never actually returns 1 and the polling loop is
> not necessary at all?
>
> If it's just the status register read that fixes things for VSP, could
> it be that the deasserting register write to the reset controller
> and the following register writes to VSP are not ordered somewhere at
> the interconnect and the read issued to the reset controller just
> guarantees that order?

The udelay() also works.

While the reset may be deasserted immediately (at the reset controller
level), the VSP may need some additional time to settle/initialize
(at the VSP level).

Reset is known to work on other blocks on the same SoC, so that's
why I suggested handling this in the VSP driver instead, like we
already do for i2c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
