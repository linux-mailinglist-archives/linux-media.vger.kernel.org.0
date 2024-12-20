Return-Path: <linux-media+bounces-23942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD99F9529
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CA218959AA
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3AA218EA5;
	Fri, 20 Dec 2024 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tk+BBfIj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB307219A82
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734707707; cv=none; b=V4RtSz+y4abpn6/EFMnjiHwBrFPaUr0OPLGGh6+apuJYZQx1lKuRphgW4UYrcPP8ABebdiQ6Oqnt/udI+dH+16aJSzoIG3EyYR8gpOCpT1hIxJlWlgOCDU53iWLrTg87V25Nwhfw1x7LnDeECQ2qJakk5JMw8h8bDL3ZI2XWpYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734707707; c=relaxed/simple;
	bh=Z/WHDFbwWhIHPpTnKleEFiELhQb0EVVb7XmxvkBjKFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lz9uddSl7Do8NKWNkihNiFyvfihobg9KmtdoBEdSkwBFBYC+X6y2ew5gY3RQSTgqsj4KJ5ID2QnQ8Y+EpWS2im1/hxb1Gz9sp3Z8pR8IqZMgKbkjLXYrY+AboFOW/L7cOnTf+9PXvZeJ8K0JeUTzUS35FrvaqwGOxbicr7wi64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tk+BBfIj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-432d86a3085so14099425e9.2
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 07:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734707704; x=1735312504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojhF/plDtmxHi3tW/ptgJiJj4UC221BmbfMuDVlg7kM=;
        b=Tk+BBfIjGiRj5ArpBn8CBOmT4s0fbhFur82ko4pDalSwfHKFOWiwW0Pu7KzehB1Ig1
         be5Z2p7j/7rkHytwBBdljEVcPRp/IUSClF8bkZmNSHUcktjB4PSy5cgvJ0vndn1sItIw
         P2t11ki6aFt/EMFOfAq3FH4RVJxIAkG+hfIe0Kbyf7A/ltCUs3LIde8oM2EQhyUoyR9a
         +ZSJUedxg1QXHKH7enspYHjcg/3hZpf2Pbo3S7lrdRuQ5ozX3/mbOrfREqmWRZD6N8/h
         60BiRz/SEKPnoJPVUKFPtjRWCAD1WXO2MPc/SNUIJqx+lxpXHQiSFgEgEagSCZ4ZArqN
         /xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734707704; x=1735312504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojhF/plDtmxHi3tW/ptgJiJj4UC221BmbfMuDVlg7kM=;
        b=YmwgXLPKMqP2DJW50T8uOIeQ9KKYC2wHW/p7+nTxmA1kkaWNIg0wDCnWjk6M1bVnRQ
         uhyBy+/+LghLWN4uqV6/bNKsd22iSvh4IetjsQy28Fc+sWCEJ9JOr9n0tIMQgBG57EiE
         6ET2ES9u9ozPm4rUWynKWUVkpH6FIAWAvQ3z2QvVzRTnKejF3NjwH+2esRCUnbc3Onym
         W/oS/OV0yfIdmg76QK7CmckGFLULwAfnXZcDzPN0gGsrIlBI9/5XDACMocr4RUn66rL2
         C2tybfiFa9shr77EnnpA6fW4y2d4cOTbhT/6RMO4CDczjrrIbmZXv6OAmG0uxFMekJl/
         xeiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhyeRaGJAB8dMOw24iNE05Ld2jZkkkCLV6tlUsk99mwP/5Ym7UkI86i4XLKAPAzPvzOPw01Qd7AUJHoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3pEfOAeA74YLI2y9LHZqzC9WzCli7y2YxKG0f2vqb39nHOJb1
	tZ/YKsFp9b04wxjj5NhVC7RivK9plbn2JHN92Xtkn2jBgPsV/Y9GBKHhr8yOD6WVOYICT8RCQDi
	U
X-Gm-Gg: ASbGnctt6b9rryLUGSKwx7pTlfFVaVyCB6NUx8TWu5oZFdbrFKjaYq37mn7XEVaIQ2Z
	ppRXV3XE4dOjLq6m6wxCG7lP4edUVATzKz7DOqc1TiySOTobXlMDbJ/dECBb/rhAp/kMQ8VRVjj
	8OV/A61in20d9N8WpvSOo1f1209kzxyLBpfI7CFgMh/snuHxZ6aQ4Ojrsap8/IFYO7vjHAECxTP
	lyuaniP3GToE/j297EyS4yjVszzoUwaMdQup3abU0uXLjZ6+eyIb/5W2kRkMK5kIEfdpQ==
X-Google-Smtp-Source: AGHT+IHn4mqFBscGdeOisRLn6JZ1v3CLUupQ/+ouJJeZbtoB2nOW+xH+gykAgoeP6j7NcJaK9ELXFQ==
X-Received: by 2002:a5d:6c66:0:b0:385:f7ef:a57f with SMTP id ffacd0b85a97d-38a22200168mr3148790f8f.27.1734707703906;
        Fri, 20 Dec 2024 07:15:03 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847513sm4292397f8f.49.2024.12.20.07.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 07:15:03 -0800 (PST)
Message-ID: <b17e044e-b219-4245-9c03-88cfdce2f65f@linaro.org>
Date: Fri, 20 Dec 2024 15:15:01 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] media: ov08x40: Various improvements
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241220144130.66765-1-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241220144130.66765-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2024 14:41, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my ov08x40 series with various ov08x40 improvements
> aimed at getting the ov08x40 driver to work on x86_64/ACPI platforms.
> 
> Changes in v2:
> - Fix the brownpaper bag bug swapping the suspend/resume arguments
>    to the DEFINE_RUNTIME_DEV_PM_OPS() macro. Many thanks to Bryan for
>    catching this
> - Add Bryan's Tested-by to patches 1-8
> - Add 2 logging improvement patches which I posted as follow up
>    patches to v1, so these now can run through CI too
> 
> Here is v1 of the series:
> https://lore.kernel.org/linux-media/20241219134940.15472-1-hdegoede@redhat.com/
> 
> Regards,
> 
> Hans

How would you feel about picking up a Fixes: appended to the front of 
this series ?

I noticed the reset pin logic and timings were out of spec when I was 
testing out v1.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/arm-laptop/wip/x1e80100-6.13-rc2+camss?ref_type=heads

If this commit goes first, then it can go to -stable:

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/f10539a3cbe5c072829b082683f0d1393a7e50dc

---
bod

