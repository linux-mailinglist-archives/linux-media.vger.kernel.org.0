Return-Path: <linux-media+bounces-50959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A2979D3911F
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 22:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 209F1300CEE7
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 21:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE902EC553;
	Sat, 17 Jan 2026 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EOQeWH8t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83FA2EC096
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685375; cv=none; b=h4pnm4L0oDmts8eoMxeYAmkyRY1of/p/37txdGame4+fmxE8PnWj5CaF5L/eVW8uszlw5/49BFZazdnuLBOFB/zf32i1FlYq62ITpzeNg0akSoZyiBisiUQYlZaeYjJBJKTQyJquyAHdv//8cZ7oYbxY+k8MEmWdBQTZQJN5mM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685375; c=relaxed/simple;
	bh=+F8doHC+R3TqmCSMzKBhj25i6waFCtZIFSnjx/GJfFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amdy3MDgBz8tfztVyE1c5m6/P/tArvTrtOLjPnuivhc3naUkjFsNJJ+W0PCrT6XkAwlUgu6b2ZE+6bS3Ic/LPY1cXOdv0r3RD2c7m4jS4zZWDUysh15Dgsa5FQXPxtzCQNvtmbJMD7Bl6GMc4zmRUwbpEjbAHwLzOGfQaXiBM48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EOQeWH8t; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so18853535e9.3
        for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 13:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768685371; x=1769290171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUZkLJCYosO47GkqiURTbkox3qlRh5JiUOfRD1pS/eA=;
        b=EOQeWH8t6++fSCL5s+4bYK66hju4QyqLzCl+uesRvBJAihsFtn+gW7lr+5Zo0IHCTf
         BxKjrfhccthYWiVfwFz40SKRX9xQuy5sAX7Kq2yNBpFcif7N/wAbLXq3Np2dn6RAhyqw
         ne/Jv+5jS1YakqSX5Sp8y6fDTwa0xmuFjqP3mr3lZtqeiSE0iNgtG86W4E9iH8wmJJ4U
         pCwyJg+0u5bptYkEojuYJIZQLLh/rc1frC3ZrxSxLLWg/fcqL6OkI7gvP677SJNDsWqO
         qdoFFW4OKigRPfsZCjAh0oI6Pi4bzYzDIyoCYNI6z59J9L4dd4PG28ZfO1DsBphYew8K
         en8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768685371; x=1769290171;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUZkLJCYosO47GkqiURTbkox3qlRh5JiUOfRD1pS/eA=;
        b=vDpDWNX18A6KgG2DLZ1Bglt6OwAaKB5NdhFz2JgykKaAIqhMN0ZswYf/U9+Tt+3kFc
         v1CVR7lytQEPynWKq4pZePspj7eK2QGFInDe679cWUXj2S8w/BakmxYIJFoPnvzpzAI5
         DmIcp1cJG3wed73+DxNieUQ7RD+KW8D0oGCuIErnRB5zBRW8AqhSu9KAS+x3w+zNx7cb
         z8LPvz8cvxEuLK0Kqetb/RGNEQH1Q+g2nf7JnzKOe2aCwXRQKfOvrruMENRdXml0tdaE
         zSs+8PevaQnxx/kjLbEtMJrsN3L0VboZDIVEPnMGS247c/HO52aFKbCRse02t/neLyf7
         D6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhyhtS90EeRaEhcVeCWMXPoJh859CBTcQ9Eoqwi8tt/1c1UtdKNXbVpCXpTS0i4oguYIxOvmENoSmSCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1PDjHzRaf8qzmWZnRQIXv6EeYkdf5SAGKZIHOVAhv9R8W5RA
	Z48XMpOh6D6rvZmfvxgwX9jnO7kiEkVhNEWavvA2O/hq2xDzfUFylsmWxsJFeBCjZTE=
X-Gm-Gg: AY/fxX4J8OUbFvJcyQSSonPqGscmNfg6eK3oC3JoN75vr7koj0CznQtP2+Nzvm/HwUJ
	PedWOiODh6daNL4pU996MtXr86+0nnh/iK58vwDLIRMMmW46mxfZ9HQ21NU6JBT8w8Q0uxZnRyt
	zLCQmCxAAd/v9QYWllX2Z1hTom0hgjrrMI+lrSjJPtn/uRqJwjdeFPGR3X/LmzKRWcMXv5uCoyP
	YKnhvdl2KNa7s7EOAmoM2ekokMajvHKcVoOJSr6frsIq/XY4Bab/VPtwyVgIMcvhm5uMj9VUT4m
	BlEpMS7UstoSf9porQ9bZdd/enDCXHFMchsR8rZH35uk//cQV68esRLkVL7bOCNu/fet8aFdDIU
	q3jSSMtUt2HYZh+2dK/6a2bpuKXB7R4pxOOQ0HsoCkd+oXWuZ2Kc22YpvbwtsavPQ3EFiIbF8lP
	mHczPJ0aoktOBbrCvigIkpO9u2IgHsnAy0nd0DFO46mY7v+VdgGIMd
X-Received: by 2002:a05:600c:8106:b0:480:1c2f:b003 with SMTP id 5b1f17b1804b1-4801eb09208mr70457285e9.20.1768685371142;
        Sat, 17 Jan 2026 13:29:31 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fd3bcd2sm51156465e9.1.2026.01.17.13.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:29:29 -0800 (PST)
Message-ID: <1d4531c3-c73a-4990-8752-d9b4190c9c8c@linaro.org>
Date: Sat, 17 Jan 2026 21:29:26 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] media: qcom: camss: csiphy: Introduce PHY
 configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-1-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-1-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> +	if (lncfg->phy_cfg != V4L2_MBUS_CSI2_CPHY) {
> +		lncfg->clk.pos = mipi_csi2->clock_lane;
> +		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
> +	}

Just wondering as I look at this code; is it possible to set clock_lane 
to say 0xff in DT ?

---
bod

