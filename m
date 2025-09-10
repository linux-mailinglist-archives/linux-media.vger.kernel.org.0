Return-Path: <linux-media+bounces-42213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8BB51786
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8149A4E352B
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DC11A9FB5;
	Wed, 10 Sep 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgC4HxJd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A978E155757
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509265; cv=none; b=Ko5TimUPAlYPftrZN9PPu37ttWQ/3o4RV7LkIirefKOtBb42FbSH8vak8NXWe8T/KBIveYhtc0Bunm3ioZ+M+qVrxzGJGHg4nvft02cRqabzOmDwmta6t/Evk/bINQEJFVbWfcSWQwZmBhfoSQ6Kz5qUQetV8EIpD730R6pdTGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509265; c=relaxed/simple;
	bh=2T/8Ztsxi4AWL1kpHNyrAMiLhaqvXC5D9zLHqmODIVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzBC8pFUNvuTFjbAyLMbCL6fR9Q8VHmNcubRr4xlaETnmPpt3O5tS4QQ+bkj0X11IXXxLObLyeNmu+1WGeczMcj3ypjLG6uQjcz181dEgIim1zaZHFePz7ObVh0T9Nx2IasoAoNknvudJgQduS2y752yFhsfdkWM3Zi9+2SNlj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgC4HxJd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgK3F024576
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 13:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJorFgWZxPg65RyVPLB0lRHsqzbMwIYmxp3OdkMcOE4=; b=LgC4HxJdACiZFbyG
	MBQAE+rnW0NKD3ZlQlnjLhAtpjtWzKyCQKgB16OaR3RarZ+ncbEHTVFvnRLLVKJJ
	R8AbzTAt/vAdmrElde1j/5a//MibhbGMe4jArQtKJhuAUAJ7M+IkQjqTdPGIfyCP
	Gi80tlSOMTtiKgUhmtcu7SyU19FMZQA8Xa9rMkhiX6l0kTkDXU1fv+iWI5O5IPVP
	99L1KLgmulpc6UszGIetpXr2N7UA7bwC5UIyf8Ibdaq1ULK54GB6YGKiyppeGQOr
	MOxCDBaxkf6vUBtQObYlZVhDPWQIffz6RDZJ8KJaDvKiSRwysIqiYIjhHaKkTcSW
	lnWaDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8kwyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 13:01:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-74910ab069bso4616516d6.1
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 06:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509262; x=1758114062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJorFgWZxPg65RyVPLB0lRHsqzbMwIYmxp3OdkMcOE4=;
        b=Fvw5e/4zdqYGPG38vVwlkcnmMomPz7SVEpOs/pBtllrGrXNxoMkWYsBaisqDUG7AqI
         EYqZRL496Xho/FJ9d/awxl2bEyXVy31RMpWgWd3Yv765sKAzsqHqB+V2TEawpP6XT5yD
         yzoJztLp9gRJwNULOUo+KtFgVDr+ywkHuOh1M4Rm0zXYIb6H/Xy/i7iNiBUVLVXLj4cK
         x7p5HgvXxOllFwZY5pdHQlZLk4gkQ7ny3gP0P+BgiwD0lK9Ph4JoKe2xsebUo1p9ZxgJ
         CRjahABOunFIEYZyMHjaI6UNE4ZiOmuHS6GdQuHKfMhTritZJI10dkK+bVmjHZRwh/PR
         XF3g==
X-Forwarded-Encrypted: i=1; AJvYcCX5IRvkvpW4fqwRusRyzsKseaivZB6y+uABhmQkFtFvM2Y+5dYHB+JZ/4nh/VzXUnPdCDwEoA08/9PWtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEdTwHnDx04rK6RMdWxzMT/pM2+m99llbT2OB9QIqyvrG/33Ym
	TUsv1JSoxsZJWz0zYGhsujiJO7nmaUklu8mim3if955Xk4BJAs74bOfUhQ9f4Cask8v2+2r37jY
	FdU1+bk2BQXO9UOoUmduTaK19qHt5wqcnLSMh9dA4caDcgKJ8iKslv2QP7cpIumpiFA==
X-Gm-Gg: ASbGncvI1Ob1f1E3Q6cKSahCaR6pfhcRDL9M6wS+leeuCBA8NxHbagZXU/6E+BA0m5t
	2cME7mfD5iobWpGDdmW2PkoaF5mE/ZRWli91tjBZEOgO6Okm6jXaNerXwA3IOyIUea3PBxUmWks
	F6eFJRRReLNHnwSLwwpA/oudYClCO4Pfu3wvWWJ19qJ2uUiXOwaKua+tMYV4cg1+l9iiX/0DlNh
	SFCgmTHU8NDPaB42ywPQzUZg1u/eiwbItCvbvrG/GIPiqsakHXCdWIH8vPh+6G6PYgTLn1vzJyq
	C2zmpG0APEQh0EM2htCyha/XThHf5OQVfuvbqMHGiUfK0Uias8rOUj9/YzoNlzWo5zRfEgKYth/
	sirhcM+ipeEd4G0fWL8Undg==
X-Received: by 2002:a05:6214:411a:b0:75a:9c0b:6b7d with SMTP id 6a1803df08f44-75a9c0b6dc2mr32858156d6.2.1757509259850;
        Wed, 10 Sep 2025 06:00:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGyPmSFM50615M6RHwW4JfpvtlFW1/WulsS/UQRD9mfp3W+5WGHHqGDBmhseR7J3icQ11+sA==
X-Received: by 2002:a05:6214:411a:b0:75a:9c0b:6b7d with SMTP id 6a1803df08f44-75a9c0b6dc2mr32856966d6.2.1757509258861;
        Wed, 10 Sep 2025 06:00:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018f6a7esm3289951a12.42.2025.09.10.06.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 06:00:58 -0700 (PDT)
Message-ID: <634ae260-3a7b-475d-b40f-47401a70a53b@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 15:00:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Thompson
 <danielt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, threeway@gmail.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
 <b9017909-1643-4cef-bfff-5b672dd73960@oss.qualcomm.com>
 <jsLJqyPfjA2iFNHMvAxgz-zO1WecVgleSahWgW_B5BshbYat4X1UqUuKpexfxlRxnD3oWlAnHqeLGpne8JebFV-ICVxvr5g-5nI8P2Q6dY8=@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jsLJqyPfjA2iFNHMvAxgz-zO1WecVgleSahWgW_B5BshbYat4X1UqUuKpexfxlRxnD3oWlAnHqeLGpne8JebFV-ICVxvr5g-5nI8P2Q6dY8=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXz5liRNb/iB24
 UEX+xGpeUkdSX+7mdr+dm4c8Aut988I+tTPMVuT7A/fnswwad22qmOqTC7p0nxJ+quf+INb0LSm
 vLjoFBHxQwBiOLsbYwJhLgqBaSx/6gEDHQ/oLZ3l8eFahgXrnU0xcnTtZciMLXwLMoe1/zBro0W
 /nRg4Xd455lkIbPlTdHTLT8LoiA3jDYMWwwDKnNB0WWlMCDXw02rOezGiGa8bDJsUChU/MxUWOv
 aBQz0hI91cWAo+Ndgtz1VhQ/F8uhqPfTmKZVIVhZOug4W5uhQRntzAQ+l+HTXoe8cv7TvFeT8QV
 xllNI2d3G4bY3rBPSNj6Os3EiEOHRrWWK+gbQ6q4VWAfK1pViCxvz8slJcisniPpZ01OgURyq8C
 wtxkTJta
X-Proofpoint-ORIG-GUID: vpJQBTx2qEni_qlq0FkdLjIwj0c6fH4n
X-Proofpoint-GUID: vpJQBTx2qEni_qlq0FkdLjIwj0c6fH4n
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c1768e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=I76Qk8w-AAAA:8 a=vFEzn3JI1hsOnF_rj58A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/10/25 2:54 PM, Aleksandrs Vinarskis wrote:
> 
> 
> 
> 
> 
> On Wednesday, September 10th, 2025 at 14:22, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>
>>
>> On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
>>
>>> From: Hans de Goede hansg@kernel.org
>>>
>>> Add 'name' argument to of_led_get() such that it can lookup LEDs in
>>> devicetree by either name or index.
>>>
>>> And use this modified function to add devicetree support to the generic
>>> (non devicetree specific) [devm_]led_get() function.
>>>
>>> This uses the standard devicetree pattern of adding a -names string array
>>> to map names to the indexes for an array of resources.
>>>
>>> Reviewed-by: Andy Shevchenko andy.shevchenko@gmail.com
>>> Reviewed-by: Lee Jones lee@kernel.org
>>> Reviewed-by: Linus Walleij linus.walleij@linaro.org
>>> Signed-off-by: Hans de Goede hansg@kernel.org
>>> Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
>>> ---
>>
>>
>> I was thinking, perhaps we should introduce some sort of an exclusive
>> access mechanism, so that the e.g. user (or malware) can't listen to
>> uevents and immediately shut down the LED over sysfs
> 
> It is already done by the original series from Hans (linked in cover),
> which was merged few years back. It is also the reason why this
> approach is used instead of typically used trigger-source - that
> would've indeed allowed anyone with access to sysfs to disable the
> indicator.
> 
> As per Hans [1], v4l2-core would disable sysfs of privacy indicator:
> 
>     sd->privacy_led = led_get(sd->dev, "privacy-led")
>     led_sysfs_disable(sd->privacy_led);
> 
> 
> Of course, this security only holds if one has secure boot enforced,
> kernel, modules, _and_ device-tree blobs are signed.

Great, thank you for this context

Konrad

