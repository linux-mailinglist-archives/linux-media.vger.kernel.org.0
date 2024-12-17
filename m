Return-Path: <linux-media+bounces-23532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E49F42ED
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 06:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F7D91640CD
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 05:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709A11865E1;
	Tue, 17 Dec 2024 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="leUTkEwJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BCA15CD41;
	Tue, 17 Dec 2024 05:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734413554; cv=none; b=C9/HkYmGejBDbKSjvq59C16HlABrZfN17+jVCgAYv1P0kRWL8qGdO7IUAXR1lnFlxH4AxiI8Ixxg3HNCcAboFKYknxuyhehHtTLXuUzJjR7yzPv4ppb58DeNqaWDhgrWS/gcrJQ4coSj1qM0tuKm2s56/T9mx5r0UUzeJcTJi6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734413554; c=relaxed/simple;
	bh=XW8Gtseza8SSscN8pqqeDGmBBJP1e+xvDh1zucD+FJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YlBaKv+4jymGjLbELiCv2zRcj9WPggDbO0qR4hu+a3uwT6Gr5PNRazYbcb4syjaOKrCt6aoXm3zvWHC2VwrttQK4on4jV23YQ4N8vrpsdQEjJ0i3LTGCS/7aWmyOFXhweKXjUhzXvBLlYOBWSIhyG9BJS/nyHxRaF/w8XCyToB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=leUTkEwJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKt270011894;
	Tue, 17 Dec 2024 05:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ko/YZva7cHyZuDSFXCFLRiqJoa/wOi4lnzRHTAZruuU=; b=leUTkEwJ5WiP2Pec
	vwZdTmFLjXKGXuvbsyeZ04WVpuN9PwUKYmi8OD9vK5Yh7gP1XLs1xHpILd35NsvX
	K1d1B/BoZqYErgPB3YoAbD+FCRKwO4q+ClR4o7w3KQ8x3U1cDmqvu/a+EnezBEVY
	yO4xFXB9maedkug9UumNw4LwxYQ59lNwLFhndz+Uplou1pCG1l6epAcDXiW0vjdl
	kFHWRjfD7HibAHIjzv4cg4xa6ZQb+MKJ93r6idp7toArHxnZX2wOqx/ZO5YOxxTT
	p3aUmqNaeI6XOV4T4N42qAOFnWk6PWY2Ec3FhREWZ9S6Ys3gVXt0xpnVGbR7MMAD
	V4LwPA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43junjgwwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 05:32:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH5WQmh002522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 05:32:26 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 21:32:22 -0800
Message-ID: <70714bd9-e6a1-4104-b200-38f0019a107b@quicinc.com>
Date: Tue, 17 Dec 2024 13:32:19 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: venus: core: use opp-table for the
 frequency
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
 <20241213-add-venus-for-qcs615-v4-2-7e2c9a72d309@quicinc.com>
 <Z2BvrfYEaIqFcjwg@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <Z2BvrfYEaIqFcjwg@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x1qNujOq4FmitByvM-qVKZfGbAZ4O6GE
X-Proofpoint-GUID: x1qNujOq4FmitByvM-qVKZfGbAZ4O6GE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170044


On 12/17/2024 2:21 AM, Bjorn Andersson wrote:
> On Fri, Dec 13, 2024 at 03:26:47PM +0530, Renjiang Han wrote:
>> Get frequency value from the opp-table of devicetree for the v4 core.
>> For compatibility, if getting data from the opp table fails, the data
>> in the frequency table will be used.
>>
>> The order of variable definitions is adjusted only to keep the reverse
>> Christmas tree order coding style.
>>
> 1) Do the best you can to add your variables while trying to maintain
> the order, but if it's not possible better leave it than making it hard
> to parse logical change from shuffling of code.
OK, thanks for pointing it out.
>
> 2) This comment is useful during review, but not necessarily so in the
> git history, so I'd suggest to keep it below the '---' line.

  Do you mean that the message about my code style changes only needs

  to be added to the cover letter?
>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 67 ++++++++++++++++++--------
>>   1 file changed, 46 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..a5c3f9ad2088d8c80247b52d5c1b8e053f499bfe 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -40,17 +40,23 @@ static int core_clks_get(struct venus_core *core)
>>   
>>   static int core_clks_enable(struct venus_core *core)
>>   {
>> -	const struct venus_resources *res = core->res;
>>   	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>>   	unsigned int freq_tbl_size = core->res->freq_tbl_size;
>> -	unsigned long freq;
>> +	const struct venus_resources *res = core->res;
>> +	struct device *dev = core->dev;
>> +	unsigned long freq = 0;
> Is it really necessary to initialize this? I'd expect that
> dev_pm_opp_find_freq_ceil() would either initialize freq or return a
> failure, in which case you assign freq.

  Thanks for your review. There is really no need to initialize freq.

  The default value of freq is 0 here. dev_pm_opp_find_freq_ceil() will

  query the matching value from the opp table based on this default value.
>
> Perhaps the compiler isn't clever enough to see this?
>
>> +	struct dev_pm_opp *opp;
>>   	unsigned int i;
>>   	int ret;
>>   
>> -	if (!freq_tbl)
>> -		return -EINVAL;
>> -
>> -	freq = freq_tbl[freq_tbl_size - 1].freq;
>> +	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>> +	if (IS_ERR(opp)) {
>> +		if (!freq_tbl)
>> +			return -EINVAL;
>> +		freq = freq_tbl[freq_tbl_size - 1].freq;
>> +	} else {
>> +		dev_pm_opp_put(opp);
>> +	}
>>   
>>   	for (i = 0; i < res->clks_num; i++) {
>>   		if (IS_V6(core)) {
>> @@ -627,12 +633,15 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool lo
>>   
>>   static int decide_core(struct venus_inst *inst)
>>   {
>> +	const struct freq_tbl *freq_tbl = inst->core->res->freq_tbl;
>>   	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>> -	struct venus_core *core = inst->core;
>> -	u32 min_coreid, min_load, cur_inst_load;
>>   	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
>> +	u32 min_coreid, min_load, cur_inst_load;
>> +	struct venus_core *core = inst->core;
>>   	struct hfi_videocores_usage_type cu;
>> -	unsigned long max_freq;
>> +	unsigned long max_freq = ULONG_MAX;
>> +	struct device *dev = core->dev;
>> +	struct dev_pm_opp *opp;
> Here the line shuffling makes it hard to determine what is part of the
> logical change and what is just style changes...
>
> Regards,
> Bjorn

  You mean I only need to add variable definitions basing on the original

  order of variable definitions, and I don't need to modify the order of

  variable definitions specifically for the reverse Christmas tree code

  style. Is that right?
>
>>   	int ret = 0;
>>   
>>   	if (legacy_binding) {
>> @@ -655,7 +664,11 @@ static int decide_core(struct venus_inst *inst)
>>   	cur_inst_lp_load *= inst->clk_data.low_power_freq;
>>   	/*TODO : divide this inst->load by work_route */
>>   
>> -	max_freq = core->res->freq_tbl[0].freq;
>> +	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
>> +	if (IS_ERR(opp))
>> +		max_freq = freq_tbl[0].freq;
>> +	else
>> +		dev_pm_opp_put(opp);
>>   
>>   	min_loaded_core(inst, &min_coreid, &min_load, false);
>>   	min_loaded_core(inst, &min_lp_coreid, &min_lp_load, true);
>> @@ -1073,12 +1086,14 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
>>   
>>   static int load_scale_v4(struct venus_inst *inst)
>>   {
>> +	const struct freq_tbl *table = inst->core->res->freq_tbl;
>> +	unsigned int num_rows = inst->core->res->freq_tbl_size;
>> +	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
>>   	struct venus_core *core = inst->core;
>> -	const struct freq_tbl *table = core->res->freq_tbl;
>> -	unsigned int num_rows = core->res->freq_tbl_size;
>> +	unsigned long max_freq = ULONG_MAX;
>>   	struct device *dev = core->dev;
>> -	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
>>   	unsigned long filled_len = 0;
>> +	struct dev_pm_opp *opp;
>>   	int i, ret = 0;
>>   
>>   	for (i = 0; i < inst->num_input_bufs; i++)
>> @@ -1104,19 +1119,29 @@ static int load_scale_v4(struct venus_inst *inst)
>>   
>>   	freq = max(freq_core1, freq_core2);
>>   
>> -	if (freq > table[0].freq) {
>> -		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
>> -			freq, table[0].freq);
>> +	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
>> +	if (IS_ERR(opp))
>> +		max_freq = table[0].freq;
>> +	else
>> +		dev_pm_opp_put(opp);
>>   
>> -		freq = table[0].freq;
>> +	if (freq > max_freq) {
>> +		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
>> +			freq, max_freq);
>> +		freq = max_freq;
>>   		goto set_freq;
>>   	}
>>   
>> -	for (i = num_rows - 1 ; i >= 0; i--) {
>> -		if (freq <= table[i].freq) {
>> -			freq = table[i].freq;
>> -			break;
>> +	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>> +	if (IS_ERR(opp)) {
>> +		for (i = num_rows - 1 ; i >= 0; i--) {
>> +			if (freq <= table[i].freq) {
>> +				freq = table[i].freq;
>> +				break;
>> +			}
>>   		}
>> +	} else {
>> +		dev_pm_opp_put(opp);
>>   	}
>>   
>>   set_freq:
>>
>> -- 
>> 2.34.1
>>
-- 
Best Regards,
Renjiang


