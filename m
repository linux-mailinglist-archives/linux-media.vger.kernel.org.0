Return-Path: <linux-media+bounces-31592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E068DAA742C
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19AEF1BC0FF8
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 13:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80BE255F30;
	Fri,  2 May 2025 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sm5g3zs4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A5815A848;
	Fri,  2 May 2025 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193735; cv=none; b=AlMKnq2Pl2gqssrX9aptCupSGf1LquwzBOykmtfXvW0BijsGzCXi5jD+6GVicHN+CAboHFdRCo243CEhTu8sYUfKizTHXAhrhxmP5wITvSjNtUlj3JDHzkkLKfGeukQo29Blko0sp35RbfkxtBOVsKCjcs5VOqk7jC2LYLPbjug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193735; c=relaxed/simple;
	bh=3v7s2BbaGeQNccalyIeC64GfvVeKFNjQkG7SwA9ywts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mApRqH4rxmvKZDtENMyEsfsmroMDqzvpuLIJ4fLrUpBPpFYzzpxmZhHictOpGwxj/tDMYcXXC4Yqq61ghCABDrJLkDWtbnhOVN0MkUgEGafbTCxxFx4imOF0Bn7CSBU38TR/amYQooTkLK3X4klgQvkCYcoUnTrUFCSSqBFQI9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sm5g3zs4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Cd1ff016233;
	Fri, 2 May 2025 13:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tulg1EJFRJb/VsCslzzCnWUmEyBCaO7M21jZGAXvcTI=; b=Sm5g3zs4xOXBqPGI
	tjGsgb+E314vJswZxMFX+Aq4zOW05B6MZwLSJIbBigHBNtueEGl3Y/A2seIGsJiV
	mNw0127N8bPiYcUJn+smWJpKdtOzyyDzpeOGTfT5ku1gniZEJWHkEvPqnnBMgQXt
	D6JgokPjeHLqCL8IMTLkehKoO9pG1+CpLYTOevX9dKoiPzZSWlueyZzMaNX+Un+W
	si7f4hNzqt+LbM5lrgs4Xc8xZyzdZfPE+jSefUuzs5Sdc0qXdv2vFn7agEU88ai9
	Yrw7hAvGs1w/mbACDxhO+mQhvfsnX72k11zqlSl/iMgHg1L49krNbIv3sReGWDv7
	jQfrMQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4ggya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 13:48:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542DmmjX006169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 13:48:48 GMT
Received: from [10.50.25.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 06:48:41 -0700
Message-ID: <d14e93b5-5bf6-97b2-a35b-c8f05665d678@quicinc.com>
Date: Fri, 2 May 2025 19:18:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 03/23] media: iris: Avoid updating frame size to
 firmware during reconfig
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-3-552158a10a7d@quicinc.com>
 <0c09f19b-dbf6-401b-bf4a-8e416487a34b@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <0c09f19b-dbf6-401b-bf4a-8e416487a34b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7ToMQ9cU0PJmm7BnR6f-8whltnB4kcYY
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=6814cd40 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=CLQzPvPphrPxIyWN1zsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwOSBTYWx0ZWRfX76CbQpqSRmPB XDEZS2iYOQyDZawZ4Wo5GEna6ItaCE8myPeHiJkqTBVcja5+ZcQFeucC/Zi8XdfZQtEd2zRc22f Zh64buv9nfvqpfuzSTbg4KhQtdXaRdN5rW+HJ5Y+mjgFT/821PtmB42rZy7S2+ODssgdBnAdnYt
 7z3gQOGctspYxDwhcGX8qhZzvE11voYengec1DAM1Jl8opvXQtm0DMH0Bce9MTlv6+Bclfjj07r 71UkUrhUr9pB7qI5fkaWzKr8f1Yz6QHGEEhImgMaq0L1G9ZfduwY8zez6dJ+RdC+pSBwlEQVLFK 0RCiWIkEl/vmraTXrFhl/Xv55qyrABUlFuFfuB+8uxSBQM8HQgZ5PM2dFF4Em0/jirCVdT/Flar
 bTXSWmsK/EbeTudwRtGEamQYfYiwM4AZqkp0hr4JRyeMrme+xcxQ7MMDt8qWfBkXHEJ0lznW
X-Proofpoint-GUID: 7ToMQ9cU0PJmm7BnR6f-8whltnB4kcYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=962 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020109



On 5/2/2025 5:48 PM, Bryan O'Donoghue wrote:
> On 01/05/2025 20:13, Dikshita Agarwal wrote:
>> During reconfig, the firmware sends the resolution aligned to 8 bytes.
>> If the driver sends the same resolution back to the firmware the resolution
>> will be aligned to 16 bytes not 8.
> My question here is why there's an alignment mismatch between the APSS and
> firmware at all ?
> 
It's not about the mismatch between APPS and firmware.
It's about how firmware handles this, it's not expecting the driver to set
the resolution after reconfig.

Thanks,
Dikshita
> ---
> bod

