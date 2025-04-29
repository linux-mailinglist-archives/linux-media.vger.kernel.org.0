Return-Path: <linux-media+bounces-31288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDED7AA0856
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E0803AF026
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB35A2C1080;
	Tue, 29 Apr 2025 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O15MKNei"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7029DB73;
	Tue, 29 Apr 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921961; cv=none; b=pqtzb7AAVTLb+mEjzg9dEo0cOuo+lKTiEVtc1eO2Xex2C+AOCh4rBi7K2R29Vyq9zijkogxOjx5UL5l7kE/lglzZFOVQX+TGx6IKjF92NoYcuDTRLOQFqJ5yKMCM4GhDOhKufGJcGKmekgszQ+GauOAM0umk6Clp1zdu2TWoLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921961; c=relaxed/simple;
	bh=sYwcfBc7eQw5TQtTrlW3iOqP7WR4HKRv7C/47ZEs3FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vcjc/ktvPGKvOedNy4BBNPyReJDNe74Ce8ukCoVGuexjvm7ffm57w8RZRP1gPHetrAUOCaZyXNuSJootMSWRsdVEhegjg4Ke9Rr1QjoACMBGTpS8KZ+jUfDz//sFScNDSQLnURS/dtfL3sOOBPqUe3pj1eSTp4j5VWX6xX/Chk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O15MKNei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNrrgH014932;
	Tue, 29 Apr 2025 10:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zrhoqFQdUj475IOpeCgmVsISJMFxfLP3KYtvUVEtIEM=; b=O15MKNeiDfqfLyAn
	i/N7QCTz5ca2aaRxutyIHezQxoylCw2j8pQBtE2n8BhBggT41V4WHR8ynjbjj6wY
	AVjneTVxQansZRL8FMO1rzZRZE/4FgPHP7kt6NxNn5hJOw84sr0CPpRSZqOMuJrF
	XWGV4U6MVZeCNTZ6yNsptPFqI8puIfGKl2/zkFEHIICXaFwQ8GZuhZkVgrrPahpe
	2Jnw5Z6Y2TgDIGEUaCGAGMj9WqDkiz1imzM8SO0/ZnssLXW+KSMCjkZcYKGkxpn9
	nuUFsCpv1dAglZN6K3nYgJ+VKuYC1sa6ghjXlaeBkFcZ2KhlQfStvRTE4Bnjj9vq
	iyDC9g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn327y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:19:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAJFJu012885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:19:15 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:19:09 -0700
Message-ID: <6a80e90c-88f1-48f5-cd6f-7fbd5c736902@quicinc.com>
Date: Tue, 29 Apr 2025 15:49:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 09/23] media: iris: Skip flush on first sequence change
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-9-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-9-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MHe8Whm3TCHJFzDYvoz2bqC6Rwn5i16B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NiBTYWx0ZWRfX+mDx/iWtWP6W 8sndAFFrtFb/dyD0NCkh6A7MH0maMdecxfpZ1W5ZUEZUboEaU7AtfTnTJF6XPemw3u9fNQ/SGuv nHtkMhodz6L1CaXflFaz4l2Tj/eKVvBsroKxpWpmTEo+/9S1NV3DXA3MxpSQbKPQKIz3sfmV6Bw
 S5WjkLq4E/M3lV0Ds/P1vNYa7q/jp2hfX3Sv8setKmr5Xm/5MNx3OVcPcfVZq+MRd2HRW78IsJc S1O2/NrHHXV8bAzu2jqU7Gz45TecjpNOfx6iRrA2MhpGKZGhgUu7boy2wi9ve6qnN9xDtVs5Rlp 4B7ORH3V/k8xzagjtQo2g7nKJczXN+yiem8Uvfp0Ko9Ih+y+1OSjmzVshsjSWEYe8HiAn5+AjIJ
 59XBx/eOtzCDoXzBf4f+p6beBo+e6hYqJEYn3HzRKzUE9LwZtghV0M9AYnBbYYLYT0VzSq4w
X-Proofpoint-GUID: MHe8Whm3TCHJFzDYvoz2bqC6Rwn5i16B
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6810a7a3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=zSzFtzmdY9N6WmU4nJUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290076


On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> Add a condition to skip the flush operation during the first sequence
> change event. At this point, the capture queue is not streaming, making
> the flush unnecessary.
> 
> Additionally, remove the reinit_completion call for the flush completion
> signal, as it is not needed. This simplifies the code and avoids
> unnecessary reinitialization.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index ba858abab336..dfca45d85759 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -201,8 +201,7 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
>  
>  	iris_hfi_gen1_read_changed_params(inst, pkt);
>  
> -	if (inst->state != IRIS_INST_ERROR) {
> -		reinit_completion(&inst->flush_completion);
> +	if (inst->state != IRIS_INST_ERROR && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
>  
>  		flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
>  		flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
> 
>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

