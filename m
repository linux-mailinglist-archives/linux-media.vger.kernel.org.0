Return-Path: <linux-media+bounces-43882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BD3BC2D98
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 00:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C46D19A2F67
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 22:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB36C23E320;
	Tue,  7 Oct 2025 22:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOgCjwk1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCC61922FB
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759875526; cv=none; b=STQBii6L7m5BFMPQGlmgdK7KvswkuAv2eguy6xfMKKy2kIYPhSP2fyNHr3nVjLWx1Utp9uEbVEfBdx+PNWsHXf8FwVdjVhaKFhlG9dE2G9nDz/RDQ/i79IAv8HXGZKzCu/HhWMif/Gt6IAVHXWUCnYyqy4jvDS3LRv/jfdeUHr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759875526; c=relaxed/simple;
	bh=SLeO1TAtQctqo/G87wy7jwdKIvRsiaxvWzhX3gTyZJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ph6v+avXIQFdkNdpz54aH2Bd8PZPB4ixKZla0Xb1AaqmMUsznL0nO3uK7PxwOnCN/H3odcWnycfSIRLHw+N1XNrXsLmE6pgq9VMlvNebngQ/EmKJ/lSHkJuES9UII9FcQrT+Y23Ymh+Sx4WlbKsuXj8ZxPp+5030GrQqXs/B+dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AOgCjwk1; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-637e2b86240so11640425a12.0
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759875523; x=1760480323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAcCbc5co6ODCK3tRg4Uk4cXA0LeozhVGq2IQBEDYW4=;
        b=AOgCjwk1xvUVCIv1nPzHS/Ut3NKjeD+ZBKcimKJLKZIBdygKF++7JeSzY7NNy9hlKj
         g4dUU7XDKX4yzjNSXo0Bbxth9gYEoiv+yBcAe1XT9TX2DCMRLaeucSpn/mosqe+nY5eI
         ye068vPgK24YT5dma3ugF79pmwVWeKjoyiwP2Otu76wAEeE72Yyn9DG87H6fC+NrDWvC
         aClSl+5NPIgesJmXf9fXPb92uYdBpXOYwW2f6Ht75YibTDIDsClAbYu4s/yoBMaRNlmC
         tfeFIFMfWYos9kp/eCxnxs2inrHqOqKHxlISweHTO8OnIrBdAXtgzh2ei5k+xPCXAtbb
         p+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875523; x=1760480323;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAcCbc5co6ODCK3tRg4Uk4cXA0LeozhVGq2IQBEDYW4=;
        b=n8kUjBdFJx01eNZX70wk0xVgZ63zvjvYRMgkfrGXgA6niQ0YiHZgZnRh4/rXCKfLUo
         gvQMqb11La6gCkZTx5CjXMCx/eP03bNA2P8R5l6yN0AKlJWg6KSYP7zet2da+gjJptEw
         n9o/5EGyuBPJv5+3rpC323PurtA8Cs2fKiY13Jq+d2V30s0DTdzw1kKqjpyh6q2mR81Y
         osuS3keAllwQMsXC5Liic6hQq9Pk8qwtaTdF6Lmcm7f7BMDex9TytODl6v7GhQWpVK99
         tkSErV04sl+D9e7c8hI0k+Pu85NQaO+VJdd+i4XXC3Ro4VPc2fia+dFgM9GnukOp0LCA
         lQmA==
X-Forwarded-Encrypted: i=1; AJvYcCUNHaBYha1y36OF0jDwvoGD410KyHpllgX0hRlagtL310rjb/A8h9AJBUhsVddc2jo6tlLTyRnFwiB+mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg6tcpOLieBMyDYkoNF3J/qeWtgBUbynhX0C5eDSOSES5jnWa6
	eUA7am77+VtSj7dCYhtKaltheK8F5Vm8tQQpZrd3xyFWp7domKpE8aKfxzk6djSeSjA=
X-Gm-Gg: ASbGncuGFvfDYkDHZY1drjb7qWuaVn9EGhhGfEF//FQwFW3lHT5d+F3kYhdXRBBqxRZ
	4Gl7Oij6/VcmlNECvpjB4DojMsNXm6dG7NZmjrLAOC5IZdPfGBN9N1sQOGREgNBcU8hu9d80ntS
	4Lwa3uNWTC0IDf5rqe7xixc8Mce39U6JmfkLttKONZfk+ZjnjNz8TvWDkMvO/IjSaIDGtZQVKlC
	904dNunCshIaRK2KyH/qbWsFZX5yOEk7w5+V/4XPjzBzr6vonsTcqJpQXds1NBaTAQQR4izQDiq
	pBtIcbMPCUo+etDbyQsKOirdqy2TKCx+QKz0VbM9kFksX6/5VRLoaPaGqcYXPl724Ft9uIQCRgd
	oow+8xU4Tlb2LvhERvQeoEsT8bcv4hBf+BFrXwaJTvBLd76u3VeINWUYALM5TAADljCp8ciRTBD
	bs2erZF/WJ1QgqZVoQ
X-Google-Smtp-Source: AGHT+IEvIeKotHh8V1wlYmnxmLNZTITrD3r2Kxy/kM21gnuWLz55WYRXo8kvcljBu8rz9ZiL6J7tWw==
X-Received: by 2002:a05:6402:358c:b0:634:cd66:9cdd with SMTP id 4fb4d7f45d1cf-639d5b804b1mr1088942a12.10.1759875522953;
        Tue, 07 Oct 2025 15:18:42 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637880ffdf7sm13435183a12.28.2025.10.07.15.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 15:18:42 -0700 (PDT)
Message-ID: <4e1eb99b-05d6-4ab9-9e0f-b2a2b01012ed@linaro.org>
Date: Tue, 7 Oct 2025 23:18:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: qcom: iris: crashes on SM8250 / RB5 board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
References: <rs3olaoudntfrnsgpg4nivtnyrdfqsvb3flnr6mcejih3me6zd@udzutvmmkj45>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <rs3olaoudntfrnsgpg4nivtnyrdfqsvb3flnr6mcejih3me6zd@udzutvmmkj45>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2025 20:34, Dmitry Baryshkov wrote:
> Hello,
> 
> I've tried running fluster testsuite against the Iris driver on the
> Qualcomm Robotics RB5 (QRB5165 / SM8250) and I noticed several
> instabilities:
> 
> The following VP9 tests cause the board to reset badly:
> 
>              vp90-2-05-resize.ivf
>              vp90-2-18-resize.ivf
>              vp90-2-21-resize_inter_640x360_5_1-2.webm
>              vp90-2-21-resize_inter_640x360_5_3-4.webm
>              vp90-2-21-resize_inter_640x360_7_1-2.webm
>              vp90-2-21-resize_inter_640x360_7_3-4.webm
> 
> Testing H.265 with JCT-VC-HEVC_V1 passes with -j 1, but quickly resets
> the board with 8 paralell jobs (the fluster's default on that device).
> 
> Neither H.265 nor VP9 testsuites crash if I use Venus driver.
> 

Sounds like we are failing to vote for something. My own smoketest for 
this was h264 encode/decode and fluster.

Out of curiosity, what happens at higher resolutions say 1080p ?

---
bod

