Return-Path: <linux-media+bounces-34489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6EAD4827
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 03:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCEF0189A8BC
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 01:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059BB14F9F9;
	Wed, 11 Jun 2025 01:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SspwfqCl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A91B960;
	Wed, 11 Jun 2025 01:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749606419; cv=none; b=SbjPJ8YvvcbUJZ5QGjbD+F5TPXBIEaO3dQSfiePMVOeX6mDADEeN+pdRFaA6CIvHZtBfkQzvDIUcLx7JH3EfqsZMyo+MGgjI9lrRsSejEpKi2gPmFbiP191GE0zgkZhwUcSOD9s0KHmYLSkN49nwVED92YQIfkC22yQVOwQBbwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749606419; c=relaxed/simple;
	bh=YvR/YQNOuRzwgj2S3Hl8+PzCdzJrDRJdTlry5kKBF+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qLf2o9eHSa3ZbST1LIVw7gLlEiBHcjVaqP8LBntN/mUX4hijUljJSsL/5FrEFsdITpSxW/Sx5AEHP8yt13eOVuvMHIf0Cqk9tDUYCudFowek1gWakeM/mH9h4dbCdyDVFyE1j5E/RooKK2mRtJNZ69W+BT/D7jhLjgW4Odzc4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SspwfqCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPr6e028710;
	Wed, 11 Jun 2025 01:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l82STVtCU6R80dx9yP/eIowJs4LM6MV86jS2Xmqb+f8=; b=SspwfqClIFAmLMCs
	Y8DmEb52NyHMPWdjZEzLhhGzAAwXU5uPP0JzclO0V4paBHul02SujXV4jCfJX0ak
	C7FlN7zw2dFc9DRKmTTltC+ErWFhAkLjhSBfrDfrjVLjG81AZBZDcADZX/nzmgJw
	BwZTXN3DrnzSEgQ1Myjg0Qd3r3r/yEcUMcBM0BhPThzZh3PQmK6WZBxiQAH+G6wT
	yQ6EplDUEbHskrbuAOSaRbstE4sXEnXGNzajgkuDIdmVeIGPGTb41M2RAp0Ceh0f
	9tv+mDzrkbg8iBUnluxRyWzBR20mwEBcvUkv2p4R2t5inLI1uyAe4lBh16ALU7pR
	nDyEWg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrha9c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 01:46:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55B1kpmx011171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 01:46:51 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Jun
 2025 18:46:48 -0700
Message-ID: <a23d759a-9048-42e8-b72d-34c1e913e7fe@quicinc.com>
Date: Wed, 11 Jun 2025 09:46:46 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: pm_helpers: use opp-table for the frequency
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250610-use_freq_with_opp_table-v1-1-7339d690fd1a@quicinc.com>
 <76e40130-897e-4547-8d5a-a0054f123fbe@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <76e40130-897e-4547-8d5a-a0054f123fbe@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6848e00c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=wZNEWwjKhD01ZXd6ls4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: b2Ad2H_6p6vXQ88tKY_CRrCwDWsIcyO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAxNCBTYWx0ZWRfXyOsP4ilC+EAB
 /EIeMZGhEO8FClBzEZav0KiZ6s3nf7vpHsSzFSjgx63G4S3FdD/8qUcx3xloVJmW7jNcbDsXKi5
 +w6h9LwOJhAvFa5Hx7A8Gr3RiqVRLWSi25t6z+BtL8MGEsiceGlKC6/LFtUyLdKSZDs8Fhr6eIM
 Dtsk6GWGfK0pAzUcCFI7DVTk08d+gOlvVWnvWOKX0yWYwyvEyFVlDNn6XUr6D9nU+z5WNLEI9lR
 or2CctPOXKJo7cD0SSs1D5wbCUw3YVGuUmoP5oPFGFI3EGGDukdrMipJNjpv081nj/v3Cplxak1
 hs+J0gH0dic3XsG1OtEfrRKR6mwK/XL2NejQkR94rvo67/+tYzdK+JUbxLAuoAwBe5MpbkzU6t5
 cRPoErBFhdpUWSNb8p3oedyCRWxJvpMXLd1HcKdy/Dh56EsPTjk9QP+1gXgQ6+MT6am+pvsf
X-Proofpoint-GUID: b2Ad2H_6p6vXQ88tKY_CRrCwDWsIcyO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110014


On 6/11/2025 3:01 AM, Bryan O'Donoghue wrote:
> On 10/06/2025 10:13, Renjiang Han wrote:
>> The frequency values in the opp-table of the device tree and the 
>> freq_tbl
>> in the driver are the same. So the driver can choose either table for 
>> freq
>> values.
>
> I'd completely drop this sentence as you basically contradict it in 
> the next line.
>
>> However, 
>
> Drop
>
> some platforms (such as qcs615 and sc7180) use the same core but
>> have different frequency tables. Using the opp-table allows us to 
>> separate
>> the core description from the frequency data and supports the use of
>> fallback compatibles.
>
> This is a bit better.
>
> Basically you can have identical bindings, even identical compats but 
> for reasons such as binning of silicon parts you might run at higher 
> or lower frequencies so static tables in the driver are not 
> appropriate and are better represented in the DT.
>
>
>> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>> The frequency values in the opp-table of the device tree and the 
>> freq_tbl
>> in the driver are the same. So the driver can choose either table for 
>> freq
>> values.
>>
>> However, some platforms (such as qcs615 and sc7180) use the same core 
>> but
>> have different frequency tables. Using the opp-table allows us to 
>> separate
>> the core description from the frequency data and supports the use of
>> fallback compatibles.
>>
>> Therefore, it is necessary to update pm_helpers.c to use the frequency
>> values from the opp-table for the v4 core.
>>
>> Note:
>> Earlier discussion was concluded in [1] where it was agreed to rely on
>> opp-table for QCS615.
>>
>> [1] 
>> https://lore.kernel.org/linux-arm-msm/c9b83c8b-68d1-43bc-99d6-d2d2b9e445f4@oss.qualcomm.com/
>> ---
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 58 
>> +++++++++++++++-----------
>>   1 file changed, 34 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c 
>> b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 
>> 409aa9bd0b5d099c993eedb03177ec5ed918b4a0..8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390 
>> 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -41,16 +41,14 @@ static int core_clks_get(struct venus_core *core)
>>   static int core_clks_enable(struct venus_core *core)
>>   {
>>       const struct venus_resources *res = core->res;
>> -    const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>> -    unsigned int freq_tbl_size = core->res->freq_tbl_size;
>> -    unsigned long freq;
>> +    struct device *dev = core->dev;
>> +    unsigned long freq = 0;
>> +    struct dev_pm_opp *opp;
>>       unsigned int i;
>>       int ret;
>>   -    if (!freq_tbl)
>> -        return -EINVAL;
>> -
>> -    freq = freq_tbl[freq_tbl_size - 1].freq;
>> +    opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>> +    dev_pm_opp_put(opp);
>>         for (i = 0; i < res->clks_num; i++) {
>>           if (IS_V6(core)) {
>> @@ -636,7 +634,9 @@ static int decide_core(struct venus_inst *inst)
>>       u32 min_coreid, min_load, cur_inst_load;
>>       u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
>>       struct hfi_videocores_usage_type cu;
>> -    unsigned long max_freq;
>> +    unsigned long max_freq = ULONG_MAX;
>> +    struct device *dev = core->dev;
>> +    struct dev_pm_opp *opp;
>>       int ret = 0;
>>         if (legacy_binding) {
>> @@ -659,7 +659,8 @@ static int decide_core(struct venus_inst *inst)
>>       cur_inst_lp_load *= inst->clk_data.low_power_freq;
>>       /*TODO : divide this inst->load by work_route */
>>   -    max_freq = core->res->freq_tbl[0].freq;
>> +    opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
>> +    dev_pm_opp_put(opp);
>>         min_loaded_core(inst, &min_coreid, &min_load, false);
>>       min_loaded_core(inst, &min_lp_coreid, &min_lp_load, true);
>> @@ -949,7 +950,10 @@ static int core_resets_get(struct venus_core *core)
>>   static int core_get_v4(struct venus_core *core)
>>   {
>>       struct device *dev = core->dev;
>> +    const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>> +    unsigned int num_rows = core->res->freq_tbl_size;
>>       const struct venus_resources *res = core->res;
>> +    unsigned int i;
>>       int ret;
>>         ret = core_clks_get(core);
>> @@ -986,9 +990,17 @@ static int core_get_v4(struct venus_core *core)
>>         if (core->res->opp_pmdomain) {
>>           ret = devm_pm_opp_of_add_table(dev);
>> -        if (ret && ret != -ENODEV) {
>> -            dev_err(dev, "invalid OPP table in device tree\n");
>> -            return ret;
>> +        if (ret) {
>> +            if (ret == -ENODEV) {
>> +                for (i = 0; i < num_rows; i++) {
>> +                    ret = dev_pm_opp_add(dev, freq_tbl[i].freq, 0);
>> +                    if (ret)
>> +                        return ret;
>> +                }
>> +            } else {
>> +                dev_err(dev, "invalid OPP table in device tree\n");
>> +                return ret;
>> +            }
>>           }
>>       }
>>   @@ -1078,11 +1090,11 @@ static unsigned long 
>> calculate_inst_freq(struct venus_inst *inst,
>>   static int load_scale_v4(struct venus_inst *inst)
>>   {
>>       struct venus_core *core = inst->core;
>> -    const struct freq_tbl *table = core->res->freq_tbl;
>> -    unsigned int num_rows = core->res->freq_tbl_size;
>>       struct device *dev = core->dev;
>>       unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
>> +    unsigned long max_freq = ULONG_MAX;
>>       unsigned long filled_len = 0;
>> +    struct dev_pm_opp *opp;
>>       int i, ret = 0;
>>         for (i = 0; i < inst->num_input_bufs; i++)
>> @@ -1108,20 +1120,18 @@ static int load_scale_v4(struct venus_inst 
>> *inst)
>>         freq = max(freq_core1, freq_core2);
>>   -    if (freq > table[0].freq) {
>> -        dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock 
>> rate : %lu\n",
>> -            freq, table[0].freq);
>> +    opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
>> +    dev_pm_opp_put(opp);
>>   -        freq = table[0].freq;
>> +    if (freq > max_freq) {
>> +        dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock 
>> rate : %lu\n",
>> +            freq, max_freq);
>> +        freq = max_freq;
>>           goto set_freq;
>>       }
>>   -    for (i = num_rows - 1 ; i >= 0; i--) {
>> -        if (freq <= table[i].freq) {
>> -            freq = table[i].freq;
>> -            break;
>> -        }
>> -    }
>> +    opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>> +    dev_pm_opp_put(opp);
>>     set_freq:
>>
>> ---
>> base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
>> change-id: 20250610-use_freq_with_opp_table-b81162cfecba
>>
>> Best regards,
> Please make your commit log more succinct and precise then add.
Sure, thanks for your comment. I'll update this with next version.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> ---
> bod

-- 
Best Regards,
Renjiang


