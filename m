Return-Path: <linux-media+bounces-37952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 710DFB0870F
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2EFA4A6919
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2905525B1DC;
	Thu, 17 Jul 2025 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k2r7Gph6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045E2505AA;
	Thu, 17 Jul 2025 07:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737861; cv=none; b=P+NodO5tpOnf/gZwB4BMhFWRyUogs/oogMCwtJpq6k1Whry1m/CKYv+UQezoaxx4HuKL6ayGysvxDomAz4VHVF5JBSv6o8vWWRvp9esaqa8d1t4Bw635Xfev2ztvCYCJ4mSxy7UU3K3jYn3hchz0fSFEPGt9boSyQSSVPYGKRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737861; c=relaxed/simple;
	bh=FIxnFxV/4JzUNjI50s1owU32R2TB0ovuNBfa9GHltww=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AfBIzen5n0xZ6JriH83g/CTv7s4AymBuorpZ72HlPzYipb0U0Fj9f4S1MHCLk4lVzJ2QUwaop/U3qhWqm8bYHTPKRIINwGnTIZ1zAZfLdjvFgLPLTFW+25N4h18CZfpaGQqjyc/yKdoGyWmupwBFAnz/AqZn2Gq4uqbOUDL8kaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k2r7Gph6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4Xo8J021709;
	Thu, 17 Jul 2025 07:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3xU7SfH1f9xaMo6eYaTrPlYIKzLbU+yOb+Kv0YiFCr0=; b=k2r7Gph6U0l4axX5
	ChUo+8PakGfKsjX5gmvuhf82w/phWPT/eu692C7q57JDNnWfxEvTS2kbrWcUxKf9
	bdQ/Le3WMx7me4SFo3DVAA0jR+m2p/Zv+etpkja2nJMcpNe7m003mX2yDlkiPJKB
	vSncn+LXpQgUkwaVDAIwGyokF0EVbl6U6bVQFK4F/Kg6itvcx1FRTEQ78FHYQrLP
	EpiFrChK+N32Yy8VvJasoiCFsmPgNTTLe9RmCzpLQn0t6D7zNTmMKO/H42u+4L7S
	uQDaKwBuTApG20x2rgQIGJ4qJz6WLzl1CiZQJ+uUV2h8UWvjZ9GGjZMcSjlYo9vu
	PTtLuw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8ekqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 07:37:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H7bQ6X011930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 07:37:26 GMT
Received: from [10.50.48.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 17 Jul
 2025 00:37:22 -0700
Message-ID: <1c5df071-7000-ab45-dbc6-4384d883ba24@quicinc.com>
Date: Thu, 17 Jul 2025 13:07:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
 <20250714-sm8750-iris-v1-3-3006293a5bc7@linaro.org>
 <7b0a984f-b62a-ac4d-74bf-a6e839c59272@quicinc.com>
 <d4c39f2c-9f95-4e65-87a3-78173b39adf1@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <d4c39f2c-9f95-4e65-87a3-78173b39adf1@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA2NiBTYWx0ZWRfX/9v9rN03FwsX
 PtmqBGqbWn5BlOzyblmMlSkRjo9F9hwBdd9b0RhzxMizlkAVCBsKXlK5YX4ebrgrGr/3+2L6ZBe
 vKiZgiGMwWaLdXgI6h19/LoSogerMyrnoDs52CZrAc9PIVdKUG3mb+30Mcc11AOdUzrWRCHHe1d
 FS4xiGLkKZd6tY8mPTQmJgDGzf0wID1aABcFeuVL4CVDZwYDPgAioRA2kep2i1BII3wA9F8IKum
 TqUgOR5NY2rRY/LPDLLgTJEVd7zA3sCthNXeHVxQ+vdJxfS422yaUBOD9rSQrmFAVLg9jnhvjkM
 lHiq0tpaxCESxPqX9PfipR3VZ/UlvZB9aRPa9F9V8Q83FWkblMA6JikOK0BelpuZRwPj7iw/QxZ
 q/2OFCowrMz/VhZVl/xjhNEVVL0xbZKzisr3qoFMn6wC7LHmj9xyU7lFbSHhMp+pWlOyMvsr
X-Proofpoint-ORIG-GUID: wBSmapMbFYVvbVxXlMMGbdjn7vAWfgIv
X-Proofpoint-GUID: wBSmapMbFYVvbVxXlMMGbdjn7vAWfgIv
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6878a837 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=naxSXyrHOhEljO64-y4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170066



On 7/16/2025 2:58 PM, Krzysztof Kozlowski wrote:
> On 16/07/2025 11:10, Dikshita Agarwal wrote:
>>
>>
>> On 7/14/2025 7:11 PM, Krzysztof Kozlowski wrote:
>>> Add support for SM8750 Iris codec with major differences against
>>> previous generation SM8650:
>>>
>>> 1. New clocks and new resets, thus new power up and power down
>>>    sequences,
>>>
>>> 2. New WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0 register programmed
>>>    during boot-up
>>>
> 
> 
> 
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.
> 
> 
>>> +struct iris_platform_data sm8750_data = {
>>> +	.get_instance = iris_hfi_gen2_get_instance,
>>> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>> +	.vpu_ops = &iris_vpu35_ops,
>>> +	.set_preset_registers = iris_set_sm8550_preset_registers,
>>> +	.icc_tbl = sm8550_icc_table,
>>> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>> +	.clk_rst_tbl = sm8750_clk_reset_table,
>>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
>>> +	.bw_tbl_dec = sm8550_bw_table_dec,
>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>>> +	.pmdomain_tbl = sm8550_pmdomain_table,
>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>>> +	.opp_pd_tbl = sm8550_opp_pd_table,
>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>> +	.clk_tbl = sm8750_clk_table,
>>> +	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
>>> +	/* Upper bound of DMA address range */
>>> +	.dma_mask = 0xe0000000 - 1,
>>> +	.fwname = "qcom/vpu/vpu35_4v.mbn",
>> Could you clarify where this firmware has been merged? Also, it appears
>> that the naming convention hasn't been followed.
> 
> 
> I mentioned in the DTS patchset but not here, so I will add it in the
> cover letter - firmware is not released. About the name I cannot
> comment, that's the name I got from qcom. Happy to use whatever name you
> prefer.
> 


You can name it vpu35_p4.mbn to maintain consistency with the current
naming convention.


> 
> 
>>> +static int iris_vpu35_power_on_hw(struct iris_core *core)
>>> +{
>>> +	int ret;
>>> +	u32 val;
>>> +
>>> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Switch GDSC to SW control */
>>> +	writel(0x0, core->reg_base + WRAPPER_CORE_POWER_CONTROL);
>> GDSCs have been transitioned from HW_CTRL to HW_CTRL_TRIGGER, placing them
>> under software control by default, what is the need of doing this?
>>> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_CORE_POWER_STATUS,
>>> +				 val, val & BIT(1), 200, 2000);
> 
> 
> The need comes from differences between this and previous generation,


which previous generation you’re referring to?
HW_CTRL_TRIGGER is supported on SM8550 and all later SOCs, and if you look
at videocc changes, same applies to SM8750 as well.



> mostly based on downstream sources. I think the hardware just did not
> boot up without it.


That shouldn’t be the case. The downstream design is different, which is
why the driver requires the above code to move the GDSC to software control
before enabling the clock. With HW_CTRL_TRIGGER, this step isn’t needed, so
the above code is unnecessary.


> 
> You need to fix your email client to add line breaks around your
> replies, because it is very difficult to spot them. It's close to
> impossible...
> 
> 
>>> +	if (ret)
>>> +		goto err_disable_power;
>>> +
>>> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
>>> +	if (ret)
>>> +		goto err_gdsc;
>>> +
>>> +	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
>>> +	if (ret)
>>> +		goto err_disable_axi_clk;
>>> +
>>> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
>>> +	if (ret)
>>> +		goto err_disable_hw_free_clk;
>>> +
>>> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>>> +	if (ret)
>>> +		goto err_disable_hw_clk;
>>> +
>>> +	return 0;
>>> +
>>> +err_disable_hw_clk:
>>> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>>> +err_disable_hw_free_clk:
>>> +	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>>> +err_disable_axi_clk:
>>> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>>> +err_gdsc:
>>> +	writel(BIT(0), core->reg_base + WRAPPER_CORE_POWER_CONTROL);
>>> +err_disable_power:
>>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void iris_vpu35_power_off_hw(struct iris_core *core)
>>> +{
>>> +	u32 val = 0, value, i;
>>> +	int ret;
>>> +
>>> +	if (iris_vpu3x_hw_power_collapsed(core))
>>> +		goto disable_power;
>>> +
>>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>> +	if (value)
>>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>> +
>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>>> +					 val, val & 0x400000, 2000, 20000);
>>> +		if (ret)
>>> +			goto disable_power;
>>> +	}
>>> +
>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>>> +				 val, val & BIT(0), 200, 2000);
>> what are you polling here for?
> 
> 
> This is not different than existing code. I don't understand why you are
> commenting on something which is already there.

Which code are you referring to?

You are not setting AON_WRAPPER_MVP_NOC_LPI_CONTROL and polling for its status.

The current code is incomplete and missing several steps.
Please review and provide a corrected version.


> 
>>> +	if (ret)
>>> +		goto disable_power;
>>> +
>>> +	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
>> Could you share the reference for this sqeunece, this looks half-cooked.
>> Would recommend following Hardware programmin guide(HPG) for this.
> 
> 
> Why? Look at existing code. It's the same.


Which existing code? Please be specific.
I don't think you referred to downstream code for this, because I see a lot
of missing pieces here.


> 
> I think I responded to all your comments - it barely possible to spot
> them in the quote.
> 


No, you have missed some of the later comments. Since the code is snipped,
I can’t point out those comments here.


Thanks,
Dikshita

> Best regards,
> Krzysztof

