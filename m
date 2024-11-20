Return-Path: <linux-media+bounces-21644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 857379D3DAB
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A8ED2846DD
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6ED1ABEAD;
	Wed, 20 Nov 2024 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVAmTbSB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996451AA7BF
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732113335; cv=none; b=GCK8jca0iGvY7KzRvjR/BvkZr/GrCajW4sS21eXdbrhHJdHbhXw7Tg3Da5EorBqJA27/QR5w1rTiiSZgMuXVagt12ws6uYBRBQV3yuWcvjqJrujbBGLHwnSa6huuEDXeZgLmiULYC71pFZz8+QTG8c0eldiUQH0FiQEz1+L1WHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732113335; c=relaxed/simple;
	bh=FmFmA786Xnnh4fyc/uaDqdewoBevznugnbpqVfJZ8F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ixw4cv9AzMWlmGJl+BwmIGqCKlC6lX2/Ez5OKg8c8S9okeX//lOYj1fRjS7MQbQNJkmcTfuNsrt4JNgCNmviGp1r+Vbrs3xZ0fx8UN/NpwddXBf3UYVd47Ft7fXfs8N+LK7V25IZZYkDgxOuDVDRdpbCt7GT/kXUIZPAoOGH34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVAmTbSB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38248b810ffso1505024f8f.0
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 06:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732113332; x=1732718132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T5q/NrOb0j9a7AJB2JY8f6QBt3D5Yw/OXkV0jHgryNM=;
        b=HVAmTbSBfAd0c2i8CSGhUGOKnryqellooZ+nXMNItLxrPugaOEFjEG9cBpuDaeGYok
         zaikWjYFcCWUi+uzlLAy+g0OrXABlJSi3n0tXLumtvSvSqO9NMS69RJT3r6NQJwTEZNW
         zab6cwwX/ZXsT8e3aHfHBDsuX6fDWe+kBUeYyZ5JhD09HA9wARFbbzFv7kQTRe5V+boX
         sYlUn8jRAJ7McFWXjwpFxo1VscIk5qJwEYwR4nzZ8M62+2x3IpfVQMdOM7a/TEvyHUpL
         EgkmUXeKAIXuq4Hvcu25oS1srqOkhNoDeJIJh2Blga2NqoI4bN9kJPRAIkh3OY4BUYne
         ij4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732113332; x=1732718132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5q/NrOb0j9a7AJB2JY8f6QBt3D5Yw/OXkV0jHgryNM=;
        b=cjGV8wcrOZc6EHecOFdgheJBlDLFJVxqBc2mXcnWvWereym08wyGIOLpuG0cm1zFSA
         t63tX+FDQ/ee53xb5yu/oovLxjstBh9MEt2NYHv5ljN7/fn6S5m/dgb3DoJMYQ4io++Z
         /DxEsgDTIwRuCB8AHQdRp6lJlXES68enB30KK8S2n5+8fFB9MLJUoSY7RiHq7veC7yoK
         79cBNbFSMuEwzjFAwrAQ+qHTZ01W9OpbzYQhgsTrBHExj/Ne9EHA/2sCXVWINKiYBvmV
         9rFzMb47CeSTiN0AKVTITs7JtF50StL+H63FL1Np0aHyqfY0NNVEMuJ5Z8xRfowI+hgI
         Pu8w==
X-Forwarded-Encrypted: i=1; AJvYcCXnoO5/aFv52lQU5SG9uhG5UwcOcdy6mk9c+TfTTe39xlN38+zQ4euDB4G6YfQ8feh7sSWVG8viOE+B7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3lRCfGq1mLjOas+4JacFi7o33s/3Et8ia1BhHCegs0PEF91k4
	sw5r3ZBtuyoDelAi6kmxYLWJ7K/AqvG/MhkvANN1JjTbe9IjwuGHNivoRwicqbc=
X-Google-Smtp-Source: AGHT+IFWe/uFMAKibkVW/x9MHd8Z1EECf5mY82HweltfCWS/ylgqPpMPLvVAMlvSP5bESkBAHm7oYA==
X-Received: by 2002:a5d:5886:0:b0:382:346b:3675 with SMTP id ffacd0b85a97d-38254b1803fmr2152247f8f.46.1732113331881;
        Wed, 20 Nov 2024 06:35:31 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254933c85sm2229157f8f.65.2024.11.20.06.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 06:35:31 -0800 (PST)
Message-ID: <7ae98d62-9617-41de-ba67-bad2120b33b3@linaro.org>
Date: Wed, 20 Nov 2024 14:35:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: i2c: qcom-cci: Document x1e80100
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-1-54075d75f654@linaro.org>
 <jfhd6fhp55dsahqajx375jitezsvscsbjfrbetpnzplsrq3ciu@5q2up7wbgp4y>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <jfhd6fhp55dsahqajx375jitezsvscsbjfrbetpnzplsrq3ciu@5q2up7wbgp4y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2024 08:49, Krzysztof Kozlowski wrote:
> On Tue, Nov 19, 2024 at 01:10:30PM +0000, Bryan O'Donoghue wrote:
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> 
> Missing commit msg. Checkpatch :)
> 
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> Best regards,
> Krzysztof
> 

How did I miss that...

