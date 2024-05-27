Return-Path: <linux-media+bounces-12015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0178D0AF7
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0C161C21570
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 19:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F761607A2;
	Mon, 27 May 2024 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMnGX34z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA4115ECFF
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716836684; cv=none; b=E9k3mD/liyP5InMzBzMQJQivnmuGQnbt8S+RmyLoEK+1GFQ8MrFuKMTmswRmz1t03AvsL0PYqrete3JcM8noQ+770cc8xpDzy5GJxYpm6W20JPD4JrCU4QzF28YzFA9fxEGI8kF/1UaoTSzN7aS2fvwXIBck5EHYwQUaeC5QqXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716836684; c=relaxed/simple;
	bh=40YGK2iI/uurnxQuVz+rLsE2LOFYR+LnFD9GWtz/FZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIX/jElZvgRcWFbzeOh9RnEgohmnqpEx+lRE8nxQrdnaZM6qJAKc83gTg/o/8B43LbAbotgmkbc9yBEKwr7JnOxXtZVvYw2V1ILLSsE6ipwg/xvxtYzv8hDoeUfk+JrYccEzGFBrWXieXGss9aioeEOExukjCcAAPkVKV6LFSvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMnGX34z; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-529b4011070so74876e87.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716836680; x=1717441480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LInQISId5MrDy4ph5vfn9w1VaeWSkpi0NqBmEc8DMR8=;
        b=XMnGX34zv9VjcxsZYYNb40df3CndxP99c+ApuWgBtebBXlTzixn0G5MhCxVzJup+Yr
         MQOdGKw49+/0X07YF3om/OzBqyokwdWsQ8ZAT4tyvms8sdaMK0c4jvulmmnZzwZOAqwH
         Ieb37mY9KioOIVv9yjUPDJKgcS+Xvx+j7Au0AURo6wdQPXGX+yBavPNmGxJZP43qn2ru
         LcWlaBpBjhPNLbDHNJbivNDhY6GeXg1oNFjX9kRLo+VKB2o+ajQQX97vDMKxhHkZQn+e
         +y31i2JNF7SzqDDFvEwpEcebytIpJK8AXfFCXrv49Z1twX2HiYaV0weiwkjDG6nxSx7J
         b7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716836680; x=1717441480;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LInQISId5MrDy4ph5vfn9w1VaeWSkpi0NqBmEc8DMR8=;
        b=YDqwCTdwNumcLsU4brRdwGoZut3Xpc/oMbi6gX4b5nB2Jdw5xBrYiN6qPUXFYFWubo
         Kq3xXfv8aNDvIK+YUUGQnkCd1f0le1nCEqPX9jC+6u1vK803QMF5vSQLhCvmotXJZhxf
         NlSLlKbmaUMvCevq+YhO2BLmHLI/KjUGUBnl2/FZnFdqT8gJNwBO2IaMpHYqruUl5MEE
         OALVN7jycqwuQLtFReqRRVSiyEBIcqp81IjhP7kdfD5eapU5zJA1BSaMlTAoh2I2Bs0+
         4fxI5pg6jiN6XJp2YYg6pgauLjhnH0KPh/rBhxKcar+PeTk8LAsrLpGD7KsTebvJ6Cji
         TfWw==
X-Gm-Message-State: AOJu0YzGCqHbsOkBCKRKQqVjFRk28hks5iRLhN24UHaAw00ti4TwplCa
	t++kvzJevFz58w3CP6GW7NvEwt8lAa2xpbahRPhUgunVIWGM2qixfNA757rqth8=
X-Google-Smtp-Source: AGHT+IF+nSew+iU1GJ6uF8ZN9AS9QJbJvGdfa3QiNWzHflY18U7Fuh+Ytk/YEnBHeJTGhLRw2pCvcg==
X-Received: by 2002:ac2:5a09:0:b0:523:88e9:9cd2 with SMTP id 2adb3069b0e04-529667cf983mr5189826e87.67.1716836680441;
        Mon, 27 May 2024 12:04:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579ce507649sm2424076a12.14.2024.05.27.12.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 12:04:39 -0700 (PDT)
Message-ID: <8afe1888-5886-45fc-b576-98db3d392d37@linaro.org>
Date: Mon, 27 May 2024 21:04:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
To: Sylvain Petinot <sylvain.petinot@foss.st.com>,
 benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-2-sylvain.petinot@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240521162950.6987-2-sylvain.petinot@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2024 18:29, Sylvain Petinot wrote:
> Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
> sensors. Update MAINTAINERS file.
> 
> Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>


> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef6be9d95143..554e6861425b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20885,6 +20885,15 @@ S:	Maintained
>  F:	Documentation/hwmon/stpddc60.rst
>  F:	drivers/hwmon/pmbus/stpddc60.c
>  
> +ST VD56G3 DRIVER
> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git

This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof


