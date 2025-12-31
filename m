Return-Path: <linux-media+bounces-49775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB21CEB2C9
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 04:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6582B301BEB5
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 03:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BAD2749ED;
	Wed, 31 Dec 2025 03:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJm1Xwll"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97BA19EED3
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150504; cv=none; b=d2tanAcD3NX1yyJg9ehoLKKJm5GT0yVTsZNTzawuNqgkpqtg25CDrLmJSFBtD9qTckv6f6lfS1b2JZ8xOSKXysEi6NdFLTIuUy8rpFPbemY3+q6Kiwgn3fadfANkZ3n3IgkoNab8ZPiZCgMixL8mjVB4ienKv2AsojJzbXzDJCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150504; c=relaxed/simple;
	bh=3sx43rh8mcNR53Meq53VgRwAyMlpmTjQ95EwjtXo0A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttvkv6lmgWJwbDRQYk9d0hPMEkUlPq0HkqGpHQ2MsMWfA9/0rXogCr6g9tNEmCA5oCWDIUi04f17EGLoDz16z0MJ4LC/Q980lN+PHDE+N6c+hIdLToxWqy4EHeKVGm1fL9J/ZKP5LQMT7PEB4rMccT7qoqCO0JWFViLF9iLJtTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJm1Xwll; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7cee045187so1877964466b.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 19:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767150501; x=1767755301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tP6kF2QdO8rxuPn/APFXZNudnHAAaUvM0ZQESvBspYA=;
        b=UJm1XwllDKuBUZspsU3ieGl3fjuXkLTC1VYlDhS8su3ZN4xCKjGlNfwvsyDdK6YwN7
         DR6tW0Aw3iyvE5IGxbUwB7PEWuZzM/wb+OORyoNrMz3fwgqm3tExqFyRSHtU86Mxat3g
         GRovYTchq9fdkYQBSXdtMwwdB9W4hJ697Vu52B4Gt+WeHlBZ5IKzBIAotFofRp1TlAsy
         vFv7WgZt4MFhJhTH49JM8KzOxr5NsQNN8sydWFGRnO+xPXnZ7nzZ5gJTjAKaazdxzgDT
         UtzLmiovuqOvHTkEJJXb1zJVIDHpGhLUeiTwuVy0rsjDAWjcrg11OmSv4X7v8dIO5T79
         MNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767150501; x=1767755301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tP6kF2QdO8rxuPn/APFXZNudnHAAaUvM0ZQESvBspYA=;
        b=lLZ+di8uVB4XMVGHsEU/50Dff50hn8V9DPPdB/6VUfwZh8GpmSBZtpjCGQoxFN84mi
         07l12OxF7LBAichVEOJv60FfTzXdTBPvvbheyIVSKsEt2itbHMPzmiRisO54Zr1HTHVf
         qo/R/f758iiyaRb3Wl/GlyEAior5GbIEwMBWu4KEZHcLzUoHl/YQBIQqrlqNyj/BbQ5w
         Nfhx6sCidk41Y5tG+pxgP4zp3AnTibaEDJr1qelt8S/8ir1+vHErwHBW3BYO4Yek+LEE
         9j/yUnOGJjNnIYeCVNWpkiwtkgi4B+jWp1Ya5Bp4d/8+sfjC1DP6QUvc6rJYcCDDMmqE
         ZBgA==
X-Forwarded-Encrypted: i=1; AJvYcCXWBpPq70b7MWO3Bv/84Omb3cdT8h8MemmW0LvUNguS95q+zO60mPHmf9D9C8zGPnlDfANCeVrpVzLIdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfPsZib/dxozlVIOhdD3X/ts88MV5zRMSCgx+T8zyVpjFkX3k
	MJBcfe4UAbYK4Ho6lFQlzarn6n4VMSBjbGra+WKNeLGPxXcIof2KTNKmM/EiGM6RNxM=
X-Gm-Gg: AY/fxX7xexIeZXXVQv5F/7FwxSGSpuhnqWmKdaRh7AQwqk+Qai8V4xHH14zj3NIc1SN
	c9DlGC29nibNZEgEgIY3h0vFpzXU6H9u050f4T9/7RZrO76UXsyJNYeGjN8vRd3qfyDqazMc+gx
	gesAHb5qfFW0QJw09jJkysx/hGcuSRQWQwIgtTw2KTnxRX96Dd1WwZ9kF4mgdcnlbC5VfAr6/7w
	VusMVt65wfb5bMRiEMLXFItoFrDkb79BMrMptiYSFqERgngXrOjCE9jafTNmGl2QDTOiCr5Npu9
	SwPJJLKv01bzZR6qer43RVALno2ySfEdX7DskEVQh1LarIoarpdlky8WUAqU5XolnB9ORcOYzZC
	AVs/RKqSM8ReLAT1yFBG53x88o8W/yXMY3GJA10ScYi6+CyzyT0okUDJtDwCB6OdNsCiMS0XBw2
	7PKuL20RWZVCjMWWP66DGZdZffXn7cRSH0ZXwoXopVt9TrWnqvj33t0jA6pjXgFQmuqFVftubHg
	QyNxjIEXGdM5xCvGsW/MbvCO3zdHkmJuZj5Tm5ywjIHQ8nX02hOu1XIx6d6lxprwhotF9p2Z+33
	Qw==
X-Google-Smtp-Source: AGHT+IFFpUF7ZjEwtHXk0tuyF4jSLrh3YIHWP9ArjJT2zyDy0sVf1xmbFLKYfgn0U1pYhORgJ8TrQw==
X-Received: by 2002:a17:907:7f01:b0:b71:ea7c:e501 with SMTP id a640c23a62f3a-b80355b2523mr4497803266b.4.1767150500979;
        Tue, 30 Dec 2025 19:08:20 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de004fsm3889829766b.45.2025.12.30.19.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 19:08:20 -0800 (PST)
Message-ID: <1edac691-f20c-498e-8cc4-37776469ea13@linaro.org>
Date: Wed, 31 Dec 2025 03:08:19 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
To: Richard Acayan <mailingradian@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <7b1b0259-90d4-4e7c-8bc5-01e22c371e24@linaro.org> <aVSIYAC3DTD3dneW@rdacayan>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aVSIYAC3DTD3dneW@rdacayan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/12/2025 02:20, Richard Acayan wrote:
> On Tue, Dec 30, 2025 at 09:40:14AM +0000, Bryan O'Donoghue wrote:
>> On 30/12/2025 02:27, Richard Acayan wrote:
>>> This series adds support for empty endpoint nodes. It is currently RFC
>>> because it continues an ongoing discussion on how to selectively connect
>>> some CAMSS ports to cameras and leave others disconnected.
>>>
>>> The SDM670 patches are for a full example. If agreed on, this should
>>> expand to SoCs that have CAMSS.
> (snip)
>>
>> I don't think I am 100% understanding what the intent of this series is,
>> i.e. at a high level the problem you're aiming to solve.
>>
>> Can you elaborate a bit ?
> 
> The point is to move the graph nodes entirely to the SoC devicetree so
> the board doesn't have to redefine it. There is an explanation in patch 2,
> but the next revision can try to cut some of the rambling and also
> briefly explain in this cover.

Yeah I think I understood that part but, the bit I don't get is why you 
want to do that.

i.e. what is the objective you want to achieve with it, is it just to 
make this structural change because you think it can be done or is there 
some other endpoint (pun intended) to the change ?

---
bod

