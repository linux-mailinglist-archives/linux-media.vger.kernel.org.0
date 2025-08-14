Return-Path: <linux-media+bounces-39866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B05E7B25C54
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A844417DB99
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 06:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A272620E4;
	Thu, 14 Aug 2025 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cnLVTRUU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42BC25B2E3;
	Thu, 14 Aug 2025 06:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154477; cv=none; b=jXVcTzO7Y6KNuHhJUpv4vOy2OoCEFAXzS3K8phch6pvTzQvnvDzvla9VJmvOoetA8SJXnQ0bPbgfKHcwPBRCvt4m0uPwxbqsz3ZbuIafVS78u8AEYO2ripd+GnnMGDN6EB3qD300w18EuF9PC2aoa8wwluqJsgsu5gauygdnAIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154477; c=relaxed/simple;
	bh=ofiMqMhLYKzVlBtvki6TUGJfZqsj/3CtTJxUfGd31Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=auAb/W2OS6ysQcWJfJUKWB0FcGXYTKILFS4LcK0gLsxIFci6EIj9s2OXBItMlArBdNaOqAQkNVOwjD+uJIbBnKIuc7dsdOuRsEhhT+BVFAvewtSu6kZQCc35LNulKD9yzCrDycqRNVYe8j41OH/KNfrO5ZiaVC4bJ4+4d59PGt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cnLVTRUU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMGmU2027429;
	Thu, 14 Aug 2025 06:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgdIPyoZYmfHL46/OfidSIeJuiRIcEKFFkB9alnkIrY=; b=cnLVTRUU0sIkq4ev
	mtu9Grhy941hhX7xLTkqrKutOH61veIERyRGOIpSa55TNJvimLjqe9tMerNXTwKX
	MpEXucf2EBYeEI5D+0V7kbp770p2G8M6oF/Nrr1Zao7VnBNUdpK+8jBqCnAbZdKY
	O1qMJ2HF/e/G92N1juh3H/7LWPMzoHEaNyC6EHbHlgnhwzvfL8IQtsFToawE2D3U
	8BJczva03i7Zm3o/4d7JDIsuvlVdvEieka5KrCPrP9U2pTuWs6J93BiDMBzmL6d0
	XZJl3oIaQoID3hXag868q/35iFer/yGE9z0pkaySesKfT584SGGWqKVH/ovjs5Sz
	5i1iuA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjth5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 06:54:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E6sOHS014135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 06:54:24 GMT
Received: from [10.216.6.119] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 23:54:18 -0700
Message-ID: <c660ea69-d111-4a81-85c6-8ab16dfcfb28@quicinc.com>
Date: Thu, 14 Aug 2025 12:24:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] media: qcom: camss: enable csid 690 for qcs8300
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-5-quic_vikramsa@quicinc.com>
 <c467e3a9-2c67-4231-9d64-d64de08ec2ce@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <c467e3a9-2c67-4231-9d64-d64de08ec2ce@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX3XN7c3qwJ5vR
 4wHN+yiq/Vm5DFCG9+GZINHeTCTWjGRaRVfT/dok1l36ueVAt63uvrc2WXzMYJ7xEV03VS0irow
 L/soOPvjXHyzWmmrLKTt1CRa1BB6EFFLmQoi3FGqzJUtXttdmfvV7gsPA5PiftLCvD6lmjzgnCz
 rwuK4Mm3u8Q75Vl+bXzJEbwITVWIBruonJrTFvc1t6NVMG1cOe7YXQub34ER3EVhR6DAnkW6vYd
 cI1SZZEo7QdzV9QkPR7iv3axCSXh0XsUFYs65Svn7/ywUPrFiS+Eqt7rqUqxWSS+VcIM1D9SSgU
 /bV4lmEfKCOfqJG2O//oHZEdFCCE1WcRvVpBDv8SybO4fOqxyWdVcrnIw/BgOhZ6EEgV/3ThXze
 hlQHKoSA
X-Proofpoint-GUID: l8J6HStKPFpR2chhkk7R5prRDFaeWSCM
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689d8821 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=pidyNqlz_yV2GsitqqAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: l8J6HStKPFpR2chhkk7R5prRDFaeWSCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074


On 8/14/2025 3:03 AM, Bryan O'Donoghue wrote:
> On 13/08/2025 06:37, Vikram Sharma wrote:
>> The CSID in qcs8300 is version 690, it is same as csid used in
>> lemans(sa8775p). csid gen3 have support for csid 690.
>>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> index fc6a9787febe..664245cf6eb0 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> @@ -45,7 +45,8 @@
>>   #define CSID_CSI2_RX_IRQ_CLEAR        0xA4
>>   #define CSID_CSI2_RX_IRQ_SET        0xA8
>>   -#define IS_CSID_690(csid) (csid->camss->res->version == CAMSS_8775P)
>> +#define IS_CSID_690(csid) ((csid->camss->res->version == CAMSS_8775P) \
>> +                 || (csid->camss->res->version == CAMSS_8300))
>>   #define CSID_BUF_DONE_IRQ_STATUS    0x8C
>>   #define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
>>                           1 : (IS_CSID_690(csid) ?\
>
> This really feels like it should be a property of the CSID not of the 
> SoC but... anyway it'll do for now.

Hi Bryan,

Thanks for your review. I will address this in a follow up series 
marking dependency on this one.


>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Regards,
Vikram


