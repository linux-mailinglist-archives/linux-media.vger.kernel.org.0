Return-Path: <linux-media+bounces-16349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3431D9536D5
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 17:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 868D528B4D8
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 15:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CF71AED41;
	Thu, 15 Aug 2024 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l1HctDxS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9371AD9FB;
	Thu, 15 Aug 2024 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734873; cv=none; b=P8fEAp8jEICGfKuAIya/ZdzxCFZwhzW/W0Slb6bfdEp2dVOdBT9AXWCWdLuLRbECeVRDKQtQgJ7vsS624z2tZ0C1SiFp1Kd9jGioA4GZd0M6saqbiKZGnSSSwEHGWowxrNYKIifiUiImg3fzQXySAiN4k/x/edOJdDwnZo2DlAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734873; c=relaxed/simple;
	bh=TkWtmJo2fyPQMKHJo/JF+zkTx72wfVFZQ/qGKU2GSPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=elZdXcb2cRRHLG0hFQBCHPw5SayVHtxd6alC9IPHc4PzfKrGW+F11y408yT2g1AOMQdmw7v9gw6PxpcUn7lak6jq2kUd+M1Nl3feosHYUIkFSvdLLMq4mqamsZJxtFxrQpwlXTXo2bwkSPCYSrfHEMzDCtJeoMHO/lGZRuENIhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l1HctDxS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FCjSAk031804;
	Thu, 15 Aug 2024 15:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+/DOzcyuJw1k9kuxuY2A+UIms2BUMZSIVaO5veBMvI=; b=l1HctDxSbKiEnTUB
	eB2iy5ii5UGcb4oY0+2kIHknMYQ0BAuF/ptUvggSh1pTkuXahB+2q/H/j+2K9rha
	OAKFVQjWKPIQAjBO8Fr4XQfOnnMtsKQGJIyMYP9Tq2VPuhdOQAy1Om1DayD06MPC
	NkavV5549jxbGBw6lvj8m74lrn91VLIe+zRWfYZLesgx2HF8v+5iYNZKb5tqUN/M
	58/+d2xaEGZmn7UEM2ifmMigYyPUN/vjAA/OMu98pgYLI7mJrh37QNSec3C+w9jV
	bnsx0Ek6DOo3bNzUjAC/PkQnlvbcIMGgT2nXigbuvSzI9wg/+c8ukVGv06VehLh0
	1I+eIA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41082wpqfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 15:14:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47FFEPh6022662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 15:14:25 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 08:14:20 -0700
Message-ID: <ff261ab4-b59d-48a1-9ede-3c691842d913@quicinc.com>
Date: Thu, 15 Aug 2024 23:14:18 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
 <44efa3ba-f60d-4a17-a8a1-fa7d49aa3234@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <44efa3ba-f60d-4a17-a8a1-fa7d49aa3234@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QOGntYjSHWE_S-goQXBhmHqBlKuTmwFP
X-Proofpoint-GUID: QOGntYjSHWE_S-goQXBhmHqBlKuTmwFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_08,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408150110

Hi Bryan,


>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>>   .../platform/qcom/camss/camss-csid-gen3.c     | 339 ++++++++++++++++++
>>   .../platform/qcom/camss/camss-csid-gen3.h     |  26 ++
> 
> 
> So this "gen2" and "gen3" stuff would make sense if we had a number of 
> SoCs based on gen2 and gen3 which were controlled from the upper-level 
> gen2.c and gen3.c.
> 
> What you're submitting here is csid-780 so the file should be named 
> csid-780.
> 
> When we add 680 or 880 then it makes sense to try to encapsulate a class 
> of generation into one file - potentially.
> 
> I'd guess that was the intent behind gen2.c.
> 
> TL;DR please name your file csid-xxx.c

Sure, I will use csid-780.c

>> +
>> +    writel(val, csid->base + CSID_CSI2_RX_CFG0);
>> +
>> +    val = 1 << CSI2_RX_CFG1_ECC_CORRECTION_EN;
>> +    if (vc > 3)
>> +        val |= 1 << CSI2_RX_CFG1_VC_MODE;
> 
> So again these are needless bit-shifts.
> 
> #define CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN BIT(0)
> 
> val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
> 

You posted same comments in v3 series, I also replied it.
https://lore.kernel.org/all/eeaf4f4e-5200-4b13-b38f-3f3385fc2a2b@quicinc.com/

Some of register bits which just need to be configured to 0 or 1, then 
can use BIT(X), but some register bits need to configure a specific 
value, e.g.,  CSID_RDI_CFG0 bits[22:26] need to configure a vc vaule, 
bits[16:21] need to configure a dt value, then we can't use BIT(x) to 
handle this.


>> +
>> +static void csid_subdev_reg_update(struct csid_device *csid, int 
>> port_id, bool is_clear)
>> +{
>> +    if (is_clear) {
>> +        csid->reg_update &= ~REG_UPDATE_RDI(csid, port_id);
>> +    } else {
>> +        csid->reg_update |= REG_UPDATE_RDI(csid, port_id);
>> +        writel(csid->reg_update, csid->base + CSID_REG_UPDATE_CMD);
>> +    }
>> +}
> 
> Right so this function should
> 
> 1. Write the register
> 2. Wait on a completion
>     See camss-vfe-480.c::vfe_isr_reg_update()
> 3. Have that completion fire in the CSID ISR
> 4. Or timeout
> 5. Returning either 0 for success or -ETIMEDOUT
> 
> to the calling function so that we can be sure the RUP interrupt has 
> fired and completed - or we have appropriately timed out and captured 
> the failure.
> 
> Also - in camss-vfe-480.c the ISR clears the RUP which one assumes is 
> still the required logical flow with the RUP now residing in CSID.
> 

Sure, I forget to add this, will add them in next series.


>>       case MSM_CSID_PAD_SRC:
>> -        if (csid->testgen_mode->cur.val == 0) {
>> +        if (!csid->testgen_mode || csid->testgen_mode->cur.val == 0) {
> 
> See my comments on adding new guards to core functionality.
> 
> Is this sm8550 specific or generic ?
> 

It is sm8550 specific, since we don't have testgen mode in sm8550 csid, 
so need to add some guards, the guards are added for similar reason.

>>               /* Test generator is disabled, */
>>               /* keep pad formats in sync */
>>               u32 code = fmt->code;
>> @@ -1042,6 +1042,7 @@ static int csid_init_formats(struct v4l2_subdev 
>> *sd, struct v4l2_subdev_fh *fh)
>>   static int csid_set_test_pattern(struct csid_device *csid, s32 value)
>>   {
>>       struct csid_testgen_config *tg = &csid->testgen;
>> +    const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
>>       /* If CSID is linked to CSIPHY, do not allow to enable test 
>> generator */
>>       if (value && media_pad_remote_pad_first(&csid- 
>> >pads[MSM_CSID_PAD_SINK]))
>> @@ -1049,7 +1050,10 @@ static int csid_set_test_pattern(struct 
>> csid_device *csid, s32 value)
>>       tg->enabled = !!value;
>> -    return csid->res->hw_ops->configure_testgen_pattern(csid, value);
>> +    if (hw_ops->configure_testgen_pattern)
>> +        return -EOPNOTSUPP;
>> +    else
>> +        return hw_ops->configure_testgen_pattern(csid, value);
> 
> If you just add a dummy configure_testgen_pattern we can get rid of this 
> branching stuff.
> 

Do you mean add dummy function in csid-780/gen3.c? How about the other 
ops in vfe_ops_780, add dummy function or use NULL? We need to guards if 
we set it as NULL.

static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
{
	return 0;
}

>>   }
>>   /*
>> @@ -1121,6 +1125,19 @@ int msm_csid_subdev_init(struct camss *camss, 
>> struct csid_device *csid,
>>           csid->base = devm_platform_ioremap_resource_byname(pdev, 
>> res->reg[0]);
>>           if (IS_ERR(csid->base))
>>               return PTR_ERR(csid->base);
>> +
>> +        /* CSID "top" is a new function in new version HW,
>> +         * CSID can connect to VFE & SFE(Sensor Front End).
>> +         * this connection is controlled by CSID "top" registers.
>> +         * There is only one CSID "top" region for all CSIDs.
>> +         */
>> +        if (!csid_is_lite(csid) && res->reg[1] && !camss- 
>> >csid_top_base) {
>> +            camss->csid_top_base =
>> +                devm_platform_ioremap_resource_byname(pdev, res- 
>> >reg[1]);
> 
> That's a complex clause.
> 
> Let me send you a patch to do it a different way.
> 

I was also thinking to addd it in camss level, then I thought it is in 
csid block, so I moved it to csid, but it is also fine to add it in 
camss. Can I add your patch into this series? Just like the csiphy patches.


Thanks,
Depeng


