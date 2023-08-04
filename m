Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24FE6770AA3
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 23:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjHDVNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 17:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbjHDVMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 17:12:42 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DFD5269
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 14:12:16 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3110ab7110aso2260580f8f.3
        for <linux-media@vger.kernel.org>; Fri, 04 Aug 2023 14:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691183530; x=1691788330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYMteuRyBlyseBeImekn0yM6ziTIYQIc6Rgu88TP30s=;
        b=L3R3OkmpntupMw6HQac9mdHl31sC99yB24kKv2cRJ6L3wyqv6ducIm8sbI0vcWV/vC
         EezGKwA1+miaJ0uGa/QHvXi/4L1/wKkuJOnBGD3O6HEtsxF2q6+rEoihIRIdeb08YUbX
         m7vrQbRg5KdSUbrI4jjGncvHKSZCVrDmR1essoeTLpfy6gXf+oFppAVjdkLKcgI9KkPp
         M+UhLuMBp979LQ6fKfjQraKXnF1uAhHZURjDcCvDUFr4cOQa0RXzbqs2jxiFsfYJHCjS
         zEF+lMS7MjpEgm3fhW6qWNgEvm2yLGGqMFeUU0cg7/95DqUIFlWwoK50xPY5s8J+IB1z
         jyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691183530; x=1691788330;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYMteuRyBlyseBeImekn0yM6ziTIYQIc6Rgu88TP30s=;
        b=lqLr24bVd3+OLQBzZSjIx7HKh9URfaPxCZVHMw+/GK7wdCjM8/umdJePPRA4SbcqFL
         T9QdvWtrA7GeRRQl7oeIbJmrnfMxUgT1LbiYP0bIAg7R7h0/E/OPZh6YhT2pNsgxJaSc
         KAPxxnsrvkW6DATJFUYp/H+ZEP7h/PrlDaGaK3cYlaQ5n7FvxiXv2Uzs3ElJghLvEMwR
         UXj/lhlaRFz9Hm7vlTtwn2CrxxpWv1Xp7MnYoyIGitz0v9Q8vGXhHZBjD/x4qh9QC2h+
         w00HbscVKvPmjO5UhumdxUm/EXCoHSXnu8F28/4UZsSQj20gRKuWXA6ePhHzDImxlujO
         CEwQ==
X-Gm-Message-State: AOJu0YxYZacA+qJi/Y7o8+KK6/1hy7geWs371RbQBnXA1eXiM75KeP4q
        h2ndAEJgeWWGSBW8cBmTQuB7kA==
X-Google-Smtp-Source: AGHT+IF4KIqabtyY5sm23L3w/iJZnRODrn+e6Z+crWHsZ17hYM/q8Nm0IvgWh86L4WjwCZTsHCGlFQ==
X-Received: by 2002:adf:e44b:0:b0:314:12c:4322 with SMTP id t11-20020adfe44b000000b00314012c4322mr2372535wrm.4.1691183529736;
        Fri, 04 Aug 2023 14:12:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d66d2000000b0031417fd473csm3366341wrw.78.2023.08.04.14.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 14:12:08 -0700 (PDT)
Message-ID: <c2bdc6a5-2f97-9c7b-d620-ff3e361f1f07@linaro.org>
Date:   Fri, 4 Aug 2023 22:12:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 6/6] media: venus: core: Add SC8280XP resource struct
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org>
 <20230731-topic-8280_venus-v1-6-8c8bbe1983a5@linaro.org>
 <989aea4c-50e7-8141-dd60-3f41058192f8@linaro.org>
 <c0d4845d-d290-4082-b5c5-996637bcac2c@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c0d4845d-d290-4082-b5c5-996637bcac2c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/08/2023 22:10, Konrad Dybcio wrote:
>> Would it not be more legitimate and logical to have 8350 use 8280xp's frequency table, instead of 8250 ?
> top freq is higher on 8280

Still though its a bit suspicious 8350 doesn't have its own table.

Are we missing the downstream reference ?

---
bod
