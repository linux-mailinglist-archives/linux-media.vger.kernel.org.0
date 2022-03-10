Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6724D4272
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 09:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240314AbiCJI0U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 03:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240305AbiCJI0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 03:26:19 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCAA21354A9;
        Thu, 10 Mar 2022 00:25:18 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id a14so3984379qtx.12;
        Thu, 10 Mar 2022 00:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1pPKpEZSqxQ84jBbz4XKDTAYLfke589mfN+zYKU/6o=;
        b=1FB9nLmK+R1FtI0ePDSfqQvJWFX0KTAy27WFcfkBl0FcKVPwEcqXgmRqpyAy+qQebu
         iAO12/mP7mnLA0Wr8elT/xf1b3LNg//BDgx6qCpTvAwJOa0BUBTNMkqVhAMuf3NQqSj6
         MSO1jGlcpq65dSC53zw+ZK/1jKau/iIp7bPWJbyHyBIdU4rQGVri6cBV7/RS3gV3/upo
         u8e61TpW9OSvpPnOqA9qqaPmvL7GiucvgXsa8wmxSpWSbHzjwVBfS7XTC1MRWvV2LpT7
         v+DCqz/zHAxTpUa0ZoQgFdCnLztcWzdCrXsAL/QNAOMXPOqmooQ+7AGwLeaLlKS1BcWa
         +fCw==
X-Gm-Message-State: AOAM533j+1iWq8EulWcSGfhFqrS6TgxUrFUAdffvNcZj+V+Uc84tTMo5
        0/noxN3z/Ia+uRjaZq36sT0kCCKA8W9WnQ==
X-Google-Smtp-Source: ABdhPJxm2KG4Vf8PMzL9wrxu9Kii0qVfo3vTrJ+1jt7Cv9IDgsIguQ0R+d/XY2KeY2iYggPEsmZkbw==
X-Received: by 2002:a05:622a:1484:b0:2d4:69a4:18bd with SMTP id t4-20020a05622a148400b002d469a418bdmr2886746qtx.278.1646900717223;
        Thu, 10 Mar 2022 00:25:17 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id z6-20020ae9c106000000b0067d3b9ef387sm1603592qki.28.2022.03.10.00.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 00:25:16 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2dc585dbb02so49173257b3.13;
        Thu, 10 Mar 2022 00:25:16 -0800 (PST)
X-Received: by 2002:a81:49d0:0:b0:2db:dc6d:445d with SMTP id
 w199-20020a8149d0000000b002dbdc6d445dmr3140656ywa.512.1646900716162; Thu, 10
 Mar 2022 00:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com> <20220309194521.7028-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220309194521.7028-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Mar 2022 09:25:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXC_qAuiCQadL+h=C7oL-wV8OiwKpV4Zu2hH_2Mh=vwMA@mail.gmail.com>
Message-ID: <CAMuHMdXC_qAuiCQadL+h=C7oL-wV8OiwKpV4Zu2hH_2Mh=vwMA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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

On Wed, Mar 9, 2022 at 8:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> similar to VSP2-D found on R-Car SoC's, but it does not have a version
> register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
>
> This patch introduces a new compatible 'renesas,vsp2-rzg2l' to handle
> these differences.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -19,6 +19,7 @@ properties:
>      enum:
>        - renesas,vsp1 # R-Car Gen2 and RZ/G1
>        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> +      - renesas,vsp2-rzg2l # RZ/G2L and RZ/V2L

Please follow the recommended order <vendor>,[<family>|<soc>-]<function>,
i.e. "renesas,rzg2l-vsp2".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
