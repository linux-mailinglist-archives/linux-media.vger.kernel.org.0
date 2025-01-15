Return-Path: <linux-media+bounces-24776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624BA12368
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 13:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6C4D7A2DDF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 12:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5098236ED0;
	Wed, 15 Jan 2025 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Znz9P2lr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F06C2475E5
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736942557; cv=none; b=ZXgG80+bXN54Atdl/jwAv6veXnpxx2wKRw3OjRiyzV/6E8NosF9oT3AQKgaQl1n3yXV02oOqSA0zdnqbhq7QnCuRU4IKsQx/M4Tans5lfMBuEnX/GGsHmFgvH8+1uPJMjEsT8QpPyK3/ktAeWc6uqOptE4q2Ss6ucGBMb9w3iw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736942557; c=relaxed/simple;
	bh=GxiMUN5sqtriveaI/HLFwTpRRwlH2UsAEbUeMqe17Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/9XD+gKj6a/aFKJWK+Wpe7ZR2D5eMjXNePkuKXQcNpucjiIOhiiaVj/vl0LjE/jEfKj46o/X1++bJZ95TIS3VopSUyNRz3bGWkb/KTPNydun+fqeLsz7D3us+u+wmnDyhJtBM2fVFdy8VJV/8ZSbyZxaggl+/U/NMgu6rRWjpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Znz9P2lr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so5434941f8f.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 04:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736942552; x=1737547352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J09817AefuwhTALG6OGHGhgUnuZ4yA9WXWtiMWd3gZ4=;
        b=Znz9P2lrJglPk3coNHRK0cjlTWtCC43MgS+5q2HzRml0qL9kN81Li9nCKchc4RWK6P
         9YFjRWa7ppEjv8dyvqe0EQNL12SVVVOS+1JyO/Kkpqut0t1o2ckANKOidtCoTkuCh7R4
         Ct0EQzixYjscKyG/ZpqMJbNYwU2wp7ajE+YgO/5Zz7qOVaFaCEF0VsfmPg9AL7OF35im
         EABtqqArw/vHjh6xSTA7pmzkH3MVQXHiagNeoBqcHXfE11UpbykR0AFh4HR8kQkto7TF
         XJ1ZVP1bgP6nN/CPkNZavBwu97BKKtHJGOG4jOX73PPJhhnVmvlPi4IdJEXOv1oBbkhl
         P/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942552; x=1737547352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J09817AefuwhTALG6OGHGhgUnuZ4yA9WXWtiMWd3gZ4=;
        b=Wkxr6yErkPf3+vqIaug5ARmQUwN+wD/DhHllw+ywv5mhe1YeKHrNQy+UUi5Fs6jwA3
         4xppRVnlVtSKbaqxec5GjbI2nByVQLzUGbUpaE7NYGhlmmFfSGXpHcNHanKQXPvmnYCj
         0RNJCbnzQwSGar6muBbAOt6gBEWFMEdKyJRu6OPzXxzzuBodXBySbcPylB6Uej8Kcd4m
         METWBlOcCduNpWhkrHPpYVQKZbgOpO8peiXoAr5RQ19KgHfPGE+STJiKFC9/g8Q6SGe5
         DuF7kvL/qgre4hQzjj9UwH9b2hGna+0X1saV+wvvZddQGnYSHZ55ox1osRU86G1z8HuA
         IPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpt1XPmLwWGaeXMgr7zKmCb6tkaq8DB/pWhHBlAmDZK46rnhl6O2VbpdeI/QBvLrRj3i6OljStBFPWdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhbXaKSjeNsVi8imyQdUCWVh/CsgGHJP5gm78am6+IrXjDE0ra
	uxSRqA4d0X78yjtBi0klA29yYAjXIUAyEaHm4ZpLfjp5+S2TgXmrSvLZ7snL7qg=
X-Gm-Gg: ASbGncuNnrt+9ZV38yNL1QofDcnJiTE4z/u+tF+9vNn/bpxw6u3O8hrKhl5QUGOzywd
	jnFADwzQOwPp+R72HjSrM1fK9H6joxfjKQ2Cf+hSaKZNFupbgaU4qtIS61FdL47GnAUyq/qb/n+
	vcGESfLsZlbwksefLpx+lgwR4F1Z7jSH9nNGfxvg0MIgCRQJQEvMjGSVN1KkGpW0HeprvH9JNzR
	m//RiD2HfR3oMu7Lkzri3gb9pE4mzwrFKQXeU0PzcHij060r35x+E5bRfjdmPzDGYsO3g==
X-Google-Smtp-Source: AGHT+IFfKyGn52ipjdfPZD6RVd7v4EFf3NGE8QU70ELIZjBpZX1RbqBIB9xbQUWlnKSlaXcoGcGZmA==
X-Received: by 2002:a5d:5847:0:b0:38b:e32a:10a6 with SMTP id ffacd0b85a97d-38be32a12d5mr6050542f8f.41.1736942552589;
        Wed, 15 Jan 2025 04:02:32 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm17718135f8f.50.2025.01.15.04.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 04:02:32 -0800 (PST)
Message-ID: <8322416c-5762-4b64-80aa-7ef1b0b0287c@linaro.org>
Date: Wed, 15 Jan 2025 12:02:31 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
 <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2025 09:30, Renjiang Han wrote:
> The POWER_CONTROL register addresses are not constant and can vary across
> the variants. Also as per the HW recommendation, the GDSC mode switching
> needs to be controlled from respective GDSC register and this is a uniform
> approach across all the targets. Hence use dev_pm_genpd_set_hwmode() API
> which controls GDSC mode switching using its respective GDSC register.

This paragraph is difficult to read and understand. Try something a bit 
more like "Use dev_pm_genpd_set_hwmode() API to control GDSC mode 
switching. Do that because of reason x, y z"

"We are making this change because of reason a, b, c"

Basically just try to state the facts as clearly and concisely as possible.

---
bod

