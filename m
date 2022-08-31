Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B0C5A80B4
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbiHaO4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbiHaO4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:56:22 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66BFD4BD1
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:56:17 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id br21so14560173lfb.0
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SCyouP+6XlBIEVJzdArqMLowC10PHMC5d6rCYyQLc3Q=;
        b=khlBPG3FScRMqmhJKGeU6RbWVoLVj2peo0qIArdE7o2ScRa41NdnSqa9ycoC1zLxQr
         WXxhPQSKxxsSDpN9U0j6r2hWmSiLexPKE0JS4rC1pEeEHRuN1WzUgcnATPVRGFuAXioc
         nkmr16iExjGIWuWt61Bs5+SOLivLuq0+qGDh7dz0DkIULofFteej+mo6XXBU9T15/oUN
         QK+OdsFS6ldXVJ2x8rwP+G8y1xJqdMkX7NQSaGLVgfA4w1X9fEE3VT6aVD0gsb0xlOym
         ryqQgZcag234cKbXSQ3PlgCtR8eWnxb+mf9Mi5nrG4vwcQ4F/1HSvNqhvkww/wIbnIEm
         BlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SCyouP+6XlBIEVJzdArqMLowC10PHMC5d6rCYyQLc3Q=;
        b=INflf9bNHZ1lZpXCwQbGwWB5G85zjAiZrF0Qql2O0T2uDOUU1ynXXItt7YkwBR4xvd
         VtL4ao6atpkuHXFdMFLT+iVJTBGXHIIqLTBwmvXDsrjcivyv8iv+fZ7x+ppsori8hyXW
         2LePI06rKYzpw4urhN/FLjXiWWYzIzo/fEN4SlcfPBpygX9LtEHBujKGoJeICSEDXmBu
         aZfGXqeYMaT/jbuWWEUgRI+yuP8dKq2mTxUl+XPiHt+Qrnkh7RLMHTYx3yycK7LS10YO
         ZInEQWpf9sM2/+hq+J1YWqRF5oGtN03JIxgTQyAxvvQ+1VkwgcD6vjwADe2n/g3AM9JP
         Rs+w==
X-Gm-Message-State: ACgBeo3bHLRB4S794VbzolGIJE1trcYnd7bIu6JprzJ+FsT6L7UyEy3I
        r4t9W6Yt8P9kqh7V2b3liTp2kEqjhWPyOXYn
X-Google-Smtp-Source: AA6agR4uekeH5zNMJis4elWVruQIzUdpfNW2BCDuBuHtqmFhe26+UIeCzTWXAkWiYk68HWPqeVsFOQ==
X-Received: by 2002:a05:6512:ea3:b0:494:6053:ba50 with SMTP id bi35-20020a0565120ea300b004946053ba50mr6093641lfb.91.1661957775797;
        Wed, 31 Aug 2022 07:56:15 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id t5-20020a2e5345000000b0025ddad51e48sm2021467ljd.140.2022.08.31.07.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 07:56:15 -0700 (PDT)
Message-ID: <e23b3b92-9078-3d53-caa1-bb8d8a1d238b@linaro.org>
Date:   Wed, 31 Aug 2022 17:56:14 +0300
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
 <812ca17b-5e51-b974-16aa-2180d07b4be9@linaro.org>
 <AM8PR05MB7235232C96D3F847EE5AFC8CFB799@AM8PR05MB7235.eurprd05.prod.outlook.com>
 <096ad2e8-8a54-5ca0-b4a0-0ba652a88cc4@linaro.org>
 <AM8PR05MB72357051DCC01058CC5BDCBBFB789@AM8PR05MB7235.eurprd05.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM8PR05MB72357051DCC01058CC5BDCBBFB789@AM8PR05MB7235.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/08/2022 17:44, Tuma, Martin (Digiteq Automotive) wrote:
> 
> 
>> Ah, right, you do not use it for DT platform. Then you need proper ID
>> table, e.g. for ACPI. platform_device_id table would also do the trick
>> but I don't think it is suitable for such matching via ACPI.
> 
> The mgb4 driver of course uses the propper device id table (the PCI id) and
> matches and loads fine. The problem is, it needs two other modules to be loaded
> prior to it, where one of them is the xiic module. It is used by a platform device
> that gets created/instantiated during the mgb4 inicialization. As there is no symbol
> dependency, the dependency between the modules can only be defined using
> MODULE_SOFTDEP. And for modprobe to work correctly you need the platform
> alias.

I don't know what is mgb4 - there is nothing like that in the sources
(git grep, find). Other existing devices instantiate it via MFD child
device, which works on platform devices and this points to the need of
platform_device_id table.

The commit could then indicate as fix for:
Fixes: b822039b8ec1 ("i2c: xiic: Fix coding style issues")


I also don't understand the reason for alias removal in that commit -
"none is really using it" - because at least one driver (timberdale)
uses it...

> 
>>> The fact really is, that on x86_64 and ARM (Nvidia jetson) without any specific devicetree
>>> where I tested the driver, the mgb4 driver loads properly both the I2C and SPI modules
>>> defined using MODULE_SOFTDEP (there is no link dependency) if and only if they are
>>> defined using the "platform" prefix (and the module has that alias, hence this patch). So
>>> there must IMHO be some mechanism in the kernel or in modprobe, that works based
>>> on the prefix.
>>
>> Nvidia Jetson is ARM (and not an ACPI?) so it comes with DT. Let's don't
>> mix problems. Depending on the type of your system where this is used,
>> you need proper matching. Sprinkling aliases is not the way, usually.
> 
> This is not problem mixing. You really can not expect every user to define a DT
> for a PCI Express card that he may or may not use! The type of the system is
> irrelevant here, a PCIe card has to work based on the PCI id and not some
> additional mechanism like DT or ACPI you suggest.

The type of system is relevant because from that piece you start
analyzing the problem. I have no clue which piece added such device in
your system (ACPI tables? DTB) and you failed to provide such information.

> The problem this patch is solving is the inter-module dependency (mgb4
> requires xiic to be loaded). If you think that this inter-module dependency should
> be solved differently, then please provide _how exactly_ this should be done,

I already said - proper device tables.

> not
> some hypotetic solutions for problems that we do not have like some platform
> dependency of the drivers, and I will rewrite the patches. Otherwise I really do not
> see any reason for your fight agains this one line patch, that adds an alias that
> many other drivers (like the second one we are using in mgb4 - the Xilinx SPI
> driver) already have and that actually solves the problem.

Aliases are hiding the actual user and binding method leading to commit
like b822039b8ec1 saying - no one uses it. You need to implement proper
matching method (e.g. platform device table), not sprinkle aliases. Just
because some other driver chosen poor way it is not argument to repeat it...

Best regards,
Krzysztof
