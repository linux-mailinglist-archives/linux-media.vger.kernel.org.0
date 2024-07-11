Return-Path: <linux-media+bounces-14933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5992EAE0
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 16:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA83F1C212C5
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 14:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F39D16A930;
	Thu, 11 Jul 2024 14:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XAkp2VoE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DC9166315;
	Thu, 11 Jul 2024 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708609; cv=none; b=Wh/vW1EF9ZIuHIXGC3NXt772eImew7abgr3Ta2P4pmc+jFioeKTfMrgPnE46wS/EW+KjpUQsCXccxex1ZYC11d7M4La4lcmfKJ6SzBqvthDsTrA4SoEuOu2XvCa05XgDkKdwy2fh6/N3GT1qFf7Sak3/9RAkV1/8lUs4Qo+6jDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708609; c=relaxed/simple;
	bh=e/53LZcbPAgXqyNfp0YzmboD4F9EIVpKFs3GYIfQ1bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tT9hB2ZTnhBKgPcEkVZaNULT7UTmR6GiT+1TYBh5dpKSLgauIM9PKWbLUZMO9EnwXhCBsvapz2qP9bBvHn1J48m5Wz0zT8XtSMvzMXItgc06kMYOQCcalTsnqoYGhGSPuXNlNKnVuvoCgaLQIUSEZke79iwKzGzoEcpjK63an9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XAkp2VoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BCbvIg011320;
	Thu, 11 Jul 2024 14:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NaHOyFtzZbHirL6K2xDpJmR6/Eicz/C2hY5Ifrwc5Bw=; b=XAkp2VoERq3wSkwo
	fpgoarqHUZK3DUUd2H/aik70ONNMUCscBrwkZeIXi8Zu7kIJtdQ/jX0nxhqQ7Bxl
	X4isCQsiBXywUAb4HA/yz0rCMC5cKYl4zCbPuVPDVVsROaX6gAIb40bgMOvjvqgl
	bgYR5nI3OG+KKnbVCWUB2eoKFjFg1yAlIGiSn/q2afVhFTDgvbd1M19KVJTewTI5
	kDPSElaYTxOpKydMUU1IIbuEeJDdtxb6mPMhQ3l4wyA43L/8rQBkKjRX1vGohj45
	yqZXy+tqFscjKrDwJcRN0vw/zgH9clyPi5Ahd+Iq7R1EreDqsUFRmqbBGY4zUvFE
	6Ldcsg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 409vydtx6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 14:36:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BEafFe029401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 14:36:41 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 07:36:36 -0700
Message-ID: <4151a353-1cc0-436d-a86e-8d489311c6ef@quicinc.com>
Date: Thu, 11 Jul 2024 22:36:33 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add sm8550 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-13-quic_depengs@quicinc.com>
 <8cc2b819-8342-444e-8a31-582949cb9b3d@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <8cc2b819-8342-444e-8a31-582949cb9b3d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bHMMIb2sORyyuyAsB9DV8OdqAXrCk0gP
X-Proofpoint-ORIG-GUID: bHMMIb2sORyyuyAsB9DV8OdqAXrCk0gP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_10,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110105

Hi Bryan,


On 7/10/2024 8:02 PM, Bryan O'Donoghue wrote:
> On 09/07/2024 17:06, Depeng Shao wrote:

>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c 
>> b/drivers/media/platform/qcom/camss/camss-csid.c
>> index 858db5d4ca75..90fba25db4c6 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -1013,6 +1013,7 @@ int msm_csid_subdev_init(struct camss *camss, 
>> struct csid_device *csid,
>>   {
>>       struct device *dev = camss->dev;
>>       struct platform_device *pdev = to_platform_device(dev);
>> +    struct resource *top_res;
>>       int i, j;
>>       int ret;
>> @@ -1040,6 +1041,26 @@ int msm_csid_subdev_init(struct camss *camss, 
>> struct csid_device *csid,
>>           else
>>               csid->base = 
>> csid->res->parent_dev_ops->get_base_address(camss, id)
>>                    + VFE_480_CSID_OFFSET;
>> +    } else if (camss->res->version == CAMSS_8550) {
>> +        /* for titan 780, CSID lite registers are inside the VFE lite 
>> region,
>> +         * between the VFE "top" and "bus" registers. this requires
>> +         * VFE to be initialized before CSID
>> +         */
>> +        if (csid_is_lite(csid))
>> +            csid->base =  
>> csid->res->parent_dev_ops->get_base_address(camss, id);
>> +        else {
>> +            csid->base = devm_platform_ioremap_resource_byname(pdev, 
>> res->reg[0]);
>> +            /* CSID "top" is a new function in Titan780.
>> +             * CSID can connect to VFE & SFE(Sensor Front End).
>> +             * This connection is ontrolled by CSID "top" registers.
>> +             * CSID "top" registers at only one region.
>> +             */
>> +            top_res = platform_get_resource_byname(pdev, 
>> IORESOURCE_MEM, res->reg[1]);
>> +            csid->top_base = ioremap(top_res->start, 
>> resource_size(top_res));
>> +        }
> 
> If we just specify the csid lite regs in the dts, we don't need custom 
> code to get a pointer to them.
> 

Yes, we can get the csid lite reg directly, will update this part.

> Similarly the csid->top_base = () should be generic not SoC specific, 
> i.e. we should be able to add in CSID 980 without adding any custom code 
> to camss-csid.c
> 

csid lite doesn't have top reg block, but you are right, this can be 
generic, we can get csid->top_base if res->reg[1] isn't NULL.


>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
>> b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 83c5a36d071f..479474c1cd95 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -338,6 +338,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, 
>> u32 sink_code,
>>       case CAMSS_845:
>>       case CAMSS_8250:
>>       case CAMSS_8280XP:
>> +    case CAMSS_8550:
>>           switch (sink_code) {
>>           case MEDIA_BUS_FMT_YUYV8_1X16:
>>           {
>> @@ -408,6 +409,10 @@ int vfe_reset(struct vfe_device *vfe)
>>       reinit_completion(&vfe->reset_complete);
>> +    /* The reset has been moved to csid in 8550 */
>> +    if (vfe->camss->res->version == CAMSS_8550)
>> +        return 0;
>> +
> 
> Custom code for a specific SoC in camss.c camss-csid.c or camss-vfe.c 
> indicates to me we need to do more work elsewhere.
> 
> This would do the same job for you.
> 
> static void vfe_global_reset(struct vfe_device *vfe)
> {
>          /* VFE780 has no global reset, simply report a completion */
>          complete(&vfe->reset_complete);
> }
> 
> const struct vfe_hw_ops vfe_ops_780 = {
>          .global_reset = vfe_global_reset,
> 
>>       vfe->res->hw_ops->global_reset(vfe);
>>       time = wait_for_completion_timeout(&vfe->reset_complete

Sure, I will optimize this part.


Thanks,
Depeng


