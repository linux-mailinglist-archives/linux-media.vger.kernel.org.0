Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2E4595608
	for <lists+linux-media@lfdr.de>; Tue, 16 Aug 2022 11:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbiHPJUF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Aug 2022 05:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbiHPJTY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Aug 2022 05:19:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB96667CB0
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 00:35:03 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id y23so9798092ljh.12
        for <linux-media@vger.kernel.org>; Tue, 16 Aug 2022 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=jbmzfK6z2DD/lPLjmIFcab4JElk3hp6vyHmox8ys+9o=;
        b=XHZLtY1RNMBP+aIpgvB/vTlPSBPnWKOQHXf9SZ9iOZrYhORtdLLvsDd2xbJmeiOkHw
         Nz67a/ySIbF2Wh9FWw2zQGSXhn6zDORZ6Omy0A9tLd+LhSxPsEhqQRxhASVhT+wKMkDL
         8ZcK77WmrcrWzkaepBUAZ7/lMzsXgkuCDCwQMMfADlOqZavHxfpYWip1a8w+6c19CcY9
         8myvGKFrJPZd8fqebbiW4jS4uhpFs7Lgsz0fPM9bFVmq6UVNvyyTiJzYjd8vhJszUDc4
         6a3sDxKznNMx9R+uPN6SboT5XzUCoxLkbbCYD+gEEgQJyWeCHMdsySwgsyPoGJn1skI+
         dUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=jbmzfK6z2DD/lPLjmIFcab4JElk3hp6vyHmox8ys+9o=;
        b=BMy6cz/E6HuYA4KZLdLYmcsnzgS139gSwcKS0V/ZJxmdptw/Urzl3sDCK8LqfxUTg5
         yG1+4nzf7dxVbTznRjdqG2jijlEnh1WN0Kt0DNqeOK6UzK1gsBdLcSvB9u/Ejd7NQD00
         +irkUFEJpGUvzV4uKVQNPHB34WYgIFrWTpsAdAVeAxQk3ckeJNEPBpUi34hk0XlC/jbi
         1szBd0/9rPHFI0IFi/WnduySCI2lC0Lk6PEHIZ/2DAfaR03vPOk9rdsefHoxHMCIeRkR
         wTCPTytJH9N0jey7ElE/R9a5ge14kABbxJBp7mFqIi3cgcguw2ppZcoDuadbaILOTbSC
         oU1g==
X-Gm-Message-State: ACgBeo0V1jtYJWkFmdr3/1FnMf2/yG6XOrfDumKSBOEVNnBFeynJVeCl
        BslkYd0qJROtP5LoiMi/LZ8ldA==
X-Google-Smtp-Source: AA6agR56W0tc61vwJV8n/UGDydmhiRjat19vDpztBrkU5BkORtUSB4m379GUf4iPksAMUL9vU5Vcpg==
X-Received: by 2002:a05:651c:4c9:b0:25e:7979:573a with SMTP id e9-20020a05651c04c900b0025e7979573amr5921033lji.445.1660635302306;
        Tue, 16 Aug 2022 00:35:02 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id j5-20020ac24545000000b0048b28acab8csm1305454lfm.64.2022.08.16.00.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:35:01 -0700 (PDT)
Message-ID: <dec37198-dac7-77e8-fc14-44cd1ab10678@linaro.org>
Date:   Tue, 16 Aug 2022 10:35:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
 <2403639.ElGaqSPkdT@steina-w>
 <ceb2a42d-0650-6e6f-3408-6347bcd8c5e2@linaro.org>
 <1983480.CQOukoFCf9@steina-w>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1983480.CQOukoFCf9@steina-w>
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

On 16/08/2022 10:21, Alexander Stein wrote:
>>>
>>> So what is the conclusion of this?
>>> If using the "family" name there is no way for userspace to see the actual
>>> device name rather than the driver name. This might be confusing,
>>> especially of both ov9281 and ov9282 are attached to the same platform.
>>> The only difference would be the i2c-bus-address.
>>> You can also go for ov928x but this is not a real improvement.
>>
>> I still don't understand. Why user-space cannot see this? I really
>> cannot find any trouble... Your 3/7 patch does nothing special here for
>> user-space...
> 
> 3/7 itself does nothing for userspace, but 6/7 does, which relies on separate 
> compatibles in the driver.

Ah, that's so confusing... First adding new incomplete device support in
patch 3 and then in patch 6 fixing it. 6 and 3 should be squashed. They
really do not make any sense being separate and this just brings this
unnecessary confusion.

I would argue that the binding still should have devices compatible (in
one family), but now it is a bit less important.

Best regards,
Krzysztof
