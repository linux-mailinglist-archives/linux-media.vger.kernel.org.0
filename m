Return-Path: <linux-media+bounces-24232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC679A0094C
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 13:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06871884997
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 12:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC951FA15C;
	Fri,  3 Jan 2025 12:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSU6ysg/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8078310F4
	for <linux-media@vger.kernel.org>; Fri,  3 Jan 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907622; cv=none; b=k1XnD/g0fNE7zoRkLShjFGhnImmRc7fryjRxPwyc5pjBZWMlZKEIVFaZ29YAhc0dYVbXdW81TSiSkBHhqwHu62v7NYxtksYd91CjT7Y0QAOlSn6r2OUWrlEW0oydbedOrfICEa3F2a4xTpKIVCAI4HpoyHmZF7WsAmViSWVF1gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907622; c=relaxed/simple;
	bh=pEzUak3KSwcyxR/a9pc2u+/ko9TsfzXb06M294EVjmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DE2Kny32g8UwGBA4ZpbrjHjIhDqiOB9lqFLFx9PHRhbIiEbxLuHhCzUXGZNBxni51s6ea32FUKuljIuA0NkB2GHVigqGJEh+NYw6cmIdYOy65c7+dGaIhSq+1SlTECR4Pm2ejFHKQ0p6yN5jFpDBtAudsLd4XjscdfJDiD5jzPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSU6ysg/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5038KiKw010158
	for <linux-media@vger.kernel.org>; Fri, 3 Jan 2025 12:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n2Dpbmc/KnZM07+zlG/yLj5EEwSqvLtt5wQl4yd+ONY=; b=gSU6ysg/NIkk9D+9
	++Vold3gv781AW4DhM6aV1y2JM2HGBq5Dl959mngtiMICh5ZuZBAsXAFuuJcY2t5
	9WPCfXdxrRY+lEhPWgxtGUw1cYWP8K40P5X2OOp9BH11L8yNAPCojjUW+qqgR0Ak
	qK8E0eJpMydmFYoGKx3RgO5JS2yW2C8WiaOwGgK0+5L9lPNDFbVMljthACC22V1G
	44mj8AfzHxpA8YsaE2S3Eyzlx/9yYFQRT2QUWCxqBvHb6RvBHW7W7kOOELG9aLo0
	t5phHpvChr0I6oJHlwsag4buHaULmge19D3n5/9fB3MLUSujjvrK/iso4GxdVVnt
	rL/k6Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xca50hgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Jan 2025 12:33:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467922cf961so35971541cf.0
        for <linux-media@vger.kernel.org>; Fri, 03 Jan 2025 04:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907617; x=1736512417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2Dpbmc/KnZM07+zlG/yLj5EEwSqvLtt5wQl4yd+ONY=;
        b=bqWt9HqOPbEh56bBMWrzsRyrpFCB5ZQgyicz2+3FE5DByoCx7AGYG4ZVk7eTGWgBMg
         5vGIUmeia/mjCVP9NIZbiGd6KHnSD99G/HbDSyY5ExoX+wAAPWCrUlGUIhAxFiH3eVqa
         6DTbSYcjyqPUZkMsaKdvrXu8xWs7/UOa1AJigK4iRtbjB4jeyGKPuVWC9bEkzU5h7VZp
         VtmHPdLSo3qoUW5icTomnxRrRUrVIgiE2VG3r0RRv0e7sHSZ9D0XwdZI2db1IKQ5jr31
         aC0EfKWfWaRNR+kK9fQO5u34t/f2PIF/uGopnd6YPpjYzEhlFfZNceWFnBqUvbRMlO3/
         TKJg==
X-Forwarded-Encrypted: i=1; AJvYcCVX6wfdetsOTaFH6+yEn9DHOR11Xkp65K2Q3hFbv5aBEsi2bqay9HnTAoY1hqMVrB2b4CVw+aEw/ZiIBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1UHNGH2BqQTtkeFccE0Yr8yzKO7cdtEe8PIXA8QS9a4GLaNwb
	fK3E88tysFHFXhv2A7BPsA5Bq1H+4qvy+3Zp1NU2+swzveYKGqhxO2oM9x+6abr9G9F8okavcCn
	ELQIrn8ppGZ5d8bHNuB910nSrvnGMwr0uUqB6Sm092JQHuYDsx6Ar4DQw1LdBxA==
X-Gm-Gg: ASbGncvan6yGV7eDtE5au8o3BtmaB9tnl6d3A+FbwMbzlatLcxYp/8WjFXK7mUjtsbo
	/4wbsBE7xbHqckcxiswPL5cu/33DMzpA6U+Ma68s0WMZXC5y5VITR7ClkHDdXbyAG4CtI6H7V7d
	WddG+YfFyjgHnpwmoErnJLEDEQX57+E6Pv9v3Ahg839NHqOZjytLxgOwV6INgq6mw6to2wgFwo9
	ZY5gyrRP3YbNOPg2HM6kyu1Wr891TuSxxFuzKj25NsXqs0VNpJAmhQWQbtNebGlz7AakBuGGZbC
	ozZ8P2YTYBMyDxWvYoY+GL1bxN/oW9gGEs0=
X-Received: by 2002:ac8:5a4d:0:b0:467:5462:4a14 with SMTP id d75a77b69052e-46a4a68fa9bmr291986231cf.0.1735907617244;
        Fri, 03 Jan 2025 04:33:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnMA0EQ857HFoyRLGK5cmdBugpr0LylR4BGIjaNVCCKL8WAfGOH/wKHJw8YeCRcmbXx+Ybig==
X-Received: by 2002:ac8:5a4d:0:b0:467:5462:4a14 with SMTP id d75a77b69052e-46a4a68fa9bmr291985931cf.0.1735907616857;
        Fri, 03 Jan 2025 04:33:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82ed65sm1871999766b.33.2025.01.03.04.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:33:36 -0800 (PST)
Message-ID: <aecff79e-0c14-41e5-82a9-e24413798e21@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:33:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
 <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-4-cb66d55d20cc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-4-cb66d55d20cc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RjAYwMYBdTNCJc1ULzYgmIVprlCmccoB
X-Proofpoint-GUID: RjAYwMYBdTNCJc1ULzYgmIVprlCmccoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=847 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501030110

On 2.01.2025 5:32 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

