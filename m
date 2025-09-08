Return-Path: <linux-media+bounces-41958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5A6B484FC
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E48E2189B0A5
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2512E62D8;
	Mon,  8 Sep 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZfEPaaI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95EA2E54D3
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316008; cv=none; b=BjI+jDMB104h+hpk4UPAhsl/2YhOIC8jZNVvtBm2q2ZfF8CHguEvkfufj5Slu+EBEPpMhGT+rQ7JrF2hwXLaeIIBiC5zv7qzSLOeLWGs1En9OfNzLQj39Rb0PYJkEPFuiu6T2BCZ5PzlZ8Bx8SD02HkoZWl5YrYyurph/PgTgrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316008; c=relaxed/simple;
	bh=PqMyOblKEfOraVWVRyMOSW5G4N5oZyOPcmEHnteK9jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1W6WqVIQpoo0nAYdghq6KeQA41q6Br0FHYZFfgtuGHSEeAyC5OGLQdM2D03IFntsrEwbQKHk+W+h0TkaXkfPXdOKtZlA+nR6UhonuY6ASSnZlLI/tdjB7kbbHUwsx7p+tPJitqB4Ee3P/gnuCIIT9iZVgv3/gvhgkGTOnMEhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZfEPaaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886gFIx005880
	for <linux-media@vger.kernel.org>; Mon, 8 Sep 2025 07:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWcKtvk8mFvfLmI00zGKSgzDw0tbzl3o6sU4GJfPEyg=; b=IZfEPaaIDN1l1x7T
	TnF1MTF+bRDRHQxbUua0ygSd0wlAkRtC3j1WrZRPaExv+OwbqMdE64KkYmn+QCQs
	RC8rVme6YhJB1Hsy68yssndvDzHpyAbOSHNpkcueZqfCvgAp1TCD6aebERni0Vez
	zWkLr6RkuDPBvmWRSah/ywQzw+d8Q4/IXKDBhwuyan4zzz9L38g1ImRJNbFjJP0R
	JdXCKEHEAxF0011/Igk+GEy0NopfLO5xRLSi+2te9Gk+E5pXGakkpxQVMkYaLuf4
	4jjhtJ4wLrzgfXVQB26W8Ftgje8vJJ3UEpFTKgPRpKudOlUI31Skz60BoDTdUcho
	ll7Dgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37r3kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 07:20:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f76fe6f6so5936571cf.0
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 00:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316004; x=1757920804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWcKtvk8mFvfLmI00zGKSgzDw0tbzl3o6sU4GJfPEyg=;
        b=kOqT13gmrfIYY53WlxmAp+kkAUnknepsFC+U7X6fZ7NSABec312yb6icZoNq3T4H97
         ZD3O7xInsRg9VFDyJFJ3fMYrxT5tSFY3JkLm8VJQmfwQ+eArfjN+fBzDKNt2axDKgbeY
         kDeHvkec4NjIvoUPPC6ic88fvhrVKwPXp0UvdiSKvqko1iwuP4wAdSvPybp8aTg/Z7tP
         BAIO2INy0Ji18iv1Xla4i4TBtwgzGxbVDWrOXZZEefid/7AahyXLG15QjrmALBjtuev0
         +X5vxwYyvF5YuUrcPgnC3tbDrcvlY/R9o5tCs31V6090n96w9i/shmRHSuPp8Uza30xK
         MP1A==
X-Forwarded-Encrypted: i=1; AJvYcCVx0U7Bs86K7sb2Yc4WbAwjwDsewq61AVexjJ74oEd91qY96QAoW0kmPixgIf1yUfFmE8+GwjDsHhyFPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40UK9wyyhr/T7YTnxGxlLDv2m9tdahGQoM2qNHAznBNWvQ+/k
	Duen3M0KfbFnr/M46Cb7lOgEl+Ewt5998VjpuArGXfc8t+wHBO8jUFm+FALm+KM0fzJoGHwaa5Q
	G4RtSu+Lba6wxtVHdEOoBkNOfoIbUEAr13yzrzW192By+wx2wxfWxBLGExcDW2mvHpw==
X-Gm-Gg: ASbGnctBIMS09iOfAyCuhUTHsEdATDQJjxEtYEQgeBDNa9uYau9JNA8/+nguqaeEl9a
	2XYfPgxopRsL8nY7V4bIyjGIrHA8KNRmZTENEcY7IqkWCS0GsvaIOaFhRe8scPUeXA6jztSORzP
	Ku7fUuwyfOGtHAJ5tyJyBjUknKZaofX/TLBwJgLabBxLgwTk5Qc30tS0ShqSk11F9m1a0VnJMDD
	pxioB9E0PHBjh6Y6/iaazwliRNK1BM/blx7eqnQZHaTSk5OftYvlDPqjt6sFKlyc7okZfg4hRRi
	rrRHcSntS28mhAWUpZ/MfqNa/k7nF2QwsZ/V4arxXr7PCfEsZF4StOQktue4lOCj0W8F91OaGPo
	3axehZX5nwqi0oH2U+eklrQ==
X-Received: by 2002:ac8:5dd1:0:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b5f8445af1mr48142241cf.1.1757316004495;
        Mon, 08 Sep 2025 00:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4+QiJyueOpHGD01U7ZGb5pGulY2uWYz7NY7jH/9d6NejQbnMKqPQkDJBKht2O5pECh1Hjng==
X-Received: by 2002:ac8:5dd1:0:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b5f8445af1mr48141961cf.1.1757316003978;
        Mon, 08 Sep 2025 00:20:03 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0409bf055esm2172292466b.85.2025.09.08.00.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:20:03 -0700 (PDT)
Message-ID: <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 09:20:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-leds-v3-2-5944dc400668@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VGwZLCS6TvOYhrsAqFnTPTFlq33XYUFh
X-Proofpoint-GUID: VGwZLCS6TvOYhrsAqFnTPTFlq33XYUFh
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68be83a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=zDPauhyOtcwAXlC7rdQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX7UAWq1jHLNTP
 V3jkeYVdHlIUjL1woa+vs32nUJz0zGmQSAQbpyB+Zw6voJtdZE6SPkT3mAV0hTT0F4RaN/987le
 HWPtIgXs+lDgZsmKAyOQfy69IvBloal6XsPGvtyjnqbnwoNReB2fHmQgNGrM/JzujuptYqBij78
 YdtM6ZS+zm4QRCyCLodxvLYinCkegRcnamI+dT9dFlofja09uJIoTAZA1j85tVxdcZhprmDVsl6
 GXNgoS4uqGUclJT40yvDo4bWyAOt61Cga2QAU5Qd+dkC6vjqYZvBuH7xBb3+LcChLnlRLmMwKmi
 YjmCoj6veGvMqlRiAgpeW5px0GaYd1NI28+yx0Q3cLkpFDo5Z0p1/ortfqnx5mgodyPEO4rrZb/
 35YMRZiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
> A number of existing schemas use 'leds' property to provide
> phandle-array of LED(s) to the consumer. Additionally, with the
> upcoming privacy-led support in device-tree, v4l2 subnode could be a
> LED consumer, meaning that all camera sensors should support 'leds'
> and 'led-names' property via common 'video-interface-devices.yaml'.
> 
> To avoid dublication, commonize 'leds' property from existing schemas
> to newly introduced 'led-consumer.yaml'.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

>  
> +  leds:
> +    minItems: 1
> +    maxItems: 1

My brain compiler suggests this will throw a warning (minItems should
be redundant in this case)
> +
> +  led-names:
> +    enum:
> +      - privacy-led

Nit: "privacy" makes more sense without the suffix, as we inherently
know this is supposed to be an LED

Konrad

