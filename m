Return-Path: <linux-media+bounces-17599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CC196C036
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 16:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5AF1C25108
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18581E0B77;
	Wed,  4 Sep 2024 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HgfWwr99"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD821E0B62;
	Wed,  4 Sep 2024 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459652; cv=none; b=IVcWfuJ7itkbP/ckS+OJrL9z910O/rdAIW8pndJZg9rXrelatzASuxpj10EJZzAduhAy5MEyW9scbCaNB5p6BEzE6A87Mh6GhFablz6X+UmQbWgz/9EIQpw47yWXDF2wW754g29qO9iyc4AScbELn/4ES3oP9cEZS7vI5vcDGkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459652; c=relaxed/simple;
	bh=ITsGfugUMr9puQDBp+P640F9MZXA6jU3xRcO2/5S338=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jcBmNp0qI/5C3ZiuEAFsQNpCUdS9HC3W/UHfrXcln7djDQsPJJpgMEHPoQwa+ScbpUrytAy3EN3TJ4S+NdBGqh2kGgPNM04ZMFj4BgEeD3YzZ0y5BCdfSR3UJ7WSwbNGStDQw4Scnl907hxW5fdY2Ii6gd5w1KfeCbk3zRR/dMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HgfWwr99; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484EI96p010431;
	Wed, 4 Sep 2024 14:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QrG8p65E5bnLIK8DqDLKFxiZpnW4MlFd9WmsAYCwB1g=; b=HgfWwr99jDPAjR0t
	ZhNnb5mln0c6N91jxUTxFqlVES6PtmsYOao451NUE558th3hxETCwkvBzWxC+6Tf
	o4xywlcGul42t0QThCOFIqPuUEjeJjCQUl6Q2oc2Ocy5lCacgQO0OkrymJaoD3Oz
	CtHABsC5OEl4nPD5bAMOFvq/iHfH8yE4GcU75rIXrZIJuYupa1QrTr5WewDmo2Ng
	3CQJOHve+rRrLP9lIRTtcE9FA+ouCNQy1nsvhF2SzstMVRFi0PGt3AmaCtY4XKmm
	WwvlfAMWN/NHNpFnieP8zKNfqjfwRU6E77S6wFjZo+L+vNYkQc2l98gabPScj7Xu
	LzK6Bg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41egmrhenu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 14:20:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484EKitx020748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 14:20:44 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 07:20:39 -0700
Message-ID: <7fb34b98-7bc0-43fb-a6e7-dee073fed317@quicinc.com>
Date: Wed, 4 Sep 2024 22:20:36 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-5-quic_depengs@quicinc.com>
 <3cdd7101-ae8c-45c9-9695-f7f4202d1edb@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <3cdd7101-ae8c-45c9-9695-f7f4202d1edb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zWSgH0K4kaVarHKiZTAVX6klUesY9va3
X-Proofpoint-ORIG-GUID: zWSgH0K4kaVarHKiZTAVX6klUesY9va3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_11,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=950 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040108

Hi Bryan,

On 8/19/2024 8:17 AM, Vladimir Zapolskiy wrote:
> On 8/12/24 17:41, Depeng Shao wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

> I've already expressed concerns about a necessity of this function, 
> since it
> adds runtime burden of work, which can be successfully done at compile 
> time,
> but okay...
> 
> Since it is needed for 3PH case only, it may make sense to remove it 
> from 2PH
> and call it here conditionally like
> 
>      if (csiphy->res->hw_ops->init)
>          ret = csiphy->res->hw_ops->init(csiphy);
> 
> But it's up to you, I hope the callback will be removed in short future.
> 

Could you please comment on if it is fine to remove the init from 2PH 
driver?


Thanks,
Depeng

