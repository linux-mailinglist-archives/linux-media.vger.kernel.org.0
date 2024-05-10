Return-Path: <linux-media+bounces-11347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8168C29DA
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 20:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DC691F211ED
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 18:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB5F3D968;
	Fri, 10 May 2024 18:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zn0KmG7X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06E38DD3
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 18:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365696; cv=none; b=tpxHAcJX/2ZwJk/3JQ6tuiWwaM91M9I6odIhSwKxunleBkWsIJHTNaxvBTxiOEEn0FRhPbMalfav8eSVP6vYcm9GQSpril0mAGcPne0pfo0H499gusuix88GCO9LWLa4ln+sWpR8i1zDbpX3bB5PLJ+wh18WcfH5JZoNgC+2f/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365696; c=relaxed/simple;
	bh=CtCNGCtlv03WEpduZjuLh0kbezgIHBh8hkuAKWPyAA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhVQHV/NEqAaz/0kAz6OVf3OXENsdPJlT+QhRdWKu7bnFq/8uV6d4TtVtpTiG8/IPjfhEcN6v482A/hJ+uCZJRlHfj6fdza5097OA2Xr2vwLvYXmddFWQSHIcy5EOXOPNgbG9EYyaflKYSrooHdl6kKGgslu6EQIszHo430g/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zn0KmG7X; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41bab13ca81so23163305e9.1
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 11:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365693; x=1715970493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XFgzk9hQqfhRAjyE7YlbOIIvzDuwkCHq8sMDH8Drcs=;
        b=zn0KmG7X2RmhPmGmmFl+rsMh4WLBKveY8wr/p/JWFORB+3o5p9O08mRkRMNyOzGcVd
         q44hSUIEzjhGWin3t2io8bGKrGxviBrFexveWnw5LntTB6iBXgdTc7IwGXG2s08botxf
         bbAvkuO+pMkYUQ/behX+HiDHbrmYKKQTizxbBKaACku+hY4p1gwxKphSeOafUDnm8Iaw
         kUeXkDOV4cqjwR7q1GfBaXUjS78xOtUx9qc5hLM/wDKzclJU3egNoW8yrWIMHPjioeUQ
         aPgHyAI1uXBmwxCk5t33JeUJxMY0r4tCJBhSoEoA95iEKlrOfKuE51y8k5fleqqIBzUn
         Gsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365693; x=1715970493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XFgzk9hQqfhRAjyE7YlbOIIvzDuwkCHq8sMDH8Drcs=;
        b=FJx48g4qOS1KoKFCVxTRHdurIIjgfsvwcfc37i1jovtkIZabsWdGUeX50auGiQ6Etd
         hkrr1WwurDkag2X5gswKMahUYdLsRBUZO9I7SsoE1lb8oX82ab7dCGM0EuIq7CGMk1j6
         /TMGrBojMvgO61tKQ84+8Z+AR3N5535cmPxnsnsjfI0OvOXdk6mgUt1DiygodI9B7tJS
         yM0YI4BJCQ+rp9jP56rJe/Hdme4WPtutJBxm902OyaML//A/ZOtW1bjGYNZ7+gxr2GLK
         UDNqUBI8MkmIXUdAYhS4yUmzuiji+w5bb2zShHeeivfT5EW0H7AkchpI5zoODdR8jVVB
         ymZg==
X-Gm-Message-State: AOJu0Yz1husj/KEieHoK/RCulNeDmRvUxA94z6O3Rx7fGc/421BRJRFr
	RSv48jeiBU/q1RCiGnE0cs8GIoD6Ua2AEOHq5cBWsDGkMFuP8dYp4UQizY+xmOQ=
X-Google-Smtp-Source: AGHT+IGdDnkkQjxf0QkwQIa0WpBe/MYb4zIf8u2Fgn8mjE3ZdcDkI0IEDpQw+N5yxtZNmisjibSHaQ==
X-Received: by 2002:a05:600c:1c0e:b0:41c:503:9ae4 with SMTP id 5b1f17b1804b1-41feac55e4dmr33679675e9.25.1715365693429;
        Fri, 10 May 2024 11:28:13 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacf47sm5167452f8f.78.2024.05.10.11.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:28:12 -0700 (PDT)
Message-ID: <349c820b-4cf2-4607-8abe-a91b83efb20f@linaro.org>
Date: Fri, 10 May 2024 19:28:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] media: qcom: camss: Attach formats to CSIPHY
 resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-5-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-5-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> 
> Following the example of VFE and CSID, attach the CSIPHY
> formats to the subdevices resources.
> 
> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # 
sc8280xp/sm8250/sdm845/apq8016


