Return-Path: <linux-media+bounces-27509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8DA4E819
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54D119C2EE2
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBAC24EAA1;
	Tue,  4 Mar 2025 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJW3R7PI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB4D24EAA0
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106911; cv=none; b=GyngKLULV7XErMCqUPuxOYicUthLi2IM8iPnnPuW4QW+1YC9uvprS+8I9fTx7v215mF+5gbnvDR7ATxv0jOnfLItZ28nIOnqr8aEuRkrVX5pzurqhVitN3UsMcKpYCf2VfhtjRtpzeVWXo82DNpCJedGw3z3htXK8PAaVJ/En24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106911; c=relaxed/simple;
	bh=VEd/Qg03kECFeS4hFXnZqJyn3+4HfSz1x69E5nv1DKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWX0hnywr2bKHXR9z/nkAbFttiiBpja4uoE2edr34LhGdjbNwwZCp8HoJFBA6vjya3a/cVYIxxJEDCkBP81+YYbJTN+fDe3JiAJphRCi2DSuwvJj1i6AXHyxPKqC7XGEPZ8UdPOTOk5e6KkerdEoMY9++Vea85vGix6xOexJEnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJW3R7PI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so3029176f8f.2
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 08:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741106908; x=1741711708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=knwLaqR4E/krVUJDxD7fdWOUGWk2k+uH2ku8XnnCDG8=;
        b=lJW3R7PI75dtuLA56i6G1Zg8jO6gja2k2fT03iiWeuy+4qBuKtTy/DvmXRJ+1ntDfX
         4rQ82N8YYLfn24seGOcG7mXbSn5kxrtsvFBjKOhiy+SJyDawiuOBmuMCkMdm9bxe3O2V
         K4WhnrUK45BLMUOcbfkrWB/kxsrN27PmeIw5oeT/UGjs/pNEXrLPvN0QpD71Zp2JfQAN
         EI720YPLt1XhhrpYbpq8DRZh+8WxexeTNeViQstA5c7JBD4OEqavvTGxrN6aY1CCha3N
         WdoxHSIhAXjxRkEj96fDX2Kt7GPytikub2c32Pm5JeWewPolJJoQeWIPcU/eGFLL6HIV
         E5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106908; x=1741711708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knwLaqR4E/krVUJDxD7fdWOUGWk2k+uH2ku8XnnCDG8=;
        b=h+mcc+QNIS0uV7N3L/mGOYUQW7olwR0/kGIO/Fn5tE5tAWvtKXuMo8sMoEWs6G1L+a
         uwv5JkXME9feOXnWX8R+OXMIN+fD92XkaYW3BDCodw6Bp2ZD8z2UWLzCvljZGl6BzjFP
         VGCwtMzntNf+X7V1h26OvHh+/LeXfr8Iw/N3Es3Qkv525Lg+eRIXe5Z30FHwlbrAjMET
         B+dtysRkCsorCb6lvghiMlT+4tGaIO8Uh3qSWPkwuxaHNA6n0SuXi/r4Fxy4w0buaHUw
         uwnKpOgdsDvoC64ex0scyaZvl1bC7u4jJYwlzyge9cqs3MrogTlZDP9CW3OlDMSWa/u7
         d6kA==
X-Gm-Message-State: AOJu0Yw3NBivfB0HHWPl0pXHYIcuM5sdoaKh09vEe4b8o3FbgupZSKpD
	L4cowcqv46v2qwK+SsLca2ocIthLS5u4tIik5zxqNwccJftuDQBC9Bter0xbXdk=
X-Gm-Gg: ASbGnctKy4J86MQ2WgUR+diZ42zm04vK3bqTx0EaaHXjhKmgjii6cQnZzs+tlFJNuIi
	TS7J63NspTLlzrSF49ktX8q8RY4P2fMvA/y5L7PoIsC6RW3gqdgWH/l8Kxc3X4xLFuRDTgFoXhr
	blpOCo37ODcfH4USZVad/USRIvHrsuH7rsGlk3xaTcL7UtaKLjcf+9VOvcSSx0Q1uKjFvrzotC4
	d2El0sBbBMPL7389mS4i9vU90dCs2QYvnM48f3HKp9y6vSifQ+goC5w0a5FUkH0IQwneDx8O1nv
	iHjGQVK8pY9V9iKdKqkMEkZwRoLKOT877xx3BxespjIySf86TM+wwUOV+vqsH84ypEhKux4ElXJ
	4W+EcCGL3LA==
X-Google-Smtp-Source: AGHT+IFY41tyGQRHzMHyy9KgcsRF5vwNocdWNy72eFAv2Q9wjjxRggFSPsKEudgOviU58D9n9GBy1Q==
X-Received: by 2002:a05:6000:400a:b0:390:f6be:9a3d with SMTP id ffacd0b85a97d-390f6be9a90mr14711089f8f.35.1741106908171;
        Tue, 04 Mar 2025 08:48:28 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6a87sm18452789f8f.32.2025.03.04.08.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:48:27 -0800 (PST)
Message-ID: <438498a4-10c9-451e-94e5-c8dea899beff@linaro.org>
Date: Tue, 4 Mar 2025 16:48:26 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: dt-bindings: Document SC8280XP/SM8350 Venus
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-1-279c7ea55493@linaro.org>
 <6f7fea59-310d-4a7e-94f7-2483363012ba@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6f7fea59-310d-4a7e-94f7-2483363012ba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2025 14:00, Krzysztof Kozlowski wrote:
>> +
>> +        operating-points-v2 = <&venus_opp_table>;
>> +        iommus = <&apps_smmu 0x2100 0x400>;
>> +        memory-region = <&pil_video_mem>;
>> +
>> +        status = "disabled";
> So it is the same...
> 
> Same comments apply, same review.

Ah my mistake I didn't dive deep into much more than the 
video-encoder/video-decoder feedback.

I'll see if I can fix the rest up.

---
bod

