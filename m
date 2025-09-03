Return-Path: <linux-media+bounces-41672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B90B41EE0
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9604020290F
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFAB2FCC06;
	Wed,  3 Sep 2025 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gBXvWTqE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939812F8BE4
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756902333; cv=none; b=TfOf6T2TvdcowWEznxHiiAdB5STmLU/n05ewMIaR961cr5LIW5KDc8uVBBFL69L55P3lAYNBDAo3z62ckJdFb9He0YVgt/L15vvuwu5FmkzefRdU0SuuLqxlI54Ri20RrwCt9mMqjBVFxeRvX9qw1XCixCXWxP6AabnwFqLZJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756902333; c=relaxed/simple;
	bh=KPwsEJvAgXkjVnBTWgpcN/Msrfxrqfsm2GCKm2d2t+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LgeAVljxaCUSQBbumPlbqI+oAU07wEONDWERihYNUw7wWWhvsudqN6HnaW0Pe0iRHGi3TIV31Y7XPoU1HWbbUrpPLms+LSLcqMmim+9WPggzcFL5OxUiNkcBXEgV3OgDVB50F0EyketHTj+a/I/BYKjaXPByEARGRZ6TmTZN3ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gBXvWTqE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEsMW013984;
	Wed, 3 Sep 2025 12:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2fiYvZJO3o9q+s6tYcsUanLuxBhINQ89s0eRDvEXOE=; b=gBXvWTqEtYmC5Ia/
	RugYlWyYxtZzBU26qYkLGihgUN2833lWD/YNuRpvwhkldJ+T6IkPgPE5WIeIlDLU
	BkEuxiVj9To43Kk77yKD9k6s1erbjQ0YQ0KD6adf2D1ytXgcCLmRXHUoFTV0dwnT
	FA9jLb+YGv80oWhBLA6VFEh0lZJC18r58fC2c6hIG/lGIcr6R4YT0GVD0JxcKWrk
	r1keseSibkSDu9NwvdnG/Ot7bJriieWa7TVHeoZ9Y+p0HKcFJqcdcWIm+2gfmCgC
	JcoZOIbUmZkRDS9Y7QQVpmo61rCMFDGngr5Gu4j34stJM1od17Rp2fRKxFb+zM0n
	f71NCg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy7gnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 12:25:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 583CPRPO023813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 12:25:27 GMT
Received: from [10.216.53.8] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 05:24:54 -0700
Message-ID: <b60f364e-3aeb-7e01-d03e-b7ec8eed1a42@quicinc.com>
Date: Wed, 3 Sep 2025 17:54:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] .mailmap: update Vikash Garodia's email addresses
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux-media@vger.kernel.org>
CC: <vikash.garodia@oss.qualcomm.com>
References: <20250902152224.1150300-1-quic_vgarodia@quicinc.com>
 <de89f325-0e4c-4040-a7ae-fd36d3e4a177@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <de89f325-0e4c-4040-a7ae-fd36d3e4a177@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b833b8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=xOd6jRPJAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=-GMWYt7hz1AoRdSRXfsA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CtlDXXLo58Iuin7En8uWJ4Jbu3385QXR
X-Proofpoint-ORIG-GUID: CtlDXXLo58Iuin7En8uWJ4Jbu3385QXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX1tzSPy0ZPO7A
 OpSjmTu4xqlZDy+Uj6KlxsXqUGmC/yFBvCKZ2cgf5jdKknZkUddo625SOas/tYfGlSix8/NRghk
 8QOgMsRcCNqiE/Z9sDD+qRW+itmQ+dCiNGjM+zGMfDgqW+tpbIkcTcnhLzp7dP9XaIIhp4CUpaS
 ypQB5Euv4iUBrkBgXnFi8k8K4Hcit5YyBb+5Emy8RUPv/z+5mf8HyCbvgN/M0Krg4fUZhlErZRQ
 QN7Tw3SUgZ1vr/2PCoQvpqaK+yvniUpKrQILarChETkQogMHaHlVY+g4gHvIdzLG5ctn6S8ASec
 9STDDsb1HWpxUEsrwylRYNYs1KSvW4Mdbj77E+KaxdWA1h3orQM94tQz2n7Wzj+osQSNogCxUH4
 3YMEPJAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101


On 9/3/2025 12:56 AM, Krzysztof Kozlowski wrote:
> On 02/09/2025 17:22, Vikash Garodia wrote:
>> Add vikash.garodia@oss.qualcomm.com as the main address for upstream
>> work.
>>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> 
> That's the same person. SoB does not mean any rights to an email, but
> DCO. Please read submitting patches about meaning of SoB and drop the
> first fake SoB.

I referred this [1], at the same time, i find your point valid given its
basically represents an identity, which remains same irrespective of multiple
email IDs.

[1]
https://lore.kernel.org/linux-media/fb481f2d-d230-4869-9cc2-6f56e75f92a2@xs4all.nl/

> 
> Subject - it's mailmap, not mailmap, 

What are you trying to say here "its mailmap, not mailmap" ?

>but more important - MAINTAINERS
> patch should be squashed here.

I was planning to do it separately, but i agree its even better to update
MAINTAINERS alongwith this.

Regards,
Vikash

