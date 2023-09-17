Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7657A34F1
	for <lists+linux-media@lfdr.de>; Sun, 17 Sep 2023 11:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjIQJhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Sep 2023 05:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233239AbjIQJhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Sep 2023 05:37:18 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77310132
        for <linux-media@vger.kernel.org>; Sun, 17 Sep 2023 02:37:11 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso461977266b.2
        for <linux-media@vger.kernel.org>; Sun, 17 Sep 2023 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694943430; x=1695548230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TRnY8GMK7JbIBRWD7UTPElCZmD0OCc5Dpqki1V7Q76Q=;
        b=rPQHHwanp0zjSdwhkAqL8xm/DJCq6NrJ1aUyT38OFJg1wUDIuRP5K2L9h9xTgig1PQ
         BDIBFzbP07ak53pABqzEA9wavOh0jbdAkAJNozMrr34qEYWLD2RL8Rd1pnePRpMlvmcb
         iy0df/uPbkzEXUlHYQ3CXVauDUr0UtC7IzFKILEQlLNAxf/VPGkcCb1N3/Krc3nIGQV9
         ucBefbFC5mB7BybIibKq9hrzabyPupkaFGTwDQqPqK1srzyhOv4VC6uEULbcW54XDJrj
         1j1/GrhIBFsQsgdou1wd7hhmNDaIQOYcgJ0d2EM9BQPgF/UW1wRXpF3QTMlZhifWHE5m
         h0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943430; x=1695548230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TRnY8GMK7JbIBRWD7UTPElCZmD0OCc5Dpqki1V7Q76Q=;
        b=pksQ3JhE0O32+Sk7uQ0+YfHn2WwkKPYX3iYBIGXC6x0cFZiv1cEXkqyuU/vwJ1yAxq
         zDjK74oQ8aDKh0fVaJCruA9KfsOsk/2nVlUnXcdwiDBZA4zBRCh1I0QTNgug/dYbdKWN
         uKMdrKp2+E6Hz9QGMCpB3dz44E/dDDV/6i/to7JjW8JivVdGtsKg+ge9RomfCtZaRRwW
         0wAjkVfpERgmQQmFP1ZXZ2luLUk7oqSSvRfZQ4eRWY/1nNU2iVzlQs2YB8Z2pDszL2lc
         4GmgKP+DnWJRI1/kj2awkyLgMjgIMzOpw5eiHfEH/7MC6xr+Hccxd3a96Ox6qLTepqIO
         gAhw==
X-Gm-Message-State: AOJu0YyAJGKMNfyGfanZyWfa3nqBMPuw0rgkOjPyeK/jwj2IlBYfsdnF
        0fFHpzmGkTDwHqu0Ocrvo8DRkQ==
X-Google-Smtp-Source: AGHT+IE6sz092/Zgj1jNPTX+Ayszq0G7etA9nykgSvCKOnoNdQWH1EbFFTgEM3d2wKY13yRAusb2Cg==
X-Received: by 2002:a17:907:760d:b0:9ad:e99d:4e4d with SMTP id jx13-20020a170907760d00b009ade99d4e4dmr3417146ejc.50.1694943429916;
        Sun, 17 Sep 2023 02:37:09 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id cw17-20020a170906c79100b009a1a5a7ebacsm4717879ejb.201.2023.09.17.02.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 02:37:09 -0700 (PDT)
Message-ID: <22bc83c7-17c3-f8a0-b1de-5d6b2e1e29b2@linaro.org>
Date:   Sun, 17 Sep 2023 11:37:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: media: i2c: Add ROHM
 BU64754 bindings
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230915165946.4183839-1-kieran.bingham@ideasonboard.com>
 <20230915165946.4183839-2-kieran.bingham@ideasonboard.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915165946.4183839-2-kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/09/2023 18:59, Kieran Bingham wrote:
> Add YAML device tree bindings for the ROHM BU64754 VCM Motor Driver for
> Camera Autofocus.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---

...

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - rohm,bu64754
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:

If the supply is not required, how the driver gets any power?

> +    description:
> +      Definition of the regulator used as VDD power supply to the driver.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        lens@76 {
> +            compatible = "rohm,bu64754";
> +            reg = <0x76>;
> +            vdd-supply = <&cam1_reg>;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..f43e0ffcaf56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18570,6 +18570,13 @@ S:	Supported
>  F:	drivers/iio/light/rohm-bu27008.c
>  F:	drivers/iio/light/rohm-bu27034.c
>  
> +ROHM BU64754 MOTOR DRIVER FOR CAMERA AUTOFOCUS
> +M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git

Do you have push rights there? The git entry is for entries where you
maintain, which means: you accept and apply patches. This does not look
like the case, so copying subsystem Git entry is pointless. Subsystem
maintainer defines the git tree, not you.

Best regards,
Krzysztof

