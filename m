Return-Path: <linux-media+bounces-35764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074D3AE63B7
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94D054C0C5F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4DA28EA70;
	Tue, 24 Jun 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wK46u2wt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43945280CC8
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765096; cv=none; b=D1U+mgTzxstuS9ZM08EkJ3Y3PKWnqv1r0EwO2l7uN0kGCKvaOpsqOmQXimD77hGniP+/6sNF5z6z1c+Y2zNQ9AiqXLMSoGKbbv7AxaH6ybA75HvNpX9Emq74nM+4xjhYhER1m5pcDI2lE2nnZ5RzGEGjhRtNWbQgEzg0zgJJoxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765096; c=relaxed/simple;
	bh=RISdn8se4eZFI/7bIwlWhVghSpmypcU6lLVYr6WWbOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft120BOreGNpWmFivp6sqY5a3amJVTylFYMJ8HOhYZPO+CCnQEryWb9We1QlUz0p+SfmEk6A4uHJea2qKFOHV2WYuw6z1Hnj3fmO7+KDWog1sxkJz/3+G5Ze1Ir+eNGOQCZP1ZdGxJH8YA/aCDJK3in7rTzKuWtP+Lis8s24SAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wK46u2wt; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553d27801b4so438799e87.3
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750765092; x=1751369892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KU9iU+hQX85DLrN6RqDyNPoBwm/rVTmxBoMbBcJ2tl8=;
        b=wK46u2wtaCqvt57dtXkO+/EEQYDN49UbedbMXfSoF9IYAF+GYULdjQBA5Z9MqwUGIH
         wkkJsvDeMbInNwlHb+NqY7ze7vn7iq1uPoMfV12cChhrZO7QIH2YCOjFbDoMkcPs4i/W
         5nTHMsDnHp6yNUQUqcUMnqSbKdaT9CvDqFDpNXUIzQKBNQOqyE0NDCFNVFrmagqhWrTK
         nxEKuL1acyIIgKXbRAise/kEMUOmUjhpzitZ13Z8HWbRu8+mJUltBdUbNF5hH6k8FXUa
         mjTxROPJBB986rEvsm1qErm8Yzr/cuFMBnU/hEuO6mlnecBEOP4oQM1AETsuloe0h149
         KCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765092; x=1751369892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KU9iU+hQX85DLrN6RqDyNPoBwm/rVTmxBoMbBcJ2tl8=;
        b=W2Qfz9EaQEd4KJGda5y4+1HTeFRcEZDvcGJhQgUVUnLZJHO3NZaHeBEx2Ws+YMnEie
         1A6r2Qk62PyLQ568LqNX73L3t6K0jkMJrs34iHGAbvxHdWr/fIng+BWJoUDMTfPbDpld
         vf/RNp2ExkV7o3HrcOtaHplW3MmIp3WTflfFnwxf1lM2s79rxGTYcWl0jxONIM3ggttT
         sUSB1EvTt9LpdMak0fn/inF3Ub4jgLa0afMNDG1n6eEC1kEn8P3PDlE5iZiJtbCdpIoL
         5uqHDL1yrGFMdHeMzlUFOvUtdcT8oP4OleHMpT5TuO75rEbj5kJTjaS8Qg1vV+Ms+Ff8
         ngKw==
X-Forwarded-Encrypted: i=1; AJvYcCUBsUbWPK8bnP/rO2iS2RiAywCfVNuI2WYgzbBWN/en7i1es3YzXdOG05TDfcyanC4BnAX31udY1hzbfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYPL4Aec2SF/EMz8dh1N12yER22v4hnSQbwMf1KJ++H9QMdodK
	x1z52HluIItoTrjZEndqzWsNSo8MaQYF307JKnCuzX9OlIhEUeNFZOFMteDluJ3/QeT5IHl7GLW
	lgRZb
X-Gm-Gg: ASbGncuV5uv5FdzHic6G43N8CEK6+K4gwICvxMbHyvCGGUuGI+UsLvq+tIZkUOBxfDj
	Nd5pbuHXvaAeeUNsYSt+exOHxWr5RlIsgL4CF+8d+8iasmLTnw4CVVwdqbIetWmJu/YbKDfNGvp
	KtjLB11V8s99DmAiO/CShFZTpEaVWuZ62ZN28Ut68MbUGygXSc7yl3ZRa10evQIv/OJKb/G8FkJ
	vcnOeI68Ea0LtRuUZE5h/Pw+WWA7eJnfqHUj7z862bPnBCqqdzsKzFNndz4k3+/QXYaq9FkOpmH
	Wr0/gDcC/v6ijxUPbmT7ffS7vz2HUwH9Do3HWbvHEWkLqMTAaoMKA5uJlIcqcaPbaBRCjfrSD2D
	Ns7JdrMa2EOBrQxmaHpnmCZNDh5p7XJ9IwjnZSETe
X-Google-Smtp-Source: AGHT+IGLkRpAYMw1Gi9clpkFUqiOhmtR7IOar5rMOl6DHsBt9ot2NgeuSSchmngJj28KpJ8ax3YpSg==
X-Received: by 2002:a05:6512:110b:b0:553:af02:78e4 with SMTP id 2adb3069b0e04-553e3bbced5mr1755843e87.5.1750765092396;
        Tue, 24 Jun 2025 04:38:12 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbde6sm1805161e87.136.2025.06.24.04.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 04:38:12 -0700 (PDT)
Message-ID: <fff77f71-e21b-43b9-9da5-6cf819add970@linaro.org>
Date: Tue, 24 Jun 2025 14:38:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnects alphabetically
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
 <20250624094253.57441-2-vladimir.zapolskiy@linaro.org>
 <aa56b956-95f3-484d-8afa-058925b95bfd@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aa56b956-95f3-484d-8afa-058925b95bfd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 13:10, Krzysztof Kozlowski wrote:
> On 24/06/2025 11:42, Vladimir Zapolskiy wrote:
>> Sort the entries of interconnect and interconnect-names lists in the
>> alphabetical order of values in the latter property.
> 
> We do not sort these entries alphabetically and you did not explain why
> you are doing this.

I did it, because I assume that the preference is to sort all named
values alphanumerically.

Since my assumption is incorrect, I kindly ask to let me know, which
properties should have values sorted by alphanumerical order of
${property}-names values and which are not, there should be a method
to distinguish such different properties.

Below is a list of the most popular properties which are coupled with
"-names" suffixed properties:

clock
clock-output
dma
gpio-line
interconnect
interrupt
io-channel
iommu
mbox
memory-region
nvmem-cell
nvmem
phy
pinctrl
power-domain
pwm
reg
reset

Thank you in advance.

-- 
Best wishes,
Vladimir

