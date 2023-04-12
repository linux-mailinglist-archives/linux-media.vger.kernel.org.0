Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6F46DF9F7
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 17:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjDLP1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 11:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjDLP1l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 11:27:41 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B3E30C7;
        Wed, 12 Apr 2023 08:27:36 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id bm45so2245528oib.4;
        Wed, 12 Apr 2023 08:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681313256; x=1683905256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tiFpq4sA6fF2BqfKkfUZ9e15UpII/FjS4nr1bHhOlg=;
        b=cQL0ctZsOj8i3AZqM7OenCF61uKL2nLjq9tZRn/Bm2bSym5aNk24m6x1flVzKR8qUx
         f2gW/Yft3Jl8ZGbv8Cv6GI1wHNoFpWd7uVo8UceQYzSUmGXDqSBqgm4PL948Rg1blzq9
         Xb75iIUGRSnKjEmG+yiBMU8vW+4SMIqSj6We5EXDeCR8N18H1BzEFNbpg1qQULsOyA5y
         WeVB56hxL8ChTE3b0YVuMa6ML7RGG+0kOgfYP/HNNma9y8d0T48lCfKm8OsTSE07K5QB
         1UaE2KkLqaodIzvpYcrfocgLVdFyfeGka+/EbIAtsQG4OpOKPPbRCn0NGfK7gfAlwMyr
         AwTg==
X-Gm-Message-State: AAQBX9eZyalr3JOlM5543adlJZlNAcxdevdc9LCXgtE+uoke63cHJAGK
        Mloy+szI1Q4w0KpwrEBgGzgvW3ljeQ==
X-Google-Smtp-Source: AKy350YoAMV/LXroNkH2jnTpdDTQzSM2asaZ9ChKfH1V8B9f07g5rmSXyaEzhLtYdQjuxLfXEW9oWQ==
X-Received: by 2002:a54:4615:0:b0:387:7651:e117 with SMTP id p21-20020a544615000000b003877651e117mr2925397oip.0.1681313255931;
        Wed, 12 Apr 2023 08:27:35 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 4-20020a4a1404000000b005413e617935sm7178594ood.15.2023.04.12.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 08:27:35 -0700 (PDT)
Received: (nullmailer pid 2465553 invoked by uid 1000);
        Wed, 12 Apr 2023 15:27:34 -0000
Date:   Wed, 12 Apr 2023 10:27:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH v7 2/8] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/V2L DU bindings
Message-ID: <168131325440.2465494.3673756262949452214.robh@kernel.org>
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
 <20230411120810.368437-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411120810.368437-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Tue, 11 Apr 2023 13:08:04 +0100, Biju Das wrote:
> Document DU found in RZ/V2L SoC. The DU block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.
> ---
>  .../devicetree/bindings/display/renesas,rzg2l-du.yaml    | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

