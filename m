Return-Path: <linux-media+bounces-24819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA1A12D7D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 22:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4AD91887ACB
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 21:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757D61DACB1;
	Wed, 15 Jan 2025 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xb38a0/9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B11D63F0
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 21:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736975759; cv=none; b=ZUpdwIliKXjyB+H7khGWEjb0DMxNrN4MOVGMj6Z1QuM1D+9tsLpn3ffD9jtusIQTHZeq3VnbL/gngNeHkvKIG0hr42+cdmTomQ8C2c8lmoM9LJ0UcZCmOT7fULUmO8gPGMntK1WH9/Fjll+JxCd+MjT7iX7uU6HbJrIOjdjAuOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736975759; c=relaxed/simple;
	bh=c1EHEtIvSKg1nO9ynw1fPAGcrInwQqbzLwczlhOWJ10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqT84hgb2A6R68JAYxGPkehxJx5JcMv+tu840P1FW11H2aWcb33bi2B8RWB/o2Cq4SBC3W9Jrm4UghGVNNbpfZLpQxicbeD+8n43G92lluAsVKXPrl8OhQcCQ34IX6PW7Gu2kt/Ta2ahfKHCFmRADGH/hKX1sGnHbEphpAD76og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xb38a0/9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-303548a9332so225901fa.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 13:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975756; x=1737580556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcgdZ+Z+L9lynDfLj3RvGBYMv/uGR2T2g5tCjxLiaYU=;
        b=xb38a0/9piC/FBpxetKW7F/3ApGVPGAUHLaQojihK7Sv/KC2pSfdj/ew1wRq+Y/mPT
         8AEKXSBtPKQP6jhAmdH3/VaNvm88nEZRKnP/hNl+ZKvw2hE+tYPbIfKi919yvT8mxFmA
         Z1okGdBEPuLgLPcugJivKeQeH4fvMODx8dKNDkm+dFxSfXNhI8DRL4QFEQHWern8+Euw
         9lyucEJGJTgBo0yKfG9BwohJMm0dd/UJvsch8wBLsMlcF1y2bHN14iLgVHvHMDPVGU5R
         jbLgkgVXjpcDkrewOGAEvhFZAaQe7oJmvDvSAjwgqvmj6t/48MJkexyo80QNzS1BTowS
         tbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975756; x=1737580556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcgdZ+Z+L9lynDfLj3RvGBYMv/uGR2T2g5tCjxLiaYU=;
        b=m7GIjAEhomYP6RK4Vp13Rz9MWrXczI6gfs+QJP9Wztmp6+LKtYCuZ6lAGFknSoi3XX
         LSU/n9friGXzd7TG+9laJXwvuYVadNwaH24YHMQ5Ul8nHI5uqgnyLXQgP0OzDa9XrUCN
         WDUsZhDNS4mGbgI42kVgYW2aMEeuEkWUfzNhZn4HfAB9zwwLguWJhts1Umlruy0rtdFE
         h+fXLhKmRosAjbO3HMdLwriMIUWN/POGSbXlF1nMunntESzIMCm1R3vT9duByae+efxQ
         K/lWDGVJu5mkPfFfI0lZlxAwuEULCBV40tR8PdUHbXVHrWnLwRcKxlDT2eBe9ENlYfDw
         xgOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBbUR0LPo23RzqKA6N6EIoYnzSgk3sz9gIM8e5NQJ/KC70E93Wle7x4zt63YKUpNtNBaI3jhGcrCQiAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3f5ZiesM2EhPcFdTC4UGRVjCa5vMv1AK9CUyxjaUwNV5t7tD8
	C6eBedORIy3V3WpRg1oHx5O4E+XjASmRoJi1T0J7Qy5i1QXzBKtb7o97U8mXd6A=
X-Gm-Gg: ASbGncv0Z5zoa3vuR3FiQ/m2Rp++WrX39MOjDbFjtWwO5SuN+8Bp4oppcsk8apZURTY
	B67y5g2XX8RmoX6QHHZFi2FtqPRmRoDXDqwbLgL2dDzR76j6IR1zzvyk0qCcx0xbpBDDZvPI5M3
	3xdYNtanO9G9CHn84RdU/JrQmWrdhg6maJiti6JslA9WJ9A4aYce82k8UF9c7qfU0+f5mGDCzh1
	AUcEFZF+JrZmQCyCjzBhphGI6E1aVC+eUZHKrZfphc8P4QLMnJNekXDUBVGo3KYUKOheRYeTRKc
	RUmv10cE+0y2Vg0EE0/vRTzo33+rObbB4mk=
X-Google-Smtp-Source: AGHT+IGVizluabYaRtLiT2Wa+Zt6KCM3prN4UlCD3gfiXYvm8B9MdIQlKG9KCsexDXKhXSGVXnZ0VQ==
X-Received: by 2002:a05:651c:b29:b0:302:2bd8:2685 with SMTP id 38308e7fff4ca-305f45cb6c2mr35751601fa.8.1736975756277;
        Wed, 15 Jan 2025 13:15:56 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0ad0dcsm23041711fa.3.2025.01.15.13.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 13:15:54 -0800 (PST)
Message-ID: <f268a604-09ed-4150-9401-de82cc206ce7@linaro.org>
Date: Wed, 15 Jan 2025 23:15:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/16] media: qcom: camss: csiphy-3ph: Move CSIPHY
 variables to data field inside csiphy struct
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <20250108143733.2761200-6-quic_depengs@quicinc.com>
 <79b3e4d6-becf-4bcd-91fa-768b4098d01d@gmail.com>
 <238411cd-1bcc-496a-9077-07bb6c4892ec@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <238411cd-1bcc-496a-9077-07bb6c4892ec@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/25 23:01, Bryan O'Donoghue wrote:
> On 15/01/2025 18:01, Laurentiu Tudor wrote:
>>> Reviewed-by: default avatarVladimir Zapolskiy
>>> <vladimir.zapolskiy@linaro.org>
>>
>> Nit: Something's not right with this tag.

Thank you for reporting. The original uncorrupted tag comes from this message:

https://lore.kernel.org/all/4fdf4f1c-fac0-4c85-8154-45f797c6acfd@linaro.org/

>> ---
>> Best Regards, Laurentiu
> 
> Doh.
> 
> @Hans could you possibly drop the "default avatar" when applying ?
> 

FWIW this particular problem has been fixed in v9, while the v9 series
itself should gain some time to be reviewed/tested.

--
Best wishes,
Vladimir

