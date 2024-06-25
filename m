Return-Path: <linux-media+bounces-14141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9501C9174E3
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 01:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F010B20914
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 23:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBF017FACA;
	Tue, 25 Jun 2024 23:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ncjRm8mP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25835EE97
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719359098; cv=none; b=hNth+DDznpiDjDrVRCaJEY4/1fMT9eLqJNSgXtJNx7En+ddDUsWAuS2bjjHBmZOpnwky7PaT6M62Btv807dN0IFm10wTbnm9t+qYyTNrUpt6K2hT1n3Mj1CWbzNgngrK9IoMBvcjBI4+owzKlhy8agOao9GGy3CpkrfeWMvsuQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719359098; c=relaxed/simple;
	bh=/yOnt+Enze90uJ4iOX9ahGRdUXyI7FNFBZBJOgnk8OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=af4zaaipiwX9gdUUPgwAmc5NZyBa4v6Z8fb7+uMCedDSjnC95C6gNyakD4+RL/UGNNhQvcvsS4QgaNUrAOqVR4DQ4/pW9irE/RtKPlcnpaeITK8LKsq/QQrnzzvB4OCD/qFsog9/tTMDPni/+Z5yK5v/8tONozU2LzYSjpDW5Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ncjRm8mP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42138eadf64so52041775e9.3
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 16:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719359095; x=1719963895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQj9NkvXcsHapDs+KTTOnMNbscTTHwBR9LYtTZBsxhE=;
        b=ncjRm8mPOdFKd2NSSlkV9ciFAM79eiPSKbe3IyTPHZ8TT2nFwBUjnyV6WsZtn78tsc
         YVHVvHlx8ggSowYnbok4fYD0j78L+wQnkWhF2WVLw53wtuKRuFp0uoKktlpva+hWyqUe
         UVwLoF/S6mazUhmof9fG8XcgrPg1cU0XyOtASiF9cQsevJNr6M6RwDGuaSjNyfbfmhkz
         AN6iwMdRYx+pVUJU9OcRISOeY8KfPfMA8zmN7ZKpCKQRJvCzGSY40XMx7FcRCSoqAThh
         D6+ZjlL/5my2p/AO9imuDSYvdt3/WMugH/eB+GaaAlE2Fr61quPuci3nhacXWIFpzMHp
         LCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719359095; x=1719963895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQj9NkvXcsHapDs+KTTOnMNbscTTHwBR9LYtTZBsxhE=;
        b=kg4efvnnRE53p23j2qmFv/p89MXwAI1jPQmemjrSMT+1lLeaPhm1q7dl5HzXhfRRhL
         V6aQWf1QZJLeNVnF7LrWxzX9HbiL3Ks80L00+bNqN6kAVQZYqr15Gu0TO1Cc0hZxd9IJ
         o/6WCgT7lQPCgcISirEt5At7q02wGQdfxn9pocVkJfahQb4tROSOl9b5FtX4m0N3aQos
         GAjvpI/94+gS7RkDpvfjyaBB54OUg18OwpBasyYW6cIe26NLS0CVTZNDqLqLPzuSezsO
         VQZrNU0deVEmYjSqXih45cZPq9cC4lEq+tkCIm+zHJCr0uF0oPJm+G5DalI69m0iybIO
         1u2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvWgK87k62+asmf0ywXLHzpxxTexRJ3MiPwe77rbv3xHoglmgxWgjcmtDvFZ+DaOlG/tbfHU1ll9GfBR3UGe6gUXG+l7/TWSdicqo=
X-Gm-Message-State: AOJu0Yxl/WyQDFaMLKXpP9/BmDUF7m/kt3LDRNhko7WIq/+0olpz9Qgv
	1ytiyrYCjLzsHX5zpnOOwfU0pxOcMGYN67GbXvWnuBgbtqJQHSjiQZpDMlbPIIs=
X-Google-Smtp-Source: AGHT+IEB4f5Wyg+xzrZm3oWpYwA7V3kgH8bnlVVOGPITa+voATaxFgORULb3if3IuWnuBqTxmsDUCA==
X-Received: by 2002:a7b:cb17:0:b0:422:9c91:a26f with SMTP id 5b1f17b1804b1-4248cc3426bmr60184535e9.19.1719359095331;
        Tue, 25 Jun 2024 16:44:55 -0700 (PDT)
Received: from [192.168.0.16] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638d9bfe4sm14158315f8f.53.2024.06.25.16.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 16:44:54 -0700 (PDT)
Message-ID: <74215bff-933b-4d11-be2f-c1d5b5788f9e@linaro.org>
Date: Wed, 26 Jun 2024 00:45:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 0/5] Add sc7180 camss subsys support
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 george chan <gchan9527@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <4d2f4a52-826e-44be-b242-55b50708692d@linaro.org>
 <CADgMGSt2sRecrrYrG3t4RtgGn8QJzr1N+iRSWFKQVPgA6Pk8tw@mail.gmail.com>
 <a06505c7-fd8e-4135-94d3-d05d9b4dc90d@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a06505c7-fd8e-4135-94d3-d05d9b4dc90d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/06/2024 17:57, Konrad Dybcio wrote:
> On 24.06.2024 5:03 PM, george chan wrote:
>> On Mon, Jun 24, 2024 at 9:50 PM Bryan O'Donoghue
>> <bryan.odonoghue@linaro.org> wrote:
>>>
>>> On 24/06/2024 13:13, George Chan via B4 Relay wrote:
>>>> - Add RFT tag to all patches, since no tested-by at all.
>>>
>>> Have you not tested this updated series ?
>>>
>>> ---
>>> bod
>>
>> Do you wanna add my tested-by too? It just feels weird to add my
>> tested-by that way.
> 
> "RFT" means "I didn't actually test this" or "please provide more testing",
> not "there have not been tested-by's from others"
> 
> Konrad

Exactly, RFT says to me "someone else needs to add testing here".

In your next drop with the changes and RBs please drop RFT - unless you 
want someone else to test it for you.

I don't think that's required right now since the set seems 
straight-forward enough and TBH the bit of 7180 hardware I have sits in 
a box unopened and will likely stay that way for the next few months at 
least.

I think your example video is proof enough the thing works ;)

---
bod

