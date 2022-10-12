Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B110E5FBEC4
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 02:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiJLA4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Oct 2022 20:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiJLA4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Oct 2022 20:56:23 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279516E2F4
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 17:56:22 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id n9so4000932wms.1
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 17:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WkqzanB1DDRnDxQamf+4bhkxHNhqIEh+Zu+CDjOM9rI=;
        b=AyeQ6MhP5KkuynPLFQqDtngZDyKcxvO7s/PbYbM5FH8uYWBGlMzX8UMrswueTln/4y
         21w/P27eWFw4alNNMDcM9E1v+wN4Zaw8ySDndOFviogcst2RXBdrztf/q30SHV8ax/rT
         IyHpraIvEvEfFlBOem5fSQ+IreTgzYRshZ3p2l7DAKvoFNIQo4X24blEUxbFHM7nrOXC
         +GXE4GxOil6ktqIabaXQ7MX02IscrZRBrTEBl3CjRXgBDBSvPkhKH0bv8z1+1f3RQJqu
         UyMCdnIAtQxyAUvcGALQ5/4+XUryKdnyPoQbQ0hB7RKnWeLnySDqvw2AsIwQf/jb8QOD
         886A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkqzanB1DDRnDxQamf+4bhkxHNhqIEh+Zu+CDjOM9rI=;
        b=0vx48TPBnRNCFBdEvPGca2xn59EBySl3efMuQKiDPdXNnersT7XJ0iXRt030CzF0Vq
         Sp01cjzHPd+eBY7bSINls0I2olU9D1LWmmPhCk9e83vmmRNAto1GzeucqHOZYpgdAndr
         JFoiz46M7VeosNtjb4kr5gJ1TYoHbLmIx0cixRKQ8HHJ/L3vDSiC+PsVcqsMsjS1oLx+
         Xo1EPcrxHecgcyCqXTph67IqBrc7Zubt4gsj4Iseu3PEDR44KqBWhCC+JFV4wAEHuurg
         9eC1LLSj9iCxPUf865YKeSQUL7KeZbdfvumYVMdeaWrtfpuf8baLwm+GNGpWyAHiIrte
         tPog==
X-Gm-Message-State: ACrzQf2lnTDhdzpz+N7v5eUVhc4gKDhopcU1ExGAx/vPsi3F9sDTSCPd
        W/d20QllRfPOsjm3GD+7N9EdRA==
X-Google-Smtp-Source: AMsMyM7NCvlMh/5issR4gqX9Yct/QwXNNJ7JhKg66RGQKNyMUkRdy5o/AmkMpXfA+AL6rRHs9nRb1Q==
X-Received: by 2002:a05:600c:3d13:b0:3b4:be25:9236 with SMTP id bh19-20020a05600c3d1300b003b4be259236mr996443wmb.65.1665536180653;
        Tue, 11 Oct 2022 17:56:20 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003b4cba4ef71sm337450wmq.41.2022.10.11.17.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 17:56:20 -0700 (PDT)
Message-ID: <1679970e-a1db-3b6b-7170-2296c32fdff1@linaro.org>
Date:   Wed, 12 Oct 2022 01:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 RESEND 3/3] media: i2c: imx412: Add new compatible
 strings
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org>
 <20220922104225.1375331-4-bryan.odonoghue@linaro.org>
 <CAPY8ntAAcbv0myL3F-OOOH_rUUF7q==DQFq1sCaYAY=+JapgcA@mail.gmail.com>
 <cc24035d-9a32-ff9e-bffa-a21a0f79f138@linaro.org>
In-Reply-To: <cc24035d-9a32-ff9e-bffa-a21a0f79f138@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/09/2022 12:19, Bryan O'Donoghue wrote:
> On 22/09/2022 12:16, Dave Stevenson wrote:
>> It may*eventually*  work for all three parts, but isn't the time to
>> add the compatible string at the point where it is actually compatible
>> with the driver?
> 
> Yes. I forgot about the 0x477 chip id on your part.
> 
> I'm happy enough to drop 477 from the compat string or indeed to allow 
> 0x0477 as a valid chip identifier in imx412.
> 
> Sakari, what would you like to do ?
> 
> ---
> bod

Right.

So I got myself the official rpi imx477 sensor and ran the imx412/imx577 
driver on the rpi 5.19.y tree

It looks like the rpi driver configures imx477 for two MIPI data-lanes, 
whereas upstream imx412 wants four MIPI data-lanes.

So already that means the imx412 config as-is won't work.

But, we do know these sensors are very very close.

I think the right medium term thing to do is try take in the majority of 
the imx477 code - including the various test modes, and resolutions and 
support for different MIPI data-lane configurations.

Its not clear to me that the imx412/imx577 and imx378/imx477 can 
genuinely live in the same codebase though.

Anyway I think adding imx477 to the imx412 driver should be considered 
out of scope pending answering most of those questions and getting the 
code to work.

Anyway that merging of rpi imx477 and upstream imx412/imx577 code feels 
like an entirely different series.

So I'll resend this series minus the imx477 bits.

---
bod
