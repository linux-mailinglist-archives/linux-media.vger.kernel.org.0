Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 433F9784571
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 17:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237062AbjHVP1Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 11:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbjHVP1X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 11:27:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E101CD7
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 08:27:21 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977e0fbd742so584358766b.2
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692718040; x=1693322840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Op230pvRSYsZ/RCsUIoSigOSgDlSJoxapZ0NpWgEc8=;
        b=a5Pyc7meaT7bUZNBNSEAbCrPrImd2qakaCdtSTvL7R32y3VCU7/RqfFlZ84xGQT1rC
         bDT1L8JY/bOQbsKLVDO4DMdIjrAeI6lkk+ocbpBHVkAp0Bo8IdpoXoJo9yaxtxcPtwkJ
         vGhLgXc906wJQwaJhOa529CPHwHoif0oIRtt9NphvFLYTOFPAuG39F5Wy5jI49R2RSFt
         5ZTUD+rd5YyKxNjg9BM9zCu7979wP7pIRSxRORMpIdlmxuO74pAEOexJadYadXhGGU0N
         JV1ljeEKlyPfTUbRINM9tNazPrNe/5G1wUTKTCBcGdlDLejc647+IFhfMOqdmNYn3jqF
         Iv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692718040; x=1693322840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Op230pvRSYsZ/RCsUIoSigOSgDlSJoxapZ0NpWgEc8=;
        b=dZG8P9TuWdXHKTXms3GIg8Lq7ZXNrNMkkgymPa9UYB8F0I4IlQz7mQWJaMx8r0g+qD
         trK1CrqyyalO21UE76yxbRmwtZw8fL6Y7cHxyjfLouuUNeyoMoI54AP54Rd7KPozyUqq
         P36x8boBLQ0YFuSoYrf51KlHACXHL2dD0qJjUrYXr5+LDmxYPb1s9/VzM9esYy7AZ5al
         rquYjnGg/LWaRXi7eP9pyp+ZM+sup76inMAb/uJ5/cd5+kXsISKptrId7mHRwp4IoT6D
         eaqTblMGYZB/Iwwzn2Szq4KdKQiBC1GK6fmpI+7pSBDyZUldl0gK2dpFBUvH8rXTx2f7
         2rFg==
X-Gm-Message-State: AOJu0YyttNUBE7snqht9Vec3M8wurCncKUU78K5rQm10q5BaIdl7swue
        SPL+9+GeEbtp3TzEnPuhXcEj0Q==
X-Google-Smtp-Source: AGHT+IGtQ1rszKdn8JWgP52nGNDE/tvQ2ym2GO6OlSPG08iLWGxnzIuVMaG61l35EbHhRpao7aNxKQ==
X-Received: by 2002:a17:907:75e3:b0:99c:ae35:ac0 with SMTP id jz3-20020a17090775e300b0099cae350ac0mr7579848ejc.61.1692718039499;
        Tue, 22 Aug 2023 08:27:19 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id gq6-20020a170906e24600b0099c53c44083sm8325011ejb.79.2023.08.22.08.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 08:27:19 -0700 (PDT)
Message-ID: <0fb06b21-028a-b0c2-85a3-ed7e90d2167d@linaro.org>
Date:   Tue, 22 Aug 2023 17:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/2] media: dt-bindings: media: remove nokia,n900-ir as
 pwm-ir-tx is compatible
Content-Language: en-US
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc:     Sicelo <absicsz@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
References: <20230822145644.213589-1-sean@mess.org>
 <20230822145644.213589-3-sean@mess.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822145644.213589-3-sean@mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/08/2023 16:56, Sean Young wrote:
> The generic pwm-ir-tx driver works for the Nokia n900, so nokia,n900-ir
> can be removed.
> 
> Cc: Sicelo <absicsz@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org

BTW, There is no single need to store automated output of
get_maintainers.pl in the git log. It can be easily re-created at any
given time, thus its presence in the git history is redundant and
obfuscates the log.

If you need it for your own patch management purposes, keep it under the
--- separator.

> Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Pali Rohár <pali.rohar@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Timo Kokkonen <timo.t.kokkonen@iki.fi>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  .../bindings/leds/irled/pwm-ir-tx.yaml        |  4 +++-
>  .../devicetree/bindings/media/nokia,n900-ir   | 20 -------------------
>  2 files changed, 3 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/nokia,n900-ir
> 
> diff --git a/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
> index f2a6fa140f38..dc19b6475ba8 100644
> --- a/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
> +++ b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
> @@ -15,7 +15,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: pwm-ir-tx
> +    - const: pwm-ir-tx
> +    - const: nokia,n900-ir
> +      deprecated: true

Please test your binding before sending. You miss oneOf.

Best regards,
Krzysztof

