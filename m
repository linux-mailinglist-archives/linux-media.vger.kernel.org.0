Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA5A6658F5
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 11:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbjAKKX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 05:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236837AbjAKKXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 05:23:49 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8B4E25;
        Wed, 11 Jan 2023 02:23:48 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id h16so1951878qtu.2;
        Wed, 11 Jan 2023 02:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnEyGiFrA5TEhSXqzoV6q+VF6z7IkxH8MfiZy3VIAOs=;
        b=07fc63Pe8IQFdjg3XhWMproV8vzmb0Hovfyekqwy2joBZ7P2agb7j+EZY16yTqGK/8
         3/8VfMgIs/9cRhv/ku8DD7IYIpzXq6g0lpWOwPH1ZWzBdfGYcYPG9qWTYXF1JwVaFe2C
         ix8p6O3ZdzLfa82AX4QrZALq7ePb7rkaNuW2D5fe/hbziWl8jdKEupr+ySOm73+6MLrN
         xTw09gInWfvlLBjaHVegnv1ygt+swzDe5ioCMpAC8bdIL+DTrxWN+hv9UHo6AyBas1LR
         KFsUzlYt7/1uUSffA9yfmAMp2IFUyXs9oaRuzHWGNUB7nXH28Ki7KpbumSwKPJdiH7p8
         TBlg==
X-Gm-Message-State: AFqh2krCB9IzYy+mGDLvKTdHekEWrZs10i14x1LBP558x0HsnaiCpTvU
        syQDgeOYpVTGTpqErrCLPQdODo7VANY1vw==
X-Google-Smtp-Source: AMrXdXvLvvJ82RSj0j7zlueRYMhTLLtOOEpr3ZRC1iPi+i9YqeOmT4uaAwM1asNZgXRPhDIn4r4EyA==
X-Received: by 2002:a05:622a:1f14:b0:3af:4d45:b5b with SMTP id ca20-20020a05622a1f1400b003af4d450b5bmr7363298qtb.28.1673432627026;
        Wed, 11 Jan 2023 02:23:47 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id h6-20020ac81386000000b003a7fef41526sm7282420qtj.77.2023.01.11.02.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 02:23:46 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id g4so14527703ybg.7;
        Wed, 11 Jan 2023 02:23:46 -0800 (PST)
X-Received: by 2002:a25:5189:0:b0:7bf:d201:60cb with SMTP id
 f131-20020a255189000000b007bfd20160cbmr641562ybb.365.1673432626440; Wed, 11
 Jan 2023 02:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20221122193415.1873179-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122193415.1873179-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Jan 2023 11:23:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAwMY9yaTtqdKpNuxHN2fo86ATJcmg-KnTCerGJ-Cb=Q@mail.gmail.com>
Message-ID: <CAMuHMdXAwMY9yaTtqdKpNuxHN2fo86ATJcmg-KnTCerGJ-Cb=Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: dt-bindings: media: renesas,vsp1: Document
 RZ/V2L VSPD bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 22, 2022 at 8:34 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document VSPD found in RZ/V2L SoC. The VSPD block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
