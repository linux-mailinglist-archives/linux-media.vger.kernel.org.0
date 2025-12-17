Return-Path: <linux-media+bounces-48980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C056BCC74DE
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 12:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3AE45301B381
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 11:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BAE341642;
	Wed, 17 Dec 2025 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HrcMJqsM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZtm35lw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722D340A4A
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969985; cv=none; b=BWKDqp2xv8iBNuChBus2gADbYrDIEfjkCV6G8fPkvNR8RtVonDxC2UMG7SCUQdbdLc9ug7IMmBkZWHUfkKL9kifmP8vz2unEV6nTDLPLzJXmKxjfOeNbeOADvX42GyeDs6Z/v/tQPCpZzKAYbwDRUwTKnkr/YIELxvgnllMcqP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969985; c=relaxed/simple;
	bh=jBOMNeoZSGFfnDvdceHpj90yKVBrUkvgfUO9dxv1qn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQpkGfhAOS5xNOpGMHl5vjm/SC4aV1DbbA9T5PvJk3BvVuD8M78jf7JAvdGgrzbtwSkY2KPIdHO+AAPkJbiUy372Ob9OjSUMG36/m498nluQgHP+jmY5qLRZtICBDX47v9sBgSfowfQ6Fqq5kTMwC7RLo6BmtosHLX3hym/WFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrcMJqsM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZtm35lw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAJMaE1564912
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 11:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=; b=HrcMJqsMrwrO9KL1
	YBJgJBQWnXdifnAdSKhpQVp1GKtb1CoyIhK2+gMsDXz7EWV+KtoaRgWjF9ZSvcev
	TVBOHwxn/FV3SqEV2pFNuJE1sZLFSOZs7I6NDZENxL0WE0M9TjUQXXrpDA1hI2ma
	7axN9i2Z1/0KIUj9DHQcoMyGfM66fwA27Cx12ML3zggHCljoDdc/rRJ87QTGPswX
	udDqWuxbIBHfbv8mLsIoa1r5Rt1akb1B+7964LkY9AUnCOA/Ej43X/mF0KYBIJAe
	r1hDK7ka+QyweH3liPTBuyv692pDdDDRZ0Y+WpuUkRUKAopIeMGSHunX9vqLYC7a
	8wsJxQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj1cc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 11:13:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88653c1bab5so21147706d6.2
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 03:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765969982; x=1766574782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=;
        b=WZtm35lwN0NXEGfcV3F6Nes4jgrNHuBqjH/rXBqLt/jbYSwFwK11Js10QVdbdnJwy1
         pMtgmXFxj2wYvMUAfi1/CCt2GdS/6UAizhshhBtuSwVIP2gacVqNcIPzCMIukGowK+sd
         8MtQIjP+DMnvHxg7jHmc8wYP/CQhfbZo3Essz/u+4rrUD7e2gMx+Lu8E52WPm36x15QU
         24Z6L7Cm7ZC7nwh55ICFF2RGPLzQw3LJ7Ldd+/GsHpqmuOG4gdNiNW9oClQt3EKko2i5
         rs0W0rnWEudDUpZRAcv1qaXmzd8OHtzxTWYVn1B6EOIofI7nMlrc20NASbECxlVQw21m
         eEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765969982; x=1766574782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8s7nifhnhw8fss9dv1I/1lokXsEB5LjDf/QVe/Sm2fw=;
        b=qgj9vK/RiOSpK6LCI307HXfFY8uCFwOcqhSPR23buAWKMyDvGefykbFGkrYNwLTgUa
         OxwfJk5Czb/uEaNpIKNXI0NRRfgh2Sn6+1RLtDqulcayc7HlbaMvJFsWcE5X/h4Qu4Kl
         W1xaebijBVAA52QtREfv+eCwaRhcgbWJtN/+0y0WxqOr0y3wq2AzYu8wYU+yDfyoRZ0K
         YAYB/eq1lEiC/I4MmI50GbGGNmyrtBKROUliqNE/7oHSkRXMxlpYhEhrArUI7VOxuiAg
         aoljuF2xefQK1FgchXPMz9OhEQhwhxGnpm1j+udoC6+DsQ8+JE34khbwn+Sj71fSBUgN
         WiFA==
X-Forwarded-Encrypted: i=1; AJvYcCU1sCC69cFia733IMkmw3D5E8MxiOUUSApefyzgNKKfFHOvODf2HfDavtCfdngBgz+QLk3Hmd/YE8x+sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF0QgBMur4jbXC2I/JkD+cDMhzGlbyQUk/el2A3DyDehrPIXjg
	WJ7EG+bx2ffxd0Khw9k/LYkWfG+r8NVe3PZ5S8cQxUoH66QFPI0ANjLycnFGcvrpRV4sa6vVRtu
	+DHw3i5JKGJG4RvFemz4P+3+d/L2j3KZy25r2kSfkwm+H57Z2uZm89vUySKkqWzIgrw==
X-Gm-Gg: AY/fxX6yZP0+/MhygfsM01+/3V7btsOvRsOWOeQDwQ8Mv8hkNLlO6KQ67mJWEwKYnpc
	Xf3AXuXz2U3ScDoe4tVb6bjOfZlJhf7fdZYRnGkueDezrgx4xXs5idhQLbNDt4rTEZvmu6EYh3r
	IfzfhSUmavSHdgFRJPNj2HGzZ+2MVZHesiEAdJFND03ArhvXNpk3wcLKFK3z8hggnBBVoWyhkPJ
	5yJuNbVowEWVmfqUhxa5Uj2K7BGC6SFsi2AZ+8v9Clr/njIPpIRPpS2wsYlWjv80KNQYOoGkr8U
	Eu8GJX9tzuwYXE4uvoShjWNPIqsItIDULKhw5jJaVjOFOTqXkvXJtwemRnEf3b4EOF9zL2+j/QO
	UpH60CF4hxdcfG9xktD0ECrDRNbkjwrwGfHmoPGsQUb1adCr0kTzd0ZiBPe118vUEgA==
X-Received: by 2002:a05:622a:44f:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f1d0586436mr189091011cf.4.1765969981886;
        Wed, 17 Dec 2025 03:13:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHde3INckVEyAtJpPA4moTPTi1MTG9MaZWu64iJa9nrCbGOgdnmQ7Q8sGmBSfSB/n8j8rYYUg==
X-Received: by 2002:a05:622a:44f:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f1d0586436mr189090811cf.4.1765969981412;
        Wed, 17 Dec 2025 03:13:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b44620bb8sm1151802a12.14.2025.12.17.03.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:13:00 -0800 (PST)
Message-ID: <417d7e80-e098-4993-85ae-59ebfe50934e@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:12:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4OSBTYWx0ZWRfX9BMhwzgPVhR9
 YsQblxdhAF7Jy4o7GawnXQLv3xmcllqW3a8GNvApsq3yOIuGUsOFghheE7oE3tiTUJf622U+cU8
 BPvxNEB+vsikiWhuqqrtGC9aGmEwm9u9y0MY5J1pC1GUbzXwWP5DLbmGPWQyFwP98VYniWFMDeN
 4Wky2XArkspL7JHweLUddQ8zzYwupTPYcnZGtEFLr4exouHF36kSjQMlcLCY4zATuTp9eRVrniD
 w5C6XvRG3GNQ5o4PCxsGEVZFBxFUSycJ6HBnHeTyntw1VCg0m19lj23U09liYm7lPZJYD+ze5vS
 cFtByvLBRVsLGWRnHi832ylpeH+4boFG2YaZtl3Fswv8km+6P0sMFay4iqgvPqBrJrWzYmN2yLZ
 Q2fsqnYyL1W15Pvygii07tPTNOTFtg==
X-Proofpoint-ORIG-GUID: 0cptDlkQRFTrl4DshP24yfHhg55MgAfT
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=6942903e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VLFlip5mi2fxP60pxFoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0cptDlkQRFTrl4DshP24yfHhg55MgAfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170089

On 12/16/25 7:22 AM, Nihal Kumar Gupta wrote:
> Define pinctrl definitions to enable camera master clocks on Monaco.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

