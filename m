Return-Path: <linux-media+bounces-13986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D529139D4
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 13:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BB65B226D7
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 11:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0D212EBCE;
	Sun, 23 Jun 2024 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ridj1i4s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46B12E1FE
	for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 11:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719141011; cv=none; b=sOnnfBQgi1rNGcyYNrRaWknJOT00wZXJd3FDCeVBka4bPJuckg8e0XCqkB8BdKZX0GeWQ/vaMA4V4kwj2nKk6DNHhciw3WXD5SzdgkPGUwS8LnzFEMoObSJvSiow/bPPtcPbYRCb1peuoRYDswD/woHlrPTf7eUPP/KTWVhWeJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719141011; c=relaxed/simple;
	bh=unFZHIttLBI9tNct9PDlWU0KN4H9FFc22DiGn2t+m+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwQwIfHV1lpuUk0n+B9jjT5JPsewNTyd9gLPJJDZ8AwYp80o2mpCwQMIWgZ/0u/AP+YpMV/1/jBS3fad2z3pAfjyzc/8BPjudkJIhA1qyikIvSnv5ilTCWz5xdFQshuLSabSQT0ntYIWz0Uvx2CUyXWgpZQtUL/olZtk4ejD+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ridj1i4s; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4217136a74dso27691375e9.2
        for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 04:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719141008; x=1719745808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DTecXJvjNODhxPYAbYa8VnbugUzgN9fw88ySISIgZM=;
        b=Ridj1i4sT60a3q22QLRu7ou8eeZyhHsQ3RoFasgkv4DQ+A53OrJBA8ELhyUdXFvJdS
         9phBjLNEQOYQOQMwK6Fo4xYziDScFcMGU5p8GDjymy84QoPQVBesPLeSgB0HxYdlmL+Q
         6xJpJFjxKTwx7ApRXVdE8FYo49OkP1b3t1fJ6U/c6c/ZXnHDfw8uz+f2fMSp+nOzaaDZ
         6eGauYzEQfyaIzk6YWQGzeojBspjvxsn1JxnkWjAvGoNvcVJALce90DBcQoKl60vV5dY
         yyDHJELfWjZWVcjtTXuUHNB3bfY1elqFmIQRPAKri4K9GpZ3agka7XL9Sqc/oMNjUfCo
         XnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719141008; x=1719745808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DTecXJvjNODhxPYAbYa8VnbugUzgN9fw88ySISIgZM=;
        b=dEAgZKyrqNAn/32KsIgQ8ik4atkTQRlJud7ehP/aPCCnprNpEvY09ZjJIjLKTJEzks
         hQT8XHrtu7My0GE4AZHVRKah/X0Us4b1jaYoeX7pmmnb/CplBw/qEeQ3dV04TfPWanHS
         bMBShYMOSPCcipuEwjN71TkugUWljU3EZjD3xswQT8fujd5K3KJMOhsep4YzrD7v3V81
         LgPu+S+fiGY8QMpRRBCmuxmIDQKPjIQ0LzBQvsrbNwp+ASfs2+c6KT9tcwGQZ17cmGAc
         vOIspEEaXoFrQBdRknJg+etjosni21/AgKf8gVqMbJ3OymUkP6spZVnES/YCKAM+qfnY
         DnSw==
X-Forwarded-Encrypted: i=1; AJvYcCVWgOq7dN7Gi/3PubwzvXBjylGnkUmMG5Q3C8xX17BdaUt0aVQtfkVD605+GBoy5z4vdgOB2Hqd7A8aI1lsoRBZKlqV+qadJLmRDyY=
X-Gm-Message-State: AOJu0Yxk5jf0h0g2D+bknqb/uRKRqwp8cMjksD7sKiuFRB8o/49d11Uh
	8gx0IIIkOy9D5/Xhw/Rc9OofwDWBXv2NJkUIrIQAWHtoVdgEVZzfqIS/LARbq5M=
X-Google-Smtp-Source: AGHT+IFx4moyEsKR5tncGEiz2xcse9WpaDz6d79q8f/CZB6iGUj6DJrTDMQGbeONg8ohV70awS/WgQ==
X-Received: by 2002:a05:600c:354f:b0:421:f346:6af6 with SMTP id 5b1f17b1804b1-4248cc5864dmr12124305e9.26.1719141008026;
        Sun, 23 Jun 2024 04:10:08 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54e4sm138269215e9.23.2024.06.23.04.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 04:10:07 -0700 (PDT)
Message-ID: <12000768-e9bf-46de-9159-562d92470eb3@linaro.org>
Date: Sun, 23 Jun 2024 12:10:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7180-camss binding
To: george chan <gchan9527@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com>
 <fcdb072d-6099-4423-b4b5-21e9052b82cc@linaro.org>
 <CADgMGSvbK+8_QvtXSYrxdGjJFFzgtLPFtetMecBME_pCdoWzsA@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CADgMGSvbK+8_QvtXSYrxdGjJFFzgtLPFtetMecBME_pCdoWzsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/06/2024 16:31, george chan wrote:
> On Fri, Jun 21, 2024 at 7:24 PM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 21/06/2024 10:40, George Chan via B4 Relay wrote:
>>> +  power-domains:
>>> +    items:
>>> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
>>> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>>> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
>>
>> Please name these power-domains and require them in your yaml,
>> remembering to add them into the DTS.
> 
> I can borrow the idea from sdm845-venus-v2
> 
> @@ -191,6 +190,7 @@ required:
>     - interrupts
>     - iommus
>     - power-domains
> +  - power-domain-names
>     - reg
> ...
> +        power-domain-names = "ife0",
> +                             "ife1",
> +                             "top";

Something like this

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/7626cd2a2a509832c214e538827b91c5dbf1bf09

---
bod



