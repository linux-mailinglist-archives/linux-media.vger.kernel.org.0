Return-Path: <linux-media+bounces-13538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 590E990CB71
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3D801F244DE
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953622139BC;
	Tue, 18 Jun 2024 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G7HY3ySI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8768D2139A1;
	Tue, 18 Jun 2024 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712986; cv=none; b=e9RAMAd1tbqlSOs0MT5dj6NoEvEB7DzVtws8okUdVN/aUcpddRZCICR8V41fG61gib689nRyzsP0/hsJikos3wby0lErKgNfZpqriZaBqJbOlxcwM9kVFlWmsi7bXkGsXjjIc2muAogu/blBKiahwvLPR+lZQAQ66OD8gwT4WUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712986; c=relaxed/simple;
	bh=3ELa4g5gAmeQ2Nk2z4ZgNffs0Ns4gLnYP6LW44roiyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gPoc+z7C1eMeUWTrRhT7HeNOjqmVkxE53x+Ro2hIRiQQbcbhM5cn0bwX82nVx/q24G4VRYltrs2U58h9cyiCHczxGeWYa6iIJP0DWSZgS6AdqJJVrXEZgDP3GKThMzhTfTxMWq41YCJl6tTvAkRYLzwSrs+1sIlQIkPHG40mgOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G7HY3ySI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IC941e018676;
	Tue, 18 Jun 2024 12:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7ajtZJswwVu9MW1cFewP/YIrgXB+PznxnrZTvcFK9c=; b=G7HY3ySIS76KIRfi
	fUjvaOCxw55X2UFxhTkLQNuC7J6oxv1BU3Go1W1JuHAm5MAvBFKon5jsJ50LFDmv
	zKiTgkKAcV1Avk0JJd/24JhAMpQe+sLZCjzDuwLWjhxOOMq7lquVSZULCi18h/CY
	FFBz823Q9A0Kc3cgLpCzb0U69odRVzQjvbXcsvkbH1slNKBbu+ZlprgOjOn36yun
	afNVSMofhrtELTmk7r9D6e+7+ArDRv1D4tCZzAlHKYa0qDTv7RLikIoVmMUUE5rs
	/ZDyDwQbgws/IPAYriPok5ABm6OEm2jTWn3OTwdfo8kvaNED7O0mSZ4vgF6CpUZ4
	VN681g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu22gs66e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:16:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ICG6Sl013907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:16:06 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:16:01 -0700
Message-ID: <e80a1f91-8fc1-1897-0e82-014ca62e5b90@quicinc.com>
Date: Tue, 18 Jun 2024 17:45:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 13/18] media: venus: Refactor struct
 hfi_uncompressed_format_supported
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
 <20240527-cocci-flexarray-v3-13-cda09c535816@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240527-cocci-flexarray-v3-13-cda09c535816@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5erk0c96WMDWk88bKMq4mGw97qIMf1ID
X-Proofpoint-GUID: 5erk0c96WMDWk88bKMq4mGw97qIMf1ID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180091



On 5/28/2024 2:39 AM, Ricardo Ribalda wrote:
> plane_info is not a typical array, the data is not contiguous:
> pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
> 	2 * sizeof(u32);
> 
> Replace the single element array with a single element field.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_helper.h:1009:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
>  drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index eb0a4c64b7ef..dee439ea4d2e 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -1006,7 +1006,7 @@ struct hfi_uncompressed_plane_info {
>  struct hfi_uncompressed_format_supported {
>  	u32 buffer_type;
>  	u32 format_entries;
> -	struct hfi_uncompressed_plane_info plane_info[1];
> +	struct hfi_uncompressed_plane_info plane_info;
>  };
>  
>  struct hfi_uncompressed_plane_actual {
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index c43839539d4d..3df241dc3a11 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -157,7 +157,7 @@ static void
>  parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>  {
>  	struct hfi_uncompressed_format_supported *fmt = data;
> -	struct hfi_uncompressed_plane_info *pinfo = fmt->plane_info;
> +	struct hfi_uncompressed_plane_info *pinfo = &fmt->plane_info;
>  	struct hfi_uncompressed_plane_constraints *constr;
>  	struct raw_formats rawfmts[MAX_FMT_ENTRIES] = {};
>  	u32 entries = fmt->format_entries;
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

