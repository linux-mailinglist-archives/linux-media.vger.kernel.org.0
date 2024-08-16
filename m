Return-Path: <linux-media+bounces-16397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB812954D27
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 16:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B0071C22DB5
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231581BE225;
	Fri, 16 Aug 2024 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="itzaq5nW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0FB5464E
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723819798; cv=none; b=NVzIHcWS8ON22Y0/Jy/g0ZGmiq7QAt5QpWDr2aiDRdmVzzvGqCEP3lq9USI7EziF9ymiBzp5VPdeiHwsg1vrAMF5Y6VLZk1nNU3e+W+tL+WvKb7sqw5dQGDtsPyqearK8/5UoIJW1oRLPmlHbDPrTlRuQzdfmJuj5qWvDwxPiyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723819798; c=relaxed/simple;
	bh=2enB8saFSGepNC89tanu4rWlGuVIw0JTN3tAWwfyX1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZapxFGeUhQNngZU4JvKMr9hyP/ZBCYhE8qX8tNIgSBkAbtvXO/3qF7QZqXXUdkXc4tlYANQsvju3Gw9+sNCpNgQTGLVSkJkh8nOMn2ri2BkyaEzrkdcqrRCbDwpYfn5pUFdRNiuJGoXbd9geaj8taf2ar9+D2EoX3CGcEDxgW+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=itzaq5nW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so9166085e9.2
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723819795; x=1724424595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pw4iidM3Iet1Iv8rE86QFCvc2BvOF4+YOePGFlWP7mk=;
        b=itzaq5nW3tIUTsKK7P3ZOd5xOOWldiUmAtZirtAVHdtN966bUpEO0peGXsQx4s1NP0
         gcdC87x3Kvq8aRfxO714oQ2bilBpLDHCNOCCXw7tM64Ft7diKVbGl2jxJefweOdkRcDy
         esYxu8zEbscA6Edy85QF8fCcvXME0C1QEG1bELAy6dv7JHfQm1nZGOhyy5u+6UH1BdEI
         sG1z9UGtl2aMH18NAD/EX9fMb+vvKD0xPwsBNy0oVkcGf56NnOTGI54wg3GYkV/wDu2y
         9RYAtG19GkI6vd17cTInjnzuXzESpN32lhggCZ5dL5Uil38K7OvB8hZmdtm8gRdmRl+Z
         NRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723819795; x=1724424595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pw4iidM3Iet1Iv8rE86QFCvc2BvOF4+YOePGFlWP7mk=;
        b=BBZnX1ZMDBsY2Ko/y8M8+NUz9iyoxyC/wMcwOOhgtsX5V6Y+MBNI+BACJhAzYrrFww
         3L+guqVkgpotyiUjimAhcZRBvBcR/YFisUuS01gMmbRPWQ1tp+H+HQpOEg0jt3JCEHAd
         IOkm3zpRP8Lmpn+S2Qew017/AyIoluvmiZR4/3jxQmdNLimuXj67rJxFruza2hckxfIo
         4CjFWQynAyO9TfrIcWyKpDRHlxK1NHanwJabL1YBFo1yQAOgbsL89UicEMi6BG4+8goJ
         FBSgblq9acquxyq7xSFrsngh8FnUtNmcKVxNs9Nb0UcJ2oCF0nk2ANxxHocvjb4wrgi5
         BBPg==
X-Forwarded-Encrypted: i=1; AJvYcCU1hI4a+g8PyNHJA0vbbqqi9Yl8hJUSXbtwnNTLwLD0NoMOxJq1jBoxpIgfKFmGuMWvTxwlPhkqn1Phnmm2GFbXRzktF32CFRg9IZk=
X-Gm-Message-State: AOJu0YwU8ntI9zL00SzzIMSCcyX/2iz6165Ze6q/9jC8/ypKUKU3dZaQ
	dkWihcIKtDDu+Jyu4JUuSkfL4erBJ1VQzJ/gTWzP67yFrxPAsXHj2yFUqAugccI=
X-Google-Smtp-Source: AGHT+IGL3TqYk6Ij32SQRJwqCUgOZPNuyaMk+Z/Wcbzpeq7we1ONZ1kpKcda432RVQqoLyc+8z/i+w==
X-Received: by 2002:a05:600c:4f4f:b0:426:64a2:5375 with SMTP id 5b1f17b1804b1-429ed77da5fmr22292515e9.1.1723819795005;
        Fri, 16 Aug 2024 07:49:55 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded180dcsm78486735e9.4.2024.08.16.07.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 07:49:54 -0700 (PDT)
Message-ID: <4bd0c70f-f425-4cb1-af77-17faa6af2fd6@linaro.org>
Date: Fri, 16 Aug 2024 15:49:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240812144131.369378-13-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> +	writel(1, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel(1, csid->base + CSID_IRQ_CMD);

CSID_IRQ_CMD bit(0) = CMD_CLEAR

> +	writel(1, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +						csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +			writel(0x1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);

CSID_IRQ_CMD bit(0) = CMD_CLEAR

and again here.

> +			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +						csid->base + CSID_BUF_DONE_IRQ_MASK);
> +		}

re: previous comments

1. Please define bits so that'd be

#define CSID_IRQ_CMD_CLEAR	BIT(0)
writel(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);

There's no value in circumscribing the meaning of bitfields in upstream 
code, we just make our own lives easier by having self-documenting code.

TL;DR please name your bits - a blanket statement for the series.

2. And as mentioned above, you don't need to execute that clear n times 
in a loop. Just do it once at the top of the routine.

---
bod

