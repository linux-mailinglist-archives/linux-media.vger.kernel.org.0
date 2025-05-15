Return-Path: <linux-media+bounces-32589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8EAB8602
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 14:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A17B165CBA
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 12:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BEA29A322;
	Thu, 15 May 2025 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nGL3bljv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806E82253B5;
	Thu, 15 May 2025 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311078; cv=none; b=RAGvB0gxRXx/uODN3tuW0QpU1EZjiSaM06JC4Lx7ZnFqYrZuxMUBErIU2LLa4uhbfH2gk4wTw0M6TOYTbS66yrp3V8mVtRmMreEJvAtfpeMMTG+iXv3uL+kLA6kyvTpaiGaeNyFPmd6a3Z/8LudYHt1AGpmhY5WLHYwqqoWiF7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311078; c=relaxed/simple;
	bh=5RY6uiXS/ZzXcSSm8cSYdtyLD8Tx6Li3VSci1x5DSp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nMtjM4mBuPp/B9aaXFqCTz2LjBrygWQLQzXrhuanCIfm8C1BgKxPr/jQQi6lMgT2mP0lytdSIr7PiIl9EfpREAv/AurNB9jfELJRikWcZEy13fIG3rBLUmfLNx4aFidw2X+4hPbSs2LiJpEBdBrJf9zyCh3eSUHqT9++ggCbIVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nGL3bljv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F8r6tM025425;
	Thu, 15 May 2025 12:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ4vY1GpR00WojFpTMhmvN8KS4SHARU9tU/1aeFcgJk=; b=nGL3bljvjVIA1Of3
	LA9ukpoEis1WGe9SSpL0wg8ewgxl8UKlayGYv8ZZYvKxJpMzhu5tWXb5fztoUJUG
	npgOV1GX8LCyuYdDwMnA4Ea76EnvPNEnIL8U4hthMtirqQMSruG1K+neTA5BGKCm
	9Tq8xk+3NlgVLBVwNFMRWFCUw1x2IGrBgNbzWT0cBKRtKGVKuFLBiOXBhSjHT5K5
	51Edq7Mrg/5ln89gTTFRZGpd4aDeL1MihEgc1u4wSCiT4/CLH/x5NhEjWdJURC+e
	Su7CWPLoW6o5eMBDrAvUM2Ix3l/mzGrfi+z2c/CXSriAZ5JQ5+U0smYJgkNAvI3x
	TM+XaQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew5ynu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 12:11:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54FCB9qZ027706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 12:11:09 GMT
Received: from [10.50.16.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 05:11:04 -0700
Message-ID: <b663539d-5ad6-399b-1e7b-0b8b9daca10d@quicinc.com>
Date: Thu, 15 May 2025 17:41:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/2] media: venus: fix TOCTOU vulnerability when
 reading packets from shared memory
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil
	<hans.verkuil@cisco.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
 <ad92cf06-636a-417a-b03b-0d90c9243446@linaro.org>
 <0c50c24a-35fa-acfb-a807-b4ed5394506b@quicinc.com>
 <b0c48989-4ce7-4338-b4bb-565ea8b6cd82@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <b0c48989-4ce7-4338-b4bb-565ea8b6cd82@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Fps4AESXgYbpn6TXVbw5C7U3R4CXlYtH
X-Proofpoint-ORIG-GUID: Fps4AESXgYbpn6TXVbw5C7U3R4CXlYtH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDExOSBTYWx0ZWRfX1Mpcc1kY/QbP
 GRYpQNWb0HBzH0FPKknK43TCRHSF9txqd+j3ejRWaQC0nAIW624y6csaZ2sa/qWH0oD5VodVoOs
 ANPl4KAEgJmXLPLH9vq9PDSOaK1qi48AnFabI7CUVZbtmhQlM8ta81/JdQvoMYCceY79qVbUZ86
 6WBsebOs4cxJVEBSVAdbM53oyqkhadFvJfrkv/fhbqeaeIf0xSsEFWcGHZf4pfdmZy+NkSVYN8K
 htJp8/1QCQPzkMDrcAyoCxzhoQbym+o/2ibjnotsXLmQEUv3QUmmRn3ceFPC/KdZOvRGQwGv96e
 hn8DQTQd9W8y7QwK6WCCvVJbfp428FULBtBWu+nidHliI/MFHpCij71d5E6fDEBMswQcDm2S+It
 BWd+1/7cFeuzaFwWlE2N+mlAlIPRY901YOjGU+vFzMrbf0MqlFFkx5bfKuWNyZMupsKJByOg
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6825d9de cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=cgA5pjseBJ7OkrGVO9IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_05,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150119


On 5/15/2025 3:58 PM, Bryan O'Donoghue wrote:
> On 15/05/2025 10:56, Vikash Garodia wrote:
>> memcpy(hfi_dev->pkt_buf, rd_ptr from shared queue, dwords..)
>>
>> pkt_hdr = (struct hfi_pkt_hdr *) (hfi_dev->pkt_buf);
>>
>> if ((pkt_hdr->size >> 2) != dwords)
>>      return -EINVAL;
> 
> Yeah it would be better wrt the commit log.
> 
> But does it really give additional data-confidence - I don't believe it does.
> 
> => The firmware can update the pkt header after our subsequent-to-memcpy() check.
How will that matter if the queue is updated after memcpy to local packet ? All
processing of data would be from local packet.

> 
> Again this is a data-lifetime expectation question.
> 
> You validate the received data against a maximum size reading to a buffer you
> know the size of - and do it once.
> 
> The firmware might corrupt that data in-between but that is not catastrophic for
> the APSS which has a buffer of a known size containing potential bad data.
There is no way to authenticate the content of payload. We are trying to avoid
vulnerability by ensuring OOB does not happen by validating the size _alone_. Do
you see rest of the data in payload can lead to any kind of vulnerability ?

> 
> Fine - and additional check after the mempcy() only imparts verisimilitude -
> only validates our data at the time of the check.
> 
> my-linear-uninterrupted-context:
> 
> memcpy();
> 
> if(*rd_ptr >> 2 > len) <- doesn't branch
>     return -EBAD
> 
> if(*rd_ptr >> 2 > len) <- does branch firmware went nuts
>     return -EBAD
> 
> Superficially you might say this addresses the problem
> 
> if (*rd_ptr > MAX)
>     return -EBAD;
> 
> memcpy();
> 
> if (*rd_ptr > MAX)
>     return -EBAD;
> 
> But what if the "malicious" firmware only updated the data in the packet, not
> the length - or another field we are not checking ?
That does not cause any vulnerability. You can check and suggest if you see a
vulnerability when the data outside length is an issue w.r.t vulnerability.

> 
> As I say if this can happen
> 
> 
> if (*rd_ptr > MAX)
>     return -EBAD;
> 
> memcpy();
> 
> if (*rd_ptr > MAX)  // good
>     return -EBAD;
> 
> 
> if (*rd_ptr > MAX) //bad
>     return -EBAD;
> 
> then this can happen
> 
> if (*rd_ptr > MAX)
>     return -EBAD;
> 
> memcpy();
> 
> if (*rd_ptr > MAX) // good
>     return -EBAD;
> 
> 
> if (*rd_ptr > MAX) //good
>     return -EBAD;
> 
> if (*rd_ptr > MAX) //bad
>     return -EBAD;
> 
> We need to have a crisp and clear definition of the data-lifetime. Since we
> don't have a checksum element in the header the only check that makes sense is
> to validate the buffer size
> 
> data_len = *ptr_val >> 2;
> if (data_len > max)
>     return BAD;
> 
> Using the data_len in memcpy if the *ptr_val can change is _NOT_ TOCTOU
> 
> This is TOCTOU
> 
> if (*ptr_val > max)
>     return EBAD;
> 
> memcpy(dst, src, *ptr_val);
> 
> Because I validated the content of the pointer and then I relied on the data
> that pointer pointed to, which might have changed.
Yes, precisely for that, memcpy() does not rely on ptr_val. The one you are
referring as data_len is same as dword.

Regards,
Vikash
> 
> TBH I think the entire premise of this patch is bogus.
> 
> ---
> bod

