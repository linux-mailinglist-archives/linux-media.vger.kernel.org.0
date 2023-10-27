Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDEA7D932A
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345352AbjJ0JKf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345554AbjJ0JKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:10:32 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C36C194
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:10:26 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40853c639abso14392425e9.0
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698397825; x=1699002625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuqStbbcE98g0Qsufd7xFmYWScwY7cbL2ixdMjl3DG0=;
        b=ilQhxrmDoYfEmWuABHo0qqhMgCt8o9EfCk2zcr1vAVtFlkv6mJkdypvwsbo6nRVcRB
         PUC63XCQR1KfGDc1bs6SEWDDCKVLOQvwpd6SlrsYUFyUduixYjGgSZFswDIzuCZMVY6P
         IUQXyMN1XV8zK7EQmQrXqoJSQ0m9587NwywYkzGJGfQRZFA9+CnvXy7LiaYpxokEBq2m
         JxErPEOfH37igV9GCWyR7D+Pan1wregv4JDW0cCFMa8kl0a/rXhpp57g2M1VbqE2euSy
         ANUYkoKjne1FQEx09HCJ9qaL1aRq8GdoIT0fMQ+IwnGB0GtGJihOyGseF1yhNvm/K541
         8oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698397825; x=1699002625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuqStbbcE98g0Qsufd7xFmYWScwY7cbL2ixdMjl3DG0=;
        b=YYzVsgVfJ1IMb8V0ZhD9wY4gXMeJo91gT4JVWD81Fcuc0AEtZUOqaVNbi6PZy5Z288
         IB8GwBSsKJ7vdEbAC13czZAlksGt4q7eFgcXPRh8pgQpP9lwb7ASkxJYw6zC5KBdkPi4
         XyFPnRcbtYkp5rIVduQFZruIBo0V3D37BG9X+Y81ZFmw8k2rC/QYEBeoayzQd1cuK2Tk
         RnmiTBPwD/NdPty8YSREjacC+CTIl0BuJ4zL06BY+eYDMU4eGzoOvN11i6jxa2e2VcLc
         eHUIOVzf9x6bf6WlOfjVOUgShFxPKLHkBvfnb4FVZ0xS0uR6P9Z2gjpQwR+Gugnvw1/2
         sCGw==
X-Gm-Message-State: AOJu0YwdP8Pk7QbFf5fQfxHymHYpUozFm4apulG3WJ+Oxu/BiL/6eVx/
        wzBR4JX7WMyH6mtcPSCrFdU/Bg==
X-Google-Smtp-Source: AGHT+IGI7FPB/kli90gdnpa/qqhlm2HWGrOwpxkcIW2HjaeY9UEfdlauSJHS2Y4k+g69ULN6tYOd/Q==
X-Received: by 2002:a05:600c:4454:b0:407:7e5f:ffb9 with SMTP id v20-20020a05600c445400b004077e5fffb9mr1768819wmn.9.1698397824819;
        Fri, 27 Oct 2023 02:10:24 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t3-20020a1c7703000000b004042dbb8925sm4544384wmi.38.2023.10.27.02.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 02:10:24 -0700 (PDT)
Message-ID: <9fec3a90-b3dd-4b2e-bb7f-27890ad2b4e0@linaro.org>
Date:   Fri, 27 Oct 2023 10:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: qcom: camss: Convert to per-VFE pointer for
 power-domain linkages
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, rfoss@kernel.org,
        todor.too@gmail.com, andersson@kernel.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231026155042.551731-1-bryan.odonoghue@linaro.org>
 <20231026155042.551731-3-bryan.odonoghue@linaro.org>
 <8a36e61a-5397-4513-ae0d-eb68ccd8e584@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8a36e61a-5397-4513-ae0d-eb68ccd8e584@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/10/2023 21:08, Konrad Dybcio wrote:
>> +    if (vfe->id >= camss->res->vfe_num)
>>           return 0;
> P.S. this seems better suited for some warning, I think

Noo this indicates VFE lite !

power-domains = <VFE_0>,
                 <VFE_1>,
                 <TITAN_TOP>; // the controller pd

vfe-set = <VFE_0>, // has its own PD vfe->id = 0
           <VFE_1>, // has its own PD vfe->id = 1
           <VFE_LITE_N>; // has no PD vfe->id = 2

The basic problem this series fixes is magic indexing.

In the first instance, using named power-domains so that the ordering of 
declaration doesn't matter and we don't have funky code inferring if a 
power-domain belongs to the TOP or not.

Secondly though, which is what the first patch in the series does - is 
as I rebased I realised the VFE/VFE Lite thing was still there.

what vfe->id >= camss->res->vfe_num does is checks to see if the vfe->id 
<= a VFE not a VFE Lite id.

in other words we have yet another magic indexing problem requiring 
VFE_LITE_N to always be declared after VFE.

The solution here is

1. Make the driver support not caring about indexes any more
    This series.
2. Name the power-domains in the various dtsis
    Populating the struct resources in CAMSS to match
    Next series
3. Gate new SoCs to _require_ named pds
    Deprecate the legacy indexing support of 'n' kernel releases
4. Profit

So yeah the check above is I'm sorry to say not an error at all it 
implies VFE Lite...

---
bod
