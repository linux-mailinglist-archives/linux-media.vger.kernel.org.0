Return-Path: <linux-media+bounces-39564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 250FCB22357
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB4121884223
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0312E92D6;
	Tue, 12 Aug 2025 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AARhKlah"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72EA2E8E00
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754991418; cv=none; b=nxj00nXRKCIIJRayCYsvgBZFXdoDbbxjw+fl1EiwG+aCtlZilZE+6Qi3aBBMrbBhLnl315DDdxrREe6JfjbobFyIb9D0hUVmuppsJNFxtw4Gt3EayThJ4cHRn4qXNGBOA9orOeuEPR3+ycpSYgLYQkDR9xjEDzQmS9rKr1tdfUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754991418; c=relaxed/simple;
	bh=xy7fu3bqLVGUxcOG89JTlBYxbGin5ym/A9LZ46qGwJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNra4DDE3cRCdr/YVN6eo7YbPWnrDDRhHdWvMPSEufU3VzvKhMtRXr6TM4YHxCRABOY3NQ31SB6n66fSG7Euq/EhqP+TzFZKO6fMsiqZvHu5JOReC/fUfqkqyuc2+RnRfcKeYR7IJYYSCDxDEPOpebdz6zcBd5/rbFgFtNwYiYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AARhKlah; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6158c9766f8so875460a12.0
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 02:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754991415; x=1755596215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ADwSJg/JZOng+mwbjsbxIO67zpngBFcvDlGmCvsbQyQ=;
        b=AARhKlahzRKOKfy8S7Xrm7cNEz3PNIGlMwfaiYtivkx79Q8gxTUVOLDV8VnnMvTUW5
         3fH/C9Br0CRCeoLDvfvL4tv0WUxhVaJ76WRSjTMRUsmoMn+LFwryR3t1nbD9pAJ+Tmb6
         fEBi9WXAsuqev/4PPjpPmv6S8EINKJsmZeO6Gx+tGYlDCEbbtROGUyHK3Q6AA6OhfLBy
         tZB2Ri/iAhqFIn5EdWigz/0CrcS6rho6D7A9LePqbek49eY0DqX+1Ctca/bxmpZZtj0w
         vbTpbPoxIOqPgVJEM1bGKo/opDlIOCXfChOWcUjuSPN4UhYl0VEsazXSU9M1N5sh42r/
         Hy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754991415; x=1755596215;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADwSJg/JZOng+mwbjsbxIO67zpngBFcvDlGmCvsbQyQ=;
        b=rCW2FfZFjGSkxvOsiNvlqb7GUygMt5/sXsQNXVZkIZCrXDo2Ef8AWvqkNKvxZG2aBD
         lLDm/yfMSz5QLlWRrCUAdHP7ncVsPVHo0MCPrrGs3Nb9i+szQEoCcPqLHAkHfyWd+R2Z
         aibuJPWJgDV4+SzjHqft4CwyRWmtgoEitYp+tVW44D80dxq4/EcvrSxuF2yuWIUaIzcP
         OPl1HwOB32xp5iYP6LEgomb17CXr5KW+jTHJqUeLwAvjF5iF3VucVDQXsLzWQ1DJ9dtj
         QUrVdLrC1VTl85FAcO0CKSUdMkJnb/mZpi+3f7HERjSO7QUtIBHeUoFWZj6WU073d/47
         0I2Q==
X-Gm-Message-State: AOJu0Yx5p+Z6fTAmbXJiNrgQq3HReHuJY+o/PxijeJCtX1Rdw/aqZoJ4
	BRu0EszTtk9a5digb5SKXHqNslkNt2qyjN1ycWRxOGS8pFedSKB6grZgRsTsB51/BGQ=
X-Gm-Gg: ASbGnctYk6g7Ox8r87pTK4ovqLWrVfxXpYqLYZMhJ86tRquaxLwGD/oI+y9tel8mqzF
	zW6IgPdRNsIHu9d73PnwLAbXwoV8JFKrGL5q5m0W9zmNtxXVIwTpiw7T7mhSPegDOCNdtKPJOib
	Jfto/EHOp7nBji6qerG3j7GRSY4AZAgwmKmvyNm1GciPTiIxb2psxVXWCE4J3bY9Lpx8VEbxuxk
	gmhu6p5K9yaeyeqpXGUXLdE4p+F+L2YEwzqWCgYHDYUl8KYQJUvKT4h6hUgD98Lx3nPgnL2tVhD
	A6/WNQS153ypWfBXZxXVoVoBP61ipHex4NUbiuDbmd+7093xFFqLLx3o34+3zZhZo7Hg7NjA0Sy
	7mEsHNBdBAJDIon4FZ4Z8KYgEM7N5Wpu1VWJuYhjwfGs=
X-Google-Smtp-Source: AGHT+IH68+DTudLvhjWZFe9I337nrE98NoV0wQLFkeyCzhFX8lSKM7+7m3H9OfPa7R3X5pnbmsMnZA==
X-Received: by 2002:a05:6402:34c8:b0:615:894a:7c27 with SMTP id 4fb4d7f45d1cf-618599ffb9bmr409681a12.5.1754991414905;
        Tue, 12 Aug 2025 02:36:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2a448sm19945005a12.20.2025.08.12.02.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:36:54 -0700 (PDT)
Message-ID: <7322c2a0-82a4-464a-8aa6-75d04dece2f4@linaro.org>
Date: Tue, 12 Aug 2025 11:36:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
 <c009fe77-8590-c467-a0a4-76bd6ec7cba4@quicinc.com>
 <363cfc88-9664-483f-9503-9eca7c8e617c@kernel.org>
 <76731f2a-d120-ed3d-6a1c-e339b0a6ad10@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <76731f2a-d120-ed3d-6a1c-e339b0a6ad10@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 11:28, Dikshita Agarwal wrote:
> As a maintainer, I believe it is my responsibility to ensure that anyone
> enabling support for any SoC with this driver has tested its basic
> functionality. Please note, my intention is not to block anyone’s patches.
> 
> To clarify, I am not asking you to provide any test reports. If you have
> already tested this series with v4l2-ctl or GST, please just mention it in
> your cover letter.
> 
> Thanks,
> Dikshita
>>
>> so asking others of this is just unfair and unjustified obstacle. If you
>> have technical comments, then share. If you are just making fake
>> obstacles to stop some patchset then refrain from commenting.
>>
>> Unless you want statement like:
>>
>>
>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>> Gstreamer on SM8750.
>>
>> Then I can give you such statement, just like you did for your patchset:
>>
>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>> Gstreamer on SM8750.

I gave you the answer here.

Best regards,
Krzysztof

