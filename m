Return-Path: <linux-media+bounces-34240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8628DAD0212
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1659B3B2371
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41492288C24;
	Fri,  6 Jun 2025 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HLB8+8Ij"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FAD288502;
	Fri,  6 Jun 2025 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212093; cv=none; b=gOMKFLXhPSJH8HuxFfh9ATfHVrD3U4Ya9lDOkhmJqDr+w+fWfwlzMh/aRV5tVM67FWFr17RSnhgRXrfdvjlSFDrfNC5qsnsPM+NYsa4YxmWllsVPXGTG48yjJ/jnOhGQZ3OhMD79cjwNtnl83iaq/1QSiRkkWZ1zmZPQciS6qGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212093; c=relaxed/simple;
	bh=mtgxgmQj9UsAIjld1jEoGHklJSbnp3mdxv/uCwjRC2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k0yw8SyIHanTkNQwbjV5gtXLXmFwCx5SoODT6PCU/X6Z7HkOrZ94s8GEa83DR1xTAq94sQdrM8Pen33zbb+fzwjPbMBH5syGZ7cKZFiW/k14XCEqwdLt6krAxUoGwS3D9VKDbvKyTxaIaMkHDUBZuoOLHlhcNIAyoAu/U6uG0as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HLB8+8Ij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565om4Z000698;
	Fri, 6 Jun 2025 12:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwrKf8yqUySqbxxRz01I60sgUIGjMheqGVg9YsMRg6Q=; b=HLB8+8Ij6VqLJ3/2
	EnArVlSGo0R2zlaXu4+OLckvxFxrboK896B7DpWmhoy7+7PInhaI32KIO0mP9bUj
	SY9VylafqshnZ8dQ5uJOZhohSpOZitg4bVpqm2TMs5teOCWiHDWMs+Q/s5BBUT2s
	+l2GUYxL9WuEjOcCR0lSyljPQAdIknB34ToSikp3XEpAJ5rMYaxEeWFKq9howdJ7
	1iX20kF4OygeuPDBRG+/QyPxPtDnym3L0oSAk4NGlLrqrCDSWqWrcy2zQJtv6QV1
	xrpzkzMrvw4NPdkCaZULvLGCbSCayWREeBbAk2ffWWk5XqHZmTO98Mt4PWN0ZRlI
	nUqgkw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qcjsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 12:14:42 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556CEfkM029835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 12:14:41 GMT
Received: from [10.50.32.91] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 05:14:36 -0700
Message-ID: <b9b456bc-beb8-769d-5f9f-e13b8860e659@quicinc.com>
Date: Fri, 6 Jun 2025 17:44:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
Content-Language: en-US
To: Arnaud Vrac <rawoul@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
 <btmzhyullmggev43b3syp3anxlm6o5mpz2mthaskuyl7kfx5gw@w5gesyaaytkh>
 <CAN5H-g7WLsowjW6CMee5T=W4Lmia9mLWGgX17-mOMjtBo2SwvQ@mail.gmail.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <CAN5H-g7WLsowjW6CMee5T=W4Lmia9mLWGgX17-mOMjtBo2SwvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YwnPuJr7CnCxkMgAFEX-q91f3zjxvMWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExMSBTYWx0ZWRfXy1SqOKzBuQZ8
 Mk2qGb2tJd5PPU+3Jmj9Rd61ebqIPDk3JIkGgg3IHJzeJnYA8u7YBfec0xa5518hAybE42BABrT
 m0TYVHDEVjvu1mkZ6qRe3/GLWA3M5qbG1pbut52Hvl7UonzKMnUplOdv4gGaLRkj2HhOh0HfipR
 Zgs/iN/RBWf2z6fDl2iCvNo+sSf6UoTipWfeUa79kBCa28Ojo789qJNfHQ5pQKceNEQCVnV7JM2
 hsHQrJnz/iROJP0KvbdfGpvKFHh5f7HDuuc39/EEVW9ADhiKCJIwgq0eBxXOQjyzuxOxR6USeNq
 XyUW6K+jT43GNPlVQ+325GV3KeyKy47i2fP2T60IsDJ5KQYx4geXTC289csL8TNXiMwA+TMSJJt
 GSAWbNtuC//tz4zRdg5HLMDITBRi0FiK0i2Tftfex4w6yfLmZhoWHR+S+FjiAdn6Y1fVoQJr
X-Proofpoint-ORIG-GUID: YwnPuJr7CnCxkMgAFEX-q91f3zjxvMWp
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=6842dbb2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8
 a=EUspDBNiAAAA:8 a=RZ-WPPcT-TtWywBDAlgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=994 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060111

Hi,

On 6/6/2025 5:29 PM, Arnaud Vrac wrote:
> Le dim. 1 juin 2025 à 09:46, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> a écrit :
>>
>> On Sat, May 31, 2025 at 02:22:00PM +0200, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Fill in the correct data for the production SKU.
>>>
>>> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>
>> Verified against msm-4.4
> 
> Hello,
> 
> The current values are based on
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
> which we've been using in production for many years.

I see -v2 updates these to 533/444/.. MHz [1]. If the value changes based on
board variants, these need to be picked from board DT instead of driver then.

[1]
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-v2.dtsi#L1140

Regards,
Vikash

