Return-Path: <linux-media+bounces-12336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCCA8D601D
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 13:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E4F11C232FE
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 11:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0A5156F46;
	Fri, 31 May 2024 11:00:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C9156980;
	Fri, 31 May 2024 11:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717153204; cv=none; b=TZo2evtPmyyJ/y1bed3kviyPcNLK9BQhPHlO6TrxC9JqMIjwXev4eOWxxraF3TIXSr6cDDoF+1taUmxwVNoDY3RDGNzuNWvy6LUC/dEhFqzQfreKiVyfG/owiBX+FJSGODbmPVKhVMrK7C90vThN1n/qcjc94N/Jhh4aWS668X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717153204; c=relaxed/simple;
	bh=s+gECQtJy94RMybFqok+gv8BllRla9j5zHsGFKwbgLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdvMUGKgPrKtuoQjGduHSz4nft3dCKSZdru7tNWnDIG2YvpKBfHqgccsUeEAry5lM093OaMs5tq2rbU96/kdk7bd30+l1jeJdUdhRIAciOx2+c5bz3MhmNjU1fPpAGQFk2eERovvjf10lOpyxbkH2nypxOXP5wottE3TgmB3fC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA795C116B1;
	Fri, 31 May 2024 11:00:01 +0000 (UTC)
Message-ID: <72bf0aef-e9a1-416c-a537-61892fb8dfa3@xs4all.nl>
Date: Fri, 31 May 2024 13:00:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] media: platform: visconti: add streaming
 interface for ISP parameters and status
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240424024215.1624299-1-yuji2.ishikawa@toshiba.co.jp>
 <20240424024215.1624299-5-yuji2.ishikawa@toshiba.co.jp>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240424024215.1624299-5-yuji2.ishikawa@toshiba.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yuji,

Some small comments:

On 24/04/2024 04:42, Yuji Ishikawa wrote:
> Add support to Image Signal Processors of Visconti's Video Input Interface.
> This patch adds two streaming interfaces;
> one for passing parameters to the signal processor,
> the other for receiving status.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---
> Changelog v2:
> - Resend v1 because a patch exceeds size limit.
> 
> Changelog v3:
> - Adapted to media control framework
> - Introduced ISP subdevice, capture device
> - Remove private IOCTLs and add vendor specific V4L2 controls
> - Change function name avoiding camelcase and uppercase letters
> 
> Changelog v4:
> - Split patches because the v3 patch exceeds size limit
> - Stop using ID number to identify driver instance:
>   - Use dynamically allocated structure to hold HW specific context,
>     instead of static one.
>   - Call HW layer functions with the context structure instead of ID number
> 
> Changelog v5:
> - no change
> 
> Changelog v6:
> - remove unused macros
> - removed hwd_ and HWD_ prefix
> - update source code documentation
> - Suggestion from Hans Verkuil
>   - pointer to userland memory is removed from uAPI arguments
>     - style of structure is now "nested" instead of "chained by pointer";
>   - use div64_u64 for 64bit division
>   - vendor specific controls support TRY_EXT_CTRLS
>   - add READ_ONLY flag to GET_CALIBRATION_STATUS control and similar ones
>   - human friendry control names for vendor specific controls
>   - add initial value to each vendor specific control
>   - GET_LAST_CAPTURE_STATUS control is updated asyncnously from workqueue
>   - remove EXECUTE_ON_WRITE flag of vendor specific control
>   - uAPI: return value of GET_CALIBRATION_STATUS follows common rules of error codes
>   - applied v4l2-compliance
> - Suggestion from Sakari Ailus
>   - use div64_u64 for 64bit division
>   - update copyright's year
>   - remove redandunt cast
>   - use bool instead of HWD_VIIF_ENABLE/DISABLE
>   - simplify comparison to 0
>   - simplify statements with trigram operator
>   - remove redundant local variables
>   - use general integer types instead of u32/s32
> - Suggestion from Laurent Pinchart
>   - moved VIIF driver to driver/platform/toshiba/visconti
>   - change register access: struct-style to macro-style
>   - remove unused type definitions
>   - define enums instead of successive macro constants
>   - remove redundant parenthesis of macro constant
>   - embed struct hwd_res into struct viif_device
>   - use xxx_dma instead of xxx_paddr for variable names of IOVA
>   - literal value: just 0 instead of 0x0
>   - use literal 1 or 0 instead of HWD_VIIF_ENABLE, DISABLE for register access
>   - use true or false instead of HWD_VIIF_ENABLE, DISABLE for function calls
>   - uAPI: return value of GET_CALIBRATION_STATUS follows common rules of error codes
> 
> Changelog v7:
> - remove unused variables
> - split long statements which have multiple logical-OR and trigram operators
> 
> Changelog v8:
> - define constant V4L2_CTRL_TYPE_VISCONTI_ISP for datatype
>   of Visconti specific controls
> - Suggestion from Hans Verkuil
>   - remove pr_info()
>   - use pm_runtime_get_if_in_use() to get power status
> 
> Changelog v9:
> - fix warning for cast between ptr and dma_addr_t
> 
> Changelog v10:
> - use parameter buffer instead of vendor specific compound controls
>   - add viif_params interface for passing ISP parameters
>   - add viif_stats interface for passing ISP status
> - remove parameter validation routine; moved to userland library
> 
>  .../media/platform/toshiba/visconti/Makefile  |    2 +-
>  .../media/platform/toshiba/visconti/viif.c    |   28 +-
>  .../platform/toshiba/visconti/viif_isp.c      |    7 +
>  .../platform/toshiba/visconti/viif_params.c   | 2026 +++++++++++++++++
>  .../platform/toshiba/visconti/viif_params.h   |   19 +
>  .../platform/toshiba/visconti/viif_stats.c    |  334 +++
>  .../platform/toshiba/visconti/viif_stats.h    |   14 +
>  7 files changed, 2427 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.c
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.h
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.c
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.h
> 

<snip>

> diff --git a/drivers/media/platform/toshiba/visconti/viif_params.c b/drivers/media/platform/toshiba/visconti/viif_params.c
> new file mode 100644
> index 0000000000..5170d371c2
> --- /dev/null
> +++ b/drivers/media/platform/toshiba/visconti/viif_params.c
> @@ -0,0 +1,2026 @@

<snip>

> +static const struct viif_l1_hdrc_config
> +	defval_l1_set_hdrc = { .enable = 1,
> +			       .param = {
> +				       .hdrc_ratio = 0x0E + VIIF_L1_HDRC_RATIO_OFFSET,
> +				       .hdrc_pt_ratio = 7,
> +				       .hdrc_pt_sat = 0xFFC0,
> +				       .hdrc_tn_type = 1,
> +			       } };

Strange layout, can you write this like almost all other structs?

static const struct viif_l1_hdrc_config defval_l1_set_hdrc = {
	.enable = 1,
        .param = {
	       .hdrc_ratio = 0x0E + VIIF_L1_HDRC_RATIO_OFFSET,
	       .hdrc_pt_ratio = 7,
	       .hdrc_pt_sat = 0xFFC0,
	       .hdrc_tn_type = 1,
	}
};

> +
> +static const struct viif_l1_hdrc_ltm_config defval_l1_set_hdrc_ltm = {
> +	.tnp_max = 0x3FFFFF,
> +	.tnp_mag = 0x40,
> +	.tnp_fil = { 0x88, 0x84, 0x7A, 0x6A, 0x54 },
> +};
> +
> +static const struct viif_l1_gamma_config defval_l1_set_gamma = {
> +	.enable = 1,
> +	.param = {
> +		.gam_p = {
> +			0x02F, 0x01B, 0x02A, 0x023, 0x020, 0x037, 0x031, 0x057, 0x04D, 0x088,
> +			0x078, 0x0D6, 0x0BD, 0x14F, 0x12A, 0x20D, 0x1D3, 0x1AB, 0x18D, 0x2DC,
> +			0x29E, 0x271, 0x47C, 0x41B, 0x3D4, 0x70A, 0x672, 0x601, 0xB0C, 0xA1D,
> +			0x96C, 0x8E2, 0x874, 0xFDD, 0xEC9, 0xDF2, 0xD42, 0xCB1, 0xC35, 0xBC9,
> +			0xB6A, 0xB16, 0xACB, 0xA86},
> +		.blkadj = 0x1000,
> +	},
> +};
> +
> +static const struct viif_l1_img_quality_adjustment_config defval_l1_set_img_quality_adjustment = {
> +	.enable = 0,
> +	.coef_cb = 0x9078,
> +	.coef_cr = 0xB699,
> +	.brightness = 0,
> +	.linear_contrast = 128,
> +};
> +
> +static const struct viif_l1_avg_lum_generation_config defval_l1_set_avg_lum_generation = {
> +	.enable = 0
> +};
> +
> +static const struct viif_l2_undist_config defval_l2_set_undist = { .param = {
> +									   .through_mode = 1,
> +									   .roi_mode = { 0, 0 },
> +									   .grid_node_num_h = 0x10,
> +									   .grid_node_num_v = 0x10,
> +								   } };

Another weird layout.

> +
> +static const struct viif_l2_roi_config defval_l2_set_roi = {
> +	.roi_num = 1,
> +	.roi_scale = { 65536, 65536 },
> +	.roi_scale_inv = { 65536, 65536 },
> +	.corrected_wo_scale_hsize = { 0x80, 0x80 },
> +	.corrected_hsize = { 0x80, 0x80 },
> +	.corrected_wo_scale_vsize = { 0x80, 0x80 },
> +	.corrected_vsize = { 0x80, 0x80 },
> +};
> +
> +static const struct viif_l2_gamma_config defval_l2_set_gamma = { 0 };
> +
> +static void viif_apply_default_parameter(struct viif_device *viif_dev)
> +{
> +	viif_l1_set_input_mode(viif_dev, &defval_l1_set_input_mode);
> +	viif_l1_set_rgb_to_y_coef(viif_dev, &defval_l1_set_rgb_to_y_coef);
> +	viif_l1_set_ag_mode(viif_dev, &defval_l1_set_ag_mode);
> +	viif_l1_set_ag(viif_dev, &defval_l1_set_ag);
> +	viif_l1_set_hdre(viif_dev, &defval_l1_set_hdre);
> +	viif_l1_set_img_extraction(viif_dev, &defval_l1_set_img_extraction);
> +	viif_l1_set_dpc(viif_dev, &defval_l1_set_dpc);
> +	viif_l1_set_preset_white_balance(viif_dev, &defval_l1_set_preset_white_balance);
> +	viif_l1_set_raw_color_noise_reduction(viif_dev, &defval_l1_set_raw_color_noise_reduction);
> +	viif_l1_set_hdrs(viif_dev, &defval_l1_set_hdrs);
> +	viif_l1_set_black_level_correction(viif_dev, &defval_l1_set_black_level_correction);
> +	viif_l1_set_lsc(viif_dev, &defval_l1_set_lsc);
> +	viif_l1_set_main_process(viif_dev, &defval_l1_set_main_process);
> +	viif_l1_set_awb(viif_dev, &defval_l1_set_awb);
> +	viif_l1_lock_awb_gain(viif_dev, &defval_l1_lock_awb_gain);
> +	viif_l1_set_hdrc(viif_dev, &defval_l1_set_hdrc);
> +	viif_l1_set_hdrc_ltm(viif_dev, &defval_l1_set_hdrc_ltm);
> +	viif_l1_set_gamma(viif_dev, &defval_l1_set_gamma);
> +	viif_l1_set_img_quality_adjustment(viif_dev, &defval_l1_set_img_quality_adjustment);
> +	viif_l1_set_avg_lum_generation(viif_dev, &defval_l1_set_avg_lum_generation);
> +	viif_l2_set_undist(viif_dev, &defval_l2_set_undist);
> +	viif_l2_set_roi_wrap(viif_dev, &defval_l2_set_roi);
> +	viif_l2_set_gamma(viif_dev, CAPTURE_PATH_MAIN_POST0, &defval_l2_set_gamma);
> +	viif_l2_set_gamma(viif_dev, CAPTURE_PATH_MAIN_POST1, &defval_l2_set_gamma);
> +}
> +
> +/*=======================================================================*/
> +/* parameter buffer streaming interface */
> +/*=======================================================================*/
> +struct viif_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head queue;
> +};
> +
> +static bool viif_params_get_buffer(struct params_dev *params_dev, struct viif_buffer **buf,
> +				   struct visconti_viif_isp_config **cfg)
> +{
> +	if (list_empty(&params_dev->params_queue))
> +		return false;
> +
> +	*buf = list_first_entry(&params_dev->params_queue, struct viif_buffer, queue);
> +	*cfg = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
> +
> +	return true;
> +}
> +
> +static int viif_apply_queued_parameter(struct viif_device *viif_dev, bool initial_cfg)
> +{
> +	struct params_dev *params_dev = &viif_dev->params_dev;
> +	struct visconti_viif_isp_config *new_params;
> +	struct viif_buffer *cur_buf;
> +	int ret = 0;
> +
> +	spin_lock(&params_dev->params_lock);
> +
> +	if (!viif_params_get_buffer(params_dev, &cur_buf, &new_params)) {
> +		ret = 1;
> +		goto unlock;
> +	}
> +
> +	/* evaluate new_params */
> +	if (initial_cfg) {
> +		if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_INPUT_MODE)
> +			viif_l1_set_input_mode(viif_dev, &new_params->l1_input_mode);
> +	}
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_RGB_TO_Y_COEF)
> +		viif_l1_set_rgb_to_y_coef(viif_dev, &new_params->l1_rgb_to_y_coef);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_AG_MODE)
> +		viif_l1_set_ag_mode(viif_dev, &new_params->l1_ag_mode);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_AG)
> +		viif_l1_set_ag(viif_dev, &new_params->l1_ag);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_HDRE)
> +		viif_l1_set_hdre(viif_dev, &new_params->l1_hdre);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_IMG_EXTRACTION)
> +		viif_l1_set_img_extraction(viif_dev, &new_params->l1_img_extraction);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_DPC)
> +		viif_l1_set_dpc(viif_dev, &new_params->l1_dpc);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_PRESET_WHITE_BALANCE)
> +		viif_l1_set_preset_white_balance(viif_dev, &new_params->l1_preset_white_balance);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_RAW_COLOR_NOISE_REDUCTION)
> +		viif_l1_set_raw_color_noise_reduction(viif_dev,
> +						      &new_params->l1_raw_color_noise_reduction);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_HDRS)
> +		viif_l1_set_hdrs(viif_dev, &new_params->l1_hdrs);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_BLACK_LEVEL_CORRECTION)
> +		viif_l1_set_black_level_correction(viif_dev,
> +						   &new_params->l1_black_level_correction);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_LSC)
> +		viif_l1_set_lsc(viif_dev, &new_params->l1_lsc);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_MAIN_PROCESS)
> +		viif_l1_set_main_process(viif_dev, &new_params->l1_main_process);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_AWB)
> +		viif_l1_set_awb(viif_dev, &new_params->l1_awb);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_LOCK_AWB_GAIN)
> +		viif_l1_lock_awb_gain(viif_dev, &new_params->lock_awb_gain);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_HDRC)
> +		viif_l1_set_hdrc(viif_dev, &new_params->l1_hdrc);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_HDRC_LTM)
> +		viif_l1_set_hdrc_ltm(viif_dev, &new_params->l1_hdrc_ltm);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_GAMMA)
> +		viif_l1_set_gamma(viif_dev, &new_params->l1_gamma);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_IMG_QUALITY_ADJUSTMENT)
> +		viif_l1_set_img_quality_adjustment(viif_dev,
> +						   &new_params->l1_img_quality_adjustment);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L1_AVG_LUM_GENERATION)
> +		viif_l1_set_avg_lum_generation(viif_dev, &new_params->l1_avg_lum_generation);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_UNDIST)
> +		viif_l2_set_undist(viif_dev, &new_params->l2_undist);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_ROI)
> +		viif_l2_set_roi_wrap(viif_dev, &new_params->l2_roi);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_GAMMA_POST0)
> +		viif_l2_set_gamma(viif_dev, CAPTURE_PATH_MAIN_POST0, &new_params->l2_gamma_post0);
> +	if (new_params->update_cfg & VISCONTI_VIIF_CFG_ISP_L2_GAMMA_POST1)
> +		viif_l2_set_gamma(viif_dev, CAPTURE_PATH_MAIN_POST1, &new_params->l2_gamma_post1);
> +
> +	/* release buffer */
> +	list_del(&cur_buf->queue);
> +	cur_buf->vb.sequence = 0;
> +	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +
> +unlock:
> +	spin_unlock(&params_dev->params_lock);
> +	return ret;
> +}
> +
> +void visconti_viif_params_isr(struct viif_device *viif_dev)
> +{
> +	viif_apply_queued_parameter(viif_dev, false);
> +}
> +
> +void visconti_viif_params_eval_queue(struct viif_device *viif_dev)
> +{
> +	if (viif_apply_queued_parameter(viif_dev, true))
> +		viif_apply_default_parameter(viif_dev);
> +}
> +
> +static int viif_params_enum_fmt_meta_out(struct file *file, void *priv, struct v4l2_fmtdesc *f)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +
> +	if (f->index > 0 || f->type != vdev->queue->type)
> +		return -EINVAL;
> +
> +	f->pixelformat = V4L2_META_FMT_VISCONTI_VIIF_PARAMS;
> +
> +	return 0;
> +}
> +
> +static int viif_params_g_fmt_meta_out(struct file *file, void *fh, struct v4l2_format *f)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	if (f->type != vdev->queue->type)
> +		return -EINVAL;
> +
> +	memset(meta, 0, sizeof(*meta));
> +	meta->dataformat = V4L2_META_FMT_VISCONTI_VIIF_PARAMS;
> +	meta->buffersize = sizeof(struct visconti_viif_isp_config);
> +
> +	return 0;
> +}
> +
> +static int viif_params_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +
> +	strscpy(cap->driver, VIIF_DRIVER_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, vdev->name, sizeof(cap->card));
> +	strscpy(cap->bus_info, VIIF_BUS_INFO_BASE "-0", sizeof(cap->bus_info));
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops viif_params_ioctl = {
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_enum_fmt_meta_out = viif_params_enum_fmt_meta_out,
> +	.vidioc_g_fmt_meta_out = viif_params_g_fmt_meta_out,
> +	.vidioc_s_fmt_meta_out = viif_params_g_fmt_meta_out,
> +	.vidioc_try_fmt_meta_out = viif_params_g_fmt_meta_out,
> +	.vidioc_querycap = viif_params_querycap,
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static const struct v4l2_file_operations viif_params_fops = { .mmap = vb2_fop_mmap,
> +							      .unlocked_ioctl = video_ioctl2,
> +							      .poll = vb2_fop_poll,
> +							      .open = v4l2_fh_open,
> +							      .release = vb2_fop_release };

Weird layout.

> +
> +static int viif_params_vb2_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
> +				       unsigned int *num_planes, unsigned int sizes[],
> +				       struct device *alloc_devs[])
> +{
> +	*num_buffers = clamp_t(u32, *num_buffers, 2, 8);
> +	*num_planes = 1;
> +	sizes[0] = sizeof(struct visconti_viif_isp_config);
> +	return 0;
> +}
> +
> +static inline struct viif_buffer *vb2_to_viif(struct vb2_v4l2_buffer *vbuf)
> +{
> +	return container_of(vbuf, struct viif_buffer, vb);
> +}
> +
> +static inline struct params_dev *vb2queue_to_paramsdev(struct vb2_queue *vq)
> +{
> +	return (struct params_dev *)vb2_get_drv_priv(vq);
> +}
> +
> +static void viif_params_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct params_dev *params_dev = vb2queue_to_paramsdev(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct viif_buffer *buf = vb2_to_viif(vbuf);
> +
> +	spin_lock_irq(&params_dev->params_lock);
> +	list_add_tail(&buf->queue, &params_dev->params_queue);
> +	spin_unlock_irq(&params_dev->params_lock);
> +}
> +
> +static int viif_params_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	if (vb2_plane_size(vb, 0) < sizeof(struct visconti_viif_isp_config))
> +		return -EINVAL;
> +
> +	vb2_set_plane_payload(vb, 0, sizeof(struct visconti_viif_isp_config));
> +	return 0;
> +}
> +
> +static int viif_params_vb2_start_streaming(struct vb2_queue *q, unsigned int arg)
> +{
> +	return 0;
> +}
> +
> +static void viif_params_vb2_stop_streaming(struct vb2_queue *q)
> +{
> +	struct params_dev *params_dev = vb2queue_to_paramsdev(q);
> +	struct viif_buffer *buf;
> +	LIST_HEAD(tmp_list);
> +
> +	spin_lock_irq(&params_dev->params_lock);
> +	list_splice_init(&params_dev->params_queue, &tmp_list);
> +	spin_unlock_irq(&params_dev->params_lock);
> +
> +	list_for_each_entry(buf, &tmp_list, queue)
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +}
> +
> +static const struct vb2_ops viif_params_vb2_ops = {
> +	.queue_setup = viif_params_vb2_queue_setup,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.buf_queue = viif_params_vb2_buf_queue,
> +	.buf_prepare = viif_params_vb2_buf_prepare,
> +	.start_streaming = viif_params_vb2_start_streaming,
> +	.stop_streaming = viif_params_vb2_stop_streaming,
> +};
> +
> +int visconti_viif_params_register(struct viif_device *viif_dev)
> +{
> +	struct params_dev *params_dev = &viif_dev->params_dev;
> +	struct video_device *vdev = &params_dev->vdev;
> +	struct vb2_queue *q = &params_dev->vb2_vq;
> +	int ret;
> +
> +	mutex_init(&params_dev->vlock);
> +	INIT_LIST_HEAD(&params_dev->params_queue);
> +	spin_lock_init(&params_dev->params_lock);
> +
> +	strscpy(vdev->name, "viif_params", sizeof(vdev->name));
> +
> +	/* Register the video device */
> +	video_set_drvdata(vdev, params_dev);
> +	vdev->ioctl_ops = &viif_params_ioctl;
> +	vdev->fops = &viif_params_fops;
> +	vdev->release = video_device_release_empty;
> +	vdev->lock = &params_dev->vlock;
> +	vdev->v4l2_dev = &viif_dev->v4l2_dev;
> +	vdev->queue = &params_dev->vb2_vq;
> +	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
> +	vdev->vfl_dir = VFL_DIR_TX;
> +
> +	/* Initialize vb2 queue */
> +	q->type = V4L2_BUF_TYPE_META_OUTPUT;
> +	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;

Why do you want to support VB2_USERPTR? While not officially deprecated,
we do discourage it for new drivers.

> +	q->drv_priv = params_dev;
> +	q->ops = &viif_params_vb2_ops;
> +	q->mem_ops = &vb2_vmalloc_memops;
> +	q->buf_struct_size = sizeof(struct viif_buffer);
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->lock = &params_dev->vlock;
> +	q->dev = viif_dev->v4l2_dev.dev;
> +
> +	ret = vb2_queue_init(q);
> +	if (ret)
> +		return ret;
> +
> +	params_dev->params_pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&vdev->entity, VIIF_PARAMS_PAD_NUM, &params_dev->params_pad);
> +	if (ret)
> +		goto error;
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(viif_dev->v4l2_dev.dev, "video_register_device failed: %d\n", ret);
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&params_dev->vlock);
> +
> +	return ret;
> +}
> +
> +void visconti_viif_params_unregister(struct viif_device *viif_dev)
> +{
> +	struct params_dev *params = &viif_dev->params_dev;
> +	struct video_device *vdev = &params->vdev;
> +
> +	if (!video_is_registered(vdev))
> +		return;
> +
> +	vb2_video_unregister_device(vdev);
> +	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&params->vlock);
> +}

<snip>

> diff --git a/drivers/media/platform/toshiba/visconti/viif_stats.c b/drivers/media/platform/toshiba/visconti/viif_stats.c
> new file mode 100644
> index 0000000000..28cd879b5f
> --- /dev/null
> +++ b/drivers/media/platform/toshiba/visconti/viif_stats.c
> @@ -0,0 +1,334 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +/* Toshiba Visconti Video Capture Support
> + *
> + * (C) Copyright 2023 TOSHIBA CORPORATION
> + * (C) Copyright 2023 Toshiba Electronic Devices & Storage Corporation
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/pm_runtime.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#include "viif.h"
> +#include "viif_csi2rx.h"
> +#include "viif_isp.h"
> +#include "viif_common.h"
> +#include "viif_regs.h"
> +#include "viif_stats.h"
> +
> +struct viif_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head queue;
> +};
> +
> +static void read_isp_capture_regs(struct viif_l1_info *l1_info, struct viif_device *viif_dev)
> +{
> +	unsigned long irqflags;
> +	int i, j;
> +	u32 val;
> +
> +	spin_lock_irqsave(&viif_dev->regbuf_lock, irqflags);
> +	hwd_viif_isp_guard_start(viif_dev);
> +
> +	/* change register buffer to regbuf0 where driver gets information */
> +	viif_capture_write(viif_dev, REG_L1_CRGBF_ACC_CONF, VAL_L1_CRGBF_ACC_CONF_MODE_BUFFER0);
> +
> +	/* get AWB info */
> +	l1_info->awb_ave_u = viif_capture_read(viif_dev, REG_L1_AWHB_AVE_USIG);
> +	l1_info->awb_ave_v = viif_capture_read(viif_dev, REG_L1_AWHB_AVE_VSIG);
> +	l1_info->awb_accumulated_pixel = viif_capture_read(viif_dev, REG_L1_AWHB_NUM_UVON);
> +	l1_info->awb_gain_r = viif_capture_read(viif_dev, REG_L1_AWHB_AWBGAINR);
> +	l1_info->awb_gain_g = viif_capture_read(viif_dev, REG_L1_AWHB_AWBGAING);
> +	l1_info->awb_gain_b = viif_capture_read(viif_dev, REG_L1_AWHB_AWBGAINB);
> +	val = viif_capture_read(viif_dev, REG_L1_AWHB_R_CTR_STOP);
> +	l1_info->awb_status_u = (FIELD_GET(BIT(1), val) != 0);
> +	l1_info->awb_status_v = (FIELD_GET(BIT(0), val) != 0);
> +
> +	/* get average luminance info */
> +	l1_info->avg_lum_weight = viif_capture_read(viif_dev, REG_L1_AEXP_RESULT_AVE);
> +	val = viif_capture_read(viif_dev, REG_L1_AEXP_SATUR_BLACK_PIXNUM);
> +	l1_info->avg_satur_pixnum = FIELD_GET(GENMASK(31, 16), val);
> +	l1_info->avg_black_pixnum = FIELD_GET(GENMASK(15, 0), val);
> +	for (i = 0; i < 8; i++) {
> +		for (j = 0; j < 8; j++) {
> +			l1_info->avg_lum_block[i][j] =
> +				viif_capture_read(viif_dev, REG_L1_AEXP_AVE(i, j));
> +		}
> +	}
> +	l1_info->avg_lum_four_line_lum[0] = viif_capture_read(viif_dev, REG_L1_AEXP_AVE4LINES0);
> +	l1_info->avg_lum_four_line_lum[1] = viif_capture_read(viif_dev, REG_L1_AEXP_AVE4LINES1);
> +	l1_info->avg_lum_four_line_lum[2] = viif_capture_read(viif_dev, REG_L1_AEXP_AVE4LINES2);
> +	l1_info->avg_lum_four_line_lum[3] = viif_capture_read(viif_dev, REG_L1_AEXP_AVE4LINES3);
> +
> +	/* revert to register access from register buffer access */
> +	viif_capture_write(viif_dev, REG_L1_CRGBF_ACC_CONF, VAL_L1_CRGBF_ACC_CONF_MODE_BYPASS);
> +
> +	hwd_viif_isp_guard_end(viif_dev);
> +	spin_unlock_irqrestore(&viif_dev->regbuf_lock, irqflags);
> +}
> +
> +static const struct viif_csi2rx_dphy_calibration_status calib_status_not_streaming = {
> +	.term_cal_with_rext = -EAGAIN,
> +	.clock_lane_offset_cal = -EAGAIN,
> +	.data_lane0_offset_cal = -EAGAIN,
> +	.data_lane1_offset_cal = -EAGAIN,
> +	.data_lane2_offset_cal = -EAGAIN,
> +	.data_lane3_offset_cal = -EAGAIN,
> +	.data_lane0_ddl_tuning_cal = -EAGAIN,
> +	.data_lane1_ddl_tuning_cal = -EAGAIN,
> +	.data_lane2_ddl_tuning_cal = -EAGAIN,
> +	.data_lane3_ddl_tuning_cal = -EAGAIN,
> +};
> +
> +static const struct viif_csi2rx_err_status csi_err_not_streaming;
> +
> +void visconti_viif_stats_isr(struct viif_device *viif_dev, unsigned int sequence, u64 timestamp)
> +{
> +	struct visconti_viif_isp_stat *cur_stat_buf;
> +	struct stats_dev *stats_dev = &viif_dev->stats_dev;
> +	struct viif_buffer *cur_buf;
> +
> +	spin_lock(&stats_dev->stats_lock);
> +
> +	if (list_empty(&stats_dev->stats_queue))
> +		goto done;
> +
> +	cur_buf = list_first_entry(&stats_dev->stats_queue, struct viif_buffer, queue);
> +	list_del(&cur_buf->queue);
> +	cur_stat_buf = (struct visconti_viif_isp_stat *)vb2_plane_vaddr(&cur_buf->vb.vb2_buf, 0);
> +
> +	if (!vb2_start_streaming_called(&viif_dev->cap_dev0.vb2_vq)) {
> +		cur_stat_buf->csi2rx_dphy_calibration = calib_status_not_streaming;
> +	} else {
> +		visconti_viif_csi2rx_get_calibration_status(viif_dev,
> +							    &cur_stat_buf->csi2rx_dphy_calibration);
> +	}
> +
> +	if (!vb2_is_streaming(&viif_dev->cap_dev0.vb2_vq))
> +		cur_stat_buf->csi2rx_err = csi_err_not_streaming;
> +	else
> +		visconti_viif_csi2rx_get_err_status(viif_dev, &cur_stat_buf->csi2rx_err);
> +
> +	read_isp_capture_regs(&cur_stat_buf->isp_capture.l1_info, viif_dev);
> +
> +	cur_stat_buf->errors.main = viif_dev->reported_err_main;
> +	cur_stat_buf->errors.sub = viif_dev->reported_err_sub;
> +	cur_stat_buf->errors.csi2rx = viif_dev->reported_err_csi2rx;
> +	viif_dev->reported_err_main = 0;
> +	viif_dev->reported_err_sub = 0;
> +	viif_dev->reported_err_csi2rx = 0;
> +
> +	vb2_set_plane_payload(&cur_buf->vb.vb2_buf, 0, sizeof(struct visconti_viif_isp_stat));
> +
> +	cur_buf->vb.sequence = sequence;
> +	cur_buf->vb.vb2_buf.timestamp = timestamp;
> +	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +
> +done:
> +	spin_unlock(&stats_dev->stats_lock);
> +}
> +
> +static int viif_stats_enum_fmt_meta_cap(struct file *file, void *priv, struct v4l2_fmtdesc *f)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +
> +	if (f->index > 0 || f->type != vdev->queue->type)
> +		return -EINVAL;
> +
> +	f->pixelformat = V4L2_META_FMT_VISCONTI_VIIF_STATS;
> +
> +	return 0;
> +}
> +
> +static int viif_stats_g_fmt_meta_cap(struct file *file, void *priv, struct v4l2_format *f)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	if (f->type != vdev->queue->type)
> +		return -EINVAL;
> +
> +	memset(meta, 0, sizeof(*meta));
> +	meta->dataformat = V4L2_META_FMT_VISCONTI_VIIF_STATS;
> +	meta->buffersize = sizeof(struct visconti_viif_isp_stat);
> +
> +	return 0;
> +}
> +
> +static int viif_stats_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +
> +	strscpy(cap->driver, VIIF_DRIVER_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, vdev->name, sizeof(cap->card));
> +	strscpy(cap->bus_info, VIIF_BUS_INFO_BASE "-0", sizeof(cap->bus_info));
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops viif_stats_ioctl = {
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +	.vidioc_enum_fmt_meta_cap = viif_stats_enum_fmt_meta_cap,
> +	.vidioc_g_fmt_meta_cap = viif_stats_g_fmt_meta_cap,
> +	.vidioc_s_fmt_meta_cap = viif_stats_g_fmt_meta_cap,
> +	.vidioc_try_fmt_meta_cap = viif_stats_g_fmt_meta_cap,
> +	.vidioc_querycap = viif_stats_querycap,
> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static const struct v4l2_file_operations viif_stats_fops = { .mmap = vb2_fop_mmap,
> +							     .unlocked_ioctl = video_ioctl2,
> +							     .poll = vb2_fop_poll,
> +							     .open = v4l2_fh_open,
> +							     .release = vb2_fop_release };

Weird layout.

> +
> +static int viif_stats_vb2_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
> +				      unsigned int *num_planes, unsigned int sizes[],
> +				      struct device *alloc_devs[])
> +{
> +	*num_planes = 1;
> +	*num_buffers = clamp_t(u32, *num_buffers, 2, 8);
> +	sizes[0] = sizeof(struct visconti_viif_isp_stat);
> +
> +	return 0;
> +}
> +
> +static inline struct viif_buffer *vb2_to_viif(struct vb2_v4l2_buffer *vbuf)
> +{
> +	return container_of(vbuf, struct viif_buffer, vb);
> +}
> +
> +static inline struct stats_dev *vb2queue_to_statsdev(struct vb2_queue *q)
> +{
> +	return (struct stats_dev *)vb2_get_drv_priv(q);
> +}
> +
> +static void viif_stats_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct stats_dev *stats_dev = vb2queue_to_statsdev(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct viif_buffer *buf = vb2_to_viif(vbuf);
> +
> +	spin_lock_irq(&stats_dev->stats_lock);
> +	list_add_tail(&buf->queue, &stats_dev->stats_queue);
> +	spin_unlock_irq(&stats_dev->stats_lock);
> +}
> +
> +static int viif_stats_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	if (vb2_plane_size(vb, 0) < sizeof(struct visconti_viif_isp_stat))
> +		return -EINVAL;
> +
> +	vb2_set_plane_payload(vb, 0, sizeof(struct visconti_viif_isp_stat));
> +
> +	return 0;
> +}
> +
> +static void viif_stats_vb2_stop_streaming(struct vb2_queue *q)
> +{
> +	struct stats_dev *stats_dev = vb2queue_to_statsdev(q);
> +	struct viif_buffer *buf;
> +	unsigned int i;
> +
> +	spin_lock_irq(&stats_dev->stats_lock);
> +	for (i = 0; i < 8; i++) {
> +		if (list_empty(&stats_dev->stats_queue))
> +			break;
> +		buf = list_first_entry(&stats_dev->stats_queue, struct viif_buffer, queue);
> +		list_del(&buf->queue);
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	}
> +	spin_unlock_irq(&stats_dev->stats_lock);
> +}
> +
> +static const struct vb2_ops viif_stats_vb2_ops = {
> +	.queue_setup = viif_stats_vb2_queue_setup,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.buf_queue = viif_stats_vb2_buf_queue,
> +	.buf_prepare = viif_stats_vb2_buf_prepare,
> +	.stop_streaming = viif_stats_vb2_stop_streaming,
> +};
> +
> +int visconti_viif_stats_register(struct viif_device *viif_dev)
> +{
> +	struct stats_dev *stats_dev = &viif_dev->stats_dev;
> +	struct video_device *vdev = &stats_dev->vdev;
> +	struct vb2_queue *q = &stats_dev->vb2_vq;
> +	int ret;
> +
> +	mutex_init(&stats_dev->vlock);
> +	INIT_LIST_HEAD(&stats_dev->stats_queue);
> +	spin_lock_init(&stats_dev->stats_lock);
> +
> +	strscpy(vdev->name, "viif_stats", sizeof(vdev->name));
> +
> +	/* Register the video device */
> +	video_set_drvdata(vdev, stats_dev);
> +	vdev->ioctl_ops = &viif_stats_ioctl;
> +	vdev->fops = &viif_stats_fops;
> +	vdev->release = video_device_release_empty;
> +	vdev->lock = &stats_dev->vlock;
> +	vdev->v4l2_dev = &viif_dev->v4l2_dev;
> +	vdev->queue = &stats_dev->vb2_vq;
> +	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> +	vdev->vfl_dir = VFL_DIR_RX;
> +
> +	/* Initialize vb2 queue */
> +	q->type = V4L2_BUF_TYPE_META_CAPTURE;
> +	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;

Same question regarding VB2_USERPTR: do you really need this?

> +	q->drv_priv = stats_dev;
> +	q->ops = &viif_stats_vb2_ops;
> +	q->mem_ops = &vb2_vmalloc_memops;
> +	q->buf_struct_size = sizeof(struct viif_buffer);
> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	q->lock = &stats_dev->vlock;
> +	q->dev = viif_dev->v4l2_dev.dev;
> +
> +	ret = vb2_queue_init(q);
> +	if (ret)
> +		return ret;
> +
> +	stats_dev->stats_pad.flags = MEDIA_PAD_FL_SINK;
> +	ret = media_entity_pads_init(&vdev->entity, VIIF_STATS_PAD_NUM, &stats_dev->stats_pad);
> +	if (ret)
> +		goto error;
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(viif_dev->v4l2_dev.dev, "video_register_device failed: %d\n", ret);
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&stats_dev->vlock);
> +
> +	return ret;
> +}
> +
> +void visconti_viif_stats_unregister(struct viif_device *viif_dev)
> +{
> +	struct stats_dev *stats_dev = &viif_dev->stats_dev;
> +	struct video_device *vdev = &stats_dev->vdev;
> +
> +	if (!video_is_registered(vdev))
> +		return;
> +
> +	vb2_video_unregister_device(vdev);
> +	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&stats_dev->vlock);
> +}
> diff --git a/drivers/media/platform/toshiba/visconti/viif_stats.h b/drivers/media/platform/toshiba/visconti/viif_stats.h
> new file mode 100644
> index 0000000000..3f778c58ef
> --- /dev/null
> +++ b/drivers/media/platform/toshiba/visconti/viif_stats.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +/* Toshiba Visconti Video Capture Support
> + *
> + * (C) Copyright 2023 TOSHIBA CORPORATION
> + * (C) Copyright 2023 Toshiba Electronic Devices & Storage Corporation
> + */
> +
> +#ifndef VIIF_STATS_H
> +#define VIIF_STATS_H
> +
> +void visconti_viif_stats_isr(struct viif_device *viif_dev, unsigned int sequence, u64 timestamp);
> +int visconti_viif_stats_register(struct viif_device *viif_dev);
> +void visconti_viif_stats_unregister(struct viif_device *viif_dev);
> +#endif /* VIIF_STATS_H */

Regards,

	Hans

