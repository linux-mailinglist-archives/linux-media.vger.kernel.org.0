Return-Path: <linux-media+bounces-23286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6F39EE502
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0744F16680E
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A82B211A14;
	Thu, 12 Dec 2024 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QF3g4eE4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBC22116E9;
	Thu, 12 Dec 2024 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734002939; cv=none; b=lxWlCreThb7weBS1TokNfKPDYrVy7bEsrBYVzeH9l8V9Z3XTQoSDKxwLFqoeDKDN8+uaiTAK9PsnDzbodu2d5+O9hXLvBxsvTijtpeQQ9uHjpmb7uZRIiARxg1aKqTZ49I3wNgzL36icxwQE1QVyHojKcMP1JvMxC1aE2HwEIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734002939; c=relaxed/simple;
	bh=yhq6O4mw/yJJVwmmryyToDfyv61vPk6+vzW2ZdYZBO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Sb6oSBCAqai2O8k5teLRTn6TU22LIxQX1pQBpmTEbct7qbMAWdUoLIu7rZa75prO939dvO1YEDRNfipGxFHUqv28Mq/DNoEtMMCxnvri4bAf1wbh265jFOlvLvj0ikPSlbkwuIhcm7V9aET6/XaTggh6Hvewv3Mhsjh0Y3JOZdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QF3g4eE4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6UuaK014934;
	Thu, 12 Dec 2024 11:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJ/oCRS1WSbcEtsqKeQoAy+f/C7wpaMmsI/7HnP+YDk=; b=QF3g4eE43W2vsAqL
	X/LVnqnxW3v5UB4c7D+x2fAmAqdsarLgADp/SeWkplJxbGktYzr9hfjK3+9xbJXu
	hz6NNH3x19jAk42k8PFqRV9Afemla0SuxgQtuG9TNGkrGJLg2a1JrUQ/RbDFR9Fv
	2eV18yn+MyQOF7et2zjSpUYlv4wAcGNRB72W9fkpb9kX1U3p1ZOqWrRYh5Af3FdM
	FTHJTJmwGV5TuKRrZS64awZcGIYybkdfg+fl/E1Ujzu8jnbjNzLchIVLUHXVs0zn
	e/YyPaIVF+JVyOLr2gfLHIhBeyWZo8YHFkz3O0q4rz/NQ0maCabm2Kq9L7IwhNru
	0b7BQg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpkyjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:28:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCBSqTX023823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:28:52 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 03:28:46 -0800
Message-ID: <28b1c828-f338-4d57-bcb7-b0a8652c82fb@quicinc.com>
Date: Thu, 12 Dec 2024 19:28:38 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] media: qcom: camss: Add CSID 780 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-16-quic_depengs@quicinc.com>
 <138cc2e5-6b31-49d9-b70e-400a3f3c3bfa@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <138cc2e5-6b31-49d9-b70e-400a3f3c3bfa@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kPmoqBZNk8vi7t5C7Q5vo-Li43eiobm0
X-Proofpoint-ORIG-GUID: kPmoqBZNk8vi7t5C7Q5vo-Li43eiobm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120081

Hi Bryan,

On 12/12/2024 5:57 AM, Bryan O'Donoghue wrote:
> On 11/12/2024 14:07, Depeng Shao wrote:
>> +static int csid_configure_testgen_pattern(struct csid_device *csid, 
>> s32 val)
>> +{
>> +    return 0;
>> +}
> 
> Could we avoid this empty callback by checking csid->ctrl in csid.c ?
> 
> If so, please make that change.
> 
> If not, it's fine.
> 
> For either case.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Vladimir suggested to add a dummy "return 0" function [1] for the 
unsupported interface. So, I added this empty callback, will keep the 
empty callback if no other concern. Thanks.

[1] 
https://lore.kernel.org/all/b1e1ff88-5bba-4424-bc85-38caa85b831f@linaro.org/


Thanks,
Depeng

