Return-Path: <linux-media+bounces-37572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3B1B03086
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 11:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8850C17F6FD
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 09:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FDB26B765;
	Sun, 13 Jul 2025 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoIAcGlF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CF44A00
	for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752400129; cv=none; b=I/WrwwF7zg4Fhn9RcN21E3q7ZkJ5feSnF2YYkXlCzPekrF2BDm1x3gJTy7QVBziPnN/ogiZ+hDtffRNiKNS034OpJGVpR2UkHUIYYRuOjZZkFOuk75yBA1MCDrzDHIN5xaGOv00uQvQw41huHU5YYIVQi+j5ejTJ9IIR9rERynw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752400129; c=relaxed/simple;
	bh=vVRR7H+Oh1jOVVrd3OXMxD7IsYuOKBL4mwsfy0UVeI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahxl0uZmspWkeANQGq7R103onyqNB2ClK0ILfnVy0CzO3V7iQ9fCwkNavZOGRqIrD+lQNb53XRznha/a+ZI98Oi813cm2CWMt07egoTIbang3lpN6iKWHXBUD9bCZQ9j0/gpj5bx8jNFaAURiwcekVB0CkSPyNScQSKjFEcROOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoIAcGlF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45617887276so1368715e9.2
        for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752400126; x=1753004926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=87Y6uvJuNXy1ilBMxkL0pceOrA+vw3WvrJEYq2nI520=;
        b=MoIAcGlFM7FSdDXz2MBMNuOsZ987/BNbYTs/WK8T0ZNaLq76kR9f73XaaaarFPranq
         j5eEDcl4tNPUfgOLl3ddkbzEXyzawkQTrZPl6sxMdrnWXAUKIt2pzKk2FNSrR6JfjYHM
         9CHGodVbbRaMLz/TmGc3m1hgdghlxDjpgp5c4AsCYuXfpRUtd/ofUa5OqVJ0sj2XMA/v
         o/0buI+50YShvQ/tlhUu7TtPHD4/6g3NHvK9jkwJ4C4w/LNjLaGQNUNLTIgupKK9LMQA
         TkQXiHrY1AUPQIXeOW5891qA3e+xVV6a/elxPru1dTfrR9ehYH5CnYgE7VORTDBQREM+
         7N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752400126; x=1753004926;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87Y6uvJuNXy1ilBMxkL0pceOrA+vw3WvrJEYq2nI520=;
        b=iuIynBZlPlFPZ4euvYl87ItPrmnGCOnI5/XCUr/7/Zt6mkZKxSxEAP1weN72P0D474
         AVq5IEzFyADnZIn4EioPXM54RhmKFe2/XNWrEWXPT1vq0BsFxckO2eLF/snRlAa2PVAY
         RIlqQOKcdAjgf4vYk2wu3Y8ZPjGq48Vie8YGemZV+8s7ec0ryE+Ys5PnRDD8xRNd9wAg
         zFV+DJz/88WWqmXRY3JiSj15BnGxoHVRCrb7V311RrrgPOZAqZC4HOpWvzWhiXlaTgNe
         jdEgxiIaBnqu0nhv/KQcv7WJRXvqahGTlP+8Lo1kozfN5VBziO/pkIq3RZ72WWn79LPp
         x71g==
X-Forwarded-Encrypted: i=1; AJvYcCWU9GUShXWvI3wvNRSMKdm/Bl8ZrG5m0jl68z+qSZJtkk+y2SfGbuDZXG5aFAtdMyBjaGWyoKHWIHmTZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziFXDBpz5hRsJorvdhLXT1NhkzX4Cwi3tqoXrFlXba2ZWDQnds
	IMSbNX1J66MUSRCSmVMT6FvMmUpLsEQdTiM5JXruAx+NvP0NwUs0MZKKdoNmn5u2AUE=
X-Gm-Gg: ASbGnctWWc+eojURKET4q4MU8ggtBs1ge9FKjhQuk4FnOKE1C0v2kYT/pLmwzP+c19u
	RjKbuUhbbvuSvB6mJTDL7m5ID5JCzRrh5wqAuTSNRdL2/evgngH1GzLLrN5UN+IQJWucLd+F35i
	oUxUKZo805vRlPKqU1pJzW3eWuO3yx2djo2Nxgw63sjiygXa8u8duIn1rwGypV/ltqyTMcpMFQ+
	9RCeBLrWoq1pQEdYK0gM6T+8XaLTePtVP69f9yQwUuj7sJ6G/cBgdcAK/l+P2gSJ/aWzpS5kzcy
	DplcCV/KtoxXmlhXbUbfIiEQ3yblC9y7TLZG7lVX1TJbKJMnSZIjBbntZYChtI0X97SPOmMZZpZ
	C7XZBNkoPdkoxxCpZcU88Dyh+TEmM5bBZxYTYExGeYh6AzQ7pHyl0infT+4TWCis=
X-Google-Smtp-Source: AGHT+IFYhc3CtD4A4MOtCvaPnngWumd1dv65EYgG6Om/yx8+SjrSSPGMr9gXNjJ44lHxB3thNgEtIw==
X-Received: by 2002:a05:600c:1d09:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-454ec15a834mr85731655e9.15.1752400126413;
        Sun, 13 Jul 2025 02:48:46 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e2cfsm9234034f8f.75.2025.07.13.02.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 02:48:45 -0700 (PDT)
Message-ID: <63e538bf-16ac-4f57-9578-2ae855f5727f@linaro.org>
Date: Sun, 13 Jul 2025 10:48:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/15] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
 <3376b0fb-f3c6-464a-9c35-30a3f589b856@linaro.org>
 <eac19ad2-78dc-44e9-bc02-517272ba737d@linaro.org>
 <3506d911-da9f-4639-9c83-aee0a637e9b4@linaro.org>
 <352421e6-f151-435b-8dce-6c02a6d0e747@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <352421e6-f151-435b-8dce-6c02a6d0e747@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/07/2025 10:39, Krzysztof Kozlowski wrote:
> Lack of in-kernel DTS is a good argument in your case, but you must
> mention ALL OTHER USERS:
> 1. All drivers in Linux
> 2. All other upstream projects, BSD, U-boot, everywhere upstream
> 3. ... all possible other users of the ABI, so out of tree DTS and out
> of tree kernel folks. This one is close to impossible to prove...
> Luckily we assume this point does not apply here at all. No one out of
> upstream trees uses these new bindings.

OK, if I get your meaning here.

More comprehensive commit logs and cover letter - including doing to the 
work to look into BSD and u-boot to make sure the change doesn't break 
things for them, which I'm nearly 100% sure is the case, is what you 
need here ?

I'm fairly sure the only real dependencies here are people following my 
development branch for the x1e laptops, who want to drop those patches 
and receive upstream stuff from -next/-stable.

---
bod

