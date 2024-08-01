Return-Path: <linux-media+bounces-15698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D799449E3
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 12:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D04B5B230F9
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 10:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B70187FF6;
	Thu,  1 Aug 2024 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHILWnvf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754DC184539
	for <linux-media@vger.kernel.org>; Thu,  1 Aug 2024 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722509983; cv=none; b=KkuxkwXIoM2KF8m8mPSP1T2UzekkVWVepM2xB5mA1530l1A7Zl3ZK1WupeMKj4JGPMFUK3g+NRSNT0ZrY2iRMVeJfxykZx+ko70CgUzLDJqquT7I1GAciBcKIngGwG80+9SKRgQr+zvtAbmoJxttUWebsU5JtuMnPuZ7nJaZzzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722509983; c=relaxed/simple;
	bh=YKPDhjykZWTiLQ4BdU5LEqOhz/OiBVwyn8GVVMK1hpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rgVdaDcAuiYf6telrQXxR7nCC2XyADCik0rYhsQ7VuTw2cm6/qv3fcFRiqO/uNTCapfAfJBY++8XnIoUBilo0h8g5WiWBmVaiwT9RkSUKUO8496Fh/rveZ0xnc01NYZppa4cuqnqllhVbBE7uCns+0e38tlsl5QJzWypK4wJ4vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHILWnvf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3685afd0c56so3474073f8f.1
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2024 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722509980; x=1723114780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=676OcPqCb4rfQJ1Nn7v/M7+nKgEgRlJqleLPojZqtAs=;
        b=yHILWnvfPpHevXXyJGdH0hEH5TRKbqAPZ5Rvv5UX8SRb23VLlpKOhxXyOw5IxY7kUb
         S8hGDIyJWeqBx6iKHJWQVGVtMmozmxeF+92TFM1u4KYNkvRdi5mruPbLw2NIRSes/Wsh
         U79shsygdW0CH3NMeQXclyJFwR3N/SSZ5Tij2xPoy38atK+KQ94o5Q3CIQxErzo3Arx9
         4ZWQ8pvbVGqpZMfm+syg2NHaULUH/xP4w7bUUWz1DCu4Gv2P1kf17sb/3QnGuRcBvLxN
         GPbPE+QLk/BKv2jVaAZ4ZEH0a6uYbHLmR37utzmq3+LR1I9nGV88lq1SmtjzEijSTHw6
         ImrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722509980; x=1723114780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=676OcPqCb4rfQJ1Nn7v/M7+nKgEgRlJqleLPojZqtAs=;
        b=wVcvOkzbKU66H18G7WI5YRuxKueAiac9gyW1E+D79DvjqBpwMtlB7EE6xAeoTDtqBX
         Tl/Avfn/B3rsFQMJPmPCyIpLHqzOzZZBXrAvKXTP0rx8+CxuFJ/k346MiKckU/8XWWMr
         +ArrlLGDrtrfOAcm3KeGE9Nw/jxC+a1h9NBPWhPS1Z1n/3DlGpOgYKWZYsHc9ZUBO5SW
         vdGkU/AQXgsbTrMDgHuZIooc39PN9XfluYJaeSCyMFuNguzQhlzmJ4GGLBaKVwj6Ir0q
         wUtlNE03zmoJeWllB/Z64U2NPo1SuIakNv/PaX40X6ecKpe/T9X51G9VGCzElFUh7UOe
         LpQg==
X-Forwarded-Encrypted: i=1; AJvYcCVPuVU+xJYaS5KHQey+fu9vTEDW6AHaD5oUQ6U1JdH9pKzkwdpbqvdcmUTaV4WbIYhFxUgMQokYHsPIP4AAKFWb4Dq4rRRZDS0SPoM=
X-Gm-Message-State: AOJu0YxyFfbEDDU4JOq2E9uou6K9L9raGO6eDTQ8KZ+hkOtRI6U78z/k
	z3Us3HZYpwELwVIN5vCIiUjZX86FPsP6TaovrYeDB8A19FmdQiVg4FxjSnP5UZQ=
X-Google-Smtp-Source: AGHT+IEVV9QJo3MhOKRs8LhMPNaeGzvm9ODYgj/prSpydjCWDj8boJfit754xLQyeTPEPNCRqFp4jA==
X-Received: by 2002:adf:fc01:0:b0:368:117c:84fd with SMTP id ffacd0b85a97d-36baacbd5a7mr1430870f8f.3.1722509979651;
        Thu, 01 Aug 2024 03:59:39 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b3686194esm19069104f8f.90.2024.08.01.03.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 03:59:39 -0700 (PDT)
Message-ID: <ff128062-5c1f-4abe-8582-543063d5e526@linaro.org>
Date: Thu, 1 Aug 2024 11:59:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Depeng Shao <quic_depengs@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
 <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
 <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
 <3011c561-d39e-4ce5-a544-33f24ca7a67c@quicinc.com>
 <bd6f3613-5a96-438a-a2df-cb2728e30c29@linaro.org>
 <30d56910-df7b-4459-b557-effc21ffa132@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <30d56910-df7b-4459-b557-effc21ffa132@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2024 02:53, Depeng Shao wrote:
> but the issue is that the sm8550 can be probed once having patch set 1, 
> but the sm8550_resources isn't complete in patch set 1.

Doesn't matter until you _upstream_ a dts that operates on it.

Its not a massive deal if you start at patch #1 and and patch #1+n and a 
there are a few warnings in between as you add stuff in but, for 
preference every single patch applies and builds warning free.

If you

- Add bindings
- Do driver stuff
- Then do dts stuff

You don't need to worry about probe() doing mad things.

---
bod

