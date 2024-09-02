Return-Path: <linux-media+bounces-17357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238D968887
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A480BB21ECB
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 13:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FD01D175E;
	Mon,  2 Sep 2024 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c/HqMLZW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36DA20012E;
	Mon,  2 Sep 2024 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725282693; cv=none; b=eGuHXD8qUNk3Gkye2y6sunDXwMiqgQ+bZsGi6Q4Y4j8DCxbBaEudgiYgzaZmAxfGLr0OLNhzbTr4EQmNrVudMyZeS0i/JQ0UCQ+x3nDGuhjZ9euHKA0C3jrFdWnYc4EZUH3rqn3WACQRFnSrlFs1gPGQnc7W9rY8nSB133/p22Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725282693; c=relaxed/simple;
	bh=zqOWTXiJ+gcUGV9KX3FtFoCyGk5Gbwro6DOZyH48KXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=porN7ItMbVhV/c6g4foZRjIo3V9LtkZQXpI8TNR9HJ/4SIeCZ9RJXlIAuJjsjHpEpWAtcpVdQ4ZiDeddtmUaqmjVoe/iQbzhXklVDvUU9S1I5PrW80tj5J1dzZ+re8hPiL4It2W1HJdC+V08UCQkE8u+ozhip9MS4iIgMSI7oQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c/HqMLZW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482B3r5H017590;
	Mon, 2 Sep 2024 13:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j9WHxuQnRTLsE497EiOLxYEbwyyvR08h94gaijqV738=; b=c/HqMLZWbu/cMntB
	JjvOf+7lwvK77GDxiIqFonwSV+13T0McFT/GBz6fT2dDULxKGbbUwVHeUOKrQ/te
	70lysSK7bVYR779VNl4Ui7TfisK2Y9IumVqxh2FbWB4KkEkGww9Uf1Isl03bBqye
	4tsyPfIFLP9RWY6ztzq0IN0qEj0kUyaoznHo5CtPVDFCMhhU03pJADUtFpVQd9zV
	udxkgSRzu83w6VaMChTp6y7jG1B7BOy6/0QgyfWjZYzktC5k1CzaaiERHMjSATZ8
	DgTDihcd9tFPfMiZzlakDmwWnxTo8ntzwcnn24NevitssfQxJ5m1HgkX4mlN/fY4
	9j+F2g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btggvued-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 13:11:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 482DBO7I013825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Sep 2024 13:11:24 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Sep 2024
 06:11:18 -0700
Message-ID: <14e297e3-6d70-4270-9477-6bb094ccc621@quicinc.com>
Date: Mon, 2 Sep 2024 21:11:16 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: vfe: Move common code into vfe
 core
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-10-quic_depengs@quicinc.com>
 <0611458d-b508-4e52-bafe-7f5612c63b72@linaro.org>
 <b1e1ff88-5bba-4424-bc85-38caa85b831f@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <b1e1ff88-5bba-4424-bc85-38caa85b831f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zr1bfym8Z3fimDUFDuH1oWKTGuzrw-CC
X-Proofpoint-ORIG-GUID: zr1bfym8Z3fimDUFDuH1oWKTGuzrw-CC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_03,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020104

Hi Vladimir,


On 8/24/2024 9:06 PM, Vladimir Zapolskiy wrote:

>>> +
>>> +/*
>>> + * vfe_enable_v2 - Enable streaming on VFE line
>>> + * @line: VFE line
>>> + *
>>> + * Return 0 on success or a negative error code otherwise
>>> + */
>>> +int vfe_enable_v2(struct vfe_line *line)
>>> +{
>>> +    struct vfe_device *vfe = to_vfe(line);
>>> +    int ret;
>>> +
>>> +    mutex_lock(&vfe->stream_lock);
>>> +
>>> +    if (vfe->res->hw_ops->enable_irq)
>>> +        vfe->res->hw_ops->enable_irq(vfe);
>>
>> Right so generally speaking I don't believe we should have any null
>> function pointers.
>>
>> We just mandate that to be comitted, an impelmentation must provide a
>> dummy but, in this case when do we ever want a dummy function anyway
>> surely enable_irq() is a fundamental operation that is core to the logic.
> 
> Why? What could be a justification here?
> 
> The image capturing media pipeline for all recent Qualcomm SoCs, including
> this one in the series for SM8550, can be set up and enabled without
> touching VFE interrupts at all.
> 
> It might be extremely confusing to see in the code that some not ever
> requested interrupts are enabled/disabled, and then to discover that just
> some stubs around VFE interrupts are added. And it's the case especially
> in this new vfe_enable_v2() function, which I believe is intended for
> CAMSS support on new platforms.
> 
> What's worse, since these VFE interrupts are not needed on the modern
> platforms, it will require to add a proposed dummy "return 0" function
> into any CAMSS support for new platforms forever. I believe it'd be better
> to clearly say that it's a legacy to have an obligatory support of VFE
> interrupts.
> 

Sure, I will add a proposed dummy "return 0" function for these interfaces.

Thanks,
Depeng


