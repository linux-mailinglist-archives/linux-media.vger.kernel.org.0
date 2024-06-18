Return-Path: <linux-media+bounces-13540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E13990CB8F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB25C1F235A2
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3723B13792B;
	Tue, 18 Jun 2024 12:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ceXORIav"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD452139B2;
	Tue, 18 Jun 2024 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718713330; cv=none; b=HcsQT8ZWDTrIluer6HYzSsX+BM2UvIeW1bOrru95C5Un7unJTNVuUkD2gp6v0/tbt4oJyXb789DwPlNtl3kl3VDB+uEML8lMdDGKGpa12UviGRJf873OhUhZ+GHM2Lxa4zlFd+tP4BDKnX3d3LsFWhsHa6q+3yqoywI9PeXmSJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718713330; c=relaxed/simple;
	bh=eWTx4dkb6c1hoGtuHgyxOdxMRdCw8Iaokd4mAvSC4yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EZ/uvBwj5ro3yq75A9pyAymUhDU8sPM22r5fP3mTV+7cWmR+p01WTFYk7mgBo2/w3CnFs0r3oWBrNuScOQ/QeDjr0D4mrHi0lidE7C4CsWrX+QxyKvU7nppFRfm2XlDlbbt/autUW52kDD4ZMPH+kcgB/H2Iey4euzGZdDZXw4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ceXORIav; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IBH34J002594;
	Tue, 18 Jun 2024 12:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySxhmM+oROELP46KKRd5/R3Mb8d7yjG3/FhWMFsbRyU=; b=ceXORIavdi/4iU3B
	+pAy/weS0KQXnATx0UqyeOiDy9FqLPVPXsg9IkdnwzKsU8C9XiElTW3HyNxvnus7
	aX8QPrH415Lx5wGRcIRus3+VZufrYjzeTrk6mrITp0Fx+CY4zibqSqy4pR8YZysq
	z7BsRMFenA1B8FQ3Ryr/ock2KrCij6ysYnfRD9r9aFsfmTkzlgH+1qDXJg1vgjFK
	UCrSaqCsgOAcV4G+eyXbGqIXW4DoyWY/z4cIMFqwp2l+tgqy8C/bwsJ2QfvtetHP
	A80rIQjfvd6djrwRVfqRzw0/yb32Cg86Y3tIaJUdX5rBAcQXP6SlcrmxaGQRC6Bb
	r6RtAA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu1b0sac9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:21:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ICLh99026734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:21:43 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:21:38 -0700
Message-ID: <ba921d4d-8a3f-b9c3-eb24-a61dbd47adb8@quicinc.com>
Date: Tue, 18 Jun 2024 17:51:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 14/18] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
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
 <20240527-cocci-flexarray-v3-14-cda09c535816@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240527-cocci-flexarray-v3-14-cda09c535816@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9Y9WPIRK1ZRsC1IXGdpO21Kg97EJw_Pu
X-Proofpoint-ORIG-GUID: 9Y9WPIRK1ZRsC1IXGdpO21Kg97EJw_Pu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180092



On 5/28/2024 2:39 AM, Ricardo Ribalda wrote:
> The single element array data[1] is never used. Replace it whit a
whit -> with

> padding field of the same size.
> 
> This fixes the following cocci error:
> drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index f5708fdfb197..8768ee052adc 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -160,7 +160,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
>  	u32 input_tag;
>  	u32 packet_buffer;
>  	u32 extradata_buffer;
> -	u32 data[1];
> +	u32 data;
>  };
>  
>  struct hfi_session_fill_buffer_pkt {
> 
With typo fixed,
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

