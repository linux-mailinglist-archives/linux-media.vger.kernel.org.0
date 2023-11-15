Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41BCF7E6BBF
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 14:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234327AbjKINzd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 08:55:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234202AbjKINzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 08:55:32 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6EE30CD
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 05:55:29 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40859dee28cso6285545e9.0
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 05:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699538128; x=1700142928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nijde05WkqbhViBQs1nbgHnnGBwETyD4GMcX8IQsQFo=;
        b=E1GGVOLAUGAR9vbBPBaNR6StAoSlgJ4b7byaL0Vp6ZOoRxprlfcgpYvgcEB7Q7OJcz
         9taw9uBYf8FR1zJjkCjr7xWZt5DZpNPUG3/vClNfFLquV8zG2cnRzCFF51aeJmmOMANC
         puw7MR19vvuR5jWGSxpZsY9JQ1GAM6QrWTA3RG8wIOV2BMiqii+RvDQ49vup55FOy8uE
         5fkJ1RbbFTdk8vBe53XKu8KtNyW092Coqh8dWFAlAp5+2xhTUDjsqlZZqXWtn1dHYYY2
         2uWVBLERKDEpIwCDCDtpZ/tgQ3ez+3rjHGXIT9yfysTw7VOE/xpq5PBPVUP2XCoSfx/c
         nCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699538128; x=1700142928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nijde05WkqbhViBQs1nbgHnnGBwETyD4GMcX8IQsQFo=;
        b=iAJUsAU36Sj32FA0biuOwa6orRd/8yD1QKLLGIFhfE/ZIl7sUJVeakeJmuedKVyARZ
         aCHLADYRHSb8X7z8ni4f3nW7DbetOhmDLu8DIJnuAygbeijDFjDM3dXcdoMiopVus5Al
         WpcIPET7o7wv/Ga1tSY/9LwbIwhNOOfSYEFj87MFGWW30jKhI8WT3TpzdntJ68gDCmNX
         iGOnqpAgv3dblWR1zjMuRWBn8MUEiGDxnwIkv8z7xvrW9ouOOQL/h3LGMzUhYQyg/UtW
         /LIPo/ikr/eUbnomxif7dc/WQaVIUgFURxjn8pxglF8BVxreJmGF4sHRmdcCJcfeGSog
         fhyw==
X-Gm-Message-State: AOJu0YxhU8cS19s3qoZ2eLv7MpAU3eq/qrdtUDqiRdN/c/MpTDUB/3um
        367Y1YD2VgyE7GDr7ED7GhDypg==
X-Google-Smtp-Source: AGHT+IHfvspCycP8TZe/VdDrkXatAWoDo0/wlUvtSr4H0undoJQWjDko/3K9oXz2ijhJDnOSD5j/Yg==
X-Received: by 2002:adf:e781:0:b0:32d:9a8f:6245 with SMTP id n1-20020adfe781000000b0032d9a8f6245mr4308142wrm.68.1699538127950;
        Thu, 09 Nov 2023 05:55:27 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id u3-20020adfed43000000b003140f47224csm7411099wro.15.2023.11.09.05.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 05:55:27 -0800 (PST)
Message-ID: <0e325a57-f07d-47e6-8456-523cfa04c52b@linaro.org>
Date:   Thu, 9 Nov 2023 14:55:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 two-phase MIPI CSI-2 DPHY init
Content-Language: en-US
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
 <20231109-b4-camss-sc8280xp-v4-3-58a58bc200f9@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231109-b4-camss-sc8280xp-v4-3-58a58bc200f9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/9/23 12:30, Bryan O'Donoghue wrote:
> Add a PHY configuration sequence for the sc8280xp which uses a Qualcomm
> Gen 2 version 1.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports two-phase D-PHY mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Aside from initialization, looks like the reset seq should be more
complex:

https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_1_hwreg.h?ref_type=tags#L39-45

https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiphy/cam_csiphy_core.c#L133-154

similarly for the "common regs" that seem to extend the init seq

https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiphy/cam_csiphy_core.c#L491-527

Konrad
