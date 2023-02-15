Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDBDC6977DB
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 09:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233857AbjBOIQy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 15 Feb 2023 03:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjBOIQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 03:16:54 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142E4903B;
        Wed, 15 Feb 2023 00:16:52 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id i5so7781603qvp.6;
        Wed, 15 Feb 2023 00:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Cdm5e9xLc8cevguScCQKFOc3q1xQOUoYIkxjH6rmU=;
        b=MhzyqpSV10kZ210zT59eIdKYyQPKO3du13OJJ+2JJvDUBZmH/vs696YYTHuuRP8RKR
         15H68Xb09af1mBWKZFTjrEjts6bbFlcRoM+ibQTo9pn7G0qLwm1Kcz7V7XE3VHh1umg1
         GAMoOsdP+j6xKy+XxmhjRppvnwQ7Tsf4X2py9yb0GX+UC0dUZ2zYhOmBiS+J/JFP8WiH
         VKwFUjBgfk+4+F+nH2P/3Cr58OdLdt8iHHzH5bQzIpiwAIDeVewRrocViNBAVoJ49E2c
         54jgtb8Z+px7uNRvNkj+aEY12qHvcTbrmgW8vsUQDS8TuHrz7LwLvd936TXiK7a4Y61Q
         8/jg==
X-Gm-Message-State: AO0yUKXOo2y+Sz0jtxrB+WIDqTEmzy5dQl0DxZoEF0iDwpvJhLJEP4TJ
        5PaWen9cUIke/aEK95+on7ohykKyInrsUyl3
X-Google-Smtp-Source: AK7set/uPdlKyxM+QVnNsxdREDHrKabARlzlw804vXtTPf9XpAbkG8cNqz9deoXNhLeDp2qAaTlceA==
X-Received: by 2002:a05:6214:1c44:b0:56e:aa32:bf5c with SMTP id if4-20020a0562141c4400b0056eaa32bf5cmr2771389qvb.47.1676449011067;
        Wed, 15 Feb 2023 00:16:51 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 73-20020a370b4c000000b007259807a512sm13313908qkl.12.2023.02.15.00.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 00:16:50 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-51ba4b1b9feso249578857b3.11;
        Wed, 15 Feb 2023 00:16:50 -0800 (PST)
X-Received: by 2002:a0d:fe03:0:b0:52e:ea5b:f6cb with SMTP id
 o3-20020a0dfe03000000b0052eea5bf6cbmr153963ywf.237.1676449010443; Wed, 15 Feb
 2023 00:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se> <20230211144147.3812388-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211144147.3812388-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Feb 2023 09:16:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWn4JDnoFu5trtnnu2R-1dYW1bcS=MV4GMcNis+oDX2rw@mail.gmail.com>
Message-ID: <CAMuHMdWn4JDnoFu5trtnnu2R-1dYW1bcS=MV4GMcNis+oDX2rw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: dt-bindings: media: renesas,csi2: Add binding
 for V4H
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Feb 11, 2023 at 3:43 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document support for the CSI-2 module in the Renesas V4H (r8a779g0) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
