Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBCC3BA197
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 15:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbhGBNvQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 09:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbhGBNvQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 09:51:16 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09862C061764
        for <linux-media@vger.kernel.org>; Fri,  2 Jul 2021 06:48:44 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id m18so12578260wrv.2
        for <linux-media@vger.kernel.org>; Fri, 02 Jul 2021 06:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dmdV5C0TPaZh38jwc22npxunHrSD6YlmILpaclb/0ko=;
        b=MMaK4fWwJ0vbQk/VXI4ucI0gpZ5rMsazWB7JlYgn8qFz2g7U7vIaZoCdRMNNTmBQ+B
         QG/HsfLU+K0cKJNZaN16m3SRn+5WQEmPVx97e1I0ZYsGKxi0o1gjjXkDimK7/vdY6XZ4
         TxMKifvdwRulh4J8UjxgaWxj0irps6/o/rmbjojsBglcy5g9eGb8eQGp2J+yPuxCzGmK
         2X8bx//QFTfi+eb50djSKk54h7N6+7O+rc9LxS8PZxJNAc8R0eLi8Y22ZJ4QgYcUdTk0
         AkH9WyG5cA1ATdz5aAmf0/m5rnjQIx8DRZ05vQHPQeDZJvGExrcshvMhzdtym8nnumGk
         hxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dmdV5C0TPaZh38jwc22npxunHrSD6YlmILpaclb/0ko=;
        b=Rp3OSzv5k5+UwOz2wr8Nim5FWwamud935pNGk3R/u9qTU7Ok1ZzWXuOyZ49FpPSy9C
         xDoLAojS1gXk+DZQqUjfC3ggDNcFXtYY3yDC+8nD5+LbAuRNVCZDK0V7cXFEkEwzz+Lt
         W/6Fz96k6MzuXpEdVoqou2690wfKMi1Oe2CC9FyuqSnp/3ge7OzuexYGsAGl4/N8T2v7
         LeJhR9Qf53CRgEEE5Wui1kt7621g6pG5jgiqDSkyLA91IM3c/qIAPXwgwUogQDtabwl3
         YQdUHd1MtBdL1rbhRcFkLjTxcNav20va/IGKQnRRO5oQAm7v5ZSwlTxiIUtnNB+7Ni/4
         /law==
X-Gm-Message-State: AOAM533E0CklyvwD8W8616nNnWzUJomajvvZFUCV2LA6W3kkH0k+YWGd
        nCOveGxWBlOrcgxUuP/Papjf/A==
X-Google-Smtp-Source: ABdhPJwnfiPmpsT0TFwceB+yNPe62xHEvP1eccHb9f8GwnwPkFvep/IzIg4oQ9IT0EKqsY3+JcJqaA==
X-Received: by 2002:adf:ef50:: with SMTP id c16mr5998912wrp.137.1625233721485;
        Fri, 02 Jul 2021 06:48:41 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b194:a11e:9f1:225b? ([2001:861:44c0:66c0:b194:a11e:9f1:225b])
        by smtp.gmail.com with ESMTPSA id s5sm3363652wrn.38.2021.07.02.06.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jul 2021 06:48:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] media: rc: meson-irblaster: document device tree
 bindings
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
 <20210701215132.16317-2-viktor.prutyanov@phystech.edu>
 <CAFBinCBZXRrPakwvRLsbNbuYY6fcYysMs0+SPUmAhKpcYxrq0g@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <cc677601-fb6b-970d-be8a-e68bea9727dd@baylibre.com>
Date:   Fri, 2 Jul 2021 15:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBZXRrPakwvRLsbNbuYY6fcYysMs0+SPUmAhKpcYxrq0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 02/07/2021 15:30, Martin Blumenstingl wrote:
> Hi Viktor,
> 
> On Thu, Jul 1, 2021 at 11:51 PM Viktor Prutyanov
> <viktor.prutyanov@phystech.edu> wrote:
>>
>> This patch adds binding documentation for the IR transmitter
>> available in Amlogic Meson SoCs.
> This is an interesting piece of hardware where I've always wondered if
> there is any device out there which supports this functionality.It
> turns out that there is

You did beat me, I started a driver some time ago but failed to finish debugging it...
https://github.com/superna9999/linux/tree/amlogic/v5.2%2Fir-blaster

> 
> [...]
>> +description: |
>> +  Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
>> +  (blaster) controller onboard. It is capable of sending IR signals
>> +  with arbitrary carrier frequency and duty cycle.
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,meson-irblaster
> if you feel like some registers or register values are specific to
> A311D or T950D4 then please also add a SoC-specific compatible string
> (for example: amlogic,meson-g12b-irblaster).
> An example can be seen in
> Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml

AFAIK there is 2 versions of the IP, the "old" one we can find on Meson6, 8/8b, GXBB, GXL & GXM (and maybe AXG ?),
and the one we find on the latest G12A, G12B & SM1.

The SEI510 and SEI610 boards we use for Yukawa android port do have the necessary HW for IR sending,
so I'll eventually be able to test.

So, as martin says you should add a "amlogic,g12a-ir-blaster" to be sure we support the older ir blaster version
correctly with the right bindings.

Neil

> 
> [...]
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 2
> from my understanding there are two clock inputs to the hardware
> dt-bindings should always describe the hardware, not what the driver
> may (or may not) use.
> based on that I think you should drop minItems (then minItems will
> have the same value as maxItems)
> 
> [...]
>> +  mod-clock:
>> +    oneOf:
>> +      - const: sysclk
>> +      - const: xtal
> Does this "mod-clock" depend on something external to the IR blaster hardware?
> If not this should be handled inside the driver only.
> 
> From how I understand the register description in the datasheet
> there's two clock inputs.
> XTAL is internally divided further down with fixed dividers.
> Then there's a configurable divider which is then used to generate the
> IR signal.
> If the sysclk (I assume that this is clk81 - or at least derived from
> it) is "too fast" then the driver should just ignore that clock while
> the dt-bindings should still describe it (see my comment above)
> 
> [...]
>> +    meson-irblaster@ff80014c {
> node names should be generic, see for example
> Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> (spifc is the name Amlogic has given this IP, but since node names are
> supposed to be generic we use spi@...)
> 
> However, I am not sure if an IR blaster would be described as
> ir-blaster@... or simply ir@...
> 
>> +      compatible = "amlogic,meson-irblaster";
>> +      reg = <0xff80014c 0x10>;
>> +      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
>> +      clocks = <&clkc CLKID_CLK81 &xtal>;
> [...]
>> +      clocks = <&clkc CLKID_CLK81 &xtal>;
> while this works I think the recommended format is:
>     clocks = <&clkc CLKID_CLK81>, <&xtal>
> 
> 
> Best regards,
> Martin
> 
