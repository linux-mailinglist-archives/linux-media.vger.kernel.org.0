Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46DA712E43
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 22:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjEZUku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 16:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjEZUks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 16:40:48 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBE113D
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 13:40:45 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so12458495e9.3
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 13:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1685133644; x=1687725644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhzhfOCBtVQxsdfdv6Fkv8yjI3O1hICi8UEvthUhwDw=;
        b=qVoynme2VU/LkTgWmiE8b62U9KEGvvKzpSqsz3nrxrOoFrzjhXhT/y6TU3y1d0tjKy
         coKFVikFocaCwe0r5dvi4T4279BNgxymeE7hP/o3F8GLbM/X0NgM4qx/yjckj97J1IN3
         NELYdhC/lz5od4qvZeiEb9aAaoJYzMv2DfrIJGzjlPbwrQ1dS/M233D0Ya7J6w/m/pRW
         fQXsHvxfIekmTfr6eB5e5dK9ZAAY3d7e4Sj3wJmFKwPeUz3wkqtPN2ZhClrS6wEdKWO6
         l6xl+EOBGn/PdSc3y5KLItHnhyc4gxeu2i7H/3AUofH2qnaulOtJs1YNtglVqFT7YDzb
         5How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685133644; x=1687725644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhzhfOCBtVQxsdfdv6Fkv8yjI3O1hICi8UEvthUhwDw=;
        b=LdJaXIWshvA3NB1IItooRyD7XzAZgdYtmaNuFu33VX3QY2/pTzDy9vG8ccuCiNGu62
         43IOcCLLuuk7wWzxGstizSdu+TvGMhczMLCW8EJoSNZvTKEuIPkr+aTjN/Rv26W89ZPD
         PtA1ic0dtG0xPl0DrraFemVmBR3hClT9uGL5cBuiQrLTGf84NXvlg/pPo1R75ykrMUSs
         OIu3GlAhTLdH3/kzUzPZN0fs5r1kqpJ44N4WIfOX6hGxT/Ygjjv30AKA9GYGJrVPqAvO
         G6IqUy3lXCJfNIAHr5PUXo999TvfsukXlIn/s7O6ZRbDvpoxXOZd7MFdVz/OQjRkvCcs
         tK2A==
X-Gm-Message-State: AC+VfDyO6PCr2sq6Qby+Jap+xeE37boUfNKEUFUf7ZTja1GUHRn0wtwy
        6BvuXjXd/ZZyETJvPuoA6MMO9g==
X-Google-Smtp-Source: ACHHUZ6WT3jQcaJZpLbCTa0V9yCKfMUTq7pWQkLwDpDtbljOobpS8YUORm7ndLHXl3SXsVOdRD9xzw==
X-Received: by 2002:adf:f3c9:0:b0:30a:c35d:25d3 with SMTP id g9-20020adff3c9000000b0030ac35d25d3mr2725042wrp.52.1685133643876;
        Fri, 26 May 2023 13:40:43 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u3-20020adfdb83000000b0030aded83385sm1180722wri.27.2023.05.26.13.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 13:40:43 -0700 (PDT)
Message-ID: <5dc28004-5ff4-2102-0bb3-8f7bee7cfca6@nexus-software.ie>
Date:   Fri, 26 May 2023 21:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: qcom,msm8996-camss: Add
 CAMSS power domain
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Conor Dooley <conor@kernel.org>
Cc:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hansverk@cisco.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230526180712.8481-1-y.oudjana@protonmail.com>
 <20230526180712.8481-2-y.oudjana@protonmail.com>
 <20230526-obstruct-venus-5833511a58af@spud>
 <838b134d-46cb-6237-49b0-0c287141ebb3@linaro.org>
 <20230526-street-pox-2ff5ee106c43@spud>
 <8d89c14f-b2c2-7db2-f637-aa6d90273f4d@linaro.org>
 <631e5eec-853b-dce2-c474-62e76e83d7e6@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <631e5eec-853b-dce2-c474-62e76e83d7e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/05/2023 21:36, Konrad Dybcio wrote:
>> oh the names
>>
>> no toss that
> this should be
> 
> if:properties:compatible:blahblahmsm8996:then:required:power-domain-names
> 
> Konrad

Hmm, we don't depend on the names though.

---
bod
