Return-Path: <linux-media+bounces-14920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D7A92E7AE
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 13:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60B6B289169
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 11:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFD215DBB3;
	Thu, 11 Jul 2024 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lpqnwNHq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74112904;
	Thu, 11 Jul 2024 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698863; cv=none; b=FZvdmfZlvybldai5E0yf70Bcf/+OEU4EQDGwAStngMoMllv+RqdXG1iuKPdmaGR32049iYaU1LSuSvknM6Qqu/QNu9rUPy8Jdfxrm6vAtSwprGmjWLXLMUlJazlXYWnLp5AR2zLIqX910zuW8n704pynPofylxxmT3tOlTxC/pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698863; c=relaxed/simple;
	bh=+LdsT/NVAQfxwaXzM9GsKWZdeWVmi0gJkWpbBeLpSJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gQVKldqIpR85uhHQ0meJArFbCNet8bdDLH4uhnyRIHxEAMGHUnZcw2pB0P3l6ZAnj+TZaKi3f+lRijuvBTTeJ6YFzaaStjX2+TKLYpGXxbgvhQoEQsRyBXhU+2M/YhDE2PvwADG6KtXu8aEgISNaU8R72y4A6fE0mZ73AxXufM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lpqnwNHq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4mmc8011416;
	Thu, 11 Jul 2024 11:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pOGUEVKUYHY5uK7jZlfwU/0qMkVGbGWTCdGSXrbzl0A=; b=lpqnwNHqPi64Wvx2
	1HoJ/UhWmlw/IPfRAgN2RE+4pxxAZzZ4dYUxtisr3hiZ899avcIrHPGIEeX1EBJQ
	9TC5717Xq6CBomvgiruzn1HMmZFxi0l+NTbqwCf4ZcCPN09eyZT3/AKRTH8AcMsv
	mwtsfKEe8n+9vehEIiAe6DVHU5xCSIBPhuMwIeeXFbAsIdTw/CowTsOieM5Lur1Y
	YnQcAcISYT09ZCM7dp220d5iXP756vLr8KDqs9CiS5i9bncMj1C+RFbqdjhQXYcX
	2633bMATx/88B5SBST8YTnAPeCPU/7kZCoDXFSKyoMKKq1mk3jza/PL4pLhom1wh
	m02jkQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 409vydtgjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 11:54:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BBsFjB022354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 11:54:15 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 04:54:09 -0700
Message-ID: <0e5f029b-ee63-4e44-a75e-877fbae042b3@quicinc.com>
Date: Thu, 11 Jul 2024 19:54:07 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] media: qcom: camss: Add notify interface in camss
 driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-12-quic_depengs@quicinc.com>
 <236cfe43-8321-4168-8630-fb9528f581bd@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <236cfe43-8321-4168-8630-fb9528f581bd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AUq8_1r4R7qnQBZjVaGABh_pLzFpfUGa
X-Proofpoint-ORIG-GUID: AUq8_1r4R7qnQBZjVaGABh_pLzFpfUGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_08,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110083

Hi Bryan,

On 7/10/2024 7:54 PM, Bryan O'Donoghue wrote:
> On 09/07/2024 17:06, Depeng Shao wrote:
>> The main v4l2 process logic in camss vfe subdev driver, so the vfe driver
>> handles the buf done irq and register update configuration. But the buf
>> done irq and register update configuration have been moved CSID HW in
>> Titan 780 and other new platform, so vfe driver needs to call into CSID
>> driver to configure the register update. And CSID driver also needs to
>> call into vfe driver to notify of the buf done irq.
>>
>> Adding this notify interface in camss structure to do the subdevs cross

>>   /*
>>    * csid_isr - CSID module interrupt service routine
>>    * @irq: Interrupt line
>> @@ -341,6 +353,14 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>           if (csid->phy.en_vc & BIT(i)) {
>>               val = readl_relaxed(csid->base + 
>> CSID_CSI2_RDIN_IRQ_STATUS(i));
>>               writel_relaxed(val, csid->base + 
>> CSID_CSI2_RDIN_IRQ_CLEAR(i));
>> +
>> +            if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + 
>> i)) {
>> +                /* For Titan 780, Buf Done IRQ&REG has been moved to 
>> CSID from VFE.
>> +                 * Once CSID received Buf Done, need notify this 
>> event to VFE.
>> +                 * Trigger VFE to handle Buf Done process.
>> +                 */
>> +                csid->camss->notify(&csid->subdev, 
>> CAMSS_MSG_BUF_DONE, (void *)&i);
> 
> Instead of a generic notify function with an enum passed to a switch 
> lets just have a dedicated function for each functional callback.
> 
> csid->camss->reg_update_cmd();
> csid->camss->reg_clear_cmd();
> 
> We can get rid of a switch and an additional enum that way, plus 
> redundant "event not supported" error checking.
> 

Sure, will update the code based on suggestion.


>> +            }
>>           }
>>       val = 1 << IRQ_CMD_CLEAR;
>> @@ -434,6 +454,23 @@ static void csid_subdev_init(struct csid_device 
>> *csid)
>>       csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
>>   }
>> +static void csid_subdev_process_msg(struct csid_device *csid, 
>> unsigned int msg_type, void *arg)
>> +{
>> +    int msg_data = *(int *)arg;
>> +
>> +    switch (msg_type) {
>> +    case CAMSS_MSG_RUP:
>> +        csid_reg_update(csid, msg_data);
>> +        break;
>> +    case CAMSS_MSG_RUP_CLEAR:
>> +        csid_reg_update_clear(csid, msg_data);
>> +        break;
>> +    default:
>> +        dev_err(csid->camss->dev, "NOT Supported EVT Type\n");
>> +        break;
>> +    }
>> +}
>> +
>>   const struct csid_hw_ops csid_ops_gen3 = {
>>       .configure_stream = csid_configure_stream,
>>       .configure_testgen_pattern = csid_configure_testgen_pattern,
>> @@ -442,4 +479,5 @@ const struct csid_hw_ops csid_ops_gen3 = {
>>       .reset = csid_reset,
>>       .src_pad_code = csid_src_pad_code,
>>       .subdev_init = csid_subdev_init,
>> +    .process_msg = csid_subdev_process_msg,


>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h 
>> b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index 10e2cc3c0b83..a8b09ce9941b 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -115,6 +115,7 @@ struct vfe_hw_ops {
>>       int (*vfe_halt)(struct vfe_device *vfe);
>>       void (*violation_read)(struct vfe_device *vfe);
>>       void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
>> +    void (*process_msg)(struct vfe_device *vfe, unsigned int 
>> msg_type, void *arg);
>>   };
>>   struct vfe_isr_ops {
>> diff --git a/drivers/media/platform/qcom/camss/camss.c 
>> b/drivers/media/platform/qcom/camss/camss.c
>> index 1f1f44f6fbb2..abeb0918e47d 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -2202,6 +2202,52 @@ static void camss_genpd_cleanup(struct camss 
>> *camss)
>>       dev_pm_domain_detach(camss->genpd, true);
>>   }
>> +static void camss_notify_msg(struct v4l2_subdev *sd,
>> +            unsigned int msg_type, void *arg)
>> +{
>> +    struct v4l2_device *v4l2_dev = sd->v4l2_dev;
>> +    struct camss *camss = to_camss(v4l2_dev);
>> +    struct vfe_device *vfe;
>> +    struct vfe_line *vfe_line;
>> +    struct csid_device *csid;
>> +    int evt_data = *(int *)arg;
>> +
>> +    switch (msg_type) {
>> +    case CAMSS_MSG_BUF_DONE:
>> +        csid = v4l2_get_subdevdata(sd);
>> +        vfe = &(camss->vfe[csid->id]);
>> +        if (vfe->res->hw_ops->process_msg)
>> +            vfe->res->hw_ops->process_msg(vfe,
>> +                CAMSS_MSG_BUF_DONE, (void *)&evt_data);
>> +        break;
>> +
>> +    case CAMSS_MSG_RUP:
>> +        vfe_line = v4l2_get_subdevdata(sd);
>> +        vfe = to_vfe(vfe_line);
>> +        csid = &(camss->csid[vfe->id]);
>> +
>> +        if (csid->res->hw_ops->process_msg)
>> +            csid->res->hw_ops->process_msg(csid,
>> +                CAMSS_MSG_RUP, (void *)&evt_data);
>> +        break;
>> +
>> +    case CAMSS_MSG_RUP_CLEAR:
>> +        vfe_line = v4l2_get_subdevdata(sd);
>> +        vfe = to_vfe(vfe_line);
>> +        csid = &(camss->csid[vfe->id]);
>> +
>> +        if (csid->res->hw_ops->process_msg)
>> +            csid->res->hw_ops->process_msg(csid,
>> +                CAMSS_MSG_RUP_CLEAR, (void *)&evt_data);
>> +
>> +        break;
>> +
>> +    default:
>> +        dev_err(camss->dev, "Not supported evt type\n");
>> +        break;
>> +    }
>> +}
> 
> Instead of having a central swiss army knife notify() callback these 
> should be CSID or VFE specific callbacks vfe->buf_done() csid->msg_rup() 
> etc.
> 

I will try to add the callback in CSID and VFE driver.

Thanks,
Depeng

