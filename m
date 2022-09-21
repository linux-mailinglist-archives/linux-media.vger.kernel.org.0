Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA085BF796
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 09:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiIUHY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 03:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiIUHYz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 03:24:55 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED66E2AE3A
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 00:24:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id k10so7746960lfm.4
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 00:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bFJYG4PVqHBTVTlENsGYmbnITZO/CIPfqSC0ocjrjBw=;
        b=PNb0mK3OrJ4YcwIRdrsHRakGLywEGmQt1IIEtdw52ex8fbqnxhkqjENdlaWJM9jnAL
         Wq6+Eq9Wwmz5ff+1BAMBmEtyDqWUNl0D1gQO1C3OzBcx/jObUWy+owPth/8P3t4KX3li
         D8VmSiMB4M1H4omLiPoYJ8K+IcdBklh41ZkiD/qcG7Ffy2dgJkUP5IxLjAWpHeuXBnQI
         i2jLLmEWPfonwKnAc7XsMN30gKBDRr4K2gf8q+5YfanprtU/tDhI75Ga6zqkcM3FvZW3
         FAOoXGhrYjkVs4QGRFhv5ijj82TJAhQJNhXLrBTfwXNGUZx9vHJIhk0AZFXGDGrciip2
         e9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bFJYG4PVqHBTVTlENsGYmbnITZO/CIPfqSC0ocjrjBw=;
        b=E8NCVvz/wBW5OV++6zHANRZILyoMQOfhi+2EBDj1ncYw9dd69F+ehaPmP9oPEvXJeX
         6t/CG4x/DbZn2wa53fgiK4TtREnC/x7VkZq6TpjmenoOnJzYSbJl3gh+/iR8FU0oqF2v
         ijK11g/vG+ZeqpD78/o6Als7z2TTFYAzreocOxubpkCI7pUqtWLP8TX3m5DaOHH6F0Q3
         3tdu8yBxBcrpCb2Hf+VMr2ewel6/FvFJJf6ie8qsfsgSniI8UZx1iBE97hvYIOGyKHs2
         AC5spCe5uLmWNng5F23WJPEC8+MmKr/DUOYuFatqX/TK1+pQH6MXnFiblRX5FUzghgUD
         UvzQ==
X-Gm-Message-State: ACrzQf1ptHOtR208YKaBFUWQJ5sTI3HntGwp7TJWwNb6IN3CsGo7vjpz
        f3Lj4LHyj4+cgD5HRNJPoL8ZWw==
X-Google-Smtp-Source: AMsMyM7AA/q1qWS+D/jrpdkjuMOdY9vnfSG/BqIGL59pYeC6eo/uWtVTrWMMF3B7MxVAzIFcpSwafw==
X-Received: by 2002:a05:6512:13a1:b0:48d:f14:9059 with SMTP id p33-20020a05651213a100b0048d0f149059mr10599822lfa.110.1663745091970;
        Wed, 21 Sep 2022 00:24:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eb7d6000000b0025dfd2f66d6sm310330ljo.95.2022.09.21.00.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:24:51 -0700 (PDT)
Message-ID: <74b6b670-747a-f326-44ea-7588c3989b0e@linaro.org>
Date:   Wed, 21 Sep 2022 09:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] media: dt-bindings: add bindings for Toshiba
 TC358746
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        kishon@ti.com, vkoul@kernel.org, hverkuil@xs4all.nl,
        jacopo@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        kernel@pengutronix.de
References: <20220916134535.128131-1-m.felsch@pengutronix.de>
 <20220916134535.128131-4-m.felsch@pengutronix.de>
 <YyZTCsflWtUbo2ld@pendragon.ideasonboard.com>
 <20220919100844.bb7tzbql2vpk76xz@pengutronix.de>
 <YyhDO4ohv47uIij2@paasikivi.fi.intel.com>
 <YyhKoDxFoobY9vBd@pendragon.ideasonboard.com>
 <20220920152632.mjpgpmelvx4ya4k7@pengutronix.de>
 <Yyn5MqqKYH7VpFhw@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yyn5MqqKYH7VpFhw@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/09/2022 19:32, Laurent Pinchart wrote:
>>>
>>> Explicit bus types in DT indeed makes it easier for drivers, so if a
>>> device can support multiple bus types (even if not implemented yet in
>>> the corresponding drivers), the property should be there.
>>
>> Okay, I will make it required.
>>
>>>> Why do you have hsync-active and vsync-active if both are always zero? Can
>>>> the hardware not support other configuration?
>>
>> Sure the device supports toggling the logic but it is not implemented.
>> So the bindings needs to enforce it to 0 right now. As soon as it is
>> implemented & tested, we can say that both is supported :)
> 
> Bindings are not supposed to be limited by the existing driver
> implementation, so you can already allow both polarities, and just
> reject the unsupported options in the driver at probe time. Future
> updates to the driver won't require a binding change.
> 

+1

Best regards,
Krzysztof
