Return-Path: <linux-media+bounces-37276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3C9AFFF3E
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 12:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92645A51DA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 10:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5492E0B4B;
	Thu, 10 Jul 2025 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a1BzNoYu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3637E2DC339;
	Thu, 10 Jul 2025 10:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752143232; cv=none; b=RPiIAuF9gsd6tZnlyX7lRoyEejp+NQXk/vEDRgPdBBlZ2jcvb+OfwfGyxhO2pnp/vzgAM0cwl/gD0+rf5PN4XMVAQRyN7v/5+VpTu9nMFBHpgvtlxENvTbOO8z6ogWZdneyCFvckiuF9E+DQ0DOEsAY2448YwZV4+ymHuFxIT7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752143232; c=relaxed/simple;
	bh=n8CHfQarFEnSKVlslPEJ6WO7RgjCYWr7Wdpw+f/FCUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qFtiBcZ4sOB8ISTcgx5L2Cyj//4DyPQgv3HEwCvXzrAJ2ooORQVGYNF/w8UMBCkTLsmSdX3/7X6FeRtkWm7ppCGWy+0OHIu5qtuf3luNhAdHWBnBXgwaAaPi26eDjZK45t4dyPAlJgK7u53qd9Ub7CIdR7Ferxo4LXxs580cpyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a1BzNoYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9BRSN014483;
	Thu, 10 Jul 2025 10:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZDlHaKSp5/wsgkggzwbb/iS5diX6jtexug53tdC++I=; b=a1BzNoYulfh0A9kO
	6WUkJxbkU8aaQRezsCRWgTEMxR/z9L6JQuon2hHt1AdAgHxDrYyfHTMfn//Wk11R
	YZWv8YYqkVhhYP430/0ueIG95DRqRkLyRIqi/KiBIky9llplP4+LxjGq4y2qtuB/
	Q9Lr4ggeXEB8t9Ez13UFvTRlAXldtSjaN1v1qHpyFS6WRMDpKQ8PpzMx54gJJmoo
	d5eIPC8aJ9x7VG922PX+HPIA+YImI+jPa+J2AV+D3aVPfmfQCEx5xjYdBVcxR5T7
	l03xmc7A1utlsErNsBda1bR6aDs/+D8gJbM6qU0r/+KSvBZiYfN74NUi7jci/T2L
	86vXOA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b15g5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 10:27:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AAR7L5032522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 10:27:07 GMT
Received: from [10.50.13.177] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 03:27:03 -0700
Message-ID: <6985874e-efae-746d-efbd-dc537b5f24c0@quicinc.com>
Date: Thu, 10 Jul 2025 15:56:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 6/7] arm64: dts: qcom: qcm2290: Add Venus video node
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jorge Ramirez-Ortiz
	<jorge.ramirez@oss.qualcomm.com>,
        <quic_vgarodia@quicinc.com>, <krzk+dt@kernel.org>,
        <konradybcio@kernel.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <amit.kucheria@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
 <20250708180530.1384330-7-jorge.ramirez@oss.qualcomm.com>
 <8f30092c-0e17-6f4d-f3f1-769508d2f58e@quicinc.com>
 <c3803de2-56f3-4346-9490-67cd63abb287@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <c3803de2-56f3-4346-9490-67cd63abb287@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686f957c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=8UWQUrJTcZgO8iOpsvMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA4OSBTYWx0ZWRfXwd8n9v6IX7l8
 ThkLh9zTzYZYlecnv99Bu4lPazQinavl645UwCTHxzGsQmornK2ZhuFoTo95qrKy5HbXKf8wPcH
 XtgiaIsQyVybf4kd5hg3F4M5Tdo/TF19noLQDljtJLhwhnptsRX61tK7YSjDVdabA5iP8hK1jTq
 gwUtZImuaKkuZzC+E7AAnuXitaGLIG66S0LbrL++DXufv7khszqP5TLdUmMT+NaApf42nziZGms
 Y2BY0SYhmiJG1bLDTUtliMbcWGcSJwoEg8pSF6Vm+pY7WLM+vgU5I596kBYYPWkEiKW/RyXa+bT
 uJ32e3TzYCmAPOm0af5YLIdRmES7dnrE1N45A73bTztuLWpaE/krVJmbTrLdcQuHIu1qw43ZnrD
 Juc7am9zlKOnzEIDCz10wg5n7mMDkcabaVOmbPhwc0p2ezcGu+suIiq8zHi/DCOVs7GrjBAq
X-Proofpoint-GUID: e4pmgR9_fnTrpc1lsPUn9uS8Ct1-psDq
X-Proofpoint-ORIG-GUID: e4pmgR9_fnTrpc1lsPUn9uS8Ct1-psDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=880 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100089



On 7/10/2025 2:45 PM, Bryan O'Donoghue wrote:
> On 10/07/2025 09:57, Dikshita Agarwal wrote:
>>> +            iommus = <&apps_smmu 0x860 0x0>,
>>> +                 <&apps_smmu 0x880 0x0>,
>>> +                 <&apps_smmu 0x861 0x04>,
>>> +                 <&apps_smmu 0x863 0x0>,
>>> +                 <&apps_smmu 0x804 0xe0>;
>> What’s the rationale behind having five entries here?
>> could you share the use-cases that justify this configuration?
> 
> Already getting in trouble with non-pixel/secure # of iommus.
> 
> Why not specify the maximum expected number hardware supports, specifically
> so we don't end up buried under incomplete schema again ?

Adding this in DT schema is fine, concern here is, adding it to the DT
without a present use-case may be premature. Surprising to see it doesn't
create any boot-up issues.

Thanks,
Dikshita
> 
> ---
> bod

