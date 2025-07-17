Return-Path: <linux-media+bounces-37993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA96B08B52
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C30E63BC6CD
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7543A2C3260;
	Thu, 17 Jul 2025 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d/ro+U+1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F9B7262E;
	Thu, 17 Jul 2025 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749484; cv=none; b=luSDcfD8lFpMumALegnEkFLE01P32WBVwsfe8MdhyTMYqRsntIT2MgFy2srUMmmWCapTg1CxrMr33FwYdGtfAsEqUd+claTFlIqXBQC/duzlLf6AG3ultQcNvCalk92UKnbKyRdkUfchfhkX/kDwemQr/c+xAHxLepI9ffs5G90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749484; c=relaxed/simple;
	bh=Qv8vcI2Jd1flxciSTrXZJ8ZjpsNQbDp78DedBxn/xxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sjMGQjeYj77DcQpWEA6T0a/SfDuSHRv6d4IA4USD7Pm3OoeloI0p4m1sbTuLsjSZE+CINit7IYS6QPsYbq4qXyG1QME2R0W98iRFGojHLCmG2f+64QqoIPImZWjhwzTxZekLWAKrK00MJHdF8Fe6z4xQlE3N4TrsMkHPE8oLQig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d/ro+U+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H44NEx028071;
	Thu, 17 Jul 2025 10:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6VodJFMVyTDfpe7Rbdu8DDTsqwESTlDyalom0vwmj8=; b=d/ro+U+1sydm4y2N
	tkUg1xwsBcHYQqWRsMhNs7XZuMLlNfxM3TR52N+TbFC7nfhGvcojypZVzZ+gsQl/
	nn2P/TkpB60H3Mg7MG48Wxik3gz9lICWSC26TWDlnl7C8L1WVQkSiiD+Gf/2uaej
	0OoXqiVkSa8nCmWvC2fgJRpb6cR8iNjwZi6hTXpce0oyFZO6we5SSjS/MnFjRG3Q
	nihkmDpvwU2PBRTPnHpYGs4I4FGilX6ZogBfoyLe/ROC920kGYR+mqoWsVizPVZ8
	nG8KXveh2sEA9j0ywqSgFvPJJSr7QxMnd/snObq74gc4vmI4dU9OAMxPrHZfRy4i
	mw7g1A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5yj96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 10:51:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56HAp4d7012210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 10:51:04 GMT
Received: from [10.50.48.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 17 Jul
 2025 03:51:00 -0700
Message-ID: <3a87c37b-b392-598a-736f-bb01e4c311e1@quicinc.com>
Date: Thu, 17 Jul 2025 16:20:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] media: iris: Add support for SM8750 (VPU v3.5)
Content-Language: en-US
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
 <1c5df071-7000-ab45-dbc6-4384d883ba24@quicinc.com>
 <a6dbca7e-4d49-49a6-987c-8cd587501c98@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <a6dbca7e-4d49-49a6-987c-8cd587501c98@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6878d599 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=-Vo14gtgsI97BMhYhb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RmyqrM8I9XoPx-sGx3SlNsbJUH52w3PR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5NSBTYWx0ZWRfX4aeM322QCMha
 wV2n/WdT4M7rgauYfFHkse66hSDu94S+7y+TP6E8OHQKJfSVqo1/dqYPf7ZsG4feuV88aOD1IOI
 80JWpQ55D9DZsq3zjucWX48ZsU92bUfgDVAq4+gCQlh++oH5asHoRgfFEan3u8eNmXq8Sy0Ss7F
 G2kFfwFwx83pzMuxbIPTrrS3SEkY1HVyq7pCUoDdlYzVX5Mj38SyCsCkPolQz7tsXvISi2rp3Qr
 dRBIzk9f3VtZ9qyXQnKVxS/98AQx7ctANGdFMJRDqATEUIB6cwDoIK3sxVD9wCZ0vYmjOP0x0CW
 qbE0vXT0xStUhNZF3HZPwPCus605QQWYfhD9IB2TRBpSgan01Z41zZVWi2I2hX+EglYAGOlN3BW
 GbWJRuYhv3AM9I9b6iM/laiaiyyv7q4Qv9HlhK6pgfr2tqd54kdQ/4OjdoZbzbcgc+w5HGup
X-Proofpoint-ORIG-GUID: RmyqrM8I9XoPx-sGx3SlNsbJUH52w3PR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170095



On 7/17/2025 3:04 PM, Krzysztof Kozlowski wrote:
> On 17/07/2025 09:37, Dikshita Agarwal wrote:
>>>>> +	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
>>>>> +	/* Upper bound of DMA address range */
>>>>> +	.dma_mask = 0xe0000000 - 1,
>>>>> +	.fwname = "qcom/vpu/vpu35_4v.mbn",
>>>> Could you clarify where this firmware has been merged? Also, it appears
>>>> that the naming convention hasn't been followed.
>>>
>>>
>>> I mentioned in the DTS patchset but not here, so I will add it in the
>>> cover letter - firmware is not released. About the name I cannot
>>> comment, that's the name I got from qcom. Happy to use whatever name you
>>> prefer.
>>>
>>
>>
>> You can name it vpu35_p4.mbn to maintain consistency with the current
>> naming convention.
> 
> 
> Sure.
> 
>>
>>
>>>
>>>
>>>>> +static int iris_vpu35_power_on_hw(struct iris_core *core)
>>>>> +{
>>>>> +	int ret;
>>>>> +	u32 val;
>>>>> +
>>>>> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	/* Switch GDSC to SW control */
>>>>> +	writel(0x0, core->reg_base + WRAPPER_CORE_POWER_CONTROL);
>>>> GDSCs have been transitioned from HW_CTRL to HW_CTRL_TRIGGER, placing them
>>>> under software control by default, what is the need of doing this?
>>>>> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_CORE_POWER_STATUS,
>>>>> +				 val, val & BIT(1), 200, 2000);
>>>
>>>
>>> The need comes from differences between this and previous generation,
>>
>>
>> which previous generation you’re referring to?
> 
> 
> The one I mentioned in the commit msg - SM8650.
> 
>> HW_CTRL_TRIGGER is supported on SM8550 and all later SOCs, and if you look
>> at videocc changes, same applies to SM8750 as well.
>>
>>
>>
>>> mostly based on downstream sources. I think the hardware just did not
>>> boot up without it.
>>
>>
>> That shouldn’t be the case. The downstream design is different, which is
>> why the driver requires the above code to move the GDSC to software control
>> before enabling the clock. With HW_CTRL_TRIGGER, this step isn’t needed, so
>> the above code is unnecessary.
>>
>>
>>>
>>> You need to fix your email client to add line breaks around your
>>> replies, because it is very difficult to spot them. It's close to
>>> impossible...
>>>
>>>
>>>>> +	if (ret)
>>>>> +		goto err_disable_power;
>>>>> +
>>>>> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
>>>>> +	if (ret)
>>>>> +		goto err_gdsc;
>>>>> +
>>>>> +	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
>>>>> +	if (ret)
>>>>> +		goto err_disable_axi_clk;
>>>>> +
>>>>> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
>>>>> +	if (ret)
>>>>> +		goto err_disable_hw_free_clk;
>>>>> +
>>>>> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>>>>> +	if (ret)
>>>>> +		goto err_disable_hw_clk;
>>>>> +
>>>>> +	return 0;
>>>>> +
>>>>> +err_disable_hw_clk:
>>>>> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>>>>> +err_disable_hw_free_clk:
>>>>> +	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>>>>> +err_disable_axi_clk:
>>>>> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>>>>> +err_gdsc:
>>>>> +	writel(BIT(0), core->reg_base + WRAPPER_CORE_POWER_CONTROL);
>>>>> +err_disable_power:
>>>>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static void iris_vpu35_power_off_hw(struct iris_core *core)
>>>>> +{
>>>>> +	u32 val = 0, value, i;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (iris_vpu3x_hw_power_collapsed(core))
>>>>> +		goto disable_power;
>>>>> +
>>>>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>>>> +	if (value)
>>>>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>>>> +
>>>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>>>> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>>>>> +					 val, val & 0x400000, 2000, 20000);
>>>>> +		if (ret)
>>>>> +			goto disable_power;
>>>>> +	}
>>>>> +
>>>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>>>>> +				 val, val & BIT(0), 200, 2000);
>>>> what are you polling here for?
>>>
>>>
>>> This is not different than existing code. I don't understand why you are
>>> commenting on something which is already there.
>>
>> Which code are you referring to?
> 
> To the existing vpu33 which had Reviewed-by: Vikash Garodia
> <quic_vgarodia@quicinc.com>
> 
> You understand that everything here is the same, everything is a copy
> while adding just few more things?
> 
> My patch is not doing in this respect anything different that what you
> reviewed.
> 

It seems to have been missed in vpu33 power off sequence as well and should
be fixed.

Still, as mentioned earlier as well, your reference should be
HPG/downstream driver of SM8750 not the previous generation (SM8650).

Thanks,
Dikshita

> 
>>
>> You are not setting AON_WRAPPER_MVP_NOC_LPI_CONTROL and polling for its status.
> 
> True, neither old reviewed code has done. I am not changing or fixing
> any existing logic, I am only adding new clocks and resets.
> 
>>
>> The current code is incomplete and missing several steps.
> 
> Current you mean what was:
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ?
> 
>> Please review and provide a corrected version.
>>
>>
>>>
>>>>> +	if (ret)
>>>>> +		goto disable_power;
>>>>> +
>>>>> +	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
>>>> Could you share the reference for this sqeunece, this looks half-cooked.
>>>> Would recommend following Hardware programmin guide(HPG) for this.
>>>
>>>
>>> Why? Look at existing code. It's the same.
>>
>>
>> Which existing code? Please be specific.
> 
> 
> Existing upstream VPU33 which this builts on top of. And that existing
> upstream VPU33 was Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> 
>> I don't think you referred to downstream code for this, because I see a lot
>> of missing pieces here.
>>
>>
>>>
>>> I think I responded to all your comments - it barely possible to spot
>>> them in the quote.
>>>
>>
>>
>> No, you have missed some of the later comments. Since the code is snipped,
>> I can’t point out those comments here.
> 
> 
> It's impossible to find them in the original response.
> 
> 
> Best regards,
> Krzysztof

