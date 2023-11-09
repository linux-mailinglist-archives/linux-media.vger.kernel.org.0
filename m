Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6774E7E6F9E
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 17:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbjKIQqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 11:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbjKIQpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 11:45:50 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53FF4496
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 08:44:59 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-41cbf31da84so6373231cf.0
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 08:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699548299; x=1700153099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyMA09AuUMjLAh5sKhIzahSsVZoVjCkYBpAsRxdwhyc=;
        b=W8zg9eh01okwPNLTUo82IBHJDZeXKvvDa8WeIBVr1JMy8GRjEVpVshypxhv1v8Vqb8
         d1ppaN+vGrHaPhEAdIlT0COaTyz27NVA1JF8YqZGUlpxATCkdMnkqWBwhqToSUEPgpsQ
         OIMITVBPtBr07H2AstyJ3huLr3tju1yh73iXD6qiTdf0iYfDbFqqsHtqlT+2c/zjj3tn
         LZiSdc/LQeCdoKOR7K9TmXnyaD7v4TJ84sGmeYypY8TUhpsYHc5UWDGBJPCd+VWg6m8D
         AziKp6mDZOhgQT9USHClaLkL3oNnnnZjiB/K8IzlIuVaO4NsGR0XG3vfdW7KEMfFwfRO
         UilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699548299; x=1700153099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyMA09AuUMjLAh5sKhIzahSsVZoVjCkYBpAsRxdwhyc=;
        b=ZQho7IXztGt1mFpmYPw7lAYsYK2N+xm+PmnhSMSdXMcyrWUU8V3Ne7KnmdiOljRj1O
         qfXkiL4xO4F7f3SWmXCCOqO3sECvKRQhL6+T96gAznYuHZC6SQEQyZAp0/AB73a7scGo
         wwzTrpbqN20zUf+O1VB8RDWatG9ybmrs8mUPeRyguTTYlWZEZ7D8pKU0mLMM/fmJtIeM
         NOcdfcDY8xjjE0SLgDsIwD5fDqBLALwNupiGC3pqomwTftnrBQhj49fA3rI32c6E4SbZ
         /25UYsOcBFOhNGj4JTtW86Fj6MSagt6H4EiDoehQxLaTdsL6Fnw82Wa04Smvw7VX1gs5
         7LJQ==
X-Gm-Message-State: AOJu0Yz8mGS8iv91r2YvIJbFcBhr2tjI7jTFpATrrot4oUm4AYc58yPx
        4tPC0EwXXIWA2PI0DjHhEcVn7g==
X-Google-Smtp-Source: AGHT+IEeHgJymEoFiAdtjTaIzqWAnhrVVnVyUg4K9YaADuVpDzGWesUGUehhln3d519cHvsvwaX0Rg==
X-Received: by 2002:ac8:5885:0:b0:41e:1e0b:a2e7 with SMTP id t5-20020ac85885000000b0041e1e0ba2e7mr5997998qta.47.1699548298957;
        Thu, 09 Nov 2023 08:44:58 -0800 (PST)
Received: from [172.30.204.212] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id cb18-20020a05622a1f9200b0041950c7f6d8sm2070259qtb.60.2023.11.09.08.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 08:44:58 -0800 (PST)
Message-ID: <735f13e7-386a-447d-bff7-f4acb0aba670@linaro.org>
Date:   Thu, 9 Nov 2023 17:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: qcom: camss: Add sc8280xp resource details
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
 <20231109-b4-camss-sc8280xp-v4-4-58a58bc200f9@linaro.org>
 <3e0958a9-4d1e-4d1b-a914-5da154caa11f@linaro.org>
 <e80d4026-a525-48ef-b53a-f1276dd316e6@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e80d4026-a525-48ef-b53a-f1276dd316e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/9/23 16:13, Bryan O'Donoghue wrote:
> On 09/11/2023 13:44, Konrad Dybcio wrote:
>>> +        .clock_rate = { { 0 },
>>> +                { 0 },
>>> +                { 19200000, 80000000, 80000000, 80000000, 80000000},
>>> +                { 19200000, 150000000, 266666667, 320000000, 400000000, 480000000 },
>>> +                { 400000000, 558000000, 637000000, 760000000 },
>>> +                { 0 }, },
>> Not the case here!
> 
> I agree with you in principle, the checking for the frequency shouldn't rely on if (freq[x]) however in this case - we are doing aggregate initialisation of a fixed size array and the compiler should save us from ourselves.
Oh right, I didn't think about the sizing of it and partial init..

Konrad
