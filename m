Return-Path: <linux-media+bounces-50130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F05CFD83A
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 12:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A9630E505A
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 11:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DFB223DE7;
	Wed,  7 Jan 2026 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SlhpDtCa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiZfBA3q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC8F31283D
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 11:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786711; cv=none; b=u0NLTq2ypUwuLf0fSViKcnfFyNe37tH7FWcj5P0TsdbNck4FHYAAMI2ZK0WWqA2ttIP/xlHL6CfyvIORv2fueq7twla/QLeCUIdDWeRQ3QTBlFATEsFlZdK4rzOkOZ3602ltnD8sKmu6cTLruWr4x6P7+A7XKBD2cJHg2L5NBJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786711; c=relaxed/simple;
	bh=omrmxgZfe5lFu9nOJSJgRLGEBohCtAf5W0pVtFMiTt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jHCtK9nI/GiFvC0HtSsrDsZe1RNmIuCfXd4qheeYwuhZK9LSt9Si4dA1Nl4MVCfVwLRXb+4gA28UElpSVA2kCPOq2UnUv8hbFVBMfegEndElJzrzSPuzuBzLbCI63rjfD+EljTiKmheJM7ujrKqkkJyoVWbgMbfMOeisoK3gDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SlhpDtCa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiZfBA3q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tnux2379662
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 11:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ggDNMN0dkYQ6rb2tRP/VG8PVN0A8oDWibi+yTaND32c=; b=SlhpDtCa/pY6GAsJ
	QzFcpJMdlhHPHa07AX49IklB22FTC6vVsPkVaP8WrUHyPEbDvXoBJRTe2dgue+PS
	CrTOHUZm5E7hpIWnlrLNtVExYcwDeo0l6zgG9NDCyu+6dFV3EzGq1pPITph3L5ea
	0IVcMWQs37+d0Q2Zma7smJZ1rMRzRrGuI9FEtiypJcs9NUcqkxDB8QmRfRXgzBcY
	9T8sqow6ssLtkOOesihxqDRJd+mKx0h4ftlIhlKXolgexiaQt/Hflr7lUvgzQhLZ
	0rjHqPcPkJoMxPzfP9C2kK3RFIX4hgCiiV4N/QAJvWA5cBVeOwfLhjZFWAsxdXFt
	Kfkvtg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rx48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 11:51:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f34c24e2cbso4197161cf.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 03:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767786707; x=1768391507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggDNMN0dkYQ6rb2tRP/VG8PVN0A8oDWibi+yTaND32c=;
        b=PiZfBA3qNPg9RhD2vF7ghYRJaWxF/nG02FhJMCoF5/aqK/lufALI47ktq0YcgzbJ/d
         cAIt+k8xKJX59AI+RtodtZqvj+z3rpAHn5/w08n88Uw0CbNFSG0Bk7DkWi/29A/2sDLV
         2g1xyRafEknQFkbg+16Da2tEdlx1JLCLeZnxQwt0nxbCCPZ/9UOE+rmQfOS5tAQnlaHp
         AE0j4KhM4cybOKMFbGDUwkIMQGnt+WFsdX6CTGzNGGAcDRSf3fTtQ9FM8xP4I83uoCHe
         nNnWIT56tKT57QbwGPTTdkE5QfvbNyIbqQrKJnwo+HCFt8tVeEhCW5oeByQP2Mdh52/z
         6FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786707; x=1768391507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggDNMN0dkYQ6rb2tRP/VG8PVN0A8oDWibi+yTaND32c=;
        b=rSAG0e6BUu0C2fjBG7WlQ/eX9/yfCo8C4FreLMhOf+eOGTLF87bLOCJXFleCDbRhLM
         yMecakfWIPkIWZ9ervOYXXl9yUFX6TyQ+JZye5HhYfL1nsS5PvGWuNcruf4sczTuoUIn
         or314kXShqkxszg9/PhalwcMOFdVJXLYmLBaoMJZxwWf89lQFbUijVKWrW8JfQo5sQaT
         hVdMydo99xq962a5BZlcSIWFxaUvtlV41EgEBvkqq48+D4vLd+PBecmQWPrRSPNfa2XE
         x03FvbSbINbTECMQ2h/4KCI3iEU3jULQFD503l6hDnpwfg88fbT5ULdvIEWDO24CDevO
         Mzhw==
X-Forwarded-Encrypted: i=1; AJvYcCXZsXVbQip6wCs1lkmY1Z4E2rLHzvtn8sV3/RgGrghqg7p3pmz77hsX+gmMucwRziOOndIX1GePYzQUMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVRDcsFpVR9ux/5+k7PdKK9QsgpQCTmcuZHHM89wyqtmdUYjiF
	MxV69snhJRmH7/FJCptVLq1r75Rk0mjj6TcjysSa+calBk+jF22x9+hMeE81cUMaiphHAXOKNuP
	3O1T8DGpurlfnlvXnyCKAUS1qPxZFSOU4HxZ5GNqAgmOLCT68QaI9i0yTNZJzCehfTA==
X-Gm-Gg: AY/fxX7sVmH93ax48lwmKdwo3atgYswN5kWjwQztzl1u2jyHkAj9XgQE2OI+FpZyBj0
	ULfPkdyFNI9rnSdkX4KLVIFZkB6l0KUJUhIY9vqWImnwjjATOAL9oeIPeu/9Qq3shC4t+j7c1vQ
	ST+0zgTWOM3F8/hApVQSIxV2PhXozOHmT/tG5ZTJXWPm59P2KhIH3tZObCEPqwy6tkcnnHRchpL
	QAHzsVu0vmvv7s58HqaXqKSS3HP1o8JqexH1CS7DhYodaU09w2gA6fmx3H2kzXG8vDSzylPLzK9
	v21968OcVr1ozK9RrYuakP5Xvm2UhkthMo2hcSN6le97+lH+Is3yFWaPtKgfh1O4ncbAgTGDL7B
	TLpI4zr6xHSdOFBH/KjlG7VCEKyMR/DLl4uJp1o/mwyH03h5QWEUV7ijv7wUU4lwUfIs=
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr22415601cf.4.1767786707650;
        Wed, 07 Jan 2026 03:51:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4QHfOzO5e2H8yXxP1/FA25p8oojTsuXKqYhEkzq4egd/vbvBMFKsstwG87mx8vOHkZVuqSQ==
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr22415401cf.4.1767786707244;
        Wed, 07 Jan 2026 03:51:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3113sm484555866b.43.2026.01.07.03.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:51:46 -0800 (PST)
Message-ID: <61f3c476-6304-477a-970d-9d77f4f2b32c@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 12:51:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add camera MCLK pinctrl
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e48d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OD7J8LUZfBhgY_nOwAcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MyBTYWx0ZWRfX64VwmHD/NNPm
 a5IWR3mijxtdXiUjIBetk+AfAZxW5L57LvY5nqpWeojJnjR6TChT+t0Hox/IVVDKpb1Dj31y/0r
 rimop2EFElIz5yBx3NIRvi36R+n6rhYYGRDDME5uSDgybbtXT2Y1dpUiopYw21k/f3uBmPvYnoS
 0Gswp53BbX9sgnuoBANYcFxEPPLjb03S5o80vDO8kAs3hsZvtkLQSqK9gOe4lfiIy2QU3fWSqA1
 WNtA7+pJWe3Rnn/v4lnk4XF0qp098x0Ki9giTp4zlaoQOTsZ5uUYtFiZ/q1szaXz4X6EDe8cxsj
 B+Gr6L54N15DmMR3qvBW3fad2YreMf2m3c5+y6xZwqVNlBkFutHy1+oZVqHBSTcdiiXqUwzA9nL
 0lu1V9dY6UWI/btAaYP4qsEwmKfmb7EL2wk3N2DZwIRzDrFOpuLcQJqh18me3tgCAVxPMt7V0qW
 5J9odmDT80c7crKdJ3g==
X-Proofpoint-GUID: O3l1h3xAN9dup6TkUGk7vpZGMvXJhyW_
X-Proofpoint-ORIG-GUID: O3l1h3xAN9dup6TkUGk7vpZGMvXJhyW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070093

On 1/6/26 10:39 AM, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on Talos.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


