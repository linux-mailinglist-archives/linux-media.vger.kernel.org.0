Return-Path: <linux-media+bounces-35352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC1AE08A1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 16:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C8B24A2105
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662B821D596;
	Thu, 19 Jun 2025 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bK+UQPn8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E38421019C
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343005; cv=none; b=XC2AymaUcxsv8FEdzlIUWFo42RyHca3Pw2lFYTVb104wsFTL+FykhJDbFSi32k28/xAh4MFkdvVuzmLUBrkIzI2kbyuVN+cCjs9QAJ2nhHvlT1JtfD2hQETgqw4Ry03RkLQBDmlyS3ur81quu2zinJdcbRMlVIBcfPXQb9+mhxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343005; c=relaxed/simple;
	bh=6kzgpoC/6r42t3YE4N/s+jy2WCWfT8as0yTg6s3TFZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDLdrjAtET+M0S+cndW81JSwxV2U+7p7Z35TNRaWRbzgTtx71UKdsTVOo/eNC/vTMvEvq6zbXoQ1XNK4gpXTzwy4wc7VrN8Dg3vaUI53jMfQf02ZbXQdp0z8RTAXL8rTHaqpBmv+hL7oZ6cKSOd1MsyMFsM9sAX86agrrsYZZhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bK+UQPn8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4f71831abso754130f8f.3
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750343002; x=1750947802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRuOPGj+1FvnFYpArdk/uAbPOCfkau6emWeICNDblLU=;
        b=bK+UQPn80TDUMaDAdGEP+Jnjqm+Phi18quF1sDStfxEotLI2IcwkfmrNTvEKWoKTX5
         MYXPkKtbY0XzX5pffEoUQe85bd6xC7Eq9NJRPCw6F2qPV71H/nnqZcdUaubXlBIWOSWz
         zEzcsHVzU88ym0mSE4uqKEUF156SLwL2uTIDIGkCst4j1yfMdORhL4EbPiX3yyQzRh/x
         uqRxQA/htu8pN4/lWGt2NzFMm6QPAjHSaS16PeyPLftcEz201a/6SbWOhEW7fXBaYy3H
         8e+ZQdCTDDjdYHK6QUuXYte7VZgBqzsmEOFQZiN7h8Hc1ecKlmj/URONo09b6uSpwJk2
         gdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343002; x=1750947802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRuOPGj+1FvnFYpArdk/uAbPOCfkau6emWeICNDblLU=;
        b=OgYoko5rxd+fs1A0kwgNcY7T50Og/28wBWGYWuJwrAl6JSSoUEnTbi60dAQRG+pf/N
         prGxJNFuCw91KZdW8iPutPOWK0zYKQW/UVKtiz74CwBtQYYSGbtmNUL+Uf9ttMDiYeWt
         jv+Iq9vnfM/96wJt5h+/hFEEyfYPLfUtoXSQjd62KNlmv9HM6XGP/eR7gd8eZPoJr7j4
         HN13mtQR1wkRoC+m1lpvlNosDCjhXGpavrBDuoPM5Yi3eYMZNDedYBC/YSvai3DtOyIE
         Y9o3qOye/y0HNv2vpTIpc4lCIiLrXdI1s2QOk5lT6BCX55GVDgkp5rwPkOWus/Oz4OPf
         gFkA==
X-Forwarded-Encrypted: i=1; AJvYcCWWXhNGv7RZLp66nHPdA062q0lFMKOuI2xI/mEWlQIjm2oGpMM45pjbsPT7jP4WRYSdm3q+Ey1kfqd52A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3ncESAIsTJfKGKBzywWCzcZ7GDAqXn9Y0gfUJtGwJ/RvyIj4
	dLHrAOOA63SWLVt2OwmTzWepeAYXr7H/YWBQmFmFBN2pkyyf2Ls7jZKdi1X8FcXAxHQ=
X-Gm-Gg: ASbGncsX9OEMsTmPkrq29ZUBNdREpszFmPO78a4Sgy6s/h5WANt24QvGU8g9+65W7aI
	zEiCo6G8tc7+gq7PcBvp+ICYpypGwaYUQs2jkp5yNq67lFLFFz27VJTKdDLfd51S4AR5cMvkKN0
	Trcv8DK/HMKTEZEC4Fw2pL9otKfNq/GY2jFC1mF4HhLucDF2/bliIQSw6U4RpZ7BpAAjHkbGtiH
	c+69TKDa7LFKgIojW+qSbmwmFhHwn6zeeD+/T+cxOh5GB6TuLGQVaIfZ9TY/84qgEqxFTwZVsOb
	0wrPEs5mb1NX0CgTCeDqF4VJahCgLEJchlMKkgGooJAAbj7qMfNUYbIai371do6UwelWm2Y035L
	NGKUqouRA7Ek4hJlbqj+SnHFIHTE=
X-Google-Smtp-Source: AGHT+IHp+ZdhxuAAGQlqFZ4R4iZi67IGZtlL61Gzmpey7v/7Hirij3KEhOesLK5659xblWS4V6bLHQ==
X-Received: by 2002:a05:6000:2884:b0:3a5:2ef8:3512 with SMTP id ffacd0b85a97d-3a572373cdamr19566371f8f.14.1750343002467;
        Thu, 19 Jun 2025 07:23:22 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4b67bsm19368026f8f.83.2025.06.19.07.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:23:21 -0700 (PDT)
Message-ID: <620f9281-208f-43ae-ba38-4c3da04fe5af@linaro.org>
Date: Thu, 19 Jun 2025 15:23:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: venus: Add qcm2290 dt schema
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, stanimir.k.varbanov@gmail.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-2-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250619142012.1768981-2-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 15:20, Jorge Ramirez-Ortiz wrote:
> +maintainers:
> +  - Stanimir Varbanov<stanimir.k.varbanov@gmail.com>

I think this is the wrong maintainer entry at this stage.

You can ^should list yourself and/or Vikash, Dikshita and me.

Other than that, LGTM.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

