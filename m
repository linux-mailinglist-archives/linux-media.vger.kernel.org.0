Return-Path: <linux-media+bounces-48316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80357CA72D6
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 11:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4425D3012265
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 10:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49BD2D94B0;
	Fri,  5 Dec 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBrWa9c9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F6318124
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930829; cv=none; b=ulZKFpIdWV7Lvyu4yn8OUpzxklpQ4P0MEA8FmBft5Lc+KlySpa4dh3Hdvd3MTWxtOiZS6Ib7tSfHgCrMv0lflS3A0tapho2Zs144llv3psKJNMDYzNdFfeSdNPFG7+E5J95vTZWB5Rj3l1R4Uip1y5kj8MPxrvSBqPAJAYVuhRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930829; c=relaxed/simple;
	bh=2zQVkXy8AVVI1kFEAu+O+ca58FKkvPeE77EeUvuPheI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/7oA4Ck8MJJE5Tnqa3Gv5xT98Prk/Hg2z4rraq4gGL1eHdRuWCjSP0dFEY9R2HRFnhHFJSGE7ZjRs5nFS7H9N9liI1Ho9ZlzNR694AopSyI9pvN3wNnz5K5CAQGXfF16ikiuK5kN/+/MhASA4mf0NYAbXVL8BoBKVek01bSAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SBrWa9c9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42e2d44c727so998294f8f.0
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 02:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764930820; x=1765535620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAzLPSLG7AtJee+XVA0Hp+yvy+eodAcCDH7vUMbwv0A=;
        b=SBrWa9c9PfRq+QJukl83WM5I5bvPCk1IpTqyzG82YdE/4+pKsE35ZtWmdqbFu0Im0e
         7euHmSXiPj6JbVfW9lb39KiU/7htBPusriEciZsOkAQu2D8Ggtc5IbVQI++38WB7JpfL
         uyiJAvzaf3cxXDA0XDnqKaU2Eaaf4065OAK8YL19dkvFFoVC03/eB48mUA8b2SEYo2EW
         KB7ljuC8MOHuw9Q6YB1Mkhm7uRCNx49Teou4vNF00fToikZHTQuHV4SA+lwCzVrZJxaY
         32JQAhlm7SkcKUxXgbEWjeVIeg0nhGz7VveOgLbposWYD1ZnVlHX9VvrMUKJzqZVqkH4
         s/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930820; x=1765535620;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAzLPSLG7AtJee+XVA0Hp+yvy+eodAcCDH7vUMbwv0A=;
        b=DuVBw2GeRVNLyR1t/MD7ZsbtTswAQg7KKKUocBBAuW+8UmBQTHUY5YxTIDCIiMctDO
         X91T6D7omIb7kj1Xw2B9JgxpsXGZs2bRUQ+YP66oh+G955V2QRfUWYuaOjRTvAERm4cs
         UW4Px6Z6jhQUvwyTgKALcQpTIGBLy6vaoQCTsKwXdso5B2HkqoKKt07zSYMGpvAozLt1
         3F5x00C8Jp2qeZLnPGnElXeO/955H9IdtI3pQRxDHbdCHG6Km0ZVdzJWm27YWm+RMx5p
         9bh6pvgFlTej5Vj74OScRkN/XCBfPnKOdMBlW7S2QIjU0lyBHyPmGdjyihUrztOpy07e
         mx7g==
X-Forwarded-Encrypted: i=1; AJvYcCUM+c/qzP2LSlrv4qa5uZQ7wWyPBe2U3S/uo2QQJZ9nWSe1ZQhL4CR2iQ43p/Na7b9JIAw67sfUWXFK9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvjE96D3A1oXfzEvF41p6ileVgCwETt3Jp4tUWGve+oRbdY5Vo
	BQTP/kEjogfp+7k7kZkaVkGjrGowvyrN2hZh8gUCJfnlWVaJ79H0etDJspcCeL39gZI=
X-Gm-Gg: ASbGncvW4QW8o2Il/cIaZ6beoiJzBp9RKqaUfIeys2qHI1AGI0f6B1PMEyHNCHJpR4c
	UyVhya+VUVj9PvDPvbZdYgo4lZOQ3gC9FilP8VU82kUAqcGLPbqr3SaGVqrfWfGgAusICpcBYeA
	QSXoX68rhVGu772j/aNxHZFUHxYhZsbXgcOklvmpnkMiJaW/IIw4pduPBrCt6mtWwnUrVUgJdxa
	sS9l8suLzj0ubJ0zfAHQczuPaf8kh5fZGPtVOWPYhGXU2CTT3uQ4luXVx8EVdjVr5sun03bzAAz
	xHFs1u6b58hmf0fJxxf7QaJNTUgz0oOfRy2mLomt6XA+N3erqMmD46iTbkjzec/+0tzHtvjfLNS
	3LhPONSy/ZEScpRLElFZNVoZJ1T5EeRM3nYslMnKQwIe7/Q6UG46uZPUrnmMSLyoO8V2UqFqdCU
	VCysPcbA7lvo7nEwnUFoji69mEHdQLKGJCNi4Hcz4SY1Gf0wpsgkGe
X-Google-Smtp-Source: AGHT+IGmr8vG9r+BJjkWvvjU7SasEQlgu0FAyDtwLcxQqvgN22qOU1pGX5mKZsJ2hiueUbXQHUz4hw==
X-Received: by 2002:a05:6000:1449:b0:429:d170:b3d1 with SMTP id ffacd0b85a97d-42f7320bea0mr9668770f8f.59.1764930820250;
        Fri, 05 Dec 2025 02:33:40 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee50sm8133308f8f.14.2025.12.05.02.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:33:39 -0800 (PST)
Message-ID: <f76aef3b-5886-43d8-b15e-6513abf8e58e@linaro.org>
Date: Fri, 5 Dec 2025 10:33:37 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 2/8] media: qcom: camss: csiphy-3ph: Use odd bits
 for configuring C-PHY lanes
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-2-6b35ef8b071e@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251204-qcom-cphy-v2-2-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2025 16:32, David Heidelberg via B4 Relay wrote:
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= (1 << lane_cfg->data[i].pos) + 1;
> +		break;

What does the DTS configuration for this lane mask look like ?

---
bod

