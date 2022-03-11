Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF334D6251
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 14:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347350AbiCKNXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 08:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242502AbiCKNXs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 08:23:48 -0500
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4ABBF59;
        Fri, 11 Mar 2022 05:22:44 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id 1so6316952qke.1;
        Fri, 11 Mar 2022 05:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZvj3sOTFnXRJdrh2Ait/itweuj8G0XiiGpCPlRLGVE=;
        b=uruHKh5l0PM7Mc+lvTnAZRYdJNCLlevQBpJVRNaHZs/qbmiNndNxhw3570Jm33Axnt
         KOP57HoMFvbUmKCZjbmfgI8GGol8/O9z+biF8SFrriVMGhnRug+nc4H5RL2SNa3C+Joz
         PNhXWk/MOIlkLXkiPlu1NwWtxjsUTiUOCNShjfDmdXEYypOciQj2CH6ZBkQDYCzvlyh6
         jqoaSin4Zx5Ev1hv1dXM4l4fHL5qzPNL3/6dNo3JtNyeE4NBtdgZQsGyKfA/91lckY1Z
         KHD/nBdnXX+JZBXgo0FoHYp0jE3BUv0s1w8tppzoGf72RnFDbq9AywiLILsHs/hA8hG8
         9WJA==
X-Gm-Message-State: AOAM532pT3jgNuygaXOoOdyXzbVVKycBn2EZ4mBLO+Pr9y7zCatohCDy
        nK7pYvKjVDTvUAl/oxKH0UA56AyIW9hsbQ==
X-Google-Smtp-Source: ABdhPJw831G0YSAwwtO6akC5ZHcec4HMaFzNndoTDEtEK/u6JI+eGT/J625WNoNpGY1kfb8JVQxRqA==
X-Received: by 2002:a05:620a:c55:b0:67d:1721:5956 with SMTP id u21-20020a05620a0c5500b0067d17215956mr6504621qki.218.1647004963006;
        Fri, 11 Mar 2022 05:22:43 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 193-20020a3706ca000000b0067d3e4b5667sm3449454qkg.67.2022.03.11.05.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 05:22:42 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id v130so17003385ybe.13;
        Fri, 11 Mar 2022 05:22:42 -0800 (PST)
X-Received: by 2002:a25:c54a:0:b0:628:9d7f:866a with SMTP id
 v71-20020a25c54a000000b006289d7f866amr8034161ybe.546.1647004961882; Fri, 11
 Mar 2022 05:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20220311130158.27158-1-biju.das.jz@bp.renesas.com> <20220311130158.27158-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220311130158.27158-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Mar 2022 14:22:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFKKrLHQZKpwFF3=wBqf5bsjTF2P8A0M-QvohdfWA4Ew@mail.gmail.com>
Message-ID: <CAMuHMdVFKKrLHQZKpwFF3=wBqf5bsjTF2P8A0M-QvohdfWA4Ew@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] media: vsp1: Add support to deassert/assert reset line
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

On Fri, Mar 11, 2022 at 2:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As the resets DT property is mandatory, and is present in all .dtsi
> in mainline, add support to perform deassert/assert using reference
> counted reset handle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
