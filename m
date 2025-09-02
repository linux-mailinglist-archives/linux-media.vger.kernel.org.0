Return-Path: <linux-media+bounces-41503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED9FB3F4A6
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FBC1200149
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 05:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6455D2E1722;
	Tue,  2 Sep 2025 05:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Py1EMFBI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D731E5B71;
	Tue,  2 Sep 2025 05:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756791638; cv=none; b=sUd6k/zQo4m4pejpkkBaDy/Rgk58g9fpztazULUAZHRzn8nR9mT+gh8CTbKuT0TaWkU7sSp5bRMODiafZu9KzZ5JgsdALXRQckK4AadhlyDSSzozGi0vq3bouOZVe1JHtfPZ/zxDFLhfOAmPzCd+vStQueyPIlqJfMcONJlC39U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756791638; c=relaxed/simple;
	bh=8L/Au7EKsJO+Gp08UyaX8+IsjCJv+n0JefJzvEt54ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GcbXSypK/nZ7xdD8jY57yB/h9hQhqINpNJk54jfg+9ciSfQ2imNfYEEFjmIh6ZNjALUlt/H+ysMv+z4hRmuevty4mrNRI+oppprnWukZ6+9s4sg25O+zTYAjh5Enmxyb2H+Gg3BpjZfjG5Op6AS6goFEfrxiWUL8y+1+x9VK2Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Py1EMFBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822X5wT031520;
	Tue, 2 Sep 2025 05:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBpXF1MufAPVG15/FkjLF2YODM6Aes5ifFG11WMoVlw=; b=Py1EMFBItKhiDGfr
	hmDcWe/i6AyuV1w2kWChcAxVNvKOQqzDgpoEt4FqN/QmuZmJYQkl057Ox/XZIGiy
	y+HvC/z9jpcEGmotmsVu3rOGbNVUL8jt5YOyztTSKur3cPO4+6XiQzYj2KtHLBbN
	Y0YC3xAXA6RONZkTKdudhPaVjJwvz2lBb+gnjA71HbiCCKYFBWlJ2DXWMCtyylrR
	uEcufOlQQ8Y86sUAluMeiD0nFdPiS1vBBn5UUrTx6zNBWLI5t4zUMoW/WacaOKJS
	w+dxsJKaSWrPivz0Jbrf3kbzQaNiaeg2bmR1mIDU0WHUAOkUJrrze14QsQoxi5gz
	sWwddA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw8cba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 05:40:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5825eUph024652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 05:40:30 GMT
Received: from [10.50.35.121] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 1 Sep
 2025 22:40:27 -0700
Message-ID: <a9e5271b-104b-b7b6-2c85-04d40c735a73@quicinc.com>
Date: Tue, 2 Sep 2025 11:10:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] media: iris: add VPU33 specific encoding buffer
 calculation
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250901-topic-sm8x50-iris-encoder-v3-hevc-debug-v2-1-c65406bbdf68@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250901-topic-sm8x50-iris-encoder-v3-hevc-debug-v2-1-c65406bbdf68@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfXwOVsbQYyvMYk
 wjedqn8Cv9bZj70YGjbePXqDXo808IIfVAinTXtLLrk1tdPQsD1g2bejC7KMkJlqcvQHxskSEDS
 AFba3OPnWp+ab6b8jkYF+7lxv2FWEQp2kHhVv17WzlKow+lFRjgwFSeqLkc6arQQ7dlaPQLbQrR
 V5gFwXiim5dKYlG3jrqLrrEirEFaAK5Q+YLwpC6Svq7sTdqT3vvD8ojld+Nlq6floWCQli/x8AB
 D2RE2Ur6rvU5y2pQNDLZ68VaIU/BXHlOf66DOWtv9xIGtPgDKcA7l8agqXmLwkf5mL5fA+WNtvb
 KzyNY8TcTtGJzxfjaYvxWLp9BxZbo/3FuWNf985BX8qV474HYeTm0rSM/bvi7t3LQK9oDpznvrs
 Oe0A7aDF
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b6834f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=y7uNAMEtOC7jsks-VgYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ws4nbiRIslxXFi2b_29mStyG4gPMAiE6
X-Proofpoint-ORIG-GUID: ws4nbiRIslxXFi2b_29mStyG4gPMAiE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024



On 9/1/2025 1:25 PM, Neil Armstrong wrote:
> The VPU33 found in the SM8650 Platform requires some slighly different
> buffer calculation for encoding to allow working with the latest
> firwware uploaded on linux-firmware at [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=ece445af91bbee49bf0d8b23c2b99b596ae6eac7
> 
> Suggested-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> [2] https://lore.kernel.org/all/20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com/
> ---
> Changes in v2:
> - Removed calculation fix for hevc encoding, as it was added in common code
> - Link to v1: https://lore.kernel.org/r/20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-v1-1-633d904ff7d3@linaro.org
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |   4 +
>  .../platform/qcom/iris/iris_platform_sm8250.c      |   2 +
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 110 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   3 +-
>  7 files changed, 118 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 8891a297d384b018b3cc8313ad6416db6317798b..c0900038e7defccf7de3cb60e17c71e36a0e8ead 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -284,7 +284,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
>  {
>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>  
> -	buffers->size = iris_vpu_buf_size(inst, buffer_type);
> +	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
>  	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>  }
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 29cf392ca2566da286ea3e928ce4a22c2e970cc8..e1788c266bb1080921f17248fd5ee60156b3143d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -911,7 +911,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
>  
>  	if (iris_split_mode_enabled(inst)) {
>  		bufsz.type = HFI_BUFFER_OUTPUT;
> -		bufsz.size = iris_vpu_buf_size(inst, BUF_DPB);
> +		bufsz.size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, BUF_DPB);
>  
>  		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
>  		if (ret)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 96fa7b1bb592441e85664da408ea4ba42c9a15b5..7057c4cd1a9ebefa02c855014e5f19993da58e38 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -7,6 +7,7 @@
>  #define __IRIS_PLATFORM_COMMON_H__
>  
>  #include <linux/bits.h>
> +#include "iris_buffer.h"
>  
>  struct iris_core;
>  struct iris_inst;
> @@ -189,6 +190,7 @@ struct iris_platform_data {
>  	void (*init_hfi_command_ops)(struct iris_core *core);
>  	void (*init_hfi_response_ops)(struct iris_core *core);
>  	struct iris_inst *(*get_instance)(void);
> +	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  	const struct vpu_ops *vpu_ops;
>  	void (*set_preset_registers)(struct iris_core *core);
>  	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index cf4b92f534b272a0a1ac2a0e7bb9316501374332..78a04e76de7c00703b84bd3c1c6e9a884ee7cebe 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -8,6 +8,7 @@
>  #include "iris_hfi_gen2.h"
>  #include "iris_hfi_gen2_defines.h"
>  #include "iris_platform_common.h"
> +#include "iris_vpu_buffer.h"
>  #include "iris_vpu_common.h"
>  
>  #include "iris_platform_qcs8300.h"
> @@ -738,6 +739,7 @@ struct iris_platform_data sm8550_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.set_preset_registers = iris_set_sm8550_preset_registers,
>  	.icc_tbl = sm8550_icc_table,
> @@ -827,6 +829,7 @@ struct iris_platform_data sm8650_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu33x_buf_size,
>  	.vpu_ops = &iris_vpu33_ops,
>  	.set_preset_registers = iris_set_sm8550_preset_registers,
>  	.icc_tbl = sm8550_icc_table,
> @@ -916,6 +919,7 @@ struct iris_platform_data qcs8300_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>  	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.set_preset_registers = iris_set_sm8550_preset_registers,
>  	.icc_tbl = sm8550_icc_table,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 978d0130d43b5f6febb65430a9bbe3932e8f24df..16486284f8acccf6a95a27f6003e885226e28f4d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -9,6 +9,7 @@
>  #include "iris_resources.h"
>  #include "iris_hfi_gen1.h"
>  #include "iris_hfi_gen1_defines.h"
> +#include "iris_vpu_buffer.h"
>  #include "iris_vpu_common.h"
>  
>  #define BITRATE_MIN		32000
> @@ -317,6 +318,7 @@ struct iris_platform_data sm8250_data = {
>  	.get_instance = iris_hfi_gen1_get_instance,
>  	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>  	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.set_preset_registers = iris_set_sm8250_preset_registers,
>  	.icc_tbl = sm8250_icc_table,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 34a9094201ccd11d30a776f284ede8248d8017a9..9cb7701722c3644ef4c369fa58490ac83258ea7e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -867,6 +867,34 @@ u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>  		      (((((max_t(u32, (frame_width_coded),
>  				 (frame_height_coded)) + 3) >> 2) << 5) + 256) * 16)), 256);
>  }
> +static inline
> +u32 size_vpss_line_buf_vpu33x(u32 num_vpp_pipes_enc, u32 frame_height_coded,
> +			      u32 frame_width_coded)
> +{
> +	u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0;
> +	u32 vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0;
> +	u32 size_left = 0, size_top = 0;
> +
> +	vpss_4tap_top = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
> +	vpss_4tap_top >>= 2;
> +	vpss_4tap_top <<= 4;
> +	vpss_4tap_top += 256;

Would it be better if combined?
vpss_4tap_top = ((((max(frame_width_coded, frame_height_coded) * 2) + 3) >>
2) << 4) + 256;

Thanks,
Dikshita

> +	vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
> +	vpss_div2_top = max_t(u32, frame_width_coded, frame_height_coded) + 3;
> +	vpss_div2_top >>= 2;
> +	vpss_div2_top <<= 4;
> +	vpss_div2_top += 256;
> +	vpss_div2_left = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
> +	vpss_div2_left >>= 2;
> +	vpss_div2_left <<= 5;
> +	vpss_div2_left += 64;
> +	vpss_top_lb = (frame_width_coded + 1) << 3;
> +	vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
> +	size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
> +	size_top = (vpss_4tap_top + vpss_div2_top) * 2;
> +
> +	return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb, DMA_ALIGNMENT);
> +}
>  

