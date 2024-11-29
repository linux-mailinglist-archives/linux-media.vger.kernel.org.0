Return-Path: <linux-media+bounces-22333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBE79DC2FB
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E0442821C8
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5859919ABA3;
	Fri, 29 Nov 2024 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UT0n/lxz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C1189B83
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732880499; cv=none; b=VYpVHFZA2oPiC2Cih4Ldu9VcWeRlTGFdtJk8KgtGjFOe3ethzmPQJessPjyv45/66R0gaDhqeG0XpIElvNuqx02lJ8+z3VHoBSy1e0rCCvzElFW5h0gBHXahpdfsD4PsjQ1174haIfQyYuGjU/NTvMMMzx2tKFv/NDVp/vCJu3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732880499; c=relaxed/simple;
	bh=QOYcGKD6GkoOWI2THd9QW/QAO9FbQ/mMjfRQ927Bf6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5LAeccjymmTp7N9aTKBdx+Edsn1TAyYwM+cgPfViXibMc/M1/iCi8eqnEB1+SpgzsCY2O9RpjdYbS7yquyDWz3ZQ9Cj5ReytJPCFeVIPFLz6EaSDOGjHWHtG9rIMA1KJ7Yc60FzF+qURpaIn37BYy6L+lWuFKrZy9jixVMBrQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UT0n/lxz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so16099815e9.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 03:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732880496; x=1733485296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3sMy5emdErSKL+MyeTW7qsU/fxRK/CVygOjCkn7jTE=;
        b=UT0n/lxzLylHtKILENkkGWQQbVbpjsHeDav6FntpOUMYGwhmraqKHosRzXfprevPPU
         HHXLRWChR2zwCwFXZBnNrgSyeIMOA4eAmTPA3iNVThzpHHIqa5nmULD5f68Nwx9eZzgK
         HjKd/WoAELshJB+X3/LMdeNPceq7hoJXRM8uaTZHqBzlth3Tn+/9crdfTQ/Ja1POoapO
         EphCG5CaLoICHzBgjfRhGnuob+WTpJ+69K/N6atuuLvd+aRvZXZsHNjOFyzzOxNzBszj
         Nkkk7RlBk0yepxoG8DfGnGVT/VDn6jkS0lj1G0/3hSyyaKbBQ7hES7WkDZ3KDRTlcX+e
         oN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732880496; x=1733485296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3sMy5emdErSKL+MyeTW7qsU/fxRK/CVygOjCkn7jTE=;
        b=d2LhsAuk0PnVaI2a0wPq1D9tI/A0bMtITeMgxPoDqZnUmr0lcH/AJ4M9hgZ0v6wIXx
         cQs+7CTFQqNKY5ChyzjvwlHIO4rVWf5TmZjn7ADGPo9CygXsc2zjS0Q8MDVqVrjDyEn/
         5S8SyAatDcqgfWmK4DOOiaE/OWt8+A3LAu3PvE0MbnVgx4/8uJ+NruT+ZHKlFgkWaScc
         mmkapNg+kNr+yiBH6I7qoILjMSylL7SOw7EzYrlS6WD/RbHc9XbGZf44lJwwmWIo8xW6
         6lGnv+mt15x2ZuLF73bYfC2VWf5SrDXKPRaspYI9HX/8267h3gBY+RxrGOez5ebQfxnR
         T9ww==
X-Forwarded-Encrypted: i=1; AJvYcCU2f7ymHeLJ2TQQ2QcU/ouxjfK78kN52Mn7PVpJ1Y2QGwurqn3gDChUu3qjVx4MkntJdjtsWyOkhZOxBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUA+mDSmMjRYTB+gn7W+geE1B1CXG3TSdwg+ltq/pvEsevbHn6
	jFnQNLtoyp5kKKpeuDOGPDATIvrQNTqtt0QxhbNbKZYUTE5CNKVOwHvJx/EejhY=
X-Gm-Gg: ASbGncsfGwLo2BT81XeCEAm/u2xr26Fk/8DksUs3gi0mfwc1/nLXsbKNd3JzUFr3C/4
	N7EHwLPczSbZKvo//BfiZTPdVyu1IvvxcQWU7974Qc73ZG9vtfizEEZmDinozb1D4OfYauwLYOH
	Rq9hVL2mECJGrUvG+25ik8dMj9QO6D+WBVGdM7KxbuJeTG3jorwTKeSGmQq4/tU6sc/LUvrTYLG
	/G6Kn70glHgbaOeGcxTjKyIqUzkxL/goeFdKrbdMYzNLt5qrcnSNJMqLC1rmfg=
X-Google-Smtp-Source: AGHT+IEbk/N6DuDN+SePwKbHpNWgQVLPGKHhlT6DQsr1Hm/lrxlr4iXWaEC1n8sXgOSEQjeYKa4T9A==
X-Received: by 2002:a05:600c:314a:b0:434:a902:415b with SMTP id 5b1f17b1804b1-434a9dc3c69mr122172135e9.10.1732880496450;
        Fri, 29 Nov 2024 03:41:36 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74f05asm81159195e9.1.2024.11.29.03.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:41:36 -0800 (PST)
Message-ID: <4c5acbd2-efb1-4d7a-b948-91d800c1c113@linaro.org>
Date: Fri, 29 Nov 2024 11:41:34 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: venus: Add support for static video
 encoder/decoder declarations
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, devicetree@vger.kernel.org
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
 <7d344377-f1cf-400e-a9c4-442123dcf4ab@oss.qualcomm.com>
 <95ec73c9-da38-4888-9e00-4458b5a7661c@linaro.org>
 <f88dbe6d-ceac-4fb3-83ad-f202a4703003@linaro.org>
 <6d3ed1e8-7294-4927-9aac-daffe6ffef37@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6d3ed1e8-7294-4927-9aac-daffe6ffef37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2024 11:23, Konrad Dybcio wrote:
> We can just keep a small function to grab these and assign as if they
> were specified under the root node (check if video-encoder/video-decoder
> both exist, grab the clocks for respective cores and continue normally).

Can do .. IMO this solution is simpler, less code and less risk of 
introducing upstream bugs.

I'll leave it up to Vikash and Stan what solution they want.

---
bod

