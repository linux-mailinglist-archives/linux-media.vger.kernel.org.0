Return-Path: <linux-media+bounces-45779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4B9C13EC6
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5A023ABC44
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492BB2F49FB;
	Tue, 28 Oct 2025 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaBvbMT7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDB829E0E7
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644880; cv=none; b=lE5qynZdi0PI+fLnd6XBQmWTrs3SRBHw0oE84f7/SgRkXUIAolJQ9lBsMdL9Hx0VUCg2d1yhmvoEMlg7QbJfK+oRwQ4VcB6qs/lWDZwnKK7ype5j1Y/MOd0gNi8BKFCRTq4qwMS90ze3dLIxj7VxrzDZ5jlmCr4BX64PPbGE7ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644880; c=relaxed/simple;
	bh=92ximMM3HrtCvYomgPsBKCGxl0j5JEsmTo0RRYmUmfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3bmwQt7VuEFIe6xyBxrjtaYqFD+4YSu3P9nFgNjXXI1Up8FGHSUyrLW64vDJn7dnE7ggmyYzbiO29AlwctD+dZNycduD7ghR/84jxmRawEu6IPFOyX4dUfVrmvCPVfVFmSizsqicOSlfJP6njKBaj5XVKubQJEzWrybjAQQeLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaBvbMT7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S8rjw72881785
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8fQgACQUdMVIbkMW+bOZbTopCm7jhlY2sNnMiKhK4Y=; b=CaBvbMT71qxdRcLc
	/tz0Ll8hiP/C4lCb0tkRv0LTvExtU5Vfl92yFHyMNi4gRU5iL0DA6N8yrICdUKv/
	ll8HxKdkND/zSkjn0RJ4erPzzzVnmCRt21NutpPpeq/T7rREzI0MIxdEQcvIGS+r
	0tEvcdPJnJFFVF0e6rGChUrd3jeXCu+ZxkQu+j8VUHbyD/RnXamqkl4rWJd2amaX
	u7e+thsL1dhZhP5SXFT37CUPQSanRVmHra4B6cwvFa3smO4qS8hvhclvvgTmOgRx
	8h/kQvKVk4FKS+yhEB7tuWLv40Ja0muWHhC8SEdY7P6D3BpCED35+C6GGMTZA0Qv
	Jzy1hw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29uhbavm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:47:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c1c70f1faso25303166d6.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 02:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644877; x=1762249677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8fQgACQUdMVIbkMW+bOZbTopCm7jhlY2sNnMiKhK4Y=;
        b=EESWQkMRbCNov16JNv5Ss4Anwh4B5LVtHPUYnynLLuINLWxcpitQKYWzYikdH3hum2
         DqhVaGKCwJhxCy4dfIypcNY/OthwHbVU9x+K10pXEncsHdoIezmAG4uOaG7aY6CNN/57
         WM4zIaampqWMZ9scEwyNz7oRTaQqBdYI6SrEcuwSMR3pivwr+mYyDwf22LmAmqWil9Vj
         mXDNHs7xJ4Fau0jedN82TeuigS/brlaA4+IcxjN1wYZSwagWIT4H6PHGxqCy3R7ibyJr
         gNoUNhFxUNkIiLmFo9GOQ9+vqYsgtWdTliKUWYopFLzzwB0omCN7lc/mfLEnOxkU5D/w
         DUFg==
X-Forwarded-Encrypted: i=1; AJvYcCUd19U4Nj0f9N5pENXwl0SX34c/2zOHAlB+t8YnbRzx3cPw8NiV1JMFkWHAifpPynbjAciCBwVBDXHoEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFDxlzXk/z9ss65RL8nfjpQmHVfNaF0EdN2BGfieTywl4VQxKZ
	fSAelA8RCo9yV25NvAkJlXJzqWEMXgbUD0idAtB44GWUOasP//Yg0hsN1MnHwCWRrmYcZEuxdVR
	J5lODBkSBsKOxMcw2ckv43Z40kmx6AlYr2mBiZcUETGfosBGUJ7lYb5WSJwCJ3kxqUCcFE9oHiw
	==
X-Gm-Gg: ASbGncu8ynX25OCa0YfXY6N917aLvg+WmiSxSXTsQuoGmllJIGZIWn7zC3DofoDdlvi
	BRgAUA9s7NtQ2BwvUL+ujtUvsrQbtsulio7pWE4cyWnVrSe6/ijUXTouIjqyE/tZfkD1OopxkBF
	gIw7bpyxUVGSnvOwOJggE8T1wMlUcBYzdoROzYN8gY/uwsMmtgKmLfLlddNARsDwDODdj5cushs
	D0XLAafpqhc7r/OUdPCvyypRwhQdubg9uGMBGY6AeZlbWhIYTqHNbnICUKmO1uEZjPrHUTZBE3r
	bs89tRyX0bquWCoN6N3/yUDLdaV8gKtEU+S1a72G3ZDP1SqBTFAMU1MoAkO4gTzCjvRIKHwnbmR
	tyo6baCLmfd4fGy+Tv8cplRo7EkxazqB8Vvn2vC2hPwouwPSHsPTEZTy+
X-Received: by 2002:a05:6214:2245:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87ffb1059c5mr21687336d6.6.1761644877298;
        Tue, 28 Oct 2025 02:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOS8rCxBapT8jvuZGeFUYuC27SOQS9JehyH0lmgObjPrvYaSPzNW1Ksfgu1G8QPT0mdat+BQ==
X-Received: by 2002:a05:6214:2245:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87ffb1059c5mr21687266d6.6.1761644876903;
        Tue, 28 Oct 2025 02:47:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853f97f7sm1026780966b.51.2025.10.28.02.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:47:56 -0700 (PDT)
Message-ID: <63f3d1af-8620-465d-8dd0-30a42a36305d@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:47:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
 <20251028-defiant-visionary-rottweiler-f97cda@kuoka>
 <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kJqhxh3QPB1lU17KG-QWM3p39Z8CsVEm
X-Proofpoint-GUID: kJqhxh3QPB1lU17KG-QWM3p39Z8CsVEm
X-Authority-Analysis: v=2.4 cv=QuFTHFyd c=1 sm=1 tr=0 ts=6900914e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=As_Xg-pERP707GV__uoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4MyBTYWx0ZWRfX9zhwNsq0PhmK
 OF4CmQdCPft5TkjSGNoinIQsjFUFY+hplhFgaWzLcWtWlV/4VjD6VIk4+Pty4Rb0M0lUWfOSF43
 ODMEZ94TGvcud0Br+a1FUPGkfWeXkt/gXyTigCg2mSr1UPras2SR8Q1fJkPQM23zFxFy1fERhuG
 jScD/DGw35VUSXrB/OtpYnkVYMCgwwJbDHMbG+tzxmlPTlUM3OTSQWyRPGXFVw5Dq5dHh7BnrDb
 hULLGJVZil5UEgVNyzdol4GqwbqYF6lLb4Bb3NiEQSSbH5IULyffuclY1juGs5VOIJtwvAbwe5B
 xA6qwDY+Hq3/NnROKoVAFL7gFgmhLpLincLRAIJsfuqdE1RB2wWzZCXPY3T6ptOYWJFGZvvddtL
 2EXdhprS3a6Ihp85pLaYTXjw2NUA4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280083

On 10/28/25 10:24 AM, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Tue Oct 28, 2025 at 9:54 AM CET, Krzysztof Kozlowski wrote:
>> On Fri, Oct 24, 2025 at 02:23:59PM +0200, Luca Weiss wrote:

[...]

>> There are no dots in property names. Are you sure these are called
>> VDDA_0.9 in the device datasheet (not schematics)? Please look at other
>> bindings how this is being named, depending whether this is PHY or PLL
>> supply (or only PHY).
> 
> The following power supplies are mentioned:
> 
> * VDD_CAMSS_PLL_0P9 - Camera SS PLL 0.9 V circuits
>     (not referenced in downstream kernel, connected to vreg_s5a in
>     schematics)
> * VDD_A_CSI_x_0P9 - MIPI CSIx 0.9 V circuits
>     With pad names VDD_A_CSI_0_0P9 to VDD_A_CSI_3_0P9
> * VDD_A_CSI_x_1P25 - MIPI CSIx 1.25 V circuits
>     With pad names VDD_A_CSI_0_1P25 to VDD_A_CSI_3_1P25

I can corroborate this

Konrad

