Return-Path: <linux-media+bounces-27618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3524EA4FEF1
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5858116BF1D
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53645245026;
	Wed,  5 Mar 2025 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dj+2hbm4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E03F2E3396;
	Wed,  5 Mar 2025 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178743; cv=none; b=jFK/5KlBPKSv/8Z1N7FQ8QNqsNY0nK0JSo8OeNKylmmOVxA4DFRblX2tGTBnQSw7vfvSnTvQ04qMYtus5eknnl1NGiDrHZOWkvhcH6d8sGDitIby5tTBEvrEDsiThgYL7IRHwgwk5RQ+3b+zvffiFcoAdPhhK6xM7S4XqzS9Xkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178743; c=relaxed/simple;
	bh=H96G30ENaGwtDAr/tuCrMCCUC+3thOBRDy1f+clwVXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kpQ0RwmFScaFtIYNZglAd0ecEE6DNn0HM6h0el2IQDRzFnne8oimw47qrOHGNPMqYizBByw8/3f3Yr+UE/OiAjnCdWIJjFT7Db/3bbcOQEMFV4+jiX5WetSVLInPRo3RBWY6qBjrzet/If1aRtipjTLiz2+Yasj0jbXGguZC2T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dj+2hbm4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525Abkpc001816;
	Wed, 5 Mar 2025 12:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpGr/a/pGmwJPnYM1jBEjOHF6XQ+p0dgaV4nasqDDCA=; b=Dj+2hbm4OHM5LmPY
	5ZkT5ClQn2PGXUwqnUk4y6ki+sgq7r4XoxwZyFU0B1tyJaB/ThVwrKfP+ia3VEsr
	XtZ/1dTRCVIqYMxBRT0xxKhzLXXOzBOCu8Q8hV7PO1us+fBEQ+pZdw8oZ+ENJPl6
	kSABK8hy/ZNdeg/4RW6QBv8lKXFoMnlVUJwwCMaFql2yieaS2BmxsE2f2+x+jYgI
	ulzFyfkcI82QHiUXlxo0ruHWNv/em9x2KmJLQRo6S/tNsCQTeZCjPvIaH/5u3wNE
	5/UL749tM5FaPZK50GaD8JwVj6mP7ruTCWkepNp6WlsVACOxUUDdskeOXUYbW2XQ
	udOxyg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t5ba9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 12:45:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525CjQCX012167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 12:45:26 GMT
Received: from [10.204.66.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 04:45:20 -0800
Message-ID: <b3203de4-e888-41e2-80bd-0d60fb8c520e@quicinc.com>
Date: Wed, 5 Mar 2025 18:15:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jorge Ramirez
	<jorge.ramirez@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
CC: <rfoss@kernel.org>, <todor.too@gmail.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
 <20250208225143.2868279-3-quic_vikramsa@quicinc.com>
 <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org> <Z8a7cMmxJuHIhgjo@trex>
 <baae2a56-5299-486f-acf1-14fe13fd2f81@kernel.org> <Z8a/Dk7zjZ7RQT2/@trex>
 <f5c2044e-e78e-4839-9c29-63610ff406e2@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <f5c2044e-e78e-4839-9c29-63610ff406e2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rD_VuSdeuzspbz4UZ6s3PCFXNPCktPxg
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c84766 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=5jREd-yU2LfHNI075jcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rD_VuSdeuzspbz4UZ6s3PCFXNPCktPxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_05,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050100


On 3/4/2025 3:17 PM, Bryan O'Donoghue wrote:
> On 04/03/2025 08:51, Jorge Ramirez wrote:
>> On 04/03/25 09:40:21, Krzysztof Kozlowski wrote:
>>> On 04/03/2025 09:36, Jorge Ramirez wrote:
>>>> On 03/03/25 18:13:20, Krzysztof Kozlowski wrote:
>>>>> On 08/02/2025 23:51, Vikram Sharma wrote:
>>>>>> The Vision Mezzanine for the Qualcomm RB3 Gen 2 ships with an imx577
>>>>>> camera sensor. Enable IMX577 on the vision mezzanine.
>>>>>>
>>>>>> An example media-ctl pipeline for the imx577 is:
>>>>>>
>>>>>> media-ctl --reset
>>>>>> media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 
>>>>>> field:none]'
>>>>>
>>>>> AFAIU, camss does not support SRGGB10, but only SRGGB10P.
>>>>>
>>>>> Based on tests reported on IRC I think this might not have been 
>>>>> tested
>>>>> correctly.
Hi everyone,

Thank you for your comments and discussion on this thread.
I can confirm that I have verified this implementation using the same 
steps mentioned in the commit text.

Here is the sample output.

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
Device /dev/video0 opened.
Device `Qualcomm Camera Subsystem' on `platform:acb3000.isp' (driver 
'qcom-camss') supports video, capture, with mplanes.
Video format set: SRGGB10P (41415270) 4056x3040 field none, 1 planes:
  * Stride 5072, buffer size 15418880
Video format: SRGGB10P (41415270) 4056x3040 field none, 1 planes:
  * Stride 5072, buffer size 15418880
5 buffers requested.
length: 1 offset: 3791353960 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffff7eb7b000.
length: 1 offset: 3791353960 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffff7dcc6000.
length: 1 offset: 3791353960 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffff7ce11000.
length: 1 offset: 3791353960 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffff7bf5c000.
length: 1 offset: 3791353960 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffff7b0a7000.
0 (0) [-] none 0 15418880 B 114.742722 114.744108 20.839 fps ts mono/EoF
1 (1) [-] none 1 15418880 B 114.775069 114.775932 30.915 fps ts mono/EoF
2 (2) [-] none 2 15418880 B 114.808401 114.886861 30.001 fps ts mono/EoF
3 (3) [-] none 3 15418880 B 114.841923 114.899629 29.831 fps ts mono/EoF
4 (4) [-] none 4 15418880 B 114.875247 114.949205 30.008 fps ts mono/EoF
5 (0) [-] none 5 15418880 B 114.908511 114.963073 30.063 fps ts mono/EoF
6 (1) [-] none 6 15418880 B 114.941727 114.997570 30.106 fps ts mono/EoF
7 (2) [-] none 7 15418880 B 114.975066 115.011758 29.995 fps ts mono/EoF
8 (3) [-] none 8 15418880 B 115.008486 115.047468 29.922 fps ts mono/EoF
9 (4) [-] none 9 15418880 B 115.041750 115.060305 30.063 fps ts mono/EoF
10 (0) [-] none 10 15418880 B 115.075060 115.106941 30.021 fps ts mono/EoF
...

Best Regards,
Vikram

>>>>
>>>> I acquired SRGGB10P (10 bit packed) frames from the camera despite the
>>>> pipeline being set to SRGGB10 (16 bit) samples.
>>>>
>>>> so something does not add up.
>>>
>>> Then the commands are actually correct, just the camss or media behave
>>> here a bit unexpected?
>>>
>>
>> setting the pipeline (CSI) as SRGGB10 (16 bit samples) as per below
>>
>> media-ctl --reset
>> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>
>> allows to capture SRGGB10P samples (frames-xxxx.bin files contain 10 
>> bit samples for the size)
>>
>>   ==> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F 
>> /dev/video0
>>
>>
>> shouldnt the CSI need to be set to SRGGB10P instead?
>>
>>
>>> Best regards,
>>> Krzysztof
>>
>
> No an internal media bus format MEDIA_BUS_FMT_THING is used
>
> See
>
> 87889f1b7ea40d2544b49c62092e6ef2792dced7
> 5480b0c67f120a6c293cc5eff72fa1d6a74de504
> 3c1dfb5a69cf836f513a2a49113ee946a4b9d95d
>
> Yavta is specifying a v4l2 pixel format SRGGB10P which then gets 
> translated into a media bus format MEDIA_BUS_FMT_SRGGB10_1X10.
>
> I'm not sure what the historical reasons for that are, probably good 
> ones.
>
> ---
> bod


