Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80AB7E13C7
	for <lists+linux-media@lfdr.de>; Sun,  5 Nov 2023 14:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbjKENvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Nov 2023 08:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjKENvQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Nov 2023 08:51:16 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697B8EB
        for <linux-media@vger.kernel.org>; Sun,  5 Nov 2023 05:51:13 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507b96095abso4521142e87.3
        for <linux-media@vger.kernel.org>; Sun, 05 Nov 2023 05:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699192271; x=1699797071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHXAgv4Zh8QMHj2ZhUYqscHknzZQY4acqIGaqiZqATk=;
        b=d3P3ZEo/p79twMEvnXNuOM1xfK0aOR1OefNZX6AHMwHpjQrLwFSjb/ct6pdweVtyL8
         MApqoB1QDPMbB/BOlX+woQpAdvSLcwtcfg14PBv7egbi/R6fHi/hpAYWxLcD7Xj4Qwhd
         bRNlgBdUwjFao5hog8CLg9p2JPuyLqpa2Odwkc3Y1ML9aPd8Bkqy7ESvrT6AY6m+L1kb
         KOpG1xzn6FoB39HfuZpTEAnBaPvaLAxYm2g0A/wM8tLCdyAoC1q0ZUZgnCEjn3H7jlP5
         SIWx+pusG3f7YiBzQcpw5Ol7B4XwQDO108Wxg+xOBnLqd0CrPRexgxqWMO3epGIPRh0t
         frbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699192271; x=1699797071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHXAgv4Zh8QMHj2ZhUYqscHknzZQY4acqIGaqiZqATk=;
        b=VHKuNAQXZ/daSv1WxK/d6P0DBavhqEKFEaQMUQe254hCJYECF1q1hBsoIt8DOTiVk7
         Dxe1zCWVG89i4TxerOVf+dszbUNfxXdPdg+g3DYJ0bYboNmgcYZexqX9MwMEYu5Y8WtG
         xi3VEQnGnULlkJCS/omU/6yiRP0cHGbkIc6sASfWQPx2FpNI+Tfe38vef5CER3pSBOvu
         f+3RG8bIfUY/WzpHoh6fm6N3Dboya8TZNwBAQMpz2tdEQd+d1TEig+25lJDOWh/WMFBA
         x30klV9XuucReF5KDsKaxk9z9dS6VLJreZFvl3NrbRZe7NyNzGRFWUeVMj7gcf+G/63c
         l5Gg==
X-Gm-Message-State: AOJu0Yyp/YTkc0WGyG593XK1SayZUg7cCEBA8MtBLSiaaKnfJmrRaTUu
        jxKdHYc6mK8dGiCfzo83uLIVs2PeclSCpCPmSDRzhA==
X-Google-Smtp-Source: AGHT+IFn8BFwKAfDqIZ4wAWINQhZMFlEkSZTgsLa3h0reKOGsfECm3wGU8KeGyUjijmrOobSG1TMmw==
X-Received: by 2002:ac2:44c4:0:b0:509:dd0:9414 with SMTP id d4-20020ac244c4000000b005090dd09414mr15972641lfm.24.1699192271283;
        Sun, 05 Nov 2023 05:51:11 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t9-20020a1c7709000000b0040641ce36a8sm4242445wmi.1.2023.11.05.05.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 05:51:10 -0800 (PST)
Message-ID: <f8570657-c58a-4c5f-9a2d-1bbd48276874@linaro.org>
Date:   Sun, 5 Nov 2023 13:51:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231103-b4-camss-sc8280xp-v2-0-b7af4d253a20@linaro.org>
 <20231103-b4-camss-sc8280xp-v2-1-b7af4d253a20@linaro.org>
 <0e082f72-a770-49fb-8bd4-f8248a3a9579@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0e082f72-a770-49fb-8bd4-f8248a3a9579@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/11/2023 12:58, Krzysztof Kozlowski wrote:
> On 03/11/2023 17:25, Bryan O'Donoghue wrote:
>> Add bindings for qcom,sc8280xp-camss in order to support the camera
>> subsystem for sc8280xp as found in the Lenovo x13s Laptop.
>>
>> This patch depends on:
>> https://lore.kernel.org/linux-arm-msm/20231026105345.3376-2-bryan.odonoghue@linaro.org/
>> https://lore.kernel.org/linux-arm-msm/20231026105345.3376-3-bryan.odonoghue@linaro.org/
> 
> Do not put dependencies in the commit log. Once this is merged, it does
> not make any sense in Git history. Dependencies should be mentioned only
> in the changelog ---.
> 
> 
> Best regards,
> Krzysztof
> 

I was hoping the test robot would pick up the keywords "This patch 
depends on" apparently not.

---
bod
