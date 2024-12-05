Return-Path: <linux-media+bounces-22739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D53709E5B0D
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 17:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FB0D1884C92
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E2C222575;
	Thu,  5 Dec 2024 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcE9ZlYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C48721D589
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733415083; cv=none; b=mgPum0Vie0c+T2E7ySpowQ1fZlZFKsQoFtKWuPg7olgXoiCj5q/oIEcV6gXKwX4bKiWFL54aIYHCoZd4RKYARgBXsGnU/ihG7ToIRUTHs4M+KzfwaZNgdOvk/OQLoukhNfGg4BkXKmdjLGSykY1a74CBBksUcrB7l/+YQ0u/0Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733415083; c=relaxed/simple;
	bh=4cvbUpYGVqBA+5ai/iSMN03QRJijrW6a/ORs1SZ3FJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noiHi34ImryiFnybAFIUaQ6fhJgYCf2ZgAp1XaC47OVYJaH18ei6OLXce3HepAUpb+S+y0mldiKnJe5rwH6WWHsKl2tvdqRdU/a9i2TgVEc3LV6DaG5JkMFy+LtVDd3fklEnTIlp2cxTbfOnBMOVgswPvYXed1hdvY8J/yKZSqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcE9ZlYJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffc86948dcso11063551fa.2
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733415078; x=1734019878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vAx1ky+XubxvxkSqpCsICGxY0icdOX0ReI1Rb+eWgA=;
        b=YcE9ZlYJ0sHi+Mev5UheCnJwg1rEeLJMovhxUPe79Y/1EEybZKPKLQWA4k306pEqhw
         uLWo5AcK8+SnO1NVr2Qbinzi0dLGX4IjBWcO/Iytr8aABhvmCcyNXasFgYCRbo72ALCF
         +ZnSLYWGc3lTgeQF68uznDyYUgUUc5d3wHeugrBbNGeUZioeLbt5+8357mC/uh+iVDog
         NuZEGtKAgAA5OAWcvxQ2VhmQRdPSFpTJm/750zgkaWGzgE9+m7ZhmLTNe6X7O+ciCcGZ
         qQ3RcekS+b/QkOXlGzAzMP2FINg+dAADhhIfEcSWjwHSsL8mMKQBmuWey5ij/hWQxJo0
         xVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415078; x=1734019878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vAx1ky+XubxvxkSqpCsICGxY0icdOX0ReI1Rb+eWgA=;
        b=G09V1PjXEhwrmVoUpLPEG1seSPwGprqIvhdprCTD73LKUTasWsyE+H82iegNhj5ima
         6X98FpOEe4rNkv3L7VnaamwwEe2ygz5SFHkxqFPL32U6qXtuN06dzGPZ0zcNUr5BZlZv
         f2GSkNlgi8DnmAqj9ybLPCUE223TQBPI6NbuxF9VoKMn3y6RwciBiWSd0WTLmgHcFGUl
         lp6zwp7cqrAoDVraS9zuC7SQWcv3NsrD5hvsHrzya56oPU8WZ9aXZBuFoHUbSE3JE5qq
         7JfxErgnZlDF7mFZAmPIZ5yDQiL/52wwhul59OdQBR8MDOjmzaj4DBUKhLGmpTWbTSIU
         c21g==
X-Forwarded-Encrypted: i=1; AJvYcCUaMI2X0FZdtSOS0yrgD1DCnjm3//N0EhR+WDzUlIl5MJWp1VojyGzLYQxw/acarQJpk/3ar6gD3f2E+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcrYhZVFbdXx0EXWKQ92S4mQBgmSjjWCmOkaYlFygTHGb3f2zL
	9+t5ZjDR/+M8JBHUzIzHjY8HeN2JSIMPOAQ8qOGUwXneII/s0cBHK/qmrPiGOgc=
X-Gm-Gg: ASbGncubynqPBn/SJcqlFrU3K7PLU1+Qo5YsvreGjUWsF2KyW0x+Ya4KVlfIvia3I/p
	PYqpDaO/tzfoJy2pyei3Rn1Ofvz48PGqg8JUUIb2QOLlI2g/ga8A19zXVGoarLXKd+bvzblEZfM
	DFrxNJI8aR1wlmyPSfW6E6jbyt8IKde/jBcIoko+5GY/dKs1nzbT2+G9AawHQe/Uv1z0Rt7/pnJ
	ghaJ1BlTl3hb2lipgTf9DyTEEkW5BUVgrnQYD5gMg2alK/w99jdqL5+/kPqA1E=
X-Google-Smtp-Source: AGHT+IGa6a28W61iyTDan8zO3enSWPo6CBbm0HhVWYO80g9pqx5TBN734XHJ16y+KxOFW8ykpVAjnw==
X-Received: by 2002:a05:651c:1614:b0:2fb:5a7e:5072 with SMTP id 38308e7fff4ca-30009cb184fmr75615231fa.34.1733415078119;
        Thu, 05 Dec 2024 08:11:18 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da461sm28223735e9.20.2024.12.05.08.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:11:17 -0800 (PST)
Message-ID: <0909a2b2-089d-41f3-82e6-f0e05682ce27@linaro.org>
Date: Thu, 5 Dec 2024 16:11:16 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-12-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241205155538.250743-12-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 15:55, Depeng Shao wrote:
> +            iommus = <&apps_smmu 0x800 0x20>;

This iommu list looks a bit spartan.

Here's what I have for X1E:

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/9686eaf9557c386a2525d6668da6fe24ffd518c4#5b6ff684e5292a4c0b51f6a38631777fafae7561_4749_4874

Could you double check this list ?

---
bod

