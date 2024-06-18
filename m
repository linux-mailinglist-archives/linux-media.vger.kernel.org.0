Return-Path: <linux-media+bounces-13545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2E90CBC3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61F301F2394E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69C013A27D;
	Tue, 18 Jun 2024 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XNjP9bDm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14692139B2;
	Tue, 18 Jun 2024 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714096; cv=none; b=QDqVHSgY8p2awXOulUZNdxp6JWp4934KOUAu5nnsUsQg3d7aHH6oq4T0JDFfSSCxL2cc5uPst5wMqDrskG0BuG6EusPjwzqBR81aIGJ3O2X4V+SEDOYLU2dJmJN6dHJNpaeR2vzGaq+qiGXKYMQH4Rd9mW7o1D5rkRZPnX4nDL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714096; c=relaxed/simple;
	bh=Qf7lQiSO+HV891tKN2AwsT9tEqpv/dkU7byZPEF/C10=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kdDf7zmB2tNi8bynwVH6quZerNv/N2G4It1x7ay/bkw7tHupgQjkaqPdFsnNqyH4uO4w+W61VOyMmmnM6SuIg0lb9olqt8bPO1mgO0l8WMBLr/+n4gLTtz1m5jCVumGhEGmdNdI8jiLExtmBI8bxriR3hauDGk7pVDg98SAoDVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XNjP9bDm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IAYvOi014044;
	Tue, 18 Jun 2024 12:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xN1qhrj24tadT1BcIVndNR9Qw3QnrJlvaPr1Eaqa6A=; b=XNjP9bDmFxG+LhFd
	ExCHkCJkHnC/mOo+FPS/l/L3QaTgOD79OCYiY0PxB2LnL2NnhBTb8ZD/z5DF+1K+
	xU2colGW3t2s53jBnLlswmdQ1ki7T1y+k/cQwlSt0/4RUmh/u9bsKK0U6MtuFj5K
	3yXAEsSAs2lQImK70Qo1GORuPN+KLdI2dmUApEABSvVzobi1RiUKr6E2tlrEkYuN
	/8vtj1R5sFJRJnUPDrZPI5RyyY1hzdjhWBwhNZu3GpQflMcT7HW8xJtKGOsKozEO
	Ful/ZvkxNVSIs0bEig8JUp5+4Pey5uIkAQUX0Eypz+RFg1Pot5cDfZOIZhadv99V
	MJohLw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu8m1gawy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:34:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ICYcO1015035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:34:38 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:34:33 -0700
Message-ID: <3f7baafb-82c7-3955-e871-687fafe8048c@quicinc.com>
Date: Tue, 18 Jun 2024 18:04:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/18] media: Fix the last set of coccinelle warnings
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
        Michael Tretter
	<m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Andy Walls <awalls@md.metrocast.net>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g6j0PGiGJxug23uEww4e1iT1So9NJEyx
X-Proofpoint-GUID: g6j0PGiGJxug23uEww4e1iT1So9NJEyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180093

Hi Ricardo,

On 5/28/2024 2:38 AM, Ricardo Ribalda wrote:
> With this set we are done with all the cocci warning/errors.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v3:
> - Do not rename structure fields. (Thanks Bryan)
> - Link to v2: https://lore.kernel.org/r/20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org
> 
> Changes in v2:
> - allegro: Replace hard coded 1 with a define. (Thanks Michael)
> - Link to v1: https://lore.kernel.org/r/20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org
> 
> ---
> Ricardo Ribalda (18):
>       media: allegro: nal-hevc: Replace array[1] with arrray[N]
>       media: xilinx: Refactor struct xvip_dma
>       media: dvb-frontend/mxl5xx: Refactor struct MBIN_FILE_T
>       media: dvb-frontend/mxl5xx: Use flex array for MBIN_SEGMENT_T
>       media: pci: cx18: Use flex arrays for struct cx18_scb
>       media: siano: Refactor struct sms_msg_data
>       media: siano: Remove unused structures
>       media: siano: Use flex arrays for sms_firmware
>       media: venus: Remove unused structs
>       media: venus: Use flex array for hfi_session_release_buffer_pkt
>       media: venus: Refactor struct hfi_uncompressed_plane_info
>       media: venus: Refactor struct hfi_session_get_property_pkt
>       media: venus: Refactor struct hfi_uncompressed_format_supported
>       media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
>       media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
>       media: venus: Refactor hfi_sys_get_property_pkt
>       media: venus: Refactor hfi_session_fill_buffer_pkt
>       media: venus: Refactor hfi_buffer_alloc_mode_supported
> 
>  drivers/media/common/siano/smscoreapi.c        | 10 +++---
>  drivers/media/common/siano/smscoreapi.h        | 18 ++---------
>  drivers/media/common/siano/smsdvb-main.c       |  4 +--
>  drivers/media/common/siano/smsendian.c         |  8 +++--
>  drivers/media/dvb-frontends/mxl5xx.c           |  2 +-
>  drivers/media/dvb-frontends/mxl5xx_defs.h      |  4 +--
>  drivers/media/pci/cx18/cx18-scb.h              |  2 +-
>  drivers/media/platform/allegro-dvt/nal-hevc.h  |  7 ++--
>  drivers/media/platform/qcom/venus/hfi_cmds.c   |  8 ++---
>  drivers/media/platform/qcom/venus/hfi_cmds.h   | 38 ++++------------------
>  drivers/media/platform/qcom/venus/hfi_helper.h | 45 ++------------------------
>  drivers/media/platform/qcom/venus/hfi_parser.c |  2 +-
>  drivers/media/platform/xilinx/xilinx-dma.c     |  4 +--
>  drivers/media/platform/xilinx/xilinx-dma.h     |  2 +-
>  14 files changed, 39 insertions(+), 115 deletions(-)
> ---
> base-commit: 48259b90973718d2277db27b5e510f0fe957eaa0
> change-id: 20240507-cocci-flexarray-9a807a8e108e
> 
> Best regards,

Could you also mention if you have run any video usecase on any of the boards
with these changes ?

Regards,
Vikash

