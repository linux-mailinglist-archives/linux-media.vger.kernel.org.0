Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDDBF56FB9D
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 11:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbiGKJd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 05:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiGKJdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 05:33:03 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF2178DF3
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 02:17:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t25so7665052lfg.7
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=O9pA4QW8Wg4am71zXXwdIORxiysBsh5kiV0REk5bPqw=;
        b=ncqWatVkrA0wTgIFctkGGEZNOqpRw8XQ/Nv46q2D1Y0Q3IOOos2jlCFkmWorauW2fr
         y/tgjB3IjohMlUiQNkHKt5XBlQqSFHsjWwDQFb01lSJLpu30eq3cKScgeSwoCAapp25K
         0PFOhUlObNx4nGel+WdFSyYpeu99xE8EJc5Kt5V8I75GtRsOOnmIvMTuRS8/Hmcb1mHY
         CO4b2HqTED0Ei97ppL9GZsArc8MqwOOQK55n8LqKcYnYzn5cJ+3evLxOxlTlH6LV38/g
         LjJK6MUBZ352ti9IN35s/oNl1EFKzPRsnFACK7OxHG1fkhRo/9F3H97LF8anSrVMblve
         x69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O9pA4QW8Wg4am71zXXwdIORxiysBsh5kiV0REk5bPqw=;
        b=UyKSd1lFgESXTKIb/V63o3kGNmG/H+IJzNtYj9bMSyW0X77Mj6QphRSz/2cm0nwWPw
         c9FKRmeLvWS7WqH3vkwy2PNT8/qd32WaI8s/75Od9da+QoGFb1nRLHvx7dvOW54chRwb
         i5EPyCsoJLjGWJ2FMkbDX4vAoEbr4zPVUXRVthSanwBrujg5CsT8cxhHJLE/kgDI7aXE
         sMHBwj9S+R0CnxuZ92xWuCMv/0G0+vvgh4qoqaX9bxT9GCYQ4LrhGLPsT3h3zE4ZqtBi
         J93TYVjTeX1IuCR9Tk9VG0J+9yIR01Lk1CaywfjKPa6ilxEkNS6I1eFsY+JSgk9A2CvA
         EKIA==
X-Gm-Message-State: AJIora/1Pvh2NgEixv9PMUBDfRV+ENy3vIllW/qsWmJZdYwOKNUW7mUm
        nar3Tr+NCkVCTvSdTs9OgNDanw==
X-Google-Smtp-Source: AGRyM1uMswXCIxYDlP0xBp3vz08nPfOP54CpTs8PCepPdQ3GHZNuiHFY2K+e7LRxuVfS0cgSolO+2w==
X-Received: by 2002:a05:6512:3d27:b0:489:e623:f244 with SMTP id d39-20020a0565123d2700b00489e623f244mr1029177lfv.236.1657531063764;
        Mon, 11 Jul 2022 02:17:43 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id x5-20020a056512078500b0048159b43083sm1437030lfr.201.2022.07.11.02.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 02:17:43 -0700 (PDT)
Message-ID: <16dea5e3-0603-9cd7-11c8-15b3e4598fa8@linaro.org>
Date:   Mon, 11 Jul 2022 11:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] media: dt-bindings: media: ov9282: Add power supply
 properties
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
 <20220711081639.150153-5-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711081639.150153-5-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/07/2022 10:16, Alexander Stein wrote:
> Add regulators for each power domain.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/media/i2c/ovti,ov9282.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> index 285f8c85f253..9abfaabd373a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> @@ -39,6 +39,15 @@ properties:
>      description: Reference to the GPIO connected to the XCLR pin, if any.
>      maxItems: 1
>  
> +  avdd-supply:
> +    description: Analog power supply
> +
> +  dovdd-supply:
> +    description: Digital I/O power supply
> +
> +  dvdd-supply:
> +    description: Digital core supply
> +

Are all these valid for both variants/devices?


Best regards,
Krzysztof
