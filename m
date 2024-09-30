Return-Path: <linux-media+bounces-18781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D54989E95
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 11:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F5F1C2189E
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54B518A6B4;
	Mon, 30 Sep 2024 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZPvIDbUC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8541898EA;
	Mon, 30 Sep 2024 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727689105; cv=none; b=oaQLyyupk2Q1+mFPJ4TeEt/dYPs6IuwcKnCeRlbk1L/U3XmZDNg2bMT9V8807rWJjVBEGa1swIUfqzWQVd5SzkWj1ToT0w9wtkoKuFbyUg1egc8brUE7oibGQARQqyo33BMTkzcOAiMkT7HfDFzCblEbsYAUcuNUtw11AylUr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727689105; c=relaxed/simple;
	bh=30jQ/dJisRhLGwyg+rYwjG/FnRoF2YgwaCn/M78cOaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W4HIfeYwuKtzHmlC7XQr/OswMHs9M2pOJg/TL0OFGxmrC1S/y5d3HpOPECgbENgViFqztk/P7e6YGtBMHqnTQ4zl1Bwx21FKkuZfNaaexypA4hTjK+bgYdvn+Qhd4MQOEWtJ4q8R7J4hnJnr16E8yQGM/RpzC5K7pkIaYNe0e+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZPvIDbUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48U0en1H006167;
	Mon, 30 Sep 2024 09:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MaBnQW5Nyhj6nkEK3+o7NmZQzP88S3q+sk+cYabsaOE=; b=ZPvIDbUCQTz/9a02
	O1qQN6E/j4jLnjNK/0wsJMiMm/9mar0vMUPYNOP57aFL/PfdGzzR6k+uzwuMAEyX
	nmBVZjJ+7nUIzOHuvvXd03f8QVrtuIG4BjZEI0CGEJYfxy49fwPRcKm33oQJ60n7
	q0zePQJ0OyPJawq7ehQcGKZQ1qMNSHOO57nburDdRDb9x2dSkR0XV+SOQ1Ua8fRd
	FjsU1cYfJclYXdUxhZO9ThFiNiNVeOpYWA7KA5RYYa3s3FgFBif/YIcgGheL797B
	rEekUIPAj3A+czyFeBrUmtC+EEuMRrd0IoFJ95g+RvZ7IkNgcyfsJFXyBJmD5ynr
	SrEEOQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa67489e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:38:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48U9cHTQ003038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:38:17 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 02:38:11 -0700
Message-ID: <689649de-0969-43ae-a48f-4efcde6a9d96@quicinc.com>
Date: Mon, 30 Sep 2024 17:38:09 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
 <83b46dcc-c69e-430b-946e-ce9d299a27c8@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <83b46dcc-c69e-430b-946e-ce9d299a27c8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QOxc0whiX2pP2QkjDEl0ehoTUkSsG9az
X-Proofpoint-ORIG-GUID: QOxc0whiX2pP2QkjDEl0ehoTUkSsG9az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300069

Hi Vladimir,

On 9/30/2024 5:23 PM, Vladimir Zapolskiy wrote:

>> @@ -1049,7 +1050,10 @@ static int csid_set_test_pattern(struct 
>> csid_device *csid, s32 value)
>>       tg->enabled = !!value;
>> -    return csid->res->hw_ops->configure_testgen_pattern(csid, value);
>> +    if (hw_ops->configure_testgen_pattern)
>> +        return -EOPNOTSUPP;
>> +    else
>> +        return hw_ops->configure_testgen_pattern(csid, value);
>>   }
>>   /*
> 
> Here you accedentally break the TPG on all platforms and introduce a NULL
> pointer dereference, please fix it.
> 
> Any generic/non-sm8550 support related changes like the part of this
> one shall be split into a stand-alone generic change aside of the added
> SM8550 platform support, it will simplify patch reviews and hunting bugs
> like the one above.
> 

Thanks for catching this. This is indeed a bug which is introduced by 
this patch. And I will follow your suggestion to use a stand-alone 
generic change for the TPG part.

Thanks,
Depeng

