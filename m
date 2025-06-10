Return-Path: <linux-media+bounces-34483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C62AAD45C9
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 00:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70F3F189E226
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 22:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B9D246798;
	Tue, 10 Jun 2025 22:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AlVtTujI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A526C1A3148
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 22:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593829; cv=none; b=ZjMq43hNEGAwKkKD9qZIiJ5pSOp8flTwU9xH/8QK1Dc0u4Ogca5gScZHh/6zLpe6sWWf0PPjUucdtM8fdnvduQXFle/hFx6DFeNsBsJmsn7aeBnJZhoZp2pT5wgx0vTzoGWiRVMX60q1K2gwu0h7TDH6yTveV5BZYktmKY6zspw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593829; c=relaxed/simple;
	bh=7TfUR8R2IrpRs1f5np0P2PSPG9JH0doPxboC0XmNhik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8Snu/Vo4ZAuz6DyKrbkS1+tyDaGdw5ei/I/lQFRgCgMND9z+GJSwxt3z6U29pYNVlfRmRz+wORTCv5BuZaTMOvfXsKHDzIJOzQi10cUZUyybh0sW+G4iHYsW9/eZYiR+CCS4UiOif/B36ajoicJw8EekW4c6sB0PFkVF9Xwcng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AlVtTujI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so2634850f8f.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 15:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593826; x=1750198626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIt2WsPysp6xDtdH49fFBClr+UXdYRyo8pVXPNJ74C0=;
        b=AlVtTujIl4s2x1TJUtdWI+Nc4y3lKISil4BGa4q50EP0cuwOOk+NFS9hEt+Chdezk6
         ozYCX8q048nj02uxRcDGafRs5bZ6xxErghsoS4XW7mmGrBQZNjeC6T7LkM68WWPBbfog
         0JmvDx7RhuYAfoJy9FBecQBt2L3zQXsyG2RtXm3Fdh/wZH6m/ceVEnS+bjWyU+xZpB0F
         Lto1ejC4VBenDjmlaYQIbEh4crXYxTx/t1sN09Rw1EWCsTURFCM5ba/1Yrz9j0ofo6B7
         qZZ+Vlym9w62N+U7/FtIrlTKdpXKA48ZSlnwz9hPwV88grY3GMtEXZytHfQQyIgHUcVi
         2hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593826; x=1750198626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIt2WsPysp6xDtdH49fFBClr+UXdYRyo8pVXPNJ74C0=;
        b=pIkkKh6eqFGrXTR1JHQvZQnlB2OrAAqewV0rJGgsdp/CtQjyAmE62GziFlFVHgPhkR
         G7aW1071Gb7WjV2RkOexm1vNnnYMSRaqX+V4sn5i9H/uYoSWjT9rOTcxSYqrYHPPbnRR
         osVAdsD+W4MPOc3CLoRsp/6VchYgx2TGUjjGcdG56M+NC2XltGeeyUUZ9KtYWOhYRmm7
         GITIITs7ZkV5UlxtsI7OCwhpSIa3vSZ4TM/es/7HPHkVKy9w90bc2XoYYqUvtoopJkwP
         gzxU5lEl1v58lU1KIFhxmyQITiMi/YFhtjRfThafehWRkymMNuAxCNvGEwiq2vsWNl/b
         GDuA==
X-Forwarded-Encrypted: i=1; AJvYcCV4r5YpVbMXZdClPO5Q2dji163JfLH9hNKxRbFKlSYZ0sOjCy1tHlljDIu+BQ24gM4N1fIDbVNTH77wGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw45kAtJo5vcWUmDnd+vLmxZ5Ac8D52iwLqtigjKPhPOQFsP+c9
	pVqYhjZB0Qk7u4e2BfmSm8pQKvRHTXhRO2dmyKfmq53Kulr8RNLBpy52AHw2ITsx6Wc=
X-Gm-Gg: ASbGncuwQb8ENGI3VmYI/7yG8eYBlH+1rgCvunnXDN3l4SQclZDOvz1S+XZY8RxxxcL
	BYT+rcIQqqm4vqZFo1aurEXkGfHPRei7Xb7lWCjNgtopytMMICyikdsEHa9WtbVVYjHpHOTLHtX
	PoDS1+iScrZ/UH6wPiJH0CcWqSyFDMQjuis1Vs+7LifJney5KbqG6ND/UkMA8EMNfZr5sTNhLUr
	XW21erv8eWe/NIP5MA8Cm8aNH33WODF8DmrAUW59rCrDxJkrTiCrq0PM0aXUbt1zkCn4FGfsUVt
	e59/95py/vgVrjK/Lf5XcGcSlMKGBzXDagDeO6j+UN5SdpLFDqEmaVAJYjI1Fo7ieKOVc0BIBwz
	EE1i0yLHESoJQhCLGjxOhF8c6NjA=
X-Google-Smtp-Source: AGHT+IERnljNf31VprhAEokS9VT8ilK90CxWqw6sUIOgCUXrKGJiaOEei3ELCJOxQ0LlxD+btzZ1Ww==
X-Received: by 2002:a05:6000:2285:b0:3a4:d6ed:8e07 with SMTP id ffacd0b85a97d-3a558a27717mr467480f8f.32.1749593826029;
        Tue, 10 Jun 2025 15:17:06 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464f20sm13422204f8f.98.2025.06.10.15.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 15:17:05 -0700 (PDT)
Message-ID: <10f07a65-0549-443d-889b-d36b3515a237@linaro.org>
Date: Tue, 10 Jun 2025 23:17:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
 <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
 <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/06/2025 22:13, Vladimir Zapolskiy wrote:
> Hi Konrad.
> 
> On 6/11/25 00:04, Konrad Dybcio wrote:
>> On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
>>> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>>>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>>>
>>>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>>>
>>>>>
>>>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>>>
>>>>> The expressed concern is about the novel label name.
>>>>
>>>> I mean to say the feedback from Krzysztof was that we should use isp@
>>>> not camss@ and I agree.
>>>>
>>>
>>> Let me repeat it thrice, it's okay...
>>>
>>> I don't object against the properly selected device tree node name 
>>> "isp",
>>> here I object against a never used and very questionable label name 
>>> "isp".
>>>
>>> Please feel free to ask more questions, if you still find it confusing.
>>>
>>> Again, I may missed a discussion about the need to get and use a novel
>>> label name, then please share a link to it, it'll be very much 
>>> appreciated.
>>
>> To hopefully help out:
>>
>> label: node-name@unit-address {
>>     property = value;
>> };
>>
> 
> Thank you, here is a link to the wanted section of the dt specification
> for Bryan's comprehension:
> 
> * https://github.com/devicetree-org/devicetree-specification/blob/main/ 
> source/chapter6-source-language.rst.
> 
> If for whatever reason a proposed "isp" label is preferred, then
> since a label rename is not an ABI change, it would make sense to
> do a massive change of renaming all camss labels. Otherwise there will
> be an outstanding incorrespondence/confusion of the label names in
> board .dts files, and that's bad.
> 
> -- 
> Best wishes,
> Vladimir

Ah the label, I thought you meant node.

camss: isp@value

Yes
---
bod

