Return-Path: <linux-media+bounces-30785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D12BA984BF
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 11:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DD305A4EC2
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 09:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14248242D78;
	Wed, 23 Apr 2025 09:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pJCnfid6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B322F777;
	Wed, 23 Apr 2025 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399044; cv=none; b=EU5Cx31R/E4Vfx005qte+oUzdgDvI1E5aBzvcDfHnp8mLJrsUFm4PrQlPD4wq3UgjadgOt3Q33Pk29Gi9ucYuxTQtxpHEraNWUxm0e1D8HdFVUzslSlVfOvj68xyirNXXo7WHCS3RZy9cssfHasImgLCB/jwlkYALy1glHbSRrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399044; c=relaxed/simple;
	bh=UKG0SWpe3wrN9TMfb0swq9IeQhpRrAdxsLuYbpFHync=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NaGgjU+igsfZjRqXRq9VBu4t7NCRYjlSsT0mkPM+633ltb7NdJbVUBCKKSUMvRwzk0zWJNxLKM5PlxSFsofRIPqfzvSXTT9OcA1rwxBGrxr/LQfl4xHzGsEOLXS5ayIidsVvupDxPhMuxpNFMdWULLw/W7J9OBKYivj4LHWE238=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pJCnfid6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iHBd003741;
	Wed, 23 Apr 2025 09:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NzT+AWAbNul4hYNvMnTLGS0CCMqUZRzSvpmyLVNJo3c=; b=pJCnfid6Q5p+xzcl
	leyhJYP0htROVjaD5yRBB4l1yKiCofE5J6WIwjouA1nSsFop4ksSUFUIJLfanlrH
	OCu8DEiadYoClXiRL7cw60b3GrcNWMu9o0fpWr5wvLTV6ByIdB0/cHEbJCPWvyav
	CmrfmcURE7URNwXa8tU72TzWdMx9Qqy77tzXjl3/lE915pZ8DDBvtXYxZhZyxIo5
	B7cd+2u4Xyc+FujEZExdZR1HwsuimI/6jZJdrHEufKoIBpouY3VTsQR2ucKtrqgY
	Ha8OxTvWS1vLLyDrtKY+F/kJpMqxnFPcVq1A8BGnudQaxtYEe9gCvtb53je+KTjR
	Tt6s0A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy1h3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:03:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N93ul1015737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:03:56 GMT
Received: from [10.50.18.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 02:03:51 -0700
Message-ID: <739c6ce5-5ae4-4f27-f97c-0c85f6b59c39@quicinc.com>
Date: Wed, 23 Apr 2025 14:33:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/20] media: iris: Add handling for no show frames
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
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-6-acd258778bd6@quicinc.com>
 <1a35fa10-cd83-4f36-9cc2-179c3a2a4909@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <1a35fa10-cd83-4f36-9cc2-179c3a2a4909@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MSBTYWx0ZWRfX3Am1OvfLv/es pTRLlGCASjlST8WTHRh43HYeOsgjkHkpoCYNHyi7Bx21XTzpVTF1Q4ASal2FLfz0Lf3Lw1a1ClF R4O7AjFaxTj//R1UYyKfi9PaXAPMayxX3Q8LvjtFGJ7Z3O7FMkggraMcZqi4LxgkXdE6iqFQVgv
 ThYf0EALTVwtzCNnft7w/G+9WC2SpYV4goQXZuaPpWqsFEH4h/ewqHlcw0P+gpeuwTQEoGOcOAa ByDtVDnO2Zkyf8c190LP7BVcef7+I8jGybULO+bzjd2XVKJ7HncpO3tbubb3/u21mYqFwiO0eN4 kgO7g35ju8myNrQIyEsAV3H830AYDd7c6kvl6OTlCUGiySwjnCTlG/YJ67c1RaFehNNK4LCdlc3
 +30LrzGfWLlJApE82UAgbmKLtMzejdQiiRF8y5CjYoL1fLJ+IH0O7ZYjPzb1q3FeW0oxv3bK
X-Proofpoint-GUID: Org0yfNMrZ4rygxpDo7lQGAXgs0pXvs5
X-Proofpoint-ORIG-GUID: Org0yfNMrZ4rygxpDo7lQGAXgs0pXvs5
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808acfd cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=2bQXDzssvga_8JO5IqoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=993 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230061



On 4/23/2025 1:53 AM, Bryan O'Donoghue wrote:
> On 08/04/2025 16:54, Dikshita Agarwal wrote:
>> @@ -642,9 +644,6 @@ static int
>> iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>>   {
>>       struct iris_inst_hfi_gen2 *inst_hfi_gen2 =
>> to_iris_inst_hfi_gen2(inst);
>>   -    if (pkt->port != HFI_PORT_BITSTREAM)
>> -        return 0;
>> -
> 
> How is this part of the change related to adding no show frames ?
> 
Yeah, this is not directly related, I can split these two changes.

Thanks,
Dikshita
> ---
> bod

