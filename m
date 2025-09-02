Return-Path: <linux-media+bounces-41502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20201B3F48B
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8575F1A841FC
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 05:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9972C21FA;
	Tue,  2 Sep 2025 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="egWT1/Gu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4922DF95;
	Tue,  2 Sep 2025 05:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756791112; cv=none; b=KsQcNXJWmRPVwtOSJc3pTy1fzCN0ftoxV/GbuFGv+sVjUWEo7BR//+/tOxSrS4HdAi6nttEZKW+O3h64jSS8Wpr/DDtg01uVBUg4YdUjm0RdLWABZ33xs5vgqYKBa0F5ESyMN3wkydbsMYVReIGSFxxZ5JPTiOVQalF/AQQW5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756791112; c=relaxed/simple;
	bh=xgjmYzQnPTS0xIn/OCCSCEaAz3gbxJdPOI/8bRZXbj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iaFE8OHSsymT/C8gmu/Yb65FKY1HbGDcwiBxqtZN1cm4ZSQoGBT/XGZ4a4eyw/o9jImeUDlgYKrUO1cZBwqD+0qqJs0pmNuYu2EZEB9RJB0npXhcq9ue1iP/lnUDacKQCJTUrL/G94Rq+ZtMT6NPFWn7IGfrTpwZCF9c1nV42Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=egWT1/Gu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RkZi016270;
	Tue, 2 Sep 2025 05:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhkZem1KJFZH65MgqN0v05Cu7ALio2yvyLPMXllcnTE=; b=egWT1/GuxW4xi13K
	RWfYn9Umakq5eUmVNRouzWV1U81xxOdZxp3qoCN0oQu5Dvn3xGOM2EpjaE8Uywaj
	2oRZi2d3XRehATI+lqLzLF2AAupsKD+a0AKZxFAi/JrYw8zfyaL42tVJ3ngQJ5T6
	MK6sQMue9DsfZspuPvZbie0GcF4X4cJm5dyvR6QZ01E1fX310jBWAUu5F7ff6YxP
	m4kJDepeaEjr1Mks6ktr6GcppDm/2BhAcHywVi1H9w7/untrVWOJcTcM44LG7nmZ
	adYyEU6W16M7jFjM2t+MRmVDHc+ykgX0LZzanjyDQ1J/i1gILb5m+BLGvOJ8/aZR
	JbB1iQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8xetj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 05:31:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5825VhNM032479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 05:31:43 GMT
Received: from [10.216.53.8] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 1 Sep
 2025 22:31:40 -0700
Message-ID: <19f83c54-bff7-5316-1255-f64dbf487c35@quicinc.com>
Date: Tue, 2 Sep 2025 11:01:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] media: iris: add VPU33 specific encoding buffer
 calculation
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250901-topic-sm8x50-iris-encoder-v3-hevc-debug-v2-1-c65406bbdf68@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250901-topic-sm8x50-iris-encoder-v3-hevc-debug-v2-1-c65406bbdf68@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dI88Ujj_36jauaG5yWDX-BaXWNJbBDUq
X-Proofpoint-ORIG-GUID: dI88Ujj_36jauaG5yWDX-BaXWNJbBDUq
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b68140 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=5KdB-QnLsuRpzNL6S04A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX3PLvpK4tJFPQ
 pYs393vguqYSe0u090Wd/dXOH0JH9J1ewMe+Yk0rIFrBw33YXW71sa0ZujBzEl9qupaOn0vlFG6
 M9f7bW1GL+1SMTpZbAVDVDzqI8GFybv5WNav/dYfmMS0tb3a3vKR0ThHDvGXtzFXcqEf5jyG4dj
 xgQFN3i9mx/p30SjaSbkNHTQmbomSmHi9bvPYVq9RLHohRIw2vlVOJtl44DLVyP13PYRkNGTv/G
 Qpu2cQGQN2Pp66M0HN0KMf7lJIqU/7yLG81Zzl/CeWH/d91wz97bXWPJ4G3EC9BQhtf2Wk9GTpF
 cB5ibq/aQmYdW9+Qq75V2yC3GpqJsafoK7WnfCEH22bRok5DKMmmaCdlJs5TtDKpZ1a0zr69mBy
 DepW6jpt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042


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

Pls keep it as vpu33, instead of 33x, as 33 is the variant of 3x. Accordingly at
other places as well in this patch.

Regards,
Vikash

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
>  static inline
>  u32 size_top_line_buf_first_stg_sao(u32 frame_width_coded)
> @@ -977,8 +1005,8 @@ static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
>  }
>  
>  static inline
> -u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
> -			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
> +u32 hfi_buffer_line_enc_base(u32 frame_width, u32 frame_height, bool is_ten_bit,
> +			     u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
>  {
>  	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
>  	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
> @@ -1018,10 +1046,38 @@ u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
>  		line_buff_recon_pix_size +
>  		size_left_linebuff_ctrl_fe(frame_height_coded, num_vpp_pipes_enc) +
>  		size_line_buf_sde(frame_width_coded) +
> -		size_vpss_line_buf(num_vpp_pipes_enc, frame_height_coded, frame_width_coded) +
>  		size_top_line_buf_first_stg_sao(frame_width_coded);
>  }
>  
> +static inline
> +u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
> +			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
> +{
> +	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
> +	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
> +	u32 frame_height_coded = height_in_lcus * (lcu_size);
> +	u32 frame_width_coded = width_in_lcus * (lcu_size);
> +
> +	return hfi_buffer_line_enc_base(frame_width, frame_height, is_ten_bit,
> +					num_vpp_pipes_enc, lcu_size, standard) +
> +		size_vpss_line_buf(num_vpp_pipes_enc, frame_height_coded, frame_width_coded);
> +}
> +
> +static inline
> +u32 hfi_buffer_line_enc_vpu33x(u32 frame_width, u32 frame_height, bool is_ten_bit,
> +			       u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
> +{
> +	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
> +	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
> +	u32 frame_height_coded = height_in_lcus * (lcu_size);
> +	u32 frame_width_coded = width_in_lcus * (lcu_size);
> +
> +	return hfi_buffer_line_enc_base(frame_width, frame_height, is_ten_bit,
> +					num_vpp_pipes_enc, lcu_size, standard) +
> +		size_vpss_line_buf_vpu33x(num_vpp_pipes_enc, frame_height_coded,
> +					  frame_width_coded);
> +}
> +
>  static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
>  {
>  	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> @@ -1040,6 +1096,24 @@ static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
>  				   lcu_size, HFI_CODEC_ENCODE_AVC);
>  }
>  
> +static u32 iris_vpu33x_enc_line_size(struct iris_inst *inst)
> +{
> +	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> +	struct v4l2_format *f = inst->fmt_dst;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +	u32 lcu_size = 16;
> +
> +	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		lcu_size = 32;
> +		return hfi_buffer_line_enc_vpu33x(width, height, 0, num_vpp_pipes,
> +						  lcu_size, HFI_CODEC_ENCODE_HEVC);
> +	}
> +
> +	return hfi_buffer_line_enc_vpu33x(width, height, 0, num_vpp_pipes,
> +					  lcu_size, HFI_CODEC_ENCODE_AVC);
> +}
> +
>  static inline
>  u32 hfi_buffer_dpb_enc(u32 frame_width, u32 frame_height, bool is_ten_bit)
>  {
> @@ -1387,7 +1461,7 @@ struct iris_vpu_buf_type_handle {
>  	u32 (*handle)(struct iris_inst *inst);
>  };
>  
> -int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
> +u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>  {
>  	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
>  	u32 size = 0, buf_type_handle_size = 0, i;
> @@ -1431,6 +1505,34 @@ int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>  	return size;
>  }
>  
> +u32 iris_vpu33x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
> +{
> +	u32 size = 0, i;
> +
> +	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
> +		{BUF_BIN,         iris_vpu_enc_bin_size         },
> +		{BUF_COMV,        iris_vpu_enc_comv_size        },
> +		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size    },
> +		{BUF_LINE,        iris_vpu33x_enc_line_size     },
> +		{BUF_ARP,         iris_vpu_enc_arp_size         },
> +		{BUF_VPSS,        iris_vpu_enc_vpss_size        },
> +		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size    },
> +		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size    },
> +	};
> +
> +	if (inst->domain == DECODER)
> +		return iris_vpu_buf_size(inst, buffer_type);
> +
> +	for (i = 0; i < ARRAY_SIZE(enc_internal_buf_type_handle); i++) {
> +		if (enc_internal_buf_type_handle[i].type == buffer_type) {
> +			size = enc_internal_buf_type_handle[i].handle(inst);
> +			break;
> +		}
> +	}
> +
> +	return size;
> +}
> +
>  static u32 internal_buffer_count(struct iris_inst *inst,
>  				 enum iris_buffer_type buffer_type)
>  {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 94668c5b3d15fb6e10d0b5ed6ed704cadb5a6534..e4fd1fcf2dbf25e69d55599a8fd4ad775f9e6575 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -146,7 +146,8 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
>  	return DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
>  }
>  
> -int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> +u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> +u32 iris_vpu33x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>  
>  #endif
> 
> ---
> base-commit: 58717ecfffd642c1e0950dee4a247dd6cdfeb31e
> change-id: 20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-10173f4838e3
> 
> Best regards,

