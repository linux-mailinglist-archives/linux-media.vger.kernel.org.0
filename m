Return-Path: <linux-media+bounces-13535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD54E90CB02
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C559C1C2365A
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBB412F398;
	Tue, 18 Jun 2024 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eCd8iKbg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6AB78C96;
	Tue, 18 Jun 2024 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712033; cv=none; b=t4VmmQXInvwkdwXLEjAmdso4Ow9ilRQYLLGfZenA4GWWaKpNRCsqfMxTY282SBQE52Ad/D8d9EEFpQb5ij5PQeoxDlOC6dULLMvFe78YQjUbvi7FmrmDdejvyMJYbXhvN8TFWin9hZFISDec6QjPYQd8CK1PMYtIwNY12rSQMe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712033; c=relaxed/simple;
	bh=JHtH5Zt/sHwoccyUF3e/+naRr5UxNE9G6pmk1fPGBbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RCeR0i/VUDNjCMvSwotAbEI+AIHNHLJZUCjMUo74dex+9XpLNb0eLZ+ndLEOTVxcbicYuWSSY0LiYj5NY3qN8Ir007z+8eKh/3nvKI6LwdM8Kj0AAJM68Wsz7kmC+vx3bXEKVWK9R1DxxztjqTABzKfAdI1XzBf5y5EHGeG5Za4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eCd8iKbg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I6bHue004481;
	Tue, 18 Jun 2024 12:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hykSTxdmiFxOYdSWf+qG5NC9vCxXZoPYvEpy8ZPBFk=; b=eCd8iKbgaVC1UEPG
	+XXdKyEATpQ47p94PZQPMZRZYPfPs3V62Ihh3z41bZSYeey7ywPhINsG2k2RaRu0
	LqpmQjcPvdThgV04QhCpY7ZPCha9a5yT++pW4/RY4S4O2t8s4MjJhF1kHuKFcu7D
	b3afzMU5PSiBlJ/z5X38fiorb7k2bzlrnxTcoWybxcMQtv/WJdWlLfqIW18oUshg
	vvK5o9bSKRKmGL6cw4yRgtwZDyCTWv8BfAReYkyTj0bTPo12zkfMy26Si1GrmhFU
	eVNNtdWmcqcbr+lFHGQWGMSyarOrvxHiRosCKP/2dg/t4o3RIanNfidunnCNH2Q2
	ptfSXQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytt37a2ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:00:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IC087C029240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:00:08 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:00:03 -0700
Message-ID: <acdffcf6-76c5-a000-36ec-476d688a8593@quicinc.com>
Date: Tue, 18 Jun 2024 17:30:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 11/18] media: venus: Refactor struct
 hfi_uncompressed_plane_info
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
 <20240527-cocci-flexarray-v3-11-cda09c535816@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240527-cocci-flexarray-v3-11-cda09c535816@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TptkB0t0384Ky0b9u-pJN7fhDz7_34aB
X-Proofpoint-GUID: TptkB0t0384Ky0b9u-pJN7fhDz7_34aB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=814 adultscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180088


On 5/28/2024 2:39 AM, Ricardo Ribalda wrote:
> This field is never used, but if we remove it we would change the size
> of the struct and can lead to behavior change. Stay on the safe side by
> replacing the single element array with a single element field.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_helper.h:1003:43-60: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 7c0edef263ae..eb0a4c64b7ef 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -1000,7 +1000,7 @@ struct hfi_uncompressed_plane_constraints {
>  struct hfi_uncompressed_plane_info {
>  	u32 format;
>  	u32 num_planes;
> -	struct hfi_uncompressed_plane_constraints plane_constraints[1];
> +	struct hfi_uncompressed_plane_constraints plane_constraints;
>  };
>  
>  struct hfi_uncompressed_format_supported {
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

