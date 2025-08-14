Return-Path: <linux-media+bounces-39871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DD2B25E18
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF0A23BF60A
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 07:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164252D73AD;
	Thu, 14 Aug 2025 07:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FQpcOBij"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA02E7F10;
	Thu, 14 Aug 2025 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157876; cv=none; b=G95UFavcpa3Kx0Jp8mCuUTKSgfrW0IDD551fEWCEKQ29ho2Ha2ZS7nNPT8+x/up7HpjEf7x0afF49tPrmSEug1BxpuIO/Bw6u5lHDgyL9e5m/1NWlBnVKF+Dwd25Ag2b5vIfSOF52AkVUJVNgyXJoTrwe/IoR1iZLte/WTVqQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157876; c=relaxed/simple;
	bh=d1f4mmUw+s4rQ40HwrviQrVXwuM1d7NMgIi8LdtLCFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IWuB72xFyyeDqDpo49daOjkrjKkAXJ4UbYsJwDr2awkrQ7YSNkVzatpeAhKp1Na6y+u7/mdsXEog513ET2lt7YKi+aBPkSRAR5MRuvzVNiCI893U8qAWecrJqSJX3iw6YdjvEqx9q3VIScUhvdTjAi8F16As4g4us9X98OBs2eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FQpcOBij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNM9c2012828;
	Thu, 14 Aug 2025 07:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p81hshlx7Wv2iXZggKjLGGwXSZ+o/tdplFet3Iz+J18=; b=FQpcOBij43kJkvBJ
	XaW579auirQeHP7Cdpa+5KYZm7bUozy2g9RoI7PHi08NL7vbP45iSlKe7TFDvvl2
	rQqEQ5Dw9KnCioh6uwz4N1gXaCXcPETa2oERNxZSVpnVXwzxhKu/Sc5mgYq8FdeZ
	GuqE5aMJFESJuEeQ383TyNyitG1oFhzckXxSkSdtaeRitEIktQsGPbZMGmyT8ozx
	8SDF7fA/RFiakolbKTky2lW++iJMgz23tb411/l7cR/HjRgBA549/TYwMq9NJ+3o
	gFXKVyLNqWyARA69hc1aalmRXjRLO/phrC2lKeH9arab+KrW675Iu0ohZMeJlxVq
	iouw2g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxd04g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 07:50:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E7osLq014428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 07:50:54 GMT
Received: from [10.50.5.139] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 00:50:49 -0700
Message-ID: <a4f05871-0229-8ac6-d2c3-b0dd71a9aa57@quicinc.com>
Date: Thu, 14 Aug 2025 13:20:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/24] media: iris: Allow substate transition to load
 resources during output streaming
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-5-c725ff673078@quicinc.com>
 <24714b00-cc15-4c9b-b0d4-8c76d702fcc2@nxsw.ie>
 <cd2ded3a-ab91-4199-9edf-8acc8d6d11ba@oss.qualcomm.com>
 <11acb8fd-9d81-460e-ac2c-38f370324ea5@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <11acb8fd-9d81-460e-ac2c-38f370324ea5@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXzg8A53NeMbjq
 8M2Bsx1SY16128wd4ZXnQvvRGrKzU2Qj7Tx45VqEKPpfpqKLvFajq8xQ7Do61MCZPozheYg1SxC
 JZyWm9JFu5WWDEEsKDzUG7LAmzMpY9l8mwHf0ZQmyo9bZK9GXtfW2ZZbA+9PFuenTjmLaXJ5cWs
 t0qOeypXC6gAOMFguNSKF+1XKQP26kiG1frNkghZQfcxLInZZPw5fDKVP5Md/cqraIGkSly4l3U
 VMdPE2tYrn793Mi9Iqix9I3rD7kPnZrTvOjProfo6ociqbAEmEq96AxSpj21w2QNoQ+5y96mWZm
 u5Hwt5m8711oF7ly2sdTRSjegbu2/2CK6Sf6Fd2ZVjWAzkP/r+3b11AWWGZ8XafTSs+Wifuf8PO
 fs+RBFMH
X-Proofpoint-GUID: kOPeFGcpcAFlSnOGAI1PaFCaT2jnFDfO
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689d955f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=yK6j1-holOLB1QIQiPAA:9 a=QEXdDO2ut3YA:10 a=1R1Xb7_w0-cA:10
 a=OREKyDgYLcYA:10
X-Proofpoint-ORIG-GUID: kOPeFGcpcAFlSnOGAI1PaFCaT2jnFDfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057



On 8/14/2025 11:43 AM, Krzysztof Kozlowski wrote:
> On 14/08/2025 00:55, Konrad Dybcio wrote:
>> On 8/13/25 11:51 PM, Bryan O'Donoghue wrote:
>>> On 13/08/2025 10:37, Dikshita Agarwal wrote:
>>>> However, now after removing that restriction, the instance state can be
>>>> OUTPUT_STREAMING when firmware start is triggered and substate needs to
>>>> be moved to LOAD_RESOURCES.
>>>>
>>>> Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transitions")
>>>
>>> If a restriction has been removed, has that restriction been marked as a 
>>> Fixes: ?
>>>
>>> If not then we can't actually backport this fix as the dependency - the 
>>> restriction removal has not been marked for backport.
>>
>> Please stop confusing fixes and backports..
>>
>> If you're really paranoid about this commit getting autoselected, see
>> 'noautosel' under this section:
>>
>> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1
> 
> Commit still needs to explain what is the bug, what is observable issue
> being fixed here. Lack of feature is not a bug.

Ok, will add more info.

Regards,
Dikshita
> 
> Best regards,
> Krzysztof

