Return-Path: <linux-media+bounces-23555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4117F9F47B5
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CFE01883494
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 09:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679C61DED77;
	Tue, 17 Dec 2024 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRpd96Xp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116861D5CCC
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428297; cv=none; b=Hq8mfk+pRqLsaDfvgT5bwTa70OfBTdHb+Y+UGu+qUan3istvT5Jvv6SRoHdmdm5nX3cBCOEvtMn3+sspzdus58JPbXm12z0iN+6Zaz6hrMVFzVvLvVfszNTTM9QOsouggiHojrsHMjWitQUxiEVF1daEkSNVBeeSFBUgp4xHEzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428297; c=relaxed/simple;
	bh=kb3kP9tneB+GVEHe2feWWDmh0vqws9+suKVVH1/v88Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I98QaoFo7uC3GBQKMLqC4WNsokLKAPHiud921bse851+xdNa4ulunajeFHaqlOt+134HqSGCE/Bd2SyelZ+pbAR0yfmNQn5tRmuywoNPAoBEXwk0pgz7oqrpDJLgdYVniTVH4CFYvmJY0WD9MNJylcZvOqgzK1V01t0xXCy9uEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRpd96Xp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso34906485e9.0
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 01:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734428294; x=1735033094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tq5sZ+Fiv/wP7Onp2aVQfa+BtrbtLGAGU7hb6Q0naGI=;
        b=JRpd96XpZnF7KpYTnIWvBqeJK7CX8ZAvpdzi4dhvtffl8WsAcKYtKBsxn0RCPz5L8F
         UmIbquasaXa/5RM4t4rDU1rft2PKLl6t1Uiks4P+Xs5Kth8AxuqJzgxTkDqNzAesCcZw
         gh6fnXDyKA9APPiEEsTrJJpN6ZZUXG4TpP93P+h2e+JDHo70RRqZBoSI3kQlda2X8xk0
         akPYh4Bc3O9fh93gbIJ3Ki3YaOV34cZe38F6NDEKK6GvjJl1NNPJJIJwLfEBxoUp2UTe
         QnghlFKF9uMhj28fg76ijjWEn2zpie6uEByIKXnOVZfktla8GlchsgSzArCjBHzh1L9h
         /eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428294; x=1735033094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tq5sZ+Fiv/wP7Onp2aVQfa+BtrbtLGAGU7hb6Q0naGI=;
        b=YeJ/UTIgbBgysLud7vXb+VztHQ3GlsJ5n0i8qXKbjYnjL88pIull7u0M4OoOBsKwML
         RUgj05DE7k9d/Wb4Qjrty1yMhRybH1QgNMJ1bGbzw5I95DjjR7+Yu+XtSLXleEGQoan5
         MkY6wH2ct0zIgv2h4K/1QnyOIB3XJVX6MoL0Fdv91f6H6p4G55OOPjELTF/VDbdpldg4
         9XrDgP/5SIsFGwnL6cMD/hr9+4UMuspqY6b6S82nO/EFoqv4KhSHEi9hE27kSbDBqkFv
         EvQDT178ul1X+plCZvEdFMyD67NWUiJRZQR9htSsHLGH2Nm0r5OBYrzPuLX24INokvbo
         bQQg==
X-Gm-Message-State: AOJu0YzPFmyzuJkWbCf0U7sMEzv1dUw8fyjFz9rYl3cdprbCOaRR7gmt
	RIIk2pS75M8yno8a6S148r8HyyQPLTulgySzudc1c5bRiHciIIVOr/O0fg82kWGfQK75BUeVgNt
	3
X-Gm-Gg: ASbGncswTuVCG/tTgVDFSFDhCD6CDiNoVF2CIBOVc4+V5lP9ZzDFXLaSVscd3Q4yon8
	bUPKJN4fl+xxWR9ERlus0KBFtS8w+GZZwMLPPpuJrPAC8leA9Ie3KeNOBBwKDbrcUcTkYar1OHp
	Nwb33a5vTTrU7AvBmhLrK1on467g7rBQoM4JG7DSn42YrTzxfkxmg1oD4YiDWBEXJlKevy3D3In
	jfUCly0gThLDk1YWFtlQbVZYv3NV/aCTPyMOoK+1pn2UjqUqaYdXlLmA2QAj5uKKvq9fQ==
X-Google-Smtp-Source: AGHT+IGf3odSobzW67Hr2M4E4Qy568hruQO6sy10F4fQguns3CYgMLLwqVah+AMfzIWxgAU66q+a0Q==
X-Received: by 2002:a05:600c:214a:b0:434:f7e3:bfbd with SMTP id 5b1f17b1804b1-4362aa947admr142363025e9.23.1734428294427;
        Tue, 17 Dec 2024 01:38:14 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436362b656fsm112454035e9.34.2024.12.17.01.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:38:14 -0800 (PST)
Message-ID: <83fcb683-d610-4e47-bcce-128453a0afef@linaro.org>
Date: Tue, 17 Dec 2024 09:38:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: qcs615: add venus node
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
 <20241217-add-venus-for-qcs615-v5-3-747395d9e630@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241217-add-venus-for-qcs615-v5-3-747395d9e630@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/12/2024 09:17, Renjiang Han wrote:
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};

I gave you feedback on this in v4.

Could you please provide some commentary on why you're persisting with 
this ?

- Driver configuration should not live in dts
- A patchset exists to mitigate this
- If you don't want to use that series, what do you propose
   to resolve this ?

Please don't just ignore feedback, either act on it or add to your 
commit log _why_ you didn't act on it.

---
bod

