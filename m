Return-Path: <linux-media+bounces-22745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF879E5D12
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 18:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 763451882778
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 17:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C5F225779;
	Thu,  5 Dec 2024 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6HWnIL8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61AD21A453
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419650; cv=none; b=O/6+3473aayDoIe9WyAaubZuBtWHQoNVypXAZnjDQu5a3VlDi7XtbJyjMZXMatdED7jtjzWgqGhATa/PKzOwMn+QPIPh0+H81SaIwR1Q/Oi8RnLoFUWsau29/maLnYzXzI6TEk6VqsCB3IudpR1pLNmR+tuz0/J2DsXDNSu3UUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419650; c=relaxed/simple;
	bh=fF2LhtfF45ILB8O3xln5CQMo1Ph6TXBGzfylj3dTqI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8GLZKPxxxEPMJleInFdnFY1senmREGmUXGAcZTp+v1EK7KALYpOoUpd22K3l0L3H9dvtK4RoAStPMUYNOh6lff6EmnQuTArd2NisOwdjQKs7ciB69PxwT75yo2IhB0+QLWqkRBoDPNojfws67JD2n1aGs/Wm4R0UCh0yHIdNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6HWnIL8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5EVxWq015067
	for <linux-media@vger.kernel.org>; Thu, 5 Dec 2024 17:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fj1DwXHWgW6cIws9PIYZhpFQWc7IBvxR8/G4nwNPL70=; b=c6HWnIL8lwL49g5q
	MuxA763cZ+2VCknfeNDQKVHyOQ3+P2VaVoOaQnMh8BWFIOpBRwYs1uAjHtLYpYig
	gHOfFOHnC9mCkB2jccPXAkYxFKH7K3tT4m+ZyWRLMScLJ8B6OzckmgoqPAxsnFz4
	67mxhCMUH7J9kVgtPeKwRP2ZfDjgPokd8uW1LqgkxGmfuD4C6q4riq8jfdtYufYR
	A7Sj5t43/pu8M8Imu2W2j6O4yn5t1XL23+UN2TCgNr+MUojHX52dBPL3rgfnS0Bs
	QywoxgsJdHLPW2SvpOpy1DIMWAa/QD6NbsqlhSKEwzDHzEEtclaFZKWXogyRH2vM
	bu8UMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be170h0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 17:27:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46698b09335so2223451cf.3
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 09:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419647; x=1734024447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fj1DwXHWgW6cIws9PIYZhpFQWc7IBvxR8/G4nwNPL70=;
        b=ix/lTPE+t9nqA0BYblq2Y///LUaHYTWf+aH4aoBN71SMD9hVFtzOuCPd+D8Yj0LlkH
         KckZbYFYMpppJjf+/nA/ClTKCFV6N5w20urjbdRKwOY7ThpkIRW2QAW+smqKkEhRdGZe
         0G8iFKE+E/nWMrAn4O1U2vdfys/5hyrVG2lrXVeq5k29QhIyyqrQjBxoypmdVQ+5wrp7
         R3rklvViLUxzgch9Wez7bTD+zyxJ9J8EpZMx/8VMl3GLBDaOYxcWVGSKzVmYMV5hL3Hh
         V1nDpVQ0GJHDbcBiD2PwRkaLfI1bXngPhlGXwL4xONyYq1rhPTU5Gbyy/JxqCKGq8D+Y
         hiIA==
X-Forwarded-Encrypted: i=1; AJvYcCXsGwjibLSxkf8CmcT6yOoJypBrLt/fvuHkRc5N4zr9WzBi3hVNZFn+jc/gJOUVqrNhYzCUm7KVC/nwYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcSz8pFe9a+xx7ukNot8MlliANJPJgGeoNOniMOkL6aGoqO5S
	FXEY1mPZTLOQGbvOeq5T7STz/zmdNqHpR59bzmJwkB4UdqK/JBQEgBvcgeOK85IdaLm12ruuW85
	RuciluTKt8tAYaergwE/ryHK8ESzcMyrgK1yWX+fuLoOCplPSXcu2XmPjUbQCrQ==
X-Gm-Gg: ASbGncvLOC6uxFIRy9Vn3tM1TkQ5Fz8dLoNdGuwnN5FxbRQozPJ8QQcLk9I9Oziavor
	Hg9lk8/JgsGUSAi7wkoi3O7SKsFJOF866Lxvwnylk4+WiTxM3kCoANgjAmxNzJxVKVaBeFsW0YA
	IIjiB2iaAwyo8g23nztF1NytNDQxqLHQuEmKFiZeQ7o8z8xEZgbaCsV1GzYzBsvD6mzLpL0g/lQ
	OSXP08eFYzsjK8/ZXn12Wt4DFeMojbB36RIqXDemqR8mnNQHcR20jFX9AVL7LCs+N+a3HTrdWwB
	NSElUgoVEr8cXdqaC2ZNJDwNbgk2Ii8=
X-Received: by 2002:a05:622a:cf:b0:461:4467:14bb with SMTP id d75a77b69052e-46734ca2a7fmr95071cf.2.1733419646866;
        Thu, 05 Dec 2024 09:27:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9jw9d6QQQ742d1X4H1GTd0gJ/jXukZyEhfsj2yNb2yqqSlyALEbJIukWb/H2Gua4FXrmiPw==
X-Received: by 2002:a05:622a:cf:b0:461:4467:14bb with SMTP id d75a77b69052e-46734ca2a7fmr94721cf.2.1733419646416;
        Thu, 05 Dec 2024 09:27:26 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b608faesm1042160a12.44.2024.12.05.09.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:27:24 -0800 (PST)
Message-ID: <3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:27:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
 <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>
 <2chygbm3yjozhkhps64oae5gwirdk5b3orsybss7jgutu5g7ke@4jskpnermxfm>
 <90fc1097-d353-4b6a-bcbf-81f8a8e24390@nexus-software.ie>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <90fc1097-d353-4b6a-bcbf-81f8a8e24390@nexus-software.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dvGgcGAOryoVP3Ka9LpcleFtTSKo4liD
X-Proofpoint-ORIG-GUID: dvGgcGAOryoVP3Ka9LpcleFtTSKo4liD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=874 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050128

On 2.12.2024 4:30 PM, Bryan O'Donoghue wrote:
> On 02/12/2024 15:02, Dmitry Baryshkov wrote:
>>>> +            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>>> This clock is not registered with the CCF
>> Isn't that be going to be handled by the CCF on its own (like orphans,
>> etc)?
> 
> For refence this is always-on ATM.
> 
> drivers/clk/qcom/gcc-x1e80100.c:    qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */

Okay let's keep it asis and call this a Linux impl detail

Konrad

