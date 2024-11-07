Return-Path: <linux-media+bounces-21038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DA9BFFEA
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 09:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 038BD1F22D60
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FA91DB54B;
	Thu,  7 Nov 2024 08:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NHHb/LY+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B631D9A41;
	Thu,  7 Nov 2024 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730967865; cv=none; b=KPVPibPz0nHQ26X3mWZebHBQt1NHUef2OcfFTb1Cht7CoMhEG7zBrpFpM15MRD0VvlpASlcGyMNJb2jYViJ2dVMlxQ2vHqhKvKnihBAEarhy+6QUGC1SZDDis8SxrbrIFr9UkCdcdy7jKSSijDzTODkXPsP2CiN3hZ9+tdFhhec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730967865; c=relaxed/simple;
	bh=ZtErKcyBvKlUjFKcadq0MkUgvpGH0gPnGcyK4+5rQCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SIrQcK8pp/5Dy0SRtQmMHv++Z/qTf5gJzoK1cIMRzPkK+4Y22VpoGTR6md6W+lBQJlobZM9C1k4aMPQPlDtU0ifDglemfMHrpHJ6t2zBln6Ywj8LnPEu2aZ+uCfhHRyeUmC2CFBLuYrQdUsmqGhb9m6qDhvLUW6RmcK/bwAwNHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NHHb/LY+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A77DjC2013243;
	Thu, 7 Nov 2024 08:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TrpguMEdSksTaqBAC65MSDO/ym6FXsg7gAMIzCbcrU=; b=NHHb/LY+6FKlCmVG
	QYm+fBWa+xRpEWWwsXtcgZv25h7Jg7r/Kd8BaTE/Ied4TLwEpi9bY0ElJlWO5EvR
	qpUqhidS7biGQv34Bfv74wskiZDEevVP8rLgQxHg3nPPQZEUuVUwDIVYMegE3sP7
	mQ01hBfrnJlHLc971J89TKzcM0BdehAMupzcdsb5IZGS2lZRCPGxZFpmsopGwciC
	sV9DbMPzDKLF3+/Nh0vR7AHHi4kw37gvSSxWl/axyUAnsG7lBnH+W6Nhm4T+37xi
	U8cPWJl3ccUfPzNOiLKfw7dmRnKQjRyoQV3EaVj+EZ6yFaxOOL+DgW835QQkrFrw
	Vu/9xg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qp2rwmn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 08:24:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A78OIlY032387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 08:24:18 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 00:24:15 -0800
Message-ID: <647a32b9-94e4-ce9d-ed9a-771d32fe7784@quicinc.com>
Date: Thu, 7 Nov 2024 13:54:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <640fe933-078d-4bf5-815c-7db0eb8b9de4@linaro.org>
 <7f350d73-65dd-097e-8b4a-e9a23472aa28@quicinc.com>
 <d39c7613-fda1-417c-a205-daddbc378bc3@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <d39c7613-fda1-417c-a205-daddbc378bc3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rfWd1Ona_nvMTFFel25ZTW8fvzs638V2
X-Proofpoint-ORIG-GUID: rfWd1Ona_nvMTFFel25ZTW8fvzs638V2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxlogscore=977 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070063


On 11/6/2024 3:53 PM, Bryan O'Donoghue wrote:
> On 06/11/2024 07:25, Vikash Garodia wrote:
>>>>            cap = &caps[core->codecs_count++];
>>>>            cap->codec = BIT(bit);
>>>>            cap->domain = VIDC_SESSION_TYPE_ENC;
>>>>
>>> I don't see how codecs_count could be greater than the control, since you
>>> increment by one on each loop but >= is fine too I suppose.
>> Assume the payload from malicious firmware is packed like below
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>> .....
>> for 32 or more instances of above type
> 
> But you do this
> 
>           cap = &caps[core->codecs_count++];
> 
> for each bit.
Yes. Let say that packet is written more than 32 times in the payload response
from bad firmware and each has 1 bit set. core->codecs_count would be
incremented beyond the allocated space.

Regards,
Vikash

> 
> Anyway consider Dmitry's input re only calling this function once instead.
> 
> ---
> bod

