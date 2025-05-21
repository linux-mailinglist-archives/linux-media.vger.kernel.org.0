Return-Path: <linux-media+bounces-33054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B09CABFD21
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 21:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BED2D9E0E05
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 19:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C353628F95B;
	Wed, 21 May 2025 19:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxL19PIw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2582DDD2
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747854184; cv=none; b=qJNKj9ezucgC1U5BNPniFn6nI2HHqRY/TxrMMYdmjxq/DohTzEVes92INnb357cB+C9ismAz4obfpewbDyY9yFaKmKJLG//EYLsnNLqh2gAWN4Tdj6FcbkMD+sETL3xvYDSQCbyp483996+1liBuSwIbPI6FInuHOyOQs8SkUck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747854184; c=relaxed/simple;
	bh=8twrfZ+IWMuXm8fHTJgrikxj0BAx38DiOL17BbqoCBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDUOdG0wkcepj668SPnlt5EVMrFkIndA8w6g/SdwSB85cTFg0hpYdA7Y3hJwoxO37qJw6IrBMnXUxyuymdiFV1CRnxp6/fMhePSGLokbwOegGJq8P6YBnxFYdjLUtBG34yTa4GhO2H5HRrW6Ug6GiyJziCdmnANwC3wVXmVbJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxL19PIw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHSSa1020937
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 19:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZvwU6rcn1pU3SuVgKIwUOa5mEmteb7nXnsZfgaC3Wk=; b=CxL19PIwSFTBU8oj
	l6VLwLrdcSv/c0377U3U+DmxCKS/7QWlBdDIZXNM576sGs1HLErBOb6zL/Qe/udJ
	PqsYaLiY2p4oNUclbqV10iQggH7XM8VnUxhV5KArprwx+EETwpRGXXHFSkSsy2w2
	m9LCYv3TPI7wPkZ8BQOQDEcDW1NE/QUyoK/NkD42hr1GN4BPGeoVMcDrd//h0hz2
	3kNSZMp5VkkTpnj7NnvnaqnmJennMCyEc7AWFgw370w9rI9VY3gmqTGJn8kMYj+Z
	A2wMz26elrq3/blKPd1u+hvrDXPwQtdYZxFCtDAQ9uZrwHvKZAcmmI9jEehrzHeS
	BB/ugw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0439c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 19:03:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so199924685a.0
        for <linux-media@vger.kernel.org>; Wed, 21 May 2025 12:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747854179; x=1748458979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZvwU6rcn1pU3SuVgKIwUOa5mEmteb7nXnsZfgaC3Wk=;
        b=seGeDyL+uEEZxK3ugHM3gRkA4ox1dp4oV69Z59KJb0/lZ/qnUSEMPChN4IkCpNanGc
         2NVblOcPoC2DZAc6HIjci4YtKh/EQlqfcQfoft9FawrvSC9lxgxV5ItVeAgKucQ+x+Ol
         u9ZS+QsOizNjptQGU5QobubmGn3yetxRnPSS03Ov5eZljtmyTZ19s+tebyEquOZqyW61
         3j/5AfyalzgiblRLET18hglnHcKoynflb+Y47hcQGlyNVmfMRqZPBHcgixIsDGSCv2+j
         db58kvkUsw0ton0RKCBcBfGQSR9BP3rG2b/o5JDKyc8gHwgchS0fSHItNXmVBJjQ6kn9
         VaIA==
X-Forwarded-Encrypted: i=1; AJvYcCWu8Y1dmWM4ZmwG0ti5doMxy/OfvPmOSlAtLdUvWCt7IlQiewbJZierh/Y654mx+eiMHj2wlpRGwlpqsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl7XbYv/m4/pC/nwEtzjD70+1dkiop42Pk3gfb0zS5WgesQ3nl
	C78jfzv5DDPcMO0dATQRR7MJnq4xbu1FmW+/c/do5HtYOfRjFpNDUs2heJvfjjFSAPkuV/EcbKa
	UCaAh5vVyXOXaS4lsHPOsKov560L2X/E5S/BZOhqALATnPYYHzdckKBSKl1zFLwkekA==
X-Gm-Gg: ASbGncvdzRveS0v0BG+wd2urXfBLzrgs4Gxi96dcBgFmzI0k7qew39cq4vUwIt6NzK2
	2u2ByxIxKvxK9hpc4FzXaidFEgSYL+yvHL6CHCpp3T4MVR16wMPzAd+miisb2ymmbe1yF0oqTRk
	pDSXDAXia/SOauSPrj+hW+CB+e0I8KugSO4YWF7wjdkv20KWObY9Q/M4lxzTZ3yvm5k76clz2nj
	OOGFvHudbDDK2Uz2e1vCvXvN7MeLNWn8OOxAl3vTRXD+ZollECdOJrstVN3TepH0UVK5fe8qFzz
	E62EgjF3AYg6Exw/GvTvNOjysyKqUpPl4ZoFSN2ruzdFHyy67K3+mD0cqGOVGMlNkg==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1311535985a.13.1747854179431;
        Wed, 21 May 2025 12:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJthzcnQRjBSEzhEyNWSkKkY3ARkGqwf4+As8NUm1pnKzoZ9brBaKeWvyPRtoJC9YLjjiNQw==
X-Received: by 2002:a05:620a:6504:b0:7ca:e39b:946f with SMTP id af79cd13be357-7cd467db69bmr1311534285a.13.1747854178861;
        Wed, 21 May 2025 12:02:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047c30sm937346166b.6.2025.05.21.12.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 12:02:58 -0700 (PDT)
Message-ID: <575212e6-5f43-4e41-8bfe-8774f07d78df@oss.qualcomm.com>
Date: Wed, 21 May 2025 21:02:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
        bryan.odonoghue@linaro.org, todor.too@gmail.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U6dDKbHTuZx3-RZSa9gCZhf0-0wQqzjY
X-Proofpoint-ORIG-GUID: U6dDKbHTuZx3-RZSa9gCZhf0-0wQqzjY
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682e2364 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=lBa7_Vnelazs750aZ08A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE4OCBTYWx0ZWRfX0QBnza6nwaWn
 2KOjgWqsADhFiqR3NF2DOHhgs50dHvLJ03FmwJgYBlqUkzWf8JyxFGETkgwRXmo+RwLrz3XAIer
 gld3yyn+Gckhtj6/UMp6thCRfm82WFWn2vqbs84/53QE5z/qcIsT42ud6Daakm/yj593D2gK1pU
 ia1CDg4dmOM7o992XYSSfNHFemr6ePblD8WWvin6Zfkote9/BpK1z68IvkVT3A8PXd5I8Wytjhe
 cCnlKFG4k2EARvgm5mj3pqhM5pwT0aiJZuZGgqjT9QBvjV1yeGp2+WHyGTv3vi5IsV0LqhwNRrC
 9xc9y8luz8vp1CdUHgPaHL6Wwwql1q1ehI5KFfyvjX/JwTAWJv0FPbUB82r6Acgm8jPTmcokuZA
 NusfnYXhBUIPjeQ4qKnIXx8c8AqFGeTN8SQjnK8t31JEgoX5WIJGfpXXAZhpIFapUvBFW7ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=845 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210188

On 5/16/25 9:27 AM, Wenmeng Liu wrote:
> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> SM8550 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 8 x CSI PHY
> 
> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

