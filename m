Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDD97E6D27
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 16:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbjKIPTb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 10:19:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232294AbjKIPTa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 10:19:30 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5971B30DC
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 07:19:28 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c742186a3bso9108221fa.1
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 07:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699543166; x=1700147966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQy/D48KYnrts/OWirk1lj+hMLu0jCUKKz6VnU/vkNg=;
        b=f1XWuvc4GLJ9YXa8+huQv0gkKkA2UtHR4YJm163AQZ3NVJ5QpSLkiNPmDBw78/w+X3
         jwtXqQVQ8M/yO1aGPameljgZpa6wZKUg/blM4Lh6QXHlUIjHs8XWiAB3lbFNqo3qRo7r
         IjcLd71rfe9JMoX4/baZIIbRkEdMmWpZvQjb98dyBgilnOH5jYbLS4MeYQPs0dkSYswY
         h6naN0mU9Kk11EUi3t9mbhajbRlyrNW5g/862BE0J1amgne0Qa5RgKR89VagNHI5LvuN
         Wm3gmmgSFUawsHNXdK5mrfBv0YBwD5/9JlP+Y6zcw3P+ZrIRpMw8MGxzVs8gxU4L5I6B
         2MPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699543166; x=1700147966;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MQy/D48KYnrts/OWirk1lj+hMLu0jCUKKz6VnU/vkNg=;
        b=X8Tt9ZwYOkyjYzcgpxFwrLAuNIsdj64mflbXbxWrjdUyptmfl45eYIfCtA+EBq0Yrj
         odZPwMioUlhQTlGq9y0oPCP+H1NBc+tZ9aKOwsGT2baTuNXm4LUnydNYne1jUx5Em2kn
         NJUTChCUeF0pkl8bryPv5LafwRI3kY53XdF/3MEYYxXW9lH6Q3Ng/sekoMGskdR7HCO/
         IFMe+5CNbd7CpvhW6mze986DR8K3BArFuBC/HuX0GxvJUcSw6eYwt6mJ2A57k0Wrl9jY
         SpNZmVNNkAGP9bDdJ0ZisfzkgQmgK/Ye2A4PUhLGXE0e42wz3ukAkIYS3b0ZsBd6dq5l
         ulGQ==
X-Gm-Message-State: AOJu0YyQwMMhbJOG1EqA5gOoplT+HMQaX+8EyvbiO2N/6KWqglC3Lp1p
        teq4hKZ3BMfa/G2UzDMwgfnUaw==
X-Google-Smtp-Source: AGHT+IF612VI4e/pw7m6zkVyHjTkRNzL8iXzL1nws+2/fW3dY8089S73Q67qmteZBGptX3fg53vX9Q==
X-Received: by 2002:a05:651c:1986:b0:2c5:1674:8d79 with SMTP id bx6-20020a05651c198600b002c516748d79mr5724007ljb.21.1699543166470;
        Thu, 09 Nov 2023 07:19:26 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t19-20020a05600c41d300b0040651505684sm2322671wmh.29.2023.11.09.07.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 07:19:25 -0800 (PST)
Message-ID: <faa889e2-5549-453a-b21b-942c937099c4@linaro.org>
Date:   Thu, 9 Nov 2023 15:19:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: qcom: camss: Add sc8280xp resource details
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
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
 <4aaa25fb-de9a-4d7f-9316-ef83c27f4b42@linaro.org>
In-Reply-To: <4aaa25fb-de9a-4d7f-9316-ef83c27f4b42@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/11/2023 15:15, Bryan O'Donoghue wrote:
>          printf("index %d = %d\n", clock_rate[0][i]);

Honestly I'm like a Tom and Jerry cartoon standing on a rake here

printf("index %d = %d\n", i, clock_rate[0][i]);

---
bod
