Return-Path: <linux-media+bounces-530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE57EFCAA
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 01:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43BDBB20C07
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 00:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAE3EBF;
	Sat, 18 Nov 2023 00:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgAUx5ph"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66B910C6
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 16:41:26 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-41cd97d7272so14980021cf.0
        for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 16:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700268086; x=1700872886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhAvFW9MLwb/bwSxSlRr+5tAeVfyF+CZ+OfOVamrUmA=;
        b=xgAUx5phc8dAVF25lX4xvwUHckDjBnbuHTmxbglJAyCKrFGrC4EbT98mKKPcoD7MzJ
         s9v1bDMh8r/j/yN971H2VqCA6iBGRrcU+ZFWJxxGBN9FKCRkJy9Qj1pGZn0g3mhWJ1U/
         nOW0XQMh9kiMcSqg+9PSj9qPyfzXTi2hCPmvtqPxRK4deA7K5stl2MeujGzoOBqYNNC8
         4EU963qbxPDY2YuJp5guVfuujN1g9Au2TyoebtJ2hpk2i6+NlcPv/6VYypGjJBmGiMxH
         kaMBMrk0dfBXPK/50ol64GBPHtO1AVDStJLntIOBeza1GqUAdYPCogsYjoPsbBy1vCRX
         5k5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700268086; x=1700872886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhAvFW9MLwb/bwSxSlRr+5tAeVfyF+CZ+OfOVamrUmA=;
        b=Etg+8hVidlgu2y+Em25H7LRRJJQs/0EV8poBG7SZpDDm6NsRgDZiTEHkCof8KCW3/m
         v20h/55aTQjKWb1yc0Zu9sVsKcYWBm8ObKD2cOiB8AE7iwj7vTgz2GDj7UsW0qzwnfF2
         jyzJHBcChiDDqEDxvDWOPC3El8cHkFAHfJQttU61MFedgzcKiYKAePeyceT6emuKAjE4
         Uqood61QtZ1ygDDNisUgXtdBWtgUpvJqhMZogvVA9x1Z1/jQk6ttwbXdfNZ1pC1rduox
         /Z0E49rCvDj0spLJY2zisQ6E+Kea0l30Ur/0+vKGTLYOZfI2ltXGvKn8GhhBtTwaKRqO
         YLrA==
X-Gm-Message-State: AOJu0YzX8WdEFWlKQSkkfLtfPWA60vWfM29qrm01EG0JH0EVyVS3zSed
	cssrESyfCfflvxEhdbVLU4NCkmuPnDJ0OTE+VtA=
X-Google-Smtp-Source: AGHT+IGsuXREw/LNJDqVvqLfIYXgGHPnSNVvdxho4flsFoPNPeQnpJnGVxjQbxhtSFSpRLKwBc94Ow==
X-Received: by 2002:a05:622a:104b:b0:410:87a:be98 with SMTP id f11-20020a05622a104b00b00410087abe98mr1584673qte.20.1700268085757;
        Fri, 17 Nov 2023 16:41:25 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id r15-20020ac8794f000000b0041e211c5d0bsm952738qtt.6.2023.11.17.16.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 16:41:25 -0800 (PST)
Message-ID: <d62238aa-5f1a-4afd-97fe-1f2e1c5d98c6@linaro.org>
Date: Sat, 18 Nov 2023 01:41:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] media: qcom: camss: Flag VFE-lites to support more
 VFEs
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
 <20231103-b4-camss-named-power-domains-v4-6-33a905359dbc@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231103-b4-camss-named-power-domains-v4-6-33a905359dbc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3.11.2023 13:29, Bryan O'Donoghue wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Some platforms such as SC7280 have three VFEs and two VFE-lites. Current
> code has hard-coded two as the maximum number of VFEs. Remove the
> hard-coded maximum number of VFEs to handle all possible combinations of
> VFEs and VFE-lites.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
[...]


> +inline bool vfe_is_lite(struct vfe_device *vfe)
> +{
> +	return vfe->camss->res->vfe_res[vfe->id].is_lite;
0_o

something something vfe could use a direct resource pointer

I hope there are no more hidden (esp. using magic literals) users of
this IS_LITE <=> idx > 2 logic, but old code never fails to disappoint

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

