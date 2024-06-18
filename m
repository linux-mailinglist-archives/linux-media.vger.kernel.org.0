Return-Path: <linux-media+bounces-13542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C890CBAB
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DFDA284C0D
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74CB13A265;
	Tue, 18 Jun 2024 12:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pNpPynFw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71F673467;
	Tue, 18 Jun 2024 12:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718713597; cv=none; b=lFRXbO6ntccz9EaDWxT4T2wJUvcZD6v+LahFMRpEptrzR/UpMisjE2/CUBZQ4sRVjAm2qANb0lwtYu1d4DRgJbwwzW3eYdkB3amr+3qTjDo5AGpliXhJ9tb5K6x6xxm3cf7aKOYOsgBe2OURn1XafkXB0LoBzK6Uy01iNY1vUVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718713597; c=relaxed/simple;
	bh=CNvcjC9tUSDugpZ1uimkGb8jHGRM/mGH0MFX9uas+0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UNvEtohMyL8aoMRRziVQltgvC7ZvLrucOrKRxcK2FDHG75s6VlAWv/7U6/A3LYZZ2vupzj+ZZ/tjj8ueHgCEAY3oi4E6Dt8bX9mhAtN72YtClK5Nok3s/7pv0bCZU+HRnmt9lPOsJjRh4pZRcOJZog/ZYkLSnR3PazBjnm02//8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pNpPynFw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I8cEsq009939;
	Tue, 18 Jun 2024 12:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmp+HC5Xe+uhrZ8Hp+pdWteVXfRwGHy+lxwjwWgYiWQ=; b=pNpPynFw0polwMdl
	5PaZ3CX4oyVi4jN4u93K4TYexvqXcRs8OTZ5Ii8RRpxBBsNxUdPw9LE58969L4Hv
	ZIQDb47SkO0H0Gaqz83rEg8Hr5GPPyTLpcww9NOLQHKUoK9MXubg4JZVBU9Ogqwg
	Jr8QDbnDh/cGl9+N1nPy/Hk2o9FnMr/i9AvBaWPzHcU2PrCM5XWz7yg5IV0e1eaP
	ylv0enwYHUAgDqUyQ1/5oxjMNbBnDH0pDtLhJvaf7nhrEwa2rXM2zkgM7BJv2P2f
	xvUSsXO1/P3iOMbfIQP9zukafTE7f/a3FqRbkorzr1SSphmr4RHSNLr6qYBdPM3N
	r15aPQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu6wa8nba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:26:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ICQLer010715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:26:21 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:26:16 -0700
Message-ID: <31a82112-f3c9-9766-fd9c-5b8fccbf3f15@quicinc.com>
Date: Tue, 18 Jun 2024 17:56:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 16/18] media: venus: Refactor hfi_sys_get_property_pkt
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
 <20240527-cocci-flexarray-v3-16-cda09c535816@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240527-cocci-flexarray-v3-16-cda09c535816@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tqFPcW1xldvAPlENOB7MsRfve0skBKoe
X-Proofpoint-ORIG-GUID: tqFPcW1xldvAPlENOB7MsRfve0skBKoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180092


On 5/28/2024 2:39 AM, Ricardo Ribalda wrote:
> Replace a single length element array with an element.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_cmds.h:77:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.c | 2 +-
>  drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 75f4a3d3e748..0a4de8ca1df5 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -156,7 +156,7 @@ void pkt_sys_image_version(struct hfi_sys_get_property_pkt *pkt)
>  	pkt->hdr.size = sizeof(*pkt);
>  	pkt->hdr.pkt_type = HFI_CMD_SYS_GET_PROPERTY;
>  	pkt->num_properties = 1;
> -	pkt->data[0] = HFI_PROPERTY_SYS_IMAGE_VERSION;
> +	pkt->data = HFI_PROPERTY_SYS_IMAGE_VERSION;
>  }
>  
>  int pkt_session_init(struct hfi_session_init_pkt *pkt, void *cookie,
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 2c56ae303989..f91bc9087643 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -74,7 +74,7 @@ struct hfi_sys_set_property_pkt {
>  struct hfi_sys_get_property_pkt {
>  	struct hfi_pkt_hdr hdr;
>  	u32 num_properties;
> -	u32 data[1];
> +	u32 data;
>  };
>  
>  struct hfi_sys_ping_pkt {
> 
>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

