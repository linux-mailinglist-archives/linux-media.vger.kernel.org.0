Return-Path: <linux-media+bounces-23772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D499F771D
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 09:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A30AF18887D5
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 08:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4D578F2E;
	Thu, 19 Dec 2024 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHMwhBdD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB5E21639B
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596357; cv=none; b=i/IVrX3YtvpnWO2J6Kjloioj0BPlv+ZyZGh6qGlZIiEd3u0e3cxH9WsgX9NrHdQkbf/XQHhHNh0/7Yau2/gtrtxT3YxPutzmhUERlr+Jz6zXM9Dcao/UbzMcjkexhxBcdhCZ4SR2GmH448RPRJP//Ywb/Y5zwCnne1PdobnhZ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596357; c=relaxed/simple;
	bh=/TCR1wjLwZDH1xiqqmbg+Ly7deqZx3njtoXBMse5XV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzDf6Bf6TvQ9+E9H4pw3AA/VMXAcARzNWahttiInGLj+6LVFyv71xExA1nlHGMTUUST+wcJY/fHrJZI5s79+A3tH33Gfk6hShSwl+EWeyyILSL4pSaqP8eGg2ZelvLuH5/De+M/nYXbSvllhUv0Vp7is6WT28yA2Qd/zOEhd0RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHMwhBdD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436381876e2so836875e9.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 00:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734596354; x=1735201154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ow1DXRErW430bDvb/91t7fGOmV5hdkGWybblSgRmGMk=;
        b=yHMwhBdDoWwbJlEsEFw8ik1vfLFucs5GKARQV86/XmgXSur9YyLldvrYDfMyIla+5Q
         nGuLh8tPuY2LgHRkehn3JOEXT6hQ1snGP4++ednZJRL1tVkbrZ+HluN7n/5LRarxobk7
         Fpz8BkXxRsqQIfltcgiyPFOzGJYHTOpP1WELDaMhEeUX3IKzQkOaB7KzqIGO4SktmCnl
         YZNmEug3i2wGZHdIVZ0i0fpZKFahmNo2ATKdnyPx491Xl/WFr3mhgIS9rBnzf23Vtvpp
         gWnpqteTUk0l2tiTxXoXmqS2oB+RrXU9AQ0kJsDfGbQIC419IlzxVR7LfeCryGe3O+H8
         893A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734596354; x=1735201154;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow1DXRErW430bDvb/91t7fGOmV5hdkGWybblSgRmGMk=;
        b=hgwNc35mpjFpdy52IuJsJWakgiNkqheAghUB4629Tb8DqDLekK2b2YrMbGiGpWqYJg
         ZpKjLTb9gwvfyH5ILs8+uxUXUVvAQ/ERL4XHmdCOyLV0Rf34tYn0SBEj1LLytLpJTR21
         74yP2GfdlT9GvUISX5seNNWKiROfVvJ4MxfajGxq3w6/CHdvXVbWAvLsT+W8RQDuwt44
         +ICtqFyNd37uN+H7qLJ/Lh3V6YomiA64vD2HF6zwmHvkFgG7tpzK8UGx/KwcWNcfteUK
         jLjUa9oooHFf1HJnhMxlR0pn4r+0ZNP/ybF6ujQGTyvOFMgzD1wZztGVdTce6zs7fQzt
         lRUw==
X-Forwarded-Encrypted: i=1; AJvYcCVWob/EZR7m/SJeEg4YhIiqKqaDINKHBrSl991HRLSVT8R6/sgI+VMVS1adrWwcpr5e3bIPj22OWxwrZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyN7ynFVRBLipgnp41hfxenD6u65Nqt1NZMpT4Y3Ec/8vXOj27
	IG95S+di8ecO3LI0nqUHkZHUZB4YoU0K6C1liqiDGxDJNOW5yLV03g+ZVD4uXtpejm+mYYr9edW
	C
X-Gm-Gg: ASbGncu7fLT0UNbzO1ch8+IysYEl73FsVnwPtUgUZsKdry4ZzPRbejksJrKgSiW3DGR
	kSjgeVbBsNr09s3dgnyFhBe6SN9CxVn1LGzZzkboqGOx+3SrqLAo0Nf8aUzsXcVGx+1QjlRPsJb
	slm919MzXG5XDFy7Gl/prFadkFTFlrPNL5LQaWQ4EZdcD3a29ZLp5H2soDPvqjKkbgGLWkqNA11
	jXK0SWc2+59IlFS83KC005ChFhY/EPZ3AwX5CdsAyZYDxcVVdKC6Pr7HTX79Ujcer/UytD0SIsO
X-Google-Smtp-Source: AGHT+IE5dap8OQqfHl7O1gwqBuNYq8LcG8Ohp3TynJhowGSXpXZ+gY8FFgAwzChiY6rKHQKWromlUA==
X-Received: by 2002:a05:600c:1da0:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-436553f5703mr20984195e9.5.1734596353813;
        Thu, 19 Dec 2024 00:19:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a08sm10711785e9.25.2024.12.19.00.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 00:19:13 -0800 (PST)
Message-ID: <7d4476c9-d9a2-4ef7-95c7-91391b355ee2@linaro.org>
Date: Thu, 19 Dec 2024 09:19:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: media: add support for video hardware
 on QCS615 platform
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
 <20241219-add-venus-for-qcs615-v6-1-e9a74d3b003d@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241219-add-venus-for-qcs615-v6-1-e9a74d3b003d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2024 06:41, Renjiang Han wrote:
> QCS615 uses the same video core as SC7180.
> 
> Therefore, add qcom,qcs615-venus compatible to qcom,sc7180-venus.yaml to
> enable video hardware support on QCS615 platform. Make qcom,qcs615-venus
> fallback to qcom,sc7180-venus to ensure compatibility with existing
> configurations.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---

I received this multiple times. Don't send so many versions the same day
(or don't send to people internal testing things, not sure what was the
point of other posting).

Best regards,
Krzysztof

