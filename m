Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247877E4ACB
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 22:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235361AbjKGVhh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 16:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344088AbjKGVhc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 16:37:32 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180BA10E4
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 13:37:30 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c515527310so85455651fa.2
        for <linux-media@vger.kernel.org>; Tue, 07 Nov 2023 13:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699393048; x=1699997848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xb8KzKPBHLyy08/XAyZA3sT9NlC52bYPEE/qj+4GUxQ=;
        b=qDDoHOU0V4R1dhqNsuQjSIxDry48BQqqm0tGDH2kKCCXaLzw5KGYyqr3IFemZPyNdQ
         yalzr96kPe94Aant8fgjHoQ3A21MW4JGl21UqHrl17b1t890F/mD4cZZGbNxCN5+cdnc
         f7SqT/CC6s/yBfkrmjV+kG2I5BtuWWxrNqN6J2TWrIqHwEsDReEO1FmqMwDNAvjZLh9i
         F8SUqoTG4qmWtCx03OY+OSj/qrZwDqFTPjzo1FApvbTTVWUby66AYnQPsA6zIVOinP/w
         rejhuVhS4YiocjiDzrqvIgtCYs5RGQ8MX8EpkZ0ZKpv1ws1m7gk1VtuZfH6CfyrRFOsx
         /2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699393048; x=1699997848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb8KzKPBHLyy08/XAyZA3sT9NlC52bYPEE/qj+4GUxQ=;
        b=N3V/QcODloEpkR4TiC+1tAbGV8QI0mTvD6/1r4L166Jl450poIzkTpQEZwfR45Vi6r
         +oNtOMa945J7fK3F7x9TCtmEfEfGlsOIU29gPh8/4n/bBv/OIpuq8miP+IuWYEIoa7St
         FF43eKI7kmpFwnM+0vAtHYTr8CG2PHs+H5/kur0OkLQWNsoOmqP/qaR6EsrwO0CLUhZP
         CAk4ikaN0ZqeVJfqkE5SmCIAzeMqnQvzqvMjSH/1cb8XrJ/vmQ1kOZ1OwkXXvzHjnxpx
         lhgddPeHdVqdhXkiA0a+V7pXswusETf2gGN+mka+YN4hPjRpecCdm2MoYP0a5Z3ffcZv
         l+Ow==
X-Gm-Message-State: AOJu0YwAabHdChb694SHu1/7HYjsWWcdK7sC7Gt4uF63ngNIERhx7E5z
        +0nCQJbgrZY0pIIy90hUFoiV0Q==
X-Google-Smtp-Source: AGHT+IERd2a+Kke+ire1MwUqqEGnWGB8dW0AOOoiaNQbj/x9AWBnh/e8bZt/YtjxeEfPEATSFX1Xyw==
X-Received: by 2002:a2e:87cc:0:b0:2c5:22c0:582c with SMTP id v12-20020a2e87cc000000b002c522c0582cmr154444ljj.11.1699393047759;
        Tue, 07 Nov 2023 13:37:27 -0800 (PST)
Received: from [172.30.205.109] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m6-20020a2e8706000000b002c6eb321d87sm1621381lji.118.2023.11.07.13.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:37:27 -0800 (PST)
Message-ID: <fc7669ba-e466-40e8-a5fa-26b6816c46a4@linaro.org>
Date:   Tue, 7 Nov 2023 22:37:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: qcom: camss: Add sc8280xp support
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
References: <20231105-b4-camss-sc8280xp-v3-0-4b3c372ff0f4@linaro.org>
 <20231105-b4-camss-sc8280xp-v3-5-4b3c372ff0f4@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231105-b4-camss-sc8280xp-v3-5-4b3c372ff0f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/5/23 18:45, Bryan O'Donoghue wrote:
> Add in functional logic throughout the code to support the sc8280xp.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
IMHO this should be squashed with patch 2

anyway:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
