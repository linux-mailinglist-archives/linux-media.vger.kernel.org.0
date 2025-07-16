Return-Path: <linux-media+bounces-37838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3FCB06EA6
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15F71AA0770
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 07:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96683288C37;
	Wed, 16 Jul 2025 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pTUecasR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4227146F;
	Wed, 16 Jul 2025 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650082; cv=none; b=hx1nMGo428lGdszj+o/+chFO7CBCfO9iPSEbrvxzkoMeVx6zGZ8dyEMiC9yyPwp0XIe8G6BL1KASrai2HVrVbkLlHix4pdoXUiwA5RwVa4IkjmRkBkLJiRkLmVX8Ls8MDRTtDElyYtBa7ylINjHMv6BKvKyhg7c+RHPkv/YMRz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650082; c=relaxed/simple;
	bh=6WT5r6KoJPC2KpG01VrkrVYL4IHwOOUcNPc9Gau6cdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cn6ne4sfE/UcUAsNKKIjqDAVxp3DSzcLqTIp5TKwUiPobWXUIqD7q1VK8hdrZEJTQRNLxTNArAYW/L8ZyYaW5ha6NgwiZ+GuZQs0IgC9YMScQUWQYG3YSQxqX+cf/pQDqyZ6mAexVWgd2yNt3UVfDms/UJths1LCU3FaqtUwBeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pTUecasR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G65t5Q029618;
	Wed, 16 Jul 2025 07:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jT3Bh8bK95X2gXiSfeNO8EJjpoS9LKpknUR/eHh3xSU=; b=pTUecasROyVp6qZ3
	bLkgxbDhxVjqw2Kmhj7xm6I9A3Dle9hacTVYS7c7/UwDj6z86c3o0YubdZugz/xG
	Bu2DQDxZBwC80Nv9nd+yh0RYSucnxuv9sqTG8vucRFmQDdMWaUunV10HsrT5VM3n
	mK6wKdiOqOMTWGgWx8X03IOAr67ipoTXW8JMgSuVlWc6nawVi2Ks3s71hx7Eiy8S
	N2qoD14jeQDWfQtyZxVDRXylhO9RLhtIzvmLKy3lU+IKegQ3mmPMslZruY6vAhY0
	EtGjskbRGHR0ZGsUYMBuOm5C4MlE1EccKUIfB5EqvLSlfVt5To9mrG7lxnOSLdhU
	FuFJDg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb2y9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 07:14:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G7EYxr011064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 07:14:34 GMT
Received: from [10.216.39.173] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 00:14:31 -0700
Message-ID: <099b06d0-afb0-8cf0-2d37-8adddbe537f2@quicinc.com>
Date: Wed, 16 Jul 2025 12:44:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 10/25] media: iris: Send dummy buffer address for all
 codecs during drain
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
 <20250704-iris-video-encoder-v1-10-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-10-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Rc2de6vbomeRZpo1pzfdSmdHeH1SaVPs
X-Proofpoint-ORIG-GUID: Rc2de6vbomeRZpo1pzfdSmdHeH1SaVPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2NCBTYWx0ZWRfX4QwVSOTMriJh
 fF/qB50mRZc7v4oftqWV+Yv/tJv8Y7NcU2DEgwjQm6pdrkt4grMLtlf/i0Uf9hRM7pj6/GNyfBt
 JPPSkHRRrHt05FpqECFtCLQ3AVcg6k/n8KeKlmJMYfobg11N/EJDFOK3ypGgdc7nJZW/Y0eIPbM
 JfQ9VqjwEca+LViOUj8MdrrqUAWnXtmC0rLW1vdN5PUcYAtPu/Bar106Pb2VyGx7Zk92K4s3h3/
 15YThQBC4Uk3Y2Dzl8C69v6yCxMY2uMaSOYY5CAYKxJHSV0Hdv8O6nPwCXbkiumbuDDcrOlhyKD
 2I5rNxqGAJRUPJOcNx0WHxjQpEHFVYsesNCeiqaI6stkuqnWHQ1JC/ErocfHYCNELrMZFeaCGkj
 n8BEBR+H1A8zbydXhOi/tvfGEusV8msp3G0//CoflpOplSWzE++jVrZTsU18BxG+028svBe4
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6877515b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=EEMiJc2fybtc2XWaA9oA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
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
> Firmware can handle a dummy address for buffers with the EOS flag. To
> ensure consistent behavior across all codecs, update the drain
> command to always send a dummy buffer address.
> 
> This makes the drain handling uniform and avoids any codec specific
> assumptions.
> 
> Fixes: 478c4478610d ("media: iris: Add codec specific check for VP9 decoder drain handling")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 5f1748ab80f88393215fc2d82c5c6b4af1266090..5097680ee14ebba3a126213c0584161627ca47d7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -402,8 +402,7 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
>  	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
>  	ip_pkt.shdr.session_id = inst->session_id;
>  	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
> -	if (inst->codec == V4L2_PIX_FMT_VP9)
> -		ip_pkt.packet_buffer = 0xdeadb000;
> +	ip_pkt.packet_buffer = 0xdeadb000;
>  
>  	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
>  }
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

