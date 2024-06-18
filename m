Return-Path: <linux-media+bounces-13536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C324090CB1D
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5E321C23625
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90270139D0C;
	Tue, 18 Jun 2024 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mfq6OakL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E776F2F7;
	Tue, 18 Jun 2024 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712364; cv=none; b=YtW3jR7NQ12LKqrsFi8v9MEGSj81N9o6SRmQrwDbVdvy6skOdJ7ybG6KjEVt7cpraasDsuS0j1TWBZKt8pZtXVP18ouRsEnzH72N5fyivt4+zW78V2jSRaewTNmFy1BRgVkBaj0Dt4u2izicEb6GxAvL6aFsLPjlthMQHsJ1J8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712364; c=relaxed/simple;
	bh=96muxpRlHKqzABW80R+B1cb3Lf9pbzsBS7Ed3C+kelQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b6qJKxEQUZ+roV05qnUxPs3GHoRriCae8WpjJuKOgsZW1s0ShSuTkyvcTRWKngvOzq69s/BFKeoHxtkri+PSjBMl/CROxOvANktFsPcYfdUpNz71xbT9cQdD4aMjDQwIkQRCfg5hIkuFEirJD8YN+Lg4zUKGgJOGuTdM/EmjrSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mfq6OakL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I8XPsc009648;
	Tue, 18 Jun 2024 12:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSXwltAWronwTOt3+3iualUQGovw1ObB+9sfb7sK1LM=; b=mfq6OakLd/rboWCg
	UqvCVhUAP9hY4R5IobG2tMgdyHBZgwWYExhJyx6cIj9RZxzUeY1RU2sZXvQvxQI2
	laCzpNaaghqubhowGTeS/xMa4yjbHfYerK8UVPNjR5QZOpjn9oRY0XqpbMVUS3/F
	jPPnfnGYRgZwE/BDOwzesLM+q5tH7q870tndPQvWoO+clIRukhPz2vcgM7Y+R3e3
	NqhWv5F04k16lcpiDhATIvUhqmU4qDLlAv/oY4UeE35RxbQa6hLGnlgvfUHiS3MK
	JdGUWaP4M9aY/ioVYYN4rsWN/4+6d/cDdNerWzsGeyhm4G7CWorOb612Cv1wjtto
	08rCYw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytuav9xfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:05:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IC5DF8004883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:05:13 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:05:08 -0700
Message-ID: <1d952b60-7042-bef6-443d-325de75a864d@quicinc.com>
Date: Tue, 18 Jun 2024 17:35:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 12/18] media: venus: Refactor struct
 hfi_session_get_property_pkt
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
 <20240527-cocci-flexarray-v3-12-cda09c535816@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240527-cocci-flexarray-v3-12-cda09c535816@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MODGFQX7B6SdwAvlK8QyA_i7yksbm3h9
X-Proofpoint-ORIG-GUID: MODGFQX7B6SdwAvlK8QyA_i7yksbm3h9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180090


On 5/28/2024 2:39 AM, Ricardo Ribalda wrote:
> The struct hfi_session_get_property_pkt is always used to fectch a
> single property. Make that explicit in the code and avoid a single
> element array at the end of the struct.
> 
> This change fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_cmds.h:194:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.c | 4 ++--
>  drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 3418d2dd9371..75f4a3d3e748 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -402,7 +402,7 @@ static int pkt_session_get_property_1x(struct hfi_session_get_property_pkt *pkt,
>  	pkt->shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
>  	pkt->shdr.session_id = hash32_ptr(cookie);
>  	pkt->num_properties = 1;
> -	pkt->data[0] = ptype;
> +	pkt->data = ptype;
>  
>  	return 0;
>  }
> @@ -1110,7 +1110,7 @@ pkt_session_get_property_3xx(struct hfi_session_get_property_pkt *pkt,
>  
>  	switch (ptype) {
>  	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
> -		pkt->data[0] = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
> +		pkt->data = HFI_PROPERTY_CONFIG_VDEC_ENTROPY;
>  		break;
>  	default:
>  		ret = pkt_session_get_property_1x(pkt, cookie, ptype);
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 6dff949c4402..f5708fdfb197 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -191,7 +191,7 @@ struct hfi_session_resume_pkt {
>  struct hfi_session_get_property_pkt {
>  	struct hfi_session_hdr_pkt shdr;
>  	u32 num_properties;
> -	u32 data[1];
> +	u32 data;
>  };
>  
>  struct hfi_session_release_buffer_pkt {
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

