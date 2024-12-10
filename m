Return-Path: <linux-media+bounces-23126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC22D9EBF8D
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52A922827FA
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D0D22C350;
	Tue, 10 Dec 2024 23:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BCJC79Av"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828A229127
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733874365; cv=none; b=EdjHriZbKtEDPb3+YY/5A+ViE5lSEK3mXJULFbBCob8Ei6lBU0p8Q6qPMfpMQADAtS0/uuT7cqLsDHQ2N2DtzX2ouITrwK34ku/ga0agGg086CUbtoh8fbTskbCbqQ6eoDUd+uN9PqZyA+KOH5Y0h7Sbj4fHWqVRRQTuAPE77TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733874365; c=relaxed/simple;
	bh=UwRsTVENoKuapuXoJkzI2ldmpDPY5nWtFJ4BVsBVGgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mavW5eHJFvBsvaMdeEIsgr92uMhZJfYG36ve3EpYuzuSLMusaUPqF92yZsJSuKtUaktFhTpdR+ltcSurzs62MK7WwhFnIANRF3uFyEDkCKxXKsQHRo4Vbs1j2uNGCfulhf81HK5Y0COxgBFHbm+mSeEF4tVnsSpVvj5qZb8GNn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BCJC79Av; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so252195a12.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 15:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733874361; x=1734479161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUFQtOuHVAdyoBXRcqgtOx+EIFFocH6sZ24cVAKwDzo=;
        b=BCJC79AvvMqQUFklhf1DqqAyi1XfzuqlFU7yIEg0Hc/c2PyewNbGIsybQrnZKgW+1F
         Xd6gC9AwGKsLUNf1V/DtQ28EBvarZMlMmm+JlL0gSr9a5XbNqculYj93/7lcgJD+MjiO
         VtOcTNA3o0cOHwvbzkxGEJBNPEUClQTPD+D9HnA4HRSFlqviRRK8YybJkHgVA6lEoxGK
         dUoj0QuoEwNJazHxLz3mF4E1GIH5GGLQha5hguhKNYFHuC6YksIK9x+0MW1Wa35YrJMG
         tvk8rt8I02/IH4qVHa2lvAc8cYweRTloBsmraiZOEFkCsgpdCysX9bFdsdjfEE45z5xr
         LXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733874361; x=1734479161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUFQtOuHVAdyoBXRcqgtOx+EIFFocH6sZ24cVAKwDzo=;
        b=oUrsj42z/YH6NPED8EotzcooWNz93i2J9mYeY7UZDhI/z2EiE/v1LsW99xP+og3zwo
         f8BmEcaLk+TfErqD/hB6sN7wtbT/enYi8fxmYNwiEkVss2DDxKSoltnIU1PHzc5mTevq
         Q3BU3vVXa9m+c+f/VLfhxjGCBMueBqmwubXVGW5j6Bqp+ycdRVdIjNsLlC/8pIy8UpEA
         7ELJ4TjxmOfvacFGpKkby6ZSXepxLkuATKcTYfszhLP5nZmiscPYc0ZZlmOrvfpWJu5l
         3blD365wCqFOa0kL8xcMr7yYksFln78nF1/ltCbnS2QcL8ZKcHTHiIbiW9sh6UmKtyh3
         ssow==
X-Forwarded-Encrypted: i=1; AJvYcCXHXldjwCZaV1//6oHgq1hJ6z+y3NoKHCyVnUMH7nOoS5h/aeaO+NCdxIzaPtLNEIcwftiViQdU6pdeCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbJtn/sqNOureYJvcN7tSn/sN178qZViAXBf5RKUM4wjT2Nej
	fD2hhyW4FAf3Rn+2kwFoSDeNwsh9kJf4r9jtcwW8NwV83vJ39vZ1bMsgtIiYP7E=
X-Gm-Gg: ASbGnculkB3CCalzS7fybH7VLmbkiVrfyRAIX2vDS+x2JtjaSMpCRaXVhaCJ6Hq3SrI
	ckPpQ4NgDUEONiOfQwgjr09qeau0UYYPIMseEtFT+v19AhnNVJN9lE90AA3OkypFupx1hBJ3S2Y
	q0LI2pEfCyL1zvPm+9ywnkBlRkMWQ0N8Px5uHwM3tYx4rJC2cbG4N0xpWrgTKzSy+BgiSVYmfJ0
	b6uDZ4AIxB+MoKbd4k5iMvfNEDE9LPyzbJ7W+fUINGwPhhg5+XVTNTTMK5ENOo5LYU=
X-Google-Smtp-Source: AGHT+IH8DOw8jFu20tYWeECEvg3iojml0rDggWVUOXEmQq6TtEKUwAtdydqgImho+auqElK84ZJvfQ==
X-Received: by 2002:a17:906:3111:b0:aa5:1d68:1f43 with SMTP id a640c23a62f3a-aa6b159e292mr58213266b.11.1733874361407;
        Tue, 10 Dec 2024 15:46:01 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62602cf3esm899768866b.97.2024.12.10.15.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 15:46:01 -0800 (PST)
Message-ID: <64bfc226-4840-4d0c-859c-b6609d169aea@linaro.org>
Date: Tue, 10 Dec 2024 23:45:59 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241210233534.614520-7-mailingradian@gmail.com>
 <20241210233534.614520-9-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241210233534.614520-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2024 23:35, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Hi Richard.

Thanks for sticking with the series.

Could you please implement this yaml as per the latest format here:

https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-2-quic_vikramsa@quicinc.com

- Ordering of the description of the nodes should follow
   the example and the example should be in-line with:
   Documentation/devicetree/bindings/dts-coding-style.rst

- Sort regs, clocks, interrupts alphanumerically

---
bod

