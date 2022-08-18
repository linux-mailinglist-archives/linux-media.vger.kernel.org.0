Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065EF598053
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 10:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243040AbiHRIub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 04:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242970AbiHRIua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 04:50:30 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E59297D6C;
        Thu, 18 Aug 2022 01:50:28 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id m5so640911qkk.1;
        Thu, 18 Aug 2022 01:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=T9SPDlWI1HdJSmKo8bLd/MkM9a/SFyk6lU9EnvkTbTk=;
        b=poAuRwW02LBRa3ktdhCfWRuPBF878QZ+Uoyl/TGdKrO9nfBqTtFTJT6iOhqGIHuyyP
         PlAHIFjPjxZwShdM0DoMrNEq4JmNLxe8y6eqRi0B8cAbDoHkxbHuDIcAapRgC1JJ92Sv
         jCPDxVekSkbeZfKb6W/nr3rxfWwnO7OTdT97nGBy4B1Xi/PW2WnYAWLpNJeXkgZm8wg6
         2cvnCDUuNbVX4ovq0rcTNeRlPxrscSXbD1aDKGsiwWDpJV/h1DtCcnaxuDee8QkBcFS0
         3lENq0/Sdsg/wSloJXs8QfzXR0/CZhFNnREWQU2n1ICVdbRltWAB/nKthz8IeNjBlz0c
         BA3g==
X-Gm-Message-State: ACgBeo0Ppd34Da/Dz+Z9kpueXTisK0z9ceZRxXnNDwOTIeaPL+Bexcc+
        gwYr0ZDvjJccibiw3xbHmID2soYTyXtaJg==
X-Google-Smtp-Source: AA6agR4n6KhLQDeiLzwkMez/bNfU7tX6QcNJj0wyqzyUPLOwFtQfvJ9qh2mBduiSpBl8D5PisUKcMg==
X-Received: by 2002:a05:620a:448a:b0:6ba:c5dc:b7f2 with SMTP id x10-20020a05620a448a00b006bac5dcb7f2mr1228559qkp.297.1660812627428;
        Thu, 18 Aug 2022 01:50:27 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id bn44-20020a05620a2aec00b006bb619a6a85sm1014883qkb.48.2022.08.18.01.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 01:50:26 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3246910dac3so22919877b3.12;
        Thu, 18 Aug 2022 01:50:26 -0700 (PDT)
X-Received: by 2002:a81:1e45:0:b0:336:bade:e0 with SMTP id e66-20020a811e45000000b00336bade00e0mr1144304ywe.358.1660812626475;
 Thu, 18 Aug 2022 01:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220722164907.16587-1-biju.das.jz@bp.renesas.com> <20220722164907.16587-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220722164907.16587-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 10:50:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNNqgc=JU=UdnFRGRTCp484wjOqFc6M6J4Oq=-91Xbxw@mail.gmail.com>
Message-ID: <CAMuHMdXNNqgc=JU=UdnFRGRTCp484wjOqFc6M6J4Oq=-91Xbxw@mail.gmail.com>
Subject: Re: [PATCH v12 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Fri, Jul 22, 2022 at 6:49 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As the resets DT property is mandatory, and is present in all .dtsi
> in mainline, add support to perform deassert/assert using reference
> counted reset handle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v11->v12:
>  * Replaced read_poll_timeout_atomic-> udelay(1) as testing on RZ/G1N
>    shows this delay is sufficient to avoid lock-up.
>  * Removed Rb tags.

Thanks for the update!

> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -11,11 +11,13 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>

This is no longer needed.

>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/videodev2.h>
>
>  #include <media/rcar-fcp.h>

The rest LGTM, so with the above fixed:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
