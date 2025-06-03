Return-Path: <linux-media+bounces-33962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 423CFACBE82
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 04:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1C8916E1D2
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 02:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC9C16F8E5;
	Tue,  3 Jun 2025 02:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QG5yk1Uk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCE4AD23;
	Tue,  3 Jun 2025 02:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748917907; cv=none; b=IzjfIgc1u04qmBhWchf24SrPNWoTASJWJkZBFI51x4VzTuEeV4i+GxGr5DrkCFoI8WJ10m9I4Yo7xRIX1O2sXiihW/gwKyzhSFo2y5F3is82IDEa4sKpsw8lnVlly+rpyGQH1RQJGy39MhSHdNxEnn/RJnz9pLBJPjfSvPPBZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748917907; c=relaxed/simple;
	bh=h1TyQ7Hzpcut+WJYMguyQinX+gpA4NmrGVePV2U5TY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sM8JQi4UnsXgsfAnx/iJVkTDAzgS10iV+QhoozXEB8g0fxLvRR1q3YsHUKkWJiOXt9xSeZVuUtpyjx54ookg31ytygvY1tIKwdXnXGQRbpYRM2PbcG9STSej9L5XRQ7Z/zGjdGkKG3ANF5KDDh5vU9apoy9g3Joznf6eglgf9Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QG5yk1Uk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJuam007615;
	Tue, 3 Jun 2025 02:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	meRt4ahDxVYG60jGrlnC5o62qbJDbDs09Cdec7Gm7Ds=; b=QG5yk1Ukt+Fuu5wc
	FFTYMj1LiORE8lg+44BCpY3POvhuFwVx9k3vNtC922VOexmupzUAOhS7L595F40b
	1hKhBU+yBVK3WmE2xLxb/IiPeIkKaUofkn69seUPc5BidwpbTlkwUMM8SZWA2Qva
	oMxnNGdQcuvtgIy1uNaHJugNX9vXreS4DBfOphNwSboTgkwTfP2eVt7ak8RYOYZI
	q1nQWtIONS149nN1B5opfHqmt7+JepSeUM8x96oj0CkXG2mZ24nTbK7xZMK8f3Xr
	bh3W8tWPBsS/a8pVYhJKuM7XBt/SCfKQEewmXJ7NaTNidElQj1TN2ZC9fv716B4l
	xcUTxw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t92t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 02:31:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5532VdxL015645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 02:31:39 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Jun 2025
 19:31:36 -0700
Message-ID: <b1293a1a-e3bf-4e05-835d-0e1908417e88@quicinc.com>
Date: Tue, 3 Jun 2025 10:31:13 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: venus: pm_helpers: use opp-table for the
 frequency
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
 <pyaoow6swlbazljgvav2vghixmb7swd4nkahqvxnhd6gsde26f@myhtwp72qxz7>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <pyaoow6swlbazljgvav2vghixmb7swd4nkahqvxnhd6gsde26f@myhtwp72qxz7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAyMCBTYWx0ZWRfX4KPrGMLC5HaU
 jpwIxqyGfZDo7eVr0WFMZd1lvxo/uYgxiE3SBOY4dfxcsnPo3GTFEMtW7EsPHqB+xasvLXY9L6u
 w4cFJFZx2HaP67QoarLqUimODiQvLgf7mwRShc5mspJ+EieuDcDi/7v/a0yWMLl4y01aYX2Knzi
 L32s/w+7SaLUn4C4NFm2FX6ioleV2/5ciJArrtANWHu7TLU+FCn56kO+/nEcnwRm8S1fDH5E8oW
 35Gj3U2LChsUUGt8FFz19eO9Ss43PUMGbf/asrM23zi6n6FCqof9Tg/0oHHifq/SrJoqqZO1aql
 fNEyWKa4HCfaqvwUUdyiz/mGKORmoWOnI/h+lFPQXkceflPbtoeCDlnVNXry0WGohPFzz4IIDat
 nVMZhPfnMWQO40o9U5fJy3+zbt3N5FzrZADJV1UouyKuNB7NCx0sehLgT4Z5PT06zXHNRL1v
X-Proofpoint-ORIG-GUID: M44Xnh9eu_9Y3jxaEK251-YQ_GQpnLCv
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683e5e8d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=fs00m1C2WEzYqrea_0YA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: M44Xnh9eu_9Y3jxaEK251-YQ_GQpnLCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030020


On 5/31/2025 4:26 AM, Dmitry Baryshkov wrote:
> On Fri, May 30, 2025 at 09:32:13AM +0530, Renjiang Han wrote:
>> The frequency value in the opp-table in the device tree and the freq_tbl
>> in the driver are the same.
>>
>> Therefore, update pm_helpers.c to use the opp-table for frequency values
>> for the v4 core.
> You are kind of missing the linking between the first two sentences. "The
> tables are the same, so use the second one." You need to explain that
> some of the platforms (provide examples) use the same core, but
> different frequency tables. Using OPP tables allows us to abstract core
> description from the frequency data and use fallback compatibles.
OK. Thanks for your comment. I'll update this message in next version.
>
>> If getting data from the opp table fails, fall back to using the frequency
>> table.
>>
>> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 53 +++++++++++++++++++-------
>>   1 file changed, 39 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 409aa9bd0b5d099c993eedb03177ec5ed918b4a0..434dd66076e8faf7f3feac6c29152789f8d2f81b 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -43,14 +43,20 @@ static int core_clks_enable(struct venus_core *core)
>>   	const struct venus_resources *res = core->res;
>>   	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>>   	unsigned int freq_tbl_size = core->res->freq_tbl_size;
>> +	struct device *dev = core->dev;
>> +	struct dev_pm_opp *opp;
>>   	unsigned long freq;
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
>> @@ -631,12 +637,15 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool lo
>>   
>>   static int decide_core(struct venus_inst *inst)
>>   {
>> +	const struct freq_tbl *freq_tbl = inst->core->res->freq_tbl;
>>   	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>>   	struct venus_core *core = inst->core;
>>   	u32 min_coreid, min_load, cur_inst_load;
>>   	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
>>   	struct hfi_videocores_usage_type cu;
>> -	unsigned long max_freq;
>> +	unsigned long max_freq = ULONG_MAX;
>> +	struct device *dev = core->dev;
>> +	struct dev_pm_opp *opp;
>>   	int ret = 0;
>>   
>>   	if (legacy_binding) {
>> @@ -659,7 +668,11 @@ static int decide_core(struct venus_inst *inst)
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
>> @@ -1082,7 +1095,9 @@ static int load_scale_v4(struct venus_inst *inst)
>>   	unsigned int num_rows = core->res->freq_tbl_size;
>>   	struct device *dev = core->dev;
>>   	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
>> +	unsigned long max_freq = ULONG_MAX;
>>   	unsigned long filled_len = 0;
>> +	struct dev_pm_opp *opp;
>>   	int i, ret = 0;
>>   
>>   	for (i = 0; i < inst->num_input_bufs; i++)
>> @@ -1108,19 +1123,29 @@ static int load_scale_v4(struct venus_inst *inst)
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


