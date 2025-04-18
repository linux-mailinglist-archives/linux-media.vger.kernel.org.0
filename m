Return-Path: <linux-media+bounces-30526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A266A9336F
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CC504477BB
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87879269CF0;
	Fri, 18 Apr 2025 07:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nmF1F4xI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72D8C0E;
	Fri, 18 Apr 2025 07:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744961362; cv=none; b=p8vqzjZRHpM/CIKLKZSmO45OBCD2acQfdKFtt/jwrjVyVOUKSWjk5Ekd092DpKIH5C5p5hZQn27XqcoJysQMcbYR2T1tnUAQNe+s9iElxTSyvgb6L+UDBWk1wEtbIwb+Kd8pyH+EpUxBFKCfz1NsO9JwJTbroy0ESxdn9hfKp94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744961362; c=relaxed/simple;
	bh=49VNuVmkw9o4pRlMwp2CRvW5yS2aKlA6AGaF1i69I+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CWwUtIZJ38TeDBYIvNM8PDea/5p6Lhty1epv2cEfTRvUYonnpdOpqVF0a1ii44CDUxyU/zO77iHKx43FSO17oY7hW9RQ6GeMMge31yYPrc9VSi5LgTcSnuS11NO3uXAj9MLaVYz5kdFm/crOjP2wgRoirpsXAXuDChK8gQ5nPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nmF1F4xI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1f3mY001224;
	Fri, 18 Apr 2025 07:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E6kfTTUe2SJkB4ocesJpwtBEmUKPSMD3W1XeWivw2/I=; b=nmF1F4xIxhQm0hyJ
	XbY1M3Sad6aol6BszePs/4QkBJCG9tNCfMhZcpEK8ffckihH00Vtb9Oz11HiWCm7
	YQSMP149nsPcu/6VMvQIXqz/a03PASFoVwIw6S4uHnfEBWNnDBBOwrvbhla7Ivca
	OFwpLbWJzhyn3hcXLD6cg9dRNqCzwl+PMFKvHEReioOsGq3nSY1RXJFj8ZFlcNwy
	Jm9T6XfaoEekrO6zP4m7d+m8pxT94037+Tk7kyp6DEm8lDW/j0YoNjNm8rtpkRBv
	e102n4bghR289babDy+ndzt/6nIjowoQDzW0tfx5eeYtUQfgZhUXnxBqlHAtePfC
	/LllWA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjhjth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 07:29:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I7T4e7024662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 07:29:04 GMT
Received: from [10.216.47.89] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 00:28:57 -0700
Message-ID: <7fd92093-3efc-4f24-967d-7e267162b26d@quicinc.com>
Date: Fri, 18 Apr 2025 12:58:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
 <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6801ff41 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=7gLDDzRWUVhiidtGMTcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NFa8SKs0Fzf1ME-yH9sPgRCfNjok_44g
X-Proofpoint-ORIG-GUID: NFa8SKs0Fzf1ME-yH9sPgRCfNjok_44g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=936
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180053


On 4/14/2025 7:18 PM, Konrad Dybcio wrote:
> On 2/10/25 4:56 PM, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SA8775P.
>>
>> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
> [...]
>
>> +			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> 760> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,

Hi Konrad,

We cross checked internal documents to confirm IRQ number for 
csid_lite2/3 and vfe_lite2/3
Calculation for IRQ number is done with respect to vector number as
irq_num = (vector - 32).
csid_lite2 vector -> 791
csid_lite3 vector -> 790
vfe_lite2  vector -> 793
vfe_lite3  vector -> 792

thus irqs are as
csid_lite2 -> 759
csid_lite3 -> 758
vfe_lite2  -> 761
vfe_lite3  -> 760

Please let me know if this looks fine to you?

>
> 759
>
>> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> 762
>
>> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> 761
>
> Konrad

Best Regards,

Vikram


