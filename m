Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1A86B0497
	for <lists+linux-media@lfdr.de>; Wed,  8 Mar 2023 11:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjCHKfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Mar 2023 05:35:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjCHKfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Mar 2023 05:35:15 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA40911C2
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 02:34:27 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id cy23so63614531edb.12
        for <linux-media@vger.kernel.org>; Wed, 08 Mar 2023 02:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnORx/cXMXXs1SQOuFMPgGAn+stP+/VikFgt6EUPlS8=;
        b=XxIjIZWg1Y8xzcMx/xRMiroOvTCsljyNtu5iSaUNvu6mG5pLrbIat8Kq7rzBUib7dD
         E9AWCa6kCcOilTJnniT8EyZjRGXUiSzeZPnXlqBQCB1cE3219YbncWjRwqtkqQrCv9qK
         keBSyhZopgwJjTHY5970EN+WmHaiVHtSISSbkh7+CuTrZleQyQ/gPjzWL2RPAYw9uTge
         dxsxipyKlbz5QXYpGaZovEoDWkG+UD5SFktJ41L9QVoMt+nGUs/iQKFKj9CwDXtG69m5
         ktNy8h4UNx72i1eiVPgJCsyzbJkoXt28ukuSc/yoyApw0wBF6IIsF8l9bXmpPIoWcfnR
         meuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnORx/cXMXXs1SQOuFMPgGAn+stP+/VikFgt6EUPlS8=;
        b=Uj2cwXWh1tk2wzazGoSZX3/CvlQJjoeFrnkviUWHPxZAs8VWMNwvf220OZBx47BYHb
         SmzgsIqnk1X2HtiWCagEGt6kefVXDzXnWxf2dmfqScEFdvXkM5PoeEq4Y0BKE7NEntQO
         K0bKr1lw7agSxjtoat72XG3UJXxe5AarmgnsnsC/Df5kF0YejzKKcA//8kCUMqM355k9
         7Oddd3y/lVzGX3U1XQbylsifqxZGRdqPLwi5g9lHjCyme7e+iNhCmYbAsHwn6bXAoM+T
         2Qz9G2ebnikOz2i9LHzB4XYk8iwXI0xfK9yeT3E11CNLwQQVh0X1/r2m0Fuc4heZv/XS
         ptKw==
X-Gm-Message-State: AO0yUKV+uuRmuj5odfAJlqz/PlUAuLb2C2TR1MXx/TPJpw+p5f9Mz5TD
        81oDCqtw3wlijcDTHXTX7Qq+Xg==
X-Google-Smtp-Source: AK7set9YCq4+3yhoch3syffVQdWz6ZBJQ1uD6edTZYkooHr9xevTu/Kb4WK5BUZakLoA0YmACBqo8A==
X-Received: by 2002:a17:906:1405:b0:8d7:153:1486 with SMTP id p5-20020a170906140500b008d701531486mr15767584ejc.20.1678271663359;
        Wed, 08 Mar 2023 02:34:23 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id gu21-20020a170906f29500b008e8e9859905sm7250217ejb.184.2023.03.08.02.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:34:22 -0800 (PST)
Message-ID: <6fd5135f-9cf3-1a18-cd54-1f671b950d8f@linaro.org>
Date:   Wed, 8 Mar 2023 11:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 06/11] media: starfive: add ISP driver files
Content-Language: en-US
To:     Jack Zhu <jack.zhu@starfivetech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, changhuang.liang@starfivetech.com
References: <20230302091921.43309-1-jack.zhu@starfivetech.com>
 <20230302091921.43309-7-jack.zhu@starfivetech.com>
 <1270c1a6-9e12-3f0b-c90b-f1715ea07f80@linaro.org>
 <0a0fbd68-9398-b6ac-3d78-e8765e4c2af9@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0a0fbd68-9398-b6ac-3d78-e8765e4c2af9@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/03/2023 10:53, Jack Zhu wrote:
> 
> 
> On 2023/3/3 16:45, Krzysztof Kozlowski wrote:
>> On 02/03/2023 10:19, jack.zhu wrote:
>>> Add base driver for Starfive Image Signal Processing Unit which
>>> handles the data streams from the CSI2 receiver.
>>>
>>> Signed-off-by: jack.zhu <jack.zhu@starfivetech.com>
>>> ---
>>>  drivers/media/platform/starfive/stf_isp.c     | 1079 ++++++++++++++
>>>  drivers/media/platform/starfive/stf_isp.h     |  183 +++
>>>  .../media/platform/starfive/stf_isp_hw_ops.c  | 1286 +++++++++++++++++
>>>  3 files changed, 2548 insertions(+)
>>>  create mode 100644 drivers/media/platform/starfive/stf_isp.c
>>>  create mode 100644 drivers/media/platform/starfive/stf_isp.h
>>>  create mode 100644 drivers/media/platform/starfive/stf_isp_hw_ops.c
>>
>>
>>> +}
>>> +
>>> +static int stf_isp_reg_read(struct stf_isp_dev *isp_dev, void *arg)
>>> +{
>>> +	void __iomem *ispbase = stf_isp_get_ispbase(isp_dev);
>>> +	struct isp_reg_param *reg_param = arg;
>>
>>
>> Didn't you add now code which does not even build and is not bisectable?
>>
> 
> use patch 11 to build all files in the starfive directory.
> 

Not related. So let me put it very simple:

1. Does this code build or not?
2. Do you certify that code is 100% bisectable?


Best regards,
Krzysztof

