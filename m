Return-Path: <linux-media+bounces-18232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA72977473
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 00:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87835B2267F
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 22:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805751C2DC8;
	Thu, 12 Sep 2024 22:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQg2PY7C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2921C1AC7
	for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 22:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726180884; cv=none; b=II8+18bR/d1iSWTn6/4u/o0xrmZydTy6VGa/uUlFx65zmKKeaqrykD0QalEn4VJyFZG5qOotYMrJ4kbQ73vNi9GdVSoo9iiIdTuzDQgNJlLfq8cZhSZzv5ybpJ1l+VpgsOFqAV6CkyRCfohrbLfPVTKKtdw/rNdkX4KKtv85G20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726180884; c=relaxed/simple;
	bh=83FRIciaYxd4kR2zydflIuCoy19wOn9CZxtVeMD8VBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6KsXuA6hOFtDKtbA8syNiy1YzE3FusBKAZrydwfKN2uSqTg2pEQh/eXOoU5M5frFCVDu/O0Rw8FhLWqakcmKoB4w8FujloDNyhhBgYTyTfw8WZKYTYiTL1yfvkZG2rmgDbVoU5geUUXuAlUy6/NzeJTONy6xOMvtoxGlVXRL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQg2PY7C; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d4979b843so202034166b.3
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 15:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726180882; x=1726785682; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNDlhV58wBhSa/sob2kg5n7aKktE1uzHBusvuCkow1w=;
        b=AQg2PY7CPdKxKkHxG0yzQjdQMCilhrSF1+fhvgo7RP15twTs5dfiAEyr9AftOLL1xH
         /X02dDDjOug91y69AcJjxUglgaTZWG82ZU12fQOY9VPmhcSKNpkikCdFzSnkxPMLvOlY
         BuiBsLYDPj+RyJGfq/oTSf2iJLFkxrU14KabX+c4raolDm7Nw8jk9tIG8uf8s0/msMLc
         kedPQRKbiwLkLtmlv0Pndseelsdz+Rc4To8EY73C9g6fg4zSD1XG/s3/CqoFP9saKnwE
         W4KYYXu0HVbeSihKO/4YxR/zdoQTdhfqPreR2lw+3FTMwkZshhoTNFuku9mgdFxEqwi+
         MrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726180882; x=1726785682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNDlhV58wBhSa/sob2kg5n7aKktE1uzHBusvuCkow1w=;
        b=IiLC1n9t6hduTlIKMU9TgRWlC4TadXn3czPE0OG7WQNt/UtfjZPO91JnnHZPGPUYwv
         w5Qa5scT9tN7GKWdy917qKFO1NDb9o4DQuEYGRBO7SWND2wm3D7nS0fnoAVCmDZ0CfPQ
         M6EIQfW2GVIJ5vVe+Pa1T11itT3In3sBNjKIUEbpEw3hchafgRX4M7zKzYcn6lTdwqsL
         jE1Ag4C7YL2aJXUuQnDufdA6T8wHS5lajjo504Rb6I5VBveTMV1I5WB+6fq3U9wdfHWM
         ieLMF9tyTFhUcv8fOXXw0/yV7GORCNC85cGyzV15lCplIZPfVcO5BPuYVfzOaUONRQJs
         J+0g==
X-Forwarded-Encrypted: i=1; AJvYcCUYSzNkx5nqK2Lk4oBGvGtrWUTDATd5qp4oLguOjEImktttyvP0tBniz3PTGlaFkemvYeLYUtax/6Mt3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJlbtMxeefhR8ASxb9Tn3KFzLMw8a0xc8EtLmgcL0V/GA+Jit
	irWBUE1y1/b7LPs9i7zGigT7/MvZGs2P/EngK0wP3Dr/BRYrK96bjezkPH5lvNw=
X-Google-Smtp-Source: AGHT+IGA5yjrEWk1PSxqy8vtu0MjP53IILiSojOtFrNd7+uS3pLsENvcjv9WSXRmLXsQ8nsIeABxrg==
X-Received: by 2002:a17:906:fe47:b0:a8d:6712:2ddd with SMTP id a640c23a62f3a-a902941d681mr419093066b.2.1726180881569;
        Thu, 12 Sep 2024 15:41:21 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ce86cfsm800946066b.150.2024.09.12.15.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 15:41:21 -0700 (PDT)
Message-ID: <6562a958-47e9-4a49-b235-fe8deba3c051@linaro.org>
Date: Thu, 12 Sep 2024 23:41:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
 <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
 <da60cf71-13a4-465d-a0ee-ca2ad3775262@linaro.org>
 <97e4f888-1ed7-4d82-b972-3e0b95610198@linaro.org>
 <6eadc285-f413-4bf0-8795-59ff19c734da@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6eadc285-f413-4bf0-8795-59ff19c734da@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/09/2024 21:57, Vladimir Zapolskiy wrote:
>> 3. Required not optional in the yaml
>>
>>      => You can't use the PHY without its regulators
> 
> No, the supplies shall be optional, since it's absolutely possible to have
> such a board, where supplies are merely not connected to the SoC.

For any _used_ PHY both supplies are certainly required.

That's what the yaml/dts check for this should achieve.

---
bod



