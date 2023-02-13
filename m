Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299C369404C
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 10:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjBMJCi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 04:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjBMJCf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 04:02:35 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E7E13DE1
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 01:02:32 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id bk16so11313433wrb.11
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 01:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AK8Y6Fm5XKwk7gPcZzE5f1og+LrHiF4ktNQUsy8l3vE=;
        b=fqEgCtrWa3hdVfARyzC6f1kDypnxSvn1mbj/H6dz+4XyD5ueEaTZK7Q25R871Ziyf3
         w9gCzTaCI3g9mV6nIvKeBGZiSr/92TjknD5CrWrGgM1fGKZnjiU/pYBJqpzHOjclTJ5U
         Vj+kiHJ34fCWCZUIYa8GPXXVl/LshNpDwKaSDkhVAlukB45ZtKefOtVNl6YQT+YMaBlo
         GHbtrq8MWeG7Cr18XaW/gtcbdZV8gqM3GfU7NBpodpbTlCRBt96doMt25I15BToS1BW2
         NyCf+UYZnWuKkAGUMR24IYbKK8Wv9Z6hiKcdbfV15RfLTnYandfUKc8qFCGysmhQ+I+g
         RjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AK8Y6Fm5XKwk7gPcZzE5f1og+LrHiF4ktNQUsy8l3vE=;
        b=0lgsMQ5I+ueTCsAXvOemhD7vIwxV+1FU2QxdEHAOBizVhIG/6fj3WzwtnoV+buxB6V
         AYE02y/2kiEltMvmgrPbO9l5XfkO4hleY0NARwRIzd/UvDgNEYU4RfHNsn9F8RgAoeO6
         28PrAAlmrGlo8lARan7zXs9nyCP1baeVyxJ/OBmTC4ScTgFMH3HTzrywxLU9wTMtbl2L
         SFHbSGY8E4MWyus4YUO5ygoosN85HPVEGhQFcEtKcNDyoi5kDRNfQoEw72J2LKWhniKM
         MpHMvznhHKfeD/oq4wgH/AtFBeuvF0ynmGBRGNr5VNJdMzRjrNe50VmC/idj14pD5OJf
         W/iA==
X-Gm-Message-State: AO0yUKU9RNlOxke5VuK11F5g28EHgOHTO+xQp+D8ZqopOqNCJk1kd83R
        BTkHfjqqZueyPm2tRT6lhUWWrw==
X-Google-Smtp-Source: AK7set9VRpSFPmL3b5CtlTUVK/Lj35F0ylV+/NTbNkwaF+rNoMmrCOKieLBW5bt2W4zDB7U8dqZ8Lw==
X-Received: by 2002:adf:b64c:0:b0:2c3:be89:7c2b with SMTP id i12-20020adfb64c000000b002c3be897c2bmr12449633wre.14.1676278951403;
        Mon, 13 Feb 2023 01:02:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8? ([2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8])
        by smtp.gmail.com with ESMTPSA id c8-20020adffb08000000b002c406b357cfsm9969937wrr.86.2023.02.13.01.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:02:30 -0800 (PST)
Message-ID: <a0e11df2-576c-da61-a583-81528cb77d20@linaro.org>
Date:   Mon, 13 Feb 2023 10:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: media: meson-ir: Convert Amlogic Meson IR
 controller binding
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <a91e3a8e-7ef1-70bb-f6be-01a9a90c0e05@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <a91e3a8e-7ef1-70bb-f6be-01a9a90c0e05@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiner,

On 12/02/2023 17:51, Heiner Kallweit wrote:
> Convert Amlogic Meson IR controller binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   .../devicetree/bindings/media/meson-ir.txt    | 20 ---------
>   .../devicetree/bindings/media/meson-ir.yaml   | 45 +++++++++++++++++++
>   2 files changed, 45 insertions(+), 20 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/media/meson-ir.txt
>   create mode 100644 Documentation/devicetree/bindings/media/meson-ir.yaml

I've already posted a patch for ir which is reviewed and ready to be merged :
https://lore.kernel.org/all/20221117-b4-amlogic-bindings-convert-v3-4-e28dd31e3bed@linaro.org/

The only remaining bindings that remains to convert/document are:
  ['amlogic,axg-audio-clkc']
  ['amlogic,g12a-audio-clkc']
  ['amlogic,sm1-audio-clkc']
  ['amlogic,g12a-tohdmitx']
  ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
  ['everest,es7154']
  ['everest,es7241']
  ['ti,tas5707']
  ['linux,spdif-dir']
  ['gpio-fan']
  ['pwm-fan']

Neil

> 
> diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
> deleted file mode 100644
> index efd9d29a8..000000000
> --- a/Documentation/devicetree/bindings/media/meson-ir.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -* Amlogic Meson IR remote control receiver
> -
> -Required properties:
> - - compatible	: depending on the platform this should be one of:
> -		  - "amlogic,meson6-ir"
> -		  - "amlogic,meson8b-ir"
> -		  - "amlogic,meson-gxbb-ir"
> - - reg		: physical base address and length of the device registers
> - - interrupts	: a single specifier for the interrupt from the device
> -
> -Optional properties:
> - - linux,rc-map-name:	see rc.txt file in the same directory.
> -
> -Example:
> -
> -	ir-receiver@c8100480 {
> -		compatible= "amlogic,meson6-ir";
> -		reg = <0xc8100480 0x20>;
> -		interrupts = <0 15 1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/media/meson-ir.yaml b/Documentation/devicetree/bindings/media/meson-ir.yaml
> new file mode 100644
> index 000000000..8d3c7acfa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/meson-ir.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/meson-ir.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson IR remote control receiver
> +
> +maintainers:
> +  - Heiner Kallweit <hkallweit1@gmail.com>
> +
> +allOf:
> +  - $ref: rc.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - amlogic,meson6-ir
> +          - amlogic,meson8b-ir
> +          - amlogic,meson-gxbb-ir
> +      - items:
> +          - const: amlogic,meson-gx-ir
> +          - const: amlogic,meson-gxbb-ir
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ir-receiver@c8100480 {
> +      compatible= "amlogic,meson6-ir";
> +      reg = <0xc8100480 0x20>;
> +      interrupts = <0 15 1>;
> +    };

