Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58DE5642930
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 14:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbiLENUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 08:20:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbiLENUN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 08:20:13 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBA21C41A
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 05:20:10 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id p8so18472600lfu.11
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 05:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JMSqdm+byoXI4GZrO99r5Q2jzkNk8EOhmE+VVAfXhIA=;
        b=TYLp/nW4Fa6NFLyjLzGmlbgMohyFpxuKGwG5dC+QGrkGjdQ/OzlmRVILDL5hBjuir0
         oAaZuUiFLAa/fE6VcejI0IRQZ6b6x3nAJHJJ22EfsseILPPBciLvxUXz/Lp+qwT/pjLg
         aAEkIgj2y56vpTqs3RpWLb7KChX5OE2eHWrUMPRpS17zZycHgojgPMeYrAWGyuDEM80P
         jsrLxHNlNuQu4OYZIVZZzRsXLDbdUSf5bJ1ePVyLCg5ei0eIkgsbxJ6QYeOjF8Vb8zJN
         4P5gDxbYViU2eFWUspjeHon8qACXMjUEpuzlKCrP1Yx7VAuALIckWK06R240JXaxWFYP
         BsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMSqdm+byoXI4GZrO99r5Q2jzkNk8EOhmE+VVAfXhIA=;
        b=kAXde5Z5boBTa/GicWvyNf4AKrOcZVt0SM08txK77PAGTScecPFzpI2TP4etKoxpHa
         jaOh+Gu6xKqpldvOVAnr8Goo5OqYNLXH/7u0v+O7/Xz77EOrvtzd5W5x7sW2YNi10QAw
         HYCh0YBnW0oCbkAtZqnYInUW506YaHsz2bl+4+1G5g6y5jkebWk5dPNNJ7fmElDT1Xi3
         kcqosjSnq0QM+nRua8AFEY/woG0vkm1VDglsmpNBDTamcD23TVkPC3dfLofaF2c2nvLi
         V/Tgy3drOcKChi6Tn8W83vgx3l3zmdN07BKO7JTo1g8Lr9N2L+S8SQUMBGVP0p5o/VUP
         LRsA==
X-Gm-Message-State: ANoB5pkrsw7G1CjOR6HhsODE6+up9mJi7y3696TaLjIAOSslZvPbNUxx
        0MHVwONl66WQTZngyuxtW6zu1SkaFJcs6oLTgqg=
X-Google-Smtp-Source: AA0mqf6/cSYj7QQJqfUmWnhD/F/YyHbRvjsoAgdbTO0piVQBhFP+ivN2GNF3AjE4X1irf0YZW0t2BQ==
X-Received: by 2002:ac2:4f13:0:b0:4a2:5c46:4b4d with SMTP id k19-20020ac24f13000000b004a25c464b4dmr30199948lfr.433.1670246409084;
        Mon, 05 Dec 2022 05:20:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t15-20020a056512208f00b004b4ec76016esm2101259lfr.113.2022.12.05.05.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 05:20:08 -0800 (PST)
Message-ID: <1cd9c47e-daa4-91a2-e300-a8c23a4dd1d0@linaro.org>
Date:   Mon, 5 Dec 2022 14:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "lee.jackson" <lee.jackson@arducam.com>,
        linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org
References: <20221205103800.00007a60@arducam.com>
 <167024503479.3691396.13573962465837376066@Monstersaurus>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167024503479.3691396.13573962465837376066@Monstersaurus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/12/2022 13:57, Kieran Bingham wrote:
> Hi Lee,
> 
> To try to avoid these circles, I've gone through and detailed precisely
> how the name and e-mail address should be formed to meet expectations.
> 
> Please also handle the other comments from Krzysztof for a v5.
> 
> Quoting lee.jackson (2022-12-05 02:38:00)
>> Add YAML device tree binding for IMX519 CMOS image sensor, and
>> the relevant MAINTAINERS entries.
>>
>> Signed-off-by: lee.jackson <lee.jackson@arducam.com >
> 
> Please ensure you configure your git client as follows:
> 
>   git config --global user.name "Lee Jackson"
>   git config --global user.email "lee.jackson@arducam.com"

... and then: git commit --amend --reset-author --signoff

Best regards,
Krzysztof

