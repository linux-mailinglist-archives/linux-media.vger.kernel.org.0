Return-Path: <linux-media+bounces-24900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C02A16224
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 15:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7A6D1886053
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 14:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FB81DE4C3;
	Sun, 19 Jan 2025 14:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+in867H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD32F3E
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737296682; cv=none; b=UM4rSwqhwKsSOjavWplBxcSnT+3DYWvZkAptywYQi2AsQomnH3XX7E08Rx3EY9tGt7ilagNzGqLoDggAJGNoFdTZh+7K4vaxh+axgooXoN5mGgFXNPFGI9OxV/f+pYxapxb0AHDxnRnifOKHdP/UyA/7TDVv1p8dC4kbNgQhtVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737296682; c=relaxed/simple;
	bh=g7h4NlqJGMXBeebBP7aJfIDjHc7jasAVF77nqDtRFkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uFWvLXLwaCk7/Ou7slKIMvx5Y8rnYqcytjX7KeRvuQduxaCtbqAgSyAjt0bSefcXlBCHECLkHSMGShXoOOMD4nlNcz+Zc39KZFo9pzqSZJkcMkGl0n3jLaGF1TFPpvcOrpxNGtI74g4FnoXoEGFwI1dHrkXpW0M7wpYY8Iexz1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+in867H; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso24293135e9.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 06:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737296678; x=1737901478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BsZHwq9YYGM4tKLeg/hpJnM4XT4NmMxFvzC2Zd1xz6s=;
        b=o+in867HZ9JR6Q5P93wWMKkEK8kydIysVQtUlyEH0QUwrAeWu6uHy+HHcPR2vTkFKv
         bxADFYunkMhYzx/TvOVyJwbm7sdj64pmQp6TVftK7+jyLYMrs4S3nhR8tCSfUNbQ23hS
         u4EHsXtgwIOxDWBVI8u19z/JNRO7EZ9xNmFfXTSMsCz2+2bUYpKzexXXe58hhoFpL7Or
         l1/68UUr3+cHZIe+xzC0FeUjj5HTYjAAaVUZDu+LdxY4I8nIyvRqJqz1iWDmUVSbLYrI
         kn5Iy4gh9kIQKvZ7NKvboIOGLEqu4BA/HnhCuh6lMBUi0nKQZ7Rlf8JTjiVyRD7FA1Gb
         ZaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737296678; x=1737901478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsZHwq9YYGM4tKLeg/hpJnM4XT4NmMxFvzC2Zd1xz6s=;
        b=KN6apvNYla80QT88Ms+H21nYPYQEtiyZviuo6+zLURXwUN0DCqVzc3cuSqCoayncT7
         +GOlfEdPI4cUEYvJ3Kpl5lCnKjnABvaJj4jNJlqMCfTj85a0tySORVQwLktDWdZcxnqb
         rXLvnVvPzyEkRN6DQUFsdZp7mlw02hHvQ7Uuhu/8oDQiVKDQttNzLYk7gRum/pB0jwsZ
         btgQ4EaJ+qFOzWUxS59Z4UHupuUaDrDN+wGYjlg28iQD5YQOltICo7bNa1U7LMcBOspa
         RuE9U92J1T6XhdlP8GGuLg437IFvOxv1kS/27ZJliIjRcjtSNWBm6nXg3bY5uCqk9yMu
         B5tw==
X-Gm-Message-State: AOJu0Yx/DyTHzGDUTETXU41iyGSWEqR2msjUEAhop7QyWjn2GR7ZBaAn
	tvYHzuBqoD/XPVDE9MAzbz+4Fj9zGC5PlPDnSJkn2rmsgxY8wfq8TjUqpgwPTnNO1o6+08bj9f0
	EAn0=
X-Gm-Gg: ASbGncv9+GGY6aQF+e4CFvNY3Ffq78hu7x/M2nLof+uJug0SMmqytvoS4PMXyV1ThVr
	equPbvssiFkluRatiMQlTBjINzL0g5zLcBmJ/71LgzewK7vETR0bjxOf90hbyeyOPuVywcI5KfM
	LWatTh9H5IVJmjwdrwaIa9ZQ0hqIvXHXRTs8M9vEtVJQtTLRfncuTxODduT/E/6Kp85lYGgokkF
	mQYhdie8WWK1Pk7RCmx/qWi5TB1MzNJ687LkHiwJNG9v9fleDCmsCE48juej5Re+4S1H2xvAfCZ
	5JJ9l2I=
X-Google-Smtp-Source: AGHT+IEvPuhjBnzRgK5GvQ25U0lvYEyAbYmeNKLYwWaLDkQs0fArxTjvHwWEzMMG/z3mNp+fDS9IVQ==
X-Received: by 2002:a05:600c:1386:b0:434:f2f4:4c07 with SMTP id 5b1f17b1804b1-438913de07cmr93462675e9.15.1737296678544;
        Sun, 19 Jan 2025 06:24:38 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499b28sm170433265e9.8.2025.01.19.06.24.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 06:24:37 -0800 (PST)
Message-ID: <de1dbb4d-1dc2-436f-99a0-7a71c5854846@linaro.org>
Date: Sun, 19 Jan 2025 14:24:36 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,0/4] Add dt-bindings and dtsi changes for CAMSS on x1e80100
 silicon
To: linux-media@vger.kernel.org
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <678c5da0.050a0220.879e2.1cdc@mx.google.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <678c5da0.050a0220.879e2.1cdc@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/01/2025 02:04, Patchwork Integration wrote:
> Dear Bryan O'Donoghue:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0001-dt-bindings-media-Add-qcom-x1e80100-camss.patch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #18:
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 0 checks, 367 lines checked
> 
> # Test checkpatch:./0003-arm64-dts-qcom-x1e80100-Add-CCI-definitions.patch checkpatch
> WARNING: DT compatible string "qcom,x1e80100-cci" appears un-documented -- check ./Documentation/devicetree/bindings/
> #36: FILE: arch/arm64/boot/dts/qcom/x1e80100.dtsi:4450:
> +compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
> 
> WARNING: DT compatible string "qcom,x1e80100-cci" appears un-documented -- check ./Documentation/devicetree/bindings/
> #75: FILE: arch/arm64/boot/dts/qcom/x1e80100.dtsi:4489:
> +compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
> 
> total: 0 errors, 2 warnings, 0 checks, 162 lines checked
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/69583267/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 

It's in -next @CI robot ;)


febe15218072e - dt-bindings: i2c: qcom-cci: Document x1e80100 compatible 
(12 days ago)

---
bod

