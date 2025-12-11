Return-Path: <linux-media+bounces-48624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C58C7CB58F3
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 11:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 693BB3032A92
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 10:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379C6306B09;
	Thu, 11 Dec 2025 10:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYm21SbQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9295826980F
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765450170; cv=none; b=eJWEAJb5zCXP4ppM33uUvPx5JYJU3+mglpw3TEoSPq37eAbHX+sNhCjdCNelAXsBNh/aP7B8otA/5vJqsZfws8T6kbdxK5OIoSdWhkML8WlSaExTFFumgS24z84WNTPpyJeZYQqu7U6YLCNQdJJop3XlhIOwieK8nRjtC2e4xgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765450170; c=relaxed/simple;
	bh=Jc6+Ys+XHen8v80U0lVjY12DVN2DFWCFxOekVIhcmJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qblJHTZfhXNYs+uzW1USZaqGv2aoDWnKTS9jvBJhGAt4hzvpDL3843ktJv2e+PAaoq8pCwfZ+iFrTqJ4P3wPKYTcyqM1/9SYgmWf3KySkjRfsV8kLDSV0Hd4rgWnvAT9KKr6OYBrJQQQ2x4HGdJft7Vv3s6EIF6lEKrU3q9zDfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sYm21SbQ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37f8cc9a9feso499531fa.0
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 02:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765450167; x=1766054967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3kd4yW1gc1Gruxageeys0GxddFeeTYgSHK0aHKOuEo=;
        b=sYm21SbQbAN5LV3ce1hSwNUoL8mqlhBYICP9v2goIi7tRgqGd9Hi79PO7cx0K/1wam
         +QmvNY1T5fsUyJciThnsLTVZFIRg994f5NKLjCtpYfXnlPguBvmBJmH3Xhcg9x4cc+dJ
         WOIsupzaKPzoi+QlJTdvzyNBLzHJqba7jmFFnD7QQQkgFl0sLK20aitBV/41XirzpQ4d
         Eugp7SRpFOFwo90DOSqL3WR9IvwrtXLU89AFv8rjw2lu6oxTHRs236ubE3HS4P9+GEzk
         L6Ipr2KyTi95jb3DimP7NlUY4b+oBWKaRIOVam11qFUzvwmYHwDt0UGgOKVhv+Qt8zDc
         iYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450167; x=1766054967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3kd4yW1gc1Gruxageeys0GxddFeeTYgSHK0aHKOuEo=;
        b=Dcv5W+M3Ehb5L1w9SjDPPyLNmkYJsrq+ssy41td1vMmotWYNbtSIbWrXbGYHoaMl3l
         OwEn0jcVqIR0+feP6yCTRr+UNRA4ZfNcgLswSVPHsrHQDvn4epmdV0oKM9GEoICyPoaX
         NZYrz+9s2GV3y/DJgfVIK7ioFbF++pGUVS89NMXDZuCtuS/kUKnYkfjXbiz1HxkxOlVY
         7AzhOgDsw+UCxsHbehLaLGKxMuirtWrb+Rww32AdPTFJHUphSIbdkhYMTvyapUPY/uCo
         T1zfPYMN21B1bLmJdL1aOhhoNBohm7KF6BcmnH6so+s2Bp4DI5oVp4AtUokYwlUfXgAC
         K7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP34u1pf84PniWSa96NzQ18d7/idtCW+sTgRPz6o3DClD03wnboITwW7hQe83gesiU32rnQh/s48XZyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGcW72RqMrl6eJp8tWhr15WNaKSS40R6nH+yGki3Um6+10tVQ
	P7VdYSDsCvzJn0cF4rFaq51nlxVl5gK9nG8XO4jWP7FMCk9KWR/lwfXWOO9SwH9FzOc=
X-Gm-Gg: AY/fxX4DFiMleNIKjE/LyuJ95KBVu8TaAMp6Ow6opPcKrUDkiZwg4WUAw9Y9eNlJ55j
	C5sLsXDKn4ThFj//HAsxlqX+wxb39xMqMdxUWmHnCD0ucJ594xp0CSsMe72FYlnYQcApiSSsPIq
	3apvj+HoPjZr9j6jrJ4YKoiVMIQ4Ah5OyHifjdjCoC/4NA1DEXzQzaWqReZxvfh3kawr1WbrWeG
	JzjtrVBJEp5AMRUwa4p30iwdRhvY8gISQqg/DRkzEDI/By3rjjKHi79D1/Ln+vaKbGjL5k3fNGG
	TAe5JOihYu3lRc+TF3Y/+3SeIzLt9dIKHxyGf29YmhCcv2OyD20MaywTJvmy1XM7j1FBu+wkQ3g
	C+9tbx6a59CpDFOOHyo4IDmt6l7XIS9Y3V/Huy29C01UkEbuIYpt1Olm6C+v8JY7Fr+XRoq4yKX
	BXIjpeXmwWTf/141q1xX1gNM0pOBhtYE4C2LH2hc8e9sIKPsCF9418HKW5ROtLoG4+oQ==
X-Google-Smtp-Source: AGHT+IFt6XeeZKHv7sJfFbXi7ZwTZ/XAVBJkSAg3r7xDq8QS7bdQubNXrv3Qvi50WCHnpPFPH5YD9g==
X-Received: by 2002:a05:6512:2399:b0:597:d7a1:aa9c with SMTP id 2adb3069b0e04-598ee52a41bmr1124042e87.3.1765450166708;
        Thu, 11 Dec 2025 02:49:26 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f44d6bsm764789e87.37.2025.12.11.02.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 02:49:26 -0800 (PST)
Message-ID: <809c23e7-954a-4d7e-92e1-0d2da820bdd9@linaro.org>
Date: Thu, 11 Dec 2025 12:49:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251211014846.16602-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/25 03:48, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

