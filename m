Return-Path: <linux-media+bounces-11350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B68C29E3
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 20:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 627451C2219B
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 18:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A173FB0F;
	Fri, 10 May 2024 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HI0qHsCk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F00117BA3
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 18:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365757; cv=none; b=fD3mwPFWloHI5JNVIheT4WkOtwN9ZbwOPeMxWc7Yj5A9wKmGDs5ZFFFS5Fq+0oyQ38hw7/hKVXElVRFmZBQpa9aMguU5R8WQOipl3FLMO6jR5Aj8mkflPM2Vf7zBJti2wxsucnJnzz0UOxaa22o8blHOV3gfXeh44xXL+k10jFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365757; c=relaxed/simple;
	bh=yhly72VVKccbiMfx+cENIzjabu3cOQqm4EBPf6OImHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p71kBsLKtNxzzQtMBlMd92riTIFWwtvqQrVR1zgWpEZdlhkeoApoaAWVMbPB+utObVBshbD5acUnrZlZJx/aaCE1XT9PZgSSf2OuHXkJRPmHmyV0I5yB4wZTcCSXxNKdSndB4m6agYPIQmInDd2tnI16LGVt5qbUZ94PVSVEDyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HI0qHsCk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41ecffed96cso16981265e9.1
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 11:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365753; x=1715970553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCkEuSVJYt7RlOhxbLR5g7TF908FVYC7+hF9WOPRXWM=;
        b=HI0qHsCk5r30yp881wB7JWXsfxPUAj3VOX/voVNn/WNWAsS0s45pxAYmww5CmA5PGs
         OrFXzbq9qIfegaGI2QXwpa2Bmx/zRKOn3ghJ3E1BU9r9erJy62FpwpPdlRAe/1ykoeuH
         8iSJA/yvzcMgA0olZHD5gIiNs8XaV22npO5huOnygBaAfCeDfkw4DJDjUkpHmYVI1zRE
         F77lMLqfamaVVuJqleHitr+ZCLx7w2PvFDsTRdbhgKPsygQBcBheYIQORO0cmFGzM/DF
         c/QtES8eMzhmCxeI5Y5uNZScri4MwUwhb0arpexhjCzETmGsIeYSQQtvjQNqUQYJRmny
         Ukyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365753; x=1715970553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCkEuSVJYt7RlOhxbLR5g7TF908FVYC7+hF9WOPRXWM=;
        b=rV1C4QTUGKUPpJvydzXTbXtZDEOW2L5PJIpq8D2pd0H1sbDQPZpVPcw4RHmmBa+Afv
         fuaAu5nKSLJyX0jFXi3c0GrAqLFPtU2spY4423qCufJtypLz5RJHsxQarl+FwE0+XAP/
         Xmc3paAuRLAM0ld+blZXw7WXk6fu1CDU1TBzSzJCcLAqfKfb9XItWSuoVQd+799iM5hO
         oYrLiHZ0pHa2Gcf9mtU8Rho/XzTA7cjwaIlawED24RcDPaxHPZVnFEmbnl0ETJp9FpV8
         kg+sRLGJczKc3wmqtee34RRyz6lF9aBY6CfnVpsRExtVtEzldSFZt9x6Xh9C0EaEvppO
         y6Rw==
X-Gm-Message-State: AOJu0Yz8nu6xIqVHRHSGtXbAAaLV6dRL1xUltOzhz3cncI8XDL1TQZJV
	9XM1YFCqMR6bOFORSjgNcse4dEC1owofg2gKc8RTYRH8YxN9enIoyOddBHRphdY=
X-Google-Smtp-Source: AGHT+IFMY5QwRraPUNoFODyCy49WmKXoIYe4fMvQ12aEK7Q/OPD1O/i2IEjle0XXbyyx7xn6ySqLyg==
X-Received: by 2002:a05:600c:1553:b0:418:f307:4b82 with SMTP id 5b1f17b1804b1-41feac5a6c9mr25078535e9.39.1715365753179;
        Fri, 10 May 2024 11:29:13 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee9292sm72666245e9.37.2024.05.10.11.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:29:12 -0700 (PDT)
Message-ID: <dcf82105-76da-4637-aff9-0c7aa8ae55d8@linaro.org>
Date: Fri, 10 May 2024 19:29:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] media: qcom: camss: Decompose register and link
 operations
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-8-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-8-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Atanas Filipov <quic_afilipov@quicinc.com>
> 
> Split link and register operations.
> Add dedicated link callback according to SoC identifier.
> 
> Signed-off-by: Atanas Filipov <quic_afilipov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


