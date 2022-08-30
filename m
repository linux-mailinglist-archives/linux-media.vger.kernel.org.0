Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 434E95A5D0C
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 09:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiH3HfR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 03:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbiH3HfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 03:35:10 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B911D308
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 00:35:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w8so5290745lft.12
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gTntED0DP1sqO6UctXOpy2WMlYrZljqXf0dK/YZ3YVM=;
        b=CZITBVNxKAYIIO34j5R+aR23ubGOggpQpFvIOT+M/rgJI4PZOohDhNq0neWdZLkTAT
         qcmEOKjTmGB/YHlbyW0P+nMSQe6yOwKZeUdmD27ug3Ye+vV9l38UqtKXksC/kIQeQEKv
         IXt8wfGMrRU7ehWvNYDvg/2GciDo+zelBCsa/dPOV4McCVUC/5lCf7j0YF3DJSrq1CRM
         2XlUJctarxCoNW/NIs0l92AL0MX1OwF7bM3cQ4LOQndEyriz3nbcbPMJFCVFwqK3Xk+X
         09WdvrXnXqGs/oKlF2Hsexqxf9DZvJ2Qlkoq2qAxuI/+2qPFPSVAfy+VqBYYaPgmLr3A
         Mllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gTntED0DP1sqO6UctXOpy2WMlYrZljqXf0dK/YZ3YVM=;
        b=RTGph4TJASR2QaXWc6k2ICB36ruCQV6H0Dkx6Bu8PqPN7E5Ql0oGN5cbal3llU465f
         EOyT4xX2R9GFaaW9Nf2kU6uY2XMb/dRq/3T1pzY1Bl9P4rDGUmMJ2zoCJWlnokSVlIxf
         wtJld4STXPRlkF3LSalBe6b3VPfJkmvhUEezoh5aqy4cRq6FtYPIni23jqnv1LdcQpgD
         9LHmRoccWsaUHIXscPL23/86q+5ThvpOmg93EI8PJ6Sfd+gNVOMHWQYdqOBz9uH10ZiK
         8NZw6raWtZIyFs1Z4HZ7l7n5hau4oRwpkNTtALq+PGGcxAT0fmz614ixhMfm0JZFMfGN
         CgYw==
X-Gm-Message-State: ACgBeo0qEjueukkNv7G+Um1klmo7/ASJE0L9uE/oHMlXtxkgVRDzsT2r
        uutLhKcP8mxfVxQOqJ4sjR7GYg==
X-Google-Smtp-Source: AA6agR6wU6i7dG5vS6bvdRf7eOpF8Byd29gR0rg46o6T4bMfIwZHnjcLHMS/HjYoMi6ca3ixG7rv/Q==
X-Received: by 2002:a05:6512:3f92:b0:492:f469:f8ff with SMTP id x18-20020a0565123f9200b00492f469f8ffmr6691423lfa.47.1661844908280;
        Tue, 30 Aug 2022 00:35:08 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id e1-20020a196741000000b0048a7c86f4e7sm725981lfj.291.2022.08.30.00.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:35:07 -0700 (PDT)
Message-ID: <812ca17b-5e51-b974-16aa-2180d07b4be9@linaro.org>
Date:   Tue, 30 Aug 2022 10:35:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] Added platform module alias for the xiic I2C driver
Content-Language: en-US
To:     "Tuma, Martin (Digiteq Automotive)" 
        <Martin.Tuma@digiteqautomotive.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-2-martin.tuma@digiteqautomotive.com>
 <51e77545-e029-69f3-f5cd-f2fdf8846582@linaro.org>
 <AM8PR05MB723552BC9CB2FE2FB23EF273FB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM8PR05MB723552BC9CB2FE2FB23EF273FB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/08/2022 14:47, Tuma, Martin (Digiteq Automotive) wrote:
> 
> 
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Sunday, August 28, 2022 4:47 PM
>> To: Tuma, Martin (Digiteq Automotive) <Martin.Tuma@digiteqautomotive.com>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>
>> Subject: Re: [PATCH 1/3] Added platform module alias for the xiic I2C driver
> 
>>> On 22/08/2022 22:47, martin.tuma@digiteqautomotive.com wrote:
>>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
>> Thanks for the patch. Empty commits are not accepted, so instead you
>> should explain here why do you need it. In general, your change should
>> not be needed, so please explain in detail why do you think otherwise.
> 
> The reason the alias is required is that without the "platform" prefix, loading
> the xiic module does not work properly in the mgb4 module. I can not explain
> exactly why as my knowledge of the module loading mechanism in linux/modprobe
> is quite limited, but that's how it is. The mgb4 v4l2 module requires two modules
> that are defined using MODULE_SOFTDEP() to be loaded prior to the mgb4
> module - the Xilinx I2C module and the Xilinx SPI module. The SPI module already
> has the "platform" prefixed alias and loads fine, while the I2C doesn't and does
> not get loaded without it. So I added the alias to make the loading work.
> 
> I will add the info that the alias is required by the mgb4 module to the commit
> message the next time I will send the fixed patches, thanks for pointing this out.

Driver matches only by Devicetree, so instead of this patch you rather
miss proper DTS.

Best regards,
Krzysztof
