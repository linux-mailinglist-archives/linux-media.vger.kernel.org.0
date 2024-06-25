Return-Path: <linux-media+bounces-14115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0455E916E97
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 18:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AF651F229AD
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 16:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40907176256;
	Tue, 25 Jun 2024 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXDzwZtS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CAE16C696
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334638; cv=none; b=irlfXgKhBk2o8jbluncEITUNyOkOXNGegg1B8IfqsLymun4R0l9wmFgASiNfplUf4YyxMm6M6mQl71HTS7mogjnMn1S5Ah2U0rO77y9Q6OTEUKO4wUDbLOYRtbagZSIIRRHQERjhtG3laYcEHaWjOT8143JoRyjhY8l9eG0/8Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334638; c=relaxed/simple;
	bh=ViXV1kPswix0J35HLiKFDe8jBpLL6y3ypB12PwwOk8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ysy+39kMDvg5G9/z2Od4vftrHsh0OsAKfKUf2wHorlGOUv4UtKyQFRWSp8FQpIemKSYQyW3kJe4BNCq63WWyw+fO9JFzzJzmFsHiOVtqUpHeKueSULAnWmjYWY/62LoaugM3G3N1Yd5tnFl3SzevaedXdVGvCle2tdQ6NggsS3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXDzwZtS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7252bfe773so312099466b.1
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334635; x=1719939435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xth4dCILpG8dE7FnnQ4D4p9NybR2xmH7T6YVVVI9ib4=;
        b=gXDzwZtSG/ssbXuSbeGWzLWDz63XCYjjNif0PPyO8Tt36dkN2MKeJSvAU4Tih+ltl/
         eUbjNpBFazR5/7no/uWINfAltrnbzbcZDfdP+wddmJmJwXI+mjtpDqJ873coTHOVjvPX
         H8QX6oyJyC7S0jmSQruEK8Ox+KznF6sCnljGcmFw/TKy4WiZH4bPa1U97NQEs4qEXeI2
         v3JBvSITZBlt7PWOcdADOdKwdLhcfuC6OOAkguzy2QPuRbGJ3l9K/cuf1aA2ASuM0ax+
         HyevrcCG6PuD+9BfbFYdOyejC4R7uz2/F8jB2qfuvriYhNGv0rmo8x3KJaK2v4W1L4j3
         VRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334635; x=1719939435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xth4dCILpG8dE7FnnQ4D4p9NybR2xmH7T6YVVVI9ib4=;
        b=esINbI8uoHThh5leZUcONYjyHcP1qJBKh60YVZ1osmFtV31XJQzhWDSP9tZ6Y/z2Uv
         hjK9/RJ/NbET1pfQPu3X6lY4sa33DMaVn2Fbf8ig6Jp1idhfGzV/oJd7eYx2w7m6GBbp
         yu/VEm4M9ib/eXVr2KjYwXQA+HHhv1oaAUdGZRUeubGtSX6J/9U9eqiPkTUAxh4sTiz/
         18+ARuIPzlsSqPULIvLmzDDAWSV3DnIjFR9LT4OjfIkuOmhsi3EWAFB6GF3Z3Z4JRmwX
         Fp5wdvYaYlvY0n/PGL754NASEdV7L5vmsaDvJM6LBp2CI1Vr+qhpgPux5iVldrTipBc9
         YXmw==
X-Forwarded-Encrypted: i=1; AJvYcCXRs5s0W9svtZjmK2sxt8+9YkT2gBiIItVkJWK3VqqfmpNYVe6K7JJR9a0LKK88HQleB/r43O1g4As6sqYL+4QG/j8TFXHcmwimHmA=
X-Gm-Message-State: AOJu0YwhCBPU3sq/wqf9mhPdX34wAHSYfsFBRhstu0O5ruXvoZ82oD9b
	h/j1RYKQkAKtbevLFCdiDue0YJllHVKdqhBq8X+UJvD00u6egB0zIORGgquFN6A=
X-Google-Smtp-Source: AGHT+IH9nN9J/VVPyTaK93YPTsCr4iprjddEnQX2J9iS6Etxp73p+h0eYh/uLJv0ibb5oGnozoqqIw==
X-Received: by 2002:a17:907:118c:b0:a6f:e50c:334e with SMTP id a640c23a62f3a-a7245ccdd60mr401113466b.23.1719334635183;
        Tue, 25 Jun 2024 09:57:15 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7247895dddsm312129366b.108.2024.06.25.09.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 09:57:14 -0700 (PDT)
Message-ID: <a06505c7-fd8e-4135-94d3-d05d9b4dc90d@linaro.org>
Date: Tue, 25 Jun 2024 18:57:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 0/5] Add sc7180 camss subsys support
To: george chan <gchan9527@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <4d2f4a52-826e-44be-b242-55b50708692d@linaro.org>
 <CADgMGSt2sRecrrYrG3t4RtgGn8QJzr1N+iRSWFKQVPgA6Pk8tw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CADgMGSt2sRecrrYrG3t4RtgGn8QJzr1N+iRSWFKQVPgA6Pk8tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2024 5:03 PM, george chan wrote:
> On Mon, Jun 24, 2024 at 9:50 PM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 24/06/2024 13:13, George Chan via B4 Relay wrote:
>>> - Add RFT tag to all patches, since no tested-by at all.
>>
>> Have you not tested this updated series ?
>>
>> ---
>> bod
> 
> Do you wanna add my tested-by too? It just feels weird to add my
> tested-by that way.

"RFT" means "I didn't actually test this" or "please provide more testing",
not "there have not been tested-by's from others"

Konrad

