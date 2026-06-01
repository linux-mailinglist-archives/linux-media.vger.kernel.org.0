Return-Path: <linux-media+bounces-63273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGJjOz+bHWpYcgkAu9opvQ
	(envelope-from <linux-media+bounces-63273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:46:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D816211D1
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 938C23060940
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 14:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219B51FE471;
	Mon,  1 Jun 2026 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZfYOmh1H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1942E3B9956
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324727; cv=none; b=VxPmopSrtCzui+5erezoRuMMNnE9hqPaU7nKOSVobwW5ptfNzlREe6RRN7ZL2VrvIg6lkHv4POCDoyC6OZLRNK5JdulJ71s7bSL7olyrPPtnf63B53Bu0uwGGK0RrGnpJsJ/CB3HrqTbqYNgJDJvFOEpuR4LzV+sWMzPK4dW+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324727; c=relaxed/simple;
	bh=z7OicjXIPwnXNSvovi1vAv2Vm9ubdmiYGd9IzH02SY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbQj1jQY1tM2dxgkejh3E/v0WZMWZEgbwHbNBrFWDcT+qPdgAhAjvvAqzLM/FbE+GA4IXyOPFX7jByi/bXgcJaqXjcDv9ckVktoLvkOOtfP1Z4dAMrZ3C6OlRtwEdMTzIBrEt4QgIKBVI01006TCmraInLkKX+9HaY4xV5FfifY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZfYOmh1H; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso4499945e9.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 07:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780324724; x=1780929524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4nvwED8RGbgBltkwL/n3QOtv3k8HO8bMEi70W4kuUWA=;
        b=ZfYOmh1H0uOpAUKLYv9lX07qwTQHC9zNrdXSyRXDTx0vyf7OhtocTWuOsm/2wiOo95
         dLDyv6B6NMJP1ePiPc+6inMC5p8aURq9SvC0E2E/KRkyDJx1gkBGmqgb8hlEJbe9SZoP
         O0N2dErTOURqKKIP1TOVutFh6nXiAyI9sbTMNtl9F8BU4iH1UdjGFbzFwjeG4i56BSmM
         2PIA29DIWnY9AjOiNYkMblVBo0W3hBhVtQST4QeFRmzC+HiD7xFci6N/UNnBbnEhldfx
         mEQGByD973I2wEkc/KfeLDaZRhzL0LrVLZeKb2jYCaKUHGJLBwvFtovgzxn9ZxvwLPkl
         IF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324724; x=1780929524;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nvwED8RGbgBltkwL/n3QOtv3k8HO8bMEi70W4kuUWA=;
        b=D7zwS4HZq37UYdlMbfUTaA54mGG7FNaUHExjnfs/wS92vv1O98ksSclbG789xk84xr
         3l1+vxDuZZkZ9tEUPsc5r01rSu1tuwrg7oFz8at3p7Dad3ybsaP15FsCy1n64LqZEOHp
         K3WHAn/IafrtIi+Xb/0GofXEtpqQrNnG49wMrDahLtcpgSCWqb4+wjeaCChHdEQQ/HEC
         cYMw1WSm3P9oeZed3KWyBVO63G8zYFR7D00C+nu6BE0kTkwchQ32A1YEnZtNbY32YvIj
         vdCyosair2Ej5ZtjYKHBz633qmYMFhsP3dzlP4fT9hwCHJ42yl1cL7ngFL8o++qpYNEb
         +X/w==
X-Forwarded-Encrypted: i=1; AFNElJ+c99wQYuGBCjMO4D+AvqiLUAEeEopcr+yMVzeMWbbq0B8+gaYDyjeghS6eD4fKs42i0Gpjnk8scij4Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCtsesLTT5Tt31jpXl80IJFlufFXrsfa2awkmD1ItbfbXA9sP
	z85l2oynKVbp0LJi0A0HAQYQ5HBJ/zXyTtzud1Wmq4XjkB/fsv5Y7Q9pIY0xyHOAdM4=
X-Gm-Gg: Acq92OEmv3pUlXllNP20iAA0jAvuPZyeOvekGHlRd9+Sm97MpsK3IYNQRgzs6NGzlNv
	RcoNeMYkOlCZvchx6Y4Kf3oMjUFfM0mA53VRGBxBaQZRahX6adcyH2KhJx5/+zGjphjc4Wjj4y7
	TK0cX7TD0xeP8nTEw6EvNIg78avdEtUrwJ+M1p0ENP8WZpsh5beAU3Sp1L7XK7+iy9cqSJo/Fd9
	rdar8UjihyHBcE/v79FUNHiOA9LX3ZvTK2y0YL+8KQrCLnpSL+ntcBwWaRF/xekWn7meQFudF5C
	lgLxh0hw4sr5KUl63Not92QWTlOhlbJnLvC5gaeMrcPOvp3bvWGrxyoVlDzH6p/WDWXbmi6cexL
	6AsgSxU05L0DF3Xw5CLWuhR9Pb232vSIyBaTfcRfDjCE6wOmRphUehtaoC2iQqcO1nkE1xeIvMh
	l0efegqlAdk8qG9Ul/ZmTDksKQZolio9QXLGbZnYYfAr6up33eP5BvHAw4
X-Received: by 2002:a05:600c:1d0f:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-490a2a22bb4mr161598635e9.6.1780324724515;
        Mon, 01 Jun 2026 07:38:44 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0467957sm5620835e9.13.2026.06.01.07.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:38:44 -0700 (PDT)
Message-ID: <be2ee914-0c5a-4a6c-92a8-85a7bd72ed12@linaro.org>
Date: Mon, 1 Jun 2026 15:38:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for
 qcom,glymur-camss
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
 <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
 <5fdcnv3k7w2r5at3oun4eldgbmh2o25rmb234urksy72le7an5@ddl4aapbjexg>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <5fdcnv3k7w2r5at3oun4eldgbmh2o25rmb234urksy72le7an5@ddl4aapbjexg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63273-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 77D816211D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 12:24, Dmitry Baryshkov wrote:
>> To be brutally honest, I'd rather see effort and buy-in from qcom engineers
>> in converting to CSIPHY as a distinct sub-node.
>>
>> Pushing patches to hit your own internal deadlines to the detriment of
>> upstream quality is not OK.
> Can we please get an update of the the CSI PHY series? I think they were
> some time ago, they received some comments and there were no updates on them.
> 

There have been three versions in the interregnum v6, v7 and v8 with 
Sashiko responses only, no carbon based lifeforms replied.

I previously agreed to take sm8750 and Kaanapali with legacy bindings 
but those series didn't apply to -next and so will miss this cycle.

I'd like therefore to move _all_ new submissions to CSIPHY as a separate 
node and to stop accepting legacy bindings.

Frankly instead of being pushed to accept legacy stuff by qcom tech 
teams I would rather see them engage with moving to the new way which is 
ultimately beneficial to them and their users.

---
bod

