Return-Path: <linux-media+bounces-49362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C49CD69CC
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 16:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C4793075441
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 15:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900C932D435;
	Mon, 22 Dec 2025 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ko3Kyb5m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8204532E6B2
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418420; cv=none; b=bjDIdYSUWX8Tm1FtGi1xYvBxTWhen8bQhkGox6wvpsCGyuQqF7X+QuMIWks9RFyzlWpAiS4v5FxVAfFR/c0xHSJ+R54GYZrT+Ps/1Xl2Y0NnED3aU7ZJ5AzCKrtOWNgSX46OpaqqE22qOe0yN+4DhnKQDK8qt6THJoY2bnzoDmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418420; c=relaxed/simple;
	bh=GGjaLoQhCp+2no7ekK/HLa/7i2pLriK1t4fSCLCjjzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nj1oW9b9plE0KdQC2H7MXEO6lh5YGwYJIJBR8owhr8uYu0CJgoUmW/p5x+Sk0HnSxu9kmOol4A3pG2EkG9hzP2TwZYyj4jqdhw7u8JcWYw/lQ6l4UUT6ujAjAXN4hAcV7GYHTABWkmwtiHPIG1NYWh3mtt/cv8z6BUQSGEPM01Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ko3Kyb5m; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-597c418b79eso208274e87.2
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 07:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766418416; x=1767023216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQA+t0BLvG8fOA4teeYPO1i6EIFLXHkisNI387Ij+Uo=;
        b=ko3Kyb5m0Ss76GDJyfVKtsUmcbNMT8ItM0jKcunFuyqjbaGugONCnKTIkS70OyPigE
         K4Jnao9v0TQJ5S+eSrxn8kExEaiONiaZXXenXkpS88QHZU5bxVCC+NOp4T31DQ7RB9A/
         eoGn/yfK4czxjDphq9NblT4luj3je2OZqIKbZ9B5LgdAu2y1xRh+aoJ00AjHWxWe9+uq
         ncDjZyKDber9PLqtj1JFexJ55b9QST1z8ja4rFwA05vH5qNod/yPUpMKOfLsyUO34lnv
         S+sY8jn1Ss/ZTrMVvD1sJxgWStytw7ax29V+UZZ/IuBsfsajoIkNS+DtYtRzEiBfQuwK
         plig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418416; x=1767023216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQA+t0BLvG8fOA4teeYPO1i6EIFLXHkisNI387Ij+Uo=;
        b=v0ZSN9XI77LmXuJqljhREPMzmUpn9MVMGK+a1Vu+8qc6mQDEof+NetCHLv59Bxy3He
         7SyN48GJIUDeeGtV66PF4Tik61JgFNwxk79KZZG8cTodfx0y0UeWHNCKXJ7K1SRoHvlt
         xB93vgfzzUteL35TotiReztEskMW2ePs9hihc66XGbYHpDwmTUoo1VtOgvZyxkzj++iU
         nbnyhjSX1UkyYMY0/eU7U1X3CeItvHLAaEwffr7hH2+ghLnGenOPYtRttdYHE4f/kylQ
         RPYQpJYpQzCeQSdRE22G7gy6di8F1PkwFiTb9wt6lgRYMEgagbrSNjfyy1KpNtqNE/5V
         sTLQ==
X-Gm-Message-State: AOJu0Yzs6/jbYVCQ3+RcZybOdFQjXWqMCJzVi90AT8WxKWHBZjuWKP7W
	ZRWSu5L1Z0dPY5Xf5VzoM8RJj2n8/MubRpvBy1MyiKWIISjXv10IVUQ294Eq3Bq0OKY=
X-Gm-Gg: AY/fxX5dlm/iNlHznNNipWZKxf4jI7UiT/i5yXLQhYQjPzomLhRv/aLAptCnNVzy9SH
	3htuk7jMZfz5I40x5KtqwKC2ZKRy79hcdxz02ufhIxOzeUZlD3xSDHr7VIQzl/F+sWkFBVVGLby
	WMV81a+x5ovYKGzuHYOqRxPCFHSEehOTvgs7YGZaqWLNa/Crpv9WrslpdBEUVXDyTS5JpPsHO3Z
	+Mt2sTE9CLD59SSIvbHydr7TqyXLhdt9eOmF8zE6LHJAOX5nsaYBFWmqEMZ8nbCxYLdVSO+9FPT
	nEzXJOUpeAjTQx4vDiKGUQvIi2MVamajuFxYhZ0iV4DoHMbD41Das6vMBTYxxGIgMplJ4W1FtDr
	vLPI3CFsQQ1jRJcSm2Y9VeAdBpJJLpuAjQptAG3OkYA4dHQltGgon5vRKuDTHdfDSunwLUhhnUR
	1GSrZnRv3deBmNuht97WbJYhL7u8E9uE7vGsQSNf4u7+iwkTGgHq7n4GFex21Ev1gA6Q==
X-Google-Smtp-Source: AGHT+IFQx5aNaZttip8OpGBoWMCmObEm/k41TzjlVuJvY0HKmyBGQ4yTX7ngXbHyytCtqPSY3zkLCQ==
X-Received: by 2002:a05:6512:61a1:b0:59a:11b8:88a7 with SMTP id 2adb3069b0e04-59a17d073c6mr2364604e87.1.1766418416446;
        Mon, 22 Dec 2025 07:46:56 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5cbesm3367729e87.13.2025.12.22.07.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:46:55 -0800 (PST)
Message-ID: <d135e715-8949-4348-bf3f-cff01911c988@linaro.org>
Date: Mon, 22 Dec 2025 17:46:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: dt-bindings: Correct camss supply description
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251222-docs-camss-fixes-v4-1-914a4e5f7822@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 16:16, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Usually, the supply is around 1.2 V, not 1.8 V, and also correct wording.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Eventually, if more changes would be requested, would make sense someone
> from Qualcomm to follow-up on these, as I don't have schematics,
> documentation or also no access to the internal resources.
> 
> Thank you

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

