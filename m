Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0C17E6BC7
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 14:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234184AbjKIN4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 08:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234073AbjKIN4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 08:56:04 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D0330CF
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 05:56:01 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so6472775e9.3
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 05:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699538160; x=1700142960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FZeLfPHVqMBuayrhJ/3sdbY4wdW0+rsHSntZWGqtzq8=;
        b=djrQgnGP2/L8L1O1iKnzNh7mesNWY9s/6N0QQ9SzgqvFjJLQj4/1Bjb/1AJDCk3Y4K
         845PvpB1KkScD790yi1Qjx5Ce3+vkM0t2AVxF0zMRQ4pfkHSOKbwI/gjyFA0J/d9RRAH
         KyVGBKOsLLhRKLTy0x43I6qWqQXFCpU0WC566g2HRl0dwTlTS/IMSvgHpdvEkYQiI8rV
         JngSSLRWBZ+82zpxNA2F1bPnh8f+dzCDIADzcqE+3j7IZJ+C/ZeGz+r7MFmg+mKYJM/I
         fNJqJGw5P6QIiYT7M/ZcDipJkhLERHn5H54pxMLFZRW5e8R/TQxVJOA5f8Hy26uSTVEb
         sWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699538160; x=1700142960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZeLfPHVqMBuayrhJ/3sdbY4wdW0+rsHSntZWGqtzq8=;
        b=V9ZBpOmBjGdIGBaZFthK+vDxh1dioVZKau1FqyKNeXpeG4T6Kjm84hHzADeZpCw9ry
         LWGSwD2h0sN5Q5NQ1PUKRHv7MYkxK3lTjdWkTB6/l61vl6UBgJAcILFyosOrjRfojWEI
         fp2SEY2X9+3hI21tjhJbpzagjvyXRQjadsFZTSZ1GzVewKbMhfEOYYi1WleowWp1QSTE
         FhYRFdqaFiyV8nkDtQCqaDas+bMVtOP9nPz1zSJvxjmWJ/J0WfnKPxP1Lu+VWLoLNecU
         QHJvTvjZDumgG5UUeF+cKuZVA9uiqCsWY1Z4alpIa/e1a1d0KuniJBAjD0YpgvOrNPuj
         PwmA==
X-Gm-Message-State: AOJu0Yye41clauh59WCSc+/UaMqP3t609J0fklFuYZeN047ohRVyhGuR
        SkvaYE8lX9XnDu77DSCLyLrxhA==
X-Google-Smtp-Source: AGHT+IFW5u0UUDAvXxhE/6joXL6md5DC36QI87dVcaE2HhVVu3xycPZUCAqwrEw+XzT6s4DrR+dE3w==
X-Received: by 2002:a1c:6a14:0:b0:408:4eb2:3b1b with SMTP id f20-20020a1c6a14000000b004084eb23b1bmr4409497wmc.21.1699538159828;
        Thu, 09 Nov 2023 05:55:59 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id u3-20020adfed43000000b003140f47224csm7411099wro.15.2023.11.09.05.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 05:55:59 -0800 (PST)
Message-ID: <66837892-365f-4845-95d1-d7329234d87e@linaro.org>
Date:   Thu, 9 Nov 2023 14:55:57 +0100
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
[...]

> +		{0x0000, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0008, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
Forgot to add, please choose one capitalization for hex numbers.

Konrad
