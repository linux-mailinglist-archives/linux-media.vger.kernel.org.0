Return-Path: <linux-media+bounces-42616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 534D1B594CE
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 13:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D233A1BC7B5D
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 11:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB822BE7B2;
	Tue, 16 Sep 2025 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NREOhVlQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F2F2C326A;
	Tue, 16 Sep 2025 11:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020854; cv=none; b=igE9tZWFnYo2o6hgl6JiSa1WlBIP5/pevqpPkOj4b6yxzeC/MCVukw17KEUHaPOMCoh2SZIR5DlfBMgBwJ8QXWEIZmU1K6zTWSW7uWnlPFmwZ1T8OLW0/KifVXaZCL0PySCtqpiGiZ68DxO6+g6CW9d9HCVSnmfrFbIFkmg/TOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020854; c=relaxed/simple;
	bh=vzmJG5u/sRXgQZLCCiK76Lv86OedG0wC0sx/S9n6ERs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RGR576LLjif6r9hPuN2lHgsxo2owEPaFPqwlhgccJcySyDX4CxQA3UgF6Vpy32qNm8c1ocdZn/sH7/jVpK40T56qcw+FM40JdfIOjFCRMy30YN0zu0RzhBOzUq6t2ySuY6Bibs7f4gnIAKu+I8j8BE5FAnzjID7bTHqGOLNWckA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NREOhVlQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAFeTO013413;
	Tue, 16 Sep 2025 11:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASNNcIT47VlnynwXxXbDXqQp6nlLqMabjaPkliTdKEM=; b=NREOhVlQYuHTHeXQ
	TfCUe/YTKBGwss/6wKjfKooqA+f3nRp5g6/0yrUa3AScz+6jaiCjRC/2vMqy1dNJ
	uS/uV2HjZqPf4lUj+eeC0UUiY6+qi/pZGoHaaPhw4Lo6G67G/8T1vcSVdg8jsteZ
	zdi12nSQY+hahmd/3t4gSNxNv1tm145aPGsnbQRuO17K8LZ2N2io7TQqTRj6kaeC
	QKVkz6vnPZoaXz9vgcw/dDDKeiV3X49GOUEaoNjLU5ZGab/GPSZ1iqDgBo4fDzIG
	72H0ZCGQG1hskpDIM2QkMAxaIgTzpTUit3w8gYl4zocmDR5KsYLe8JPObDd79H4V
	jv37ig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496x5asrgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 11:07:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58GB7Lwp012630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 11:07:21 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 16 Sep
 2025 04:07:15 -0700
Message-ID: <373bbb78-2b0c-446c-be97-53b82edeed64@quicinc.com>
Date: Tue, 16 Sep 2025 16:37:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Rob Herring <robh@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>
CC: <vladimir.zapolskiy@linaro.org>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ravi Shankar <quic_rshankar@quicinc.com>
References: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
 <20250912141134.2799078-2-quic_vikramsa@quicinc.com>
 <20250916024858.GA3574831-robh@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <20250916024858.GA3574831-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5yqcY2aSDhVn6h5OJHJQ1dsS8np66V0n
X-Proofpoint-ORIG-GUID: 5yqcY2aSDhVn6h5OJHJQ1dsS8np66V0n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAxMCBTYWx0ZWRfX0KYdeFpVhe+C
 VWdu50kVq5BCuNsoVXL3/1DiQo11Vvjuc6C8xgjEodCtF9z0ze+raflgAr8YNyfXvWipODXcuut
 ayUj8zrXvU5FyVOiJjRBoZ+r18f4gIFl1WKtoDahvsI56pw5PxTguV3dg6Ut+ZtSEPRcWQ+sulQ
 fmYEVE+9YXLJPAh35kzx9AASvJmCARovQA8t1TdjuGo1rL97mKwNynk1zsXFHtc7GlAhD0FYCVX
 8tcMqBIIy2lMbPVaI70/KggqJPry2BxFNd46hV5ahfJd+cqgRBL5JZkuI0zobFiuRija8fX8YH2
 5pceXpGZYvh0sRZlUcbUMCxtWp1+InZFtaLfrMmhFSSqpj03ETzEecIyOrBjQFym1NdkAXfh+6T
 hZNwpitu
X-Authority-Analysis: v=2.4 cv=WpQrMcfv c=1 sm=1 tr=0 ts=68c944ea cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=gvTuqyW5XoP_ZPETEvsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160010



On 16-09-2025 08:18, Rob Herring wrote:
> On Fri, Sep 12, 2025 at 07:41:32PM +0530, Vikram Sharma wrote:
>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>
>> Add device tree bindings for the CCI controller on the
>> Qualcomm QCS8300 SoC.
>> Introduce the "qcom,qcs8300-cci" compatible string.
> Wrap commit messages at 72 chars. And explain how it's the same or 
> different from existing SoCs in the commit message. Don't explain the 
> diff. We can read that ourselves.
> 

SA8775P(Lemans) has 4 CCIs, while QCS8300 (Monaco) has 3 CCI, with the 
only difference being the GPIOs used for SDA/SCL pins.

Currently, the CCI driver probe happens through the "qcom,msm8996-cci" 
compatible string. Could we use the existing SA8775P compatible string
"qcom,sa8775p-cci" or we should remove it? 

Please advise on the preferred approach for upstream compliance.

>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>>  1 file changed, 2 insertions(+)

Regards,
Nihal Kumar Gupta

