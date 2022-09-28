Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2985EDC0B
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 13:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbiI1Lxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 07:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbiI1Lxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 07:53:42 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF895852F
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 04:53:41 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id u16-20020a05600c211000b003b5152ebf09so1045843wml.5
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wE11MaJ8cg0KHW9nVTcRn0BoQa8iHeo1fl0r8rIekRI=;
        b=PHV5ii1ZohZZbG2uNeBonVgqsdtRp0uSseMVBLuSBp4ECnqIL3EBP5w+ndiB7Kmq9F
         X+ZY6acIOU841yHY0cl+wcRq/SXX7Nyqo0i2HSZMKvHC8CM9ReENOQNjzQeITmZXvNvK
         wSN+NO9N7+abPQSXtfYKvXrV748pQwlazHHjxysE/jPared6CekC45hb3OxZKaehbXM3
         c/Ecf0Xg20Weu7mCv/IEoJfBV8LSrYUpTjXV2qzQyhrhFMiHH/ZhEiCxdDpLcKqf97WJ
         EZqBAc8TsM2TWZQZb+KnMv906WSgbVSmuKeIBEegUVF2hi/kaxqsyE97jHPDabpyxO6c
         NaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wE11MaJ8cg0KHW9nVTcRn0BoQa8iHeo1fl0r8rIekRI=;
        b=QZ1hkSjE5OFqQdakATTH+/sQ0CM+iY51kUErFr2lCRVVFTpxbLyt4Zp+wJa0eRO0eK
         8fuRFblAoJYMi1ksQxK/gX/+LUeBci1fyBeHwc9eUF6QxfcdxyZfOW7D0pEwYKhFvxTo
         Lze6Ocs73TLa2/l5H2NH5N0euWJuaR0udM8iOiK5/QraPx1Cp5R6G69dYq6yhhGsa4O1
         7Mfe+W2sn/zDy+r1P4WbKjXKfkI5y8aUF1sf90Wx7B331zj2dHNGsvkgLgfjzd8acsUj
         EkPg8TXE33PDreAgv3vriJxWT+KLCN4sbXZnvwvOOSnTM1ZHWrJzbrIRG1JJNjwMPd9Y
         +8Rg==
X-Gm-Message-State: ACrzQf3UedI8EevDEw/L9ga5B5RnGA8nvY7VwCIiiC6HyoyNdnkfuXHH
        +8eawTMxJhljxiM6r6mgm0MF1g==
X-Google-Smtp-Source: AMsMyM7xJx4xdbe3PCHgMLYt8giFrD0VhvJ45GmD1HJ3EN826hJg+uMZ5dwYq6cql31/zFWZic+pCg==
X-Received: by 2002:a05:600c:4352:b0:3b4:84c0:2006 with SMTP id r18-20020a05600c435200b003b484c02006mr6550405wme.205.1664366019958;
        Wed, 28 Sep 2022 04:53:39 -0700 (PDT)
Received: from [192.168.0.159] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z14-20020adff74e000000b002205a5de337sm1093423wrp.102.2022.09.28.04.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:53:39 -0700 (PDT)
Message-ID: <033ff526-fa00-507f-75bc-75256801c079@linaro.org>
Date:   Wed, 28 Sep 2022 12:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] media: camss: sm8250: Pipeline starting and stopping
 for multiple virtual channels
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robert.foss@linaro.org, akapatra@quicinc.com, jzala@quicinc.com,
        todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, andersson@kernel.org
References: <20220926142505.1827-1-quic_mmitkov@quicinc.com>
 <20220926142505.1827-5-quic_mmitkov@quicinc.com>
 <ee5fa2f9-c3bc-b903-014f-ed5fea064f9f@linaro.org>
 <cf171830-a951-11e9-2b54-3b442bb04b2f@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <cf171830-a951-11e9-2b54-3b442bb04b2f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/09/2022 12:35, Milen Mitkov (Consultant) wrote:
> Hi Bryan,
> 
> What is the error you're getting?
> 
> I am testing on the linux-stable-22-09-09-imx577-camss branch. I wanted 
> to try on the newest one 
> (linux-stable-22-09-14-qrb5165-rb5-vision-mezzanine) but the multistream 
> pathes wouldn't apply cleanly there.

I tried linux-next as at last night but the compilation exploded, so I 
went back just a little bit further in time to pick up a reasonable set 
of linux-media stuff in linux-next and applied yours and my changes on top.

To ssh://git.linaro.org/people/bryan.odonoghue/kernel.git
  * [new branch]                HEAD -> linux-next+camss-changes-v4

---
bod
