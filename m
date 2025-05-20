Return-Path: <linux-media+bounces-32948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BFDABE37D
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 21:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB4078A4F3F
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 19:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040F2280CE3;
	Tue, 20 May 2025 19:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjyEKmom"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13392701A0
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768440; cv=none; b=lNkJ5L0I0zUFEPiY/tX+SRHUn7G4+A2UHcEJME17+FLHF/Oo3ZE0igZTe4aKwbJDruy90jOvpJf5gsPUclB3FZYPhhQ7Fc5UTNNKnkK1uhsvHqU7vFAQAFg0mBBDLHvWEYbIxXtJ90ZFV14qYynmH2kh44OfJuAHVv1gFe8XqFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768440; c=relaxed/simple;
	bh=Gg/5+OCk/JudsRhzmSzNzSjmr7paX/t9QtRcjJ+oG1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFDCi4Q5bojU++2j9rg9x8c+knoJc8wDbUc7EddTCoxmCddTivW6hilPyP4WwSdDabW9q8b2b0/r2HBOWjGPfUSIN6X3vwBBWGsYk0JI9jtSKbv+6YIg9DoUArUIFGcI5okppeJX/exFL/JxbpTabOW8iukhkxbLSzPaJAD+kQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjyEKmom; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so49055885e9.1
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 12:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747768437; x=1748373237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2ItjY+ppg/pynow7rBGAmh3XSiTvHkJttkVqK8jN38=;
        b=rjyEKmomrbo9OLuE8V3A/iyAW4qPfEdpJpzRZBgxbQgf96I1Q5Ckpcq26xPSMUZ9hi
         KJOB3c5DHS7zMoKbKd2rPmzNg1Grui8zZl86gQJRvz8VGh/pLabYqmHGX9GULd6cy63F
         tmlRNVO8CgFLNKAPPKDemwOf0Dip6i1zDswMSK9fmbTf9Pqg8opklyOtGqcCzERyFl0E
         OGVy9UJib0cF7N9131E2K/0PktyAP6FSv8A1pWLhfOQ00BGOhTLTuxPoAeQo1x2vaC3Y
         7C4dXUKwQcK3rzdXtzk7efdzTwP+4TcETOoF7VnsSXsTiR+/fHsWcAZS98ifUw4gExze
         JOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768437; x=1748373237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2ItjY+ppg/pynow7rBGAmh3XSiTvHkJttkVqK8jN38=;
        b=H6e1gF1ojw66/VBaSEDRJE2IAT/uUAk5lqweSDt8c9pucQA2s7yH5+KfadidoZ22pk
         tlfU3Bk8amsI8f0Y17OfnTdb0n67bOIr+lhKk7LcV8b+mogF08CVsMG3JwXgK0srIttP
         npSyEEwCIN4WssgTLfJK1S5778cV5WMAes1V4AMn2JEdZwM1RyGZHRqhCXa4FPPTmqr0
         uGcJK//TNtz0bm1H3DLDm37K4xgMKk+m4XVDn6r9a+NTgCKlYv0olXEQQ/c210uVqi9M
         b8QIX4IuGukKQ8OjKFPQ1sF9wcN9eigXeDlf8VPhT86dICTXkiGAWtW0Z+XXfB+yIy1h
         EcGg==
X-Forwarded-Encrypted: i=1; AJvYcCVYpr5jlDj2ubtX4W6fYkZA5elJMtYNakOfou7RiuR3iaDRsYIbgWBoa7n9F4+aguFKRVw4M7w9QTPqxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGxiyDQCCCF1WLk/04TbydWzd4Duhl0NH3ky8Dn8P9GmVBNz2
	UZi9ePBNCuUZpckjnEyzWz1PLm6E/ytKg3w3Yoqr8uoHhTMapoAtMSbGFaPyzPkS4Hc=
X-Gm-Gg: ASbGncs6Lr1jVMOnultIyYYiO0qbJ/6iph+Ba8fNl4CvbADa/TRa9ZodxKF1L8De5E7
	kYPC0z0t9nJxzo8U3qOBDDmyolsWSUl0LpWHErUPCeL3ztRJUDkS5XTldcmnmOZqnGCtmR868fh
	09CXZitTyDmAyRwAgYFzAx0JS5QyXkLtbwf6GUUsO2mRLmYKRCuo6Pd6V1gatvkeS+W1ND7TsuS
	IwgO1RxmDxFq+6QkLCSzGTm6fHBFYiZ+zr0i/FAJxI5hscNCvjeDB6d0XgdWT54h/krOKfrRdSL
	fVE6kHWhE8Ckv+bVE1DPXMeCBPRVVw+gf8gq+lP2kNLjVh2ncTG91MNd84ZjBG9bgI0IODoR+FJ
	VQyyR9XhEUbmoVnP7BScnAFssLpU=
X-Google-Smtp-Source: AGHT+IGcrcIy9jaEUMKlVB1MmWkeb0LtHs9wFmRKy8FWnDAUbDIjQBgUB938Lg+/2PJo87PETkuX7g==
X-Received: by 2002:a05:600c:c0d2:20b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442fda2e7d3mr96042025e9.27.1747768436961;
        Tue, 20 May 2025 12:13:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0554fsm40830215e9.9.2025.05.20.12.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 12:13:56 -0700 (PDT)
Message-ID: <f658468d-1780-4995-b9df-96dc0203e045@linaro.org>
Date: Tue, 20 May 2025 20:13:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: Add support for MSM8939
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 19:39, Vincent Knecht via B4 Relay wrote:
> +static const struct camss_subdev_resources csiphy_res_8x39[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},

Regulators should be declared with the PHY not the CSID.

---
bod

