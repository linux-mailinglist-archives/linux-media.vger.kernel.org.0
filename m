Return-Path: <linux-media+bounces-37569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C9B0306A
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 11:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F4423B7D3C
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 09:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233AB2777F3;
	Sun, 13 Jul 2025 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4rxJ/+V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC226248878
	for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752398067; cv=none; b=cZXLJbCDvcKwCYKyOkqTSg0LjJZ63hVYaN8w/DDlwX1kQOXi9LkjlGmrdMGFKHCmHathJ7jo6yhI4IRLlf5wm8USRCmlZdRMw7QOkwbBlQuK7XF554QiVE+xGarMJKF0msB1fgGEjMGP3U3P1Z3yCzh9oLGmh9X8dwME4HcZy5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752398067; c=relaxed/simple;
	bh=TVqnGChe4CQatSCQD+cs0iObNPMtJf2KgFl1L8CwRno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8aIKnuoKLqPu5DNlEzCN1GZ6uoSnNppbvT4cfl0S/exKJfeUjE8A5dNly37gfdZ6akRiGyHgh/zgJFQUfbRcwtj9fSa1u8X3GLgOriQX5VeuTLwvA1rWeffISMovjhrEaV+5IJwGMRnh/zuDdvlqE8aVcRk2lebtvCzY3XVoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4rxJ/+V; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso1929667f8f.2
        for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 02:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752398064; x=1753002864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pks3DIHctjAhH729et7UDsSL2zb2Vw5mxsuvQyqPcSs=;
        b=d4rxJ/+VqlpTwGDA0Co61nkIZ1PU/+MYt8zWieCqkMnB6JPKcgVRX6vU+U5KnIqXVh
         gp7ePVxPZmse8qmKmPCFu/hsBhKUR8ohxnEGqp440PXFZ/V1RTj7ix22ss9al9p6wqlH
         mHX4FCU3N0j4s92xqPSPDWCn2H04U5y3GK9ttfX4W5WRaO0gsPW6PqCmtR4KOQ2B8kKf
         C79cw9TWUz4YjuTh14bV9zXJ2Y8tDbZxPb5ACGmFUxH2GfYwtFqJv1nCuZ9IutDH3TOG
         p/SHibnI/+eTBDYNLoe7g2EBL+a7MBJjtqw/3fWYE0DpgEkxt5J/TN3ZuoHHKboNi3/+
         /t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752398064; x=1753002864;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pks3DIHctjAhH729et7UDsSL2zb2Vw5mxsuvQyqPcSs=;
        b=hpT7sS1j1iCdgyiQCuv8poRfzbsCm6dPRtW1lfk5MQ3HDxRe1KQo7HAfbiMUoBFqSN
         mXCdQ32F2csAJC9mM5sx8U+UXguSZVuuwIVsp/pQORLFVvI2/O/MU5pUlqbjFlzg9Cax
         +PVvbS7P06lePPFTuxCWPq4JMDE8Qqc7MmEDXL4uKjqR45IgYvKrG/1B9GqImg/Yp4px
         bFbUxdkXz8gUpSoM1d1raDMyX29ynAiuLVsCFpV+a0P6vXfOpCSMxcuHvwGmefFAobbL
         iS6LIz9iXgWa6Qf3yW3XJbGTZwsZz+m9bKxiYBD3MgWZjRkubEbuO8fvUIbNthU7KGW4
         znpg==
X-Forwarded-Encrypted: i=1; AJvYcCUwwYxQQMQNnf6TigHEzlzAr5+VZckItvsTKoEpXIra3fHldO3NBgQ+yo+zmRvxYw/O0v8NRZA1/7icOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU1DuF0oS+Dr6P0wNOZPhh7Kwa6gMvpItH0n1Oo1vpzqAV4nJO
	GiKZL+3xXmiYNwwsxnojUOeBM5M8NHHcYZXz7Me/oDz5uputyO6QCh0zmndbj1Sf1eI=
X-Gm-Gg: ASbGncssKatT/iCbICvF/hAvtz1brTipoeldYcL4IG8hm2mL094CjtRb6MNf+9ka1qJ
	PbRxtl8iD54wJVWqZ/AssKU5Q35Q47YTLcTkRkFN4fP5Mb1HZ/VRbvk0QWY8p8fSh7RVu1alxZT
	0QgYzCEYlVTcpPaVVIIWW3XSV/OUZYvIL2HbVqqoKcyIsF3D3fwWawzWcT/Xgh43iBVEsEnWyyO
	fNvzTh7l5ik8PA86t7g9VxbSAx1Wo+5kIhJB/nQHNg0jyEkfr9WbzyiloVpHHhyHf/Q5thC60+4
	TiMJaNMxo41iMkIdJge/L7ZQAaZ107IcYWGGe6zdizIdcXH1+ZtdCcryqbkzHTax6/QQKgIshEc
	BIuN5m9VNPrjj4KDBSeTo0NkHE2hO/n8p2H66ka7An5t52ubAE/5OTfRAB/UsaVo=
X-Google-Smtp-Source: AGHT+IHcth82Dwhs4RS+nRjtEFs25/tAmOOwL4S6LKmRinGAkFedziW59n0SIBuEsx96VGyKOBnwjw==
X-Received: by 2002:a05:6000:2f87:b0:3a4:edf5:b942 with SMTP id ffacd0b85a97d-3b5f359b131mr7100254f8f.57.1752398064167;
        Sun, 13 Jul 2025 02:14:24 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1776sm9442725f8f.12.2025.07.13.02.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 02:14:23 -0700 (PDT)
Message-ID: <3506d911-da9f-4639-9c83-aee0a637e9b4@linaro.org>
Date: Sun, 13 Jul 2025 10:14:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/15] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
 <3376b0fb-f3c6-464a-9c35-30a3f589b856@linaro.org>
 <eac19ad2-78dc-44e9-bc02-517272ba737d@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <eac19ad2-78dc-44e9-bc02-517272ba737d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/07/2025 09:20, Krzysztof Kozlowski wrote:
> On 13/07/2025 10:18, Krzysztof Kozlowski wrote:
>> On 11/07/2025 14:57, Bryan O'Donoghue wrote:
>>> We currently do not have an upstream user of the x1e CAMSS schema which
>>
>> On first glance there is, in Linus tree:
>>
>> git grep qcom,x1e80100-camss
>> drivers/media/platform/qcom/camss/camss.c
>>
>> If this wasn't released mention it.
> ... and then this should be marked as fixes and picked up fast, because
> you have only like 2 weeks to fix it.
> 
> Best regards,
> Krzysztof

I thought schema changes were acceptable so long as we haven't applied 
dts, which we haven't done yet.

---
bod

