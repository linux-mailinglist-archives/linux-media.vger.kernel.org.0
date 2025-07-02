Return-Path: <linux-media+bounces-36546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2D4AF1432
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21E574824A3
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB6326AAB8;
	Wed,  2 Jul 2025 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oOmx2oeS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B03265CD0;
	Wed,  2 Jul 2025 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456393; cv=none; b=aKNr4Vh2x6ls9MnqxdpNus2/8FQNZqsV0CEhlGC9+R2J1pWXlzGZJBxhq7gsjm1e/gABlZXGeZAXZBP6wM827LUfysMHEWF0lXdkRYnl4TOosk1PlP3Ow9/ud8Hgn4DLLMQ/zivg/jDjfwM1bGgA+gSNaL+uKV9B6Yq7/ygUWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456393; c=relaxed/simple;
	bh=p00VWiUPzkdDyPB1nCYCXxNBRT+8vis4nL3VseuWccI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wj0NvrsdgQ17wydBVIzo5dL1enN81sEUQ2iwNGrlmvWfbDtcrU4B7DsXpWxn8eaW7Zm2UliBSDndRZL0qDxfvNVdTjUJF8DqmBAzxmMqtoEJNdudtoBpHzN5JLsvGCiiAk9vaSDsAsp6bx9p6tmkQUadbqkPNFjdAGE3pWkz4QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oOmx2oeS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562BLnSF010373;
	Wed, 2 Jul 2025 11:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nh0RTnBGgLzzQGynJ72K11XlI/jzJYOaADoX7NzOJ6o=; b=oOmx2oeSWM19Nbc/
	h7SgAYoZ0ghxZDTIRTnVNWY3viiDH2aFQvEIN6WqvfHDOUaCY+x15Kuc8Ogu/iD+
	utqmNEA+soBKMMgXbs7/S4qYo0a3Bv4tEuB4NjsF4WZ7uwKy/DWixlj/e+QMlmQC
	LGxDtbX/B2OGDlN73MCoW5woYAXiUw4dvUzPOrxK1QUBI5NQiB45wVZH+6PFZ1PI
	uhavbWEk9HJkIclsjcKtb7pACVgjCEypHRY0+H6o/QfgeY1sWKLYxf+3lHf6dCnC
	/6+AiO+gvcTwJrwjBqK535x7sA6YZkg6WBXnID0KqYYkg6MovSYciyw1f/6Eby/H
	GLP+xQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw309e36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 11:39:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562BdkTC016484
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 11:39:46 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 04:39:42 -0700
Message-ID: <05ba89d5-3f1d-7f57-d5ae-685198dde01d@quicinc.com>
Date: Wed, 2 Jul 2025 17:09:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/5] media: iris: register and configure non-pixel node
 as platform device
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-2-51e18c0ffbce@quicinc.com>
 <156729ff-86f6-49a9-8b3c-7d0fd6737fb9@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <156729ff-86f6-49a9-8b3c-7d0fd6737fb9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=68651a83 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=xP6s1nvhhRLa_WC7hBcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: bELSOmMpHGCbGnSJGPc6VDgMUwNOJPlZ
X-Proofpoint-GUID: bELSOmMpHGCbGnSJGPc6VDgMUwNOJPlZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5NCBTYWx0ZWRfX+GHeckRbH7BM
 Z+lmAYXQS7mpXscqPNPbpferBg5B6PJ3zQ5dmIC5pnVdUS9PKHl0rlT1yqMOtBQng54GUAxhUg+
 j3H4drn1rIuGhrL9v5m3xUry+Fr6sgxpEPAth3v/FbUXVoOK/3+TlZDBQ+FqMyo4d2L30DbKj5t
 3a+Rv4LJnYXHN/IYOY9U8YJizV3soK6KIPcfCrtVUB0cYqF6KMJVXrcKWvLok3Tv6D6miN6/dCL
 PiRiXYch5znitcvOS02LFASWRqQiNJTWxr1Q3nck7Gpcx1EahE4RYmQsTkzzpVWpQ5vPbBr6qZf
 kUirdJYSo6+7W4eF38lJYekDA40zHGUFF+fBLvCvDJUE2VvwjOBv/trhqlmZZwxuGINA4WdKos6
 FeZB2BMTbRAof1RhMScx71qEPRGZIP9brpVQTM8Z6Bs98ff/4qOAvaaYLTlJAwgDvwkJ2VTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=949 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020094


On 7/2/2025 4:34 PM, Krzysztof Kozlowski wrote:
> On 27/06/2025 17:48, Vikash Garodia wrote:
>>  
>> +static int iris_init_non_pixel_node(struct iris_core *core)
>> +{
>> +	struct platform_device_info info;
>> +	struct platform_device *pdev;
>> +	struct device_node *np_node;
>> +	int ret;
>> +
>> +	np_node = of_get_child_by_name(core->dev->of_node, "non_pixel");
> 
> Never tested.
Yes, thats correct, but it have been sorted out now.

> 
> Best regards,
> Krzysztof

