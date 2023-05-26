Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63355712E00
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 22:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237568AbjEZUFz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 16:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjEZUFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 16:05:53 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBEBE7
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 13:05:51 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6d01d390bso12167435e9.2
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 13:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685131549; x=1687723549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ii7jUw037eoZ8vAATSpOVlCd9Yy79Gi5wawq+sGoAE8=;
        b=woFwrMq2FfrFElY2FeQHOclRdLKxz2KbuCG30v1NLnuj76HybVAEj0w5LlqVUwsq0Y
         8GpDEy334I1EymTkGxF/wO6OZ0p2MXZ3mhAgPtswJSuv2vVuzgXwlTWPA9wXA/7nPh4y
         zwlMcvjv72hjGUpQ2ThqoABjzRGj7XjjZlPMCn4mKP6SQleWckzrTFniImmfZ+JJeNWV
         YLl3n7llJ5VwCqmp0ktf3E6kjDARDiFIUYPTLLaw/bAPqx6l62noIadNh8fg+8JuyCcs
         Il1JA/KT1ZN8fJVCMEYdZPtkJ2d21GeLxe8VnOGLkiJB7Xw5+QNN0X+Cm/4DxCkbI4+X
         pCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685131549; x=1687723549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ii7jUw037eoZ8vAATSpOVlCd9Yy79Gi5wawq+sGoAE8=;
        b=eOg7KWuJ+9uPHO2eUgj48Dt2ouLkkiEq7dhQYu6Ui/6g2XVsFXADcgzBF2WFZ94dF+
         rkg2UR8qLTwgfkjYkbl1v16yf0BFF5/ABx/jkPj3eznanHBrUXxu5oSdGXabA7UbOpcG
         KpRYsEdNvXr8d4mel/Oqht00k8TafQ7O7rbmjAbql2k8/qx6e80+zfS/aVCsu7vwOTiP
         zoR46mcWQeZWFlAdMHfyVc0UZb/cVuUjRhLuyU9Li9R5OIzA7hl3sWRpYCwXJzG4V1ID
         Jj3ApD7y0J93XhFhod4MsznP1QLF9rGW/dj4ZU4WX1SCO/tNBKHN5/cuv0WqxYhR7Etk
         4muA==
X-Gm-Message-State: AC+VfDzo6toyGhaOhRWsibC7AQxe5EDWsZMFxm2UoF8zMgc96uZZu0l4
        AOkFNhfjczPrjYnhkNsdH7nrag==
X-Google-Smtp-Source: ACHHUZ5Wod0UWR630OobbVnuFuY+mY60QpYFhW+Ur6XxZ5rGEw1+JnvaJw+RyGPhw/lbn+cq9ZgXHw==
X-Received: by 2002:a7b:cb90:0:b0:3f6:c7b:d3c8 with SMTP id m16-20020a7bcb90000000b003f60c7bd3c8mr2803322wmi.16.1685131549510;
        Fri, 26 May 2023 13:05:49 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a18-20020adfe5d2000000b003079c402762sm5948414wrn.19.2023.05.26.13.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 13:05:48 -0700 (PDT)
Message-ID: <838b134d-46cb-6237-49b0-0c287141ebb3@linaro.org>
Date:   Fri, 26 May 2023 21:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: qcom,msm8996-camss: Add
 CAMSS power domain
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230526-obstruct-venus-5833511a58af@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/05/2023 20:46, Conor Dooley wrote:
>> +  - power-domain-names
> Why is this now required?
> 
> Thanks,
> Conor.
> 

Its an accurate description of the power/clock tree to have the top 
power domain be switched on prior to the clocks that depend on it.

I think Yassine, you could probably include the majority of your 
cover-letter text in this commit to explain this change a bit better.

---
bod
