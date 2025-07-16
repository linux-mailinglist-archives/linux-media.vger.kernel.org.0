Return-Path: <linux-media+bounces-37837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2297CB06EA0
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8E12504D8E
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 07:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5132AE8E;
	Wed, 16 Jul 2025 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="htAspZ9u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4856827146F;
	Wed, 16 Jul 2025 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650051; cv=none; b=SDZjVuVSGy9ofLeq/wHgrnz2yRLb6Yd9Xx0D4Za1gLEYnNzUvmv8RqFRvBfGz9NjHyeEnZhiAQgnBk8S09JUzhSBMxzBtTaWAO3IFLc7ABSEi2qI2tj3L3utUUtMTTrdUlYABHJk4AqcJ09heSoKXxx/DaLABQzqtFyD82p4jJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650051; c=relaxed/simple;
	bh=QBIfAjSoRjqJgtJ7y+/mx9oI4j6qBq51SJQNi5rSeLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EUOtxZlzP2969Imn4wIU4+4G9HdnLbkH/qtXoRJP3F+6HIdNy5XQql+Sl+LDzb6YByi/Bu6+URORq5NWYbl+50EuaTIetMK9xUitxfH8UoUH6J/F4jMbu/lJIBdKYzZQccVqexvyMeimYRwpy5U1Ex4GwH7XaIsgHm5twKygIJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=htAspZ9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5vYp0029698;
	Wed, 16 Jul 2025 07:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40lEk+g3SejQS2IvDC7RqWMlpsJX7b2RKLefb1eGV4A=; b=htAspZ9uwp1Qsz6t
	aMHW6/7KVeqyx6/hIdeVcVZ0P+eg8HaBwgOOpGZQP94tKInGg2O6mpxcUgc/NWE/
	BLQdIBrFEa8OvHdr/V/DcqPrRK4gxlr7wNsUxheDf4/EkViP4XfKrSqHefZ3Nark
	aSOGKe7L85WJfSH1wax8+BIHATRSktoHP4QiZi7XMFPStR0QeTtoxy5NB+8NsfUO
	20xv6tUSsQ9IEeBnTIKjhwJEp1ttnRF9VsSTv8PM+BBST1c/sTL5jV7TMb8hM4w6
	+0RBMeKy8B8KuTsg8qxz6My2pSD0lNqtHR4axu7LfXcMAzj/CIDCeIJr7RAoYaQH
	wREN6A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb2y6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 07:14:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G7Dt7c007777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 07:13:55 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 00:13:52 -0700
Message-ID: <13bc6b54-f558-8249-e1a7-4acd31cec70e@quicinc.com>
Date: Wed, 16 Jul 2025 12:43:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 09/25] media: iris: Allow stop on firmware only if start
 was issued.
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
 <20250704-iris-video-encoder-v1-9-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-9-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nbXwafeGkLu7hBoNl31bfiFEY5fCFr7f
X-Proofpoint-ORIG-GUID: nbXwafeGkLu7hBoNl31bfiFEY5fCFr7f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2NCBTYWx0ZWRfX48deVTZCrD1P
 71856hCUM6FPeh82HfbObxbWLL2MIXxfCxwNn6qtZly21mtYVrXUOqc4sux2XHTD0dM6QQW+U9O
 Yx6kqEcNr0W5PR//kO55CYf8yHyBEuMr8Gblz7GLXFUg4398vC4lRSEsvcOLqAABEIc3hoeLPYj
 z1NdtBwmuP5nfZUSBrvAvkpYV7AY9+RxvAtx0nJZCpB6075oWVyPYxTvDIVLx6N8IGO9zGd1blE
 BKoH3AtVlyO00lWsYDbmOdyU6OJfV7g1fn2AtvDXT8a0JEOjz5d+OYzjyf2CuuKDcozTVcWsTbg
 frkJWMaq3J5u3F1BOaxdsEseDP59u81cGMHHCNnlxzcnIkU+lqDdNhQE+lHJzOqnMgPumTaog+H
 RYZF/lQC+jWJz+5V7goia1ignxuUWp1Eg6+2FOG/bIwcvsxkMeuLE+gCjhKmj9DZJi+kapi8
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6877513b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=QtfZ24-MeIpz-YScN-wA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160064


On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> For HFI Gen1, the instances substate is changed to LOAD_RESOURCES only
> when a START command is issues to the firmware. If STOP is called
> without a prior START, the firmware may reject the command and throw
> some erros.
> Handle this by adding a substate check before issuing STOP command to
> the firmware.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 5fc30d54af4dc34616cfd08813940aa0b7044a20..5f1748ab80f88393215fc2d82c5c6b4af1266090 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -184,11 +184,12 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
>  	u32 flush_type = 0;
>  	int ret = 0;
>  
> -	if ((V4L2_TYPE_IS_OUTPUT(plane) &&
> -	     inst->state == IRIS_INST_INPUT_STREAMING) ||
> +	if (((V4L2_TYPE_IS_OUTPUT(plane) &&
> +	      inst->state == IRIS_INST_INPUT_STREAMING) ||
>  	    (V4L2_TYPE_IS_CAPTURE(plane) &&
>  	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
> -	    inst->state == IRIS_INST_ERROR) {
> +	    inst->state == IRIS_INST_ERROR) &&
> +		inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
>  		reinit_completion(&inst->completion);
>  		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
>  		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

