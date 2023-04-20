Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D91F6E97E5
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 17:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbjDTPCr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 20 Apr 2023 11:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbjDTPCq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 11:02:46 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7D54C2D;
        Thu, 20 Apr 2023 08:02:44 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54fb615ac3dso46562897b3.2;
        Thu, 20 Apr 2023 08:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682002963; x=1684594963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxUhM/jxNN72AyF4iUkssSBmkhq9B+Vz0NtwH/Pd3xU=;
        b=Eais+KtZIngFzb1BXiCMNbZC11S2zSduGMaaHaZlwp8DNv+MhKhTCAsydAs7EoXqcn
         GGBjnCagY30Q2AwhoM5KIkvRLIs5xrVKnI5xQ2xXObJcPkk8RYdQHgedwDF2hx5quUTo
         p3UPsQkQrVXHo5EQm3hoJiYsMhBe/nNTjUL4xuCM5pbHz3WEg/p+F6268/ezYK2GRpuS
         EdMudgrQ5HDmAl8qjLwl7/9MLZO98opufuYqydVLpWAXvw9dTPsUoqFlX32tctLlP+Ax
         O7rfJInW1u2tnr+zoZBQ7mkmITBrXCXF87/VPtXE66KfLqs5Y27zGGGTKbqel5IuxGdt
         2XzQ==
X-Gm-Message-State: AAQBX9czBfFgh8TeJA3dBCXFV3GDkv8oXsZrENZH/zluaZ+qFZcTM6nk
        URRQmC7r917YlCJ7NvAi8uDTLX3TYnvHwWVV
X-Google-Smtp-Source: AKy350Zkz4Uq1LqrKcVS8O+aFTyFEAyhA8ED9qfgJIN58AX3xUq9tZbZpRwAogkRzm2g+UbKR25GhQ==
X-Received: by 2002:a81:988f:0:b0:54f:8371:aa5b with SMTP id p137-20020a81988f000000b0054f8371aa5bmr5806122ywg.18.1682002963130;
        Thu, 20 Apr 2023 08:02:43 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id c134-20020a814e8c000000b00555abba6ff7sm378869ywb.113.2023.04.20.08.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:02:42 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54f6a796bd0so44779517b3.12;
        Thu, 20 Apr 2023 08:02:42 -0700 (PDT)
X-Received: by 2002:a81:d93:0:b0:552:b601:c814 with SMTP id
 141-20020a810d93000000b00552b601c814mr6145766ywn.24.1682002962377; Thu, 20
 Apr 2023 08:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com> <20230411120810.368437-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230411120810.368437-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Apr 2023 17:02:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAp=makAvusxDC_JRtPtjkr__a-vd9mEc6FjDkP76Vbw@mail.gmail.com>
Message-ID: <CAMuHMdXAp=makAvusxDC_JRtPtjkr__a-vd9mEc6FjDkP76Vbw@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] arm64: dts: renesas: r9a07g044: Add DU node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Tue, Apr 11, 2023 at 2:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DU node to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
