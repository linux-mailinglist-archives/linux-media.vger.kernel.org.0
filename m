Return-Path: <linux-media+bounces-531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1807EFCAD
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 01:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0A11C20A8B
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 00:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E42BA57;
	Sat, 18 Nov 2023 00:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYb/gMjK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1D910C6
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 16:44:04 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso361267966b.1
        for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 16:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700268243; x=1700873043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXjEHmmJAB20oLy2Jad5Xh5ZRn5wYpaTD3D4J01EQsg=;
        b=KYb/gMjKY0IKIWFc2N+pEaQUbFXxDwxCmfyGapcPjVE0f30j+LMToC2XLZAHX9mplf
         E5ysp17lvyWExwIf4ywQfcRv3vyEpte0hDTLZdE90s2UgiZ58ocB8HbrUM9GEPvPtdq5
         W5H5XY3ScwtqkDGUZvzV1SYZc5GGraxdC3Ymvg9A+u2InYdi8yP8IBRtszHkqy9ABm0S
         ag53BmGNfOXBmACkGwbWRjElJ/8CFpxB9s53svJhbdsK11GGQuer6iKtm2sMu1T+3E23
         oZFjHRZ6QerjZqdiPKAbcorKjMoJTtsL/jVoMNYEziKY5FCMgmJfVv/eADqKlI3zyG56
         SBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700268243; x=1700873043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXjEHmmJAB20oLy2Jad5Xh5ZRn5wYpaTD3D4J01EQsg=;
        b=W8x3E94Tk78HO8Rbo3QK23lGR6k8YI03QUQJsOIgsyRsrPrL9FFa+CeWErUHcJaGTz
         fG50NNl/QsXwg2TTALyVV35EE5pgscz2v3p1zO7bwiS8pZxZdK57PjWEkMcnEVDa1odt
         FFiFo1UYK78jflwxplacN9pqvu9WUs6Cpa8+59+MBOjsMn2Y83ztO3dp3WA9I7zuq75K
         cRZyqa8LzFRVUda9nD/0vKYfTheI1WkAwBKLQRjucTyl7OLiLRzjvTIYC6mLAjC66l7N
         EzT+Y7iZ/raX35ek70y777fCHhgYM9TCDzp7U/3ueTiSoJ50mFaEc8f8HJrBGQ+1jxBd
         2fTQ==
X-Gm-Message-State: AOJu0Yxr/YEwhvDTI047ODtoo0J8iIdMw49i87OrUUEBdOHAQvEgwhUn
	1RM34C9dtbd5anE2RuKsR1lIlA==
X-Google-Smtp-Source: AGHT+IFTIxOv6h8yg875uGhLg0NyUGXQ8pCs2+f0qftQYTvhSlAaBEKu92/URelUPXiCtyRgsqJ9dA==
X-Received: by 2002:a17:906:4b1a:b0:9ad:7890:b4c0 with SMTP id y26-20020a1709064b1a00b009ad7890b4c0mr480653eju.56.1700268242965;
        Fri, 17 Nov 2023 16:44:02 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id mc16-20020a170906eb5000b009b2c9476726sm1327577ejb.21.2023.11.17.16.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 16:44:02 -0800 (PST)
Message-ID: <9d323c23-c4d7-48ff-ac61-36acfd19dfd5@linaro.org>
Date: Sat, 18 Nov 2023 01:44:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] media: qcom: camss: Flag CSID-lites to support
 more CSIDs
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231103-b4-camss-named-power-domains-v4-0-33a905359dbc@linaro.org>
 <20231103-b4-camss-named-power-domains-v4-7-33a905359dbc@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231103-b4-camss-named-power-domains-v4-7-33a905359dbc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3.11.2023 13:29, Bryan O'Donoghue wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Some platforms such as SC7280 have 3 CSIDs and 2 CSID-lites but current
> code has hardcoded 2 as the maximum number of CSIDs. Remove the hardcoded
> maximum number of VFEs to handle all possible combinations of CSIDs and
> CSID-lites.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

something something kerneldoc something csid storing a res ptr

Konrad

