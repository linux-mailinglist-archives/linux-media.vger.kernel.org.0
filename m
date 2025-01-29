Return-Path: <linux-media+bounces-25392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB4CA2172B
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 06:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D5F27A1AA2
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 05:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926B118FC92;
	Wed, 29 Jan 2025 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XeN63ZiT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4AF5672;
	Wed, 29 Jan 2025 05:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738126843; cv=none; b=Zc0Z/o1yoQ2GGypoTv+mEpPudc+s+PtFgI0rHQq/JjRk5oE42AYFdiPif9rUaGJB7ZDXntV+YBjiy+7/5P4XyXnIAEFidzkV3EGBNJOns8I9uLhJGDVGXckrrIUHxOJVG9bmAnkBC6Fp4cYpGAdGWRDfZOR9zppw/Dqbt7eqrGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738126843; c=relaxed/simple;
	bh=UwxcbuhZGwsBHPSCXaBFscPQDE0rtqzE9Ms/A7EbDMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CdfR3YLqzI39ETeLzEwdxDQlWChdEPzSGcytM3/JUhJQkzfzEBWvzQRK5BiIzCf7hyqf0XI5NW/lAtk1jA22cVdBNAg3ZJzSsB4cDbD3f7rsN4piG/rUbLsH/c5YRPdcuQuT+ikJjmwyNSn5IdUnRdoOO+lKX3e31LC61BdyN9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XeN63ZiT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2iBEt022286;
	Wed, 29 Jan 2025 05:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJJxK3/jdRRYdwDv1N5Q0ZC7yp6/PmNhp5rskUfXWhg=; b=XeN63ZiT2kDpGwV8
	Vmsu7h7SeuyGikGMqr7L/Sw6827REvkNbOQdrtsygn+08+vfzVn7LVgrTItkUSAN
	upeiR/mCkBUP1/0FqEOCSsgB+XCFtwnohEhm0qmbGPD2eq8DE+u/oujGumY1c2qr
	WOP3HyRga1MUWyLyfvj8IKyPRfj+P1Ba42mTPpFrRDMMNH9saeQp6Dz1Td+HrsJ0
	wX6PiQEOwhDksQgqJmbDzePm6ktz8uQHhPnsro654bceP9/yWYO91uNTFGCJI5Hy
	4XrJt0iCsB2cC9zGbrhDycn31zmBbZaLyEUKDtvZyEz3eB7IzHqdOjBYphvm52SI
	iAFV2w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f7xfghrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 05:00:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T50Y3C014071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 05:00:34 GMT
Received: from [10.206.111.70] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 21:00:31 -0800
Message-ID: <5651a3dd-79bb-4711-98bd-e1932f32ac23@quicinc.com>
Date: Wed, 29 Jan 2025 10:30:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: fix OOB read issue due to double read
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com>
 <f18c1277-0d72-4f7c-b325-5f19cfb0ab98@linaro.org>
 <13259345-02b0-47ff-94a8-530a17c50b97@quicinc.com>
 <4cfc1fe1-2fab-4256-9ce2-b4a0aad1069e@linaro.org>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <4cfc1fe1-2fab-4256-9ce2-b4a0aad1069e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: k-zPIOI8TfYU02mOx6qDuDHku6C8mnFa
X-Proofpoint-GUID: k-zPIOI8TfYU02mOx6qDuDHku6C8mnFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=806 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501290039

Hi Bryan,

On 1/17/2025 3:55 PM, Bryan O'Donoghue wrote:
> On 17/01/2025 08:39, Vedang Nagar wrote:
>> Below is the first read where dwords is being validated properly with the checks.
>> dwords = *rd_ptr >> 2;
>>
>> Whereas the same address is being read for the second time:
>> memcpy(pkt, rd_ptr, dwords << 2);
>>
>> For the second read the value is not validated which may get updated from the firmware
>> leading to incorrect memcpy into the packet and may lead to OOB read access while accessing
>> the packet.
> 
> So you are saying that pkt points to memory that the firmware and host can simultaneously access.
> 
> The question is - if the length value can change between one read and another read - how do you trust the _content_ of the packet ?
Original content of the packet is validated while reading the packet in hfi_process_msg_packet function.
Whereas the current change is just to validate the size of the packet to avoid the Out of bound read access.
> 
> Surely the right thing to do is to take a _copy_ of the entire frame and act on that frame exclusively on the host side ?
> 
> If I receive a frame, and read length X.
> 
> Then I need to re-read that frame because length may now by X+3.
> 
> This implies the _data_ in the frame has changed.
Yes, the _data_ in the frame has changed and will get rejected while parsing that data.
So I think it's okay to no read or copy the entire frame again.
> 
> What exactly is the valid lifetime of this data from HFI RX interrupt ?
There is no as such lifetime of the interrupt, but any rogue firmware can corrupt the data in the packet.

Regards,
Vedang Nagar
> 
> ---
> bod


