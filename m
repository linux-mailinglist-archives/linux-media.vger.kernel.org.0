Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845F96445D9
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 15:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbiLFOi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 09:38:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbiLFOiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 09:38:21 -0500
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB622A436;
        Tue,  6 Dec 2022 06:38:16 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id x18so7575084qki.4;
        Tue, 06 Dec 2022 06:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoCQfxJ5i6j85vIMn+stwCyxBvgczcZworKXH87DwQw=;
        b=EewW9RvZWj1rGOqQRaWWzrQctlNqVOyoNpNFZcKoLDFkLnewZ3Vy3lX/Z1LGmsNcY7
         sbaNHovNA8+rWleU8LViKQfg9jSymZmJ/aph2QsUhf58Dm6SfwJhlVKc5j1vOk9cuL2a
         2CdWl3LAAT2BmLdwRY4aOa5JOCkCK1g5HKwd07G5nbCN4IDLLCkNM/J6+K/Kvur7EwS2
         IBVTp0CLcHDXzGWNt4QwwkkPTdleW93Rj7QOupAp0xreWPS8oG8g67yF0Sx63ujQGNdL
         YIoQ2JjzeYVgEKUv7igRTEbyqGYYX6L79Iwr23GN1l9/5/GZdeyLtTWYvcw3Z2VpfYtE
         0Nyg==
X-Gm-Message-State: ANoB5pm3ZNH6J3XwLhDagusv0wXjf7aUHz1nUU+kguCnrn9MlIl4go3v
        wtI32Wl/H9R8XmVbH3ceiJ+CZNSvlcyrDg==
X-Google-Smtp-Source: AA0mqf5UG0RUMfufR7jV5zbLB+KRZO7dNO7AwbMhQ4Pm37JgA1KtO+K2SHLjdUobt6fXUjzvMNj36w==
X-Received: by 2002:a37:bbc7:0:b0:6fb:4e2c:9dc5 with SMTP id l190-20020a37bbc7000000b006fb4e2c9dc5mr59915970qkf.217.1670337495201;
        Tue, 06 Dec 2022 06:38:15 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id g17-20020ac870d1000000b003a7e66e5b67sm3240585qtp.78.2022.12.06.06.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 06:38:15 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 189so18794969ybe.8;
        Tue, 06 Dec 2022 06:38:14 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id 9-20020a250009000000b006f929efa5eemr29679939yba.380.1670337494447;
 Tue, 06 Dec 2022 06:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com> <20221206133954.397098-6-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20221206133954.397098-6-tomi.valkeinen+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Dec 2022 15:38:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWVXCy_CEjv2c_ke6x+HNfndNci1c3m1Tn5ROy_mvNhmw@mail.gmail.com>
Message-ID: <CAMuHMdWVXCy_CEjv2c_ke6x+HNfndNci1c3m1Tn5ROy_mvNhmw@mail.gmail.com>
Subject: Re: [PATCH 5/7] media: renesas: vsp1: Add new formats (2-10-10-10
 ARGB, Y210)
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Dec 6, 2022 at 2:44 PM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Add new pixel formats: XBGR2101010, ABGR2101010, BGRA1010102 and Y210.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -109,6 +109,56 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>         vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
>         vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
>
> +       if ((entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) == VI6_IP_VERSION_MODEL_VSPD_GEN4) {
> +               u32 ext_infmt0;
> +               u32 ext_infmt1;
> +               u32 ext_infmt2;
> +
> +               switch (fmtinfo->fourcc) {
> +               case V4L2_PIX_FMT_XBGR2101010:
> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +                       ext_infmt1 = (0 << 24)  | (10 << 16) |
> +                                    (20 << 8)  | (30 << 0);

Introducing PACK_CPOS(a, b, c, d)...

> +                       ext_infmt2 = (10 << 24) | (10 << 16) |
> +                                    (10 << 8)  | (0 << 0);

... and PACK_CLEN(a, b, c, d) macros (or a single PACK4() macro)
can make this less error-prone.

> +                       break;
> +
> +               case V4L2_PIX_FMT_ABGR2101010:
> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +                       ext_infmt1 = (0 << 24)  | (10 << 16) |
> +                                    (20 << 8)  | (30 << 0);
> +                       ext_infmt2 = (10 << 24) | (10 << 16) |
> +                                    (10 << 8)  | (2 << 0);
> +                       break;
> +
> +               case V4L2_PIX_FMT_BGRA1010102:
> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +                       ext_infmt1 = (2 << 24)  | (12 << 16) |
> +                                    (22 << 8)  | (22 << 0);
> +                       ext_infmt2 = (10 << 24) | (10 << 16) |
> +                                    (10 << 8)  | (2 << 0);
> +                       break;
> +
> +               case V4L2_PIX_FMT_Y210:
> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_F2B_MSB |
> +                                    VI6_RPF_EXT_INFMT0_IPBD_Y_10 |
> +                                    VI6_RPF_EXT_INFMT0_IPBD_C_10;
> +                       ext_infmt1 = 0x0;
> +                       ext_infmt2 = 0x0;
> +                       break;
> +
> +               default:
> +                       ext_infmt0 = 0;
> +                       ext_infmt1 = 0;
> +                       ext_infmt2 = 0;
> +                       break;
> +               }
> +
> +               vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT0, ext_infmt0);
> +               vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT1, ext_infmt1);
> +               vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT2, ext_infmt2);
> +       }
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
