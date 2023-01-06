Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDC865FE08
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 10:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjAFJex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 04:34:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234277AbjAFJeQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 04:34:16 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74D0745A7
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 01:26:20 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id co23so740134wrb.4
        for <linux-media@vger.kernel.org>; Fri, 06 Jan 2023 01:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00ovxUcdrvzBgcszRaJRsp1UyeXIU5ahV56jfAfhc2A=;
        b=moa4pveZtgCrdXbBV28OT5ahDxGuq0BahvViEGtueYRXVsyF0rktw1qJLMpINJZjfu
         Ylme/pEFBEgY01yO668RS9YXSRp7dVke1JQFyReh1m0FzgclPBWAscMh2LeSWtcazEMA
         u0xTJ7GO3sF8pJF9URiOyzILYAaAbjqmpVIkSvX/CdENSPxxTcAKEbVbl4IPWTj4qO3A
         7WySrNWhYHYwczOokUL8gIJ1ZZFdoxQhXDP9nNvOi4lBWDONAJp6tHWwspl9ZDLb/wwP
         Y658ET5vHVrC6Ua8xkC8aVdCsqcUdAFEardOaqJCLPNuQmEmDsvgOkIHETb8ZLAIC6Oj
         INNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00ovxUcdrvzBgcszRaJRsp1UyeXIU5ahV56jfAfhc2A=;
        b=rSPO5kCR5//1fh0TvEBEK6RAGuezEOIa+9zhkPYB2H2NMpkApfjwhpBj6CQSVpwyR4
         lvLfbm0HurMIvyMZQFfkcc+nvQpYvLtGoeYhVrKxUYYsf6laYrqz8liT2FDG24lPB5m3
         3dgAUF8UJVOeJfvEaBYyoumsB0OpN+LrfGhWRKazOCWG5JOzDs7SaNP52xsyaaHqBUK9
         oODTPDhhaH0kk8mVe8g/kkBu7cu4pca2v5607AvhZNVK3ELzRzURNC7ohLLNPAdjsP6R
         oVNeX1qWNS7M0NUX/tWEslbZ6QB6+GQAObOSmc3ftdKMB8zUR8HoJ+q7+iQfZ0YsN/tf
         tH6g==
X-Gm-Message-State: AFqh2kpfb9ScmjPkvDfEAfPpgYM9JgGl0aedkWB+swed1eqtAj10yjB6
        U2E0OajF7a3TjpqqvgsEDBWhtg==
X-Google-Smtp-Source: AMrXdXtBGJChVEc5HyyR3QgGaX0OGs5j1J1VcFTM8P6VkZpzGQpoxtJkU/+syCpiP1IQz3HEbEupBw==
X-Received: by 2002:adf:ec4f:0:b0:27b:a73e:33ae with SMTP id w15-20020adfec4f000000b0027ba73e33aemr26336398wrn.8.1672997168305;
        Fri, 06 Jan 2023 01:26:08 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q14-20020adff94e000000b002b065272da2sm631667wrr.13.2023.01.06.01.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:26:07 -0800 (PST)
Message-ID: <f6bea62d-da03-e869-28fa-2bd2e0d3bfbc@linaro.org>
Date:   Fri, 6 Jan 2023 10:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: media: Add schema for OmniVision OV8858
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20230105172320.133810-1-jacopo@jmondi.org>
 <20230105172320.133810-2-jacopo@jmondi.org>
 <4a3f0fc7-4723-919a-ed8c-59e364d55c6f@linaro.org>
 <20230106091508.asjayi5ic2dz6vrg@uno.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106091508.asjayi5ic2dz6vrg@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/01/2023 10:15, Jacopo Mondi wrote:

> 
>>> +  - port
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/pinctrl/rockchip.h>
>>
>> Drop, not needed.
>>
> 
> I need it for the definition of RK_PA4 and RK_PB4.
> 
> The example fails to compile if I remove it

Ah, right.

Best regards,
Krzysztof

