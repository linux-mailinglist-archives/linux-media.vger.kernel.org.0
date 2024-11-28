Return-Path: <linux-media+bounces-22217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9D69DB87D
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 14:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EB9EB21528
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 13:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F5F1A9B44;
	Thu, 28 Nov 2024 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D22owIct"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7341A0BC9
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732800265; cv=none; b=gc5xkcwUTgZZ6OnOmYtSH348NcZFqvLNeRuSKAJJUIKs8ILqf2Iso3lFOIC+OwNhJNNc3qaga5g5mNOseanTvFxsEzaCdc79k415t2hGg1bqMHAqdx4DpPXy29s+Pfj5jQ1R0VTH4cfCSPk2bngfdEd5FwnWkt34DqLUZ8jN20Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732800265; c=relaxed/simple;
	bh=6N0bgmGW6ZFE1RBJSAYibt4wD8JBkZs1/eYZgRBGMOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWdAieMbxl4srFFfArL+26YgRe0JkpDMdVaEFCF8BxKgUWYXVuBj7GleqlymsZGj34foulv9XMhD/pbLBo7oJnvxMmv+ffkigggWsGBOppKiIwZiODvVezL1CF7I2IylNmZjEOTFYbXATzU/PFGjJHtTrE9W5iK/mzG0OIOdulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D22owIct; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53dd41cf2b2so92440e87.3
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 05:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732800262; x=1733405062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXmwGgua6b6IFHk+sz5oYErhryQ6lSwss7yAIxQHIIc=;
        b=D22owIctVKxBDkaxGYzFMy0rfpp6kKM1JoEakN4yj1q+xxIzhOeCA24rgu/0Jtf2fD
         YdZCFfXRCAJGK/1h+XMYphJOvJSNeZWdajY5PfBig/rg6avopRRxOwy2ccc8tYBbg77e
         XyQrIddjeRH4ASCI+sWepk0ZT93onZnrKIo14FJ5XLrd/IH2kfEiyQFoAkldqcBUQOuG
         /fId78i4zP2kP6s/AofO8owlxCfXn4fZ21OjvPFnYzmuN/UXR3O66e0falhSxEnAKjnx
         XD2ffpaODjOtiszMWyihs7g+NtWAi6yJV4X+jkQ1sYn6uf8Xqol4l0oB0gLtZ9fp5Ce3
         lyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800262; x=1733405062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXmwGgua6b6IFHk+sz5oYErhryQ6lSwss7yAIxQHIIc=;
        b=iuufZDQyCM/921hny4LqLpk15w+LmseCPxVkr1oprJc7hThPQz0PH6qqY9vUA15S0R
         xT0QQodficwGfkf1XZhRmiZFODwojuwzyoASnvDdjvojNBJnxXoHBxoTyBXXlI3EdKHU
         HJx9hRCKB9QNGUgVzRG8YXcntV7KYFrxwbZWmW0lvKWno1kFz7g8vmiro6hO7rnTJ368
         6WSdW/TwZ1Pu4xaUFmxh56fC/bKKPYsevTYoBxAaMGoa48nuIyAE2helyl5WfKgLz0gZ
         9DtkvgPL22kvZ1Tp8xvUysVwXZrfSnV6NsijyNn4GHWPkdDdu4GLNy3ucDNQqUUzCA68
         ho6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW16v3YiEuOXwdus3WpvUCZwxoJWKjGqnCrpo1F7h7CHWL4zoLG7CLwFVZvBHSy+eK6MpzOOEiVTgx3Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9lJsGYdAkq1c5bE+44PE4/vZDGE4whYrK+HQmcGqabmzqvmqe
	z+zP7BIWOYrKkVdyaZLjtGJeBqVPWeiTTWdehS2kvoWQwqRQdRC8WHEz2VSasIg=
X-Gm-Gg: ASbGncshrtDiBlk/MJ3NlJOO5tddVsIF80I4DUEh006VM+vC0PDEkjU+pNM09m4XsLA
	e7god7eRKPxPetA/DswySSk8eiRm/4axOCjYNiSm6ZaYHX30SLK4GhkBE1yzcsxVemhfDa+uVu1
	XctH21F7+6PRgTaDf9AFWEIvWdxpOPkePJqlD6y2LshFTJwhisa4uIV6slJosaoKaqn4zZ3q2i2
	QtD2nlNug9TbvKUGeynx/s8PidB4jWJhwfJeaMCvT5XNZjnB/dmi3taRrnYqIho74jiX7nlOSLX
	Im8CHpy50GbWhUhpuID6rRHSYsS/
X-Google-Smtp-Source: AGHT+IGFUJAxjvhsByyBdZMcAk0gikSSjkNb3tPTHIn7AP9ungve1WLXE07mxdF/zOolQIu33Qx1Vw==
X-Received: by 2002:a05:6512:3b23:b0:53d:abc3:82a6 with SMTP id 2adb3069b0e04-53df00d3e59mr947638e87.4.1732800262033;
        Thu, 28 Nov 2024 05:24:22 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f27fsm176060e87.157.2024.11.28.05.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 05:24:20 -0800 (PST)
Message-ID: <b97adbf2-f19f-4cd7-9266-526957c4c3d1@linaro.org>
Date: Thu, 28 Nov 2024 15:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: venus: Add support for static video
 encoder/decoder declarations
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, devicetree@vger.kernel.org
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-1-c010fd45f7ff@linaro.org>
 <ad906baa-a93f-42c4-bbe5-968fa939c653@linaro.org>
 <71dd9aec-e2b4-4323-aeb6-53f2491005b3@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <71dd9aec-e2b4-4323-aeb6-53f2491005b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/28/24 14:54, Bryan O'Donoghue wrote:
> On 28/11/2024 09:02, Vladimir Zapolskiy wrote:
>>> +    np = of_changeset_create_node(ocs, dev->of_node, node_name);
>>> +    if (!np) {
>>> +        dev_err(dev, "Unable to create new node\n");
>>> +        return -ENODEV;
>>
>> Leaked reference to np.
> 
> I don't believe that's a leak, because you only release np when it is
> non-NULL.
> 

Clearly it's my fault here, I'm very sorry for it.

--
Best wishes,
Vladimir

