Return-Path: <linux-media+bounces-50287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E33EAD0B1C2
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 17:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AA5630A4BF8
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 16:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1133535CB9E;
	Fri,  9 Jan 2026 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SY4eHgWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0N9GYCV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178F363C5B
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974396; cv=none; b=jcS1f88lCgZG8Ak6YZtPQ63UxH5OKTKDyxY6hTCbH0D2fhd86XTSDEokJZEanu46tehObZeZdTCJ/+Jeq3lG0fby4RVrMY4AuCxhCYX5Uk1sxhExPYi1UWtRt6nWm6kQPWDxX1JhMM1T8iuz/iJKLjjjkBYp6djxpqoOnL5mulI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974396; c=relaxed/simple;
	bh=rTLHUlkEj7FTIIqNtQGpxIHSrTLetqGEyWyk9uxvDMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+eRAgCdJi4xcLjDGm0Y0lpE/LL+gfSRGcccGi0OfOUi5J/WvmZ8osERSmNVVwd+rrWNnHIh+xCfqPAdMlTOHhPBkigUaYvdRzmePDEn2VmQt5+QffN4C23O3Hu6KDnydXP/iShe3gijQ9dnN7cSVTVvhh+t8zlefc4Ykikkkg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SY4eHgWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0N9GYCV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609DWGmf3142710
	for <linux-media@vger.kernel.org>; Fri, 9 Jan 2026 15:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=; b=SY4eHgWRegCoCESk
	Yapaho1FIoynUqzahlV8htdbNyfrSp0Z+6UqbTUkS3bPnnRIpEfOIgQFRaYUWMxx
	VQBUSTXrIGj1Z8J5MswbebEHp9sw4Lmybge3HqD0AooIXWnalvyNgK6R0uuw/LbM
	VmVvvDFDvS6HRN24vFvUaHYAQMUKM2hnmh6+z7iQVDdi4oiwgIbnPkW5TFf44ERF
	uMhw/KL9ZxeXcaAk+ImbJCo+MO5qd/XPMkWlILOd7TK3h4NVZv1XqIOTtuYfr5eb
	/JPlg/8gzHuxNgd2L2QdSWBw8OF7H/XRMw5uHtkhO/E+FOtFqOV52j7oKzdqZ++c
	imFCQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j37dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 15:59:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so1092773085a.2
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 07:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767974393; x=1768579193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=;
        b=L0N9GYCVrDMkSOdYbcaTipZOmFVbtyGgg6loD0dIa7g+WbZICiACZv5CY9oTcisJh6
         5llZ9isLcmzRUZ5FfZ0KyeVVsqdLA3CtvNPPB76tX0MUToX+R3nBJp22ydqwcRGI3xNW
         +gw3aGH54JL/gcG5qM9Pjk1gCmouNlRrmn/T/x300COfh8XI5mWdMgSQNa2X963y6lUW
         kyT4j0LhuP28ce0UPH2z1kqL9fS3psdC30N7vfyGtlTOLNAd0cy/qXbOfY6N8jrE4JuY
         mSOa7g7aqRZMmjB/m9xulWIlJ37I4/YRn4iTdBZHv2/BM+wo3vg9b3PqtoUz77yn5Aw/
         r6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974393; x=1768579193;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=;
        b=nTiDPmOskQvoFmIja3aUiEOl/LjPibABGj/9WFyppjMNBb7f0PgxipUM4Xg/xgWFW0
         H9jgEemMsabFuHnGFCgNNOwiFbhok+nBUwlSGEOWgHoeCfavGVcZoDjZ2ZAhXbM6rIEx
         SSgsDZrUSc4mFcw3pFSby5ABgi18hppbjzajoiQdeYlXqKVwIDJJiR6EUG6L62PYQnub
         Bive1nzaFgXtsd1HhWuYhMqYACl7uqTEpFDz1Dltt3swxt1ME5I8BgE4608jkkV0Mb6g
         AvgPo6pS+qV426GyrgRNXYvQGMWokCvZyeO5Rd2TA03oL4el22pd95nnTCEiBBU4rH12
         J6pg==
X-Forwarded-Encrypted: i=1; AJvYcCW8FECj7cSPQCrBarbvnRF+EOvFuMLim5Zj2AWm/rmVaswv5Fjuzmf/jDIMpYhErrSiVKOwcuKx587J5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6tMpl1q6ytZI4Y/fSVeP0HFUBK3GElx9807x/AXg3Hsvzb/si
	hRveg4cPJR2OD9eDIXsYZr1OGTKj8CfXsNU92lhphg8SyGeFag3jbp2V9Xv2P+aqurAd+jBZVL1
	ZcHBQ8e9+YVK2fJSbLcgD48nsN/0sVJSzuoAdMUkHFmJlYxDk2o3A2m7t2+wS9MEeDQ==
X-Gm-Gg: AY/fxX7ueKHPl85XMTY7fHtoB1siv7clRM7NJIPLy725ecb/gx+OWzRIUPFazdcauhM
	izwcO9sxi8bmUY0bzZJ5y+tEBWgrva7faSAdzcQARzfSVdOJZmQp/tr5fgU7vWuOYaj/ltZYsmw
	Bk9GbMMVud4HjFQ/NMdYq1/24+ns4MBWdjJGbKebczxUZmXHGvSjcxzBGz1C1G6TQ6b3dgggHgf
	nxI88CPruJyCryvGmCrE3r6isuXQsvyZDNl7++e72PnwZCwen9YOr55iLKPjs7vrdZ3x6JsGVUC
	BUg2wFPX4WICTpw9G7WoOUjbzYeh5Uchqv7na6lGoBj2W+NjqDJiK7wffdgSJyXMqF1rM3LQF0P
	M9EnfKW9M0QsGtW0ajy4OK/Z5FOfNuYvD8qQ9ug==
X-Received: by 2002:a05:620a:4012:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8c38941be00mr1353949185a.87.1767974392677;
        Fri, 09 Jan 2026 07:59:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESJfXgvNwYoKbr+VV5K75y0TEuDRNpdFfr3P8pbO1Z0XQiQDyYbEMWdURI1MI8Vrv8awf0vw==
X-Received: by 2002:a05:620a:4012:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8c38941be00mr1353943085a.87.1767974392196;
        Fri, 09 Jan 2026 07:59:52 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm214846375e9.1.2026.01.09.07.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:59:51 -0800 (PST)
Message-ID: <f49d18b4-f7b1-4a48-8132-6c081cfb78d8@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 16:59:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] ARM: exynos: Simplify with scoped for each OF child
 loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-3-24e99c177164@oss.qualcomm.com>
 <20260106101107.0000398f@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260106101107.0000398f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExOSBTYWx0ZWRfX3wRimGQwQbTV
 Iu7hRmfxveWpdAJVZz0hymnHgoKaiIa7fPsQpsUQHGxJaSeIE4JjlrYbLjaInARS/evlQQUtf8I
 BYxWkNUq2MgtZs5gzPpUVhA3hpBJS9KiCVnYrHjJ1nlhtioidajpcjisLNmUDYVgQREiF+VtE7g
 d+pT4VG+m06hp21qUkhw1U3ArYqcN9gLpj0cnCGxV7assTDxoTs7zxGupUwOE5u70Wtv4D8bgdp
 QZYfZl6DOQcYZUMEcEVrkmfsjR+3FAQTzraXde/pf5mNWX/xk9vVsmhGNyjnPq1q6ma+e+9xUAR
 XEV5nlalyy2Wo91tJZOQbbaTuIO58OpimEpd1Zv6z8MCCHh3f73x8kFBK4Q29LkLuxvXR2SEJX8
 f4OZGteKpMNma0rWgBjTJmddhBailpMK4Ma8rjghp+QmOofP/4c8XAmHW9WwpOCrMovxx5Ja3u2
 CdycSWMmcHGhzxiUoNg==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696125f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PdBTwWr2l7WQ-UydZiQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: AlRlEaZ7JGe_MKbmwJn-tWi46iEqeqsY
X-Proofpoint-ORIG-GUID: AlRlEaZ7JGe_MKbmwJn-tWi46iEqeqsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090119

On 06/01/2026 11:11, Jonathan Cameron wrote:
>> -	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
>> +	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
>>  		struct resource res;
>>  		if (!of_device_is_available(node))
>>  			continue;
> No idea how common this pattern is, but maybe worth
> 	for_each_compatible_available_node_scoped() ?
> Bit of a pain as you'd need a of_find_compatible_available_node() helper.
> So I'll let you assess if there are enough instances of this to make it worthwhile.


I think there are only like two or three instances, so not really worth
the effort.

Best regards,
Krzysztof

