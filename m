Return-Path: <linux-media+bounces-24202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7479FF64C
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 06:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4317C1882BC9
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 05:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099A6190059;
	Thu,  2 Jan 2025 05:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JBqKloBA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B255316C687;
	Thu,  2 Jan 2025 05:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735796326; cv=none; b=nRQ3PjVcH4uUmYV9YaFcQUEiX0JqNUHo4VilgV0seI2t94QDElBh3Me0JnqDvUCTpCjQitFpV1m05PDx/eaKFmXNFaRPvSZzJ7hBtXk0XPkLEnkR1JcDCggeofoH2qnm65jsTAJ54/4UUlfQ+c6VIZGr/fva6Ve9oCYVpSn8JMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735796326; c=relaxed/simple;
	bh=n7B0BlPaG+aNOq7uA983zTr0JCb9EuERJCD4gahLGR4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=jyxtpP37VyhkWs7Qk6FqowpDTTaQAuM/AlByofBEZTqDIiCGartblZjoLKpxwo1DuBWzdQq9DwTSo2IlrhiZRrNJkeVsan6q1QA/KW+utUpukc6gGDqRHjoBv0/sUQgkaXE0jXusMc8GbwWBgk1bQaLmh5AOfIpe9X5yjgQPORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JBqKloBA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 501Nj62r019497;
	Thu, 2 Jan 2025 05:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xZsNMqtXt8uuRlP+ujveF2vDuKINdvV3iuPLP3zM1QA=; b=JBqKloBAGeGoCIJC
	qA9dtyy/LNxRXFz3T+A6mxMR14iC0GfyVEGSUaB94UQSzVF4L63cRFLovAq6Yv5o
	DHCe7wjso80/xJQ832GvrCwjLyD9ruhRU//UMWwMfwxS51ULsGRnzy3RLY+qJIQ0
	906y9S6Bzp+FZusJuANTrTekSobogoCQ7c7RHNqr+AXbEO3fvGnghIB4muLciR1Q
	eCHKKgqnFRXXOEWTsW9QsJo1vNYxtfmKYN9zLcgnFus63R/X6nY/qEoF8PEI4K1E
	8XBENiDxdrQBgPgrRj8uMeGnlqbR6YEgWcvS9MA7xSdrAIJxBQkbB9j4hNA3Lq7s
	8wjbxg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43w5kks507-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 05:38:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5025cc5d014888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 05:38:38 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 1 Jan 2025
 21:38:35 -0800
Message-ID: <351a9654-ffa1-4727-b772-95d4ed113c81@quicinc.com>
Date: Thu, 2 Jan 2025 13:38:33 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: Re: [PATCH v6 2/4] media: venus: pm_helpers: use opp-table for the
 frequency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
 <20241219-add-venus-for-qcs615-v6-2-e9a74d3b003d@quicinc.com>
 <fde279ad-27ed-4947-a408-23139bcd270a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fde279ad-27ed-4947-a408-23139bcd270a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5o37YP0w1iExMEf45htdBRfSzvG2VFQH
X-Proofpoint-GUID: 5o37YP0w1iExMEf45htdBRfSzvG2VFQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020047


On 12/23/2024 10:17 PM, Konrad Dybcio wrote:
> On 19.12.2024 6:41 AM, Renjiang Han wrote:
>> The frequency value in the opp-table in the device tree and the freq_tbl
>> in the driver are the same.
>>
>> Therefore, update pm_helpers.c to use the opp-table for frequency values
>> for the v4 core.
>> If getting data from the opp table fails, fall back to using the frequency
>> table.
>>
>> Signed-off-by: Renjiang Han<quic_renjiang@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 53 +++++++++++++++++++-------
>>   1 file changed, 39 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..b61c0ad152878870b7223efa274e137d3636433b 100644
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
> I'm not super convinced how this could have ever worked without
> scaling voltage levels, by the way. Perhaps this will squash some
> random bugs :|
>
> Konrad
  Thanks for your comment.
  The default value of freq is 0, and then dev_pm_opp_find_freq_ceil is
  used to match freq to the maximum value in opp-table that is close to
  0. The frequency values ​​in opp-table and freq_tbl are the same, and
  dev_pm_opp_find_freq_ceil is used to assign the minimum value in
  opp-table to freq. So the logic is the same as before. I'm not sure if
  I've answered your concern.

-- 
Best Regards,
Renjiang


