Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E205B0EC0
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 23:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbiIGVAW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 17:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiIGVAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 17:00:21 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9D57B7B9;
        Wed,  7 Sep 2022 14:00:20 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-127ba06d03fso15537770fac.3;
        Wed, 07 Sep 2022 14:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=M8GODblblJ7lgQjEptGgaamLLNOUHZVWWN4JggoaBsc=;
        b=vgflpSXdQ7ULcABk3+m+j3VDri5+itIEGQ1E0qXe/6RCKtMZtlRnjU5YtNu5oGtjET
         4vj6GcoiybqqSOOEoSVfDT+m4JPAsr3V7733FXr60zVAFW2ydORtsmYViOBWEhyODmZ9
         cYB3zw4fyWQKQvP9uXhIAaM5Sx/LxMvZa2b2QIk9/dicJbhLaK6BUOzcAk7pGMZtyhFR
         DhyDGcfOPP+g/KUSgptmTOkxgVqrNoQj+/zDyKESEYUqG1Wb77ssf8KFV5slymAHfyd/
         p1klmKLzgIqkhamxcI++3E0hCh+6YUwRlyi6dKArhyW8D7b70qZRGozMbH7QPslM54Nv
         Xvvg==
X-Gm-Message-State: ACgBeo3AA712qn+RgEMGbRmZ3arSTB0egieqjRIrYl9gCP6LQGPMLk6I
        l7QKNu2UR5zoKsNupnJofQqp3yVxzg==
X-Google-Smtp-Source: AA6agR5LcayUP4PBQusbKEeF/pnPOazQkEVeLrrb4JKL1wQbwL2sI1XBeIHi0Ur69fGhu53oWU7QPA==
X-Received: by 2002:a05:6870:218e:b0:126:9dc3:9666 with SMTP id l14-20020a056870218e00b001269dc39666mr158267oae.73.1662584419332;
        Wed, 07 Sep 2022 14:00:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t8-20020a4ad0a8000000b004357ccfc8bfsm5408629oor.7.2022.09.07.14.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 14:00:18 -0700 (PDT)
Received: (nullmailer pid 336368 invoked by uid 1000);
        Wed, 07 Sep 2022 21:00:18 -0000
Date:   Wed, 7 Sep 2022 16:00:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v3 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/{G2,V2}L FCPVD bindings
Message-ID: <20220907210018.GA336305-robh@kernel.org>
References: <20220902064628.59001-1-biju.das.jz@bp.renesas.com>
 <20220902064628.59001-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902064628.59001-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 02 Sep 2022 07:46:26 +0100, Biju Das wrote:
> Document FCPVD found in RZ/G2L alike SoCs. FCPVD block is similar to
> FCP for VSP found on R-Car SoC's . It has 3 clocks compared to 1
> clock on fcpv. Introduce new compatibles renesas,r9a07g044-fcpvd
> for RZ/G2{L,LC} and renesas,r9a07g054-fcpvd for RZ/V2L to handle this
> difference.
> 
> The 3 clocks are shared between du, vspd and fcpvd. No driver changes
> are required as generic compatible string "renesas,fcpv" will be used
> as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated the compatibles by replacing items->enum as
>    it is just one item.
> v1->v2:
>  * Documented RZ/{G2,V2}L FCPVD bindings
>  * Introduces new compatibles renesas,r9a07g0{44,54}-fcpvd
>  * Added clock-names property
>  * described clocks.
> ---
>  .../bindings/media/renesas,fcp.yaml           | 45 ++++++++++++++++---
>  1 file changed, 40 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
