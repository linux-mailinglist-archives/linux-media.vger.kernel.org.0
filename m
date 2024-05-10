Return-Path: <linux-media+bounces-11356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD48C2C86
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 00:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D286F1F22BA9
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 22:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F302813D252;
	Fri, 10 May 2024 22:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zA1wvoja"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15E613CF8D
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 22:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715379516; cv=none; b=q6DDiu9lLMTc4GMl60JrUpi+rVSIqqQUeU5+Eyw82H71X8MW8STIxCM2djIfSvRn6C8MkuFmBWnjuaelxp41qyur8INJSbRdkQI4TX1A52uRXULiDl8NYXel/NPSmohk4MN+zL5PQJyvQgNU6TnexWCzyyvu6gr5QGYA+BO4jCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715379516; c=relaxed/simple;
	bh=NpxlM/QkjOOxrQQKOAyWxy+2cA+aZu0PnRkSCCkhcyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eihIA2KAQ1w7uR1GhVVCYsDfhhCNdyBRI8pTI1DpeZihNqRbGenZaSRdk/wGCk7o6rOjW2WXQ/bPD0i4aPjn1QGavwUlID7eyQhM1b883RqEWWXTEk/ROwv5QWwAqRr4Ohz/Rs9Enf75bHBYvnrMAidnG0JUdMRXHEsnsimgmrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zA1wvoja; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e3b1b6e9d1so30158811fa.2
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 15:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715379513; x=1715984313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nc2/XLckX4wlLagr+N41BR5eQAYheMvcg3wgsr8GETA=;
        b=zA1wvojatmgGDOsAJq7qPvGkf0JiWeImnKqd6Xj2D+kf5+bPlsMOlk8gFU2Xb+e1Nr
         t57R2FMxJxw+lfBgLNzx+sWqY172rNiCYRQutQ1bpESk6PPKRNXtGOfG9pQcXHaxNnUg
         oDwoefR3fX2ds8LG49HTWkRdVRrudfXqOyVOJwK3C5XgR+lIuNSbCDGXIwXMG/XEPxT0
         2dcIRDWoRADXsJNJTU3Sz7EUp1GFFMhHHFRl8U1MrWzz+fFyXaR0ZVlRSMR6UyQ1mcbP
         N1XwJfHVL7xSrFbwLN2rpZF7gucbZr6nShWVYXPU7jUg8vDFIXuREn/zye1nYvU5/+nR
         IZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715379513; x=1715984313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc2/XLckX4wlLagr+N41BR5eQAYheMvcg3wgsr8GETA=;
        b=wJ12pUe8CfyI0K2zmttH/f8yGLSAWtNitSAGam/pP4K99mJvf9U6CQoccDt00p8G8X
         zKXFyz4/ZjPFbNwDdccCCbbYe+g4PyFUzKp6UX5Qac8AGngzhbOvbwlyw0mkuPGAEZiF
         cL8bQaPgTyTOMKogwA8K9CAE5Mv2Fnw4wfRqYCmxVgXNCVvH87L0NqO9i+XTklTOqfBo
         BcfbRRfkIk+qdQBN0pSByw1ab/R2eKwI4PTyfG8ZxRXjvw0XW8CWbmMmcCOrxHPRnYw9
         rapicezkkHMsXKnnK8kIWuRbBn1ECo7h/DbgcFa+ogsHvFd3EsnSUDIVq/x846fujJLt
         5P4w==
X-Gm-Message-State: AOJu0YxbMLeTeVxs3mFfNYQi1b6eOElnqsQD/PoWDV0myFvP3SFWKb5y
	IGWsVfEIx0POA/f5Vh/xhMO0f01q7S+hjJNYZQxmG8foPPCvbkNyGC03SL3X22A=
X-Google-Smtp-Source: AGHT+IFtm2TcpRVCby0dOr/P9MyCDscQqapc0sNEFROTg94e326EA0SP8u76bGvB1fXpD/swepXodw==
X-Received: by 2002:a2e:bc26:0:b0:2d8:45ff:d606 with SMTP id 38308e7fff4ca-2e5205e297dmr27726631fa.50.1715379512807;
        Fri, 10 May 2024 15:18:32 -0700 (PDT)
Received: from [192.168.0.22] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4200a8e6846sm17226225e9.15.2024.05.10.15.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 15:18:32 -0700 (PDT)
Message-ID: <f9afdda4-0921-4632-8e4a-e8157b685da1@linaro.org>
Date: Fri, 10 May 2024 23:18:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] media: qcom: camss: Add per sub-device type
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com,
 matti.lehtimaki@gmail.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-2-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-2-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> +		.type = CAMSS_SUBDEV_TYPE_CSIPHY,

As Matti pointed out to me on IRC, the .type value here isn't populated 
in the rest of the 8280xp resources.

I completely missed that but, then again this appears to be a dead field 
in this series so it makes no difference if it is populated.

I realise it is probably of use in code you _haven't_ yet published but, 
for now I think we should drop this field, since its dead code.

I'll send a fixup patch for this, I don't think there's a need for you 
to send the whole series again.

---
bod

