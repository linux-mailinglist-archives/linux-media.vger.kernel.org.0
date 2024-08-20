Return-Path: <linux-media+bounces-16541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D6D958698
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 14:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0858E287D4B
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 12:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D023518FC90;
	Tue, 20 Aug 2024 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gacyDN3i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CFA18FC89
	for <linux-media@vger.kernel.org>; Tue, 20 Aug 2024 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724155714; cv=none; b=CnwOK+Q3GErKWDt0EBdJw8jiFyBN2RT9U6Hm3khh8Eqe0YzuA6eqQL+nWoqVY2JR+OKFRDe3TSseVA/j3e9UynPLvJQQIrhhqcLWhPEsVALmTq3VRhMQXjtVRt7lR4S7BqH/HjnBQgnOftvO1rT7KioYbpjqijWWG8sJ6vRrugg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724155714; c=relaxed/simple;
	bh=y1mlKypWtodaCGrzVTsxH74OgoWdbq/gwkkgwWEhz+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MeLCrAl/do7b2gC0Xbac2c88lmG6jId8Eau9mY2GYc4yVw+hsz+tJQdk9wFhHH6OgE2StA+jcoBYUA2JbjNm27JVxRO1fa86iVh4DEgyhfvvOWX6q7IPQoVx0jWIibn4unOk08s7Ch7ZkLLE1p/uMCf11n67Ak54mok5DKBzeso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gacyDN3i; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5332f488c6eso4879272e87.1
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2024 05:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724155710; x=1724760510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XJKP76CouD8q14UcNI5cVrV8SGgjx8qr+hf0bLJ6IaQ=;
        b=gacyDN3iVeV6yMyU9fifpPbDqRX4zSvhdUiR9BB3t+WEnaeZcifxu0btC0e45gG8QC
         CZBVg5TXcW+HOjERYI44KNwXRfW62CHhxvznymEeI4u8eb5tHuf3F5+A9iGQST7BWeY2
         HXRiJvZbxICV6Ycw/QSCrOrjT/yDtKqF+kmA46aQYnUyQaYfN5Czrbl1cDInYwMNGhT+
         BhPOH31JCscMpI3Z9HwV2G84x4P7lPOmSsmCJtp8VCDGV5jW05H77+szPNkd52VWpADL
         jzjfFnOlX1piqz9r4Eu/qd9cCY6D51Kvj8XJ1ZQYZuKg3MGqWXHAN6nnGi0JtCy3eBPX
         SR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724155710; x=1724760510;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJKP76CouD8q14UcNI5cVrV8SGgjx8qr+hf0bLJ6IaQ=;
        b=cJdB9vUdeVcAzpRd0OBji8JgfXozOLIBMhYb4xSOzG7PzHXOg5MpyhEDteH0z4Tuxv
         ZqTf4drsAF9PkGOw4DJvQSqlZWftx2dvyWsbTLKxDO1ar9DYKTnYlP24SksusYAej9Wz
         z0xShDzFYLHi8/ru1CqIfPorVBIyjDN3N07wusv3yV0iJCXzJCGxNRoApgLVLKheErIA
         xLnGXgiI1pfG4Qmg556e/s20QMEu/8e8qr8yBN66rPgvL44iODS4ET16zsdOFFBasEfa
         Uy7BuEjVeiY19rBA6HKWU1HirAt9eBfcsg1oSQnb6JfxpYCPZ9rBNNSrg5tm4ic4HuS0
         v75w==
X-Forwarded-Encrypted: i=1; AJvYcCVHFZ36qEmnhYlNB+e6PP+ehDl9tiWRAH5zbDPAqKu//P3LYdX2UsNOna2TjObkRdk2fJTxPyJxy4nLQ0ZyzN6ftIiEOCp7YdCNs0Y=
X-Gm-Message-State: AOJu0Ywexn7wVsrJ3YRtDTL+k7mnhsy82FxTmtkGgY7q4rJXf43KoM0j
	s/ug7pkmBgbpUd6ZwIpU9BHTEcL1gPAlQO3NEfPBQr51f6WSmi0zsWq05yNZY4A=
X-Google-Smtp-Source: AGHT+IEF9zT4lF3HQI46a4mMAwlYCEPY4iabeAUetjsE8T+UXNumUW7ckK6C0wnTbgkThfDf4yfC0g==
X-Received: by 2002:a05:6512:3a85:b0:52e:9921:6dff with SMTP id 2adb3069b0e04-5331c6b984cmr10884191e87.26.1724155710320;
        Tue, 20 Aug 2024 05:08:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cef1esm757376166b.48.2024.08.20.05.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 05:08:29 -0700 (PDT)
Message-ID: <9172f40f-c886-4fe4-bf12-d6d066522921@linaro.org>
Date: Tue, 20 Aug 2024 14:08:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1] MAINTAINERS: Add "qcom," substring for Qualcomm Camera
 Subsystem
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Keith Zhao <keith.zhao@starfivetech.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240820112053.560605-1-changhuang.liang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240820112053.560605-1-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/08/2024 13:20, Changhuang Liang wrote:
> Commit f5502cd25ac0 ("media: dt-bindings: Add JH7110 Camera Subsystem")
> adds the StarFive Camera Subsystem parts, also complies with Qualcomm's
> rules. Add "qcom," substring restrcting this condition.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

You miss "media:" subject prefix, so folks will notice this patch.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


