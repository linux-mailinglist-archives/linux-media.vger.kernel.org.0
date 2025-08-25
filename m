Return-Path: <linux-media+bounces-40855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F389EB335E6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEBC73BBF5D
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 05:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CAE2798FB;
	Mon, 25 Aug 2025 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g6P8mz9j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9530213E6D;
	Mon, 25 Aug 2025 05:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756100853; cv=none; b=TVEBRVbFaupglmrXkXp+G2nw+/C2YgcvgKVSTJh3oE8wIAf8ggNF+OtE9kzVBD1m6AQO+YiU4GxCmc9p7R88VW/jMkLfHIZBC/6jzuACfegFnadY6e9PV8CPE71D8E7PcwNcksUO4P6XBMgciQTHFchwe++LxKGV7f8HUjQJ3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756100853; c=relaxed/simple;
	bh=kN6CUtJH9YBaaXlWUph1SSzxvh7Un5omyMdSEUPncN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s76yiDfBQDeIZJdFVdECPgMKwVOH+6aaSQXMENti7yB7XNT90szchrOLgnfNSKDrEn1JSubBwGMQHVlwfa1NaL22n232jbjGYoN+jY8FKtXzNJokWElGRICH6WR0mYK7IF3WqpvL0TZsNpYGZQhB0MP+W2SVZ1u3RRJJktKGYsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g6P8mz9j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OLsK0p031759;
	Mon, 25 Aug 2025 05:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMmzPAnB7xeKeTGR4C3FeOrVbwUMHyf2uzuCu9+3GhQ=; b=g6P8mz9juHiWV+9A
	zPd6aYzZUjBuZVlS+jT/uooRVxOYb9bCd5mMK0CcpxvSH1SD42OFyAuw8Mweib0s
	LHG98/GROazeHxEMh+zzgva2ELuW2Hr1Si0aSJwHSE32GcPh10+T/XvClqNkJC6x
	PaQy6kQDfZTIapOhLtvJsflEuy1guNIdlMj/sGeILyZuaqJQuIN5GfbSTJ/ZYJEn
	40VZKwjF0NEEB0KlISMDGdi9qLQ7rQuso7zJd9szXXKL86SFrRpmo4G1rDpPfQlc
	M7q+twlZ1/K37X9HlKvroCv5d7AbnRfLukEXKc989nYZjwapeDDgKbOkrPt8KBfb
	9V9qzA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc3txd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:47:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P5lPYq009169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:47:25 GMT
Received: from [10.204.100.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 24 Aug
 2025 22:47:21 -0700
Message-ID: <7cc32935-e9d4-a250-29d8-6a873ac21540@quicinc.com>
Date: Mon, 25 Aug 2025 11:17:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 08/26] media: iris: Simplify session stop logic by
 relying on vb2 checks
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <20250820-iris-video-encoder-v3-8-80ab0ba58b3d@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-8-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXxHf2jY5LOsXB
 Ts2FCeLTPxBPYiX9YlF3FmKyF4poN7o6Z3D28CAEp0hx0U5Y2ix+XWXrQ2md+O3zUhHYhoYosp3
 bfLul2odSHMg4xgrXk1CUYmIZN3zG9eWpEOMyvSusoYnqwCpRNDa9Ny7tl5tYAD7lQwTpfefsI5
 vCOfcqHaUM7S6s36WvRTW4uD07G8hU+QOrGyjuz+aHiA0Dbup94M6sxlhqp6m1fENo2Mp/K9tzW
 0hLUpOTciSY+bvZhl0ZflVqafJ72Kks9An9ZJ6ixI3zBdbH2bfXekt1aCpArLp46hDanl1HAQRo
 Rfxl2jsM3qHZBPleJiO4gN3uVpku2J4QK310xtm8iJ1tvELume1v9eHjagM69zGD39buqTvkcVz
 5uLDo/UY
X-Proofpoint-ORIG-GUID: elRsCg5PQQDp-w79X8ZTDQqfeWaZ-T4h
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68abf8ee cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=BCuInb_XF5nqP4HStJMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: elRsCg5PQQDp-w79X8ZTDQqfeWaZ-T4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032


On 8/20/2025 2:37 PM, Dikshita Agarwal wrote:
> Remove earlier complex conditional checks in the non-streaming path that
> attempted to verify if stop was called on a plane that was previously
> started. These explicit checks are redundant, as vb2 already ensures
> that stop is only called on ports that have been started, maintaining
> correct buffer state management.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 42 ++++++++++------------
>  1 file changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 5fc30d54af4dc34616cfd08813940aa0b7044a20..3e41c8cb620ebe51636a4cc5202909bb043ed4ab 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -184,11 +184,25 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
>  	u32 flush_type = 0;
>  	int ret = 0;
>  
> -	if ((V4L2_TYPE_IS_OUTPUT(plane) &&
> -	     inst->state == IRIS_INST_INPUT_STREAMING) ||
> -	    (V4L2_TYPE_IS_CAPTURE(plane) &&
> -	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
> -	    inst->state == IRIS_INST_ERROR) {
> +	if (inst->state == IRIS_INST_STREAMING) {
> +		if (V4L2_TYPE_IS_OUTPUT(plane))
> +			flush_type = HFI_FLUSH_ALL;
> +		else if (V4L2_TYPE_IS_CAPTURE(plane))
> +			flush_type = HFI_FLUSH_OUTPUT;
> +
> +		reinit_completion(&inst->flush_completion);
> +
> +		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
> +		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
> +		flush_pkt.shdr.session_id = inst->session_id;
> +		flush_pkt.flush_type = flush_type;
> +
> +		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
> +		if (!ret) {
> +			inst->flush_responses_pending++;
> +			ret = iris_wait_for_session_response(inst, true);
> +		}
> +	} else {
>  		reinit_completion(&inst->completion);
>  		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
>  		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
> @@ -207,24 +221,6 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
>  					 VB2_BUF_STATE_ERROR);
>  		iris_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>  					 VB2_BUF_STATE_ERROR);
> -	} else if (inst->state == IRIS_INST_STREAMING) {
> -		if (V4L2_TYPE_IS_OUTPUT(plane))
> -			flush_type = HFI_FLUSH_ALL;
> -		else if (V4L2_TYPE_IS_CAPTURE(plane))
> -			flush_type = HFI_FLUSH_OUTPUT;
> -
> -		reinit_completion(&inst->flush_completion);
> -
> -		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
> -		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
> -		flush_pkt.shdr.session_id = inst->session_id;
> -		flush_pkt.flush_type = flush_type;
> -
> -		ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
> -		if (!ret) {
> -			inst->flush_responses_pending++;
> -			ret = iris_wait_for_session_response(inst, true);
> -		}
>  	}
>  
>  	return ret;
> 

Looks much simplified now.

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

