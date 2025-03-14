Return-Path: <linux-media+bounces-28182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52BA60BE3
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F7B73B68C4
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6C51D6187;
	Fri, 14 Mar 2025 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UpEVmwjc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1738A1A5B82
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941455; cv=none; b=D3Zc3G3fjOLafnW8x/gsKFTPDZkbF/H24+RZkmVwpjMqKN0lqSWHTtrJKKFg5034UPaDeply0etmWtFb1Y+e2ilYoAvZJJYGLwdvzHhl5a09OXTZ8OoYBQzHuGZi8Ho0Zb6zbAh5lJqeaaLS7Xh4hQ9FZhTK34fBoHial9HaTrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941455; c=relaxed/simple;
	bh=dk+ejBCS3NH9te+aXnCnqbhIl0UgK8PkFWM4qXXJ5TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQAaJz2CZEG+F13/dsI0Wef6dTG4WtvtwX4hfbC84n9AeKEYUyXLFZi18SScrK0ourtcx6F+/k7eB14JBEYwBy+YX9HYeMtMDK3TU8s51IKf2OVqmYry7qITYXOPmUm6pXgD7MZ6z8YzsFKqUROc45v3TW+zo0VUi/wdOF8ZLrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UpEVmwjc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeec07b705so292694766b.2
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 01:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741941451; x=1742546251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdW92HTTZmGzjR6ChSxqLyGpU5fNUkYFaVmkq1y4xX4=;
        b=UpEVmwjchAI6nFe3+Vz4Cydv+26qouM/cxZsaP3CA171bf+Di/cVfMWDk4e4QbU6Ed
         umOIE/IBkq6glc2lBrDbEqBlwGEblFZqYTBNsEfphtDFIZFMMRH9UsesKeEgdY6fgNQN
         uCfxvoOIoOghh0T8gUtGR5gt98T+ej+y/AHKNxn3SVvFv/l+UjnzuC72BNyZM7PUPdVc
         lvtRzRHu/zplQ0Cpt1fCKAyV9emZOXBcAJ8xxgiDfHyojo8pqeLk0ewMDYT+qWj0AGmO
         1BKyqtIBLlruMzaqr3STVFgcVIVBblGSFJoEUPng8C8VWp6KM2YCqlc/EhlkPDtB0klx
         56og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941451; x=1742546251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdW92HTTZmGzjR6ChSxqLyGpU5fNUkYFaVmkq1y4xX4=;
        b=YLPLzhHm4/8zyN2l3RMK4TcZhA5nULBTHNYe4pFE5A9OaqKcPNOJ8ou1JDWqi5tbDv
         1aF15vtpEmF3grpz3rmgZQPxh4FGTPPxbKcCgxqLI1EdqxivBAuLP/Tflq//tbV6bV1V
         tnsJGisdogh5zR2S/wuLv+DzaZ0ZdYsANj3tn/ISVkfAMeSPQHEOtYlRkq4y6tG/xrty
         Rgf/EqzhxgJkxFiVrwWsfDJKpG2RcE5nt2SRgBMzMMhBZw3pprpUXA237gM1N4zkDoI/
         HZW9DGqEWnUgwYPOiDKVuC8tqaASwF/SgeDvZiK+Ilo4fipGfnSOWiRSVdWWA4cezHi2
         6lJA==
X-Forwarded-Encrypted: i=1; AJvYcCVd4QdKqhU0vq+EpVg6cxWuZGUoWwnymiC0zsp2v9aLk/Qr+whTsHUoZnxHa8l7QpNr9qKaTDTAPUXE6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPHSZ8qgmWcqNuL+OjQnniJBbIpV+fns4ZXO2FkJmlr/DYYmt
	kQs6OoHQYTc36NHrOFkLQ7t4gz5XKVyKoNcV2d5gQ5z8zPhbCcFp9Gfhk9WNjck=
X-Gm-Gg: ASbGncu4zRvx+hQ4Uu1ueWQAvWGX0XZxK5T3HpvWKnxJIbr+H22ElSz97q8MogCsMoB
	AJ8wKiGFuhk8lJOCrYpxtUdEyG0q5PToKiuRNzAHCSoel5iY/1sVqPJUOf72CK1ZWhm4FckYP7f
	lYDbo8Xl3xoSvtJ/xjvc2uxyhhj0GNFEA7R9IGmgehd6oJh7vJ+PhIa9JIdANY7H1zSO3fFx7Ul
	HC/nwEM1F/Rd5j5JcfkoEep/TMzQiWPzNG7Xoc5P8fX6xCU4/8UBsgzuPtzuw5UxQKPJnjWcAlF
	xBesdmreb5btAqamhCsqUiO2dAeuEomi0QdNSFgP42dgsxxWsz0xEd5Djd7wQ4eQWfTge/YBSlV
	wu9RtumpoOe8FY4mRD6Pkm1LN39HlOGOIVZK9R2q8kM7dOV/RHFZkbwkRvL3MdOZQtQI9YyiSyC
	FcjRW1iG4+7uoU6RZ6dpE4rNQhczvbKo4=
X-Google-Smtp-Source: AGHT+IFUOlHrTuzko/qUKZDoHX5T+vqpZFWSBwlhEPozEDwkhttO5RnwU44O1wIX8uDl5bdWFAV2Vg==
X-Received: by 2002:a17:907:6ea9:b0:ac2:64eb:d4e8 with SMTP id a640c23a62f3a-ac32fa44234mr197432866b.0.1741941451312;
        Fri, 14 Mar 2025 01:37:31 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfbb3sm194289566b.101.2025.03.14.01.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 01:37:30 -0700 (PDT)
Message-ID: <9089c8e7-d38e-4c36-9b97-0f4a3039a29b@linaro.org>
Date: Fri, 14 Mar 2025 08:37:28 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
 <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-1-846c9a6493a8@linaro.org>
 <20250314-nimble-exuberant-ermine-8ceb43@krzk-bin>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250314-nimble-exuberant-ermine-8ceb43@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2025 07:51, Krzysztof Kozlowski wrote:
> On Thu, Mar 13, 2025 at 09:43:13PM +0000, Bryan O'Donoghue wrote:
>> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> The switch to multiple power domains implies that the required-opps
>> property shall be updated accordingly, a record in one property
>> corresponds to a record in another one.
>>
>> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> I do not see improvements:
> 
> https://lore.kernel.org/all/20250305-little-frigatebird-of-calibration-244f79@krzk-bin/
> 
> I expect both comments to be addressed in the file.
> 
> Best regards,
> Krzysztof
> 

Pardon me,

I missed you had left additional comments.

I will fix this up.

---
bod

