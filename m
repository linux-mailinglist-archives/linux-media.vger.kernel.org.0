Return-Path: <linux-media+bounces-44728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B31BE33A8
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EF3AF3578FF
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8860A31AF00;
	Thu, 16 Oct 2025 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VoBrqAAm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD512D2495;
	Thu, 16 Oct 2025 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760616343; cv=none; b=IYe7iZeEd2qwi0b0j7hR0bj9eYxjIHyIIFhNw71LxdFXj7wWSoNP0q+pp8VxH7LsUMrBJvqQx0ZP7+puLiL4tkFCQZ72YhR/eau5kHxfykh/eOQVy8ezOfdFvkP6WXMuS5UjxM/TMGe7oJ/bh00PkDuphf3hlcX26zN/ZJf/NPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760616343; c=relaxed/simple;
	bh=8id0PN9NwtaDE1YNWuvQqdoP0Sv1ZveE1XQPMUhj21Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=FxmpsJT5PeZhMlRoAs5Lkl6QxaRxI5aNZeTrNceS1/D/AEUJs630GiYQpbLRY73uJKPV0f32MlaI5Cn7kj8ATF2l3W41iKM4c+vmMhh4N8aoGxAmY54/lrZZMmUnWXATrP06sWAj/w+Xc0JqFNSVKJioAg+LYC5QMdMAmP02pyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VoBrqAAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G77sHu005001;
	Thu, 16 Oct 2025 12:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvoSKz71AeJB3FmDV9/WVI5MlwEGscBdTTKI5p+NKI4=; b=VoBrqAAmd/yB9cwk
	aNQcfptnNbVzWU9I82rSCgY+UVr0BaQNF5e6kzqlS7etwXmeHDoQmTrfwEh4Il8D
	j1G8DMBw9vwzns531Ixw67GVLOfh2eywk0obxkO2UQyBBnd6M35SC4Tv+Z/oxi+n
	JO3CzqxhHKoJuOUuN69FvNI7qmKxJ2dZuim7MoTu/Kqeqn2qjns/fw9mXaZsdjst
	NuHsGBdUA/PsRgOBf+s5c3V8F1pabbr3sMfZuu/s31MKnTcXwQ2qaEQ6WFCb6TY8
	7oX1fPSTLWHQzSEZUg3xGGJ6Stbg61vSIYQmgQhNHKF/7kXpvPi7spQNEvTOMaos
	Ux5qZw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwtg3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 12:05:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59GC5UiN021096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 12:05:30 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 16 Oct
 2025 05:05:24 -0700
Message-ID: <e0e0fa36-b75f-4d04-b179-772fa4b9d10c@quicinc.com>
Date: Thu, 16 Oct 2025 17:34:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ravi Shankar
	<quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
 <84f17b74-a3ea-46bd-a6d4-efa79c1cb43a@linaro.org>
Content-Language: en-US
In-Reply-To: <84f17b74-a3ea-46bd-a6d4-efa79c1cb43a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXyC2scQI+afb8
 2U6Dfwi2UZ+V9F6Li1agMvVT5qT8ttXozssBmzcYCEwhsP8KOeoHcjy5Y8xkb6s6UgTQmDw09zH
 YQ97GGOPuadhSCod+XVpM1E7B6U47ZbQ4EynBQD7rliYij+Wnf5bQcb+cY4QBbpRAxnOIEKlTIQ
 o9gLH/xpvuGP6vkoqn19Nl34xHi1lhm7eLg37+vqD6pHFsci4P95VZPMLdF1bX0kg+lEp+OMoeN
 UCNxa25CTG4b7VTcbt2X2l37LGkl19v+4bc/CUPzB22xZnbwVukVYL2UimnjizrReQmZb/wnCFh
 lWlg1rf6i8h+P8u3gS5WK4uXMFgx89kDF2Yn0GaMgUChvX3deIA2Zmo05EzTOOz1vIVWbaBcwD2
 xgEFTFg97W3TG9wPV02VeQ2t7WkMsw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f0df8a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=GvJNRsgozTBLNSz4xL4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: l8C571CAF8e22iQg4uf-GFBjzsL2r5pL
X-Proofpoint-ORIG-GUID: l8C571CAF8e22iQg4uf-GFBjzsL2r5pL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 15-10-2025 19:12, Bryan O'Donoghue wrote:
> On 15/10/2025 14:13, Vikram Sharma wrote:
>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>
>> Qualcomm QCS8300 SoC contains 3 Camera Control Interface (CCI). Compared
>> to lemans, the key difference is in SDA/SCL GPIO assignments and number
>> of CCIs.
> 
> Codename should be "Lemans" and since you need to update the commit log for this it should be "three Camera Control .."
> 
> Assuming thats fixed.
> 

I assume you're referring to update s/lemans/Lemans

Codename for QCS8775P SoC corresponds to Lemans while QCS8300 SoC corresponds to Monaco

https://lore.kernel.org/all/20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com/ 
Following the above change,  I will update the commit message from
"Qualcomm QCS8300 SoC contains 3 Camera.. " to "Monaco contains three Camera .."

> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

-- 
Regards,
Nihal Kumar Gupta


