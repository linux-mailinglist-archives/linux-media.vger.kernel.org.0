Return-Path: <linux-media+bounces-25838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F17A2D959
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 23:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F40CA188864B
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 22:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3755019CC33;
	Sat,  8 Feb 2025 22:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H+7qsoAV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBAE1F2B86;
	Sat,  8 Feb 2025 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739054213; cv=none; b=qhhdWayng9viBIfwvMtCVYErAMRkdx6pDMrYQopZMS5wtomEajw8KK8u90ykuaBYGEl0fOfCjQxUL4CQNA6dbvd63j821601aADL6E+C5ZS3PcxqTuPmFubkiSAv9mzDzE9ksOQcFE0k0rEv5sL7aMJXnMtjVNyFGsy/JQPo8Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739054213; c=relaxed/simple;
	bh=VQq0CuEMnmSKCHc6HGPhwuJv24KEQFftDUrEASK1Nx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bmfWzETHVwrYhGG9lNkRRuCper28QSm1OJ63ql+HKvvAWrnd243ps0WZ/KdFFsLDJ8s9WIpdXsHrkBi4GpaIzNItL2BBJDt5m1zHk3ndRdwNl6Ku/imP/xNJkcziSLH2XfYnCPEJgWYOYQ1e+kkUmBId+r1CqYwg+cEGuD/2xSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H+7qsoAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518LiDZg012759;
	Sat, 8 Feb 2025 22:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtHV6GYiZiXoheP2pg52NqMdS62PbfoLAsBzjhraaF4=; b=H+7qsoAVDTw05zHP
	Kd9DSKP2SIeGIyZ78KRrFE3c7+ueKaakV5eFlUW6QxI+O+/fM8Cr+xseyeR9oVPW
	rME8G/eDO23UswXGTnGAM1M9vwMIkxyqfFpqEU1In7WekU4fjumW+dkJY+lp08kH
	Badu1nDI8TjM8tzxIqTKIsUpR0fCVeSMlayv3SCB+Q8kYu7MtJ0PI7tTCPV0jOuT
	n4uTNx+Cj+1A9DNk/EJHF+dDC4S3fadjXqRc+fEwP7SjkpOUpvEYeSRG8CgNy8rV
	y0C7GPHqImHbw9Sx2nvYcUy//iyQU5DwxVzLOvVQTshHkHeI5VgLndncvqbolG0c
	k7SVJg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0gus7vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 22:36:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 518Mad71028838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Feb 2025 22:36:39 GMT
Received: from [10.216.46.231] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 8 Feb 2025
 14:36:32 -0800
Message-ID: <d72a1f19-d1b1-4993-bafa-a97ad6ce4bca@quicinc.com>
Date: Sun, 9 Feb 2025 04:06:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] arm64: dts: qcom: sc7280: Add support for camss
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250208165232.2371889-1-quic_vikramsa@quicinc.com>
 <20250208165232.2371889-2-quic_vikramsa@quicinc.com>
 <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _HEHIkyZ8KswzEJamX-xHHnkjhHXVX97
X-Proofpoint-GUID: _HEHIkyZ8KswzEJamX-xHHnkjhHXVX97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_10,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=914 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502080194


On 2/9/2025 3:46 AM, Dmitry Baryshkov wrote:
> On Sat, Feb 08, 2025 at 10:22:31PM +0530, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SC7280.
>>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> It was impossible to get these tags in this way. I'm not sure what
> happened, but please review them and drop incorrect tags.
Hi Dmitry,

Thanks for Pointing this out.
I got RB from Konrad on v10 of this series for this patch.
"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

"
To post v13 I fetched v12 using 'b4 shazam' and other one got added own 
its own.
Will fix this and post again.
>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 178 +++++++++++++++++++++++++++
>>   1 file changed, 178 insertions(+)

Best Regards,
Vikram


