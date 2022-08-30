Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A775A5D22
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 09:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiH3Hib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 03:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbiH3Hi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 03:38:28 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD7FC888A
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 00:38:27 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q16so10414808ljp.8
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 00:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=YVhu8dngATJNsq1WT8z62Dqe+dYGVV3PifesOtc0y/U=;
        b=txprIbZcbgHpOnFLjsjZagMyLP4wVrpeDwGRsiXMcRUrak/yCDzj2L++SKhuCs6mW3
         Xa0/G2xoqhqFK/vfKWrSA5Xnn0QpUoe23L1T3OoYJ7uwanc1sjw7wK0JyuWjUXLGghOS
         S41sZbIOm0DgvDl66y8hyaHFE/BijV4jSKeZ1/Dzmd0sLXDy1g6MEhEEakJ5ou4+onnv
         xgsFakORhj9JKz8SyEIOVhe+g5pYDIR9DQcYrWuwfhxBeA6Yi7CQP0AiXNBdIiUC8VF0
         JzrT7FemPKAUXgEOMOOYq4S+LMMGiqruyk5CNvjUdaZAu7fkqvPrlyklTGuNx6ygsEa5
         CV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=YVhu8dngATJNsq1WT8z62Dqe+dYGVV3PifesOtc0y/U=;
        b=gTIAzXMUZNWrrjT6x8B/I9aQzLUiz1BZIi5nC5TZitH+aONRpJ6EYkBJLeh///+BsQ
         dBfOZea/aKGtqHEh/aNhrKy06Vay2in36n4QrrTWJkgixasWwdIztJVCQBPuvgTJZuTS
         Ub/D4GNMJgKJWdHXA0Qqbt+/XDlG4EcOG32vjcKH3/2PW8VtUYPZ7IRqRzi7dPy2Hgdc
         fcWzn/4jjIM3pWUzpeOruggTpr3CqU8KK1lltUsRglXMdApa02nZo7hp/rhXyz6bJzH4
         Wl+18/oNbcJV7/LsHvIvQKtXRrGmtdOPB+deYzif4gWf6zVJQC6H1z4A2gegoQ23dKzO
         PAfw==
X-Gm-Message-State: ACgBeo2lGcD7Ztw4/wYRopNk6A/vCuX172mG4bKRL6YgwFAjK2sOdDMI
        SrZp9fIXNc/N7466PycB58hF3eQyAo7VTsZFagU=
X-Google-Smtp-Source: AA6agR77Znr75amxTUjHM/4khsfcg6ZpmnHWZxAUfuhuzMGWIB6VIhMcsnOjppkP0JlpxzY0e1v/uw==
X-Received: by 2002:a05:651c:1601:b0:25d:744b:cdb5 with SMTP id f1-20020a05651c160100b0025d744bcdb5mr6959223ljq.351.1661845105902;
        Tue, 30 Aug 2022 00:38:25 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id r26-20020a2e80da000000b0025e49aaae10sm824028ljg.12.2022.08.30.00.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:38:25 -0700 (PDT)
Message-ID: <1b7c6c4d-7f26-de21-df51-0428bc0af715@linaro.org>
Date:   Tue, 30 Aug 2022 10:38:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Content-Language: en-US
To:     "Tuma, Martin (Digiteq Automotive)" 
        <Martin.Tuma@digiteqautomotive.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
 <22204e2d-e0cc-b4bf-7501-9e4c2bf32ff8@linaro.org>
 <AM8PR05MB7235B6CBA34C981D456F74EAFB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM8PR05MB7235B6CBA34C981D456F74EAFB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
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

On 29/08/2022 14:28, Tuma, Martin (Digiteq Automotive) wrote:
> 
> 
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Sunday, August 28, 2022 4:58 PM
> To: Tuma, Martin (Digiteq Automotive) <Martin.Tuma@digiteqautomotive.com>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>
> Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
> 
> On 22/08/2022 22:47, martin.tuma@digiteqautomotive.com wrote:
>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>
>> The driver is based on the code provided by Xilinx at
>> https://github.com/Xilinx/dma_ip_drivers
> 
>>> Explain why this cannot be merged into existing Xilinx dma drivers
> 
> The Xilinx XDMA IP core is a complex device that is bound to PCIe and
> also handles stuff like MSI/MSI-X interrupts of the PCIe card/FPGA.
> The FPGA IP core is different from those that already have drivers in
> dma/xilinx so a new dma device would be required anyway.

Just because it is different does not mean it requires a new driver...

> 
> 
>>
>> There are no significant functional changes in the code except
>> of separating the core DMA driver functionality in a way that the code
>> can be used by device drivers in the kernel.
> 
> Use scripts/get_maintainers.pl to CC all maintainers and relevant
> mailing lists. Patch will be ignored if you do not follow Linux kernel
> process...
> 
> Ok, thanks for the info, I have missed this in all the "how to submit
> a patch to linux" info one has to go through.

I don't understand your quoting style. You typed here my message instead
of quoting. I recommend to use some standard mail clients so that emails
are properly formatted.


Best regards,
Krzysztof
