Return-Path: <linux-media+bounces-29730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ECAA82223
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B76D41BA4D5A
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D852F25DB13;
	Wed,  9 Apr 2025 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KQJeHNQR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6062248B8;
	Wed,  9 Apr 2025 10:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194678; cv=none; b=JSFWe7qVJPF1dyH8c/Z83uoXxYIIWkxzPcav8pW8nJdZTNt43nW1+Jnxjefgsnw/R+HCg2yAu+zFxap972qab6V7x7T9mnuSBXcP3AGLF/+PjIm2iXI+AT8iC8+EDzYkkmoOzINZyQpwOnmWpxswNSu5vOi7cVnJI+vmirF1vPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194678; c=relaxed/simple;
	bh=ZmnnNKPrzuiYuW3i7a9kKVexFSeeKK3P4O6fu9PWHKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r7Jlss9outTKHvhzE8bWyRIlHw3l8ZQ2vS7D4orifykKPliz5riQSxlUC15s2GMDaUFGyuaVcx0u0KLgQ1+B6nHYtZU/mlXmoAK/lATP2i2FEFyY85nVDbXWS3HS8jKAzM6luOgxX5hCLstM7X6g4FACs7mAlAERlKPM51UKQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KQJeHNQR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398AlK1027501;
	Wed, 9 Apr 2025 10:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1N1PLxK6fPILave/3Q2dBZNQWAtsMgPgHNSiOxWQys=; b=KQJeHNQRUZwJxKw5
	wmbAaiCWk56QTCQFmYOosuu9XOSvzZDm4lpe7WQTxhWFegdMZeACj3SCuA4kUgHc
	O7+K+EL+iJBaN8LIq7wx8OBZj+NrrGnPry4rPeTEzzepKxkJjurzT0cEViOh9LXy
	XrSUVbFjSBISkEEdFSCnFjW4qvVKWyJwk0rGlCCJ5ZAdczn8+OgRwQFYth/Q/9+v
	JQAP/VSAyWcce/MH5NCdlzEEBWmSLbLobcT1xu55MHdTs0d0DDZFZuZcaiN4Q0jf
	ZIqdf3dlddTp//SBSAnSePDGi/SWLFa3PBkt0KxrMfETjgw0L8wNI/X5UruF8/w1
	uFzF7A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrk3bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 10:31:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539AV6x5024760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 10:31:06 GMT
Received: from [10.50.45.73] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 03:31:02 -0700
Message-ID: <a4c6afb5-1edc-4fb1-98fe-8f4e50e3c8ef@quicinc.com>
Date: Wed, 9 Apr 2025 16:00:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/5] media: platform: qcom/iris: add
 power_off_controller to vpu_ops
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
 <20250407-topic-sm8x50-iris-v10-v3-2-63569f6d04aa@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-2-63569f6d04aa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Wun_gYVspRoeCnGjGTULg19aZSOwQr7w
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f64c6b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=tiq6G2YW-mO17P-vupoA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Wun_gYVspRoeCnGjGTULg19aZSOwQr7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090058



On 4/7/2025 8:54 PM, Neil Armstrong wrote:
> In order to support the SM8650 iris33 hardware, we need to provide a
> specific constoller power off sequences via the vpu_ops callbacks.
Just a nit: s/constoller/controller
> 
> Add the callback, and use the current helper for currently supported
> platforms.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
>  drivers/media/platform/qcom/iris/iris_vpu3.c       | 1 +
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
>  drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
>  4 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..7cf1bfc352d34b897451061b5c14fbe90276433d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -34,5 +34,6 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>  
>  const struct vpu_ops iris_vpu2_ops = {
>  	.power_off_hw = iris_vpu_power_off_hw,
> +	.power_off_controller = iris_vpu_power_off_controller,
>  	.calc_freq = iris_vpu2_calc_freq,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
> index b484638e6105a69319232f667ee7ae95e3853698..13dab61427b8bd0491b69a9bc5f5144d27d17362 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
> @@ -118,5 +118,6 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
>  
>  const struct vpu_ops iris_vpu3_ops = {
>  	.power_off_hw = iris_vpu3_power_off_hardware,
> +	.power_off_controller = iris_vpu_power_off_controller,
>  	.calc_freq = iris_vpu3_calculate_frequency,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..268e45acaa7c0e3fe237123c62f0133d9dface14 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>  	return -EAGAIN;
>  }
>  
> -static int iris_vpu_power_off_controller(struct iris_core *core)
> +int iris_vpu_power_off_controller(struct iris_core *core)
>  {
>  	u32 val = 0;
>  	int ret;
> @@ -264,7 +264,7 @@ void iris_vpu_power_off(struct iris_core *core)
>  {
>  	dev_pm_opp_set_rate(core->dev, 0);
>  	core->iris_platform_data->vpu_ops->power_off_hw(core);
> -	iris_vpu_power_off_controller(core);
> +	core->iris_platform_data->vpu_ops->power_off_controller(core);
>  	iris_unset_icc_bw(core);
>  
>  	if (!iris_vpu_watchdog(core, core->intr_status))
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 63fa1fa5a4989e48aebdb6c7619c140000c0b44c..f8965661c602f990d5a7057565f79df4112d097e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
>  
>  struct vpu_ops {
>  	void (*power_off_hw)(struct iris_core *core);
> +	int (*power_off_controller)(struct iris_core *core);
>  	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>  };
>  
> @@ -22,6 +23,7 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
>  int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>  int iris_vpu_prepare_pc(struct iris_core *core);
>  int iris_vpu_power_on(struct iris_core *core);
> +int iris_vpu_power_off_controller(struct iris_core *core);
>  void iris_vpu_power_off_hw(struct iris_core *core);
>  void iris_vpu_power_off(struct iris_core *core);
>  
> 
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

