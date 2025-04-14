Return-Path: <linux-media+bounces-30183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB4A884D4
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67932560831
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A63028E608;
	Mon, 14 Apr 2025 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUZxv8Ki"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79828DF12
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638537; cv=none; b=gFGIlMb20EgQux2rutkwlEv7dLqiPPQFQ54ohLFyF06kQi2y4MWBeVnAcpeY7HRGf6UsE/YiEyLgWFkK5b8H3en7Q8ncDLevzicxUyx8AEFqEt+1PqYiq+r3sqxOAF5PcyHu2mT4JRuj1eKQmT3POMl5zVFn9gNnPgH0hHy/LLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638537; c=relaxed/simple;
	bh=np9hmuuv/xFfm2pC735FXo2uI8JBzBXFBa4WLOBK+kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDORR0iu7vvF+Jotigzmrf+BBnT78zEu+TpvFfVFhnBcP0kFuyvsi+ElJJqgygisiH9byGY52TkpV0I4WWwLXw467BoPV4i8fC2OjR2XuxHh5AHRLA33ufU56wNghzr7q2LLeH+ZjIihxpnhqkSZU7RYkyCt9jBC59Eu7RvCG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUZxv8Ki; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qPT016554
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 13:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KEpYH2fL1hZL343CQIkegiAhh7VDBORXCRTiifeB24=; b=cUZxv8KiEnifrGyg
	NPkbNKmnHQrRHd/LGWOuhOoRpWONaljJkArdhzfyUj2kGWz6bIni3rJTE3ov6OXU
	AqFu2ouknX4VOljQHsMZGnwPhkDskIzY7nssZhRwaAdLnokCgcF7Ccp9THO1sE/D
	dmtD5iyiD0rTAUdbjIKxDUbENI2SAjwkniQ1bYChm/oi7FYC4O35+4xL4Oulp5sB
	K9JrHUpHwh0zpmnuxgthNYhywKyJ3z+LctE4vPcGJ2xfZRktgPPqLLpCazkoyMul
	ZYuXQ4wfbHpfROADIIfb1O1jU1YiZ8Em5VhLhK2F6Vfw5pd0VP4B12iWchtclZcv
	w+KCgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69msfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 13:48:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so104256385a.0
        for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 06:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638534; x=1745243334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KEpYH2fL1hZL343CQIkegiAhh7VDBORXCRTiifeB24=;
        b=h5TXYBbKHfd9t9Om33dW8d9y9Hf070dQbDaFHAGH0srC6OGkRqaQBhbL5UWpBx9ycU
         VBt8IASSf69El8hpGmWAh2JGiQhLaKGwoeyeHmBt91/w0icOlWei+bG+Ll4PAmAcLUrh
         9AwJkp1sgCXVc1hJsUqN7RFQlUDOGxRxQ8Jop6H9QT4zyohiLqQ4YoAB7lIjY2kqDKG9
         OtJKl5AzaCAk0k5HHZZ5X5u7CGCYvrHp0jO54CzMH6r4cVBebHx+0SttBK/UuROd49Ot
         sBD+r4ZAQ5lI2frYour0QUETHemXd5NAIy3+JInul4egLu6MKO6+f72BMabZEKXERq25
         WM4g==
X-Forwarded-Encrypted: i=1; AJvYcCUxAyWLTlqNjxvKKtB00LFuEbKd3VjJCuT9hD7rBpXxVna1RjXMj3qKqeMawgNBaHGmMZ0+DXKPwa69mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtyMjHxw3qDB8N5zzJnJi0uZ5t0jAzcGTUVHCLCPRBcpg9gvbu
	C/VAlhHbB9KTZcJWpHyHdr1X+vHHJUP8/0oIuGDZu1Q59ir4EfnwzEQQ1+xRVaHX2NZnEei/laS
	WhjXhBb1LxwDrwJp0FCW6qoL/bDFXsJS2AZy4JUP/itsXD76WMM3OblhBVPVH7A==
X-Gm-Gg: ASbGnct+PSePBNwergigC7XvRJuvCtZQqa4BqVhdHQLKmfBMQDz67leS7GxZ+IcojQu
	irSORl3rwgPZehlz37pSruAOEOyqYzNG985gK8rSKbleya41Uop/oN4Zo2VPkpwPYk29/30ZJMH
	bMRZDdB1EZTYdf0cZFYBR2ivD35282Yi1NXxJ97Ez20wkayP5LKhlD5lYaZl9Yew4m9l4alNlj0
	nD5lwIeTpxR+x4PGNDbol3hO5hbUZo7PKyiECAulDeCd2J5mIfNsfuDWJF+nXIJ0Vn33vJIpudZ
	LcIAsd4K5G8NnZELjWPbANpE5gAmk2mglxZrBtrX81VxXl7QH0y8okuv+6LTew9OYg==
X-Received: by 2002:a05:620a:2991:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7b1af90a8mr547103285a.15.1744638533657;
        Mon, 14 Apr 2025 06:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX4O+qSr5lYuI0xXci8UwClLylPYXi2as5JPMMjmn1VLvTa5A/AYniUqnKC46HZ2UH6QSe5w==
X-Received: by 2002:a05:620a:2991:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7b1af90a8mr547100885a.15.1744638532970;
        Mon, 14 Apr 2025 06:48:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1c02227sm905491966b.81.2025.04.14.06.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:48:52 -0700 (PDT)
Message-ID: <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:48:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: txiAwTSe8klt-vScCFvVbH9Z4Ibt_Ri5
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fd1246 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=iMC0Jze56uYpCOfz6HIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: txiAwTSe8klt-vScCFvVbH9Z4Ibt_Ri5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=743 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140100

On 2/10/25 4:56 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

> +			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,

760> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,

759

> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,

762

> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,

761

Konrad

