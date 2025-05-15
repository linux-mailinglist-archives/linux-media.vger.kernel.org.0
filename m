Return-Path: <linux-media+bounces-32595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3571AB87DD
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 15:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488944E48DC
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3165525761;
	Thu, 15 May 2025 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fWarpOz2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84BD1548C;
	Thu, 15 May 2025 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315414; cv=none; b=PMAX8FUcejnaPrZE8QbhQM5eBI0xhQnqd8YiYXwwWbSBetjZTTgBPzMvHq4JPJVdyEvh9k+qLxmh5tCzd1sMvHbfbtd7BGnGXb2KaYhUSagKxit11VDrerKid9bZrJKjte0SyK4BUEW1MwwjHk7RWA6Nm97JtR/PjqhXnFgJ/dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315414; c=relaxed/simple;
	bh=g0ufLssCm8Alj3cTVt8QALFwQMtIzbKfeEj47LWOWZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OdBZkUmHSrkRj9xo9EzNqxMQ5VPudPMsw9BrT4M5ID/swnbnw4+w3n989FC5mpn1r+igveZSZsPpSsemsXR+FKubgbOoDtfm5nMOYgcraPwcWUeGakUzu3vKaG79XKwBSoq1fsvRXh2hZNMz58ojwBNhhs147aK+b63+PBaMpeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fWarpOz2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FDEJBY029112;
	Thu, 15 May 2025 13:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9u0p2en3cKLL5HJYv09X7cVjcWQ4JEERQsO7QLXiTg=; b=fWarpOz2XfPntNEX
	5ikT7SHztSI44unUSOnLWPd5gKZTjTzR+N6NnUlajq2x/gJUWL1/avkFr+faaWEK
	S6RTx5ptT7bn0zdhc1pHf0wBiZJMF5EnTKVBHkYA3AgaVTSX5SBUvzSd2SetQ20n
	ShBWz5Cr0RV9ILf3Vindm1sD0jWc/lOTL5HbuWtum0PrhXz4oU7xhyejtD4JRUI4
	XPCQWbmKQVITb8p2c9t/sAD9mhY6RZWduvnv7bUt5XpV5+ct7h3LB/5Kir0248VS
	IPpSJIj7AJHTTNiLivtHI56ewgpVpTEGmbvvJUiwtOloUH3VDpA60gm59sd7Bemg
	hiAOuA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmpce2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 13:23:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54FDNKa7007958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 13:23:20 GMT
Received: from [10.50.16.181] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 06:23:17 -0700
Message-ID: <f7df808c-0724-3f4d-b910-6e44637c7aaf@quicinc.com>
Date: Thu, 15 May 2025 18:53:15 +0530
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
 <b663539d-5ad6-399b-1e7b-0b8b9daca10d@quicinc.com>
 <bd704149-694f-4d89-90d9-a22307488743@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <bd704149-694f-4d89-90d9-a22307488743@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDEzMSBTYWx0ZWRfXx3aCyG3lnoeB
 JbCAD4C0Bd7wKHH5p4Oefu+5YyxvhOl5jB35c9KRjMG0pk/+rPW/NoT5qvtbSf/KliCVOIffimH
 PU0zV6lRmtKMFJfxXPoZLKAcvOF2Xn0vx+YrrcR5ZgyrJ9ubx9myrqpGWkMYEIw9RLYyQoqR4Bm
 UGoAZk7ebduGxNQuj471bgST0gGfXEJnXy7js+Vo7vlyQ8PnHz/71V+fIJYQ1Yk/+SufJrpTUom
 z8jWmWUgL5zL5VtVB+gSmHzzDtSHfZBYKxpuBaMMz2g9pOV/ZSoVgTWADPgf2OVgVhi49XhHZm2
 OYyzPyHHe1wGMyJ85OPf3ByJk7yeuOYP2TqkhVFaHVdGzmAPVRhJ4GMYrM9aJunpYB0ZeBiNHPd
 AaOATWwookkzd++skvBAq5H6TXqMPaqtYCbh7dVFVbD2aWYSRZxegKUx2TcNQjOBgywNiHQ2
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6825eac9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=n5NGAYUfpJiGUcY_KLoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: CbIXEGm2PcjNSKLV4OTSEDq8uabBQIMj
X-Proofpoint-ORIG-GUID: CbIXEGm2PcjNSKLV4OTSEDq8uabBQIMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_05,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150131



On 5/15/2025 6:17 PM, Bryan O'Donoghue wrote:
> On 15/05/2025 13:11, Vikash Garodia wrote:
>>> But what if the "malicious" firmware only updated the data in the packet, not
>>> the length - or another field we are not checking ?
>> That does not cause any vulnerability. You can check and suggest if you see a
>> vulnerability when the data outside length is an issue w.r.t vulnerability.
> 
> I don't believe you have identified a vulnerability here.
> 
> You read a length field, you check that length field against a MAX size.
> 
> Re-reading to see if the firmware wrote new bad data to the transmitted packet
> in-memory is not a fix before or after the memcpy() because the time you do that
> re-read is not fixed - locked wrt the freerunning firmware.
It would be more meaningful if you can suggest the vulnerability you see with
the changes suggested i.e adding the check in local packet against the size read
from shared queue. Based on that we can see how to fix it, otherwise this
discussion in not leading to any conclusion.

Regards,
Vikash

