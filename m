Return-Path: <linux-media+bounces-16344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E305953402
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 16:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59B171C25CD1
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 14:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06D61A2C35;
	Thu, 15 Aug 2024 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GAycxkgW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28B1E526;
	Thu, 15 Aug 2024 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723731693; cv=none; b=NoO7wRCpdW14qJuMd6vc6mVDdayg2JYYTb8TMLBbIT9/Zw1ijnWS/3f887fjwI/3yHIfWi1CW0wGWKq9M4f1ro2QR7fpmdRu1kSp0kqLoTQTigGOTc0CvvBQjnkpihczhkvWPbWT07CQrF2J/mO6mUl7R+d+cOHpeNiCDxMVc9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723731693; c=relaxed/simple;
	bh=O3yVi/sK5TWhIzw4ZEtvqC2DBM92N/LguKZYwN+a+lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sldawOuY9JA3Gdyw0JMaZKJlFvX5FOTsg/F8/LaUUv8sG8k+H9yhGQ36sNsCiqLiCco+T98sLcAECgMwEjWnkAu/Zh38NUpSxLZQr6Mtq2OBzMGeam/GZ60WYiqQs+eU+e0DgpFoHUIH87l6nTsfBcUX84MILpkqdle1lxw7PiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GAycxkgW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47F11aJL017856;
	Thu, 15 Aug 2024 14:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Zi1ZQwKAx27nhCCtHmlLY589bvE5yH0KBvcMqQmfKM=; b=GAycxkgWwoogA71P
	Fo2E7Fnd1hkqms5SyNQOE6o+y0YiDCI5mKinyDWP9CO+sXba5X9zvi1vFHRFBo79
	sPQLdaKwQSebLj1Dsj/MEBOn9SrE3c1okgduJiVetYIcwsSkt/+Z09fdH5YeBJtJ
	mPvGa/K/bfMyFrsn7qAfU0gRq8UjG2fqd9JM6hpl5ElsorLA1KrS6W2GPn3iQ0al
	r30Co44fyd6AghChyOcoL49inJyo3QPUGDKIGL4fIHq8H4BDsCrVgK8RUxfBt7JX
	BeIxsJgzky/Xtj0AEmHpUv0IFnNLZjuUSVpCfbn5Ta+xdFGSWIHZ3hZkaG05hwMy
	ReODnA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410kywmrdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 14:21:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47FELPdj016026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 14:21:25 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 07:21:19 -0700
Message-ID: <eb77972c-9c9a-48f9-b850-21e6c2df005a@quicinc.com>
Date: Thu, 15 Aug 2024 22:21:17 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <6ddaa41b-86cf-44e5-a671-fd70f266642b@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <6ddaa41b-86cf-44e5-a671-fd70f266642b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j8zi87lWZbdzyTixcagW6qF7844CcQZW
X-Proofpoint-GUID: j8zi87lWZbdzyTixcagW6qF7844CcQZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_07,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408150104

Hi Bryan,

On 8/15/2024 8:25 AM, Bryan O'Donoghue wrote:
> On 12/08/2024 15:41, Depeng Shao wrote:
>> +void camss_reg_update(struct camss *camss, int hw_id, int port_id, 
>> bool is_clear)
>> +{
>> +    struct csid_device *csid;
>> +
>> +    if (hw_id < camss->res->csid_num) {
>> +        csid = &(camss->csid[hw_id]);
>> +
>> +        csid->res->hw_ops->reg_update(csid, port_id, is_clear);
>> +    }
>> +}
> 
> The naming here doesn't make the action clear
> 
> hw_ops->rup_update(csid, port, clear);
> 
> "is_clear" is not required since the type is a bool the "is" is implied 
> in the the logical state so just "clear" will do.
> 
> But re: my previous comment on having the ISR do the clear as is done in 
> the VFE 480, I don't think this is_clear parameter is warranted.
> 
> We want the calling function to request the rup_update() for the 
> rup_update() function to wait on completion and the ISR() to do the 
> clear once the RUP interrupt has been raised.
> 
> At least I think that's how it should work - could you please experiment 
> with your code for the flow - as it appears to match the VFE 480 logic.
> 

Thanks for catching this, I forget to add the rup irq, so this logic is 
also missed. I have tried it just now, the logic works good, will add it 
in next version patch.

Thanks,
Depeng


