Return-Path: <linux-media+bounces-30931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B5A9AA7B
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 12:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B72C19400E4
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922CA2367A5;
	Thu, 24 Apr 2025 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nsRkwkW5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD1B2356A3;
	Thu, 24 Apr 2025 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490531; cv=none; b=J0hsAgUJvGrhsnKvrqQx+iQIVgZFz+IScy6VRsfXTybp2Y7kKIOg7dO1J4i7GUBLh9eNVAony7mYyz+XBDAI1mvOXz1vRSH/Wu9VGsMb9g7I+Ozi+AM0njDH+u05x3LIhIXfFbpsWRBblKK0X9TG/s8QGkBFuiVid1I5kzZilLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490531; c=relaxed/simple;
	bh=fjBibVg0TAhDF6bexnN0iScy1Gh1RkE3bhaYxTCSFUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kv8NYeRzBK8/qeN4AG/lggv9s9j4sSKMNRAqw6krv60w/b/eZLiagPsOkHo3jrRO3TzmI8H+3sdGv7N8RCT2tSQCPUBeDkKjYTlUcXcAjzot5X2S+Y4YtzfdHPo54t8h4abJLNcjnJPGm/b9q5sQUbyf/Pky3/pJ8rSlQLmpxaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nsRkwkW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OADF1d011359;
	Thu, 24 Apr 2025 10:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uijds25zhk0ziOvFqYHAJPHCBakbQ/fBxuhU8qKq7OQ=; b=nsRkwkW5mHqFD2/q
	hXAJ5Y5dLje7RwlUJKvMmp+V7sj8egpN7hUIZKM7jUhjdtuS4UbWL4Y0G8l/zbJ2
	pBbBs6qnR3jb7jm3Q7Ph08lsvPSqG+TlLqxXNjcZxMDSBXAsqR7iFc9sszCQzHfe
	EgJpPgJIEWJ3+RGsZpw/KjRMEG3zhetlyKehnGY+DBXrij4p4gUor7pIGzg3tZzV
	xfABnRDU/I/o9y4yJjcgu8VoUC8QyuArl9Ww7NtSpDxL3A4HNmd8fmMM5BH5PXiC
	8L/+0tyi5ke7NZOI699RksdbLa8Aeh+EEyjYOiET1xW+jnEItW6O+aGsA0cfavw8
	/7bLHQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh256rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 10:28:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OASj8K029304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 10:28:45 GMT
Received: from [10.216.12.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 03:28:41 -0700
Message-ID: <d8db0361-b8d9-4ed5-0f92-f66f280f62e6@quicinc.com>
Date: Thu, 24 Apr 2025 15:58:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
 <47dtgkfqcpalixg36vxcurkmh5z52kdp7rbcvwl56wsyjsisdo@ylmmrvwde4nz>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <47dtgkfqcpalixg36vxcurkmh5z52kdp7rbcvwl56wsyjsisdo@ylmmrvwde4nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680a125e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=hGvsmAcx_hqS3znI7bwA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZPdYq27cK53dKVL1kn5e0NAcmSj0z8dU
X-Proofpoint-ORIG-GUID: ZPdYq27cK53dKVL1kn5e0NAcmSj0z8dU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NyBTYWx0ZWRfX5mxInmtVqmP4 JMcPJWwZCTWGJPRAHFYt43s8u0ozAzMwU7lOXtqZEEbT4L5faqJyEsHUWztwG1HKc/JqNi+j/Z5 ojo7xTzrWFIReI6bYrMh5v9GwyxEBg9Zx5tDpnGnwQioflF2zMEl/xKjPm2QpNYruzaVJRnuy3g
 CZ1Lj8lWa6zLUXUy0xD37Ks/4VAqYegnUOXJPzsX9B64ioQBByloqBUreBHHIWKjUVKtWPYlJ1z 7F1uQTcJC1q4OMqrDdrKFXWM1AoVf7FK3hdq1ImWhxwMAlpDApW3yC3FDuiit7acfuF8oJpZ8fE zkxDScBM6KLc5QQvESjSSMiAn+/eYR2bnU3etPter1APlqD0+K52Ex1vFbKeuJtb9Kw8yB9zPzI
 DNxOEqKaOESSQX5/dtEnvbuvLEBN+jc3P+Xu7s2dNN2XRjNxLL7Yck8u9n2Aj9Mpp3VtBS+q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=792
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240067


On 4/24/2025 2:51 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 24, 2025 at 02:20:48PM +0530, Vikash Garodia wrote:
>> Add the IRIS video-codec node on QCS8300.
> 
> Nit: you can not "add support for the video node". You can either add
> video node or add support for video en/decoding.
Makes sense. Will wait for any other comments, before resending.

Regards,
Vikash
> 
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 71 insertions(+)
>>
> 

