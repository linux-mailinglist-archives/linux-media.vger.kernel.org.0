Return-Path: <linux-media+bounces-14936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D292EBC2
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 17:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCDB7B23686
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 15:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF74B16B72E;
	Thu, 11 Jul 2024 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KibOrYWg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA1A1642B;
	Thu, 11 Jul 2024 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720712052; cv=none; b=hdI/jL1v1AqNZBPD6kDpw3XSZqbLkfmxaSrsXVbUdolPBeOwySjiMdBHWwK+dKz9sY4uoxWSG/ElNGvh8HxIeZipfRl+uZj0PauQIhZcUnZ0RbnpnBG9mzII5FMCkUUIHqh5w8RO6sTO1lop7YtQYZQocrDuXXrLEVtj8TxSab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720712052; c=relaxed/simple;
	bh=2ECKbJOAl1I4ejRED+BC4GWb8aavgKbho12qFEo0pkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VJMgo6zs1SsoNbKxi+Sfmo5PUlNcQdM0s1Gsk0KJWaRl5lr7CAnwyQfi0NFphSy86h3o8tBfGQimhJhSOlGq1oF1VAdsotHDX56Foq/VkP7czxrFdp219wKf8koWQOt2gtFnFO5iNZ78JG1b5ij7xnxZgBQkn2kyIj8INOYfipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KibOrYWg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BBYugt024165;
	Thu, 11 Jul 2024 15:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLv239LCKbAksyk9+YP/RuXxIdndLsF1f28qyIKCIbg=; b=KibOrYWgXdq9Vn6J
	15F9RU6/aiw8dO5Sz1nE5MjT72ojcIcY7+G0Zede0VV9x8OsoQMOpGx1nazyCtRb
	nVgOyNvm6ls1xJ+9xZZpnbZnXZY5Pjxony4egPEQzw61fesIVeXU051I5vdGcqfc
	Ic4FNdG5L9Woh2lQfu624Sai8yX8cGw7Bc/8QjGlhl9URJMR0JiHJWCpTDW7SaWn
	kPIvPDTpGm7SesJ6AajYFheU/n9M1YIJzav8X9HWfCSwn0hhQjTAg9bAh71cq5xn
	hfRPmH3u5/cmXzaP0Gxt3sc6PrNYHA0LUOfTZ6Plw/VkOkBeAS8p1XXNwYId8KH8
	PkC+gw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xpdvhkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 15:34:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BFY5VY028145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 15:34:05 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 08:33:58 -0700
Message-ID: <eeaf4f4e-5200-4b13-b38f-3f3385fc2a2b@quicinc.com>
Date: Thu, 11 Jul 2024 23:33:56 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <e118f980-e10f-450c-8270-76602cc50b27@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <e118f980-e10f-450c-8270-76602cc50b27@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IhoCUpdVc9G2bTshws54_VnSTIwujG49
X-Proofpoint-ORIG-GUID: IhoCUpdVc9G2bTshws54_VnSTIwujG49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_11,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110110

Hi Bryan,

On 7/10/2024 7:28 PM, Bryan O'Donoghue wrote:
> On 09/07/2024 17:06, Depeng Shao wrote:
>> The CSID in SM8550 is gen3, it has new register offset and new
>> functionality. The buf done irq,register update and reset are
>> moved to CSID gen3. And CSID gen3 has a new register block which
>> is named as CSID top, it controls the output of CSID, since the
>> CSID can connect to Sensor Front End (SFE) or original VFE, the
>> register in top block is used to control the HW connection.
>>
>> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>>   .../platform/qcom/camss/camss-csid-gen3.c     | 445 ++++++++++++++++++
>>   .../platform/qcom/camss/camss-csid-gen3.h     |  26 +
>>   .../media/platform/qcom/camss/camss-csid.h    |   2 +
>>   4 files changed, 474 insertions(+)
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.h
>>

>> +
>> +#define        REG_UPDATE_RDI        reg_update_rdi
>> +
>> +static void __csid_configure_rx(struct csid_device *csid,
>> +                struct csid_phy_config *phy, int vc)
>> +{
>> +    int val;
>> +
>> +    val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>> +    val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>> +    val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << 
>> CSI2_RX_CFG0_PHY_NUM_SEL;
>> +
>> +    writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
>> +
>> +    val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>> +    if (vc > 3)
>> +        val |= 1 << CSI2_RX_CFG1_VC_MODE;
> 
> I realise downstream does these shifts but, I think in upstream we 
> should just define a BIT(x)
> 
> #define CSI2_RX_CFG1_VC_MODE BIT(2)
> 
> val |= CSI2_RX_CFG1_VC_MODE;
> 

Here CSI2_RX_CFG1_VC_MODE just means a register bit offset, not a 
register configuration.

Some fixed configuration can do this, but some register bits value are 
configured based on actual parameter.
e.g.;  val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;

If we want to use macro definition, maybe we can do like below.

#define CSI2_RX_CFG1_VC_MODE(n) ((n) << 2)
val |= CSI2_RX_CFG1_VC_MODE(1);


#define CSI2_RX_CFG0_DL0_INPUT_SEL(n) ((n) << 4)
val |= CSI2_RX_CFG0_DL0_INPUT_SEL(phy->lane_assign)

Could you please comment if we really need to do like this?


>> +    writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
>> +}
>> +
>> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 
>> rdi)
>> +{
>> +    int val;
>> +
>> +    if (enable)
>> +        val = 1 << RDI_CTRL_START_CMD;
>> +    else
>> +        val = 0 << RDI_CTRL_START_CMD;
> 
> Here is an example of how the bit shifting is weird
> 
> (0 << anything) is still zero
> 

Understood, the value is same, but we can know the configuration clearly 
on this register bit. If we do like above way, then it likes below.

#define RDI_CTRL_START_CMD(n) ((n) << 0)  --> it is same with (n), but 
we don't know the register bit offset clearly if we use (n).

if (enable)
	val = RDI_CTRL_START_CMD(1);
else
	val = RDI_CTRL_START_CMD(0);

>> +    writel_relaxed(val, csid->base + CSID_RDI_CTRL(rdi));
>> +}
>> +
>> +static void __csid_configure_top(struct csid_device *csid)
>> +{
>> +    u32 val;
>> +
>> +    /* CSID "top" is a new function in Titan780.
>> +     * CSID can connect to VFE & SFE(Sensor Front End).
>> +     * This connection is ontrolled by CSID "top".
>> +     * Only enable VFE path in current driver.
>> +     */
>> +    if (csid->top_base) {
> 
> When is csid->top_base NULL ?
> 
> Its required in your yaml.
> 

csid->top_base is NULL when it is csid lite, I will add this info in yaml.


>> +
>> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
>> +{
>> +    u8 i;
>> +
>> +    /* Loop through all enabled VCs and configure stream for each */
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            /* Configure CSID "top" */
>> +            __csid_configure_top(csid);
>> +            __csid_configure_rdi_stream(csid, enable, i);
>> +            __csid_configure_rx(csid, &csid->phy, i);
>> +            __csid_ctrl_rdi(csid, enable, i);
>> +        }
>> +}
> 
> I really like this breakdown

Sorry, I don't get it, do you mean you like that configuring the 
different block use different functions, and no other meaning?

>> +
>> +static int csid_configure_testgen_pattern(struct csid_device *csid, 
>> s32 val)
>> +{
>> +    if (val > 0 && val <= csid->testgen.nmodes)
>> +        csid->testgen.mode = val;
> 
> Surely you should just set the val parameter directly ?
> 
> Also why is this a signed integer and how does it get assigned a 
> negative value which we need to mitigate against here  >

This was copied from csid-gen2 driver, they are same, so we can move to 
common file.

And the val comes from ctrl->val, so I guess this is the reason why this 
agrument is signed integer.

struct v4l2_ctrl {
	...
	s32 val;
	...
};



>> +
>> +static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
>> +                 unsigned int match_format_idx, u32 match_code)
>> +{
>> +    switch (sink_code) {
>> +    case MEDIA_BUS_FMT_SBGGR10_1X10:
>> +    {
>> +        u32 src_code[] = {
>> +            MEDIA_BUS_FMT_SBGGR10_1X10,
>> +            MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
>> +        };
>> +
>> +        return csid_find_code(src_code, ARRAY_SIZE(src_code),
>> +                      match_format_idx, match_code);
>> +    }
>> +    case MEDIA_BUS_FMT_Y10_1X10:
>> +    {
>> +        u32 src_code[] = {
>> +            MEDIA_BUS_FMT_Y10_1X10,
>> +            MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
>> +        };
>> +
>> +        return csid_find_code(src_code, ARRAY_SIZE(src_code),
>> +                      match_format_idx, match_code);
>> +    }
>> +    default:
>> +        if (match_format_idx > 0)
>> +            return 0;
>> +
>> +        return sink_code;
>> +    }
>> +}
> 
> Same code as in gen2.
> 
> You could move the gen2 version of this into camss-csid.c and just reuse 
> in both.
> 

Sure, it is same with the comments in vfe driver, I will try to move 
same code to camss-csid.c

Thanks,
Depeng

