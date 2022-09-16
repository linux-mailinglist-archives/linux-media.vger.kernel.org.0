Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78EB15BAC1D
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 13:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiIPLOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 07:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiIPLOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 07:14:48 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A2EA12620
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 04:14:47 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id v185-20020a1cacc2000000b003b42e4f278cso16620287wme.5
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 04:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dV3jBO4U+IXFWsEV+8W82DF8z8B+6CO8USpzzOMmZ2k=;
        b=WiXZdHC5R7vjy/KOtfNoNgQwDvH1kHDn5SrpcAxBydYbF5njRrTGTcMjCgED0Rp8aL
         2F5pBdeP63TS/VBzvvwDDGjd/2JEz4BTLAbw8/3XE1M+slT2TAsMSgtx9q4YgM61khUm
         7C96zZeFwA34rItl3DkEQ88gzSozbQjoimB29B65PEUrgki0Qem0cEaOm78m9u+X+6Fg
         liqIL7T2d1ZxaK5YtpGrO2csVPDI8cPPox5sGk68FfYF90g60v2KuK+/K6eONJiqBaSy
         uR1NZKodrCLc8g4LPdaacphsL6Sa6m5KgmXW+St5OmsnhG2p3pRMJbwpnI8zCmUdjD69
         8v1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dV3jBO4U+IXFWsEV+8W82DF8z8B+6CO8USpzzOMmZ2k=;
        b=dZ8pP5d20A/y9ZTCaa0CyraJNCIn6r6ULp1bx+R+gopk9n9L8/UOhFQQehbC8WCfCm
         reI1Oyj7kxN6ShLS5yyZMyGAtA/b9Id+QBw3crDvJIUq8qiSd2uJYg5G4L3aN2YkFl/w
         H9YJidr/iBeE+Vhbm3KbFDIFoZRTEkYConS6sYuEDLhcQIrc3K8tUYaJXJeQak4jSUAj
         QihJ2wdj2QoO6/azEdaa5vRCjIXUlcK2wX75R8tNwOjr9vDnyPh37iEMVZd4YUgd3CC3
         p7yTZZs2X/tFdRmlflDzbdNyUo/UajDE9lUDav8bRebh00Z6B4rfJic4rwDGKhdMtbr9
         K9PA==
X-Gm-Message-State: ACrzQf0RlKy6x0JBmuy5knM4jLB5QkJ5PYKqY0do7g6YKQBlSd0/ecz9
        TxNA5OR4FDtFpGuoVIL8ZSP22JfoNdrU2w==
X-Google-Smtp-Source: AMsMyM6CatGdeyhxnRIjvMZ5938KmG4knCjhRrtvVXMr2UfSjjnXVvdpyORfuF5Wb8I++/pTl1FXRQ==
X-Received: by 2002:a05:600c:3591:b0:3b4:bf48:9f10 with SMTP id p17-20020a05600c359100b003b4bf489f10mr1077888wmq.76.1663326885863;
        Fri, 16 Sep 2022 04:14:45 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003a6125562e1sm1962946wmq.46.2022.09.16.04.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 04:14:45 -0700 (PDT)
Message-ID: <450af6ff-7b72-401c-c0a4-239d16a07cf5@linaro.org>
Date:   Fri, 16 Sep 2022 12:14:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] media: i2c: imx412: Add imx477 compatible string
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
 <20220915003522.1227073-5-bryan.odonoghue@linaro.org>
 <CAPY8ntCmRy_BSQW6QajrRMLpQBzMimcQPvZw1ocazxhr2dOd0A@mail.gmail.com>
 <e29e5573-13b6-0a29-20c7-ba780d825a37@linaro.org>
 <YyRX78PH/3zSCdCU@valkosipuli.retiisi.eu>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YyRX78PH/3zSCdCU@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/09/2022 12:03, Sakari Ailus wrote:
> And even if you have small differences in the registers you'll need to
> write there, you can still differentiate between the sensors based on the
> compatible string.
> 
> I don't have strong opinion on the grey areas though. Still if the register
> set is exactly the same, then the driver should also be the same.

Right now we have

- An imx412 driver that works on imx577 unmodified on Qcom hardware
- A Nvidia driver modified by Leopard imaging that ignores the chip id
   and uses the same init sequence.
   This driver is called "imx477" and I can verify it works with
   imx412 and imx577.
   The code for this driver modifies the original out of tree driver they
   had and stops validating the CHIP_ID
   So I think we can take it as read it works with imx412, imx477 and
   imx577 - I've verified the first and last is the case.

We know the upstream driver works with the Intel platform and I've 
tested/used it on Qcom with minimal change, so I'm happy to stand over 
listing both imx412 and imx577.

Its pretty clear the init sequence works for imx412, imx477 and imx577 
so, it feels to me like the right thing to do is to add in the 
compatible strings and if/when we get better chip specific data say for 
higher resolutions, add that resolution init sequence in when the compat 
matches.

---
bod
