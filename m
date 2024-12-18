Return-Path: <linux-media+bounces-23693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC9E9F63B2
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 11:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECC7B18958AA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 10:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8402519D071;
	Wed, 18 Dec 2024 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IpNeGtCx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54459199249;
	Wed, 18 Dec 2024 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734518759; cv=none; b=oAVUbSGQ5K90Nnof2Am10ZdpyD4LOpXXAEkzyx/cU2k/g00UiX0QVQ4sUHPaGjo04f/putpbLnWXi2ocbbyRRcZiE0BAStMTiHHQvL/BkbZzd13Nr+bvJgK5pPD2Y2ns69eGyZG7HlYRn39GHT8XmdZetRs8Ar0tOPxvDt62vWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734518759; c=relaxed/simple;
	bh=17DqRzC3ahxHha5OUsvTCQjV2Ohu5d5RkBQhEMnR5Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XCMf1XDDwqjS/CRf6BE/zuIHm8tMr/47rWlSrccx2He5r7gvpUvv56KjDadg8LpaI7mnw/9a7huCB4r6tpEE/DwPYIRihMWR3TJr6DuZDTsFKNsFuGQXRZXoTM8fMOFutcbAgOI13c55r/gsPaYJH7OBYCz/iLjiDBl58EL6Nvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IpNeGtCx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI85ccY008842;
	Wed, 18 Dec 2024 10:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0V7UEzvwO654dIPbxLZ971oaNyTjARMHoEHMqO+Lfg=; b=IpNeGtCxJ7O1QEEq
	J3vtSAuAbdbqSXUqaZGFGnlur9uPUho/gXwb5bxqa2RQGvQcxWg2MLPsTYGqzYyQ
	XoS8X+1zHxyERjbPMpjLKm8HMPm9E1iAluzRUUL7xyy7h3XXQxtIHQs02wbgpjHZ
	uG8FyZrW5tklePsfK3qsyVcue9YbsQqtYM+g9cL5DwX5FaXmgIKLQDBR2eiZvZhA
	gS9kVJumuVBpjbwnMfrg/Yy42IUWv420ooNb5FkZstS06f7aVi4Z26pL3MXH8Qry
	GWKlAkq3BloZmlWf+0WQP4x6Mx089LTfCJOxfQPgpYT2naRbKKnP4H2fzhnDK39s
	Y74ypg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ktk2gdqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:45:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIAjqRf008548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:45:52 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 02:45:48 -0800
Message-ID: <ff5777cf-32ba-412b-afa3-72197b31e0bd@quicinc.com>
Date: Wed, 18 Dec 2024 18:45:46 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: venus: Populate video encoder/decoder
 nodename entries
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_vnagar@quicinc.com>, <quic_dikshita@quicinc.com>,
        <konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Stanimir Varbanov
	<stanimir.varbanov@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-2-ef7e5f85f302@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-2-ef7e5f85f302@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fObfBRb6Dz0Q3yiSiOksZsrOLtjTipy_
X-Proofpoint-ORIG-GUID: fObfBRb6Dz0Q3yiSiOksZsrOLtjTipy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180086


On 12/9/2024 7:52 PM, Bryan O'Donoghue wrote:
> Populate encoder and decoder node-name entries for the upstream parts. Once
> done the compat="video-encoder" and compat="video-decoder" in the dtsi can
> be dropped though the venus driver will continue to favour DT declared
> video-encoder/video-decoder declarations over static declarations for
> compatibility.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/core.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 88dfa9f240dc6d18a7f58dc06b1bf10274b7121e..deef391d78770b8ae0f486dd3a3ab44c4ea6a581 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -674,6 +674,8 @@ static const struct venus_resources msm8916_res = {
>   	.vmem_addr = 0,
>   	.dma_mask = 0xddc00000 - 1,
>   	.fwname = "qcom/venus-1.8/venus.mbn",
> +	.dec_nodename = "video-decoder",
> +	.enc_nodename = "video-encoder",
>   };
>   
>   static const struct freq_tbl msm8996_freq_table[] = {
> @@ -883,6 +885,8 @@ static const struct venus_resources sdm845_res_v2 = {
>   	.cp_nonpixel_start = 0x1000000,
>   	.cp_nonpixel_size = 0x24800000,
>   	.fwname = "qcom/venus-5.2/venus.mbn",
> +	.dec_nodename = "video-core0",
> +	.enc_nodename = "video-core1",
>   };
>   
>   static const struct freq_tbl sc7180_freq_table[] = {
> @@ -931,6 +935,8 @@ static const struct venus_resources sc7180_res = {
>   	.cp_nonpixel_start = 0x1000000,
>   	.cp_nonpixel_size = 0x24800000,
>   	.fwname = "qcom/venus-5.4/venus.mbn",
> +	.dec_nodename = "video-decoder",
> +	.enc_nodename = "video-encoder",
>   };
>   
>   static const struct freq_tbl sm8250_freq_table[] = {
> @@ -986,6 +992,8 @@ static const struct venus_resources sm8250_res = {
>   	.vmem_addr = 0,
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu-1.0/venus.mbn",
> +	.dec_nodename = "video-decoder",
> +	.enc_nodename = "video-encoder",
>   };
>   
>   static const struct freq_tbl sc7280_freq_table[] = {
> @@ -1048,6 +1056,8 @@ static const struct venus_resources sc7280_res = {
>   	.cp_nonpixel_start = 0x1000000,
>   	.cp_nonpixel_size = 0x24800000,
>   	.fwname = "qcom/vpu-2.0/venus.mbn",
> +	.dec_nodename = "video-decoder",
> +	.enc_nodename = "video-encoder",
>   };
>   
>   static const struct of_device_id venus_dt_match[] = {
It is working fine on QCS615.
Tested-by: Renjiang Han <quic_renjiang@quicinc.com>

-- 
Best Regards,
Renjiang


