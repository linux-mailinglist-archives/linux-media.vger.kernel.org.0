Return-Path: <linux-media+bounces-23518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 862EF9F3DAD
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 23:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C0FB188F6F5
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384751D88AC;
	Mon, 16 Dec 2024 22:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OGSMpGgc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C601D63C3
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 22:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388918; cv=none; b=uNbSHnFJqW+LcjcITKnwbqTB3vALCo71kasmT0iMoL+/JEi+NHHJVKLmBGqZufHQekqRgTE/i7wXHy1TueZ5HXbV4bYHSTCxrkQnW6tgLjeG3bgKzJlxrpSckv/jyzJlyWst4+40rIZTBDobZHsKKRJqrV/2fhDFRwlVuKtUHU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388918; c=relaxed/simple;
	bh=VvwhMEH8kUe66+qw0Kg+jfPOcaLaStC6shKRZDsBkeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+TlkeCCme9cr/Gas9x7czt0sR0SkDXwIM1vvSYZaqdqJ6TbdA5mu+BYJBzU8gGKO8pJ7pI+kWQ8rVmKqzJ9zNlrqCy11ncoDWNYQyfO5myGzYvU9POsY3bvwsN68jf3fBZXfeT2bYvBzOSmyOJ7lXyshXgHiJvPt7w59mO6tbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OGSMpGgc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2610583f8f.0
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 14:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734388915; x=1734993715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgHEGOs3zRnlIJDFA130oT6k9XjZTGA0yhruWXfFN4o=;
        b=OGSMpGgchuPODsKfOcoonTqeww+nA1zSDPN/yel6xCPgB2tT+DXNsxgJDxs5pYK/7V
         6dhcCdQgyiMfuT4Nu0V1DhaMZ6G3qRLyba7UIVb/4CnKxWK18n0uoZX5hZQjS47e+vz0
         092iPrVRGdATGWis7PimB6e1wdRAQ1AY2yvLbtVDbpWNgVDf4Yo6I54bIEZH1fiQrYch
         uFn1RiTTyMnJcxeNC/TLN+KeTHXT01ma8pW2vLnHg3mAhk0rTKYuJUE5pysoa1tkq5jI
         WAElUgck1HUnYxYSlSNDR5VwIiV7inxgR9mgxmyOSK8vRWMFCAn64MsOoxpr2MgtWlzj
         jC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388915; x=1734993715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgHEGOs3zRnlIJDFA130oT6k9XjZTGA0yhruWXfFN4o=;
        b=uG9WDXBY5Ka+TAL8R1zGr6mHPa6fbcP495P/a1Wgf7hbb0ET0Wj1TsbOv0FPEOX/7a
         J9RUKbX6VdSZfOoSI4rFZFTsEieGjCi2k4BppKT30DGoK4T1LHTJ8YQlLfj0CCgKt+7A
         mKr90IENni4/7SCAmZ4WQCu7EnkYeClWagkiQEVgv+g0KuBbXF5xQ6f75sRdVOzm2XQu
         WdCg/V2hasGJDDqiMZyvuEk+UPkjqr+ovQ+JGUyJj9VA0hFsWEerjyTGHWY1KTzJtEfj
         U7ZHKFdQAbo5QMI6yrzsvDdAFpffN8vaIG8mqTHTryYd1r45QLDk+jrDfgI+LqDVtH01
         zCMw==
X-Forwarded-Encrypted: i=1; AJvYcCVgTUoPVXwN1SH1zKFcoi/iBnW1//HMqBVtjltznFbrQoa+Jgg7kotq9sEiiymJOqP6aleUh5fOws1piw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySpeiDcdVvm3I9MWGLOjSLL/B81hfpXEgWWl9PK+wVh30FqbgK
	a7wP7tSzWUPWJM7Rh2jHwd2Y/yA7dHlvKJcX5EAdifZb4T0rgu4RsbVXx9mKfEc=
X-Gm-Gg: ASbGncudB2L07Ls0VCLFFzXZaNepBHVbUD7rrRBwCnmZUu72Nif+pcuCEXR+UeCaqz/
	MswFUNL4hTswlR0+20Ed2xkeyqikiLm1oCHoGCvY1raiP4TiEo1r47TgOndn6SX/KzEWcNs+pOF
	iaY5l5EPVg2XoIUzJTxTJkuzKypE/DDF/R2yxeTZR0e5iM1u5w6GULXf9LeE0LF2FA1bqpEjBSt
	EuL6C9u4hpan2+/ZKTy8xBiOoxg+VpFQeOW04GpgjjQsWNBzpAY48Z9wJ9ovQCEGhaLfA==
X-Google-Smtp-Source: AGHT+IERxSebFar5uEuhs3YGXdu/HdonjGhSKASUlK+LCSz+kd4iODulYlgl5ClEwq5A1hDOA8kHew==
X-Received: by 2002:a5d:47a7:0:b0:385:f2a2:50df with SMTP id ffacd0b85a97d-3888e0ae608mr11291437f8f.27.1734388915425;
        Mon, 16 Dec 2024 14:41:55 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8047151sm9190330f8f.66.2024.12.16.14.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 14:41:54 -0800 (PST)
Message-ID: <56f606b8-35cc-4bbd-af39-106277530928@linaro.org>
Date: Mon, 16 Dec 2024 22:41:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] media: qcom: camss: add support for SDM670 camss
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-11-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241216223019.70155-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2024 22:30, Richard Acayan wrote:
>   .../bindings/media/qcom,sdm670-camss.yaml     |  72 +++----
>   drivers/media/platform/qcom/camss/camss.c     | 191 ++++++++++++++++++
>   2 files changed, 227 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index f8701a8d27fe..892412fb68a9 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -31,21 +31,6 @@ properties:
>         - const: vfe1
>         - const: vfe_lite
>   
> -  interrupts:
> -    maxItems: 9

I think you've had an error squashing some patches.

---
bod

