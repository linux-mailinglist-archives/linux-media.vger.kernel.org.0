Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9124D5DD9
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 09:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241401AbiCKIuv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 03:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238171AbiCKIuu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 03:50:50 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23559119844
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 00:49:46 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 84EAE3F799
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646988585;
        bh=Hto2eNLjgkxQ+DNxH6aRu091JeyNTpUnmR0JPknlw0Q=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=TxaE1cGdota1p9BiL5iFCuZl7vgAusUbv3Xgtcxo6cQxSFK9JJU8tFyZXV4XcphS5
         /CKj47N4gN4EAq19IEXdR0BCgpyc0wLbo+1WdFu9ESs+7ZwneKwtApSrZSZeuyznY4
         K1gS9Ts+Jga4d6hD7cz9ltCQvx1qsWG5ur3FWj4i1iYKqy+pRp+QJ216l2LX7IWTyg
         6R5dlqhxYYEWk+K6tMmyteHt5cwL3eu1IT8yQji4C8Gdda3Ky2H2c5g5+gcbb4OyI8
         ypYFizDy6kjwHKNJiivDJebfbdLR1NLgpp+c2/xf2rXv+ZTE7JJr6Xv7ymEcw83LOZ
         ZfTl2/2thB+MQ==
Received: by mail-ej1-f71.google.com with SMTP id x2-20020a1709065ac200b006d9b316257fso4583029ejs.12
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 00:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hto2eNLjgkxQ+DNxH6aRu091JeyNTpUnmR0JPknlw0Q=;
        b=oxf/DJSLbpSze0GyBPOMCVJHWqncDog7uudimG3oSexPElDmBr4AQuRUHC6D9vSorv
         pXp1uZKp7f3VneVdW6J8uiRT2sep+DQ4PztnZW7EP2uNLqOZJ2YqR0dhZjC8ZSRrz+7V
         VFspaSsjsK/Z77HdqIVi9D//qbgU3R/zL41NZumwR+OVnn2AHqQ4oxhaZ79qYM+/qSpy
         blcR8DDvGjg6jtaqaEZb+DGS4CLAtM2VOWZYZUvA9pxGV8MS1Q8SPFcId/xujmAgSQ6l
         A7Yty6yr7LQ2wKW50D30AfKE/TsZZhwlsr3CL1+GgHHkouCbH0S2/I8be/SpG2aQCdcr
         5NIQ==
X-Gm-Message-State: AOAM532qJ1DeaKEa9u/3iGgKEltWjY7xtQ6ahZCASYZlRWqAFRMvIr1t
        3zMsrxkXJM/xwwa5f4ZwKXfCnIOTCpzCLsdj0N+cmLAY71t50+qsjXPznJxmaIJA0keH6rfF6sd
        sKrwLoucB0zjZZJHekLzFaa0ydmsnNoJPXPmxWgfx
X-Received: by 2002:aa7:ca04:0:b0:410:92a6:1a9e with SMTP id y4-20020aa7ca04000000b0041092a61a9emr8018180eds.411.1646988585132;
        Fri, 11 Mar 2022 00:49:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygByvpy0ByjNqXZcfBLvaBqob0aS7+NAPjBN83jgxmtgHowoV+0HMZzZZu5rF7YNdSldDbQQ==
X-Received: by 2002:aa7:ca04:0:b0:410:92a6:1a9e with SMTP id y4-20020aa7ca04000000b0041092a61a9emr8018159eds.411.1646988584870;
        Fri, 11 Mar 2022 00:49:44 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id b13-20020a056402350d00b00416ad3dbc54sm1833790edd.0.2022.03.11.00.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 00:49:43 -0800 (PST)
Message-ID: <6d02349a-4ba4-5581-4dfb-b0a60567c47f@canonical.com>
Date:   Fri, 11 Mar 2022 09:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220310162814.22234-1-biju.das.jz@bp.renesas.com>
 <20220310162814.22234-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220310162814.22234-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/03/2022 17:28, Biju Das wrote:
> Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> similar to VSP2-D found on R-Car SoC's, but it does not have a version
> register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
> 
> This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
> these differences.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * Changed compatible from vsp2-rzg2l->rzg2l-vsp2
> RFC->v1:
>  * Updated commit description
>  * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
>  * Defined the clocks
>  * Clock max Items is based on SoC Compatible string
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-20-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/media/renesas,vsp1.yaml          | 52 ++++++++++++++-----
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
