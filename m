Return-Path: <linux-media+bounces-30918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B83EFA9A71A
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8AAC1889582
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 08:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EED214A7F;
	Thu, 24 Apr 2025 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XwfNiuGe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC671FFC50;
	Thu, 24 Apr 2025 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484741; cv=none; b=pPC9jEhsoIBLJ+zWOpu6HNgn9BdAGm31CN9ZRU3QHdKJFDj+GGykch7jW4L7oEL7qX9JWNllzZdUz1pL/KUMlKuu5tvSCc3U8+keNoKwPTHZFz5A1XT4nQO0rtaOyW6gS3JL0SPNz6Wamen4H2OjzELzz/nKKDWYs8DXRHkG6hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484741; c=relaxed/simple;
	bh=VURVMKibtWxo5uPYtparEJX18AcVYtvUtcNSG06n9OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LsWtJIZkaNhkpYWn3v4p+QXDT8beVWrSOGG/Ta6RZYwYUjxXIp6Jknyv7R6/K2/6YtdUK5dlrwwBh9msbc9dt9ItCQNk5Ixi26ts9YXEGRepNhZRcVvksDxrUjiv7TitvtYTu4Hs8bDlfJSsT3NyiYexnrD4tfgE2GarDAM9GcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XwfNiuGe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7V8010257;
	Thu, 24 Apr 2025 08:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QM7NUeR6+TyncQc3MZVLLshGxpskdfo3nAeDzqZT06M=; b=XwfNiuGem3TF8dmF
	uYifKwXa2YQOJ1M+VWyxVzBnZuq7fWTSiknZzXXDfhSXp5QKILwezP/vxGLasMd6
	43lOxpC2oU43WDqmWMx3eH3BGP4N/4/WnL2R+rwTlLhBrJahmOFm6ifhMopkbFfW
	3vT2xIILkLDP6XUZP6T9wq2m7kOb0yXJOSoQgYhABoexfMMZkf+pbLdfEWT3u75R
	PwL0TAoYH2odGKIJFUDptWLVYXY0NFq0BPiwbz9YN8EXTQpLwSZCD/lRqWa0gAKu
	X5Chs69FpmLRMMF17pKaZqAbvIWXaWeKMifdLfavbmMnXU+a6CIXDo5wnLfYUP0T
	gWAaAw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mus4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:52:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O8qFvO012884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:52:15 GMT
Received: from [10.216.12.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 01:52:11 -0700
Message-ID: <3fb7883e-6361-5e5e-44c6-faf94cc05845@quicinc.com>
Date: Thu, 24 Apr 2025 14:22:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 1/5] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
 <20250424-qcs8300_iris-v4-1-6e66ed4f6b71@quicinc.com>
 <20250424-accomplished-therapeutic-chachalaca-9820de@kuoka>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250424-accomplished-therapeutic-chachalaca-9820de@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Y8LJBVDFGA84EkBeOa2tA1k9Whb4xfIv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1OCBTYWx0ZWRfX4lFrJX122CP+ xZWZjqLKzApb8HC1A8orrZBmT2CCfF3BwxQ+VMbNj8a3voimo66bqWsOY0u4wMZsCp1T7G46Ak7 zRSOIyBO8VebrE1XpDqczZ7TMiQliYpITmm6ad4dvwK6UtgiWQLUK5MwjNHWKzoSrrWXq3GBm+i
 K61OB76n0I2Ms/q1nAJC6KUfQqTfJ42suz55MsF/NoEPnfn5eeO/qQLqR9bQHfVF2y+IWN1Owcs Q1Bnz5ZkuGak4EuCdrmM7eutKOHE8lovU1bCFoACACCBaJFwgjIHJrnvhHnZ9c7bnxI0qE6ui8c 2oeZd5vZSAfJkY1l9RfMcTbSjAWWMoUSvRStmdmWYzfPhInXeIObYcHsQPJCL/+ZA2Y9P1aYWHm
 88ggCPmN8Px0uQzaZ6wWke3Mh8ffv6+GiicAhng0slk5gRZ+aLuB5l5kk9w8HOE0rT8GVrbA
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6809fbc0 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=4lJvxUY7EgyvqEalWRMA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Y8LJBVDFGA84EkBeOa2tA1k9Whb4xfIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240058


On 4/24/2025 1:13 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 24, 2025 at 01:03:31AM GMT, Vikash Garodia wrote:
>> Document the IRIS video decoder/encoder accelerator found in the QCS8300
>> platform. It belongs to same iris v3 family as that of SM8550 but is a
>> downscaled version of SM8550. It has 2 frame processing hardware blocks
>> while SM8550 has 4. Thereby QCS8300 have fewer capabilities than those
>> of SM8550.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>> This patch depends on patch
>> https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/
>> ---
>>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index f567f84bd60d439b151bb1407855ba73582c3b83..3dee25e99204169c6c80f7db4bad62775aaa59b5 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -24,6 +24,7 @@ properties:
>>        - enum:
>>            - qcom,sm8550-iris
>>            - qcom,sm8650-iris
>> +          - qcom,qcs8300-iris
> 
> Keep alphabetical order.
Sure, fixed in v5.

Regards,
Vikash
> 
> Best regards,
> Krzysztof
> 

