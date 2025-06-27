Return-Path: <linux-media+bounces-36097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4AAEB80F
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 14:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5E2564C2D
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 12:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509252D97A6;
	Fri, 27 Jun 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EZ0ROMT1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C004A2D662C;
	Fri, 27 Jun 2025 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028465; cv=none; b=mu/ch9CUsxUXz4/AO5/kSF9qy1ZPQTB1xC2NqTJpzGynuVFjCwlkQV2legORa+toOugyRYqyqRfSOf2XcF2dISXyVKb4DSXGsCrbd/DRarjyt7m0iuKuIw+pq/C0PS+xm7DrJJQkCtRMJviRlpvIUpsT7pE4h/BFF7Fd+K0LPec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028465; c=relaxed/simple;
	bh=03CiaXBPjxHf1g2PBXuaJ8YRlWUYUytHVECh9slDXy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IM1qHZxy2nKNTuhzEagEszHGvjXkoXvF8E4CreFIRJEgaRy/bJOtblDjawsimBB+5ub3G/yh7OvAPuETJEUOlVLZYEwxBORGyXEa3yIPswzBqu2QJ2K+wYFUHlqAoQZ0hjyVj1FhsdScFCRfhkYisdyaaSZl5P2xrDnhI9bqw0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EZ0ROMT1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC82a8009645;
	Fri, 27 Jun 2025 12:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8LuRatp9I2VFN9kiuOdDWJ++aI0KVBV6jTbIJadwlM=; b=EZ0ROMT1Z/2PnUjp
	2MCeaA448C7uet8Idzjsq2sp25bbnwACgtngfs6Zf8OmxzoCcfmVytW8yfHIZBh4
	akWWhEHGuemx+HLRpyMYTDsiN+Va7FQZys02Km0LaL4TUG85Y1r67tDHoIHnSzrZ
	bZ8Kx8ikHseyE2SC7f04OMOzv8sGagUb889IL2ut9CMSoWcXaypx87/36+e6YpOm
	gBm1zdwkKLhwLo6pAi9RXaFrwpX/MDjRt0IK4JUsMpHog7t/J98NFAO/OS/KbrDK
	XPadmIs2Dxco6WF2JEBSpCaHNpd6hOnhGR58vNgyqBe+6SdgTjAeNyaVTTx2jO4X
	/XUOeQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b46scp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:47:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RClchh017306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:47:38 GMT
Received: from [10.50.47.15] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 27 Jun
 2025 05:47:34 -0700
Message-ID: <c0e8460d-1c94-d398-38a0-f63395256f27@quicinc.com>
Date: Fri, 27 Jun 2025 18:17:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/5] media: venus: vdec: AR50_LITE video core support
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, <krzk+dt@kernel.org>,
        <bryan.odonoghue@linaro.org>, <quic_vgarodia@quicinc.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-3-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250626135931.700937-3-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNiBTYWx0ZWRfX1SrHVp/P5fmb
 bsGQ1r5zFA9Zt3PUotXfZk7Uf/3aykQ7DrxzcBV6WbnIotcyOLXedPS+KMutfOQQjNmZ2WCCL2V
 me9gepATycePKs3Gf+xPPzyfOZmz6l9jQl9fbw4O5txxJqJh294rZkF18P7/F48juRhXZjOGI3m
 uriqYqvpOVWuglVgqL0nAkgywr61y/mtS33mBZpMUayZ3vdORNBy4/E3q3Qw/ta5PAatt7S0eVZ
 YftmmGTGUrwOcN/VMzSAKmN0v8Q6QeqIARB8EKk6pw+fkuI+f6r5t28vBHhSfi+hGLhtOf29FK9
 eTqYLPY2oqeEq2Gy04wjtDdw+UsrFjUOndBZ3saBj9L/h8r0vY9sYGqrRRSezNjpIs7kkV2DEQl
 KA48lyl/DzwMvx5hVNkYtbkKoDI+EFni0YfdMk0yCZVD8+cNeGDndg0eQHZcq8DXT40c2fYn
X-Proofpoint-ORIG-GUID: vEfLtBeXkfIf1ki4sHn7yE9cZt05APpL
X-Proofpoint-GUID: vEfLtBeXkfIf1ki4sHn7yE9cZt05APpL
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685e92eb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=213a6-aNNI9jx8tzRgAA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270106



On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> The AR50_LITE is a streamlined variant of the AR50 video core, designed
> for power and cost-efficient platforms.
> 
> It supports hardware-accelerated decoding of H.264, HEVC, and VP9
> formats.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c      | 11 ++-
>  drivers/media/platform/qcom/venus/core.h      | 11 ++-
>  drivers/media/platform/qcom/venus/firmware.c  |  8 +-
>  drivers/media/platform/qcom/venus/helpers.c   | 80 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/helpers.h   |  2 +
>  .../media/platform/qcom/venus/hfi_helper.h    | 10 ++-
>  drivers/media/platform/qcom/venus/hfi_venus.c | 14 ++--
>  .../media/platform/qcom/venus/pm_helpers.c    |  1 +
>  drivers/media/platform/qcom/venus/vdec.c      | 15 ++--
>  9 files changed, 128 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152..736ef53d988d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
>  
>  static void venus_assign_register_offsets(struct venus_core *core)
>  {
> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> -		core->vbif_base = core->base + VBIF_BASE;
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>  		core->cpu_base = core->base + CPU_BASE_V6;
>  		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
>  		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
>  		core->wrapper_base = core->base + WRAPPER_BASE_V6;
>  		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> -		core->aon_base = core->base + AON_BASE_V6;
> +		if (IS_AR50_LITE(core)) {
> +			core->vbif_base = NULL;
> +			core->aon_base = NULL;
> +		} else {
> +			core->vbif_base = core->base + VBIF_BASE;
> +			core->aon_base = core->base + AON_BASE_V6;
> +		}
>  	} else {
>  		core->vbif_base = core->base + VBIF_BASE;
>  		core->cpu_base = core->base + CPU_BASE;
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index b412e0c5515a..e755a28e919b 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -382,6 +382,7 @@ enum venus_inst_modes {
>   * @lock:	instance lock
>   * @core:	a reference to the core struct
>   * @clk_data:	clock data per core ID
> + * @eosbufs:	a lit of EOS buffers
>   * @dpbbufs:	a list of decoded picture buffers
>   * @internalbufs:	a list of internal bufferes
>   * @registeredbufs:	a list of registered capture bufferes
> @@ -450,6 +451,7 @@ struct venus_inst {
>  	struct mutex lock;
>  	struct venus_core *core;
>  	struct clock_data clk_data;
> +	struct list_head eosbufs;
>  	struct list_head dpbbufs;
>  	struct list_head internalbufs;
>  	struct list_head registeredbufs;
> @@ -520,7 +522,14 @@ struct venus_inst {
>  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
>  #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
>  #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
> -#define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
> +static inline bool IS_V6(struct venus_core *core)
> +{
> +	if (WARN_ON_ONCE(!core))
> +		return false;
> +
> +	return core->res->hfi_version == HFI_VERSION_6XX ||
> +	       core->res->hfi_version == HFI_VERSION_6XX_LITE;
> +}
It should be HFI_VERSION_4XX_LITE for AR50_LITE. 4XX represents SC7280 and
SDM845 which are AR50.
>  
>  #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
>  #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 66a18830e66d..f8dcef0426ac 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
>  	u32 fw_size = core->fw.mapped_mem_size;
>  	void __iomem *wrapper_base;
>  
> -	if (IS_IRIS2_1(core))
> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
>  		wrapper_base = core->wrapper_tz_base;
>  	else
>  		wrapper_base = core->wrapper_base;
> @@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
>  	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
>  
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>  		/* Bring XTSS out of reset */
>  		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
>  	} else {
> @@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	if (resume) {
>  		venus_reset_cpu(core);
>  	} else {
> -		if (IS_IRIS2_1(core))
> +		if (IS_IRIS2_1(core) || IS_AR50_LITE(core))
>  			writel(WRAPPER_XTSS_SW_RESET_BIT,
>  			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
>  		else
> @@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>  	void __iomem *wrapper_base = core->wrapper_base;
>  	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
>  
> -	if (IS_IRIS2_1(core)) {
> +	if (IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>  		/* Assert the reset to XTSS */
>  		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
No need to handle no-tz case. Pls drop.
>  		reg |= WRAPPER_XTSS_SW_RESET_BIT;
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 8295542e1a7c..812bec9a05be 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -230,6 +230,79 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
>  }
>  EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
>  
> +static void free_eos_buf(struct venus_inst *inst, struct intbuf *buf)
> +{
> +	list_del_init(&buf->list);
> +	dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
> +		       buf->attrs);
> +	kfree(buf);
> +}
> +
> +int venus_helper_free_eos_bufs(struct venus_inst *inst)
> +{
> +	struct intbuf *buf, *n;
> +
> +	list_for_each_entry_safe(buf, n, &inst->eosbufs, list) {
> +		free_eos_buf(inst, buf);
> +	}
> +
> +	if (list_empty(&inst->eosbufs))
> +		INIT_LIST_HEAD(&inst->eosbufs);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(venus_helper_free_eos_bufs);
> +
> +int venus_helper_alloc_eos_buf(struct venus_inst *inst,
> +			       struct hfi_frame_data *data)
> +{
> +	struct venus_core *core = inst->core;
> +	struct device *dev = core->dev;
> +	struct intbuf *buf;
> +	int ret = 0;
> +
> +	memset(data, 0, sizeof(*data));
> +
> +	data->buffer_type = HFI_BUFFER_INPUT;
> +	data->flags = HFI_BUFFERFLAG_EOS;
> +
> +	if (IS_AR50_LITE(inst->core)) {
> +		/* We must send valid sizes and addresses */
> +		buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +		if (!buf) {
> +			ret = -ENOMEM;
> +			goto fail;
> +		}
> +
> +		buf->type = HFI_BUFFER_INPUT;
> +		buf->size = SZ_4K;
> +		buf->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> +		buf->va = dma_alloc_attrs(dev, buf->size, &buf->da, GFP_KERNEL,
> +					  buf->attrs);
> +		if (!buf->va) {
> +			ret = -ENOMEM;
> +			goto fail;
> +		}
> +
> +		list_add_tail(&buf->list, &inst->eosbufs);
> +
> +		data->alloc_len = buf->size;
> +		data->device_addr = buf->da;
> +
why this special handling for eos buffer is needed for AR50_LITE?
> +	} else if (IS_V6(inst->core) &&
> +		   is_fw_rev_or_older(inst->core, 1, 0, 87)) {
> +		data->device_addr = 0;
> +	} else {
> +		data->device_addr = 0xdeadb000;
> +	}
> +
> +	return 0;
> +fail:
> +	kfree(buf);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(venus_helper_alloc_eos_buf);
> +
>  static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
>  {
>  	struct venus_core *core = inst->core;
> @@ -630,6 +703,13 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
>  	if (!hfi_plat || !hfi_plat->bufreq)
>  		return -EINVAL;
>  
> +	/* Firmware buffer requirements for internal buffers only */
> +	if (IS_AR50_LITE(inst->core))
> +		if (buftype != HFI_BUFFER_INPUT &&
> +		    buftype != HFI_BUFFER_OUTPUT &&
> +		    buftype != HFI_BUFFER_OUTPUT2)
> +			return -EINVAL;
> +
why this check is needed here? Buffer requirements for all buffer types
should come from firmware for all V4 based targets.
>  	params.version = version;
>  	params.num_vpp_pipes = inst->core->res->num_vpp_pipes;
>  
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index 358e4f39c9c0..bf55fe3b8747 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
>  bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
>  int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
>  int venus_helper_free_dpb_bufs(struct venus_inst *inst);
> +int venus_helper_alloc_eos_buf(struct venus_inst *inst, struct hfi_frame_data *data);
> +int venus_helper_free_eos_bufs(struct venus_inst *inst);
>  int venus_helper_intbufs_alloc(struct venus_inst *inst);
>  int venus_helper_intbufs_free(struct venus_inst *inst);
>  int venus_helper_intbufs_realloc(struct venus_inst *inst);
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index f44059f19505..128ddf8e3cd5 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -397,13 +397,16 @@
>  #define HFI_BUFFER_INTERNAL_PERSIST_1		0x5
>  #define HFI_BUFFER_INTERNAL_SCRATCH(ver)	\
>  	(((ver) == HFI_VERSION_4XX ||		\
> -	(ver) == HFI_VERSION_6XX) ? 0x6 : 0x1000001)
> +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> +	? 0x6 : 0x1000001)
>  #define HFI_BUFFER_INTERNAL_SCRATCH_1(ver)	\
>  	(((ver) == HFI_VERSION_4XX ||		\
> -	(ver) == HFI_VERSION_6XX) ? 0x7 : 0x1000005)
> +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> +	? 0x7 : 0x1000005)
>  #define HFI_BUFFER_INTERNAL_SCRATCH_2(ver)	\
>  	(((ver) == HFI_VERSION_4XX ||		\
> -	(ver) == HFI_VERSION_6XX) ? 0x8 : 0x1000006)
> +	(ver) == HFI_VERSION_6XX || (ver) == HFI_VERSION_6XX_LITE) \
> +	? 0x8 : 0x1000006)
>  #define HFI_BUFFER_EXTRADATA_INPUT(ver)		\
>  	(((ver) == HFI_VERSION_4XX) ? 0xc : 0x1000002)
>  #define HFI_BUFFER_EXTRADATA_OUTPUT(ver)	\
> @@ -561,6 +564,7 @@ enum hfi_version {
>  	HFI_VERSION_3XX,
>  	HFI_VERSION_4XX,
>  	HFI_VERSION_6XX,
> +	HFI_VERSION_6XX_LITE,
s/HFI_VERSION_6XX_LITE/HFI_VERSION_4XX_LITE.
update all applicable places.
>  };
>  
>  struct hfi_buffer_info {
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea879950..302776bf8fe6 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -497,7 +497,7 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
>  	if (count >= max_tries)
>  		ret = -ETIMEDOUT;
>  
> -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
>  		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
>  		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
CPU_CS_X2RPMH_V6 is not needed for AR50_LITE, pls drop.
>  	}
> @@ -565,6 +565,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
>  	u32 mask_val;
>  	int ret;
>  
> +	if (IS_AR50_LITE(hdev->core))
> +		return 0;
> +
>  	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
>  		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
>  
> @@ -1134,7 +1137,8 @@ static irqreturn_t venus_isr(struct venus_core *core)
>  	wrapper_base = hdev->core->wrapper_base;
>  
>  	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> +
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>  		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
>  		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
WD mask is incorrect, pls fix.
>  		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
> @@ -1146,7 +1150,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
>  			hdev->irq_status = status;
>  	}
>  	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
> -	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
> +	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
>  		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
>  
>  	return IRQ_WAKE_THREAD;
> @@ -1531,7 +1535,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
>  	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
>  	u32 ctrl_status, cpu_status;
>  
> -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
>  		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
>  	else
>  		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> @@ -1551,7 +1555,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
>  	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
>  	u32 ctrl_status, cpu_status;
>  
> -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
>  		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
>  	else
>  		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 409aa9bd0b5d..5d9dfe3fd043 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -1168,6 +1168,7 @@ const struct venus_pm_ops *venus_pm_get(enum hfi_version version)
>  		return &pm_ops_v3;
>  	case HFI_VERSION_4XX:
>  	case HFI_VERSION_6XX:
> +	case HFI_VERSION_6XX_LITE:
s/HFI_VERSION_6XX_LITE/HFI_VERSION_4XX_LITE

Thanks,
Dikshita
>  		return &pm_ops_v4;
>  	}
>  
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 99ce5fd41577..87c7901b280e 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -550,7 +550,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>  {
>  	struct venus_inst *inst = to_inst(file);
>  	struct vb2_queue *dst_vq;
> -	struct hfi_frame_data fdata = {0};
> +	struct hfi_frame_data fdata;
>  	int ret;
>  
>  	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
> @@ -561,18 +561,15 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>  
>  	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
>  		/*
> -		 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on
> +		 * Implement V4L2_DEC_CMD_STOP by enqueue a buffer on
>  		 * decoder input to signal EOS.
>  		 */
>  		if (!(inst->streamon_out && inst->streamon_cap))
>  			goto unlock;
>  
> -		fdata.buffer_type = HFI_BUFFER_INPUT;
> -		fdata.flags |= HFI_BUFFERFLAG_EOS;
> -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> -			fdata.device_addr = 0;
> -		else
> -			fdata.device_addr = 0xdeadb000;
> +		ret = venus_helper_alloc_eos_buf(inst, &fdata);
> +		if (ret)
> +			goto unlock;
>  
>  		ret = hfi_session_process_buf(inst, &fdata);
>  
> @@ -1332,6 +1329,7 @@ static void vdec_session_release(struct venus_inst *inst)
>  		hfi_session_abort(inst);
>  
>  	venus_helper_free_dpb_bufs(inst);
> +	venus_helper_free_eos_bufs(inst);
>  	venus_pm_load_scale(inst);
>  	INIT_LIST_HEAD(&inst->registeredbufs);
>  	mutex_unlock(&inst->lock);
> @@ -1682,6 +1680,7 @@ static int vdec_open(struct file *file)
>  	if (!inst)
>  		return -ENOMEM;
>  
> +	INIT_LIST_HEAD(&inst->eosbufs);
>  	INIT_LIST_HEAD(&inst->dpbbufs);
>  	INIT_LIST_HEAD(&inst->registeredbufs);
>  	INIT_LIST_HEAD(&inst->internalbufs);

