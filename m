Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C55B4842AF
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 14:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiADNm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 08:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiADNm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 08:42:56 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C520C061784
        for <linux-media@vger.kernel.org>; Tue,  4 Jan 2022 05:42:56 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id g26so81790468lfv.11
        for <linux-media@vger.kernel.org>; Tue, 04 Jan 2022 05:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CVpeJhNnnVKJagaPYcbOi0NCayI2FL47sRRfcXPZVY0=;
        b=nGS6WRAzk1GweADb0QgD4jM8kaUNtROiC5ChudlWBAaqc+8BNYezI+kaKnjXP/eWzn
         jnDE8cgRzdLj1TUlNXLBj3l1dj6WVJV8p/Zf6LSPJQaN+pT/7xh6DyASYDpzUS8Rr7//
         t1L/YWFa2QiaGMc7na3FbYO7V0fHPNg2e/DxHVfYDKqT8e4NxruZ4JLF/GeubPaKqOQo
         wnFcxCXASFwWhWupkjJ1oV6jg21umYStFLlDbKSmvy5MW8X/ilW6rSKXfoEoH3EGwOmf
         IXPQCEtdbx68ONS1BYIwAT4g7NMs00s5pXjm6nZ1F/LddCIZzM6TVIwER8HXefKF1nYR
         iZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CVpeJhNnnVKJagaPYcbOi0NCayI2FL47sRRfcXPZVY0=;
        b=htpO+w3UbtvOU1hSuSvTm/civg2iuHl9H9riLs0iigclvPE7iyHUlSsx6mwI2Q0FLf
         4MJJdDxnX4H02WfBzeHfOhGya/3R6AN/Ev39eo9z2rub49ZsaMgowM5/+dS4YbcASzZs
         YYpWHJ2R5VMGpKOdRkj4dzCQn9STlegWDVygNo3q1ia4dPZOLourk/Te2Z+8oUQiIAY1
         Q83rB6ELgj9yhZwss7DlzRjjb11Xy6V9WT6o75XStU///VPQUye8JELxLFuK8EtqHaAs
         OreqNmOJgmBWm3X0uSd1BblV2qpzDP/E7b21ThKiSSFtE6GYV7Eh7pAzhwiCnYn5DopI
         SCvg==
X-Gm-Message-State: AOAM5338P18L7KN+8tVPbzxxpYVx5Da4fL41yg2V0vnBPvBvHrX9+/4g
        Ntp8PzYkJCb7kAM4DoJ+62drbZy9XiPgtLf5
X-Google-Smtp-Source: ABdhPJz0WetOli7nYV+1tu6Agc/xaocYrri7GSX5u0JaXCXv71asXwe9UZqJdXYUvIGXJK/jpHUjWg==
X-Received: by 2002:ac2:4c54:: with SMTP id o20mr45357532lfk.369.1641303774586;
        Tue, 04 Jan 2022 05:42:54 -0800 (PST)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id i7sm3414551lfu.175.2022.01.04.05.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 05:42:54 -0800 (PST)
Subject: Re: [PATCH v3 01/19] media: dt-bindings: media: camss: Add
 qcom,sm8250-camss binding
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, dmitry.baryshkov@linaro.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        hverkuil@xs4all.nl, mchehab@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
 <20211222003751.2461466-2-bryan.odonoghue@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <1d753716-ba3c-8fb6-eeaf-7c68ef0c6e5c@linaro.org>
Date:   Tue, 4 Jan 2022 15:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211222003751.2461466-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan, Robert,

On 12/22/21 2:37 AM, Bryan O'Donoghue wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add bindings for qcom,sm8250-camss in order to support the camera
> subsystem for SM8250.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++++++
>   1 file changed, 450 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml

<snip>

> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false

I've discovered that there is a noticeable difference between this bindings
and all the previous ones, for instance see qcom,sdm845-camss.yaml

There is no required 'vdda-supply' property on the list, and fwiw I believe
there should be two supply properties for 0p9 and 1p2 supplies in fact.
Similarly, two separate supplies should be present in sdm845 camss bindings.

At the moment the driver operates with 'vdda' supply only, commit 9e5d1581
introduced undocumented 'vdd_sec' for sdm660, but, if I'm not mistaken,
it's unused.

In my opinion now it's a convenient moment to add descriptions and support
of two vdda regulators, comments are more than welcome.

--
Best wishes,
Vladimir
