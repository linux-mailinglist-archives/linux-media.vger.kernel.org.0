Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3133F65A635
	for <lists+linux-media@lfdr.de>; Sat, 31 Dec 2022 20:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbiLaTGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Dec 2022 14:06:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235650AbiLaTGN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Dec 2022 14:06:13 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3827A28B
        for <linux-media@vger.kernel.org>; Sat, 31 Dec 2022 11:06:12 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id cf42so36224298lfb.1
        for <linux-media@vger.kernel.org>; Sat, 31 Dec 2022 11:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/NfbFQvWMrg19C59QAiBdh289D1/4YcCn92kh7icEkU=;
        b=tGBH/FgFFrNA8or+SERewmHOA01oohuGeeYqs4oLy5LJ4tQPrcukFluDGrmBKNwR+y
         wlXi1WF/fNdb3yaoq6w3WdKlPmslt5WDbNDVkiemJVt9C35CuzxEQ8hxwySU45K9M/u1
         5zjB0jghIdm1naf6Ax8YjYXnZEdzM4NzqzQKk5ZxGdVcQOlB7KcJzf4JKKD2UeOPQLYR
         8QQdmUc1QKtyG5qHm4m+Cyr9DSHvv6fe70k6eHSA1LQARzQLPzSGSqVEkfZ5DpiT5n9g
         T1lGLtbIS2QN150DSZBHn/jkLcYQ1rICdBLxHVdfIcHskiVceNntvulCChhPPHHeL6k+
         diqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NfbFQvWMrg19C59QAiBdh289D1/4YcCn92kh7icEkU=;
        b=n2Ehhhs1uXFU9flexFj1OAzpYCgwYxxb4viriSA08e/weN5SGPHG4cEZ65nE/PBVKe
         nujPiXgYg8uvLnB7Q6Zm5ipUgkpJHPr6zIFJl59JCYVNvvTroZRPwxM5dTxGxjvuB+hL
         OzytFHyHEb0t1PoM9o5OFv9+O0FO/FI4yDQtF9WjJDzzNofS5vPJDpKARPvIutCxgvU9
         Eem1hSUz5/xy6I7XWpIQqtt+CQil5YUl4DaRfZMWtkqwz3w6W/e4/161Wdxomrz/bx7i
         84gXmoX0RYNsjs9YVIpu8fcuMp+P34xHmiCej7yZleIMXfYfOu4EDxEM9JHUkIJHxV6h
         Prcw==
X-Gm-Message-State: AFqh2krbfkCJZtb+8leXwKhgKUrpF4oRdJkl/ldasetDDYpbj9/H1dbN
        /FBmizdom3L+oPcAMY5zXYIu1A==
X-Google-Smtp-Source: AMrXdXtZojB28H4lrGmOvJhUhvTd3BsQ/EYuphNlQHEHDYK4kVuJlwOgVJpbalKsqxkDm0RfEyNZ/g==
X-Received: by 2002:a05:6512:2385:b0:4b5:90be:33c8 with SMTP id c5-20020a056512238500b004b590be33c8mr11051695lfv.48.1672513570654;
        Sat, 31 Dec 2022 11:06:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j18-20020a056512109200b00498f67cbfa9sm3941314lfg.22.2022.12.31.11.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 11:06:10 -0800 (PST)
Message-ID: <ec51892f-d825-48ab-ec11-377e8d137e4a@linaro.org>
Date:   Sat, 31 Dec 2022 20:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] media: dt-bindings: cedrus: Make allwinner,sram
 optional
Content-Language: en-US
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Ripard <mripard@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-3-samuel@sholland.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231164628.19688-3-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/12/2022 17:46, Samuel Holland wrote:
> Allwinner SoCs can remap some bits of peripheral SRAM to a contiguous
> range of addresses for use by early boot software. Usually the video
> engine's SRAM is used for this purpose, so its mapping must be switched
> back before the hardware can be used.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

