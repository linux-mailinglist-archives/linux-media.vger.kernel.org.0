Return-Path: <linux-media+bounces-16343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C0952F93
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 15:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19E571F20F6C
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 13:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DEE1A3BDC;
	Thu, 15 Aug 2024 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KnWKJ/I1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB091A255C;
	Thu, 15 Aug 2024 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723728819; cv=none; b=X1GZf4ZxrrlXTSkqevpqPjv/bYjH0lFUmjmSa52MmWNf4W0h8rZ4eQowKmy1IUN6/42YaDFG835ynWMfDnDwICRDqHOtRZeknzw9ras1+vGv0tpRZKPKA9DLkywxDUn0rhAxcbC3Wr8InMtVPV7gYeTTaQeaRHynZcDuTuESstY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723728819; c=relaxed/simple;
	bh=xDjhfqPS2o+oDH5/ecesXAuXbEw+HvBzT0vWf2cTHBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Okxv7SdJZvd9gNn6gx20kgVdZqC37NxJ68+gDkviWUA7Ihc2zCiQ5n+gQSv9jhggNtyd0NNyhfXhmUZHxPiMtKsjn96RQzoxE7RD4zWySDjpOMlxZnPvxEZ4+32LLT+cflbK/jCXg7RREJbSZijYmnHWrRSgKCybRqymdwfA/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KnWKJ/I1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47F1xZ0L021528;
	Thu, 15 Aug 2024 13:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wjQ+waepsqWG6bfx0jN0N0x2uwvT5aJvn8iAsKyZlU8=; b=KnWKJ/I11DuhR3+6
	yhXrsKpB4iW8pnqrGlYxp++QJ+hTv8kbF8PJm+8b1zvCWW2rm4mwoM/s4dSOudnN
	hoJY3vlnpwqGb/F5iWYwbB1GZtE0ACCIju+yAkDdbZ7JR2Tj/fAzHG5/fnQzRqeR
	P6x7UaQJj7co3JcAZ5GeIiupMecgJnJa0CserpcY3bzCQhXyK38dpOYXcLxXHqrk
	ElRZ5zDTCFNPTJyrRg3oUaG/hQCgFqUq0w0092EL4p5hK9tuEytV3N+C3sMUKW5W
	iPD1Nb5EqjENYMNEKRJWPjsPyTTFQBY5u8Z9+LmRuu1vR9cCBVgfeAYFYNFw0HY2
	iWmh4g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410m294pdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 13:33:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47FDXKEZ022352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 13:33:20 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 06:33:14 -0700
Message-ID: <8e38308a-4198-420e-ac4d-718299033eb5@quicinc.com>
Date: Thu, 15 Aug 2024 21:33:12 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <b78f23ca-eb6e-45cf-9e42-86c906ff901f@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <b78f23ca-eb6e-45cf-9e42-86c906ff901f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DzLclLzsHct6KgLxh1EBQI6QEFU8lPf3
X-Proofpoint-ORIG-GUID: DzLclLzsHct6KgLxh1EBQI6QEFU8lPf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408150098

Hi Bryan,

On 8/15/2024 12:23 AM, Bryan O'Donoghue wrote:

>> @@ -674,15 +675,17 @@ int vfe_reset(struct vfe_device *vfe)
>>   {
>>       unsigned long time;
>> -    reinit_completion(&vfe->reset_complete);
>> +    if (vfe->res->hw_ops->global_reset) {
>> +        reinit_completion(&vfe->reset_complete);
>> -    vfe->res->hw_ops->global_reset(vfe);
>> +        vfe->res->hw_ops->global_reset(vfe);
>> -    time = wait_for_completion_timeout(&vfe->reset_complete,
>> -        msecs_to_jiffies(VFE_RESET_TIMEOUT_MS));
>> -    if (!time) {
>> -        dev_err(vfe->camss->dev, "VFE reset timeout\n");
>> -        return -EIO;
>> +        time = wait_for_completion_timeout(&vfe->reset_complete,
>> +            msecs_to_jiffies(VFE_RESET_TIMEOUT_MS));
>> +        if (!time) {
>> +            dev_err(vfe->camss->dev, "VFE reset timeout\n");
>> +            return -EIO;
>> +        }
> 
> Per my comment on the CSID - this feels like a fix you are introducing 
> here in the guise of a silicon add.
> 
> Please break it up.
> 
> If you have a number of fixes to core functionality they need to be
> 
> 1. Granular and individual
> 2. Indivdually scrutable with their own patch and descritption
> 3. git cherry-pickable
> 4. Have a Fixes tag
> 5. And be cc'd to stable@vger.kernel.org
> 
> Can't accept either the fixes or the silicon add if the two live mixed 
> up in one patch.
> 

This isn't a bug fix, adding a null pointer checking just because vfe780 
doesn't have enable_irq/global_reset/isr/vfe_halt hw_ops, so adding the 
null checking for these hw_ops in this patch and adding them in one patch.
The original code doesn't have any bug.



>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/ 
>> media/platform/qcom/camss/camss-vfe.h
>> index fcbf4f609129..9dec5bc0d1b1 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
>>   extern const struct vfe_hw_ops vfe_ops_4_8;
>>   extern const struct vfe_hw_ops vfe_ops_170;
>>   extern const struct vfe_hw_ops vfe_ops_480;
>> +extern const struct vfe_hw_ops vfe_ops_780;
>>   int vfe_get(struct vfe_device *vfe);
>>   void vfe_put(struct vfe_device *vfe);
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index 7ee102948dc4..92a0fa02e415 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -1666,6 +1666,125 @@ static const struct camss_subdev_resources 
>> csid_res_8550[] = {
>>       }
>>   };
>> +static const struct camss_subdev_resources vfe_res_8550[] = {
>> +    /* VFE0 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", 
>> "vfe0_fast_ahb",
>> +               "vfe0", "cpas_vfe0", "camnoc_axi" },
> 
> Should the camnoc AXI clock go here or in the CSID ?
> 

camnoc is responsible for ddr writing, so it is needed for the WM in vfe.


>> +    /* VFE4 lite */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", 
>> "vfe_lite_ahb",
>> +               "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
>> +        .clock_rate = {    { 0, 0, 0, 0, 0 },
>> +                { 0, 0, 0, 0, 80000000 },
>> +                { 300000000, 300000000, 400000000, 400000000, 
>> 400000000 },
>> +                { 300000000, 300000000, 400000000, 400000000, 
>> 400000000 },
> 
> I realise you're specifying all of the operating points here but the 
> clock only needs to appear once i.e.
> 
> 1 x 300 MHz
> 1 x 400 MHz
> 1 x 480 MHz
> 
> etc.
> 

Sure, will update in next series.

>> +                { 400000000, 480000000, 480000000, 480000000, 
>> 480000000 },
>> +                { 300000000, 300000000, 400000000, 400000000, 
>> 400000000 },
>> +                { 300000000, 300000000, 400000000, 400000000, 
>> 400000000 } },
>> +        .reg = { "vfe_lite1" },
>> +        .interrupt = { "vfe_lite1" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .hw_ops = &vfe_ops_780,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +};

>> +void camss_reg_update(struct camss *camss, int hw_id, int port_id, 
>> bool is_clear)
>> +{
>> +    struct csid_device *csid;
>> +
>> +    if (hw_id < camss->res->csid_num) {
> 
> Does this cause do anything ? Is it just defensive programming ? Can the 
> hw_id index exceed the number of CSIDs defined and if so why ?
> 
> Smells wrong.
> 

It is just a defensive programming, just like some null pointer checking.


Thanks,
Depeng

