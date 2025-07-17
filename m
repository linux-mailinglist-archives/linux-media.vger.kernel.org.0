Return-Path: <linux-media+bounces-37936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F001B0844C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2CBA1A650B2
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 05:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B120A202962;
	Thu, 17 Jul 2025 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dE3bGRf8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAFB4689;
	Thu, 17 Jul 2025 05:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752730575; cv=none; b=IigXpn5V7tBG3zKndD56pk6gUPnfYgukdw9JsWj/QNtIRXxyelXzEoF2E/slUA5d6AuujRqI0xF6GRCYU8DgxXju0eM7rWXAkSmb2o/5a5Dc+ICIoO06y0r3TifMj3i14DTexzI6tLBl1FpDd01ChR6vrVJxhQZkgfrb6VnatD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752730575; c=relaxed/simple;
	bh=FEmlEcSayOIHsQNQPyzw+jI8YB/J7gFPYA1NgXXjKwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IbAHel5iun8BehjDiPoEmXDtDLEt+Z3ZWKe02IJEBq/+xdEmV9RCm+FYVWceJKn90GqceqBojjXyx5G1/kqVAmD3jbzHD3SsIzLDYdbGF7Z6qIgYgmpFuYqKvCNROnGSDuHsd4sZnX5xtGF2AZwuF9zxgALHe3LOYuMQAQIwYtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dE3bGRf8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4Xolt021709;
	Thu, 17 Jul 2025 05:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJZ+0E9soK2DsOvwW41J5kJoGn76x716XyaTvcDEhqw=; b=dE3bGRf8sGA2L0fS
	ovXARM2mGg1368Q++AYCK95sjn8tSLBqOtyv3DWKvNw87FniF+CQMm7QfYCXOIZL
	96HEDS/Z7vq/7TwQ5WMI7tVKxtN7AXCY12xN8RdgoAQPbbHmUVcCBU4x3kXlZhhW
	1UYy6MH6hhtmjhLAWKs6vYpry7TsuhILic+w5vq3w8uEgMjFmujLjzXuoG44K+Go
	7b8740KeuGskzwQ+RCMWkxug+1lmsVF6yQxkO4CR1V1lX9BGJtIG/ED56TM8idtZ
	W83xvjKfputJHCBgs3rSGLa6td6Y18A4NXDngxZDBwsoKwizOfZwZFiMmSlEIdmI
	9AK+dA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8e7rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 05:36:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H5a0wD012740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 05:36:00 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 22:35:57 -0700
Message-ID: <841a9087-f3cb-870f-5d33-77ad1b0eef28@quicinc.com>
Date: Thu, 17 Jul 2025 11:05:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/25] Enable H.264/H.265 encoder support and fixes in
 common code
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA0NyBTYWx0ZWRfX3BM5acTuXAvV
 tiFLYrEYtfpCmXteEVMhMKPMsp64Z2FpgehlLQiJBu921R45QLRdbW94xnaFb/FENrizQK2DEej
 fuChMAmh6xoIxH3ILbpP8F1VAHX9Jj300LlWDeXnQ4xTruYvvCDZXlASpkifJxqznaCaKiQtAW3
 Osn+Z6Awd3xaRQH2heqJb2lu+l2KntXV/VAGmoICYALUIeh44Hd1pC74PZ5wgMm4zJ/p17UBhoj
 5WCMv/ZPlqQWC5mdFQQA6e9TWzLRyEGB5O6LmOJ5WN6Z3AK7FZRlMIz+ou0Uq3Sihv134Nwk3jh
 TB5BXDf36LjRcX1I31m36xIygdnjOYRXBl/Urhg90VVS9wOgyOKmSkaub7qZmuoYY8QgYDY/FI/
 niWk/qndsukFHskXMG/jx5dpk/X+4CYmq6DRK3kL70PfZNM9KmSOS9xvppBn0TJF5WHi/lXx
X-Proofpoint-ORIG-GUID: 6lpaXJ_rJyZ6BKl_DTnzk40Ex9EPc3Xx
X-Proofpoint-GUID: 6lpaXJ_rJyZ6BKl_DTnzk40Ex9EPc3Xx
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68788bc1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=fSTb7FvrLMLh5MOGqSAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=533 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170047


On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> Hi All,
> 
> This patch series adds support for H.264 and H.265 encoder in iris 
> driver and includes a few fixes and cleanup in the common code that were 
> identified during encoder bring-up process.
> 
> The changes include:
> - Enabling support for H.264 and H.265 encoding.
> - Fixes and improvements in shared componenets used by both encoder and 
> decoder paths.
> - Ensuring compatibility and stability with the existing decoder flow.
> 
> All patches have been tested with v4l2-compliance, v4l2-ctl and 
> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured 
> that the existing decoder functionality remains uneffected.
> 

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100

