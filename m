Return-Path: <linux-media+bounces-14005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D566913F3A
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 01:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE964281992
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397AE18628E;
	Sun, 23 Jun 2024 23:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J06vYPoP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ECD41C62
	for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 23:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719185177; cv=none; b=rpymE6YHau1oi3LzwyyzQ5kN2Nt8t0ylkBdidOHzSLQ5VboJKAgO0kR4C5fyMct86/4lAmXdWM8gR3Giht/iKQWr894JvdcFCv0j27aiM8MPtXH0lu/LDT4GaYCcf1HrAQRjcULsQn60beZsWdKlPVdzPbeddCses5xqiay+11o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719185177; c=relaxed/simple;
	bh=Jspai+612yZEIh8TkAuIw6EFzjKcaLE+o87n8igLhPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvY4UjUr0sJxAPjCOx2u0elb+yOJqhcWt1HnQdFLMa/ZVeJIF7YgSQ966L7E+qSO1A7jAJ2QRsKXfhForDZkkT+kw6NA5b087G3MBMmZEzZZTFHmmxOd0EJoKk0dbFgXxh1LJz14yglAOJ05W9L1xMB0mRG+k+OiRiAgWyxDBPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J06vYPoP; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-42278f3aea4so31489285e9.1
        for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 16:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719185174; x=1719789974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jspai+612yZEIh8TkAuIw6EFzjKcaLE+o87n8igLhPM=;
        b=J06vYPoP2DCKqaZmwRKHBk+5Q+oUNffS96sx7Be7/TF0bK1Ye/NzUKg5n/0oUnbDXr
         vMq37IGC1aGxsasHYBZxJXoiOO/uFh3koVeH3zwM697tGaC4hiaOWKweIke4pllSRS4Q
         BpzJW6dyBbJO44jWgYFYUG+vcmyk6z5GqV8ah2+kBxInD+BQY2AC/HsRLnt6vdNr66ar
         fCNHDdAz5QYJoonVoMBqG2bE/xkABQQOcbiG1MFZ2HutPUYyXB/BW3pfjeTFBsiwj0kV
         16YB5LInK/9CxGDbph4yTipnr9xRQ6dKgp7xTaK9H/TJWOS13EAmm13HSu34JIBXYvkq
         XCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719185174; x=1719789974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jspai+612yZEIh8TkAuIw6EFzjKcaLE+o87n8igLhPM=;
        b=FW3xOft+U/9QHN2fkU689KXZEWvHcVUkE8NrQmZdLfGf5eBrnopqVkrq6seQKkXPoE
         vjlLDfrH6qxN09B5F/q77B2bTMuHslvHNMzZLHLphKDBjb0NKp77+OaBJYuKyvxZlabg
         PQW71nXyt2SbUNZAZ6eXbb+Ox+ZmXkcSfrP+geQew3uvxPoddXbY0eB2ewGt4RGQqQJy
         JZUnye0O1hBhm/1MixzfgkNsxVIAJmy7uNGPF+caomxAWLeABs5yrZdZ6avFSEZm8Hpj
         k1b7RELcQkidPzVfxMGSZR/KPNKAv6YMI39YeV9YReAFcENPxfkVDATebjjjX3UmQnRV
         RTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhrE91ehKq5hrTcuskaCPv4/uIKVbFDtrHkQ192PE4R7QFtRhejADFgzeG+WyMpGPln22GoUk+0JAd330h66JCdcwDiQcD+wQnM4k=
X-Gm-Message-State: AOJu0Yz8J72jdaa1VAa4umOjuJFKVHbsqwE05sMqE/tTs8CW780J+D8y
	0fMoGiweRO4/fpBQSVwIdh9mupEh9o6DVs8mvUlk/0Z2gZGPHmfl2yib/Wa//fc=
X-Google-Smtp-Source: AGHT+IHx3T/YOpTVCtGSr+bTpn8h0GWflTIaPi4fm7fYDFp1GtLkn1uLhTJrOALP1ydBOAzzkZbudA==
X-Received: by 2002:a05:600c:4295:b0:424:798a:f7ff with SMTP id 5b1f17b1804b1-4248cc185c0mr23459665e9.8.1719185174281;
        Sun, 23 Jun 2024 16:26:14 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42471e66013sm164470235e9.1.2024.06.23.16.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 16:26:13 -0700 (PDT)
Message-ID: <ca4a10d4-2b89-4034-a6e4-d5fa7359a48f@linaro.org>
Date: Mon, 24 Jun 2024 00:26:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.2
 two-phase MIPI CSI-2 DPHY init
To: george chan <gchan9527@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-3-14937929f30e@gmail.com>
 <cd9b5612-1160-4284-be7f-4efbcbbbe346@linaro.org>
 <b9deca88-8e1a-4017-a0fc-6a77672d684d@linaro.org>
 <CADgMGSs7owyvvvRTr4YvCdmMiJV86CjD5YLsJiBZZONDhfFisQ@mail.gmail.com>
 <ef218f06-283a-4e7b-bafd-382c47248106@linaro.org>
 <CADgMGSuaKKNgkVjcWA__fJkmeHYXgE47YfObHddp4e-gTH3NEw@mail.gmail.com>
 <f0c3e0f5-e5a3-49e1-8b9c-57fc7af5d71a@linaro.org>
 <CADgMGSsu4FEPHydWu1mj2BaJjt1=7Ws514ig0YH0TbToFhk-0Q@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CADgMGSsu4FEPHydWu1mj2BaJjt1=7Ws514ig0YH0TbToFhk-0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 00:16, george chan wrote:
>> So how are you testing ?
>>
>> Libcamera on your target rootfs ?
> Yes, a similar test was carried out early days with the "wrong" v1.2.1
> init sequence, on pmOS qcam installed into xiaomi redmi note 9 pro
> (sm7125). It showed nice output. And I was excited so I took a video
> recording too:
> https://www.youtube.com/watch?v=U_do11pSf1s

Grand so.

---
bod

