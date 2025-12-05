Return-Path: <linux-media+bounces-48318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33552CA7357
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 11:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E11B302ABA6
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 10:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CCA3254A9;
	Fri,  5 Dec 2025 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyOISVt3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D05325496
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931195; cv=none; b=VfaKUUVTfM1oMJLbWpFYwFjXMRKN84lQS79ONB9nelRSWuvX1zNCiuXStoQPPpfWGXC1kDBukN9z1262vdiu3JWTRrDEgyE/ztisvjh0nWKNqIUrtfr5tSAQT+0L9ml+4f3qwFi70XZ9jK+p/39YzbZp7wPB79ploJXrvrsMsSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931195; c=relaxed/simple;
	bh=o5zYQo/pdhvmT1AW6TQbgPX3NoefX45zPL89CUC7CN0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=vB+dQfE7jbVJ6fdIpSmq/yjUtEvMNbSrFeWeMzHKG4VnzM1JHxyBkjHbupYHgB9RJ7XGNJItRqQKiNS5143bnFN+7eOONz0h84G6UnUAlq+tVJqNcSUrfkIBKfsASTr7jPTMS0NzMBNnz9MsJVj9SmOuDFYLtXD0Or1H06BhbRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EyOISVt3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477b91680f8so19430595e9.0
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764931185; x=1765535985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o5zYQo/pdhvmT1AW6TQbgPX3NoefX45zPL89CUC7CN0=;
        b=EyOISVt3IcNqBjNzKBPVLixt7VHbxvSfGxOvF6OJNqG/Q5ka/WiKsHBAO2G5lN2BlU
         M3HIbSLDX4fA+lusj4Pq77rEbS0ecT+lSnw4+Hnwwr+iqEeoU6mq/C/32RCRnMl92bn1
         plTperEaxlOB1y2tN83UGvkJahEhcSRvXz7ad+p/qIYdDHkMDEVxZPfwyAkDcExex9kQ
         HfpIStRpGPUMSzNfn9M/TlP/wVASmZZNJy64i5Yhsw0O+twro1IbRwG17LUYCsV/B/78
         LrW7P8cl0If49cTJ/H8BbjB32x3Q8yvSdyzCMhmup1TaF2kSoKKEmh6tBsp+/nzCwuoT
         4Wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764931185; x=1765535985;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5zYQo/pdhvmT1AW6TQbgPX3NoefX45zPL89CUC7CN0=;
        b=Of9enFyT9oq2KZV0CSg3lt0VvgSA66j8NZK1eggUlHkqJ23faZTozMuZ/T8x992gLe
         Qm33Y4cDvIjY1uERo70g+3dzSJaOCCFx5EI7s9F5HAOEvCuMqsKYoI5BYs/3IqxUqYBh
         /Lbu3MMVM8Te9p3NEiHq1lfuztmVPoIHG6wvS+iiiXNgqXS5XRwoIywYSra1JRZzJ0Bq
         CjP4zM3VhzWuy+sI1RJZG+Pg7fN0AIWfFFwxNtSHjeRKjMnOaOH0Kq827L3fYw92Mkpw
         PLBObnll12JM6Hs8zDtcDgA5PHRD3MoD7WH3NtoPxJQDyFwi5N0+n4pOmlRC/2sWgDQG
         gyTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAFr6sEj2pDEwTvZk0bExVoeXIfVN038+K1ADID5yh1saVfURVE+v4o9mXXGjr7VVjRNo8/GshOla2Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz95VLNfKASw3pafotfkfIG+1bNIEaXGuiMttOcwH75MNXP9/eI
	gkHnpzyMb0MGWZiHBtoX1UGDjNvTtcAl5AA0ALQQki8F+rBWY8pyWAPbmuhDM5avLteCwOtPpBq
	rXYg2
X-Gm-Gg: ASbGncvhserGX9MOMhnIRKYX3id4JkSoCFEx5ReZEItToS+Ri2StNz0niVXUqwh0gEH
	FUtEA2QwfWzi2kOeFDbym7SMhkg9T8UH7SSo8SlKsmIPbEdW806Z5hSwuI8zSd+fY5fwfq7xj7i
	uKQDYW31FnWfJFWo7jxi/cDtjHsNeqJqIbfX3870tZy/oeXvQJCy6Dzz0vp96dYfPY6EQ0IJQu8
	AV4GTOgS/ZBeXbjjT/GHEb51BtUI/ttX3RTQb75hNXzjUSe7o4nGzGp8a63TcvkEGjIvLeB6SH1
	dZ5qhqD7d9Mh9sTMmBBGcFV79nVxPkIItbOKooav25seI7WBPsWCbPMZk65SnElc3a+vvpx0EOk
	KnxmpyDtW/1vn040Fpmyeccyg6bnp6PZn+zTNRFrHrq6o1XOw9V4wJkaFnIe8qnDfleJmSblb9r
	YsLfYF44eHe/HhHduWbnVouUACjfeh4BLDrDs4rv2i5PReIRqkX1R0
X-Google-Smtp-Source: AGHT+IHAcPLHZg6bWDyZGKpCbcZudLY6bYaoGTsYh6dE+C0Igma98JGLt6Qsc4L18+Bxn9oezOhieQ==
X-Received: by 2002:a05:600c:4f8b:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-4792aeeb58cmr94509685e9.10.1764931185544;
        Fri, 05 Dec 2025 02:39:45 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b02e84dsm56877255e9.4.2025.12.05.02.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:39:45 -0800 (PST)
Message-ID: <862de579-c7d8-4374-9090-cb42c5dda73a@linaro.org>
Date: Fri, 5 Dec 2025 10:39:43 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
 <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
 <418e11df-1e17-46a7-813c-045a31d5c657@linaro.org>
Content-Language: en-US
In-Reply-To: <418e11df-1e17-46a7-813c-045a31d5c657@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2025 10:38, Bryan O'Donoghue wrote:
> and int.

*an int

---
bod

