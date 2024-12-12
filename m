Return-Path: <linux-media+bounces-23238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE7F9EDD17
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 02:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6706928327D
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 01:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D4F6F2FE;
	Thu, 12 Dec 2024 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HRI3Lp0h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8BE2AF16
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733967159; cv=none; b=rvOplYr+OkdQQosKiKuJeMRXepo9GU2pdPtXR7d/mMofcJtkVbeTQKXpKpWk53SW5qc8kWtwvUl5QkyrK6QlJuS3OzmfIKj2gXE9aB9D8xSZitlHY/iBneJDe4ya+DiwdOv3Cl7+wQ1S0UEMXsoOG0PH13XREyB948NEuhCkEO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733967159; c=relaxed/simple;
	bh=HNsMTxzSM4Os/Bbn1icb0Zpox/VU8oHA6Z7aOqs54no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHpuAaoNGOmGftQtuLE5e8sdR5Vrqni0kW5TamBtyj4Mb4HNzz+rEBouZIS9FBgoaf1/GQo4YCgx5GXvHrVRxFn80UIU3gXo7B/kD0q9L7lx6zEDzZauG9Wm/2caBMa6p7dHfrd1wGFCoMk14O43esAQXa7WHjttqUsQHDFmPmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HRI3Lp0h; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so52056a12.2
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 17:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733967156; x=1734571956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYW6QD8x26BPCi6ZwMNcJa7MxOLVr8kbm9ZapF+r2Wo=;
        b=HRI3Lp0hPsAnEc/4OBPgDu8MBUHKiX6uEMt6q5Qby8B+AJ3mFw9/dKUwc1NIictyIT
         4ZJFIkSJA8O5upx32vnUPYFywRrLKkU1YgYAClTUPzmfIBfW3WZPZ1Kj81zoCqde6YaW
         P6TnxJLrZuQ9KSwhfbsXjSvatDhTMfoy/T59z126ufY046jKwYSoQXIkdbePs32+enbW
         JdwroaLiRtMV0Zn5ZCYLNkT/X98osNXGAiXnLgNNcqD/PhoZ/4DMTTpLmNA5QheUrgH2
         1LtRBQPb/xDLS5kqYESgJS/YX12r3vgSSQ778a54FBaOJdDce14+QkP6sCR407A2rNww
         TjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733967156; x=1734571956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYW6QD8x26BPCi6ZwMNcJa7MxOLVr8kbm9ZapF+r2Wo=;
        b=aN10LJHY0QZLsdHBbzVJ4k7Vmlti33+555eJlVgKseJhRPx2HpG+u8owoK25dbnHym
         Bp+fEx0hYJyMOTjRMpjbDOsR7GQrstZl+7mJJi4KUVR4b39jD5ZIuBE+zZaWfjm0ocbm
         FdiS6pzsitqQk4WiAC9ESGcV9IwgXgaTvQl0Ea4DHlrc0q2DJ/xjiTTN+hdz2T+2sErw
         H674TdgaN8ehO6cyH2YXXfLBRUKvPp0cR73R/W63HWfkaryAGkwKsOwyLTdoOfwx6yRA
         mjF/SY4rjoYLTVeGG0U7iCIF6+zkXi62+4oNUdFbwSk77x9LHnSSu80o0jZFPuPVLB0o
         Niig==
X-Forwarded-Encrypted: i=1; AJvYcCVRuj2jqF52ADD/vTuyphlEIvBA9tcMDFi2chPXrPPtQuVVYYGs1PKqfhyeWc7WIY+r8lmh3uh4sgy9Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XkzdfIbwd/55Su6WzXJlC0ILoVAJcc80ITgU8spAm6p/4zqq
	BDT7UTTiF/8ztYJ7tB98VFU3kWHyEL4dp4l9NVfQOTMgr8GEHr5q2as4D1Lw/yg=
X-Gm-Gg: ASbGncvneKTVGxWXP4asimI69HQ6CtekFaneKb6U21QY055t8l36FPTe99aDhz6UXhY
	Qly6KeL71uQPx84IMRhUq1WdIq6FCdbZ7IE95OwJdxDudh89BQgs1ua+ZpJURdGQO0DyERYn8Tf
	CAxaa5l04owfLV7ynFbhgARJ0OXaj8WxGN+B4qQ1GZXUgZlVHuu7UiZF9XYYDa5jaQ8Ew5gPhar
	KpoCvAeggeduOSTALvADgmNxcOg9ZC91OyZqe5Swli+3cdfu8GcuZwis9KW+s9G0KnrDA==
X-Google-Smtp-Source: AGHT+IFJm5iLCRBwQBVqR2Yt58rdNbOiyVcfcJ7aOqvYUnTj2HXgTRYd9DKsSYmetmJtlgYL0Grpfw==
X-Received: by 2002:a05:6402:40c3:b0:5d3:baa3:29f with SMTP id 4fb4d7f45d1cf-5d4330a3832mr4211933a12.9.1733967155853;
        Wed, 11 Dec 2024 17:32:35 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm9676811a12.30.2024.12.11.17.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 17:32:35 -0800 (PST)
Message-ID: <dcfaf9ef-87bf-4ec5-bf86-5c432380ae9a@linaro.org>
Date: Thu, 12 Dec 2024 01:32:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] media: qcom: camss: Add callback API for RUP update
 and buf done
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-10-quic_depengs@quicinc.com>
 <1ac23fa1-fc35-45fb-9338-d5f304c869ba@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1ac23fa1-fc35-45fb-9338-d5f304c869ba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 01:09, Vladimir Zapolskiy wrote:
>>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> It's unexpected to see two your Signed-off-by: tags, either one is invalid
> or the authorship of the change shall be changed appropriately.

TBH I thought nothing of this at all.

@Depeng for the record you can add Co-developed-by with my SOB.

---
bod

