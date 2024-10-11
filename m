Return-Path: <linux-media+bounces-19443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C9C99A876
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CF9AB22431
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 15:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9C7195FCE;
	Fri, 11 Oct 2024 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvIJ+h4k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE35418EFC1
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728662166; cv=none; b=qxDUG7YdgjHfh5L70XBWVk2ekijOWZJ50JNjjb+HDzbnQMIpR6c1FirVca082SyDZ6628iYRjm4Pu5OV0QKRvECznW33ykRL12TcflQfKa4fvvw6SLesPWqmFTbaQe4qppy4+wrhBXlPzc3WFMCLuiscRWyOBpoIZQsgWjMRBkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728662166; c=relaxed/simple;
	bh=LsUiDqE70yqk0wdXE9vzO9KMm+m+jk5+g+imG3e20Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nu53tSb0+bkeJz2Es8p0oKAjwQ8vEDAaQCFk/MR29qWjBeA68ZeYgbNw9kOefHUSy9zHxDiJ7B6S7c5BKAuzwEynwBvP5pTw6BE4GNmlQz6NCY5ctzMfuOEbluNzwJiGsYF17Tnn4lvlfiUbqNQpEObtBoPoHZiW4DET5+6QsvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvIJ+h4k; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a994ecf79e7so350642866b.0
        for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728662163; x=1729266963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PfW3zLsODNqT+ZCd7YOmFJrDpIjLjC2uBGbBXhUbVQ=;
        b=dvIJ+h4kdtOecCVkAY+GosDDnCU4bYWL2vSj6C5Q5W+STl+plaQSW0LRqP3OvH5Qiy
         Sv4ylTftMivKObqpvMebxFvCr5AyKu4Y0+nTw67H8g2ttb1ikpJZf/gOMc67D3fU5Ete
         bwHN13PMTDksIac9QSqAHJ40KYsMB72/DYEOdpD/EPl1J6VCF6bJa4lXxGHoAXI8evhJ
         rZ8vuU+d1MhcSy4SBTnivSFZl50u4uVWpp240GUilmA66hMYp3hDZ9bMNBM565qvvhTT
         et1Lrs1gf0kUqSam2mXCJpzBTrpQQwgLHscLhpU75eOJtNs6r7Wuc5CG6JQRfqyGoE2S
         ewcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728662163; x=1729266963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PfW3zLsODNqT+ZCd7YOmFJrDpIjLjC2uBGbBXhUbVQ=;
        b=oRa7Kng6s42kgMQGfpD7A4bAZt5LO3u/AzM5ycZ8sQp9l1dAJAUvV70wepCSLPMF7b
         pkb37UdKwG/8O1dkss4reVALC9ojQBllYBXf9AQQ5EI5JZqcFJDmwffPiJhB6laotDE1
         IToxuMl5UIXy4FkDqy5y1fGtKoRpB99gWdXWFq9Aj2a0sMT4qDSxMPQwhx6TQtKZ3ZgK
         NLQ8EAji3fkVBgU7zq7pzmpOYbsijxZV7vdBjx3chs9i/GO40+hw26MYM06Bn09Mt4fP
         cdW7cs/SLpNL0h6yqCi8W0v+rwj8PaMCIbxmuSs8mr6XWmR0541cT1gecHsFTUdQ/B7z
         f8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnosFlHGYzKHeZjvY0AewN2M9BIlG5NGJZhTMV/PAYr/rzi/hQxH4IDEJvBqDDVrw49WtkirCeLFxE1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YygfLH+CM+b3ywyp68c9bvZBM/f1ztsNm4bgQtZFu8zQzwuXWZd
	WFIOu/x8JlvUIpXqqbkshtzFTG0/wVcgzMCSFzZacZuTXr81qem99QyVZY37b2o=
X-Google-Smtp-Source: AGHT+IFQS1m801d5g03nI5rdOrNbnaMx/maIW2bSzuFKOe+q9KSROKeUZyTkJ940EzDY635ITI12nw==
X-Received: by 2002:a17:907:c7e1:b0:a99:5a40:e6b3 with SMTP id a640c23a62f3a-a99b9416b43mr268365666b.10.1728662163310;
        Fri, 11 Oct 2024 08:56:03 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80f2726sm222412566b.200.2024.10.11.08.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:56:02 -0700 (PDT)
Message-ID: <a796e8ac-4a58-4b14-94ef-cb1d5a8775b0@linaro.org>
Date: Fri, 11 Oct 2024 16:56:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Rob Herring <robh@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org>
 <20241011144129.GA2295617-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241011144129.GA2295617-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 15:41, Rob Herring wrote:
> But when a block is changed, any rule on sorting may go out
> the window since we add new regions on the end.

Ah I see, I didn't TBH know that.

> This one in particular I have to wonder why csiphy is not a separate
> node.

Hmm, to be honest with you Rob, even though I realise I'm digging myself 
into a hole of yet more work, yes - we should probably structure camss 
along the lines of mdss which has separate nodes for DSI phys.

-> mdss: display-subsystem@ae00000{}

We have 4 SoCs "in flight" at the moment.

sdm670 and sc7280 don't require any real driver update to facilitate.

sm8550 and x1e80100 do require new VFE, CSID etc.

We've been debating how to model the regulators for the CSIPHYs too 
which are on rails supplied by PMICs external to the SoC.

I'm congniscient of the fact 670, 7280 and to an extent sm8550 have been 
on the list for quite some time, so I'd rather not push 670 and 7280 to 
have to wait for a whole new way of doing CSIPHYs - especially because 
these are old hardware with little to no driver change required to support.

OTOH x1e80100 and sm8550 already need development work so we can do the 
CSIPHY transition there.

---
bod


