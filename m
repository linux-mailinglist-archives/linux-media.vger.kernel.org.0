Return-Path: <linux-media+bounces-14855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A0792D293
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 15:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 497371C23442
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C3A192492;
	Wed, 10 Jul 2024 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="weH4yMa+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BD51DDC5;
	Wed, 10 Jul 2024 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617475; cv=none; b=cwEYqDfP8o3xbIhPofbPZ3h9N1RHvfdGQs/bw3JwOUAC1Gj0rifDFQeuWj4aQQx11EGMC9lAOgcjjJT5lyC3l3mb7/ORHIhGuJ9k4T4w3NVyegR7as0mSGdoMjMZIeghAjX8D3h38Um8GL9KeeTH5esogpiBl91B7LReDFPRxKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617475; c=relaxed/simple;
	bh=UrHyaviSLFA8sWVdfqGOsRFU0vt4/8vUZu3mZb+GZDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHvm3VL8zc4viCzR+t4JeDbCi8GXL59ewZRxNDuNqSGWuY4gOgtwU3j/Jfxtnnl9qeuDwATy1zQUFPbba5eDICqWB0MdfXEBrqop5UD2GU54SrIKNQP1AHv6QlcX493LO5xCkAfhZtx/AIN9yqG7z4K82pOz0yfWmk4ajPA4IxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=weH4yMa+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E87757F5;
	Wed, 10 Jul 2024 15:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720617437;
	bh=UrHyaviSLFA8sWVdfqGOsRFU0vt4/8vUZu3mZb+GZDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=weH4yMa+VqILm3Ib5C8N6wgo/CkQ0/+KB/FvWEdp54Ve3rbrQUCaNNw5DRFScTERn
	 JvoqbA5hJDZ5wkHMl5OWP5vJM/X5UJDl2+3LKhjFT/mQE618xNls7cnV+zoL9GvP/q
	 jym0Gs2su43TWMuLa0OpjJZDodXEJ5PpgQOG1wSI=
Date: Wed, 10 Jul 2024 15:17:47 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang <mingjia.zhang@mediatek.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 12/14] staging: media: starfive: Add ISP parameters
 hardware configure
Message-ID: <rs5fegc5qdjwyyprlcbaruoapjdu6n6qrvlmj2s2hvhcfoypvi@3af2mr375fcp>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-13-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709083824.430473-13-changhuang.liang@starfivetech.com>

Hi Changhuang

On Tue, Jul 09, 2024 at 01:38:22AM GMT, Changhuang Liang wrote:
> Add ISP parameters hardware configure.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../staging/media/starfive/camss/stf-camss.h  |   8 +
>  .../media/starfive/camss/stf-isp-hw-ops.c     | 573 ++++++++++++++++++
>  .../staging/media/starfive/camss/stf-isp.h    | 135 +++++
>  3 files changed, 716 insertions(+)
>
> diff --git a/drivers/staging/media/starfive/camss/stf-camss.h b/drivers/staging/media/starfive/camss/stf-camss.h
> index 3f84f1a1e997..328318d61c6b 100644
> --- a/drivers/staging/media/starfive/camss/stf-camss.h
> +++ b/drivers/staging/media/starfive/camss/stf-camss.h
> @@ -106,6 +106,14 @@ static inline void stf_isp_reg_set(struct stfcamss *stfcamss, u32 reg, u32 mask)
>  		  stfcamss->isp_base + reg);
>  }
>
> +static inline void stf_isp_reg_fill_zero(struct stfcamss *stfcamss, u32 reg, u32 size)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < size; i++, reg += 4)
> +		iowrite32(0, stfcamss->isp_base + reg);
> +}
> +

Why in the header file ? Also could memset_io() replace this ?

>  static inline u32 stf_syscon_reg_read(struct stfcamss *stfcamss, u32 reg)
>  {
>  	return ioread32(stfcamss->syscon_base + reg);
> diff --git a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
> index 0bc5e36f952e..e54368910906 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
> +++ b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
> @@ -10,6 +10,25 @@
>
>  #include "stf-camss.h"
>
> +static const struct stf_isp_module_info mod_info[] = {
> +	{ ISP_REG_CSI_MODULE_CFG, 2 },
> +	{ ISP_REG_CSI_MODULE_CFG, 4 },
> +	{ ISP_REG_CSI_MODULE_CFG, 6 },
> +	{ ISP_REG_CSI_MODULE_CFG, 7 },
> +	{ ISP_REG_CSI_MODULE_CFG, 17 },
> +	{ ISP_REG_ISP_CTRL_1, 1 },
> +	{ ISP_REG_ISP_CTRL_1, 2 },
> +	{ ISP_REG_ISP_CTRL_1, 3 },
> +	{ ISP_REG_ISP_CTRL_1, 4 },
> +	{ ISP_REG_ISP_CTRL_1, 5 },
> +	{ ISP_REG_ISP_CTRL_1, 7 },
> +	{ ISP_REG_ISP_CTRL_1, 8 },
> +	{ ISP_REG_ISP_CTRL_1, 17 },
> +	{ ISP_REG_ISP_CTRL_1, 19 },
> +	{ ISP_REG_ISP_CTRL_1, 21 },
> +	{ ISP_REG_ISP_CTRL_1, 22 },
> +};
> +
>  static void stf_isp_config_obc(struct stfcamss *stfcamss)
>  {
>  	u32 reg_val, reg_add;
> @@ -517,6 +536,59 @@ static void stf_isp_fill_flag(struct stfcamss *stfcamss, void *vaddr,
>  	}
>  }
>
> +static void stf_isp_set_params(struct stfcamss *stfcamss, void *vaddr)
> +{

Shouldn't all these operations be in the -params.c file ?

> +	struct jh7110_isp_params_buffer *params = (struct jh7110_isp_params_buffer *)vaddr;
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_WB_SETTING)
> +		isp_set_ctrl_wb(stfcamss, &params->wb_setting);

Also this function is exported in stf-isp.h but are only called
from within this file ? Same for all the other ones I guess ?

> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_CAR_SETTING)
> +		isp_set_ctrl_car(stfcamss, &params->car_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_CCM_SETTING)
> +		isp_set_ctrl_ccm(stfcamss, &params->ccm_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_CFA_SETTING)
> +		isp_set_ctrl_cfa(stfcamss, &params->cfa_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_CTC_SETTING)
> +		isp_set_ctrl_ctc(stfcamss, &params->ctc_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_DBC_SETTING)
> +		isp_set_ctrl_dbc(stfcamss, &params->dbc_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_DNYUV_SETTING)
> +		isp_set_ctrl_dnyuv(stfcamss, &params->dnyuv_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_GMARGB_SETTING)
> +		isp_set_ctrl_gmargb(stfcamss, &params->gmargb_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_LCCF_SETTING)
> +		isp_set_ctrl_lccf(stfcamss, &params->lccf_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_OBC_SETTING)
> +		isp_set_ctrl_obc(stfcamss, &params->obc_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_OECF_SETTING)
> +		isp_set_ctrl_oecf(stfcamss, &params->oecf_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_R2Y_SETTING)
> +		isp_set_ctrl_r2y(stfcamss, &params->r2y_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_SAT_SETTING)
> +		isp_set_ctrl_sat(stfcamss, &params->sat_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_SHARP_SETTING)
> +		isp_set_ctrl_sharp(stfcamss, &params->sharp_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_YCRV_SETTING)
> +		isp_set_ctrl_ycrv(stfcamss, &params->ycrv_setting);
> +
> +	if (params->enable_setting & JH7110_ISP_MODULE_SC_SETTING)
> +		isp_set_ctrl_sc(stfcamss, &params->sc_setting);
> +}
> +
>  irqreturn_t stf_line_irq_handler(int irq, void *priv)
>  {
>  	struct stfcamss *stfcamss = priv;
> @@ -566,11 +638,20 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
>  	struct stfcamss *stfcamss = priv;
>  	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
>  	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
> +	struct stf_output *output = &stfcamss->output;
>  	struct stfcamss_buffer *ready_buf;
>  	u32 status;
>
>  	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
>  	if (status & ISPC_ISP) {
> +		ready_buf = stf_buf_get_ready(&output->buffers);
> +		if (ready_buf) {
> +			stf_isp_set_params(stfcamss, ready_buf->vaddr);
> +			ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
> +			ready_buf->vb.sequence = output->buffers.sequence++;
> +			vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +		}
> +
>  		if (status & ISPC_ENUO) {
>  			ready_buf = stf_buf_done(&cap->buffers);
>  			if (ready_buf)
> @@ -591,4 +672,496 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
>  	}
>
>  	return IRQ_HANDLED;
> +};
> +
> +int isp_set_ctrl_wb(struct stfcamss *stfcamss, const void *value)

This function is generic, there's no need to pass a const
void * here and cast it below, you can use const struct jh7110_isp_wb_setting *
as the second argument type.

> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_awb];
> +	const struct jh7110_isp_wb_setting *setting =
> +		(const struct jh7110_isp_wb_setting *)value;
> +	const struct jh7110_isp_wb_gain *gains = &setting->gains;
> +
> +	stf_isp_reg_fill_zero(stfcamss, ISP_REG_AWB_X0_CFG_0, 16);
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S0_CFG_0,
> +			  AWB_S_SYMBOL_H(gains->gain_r) | AWB_S_SYMBOL_L(gains->gain_r));
> +	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S0_CFG_1,
> +			  AWB_S_SYMBOL_H(gains->gain_r) | AWB_S_SYMBOL_L(gains->gain_r));
> +	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S1_CFG_0,
> +			  AWB_S_SYMBOL_H(gains->gain_g) | AWB_S_SYMBOL_L(gains->gain_g));
> +	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S1_CFG_1,
> +			  AWB_S_SYMBOL_H(gains->gain_g) | AWB_S_SYMBOL_L(gains->gain_g));
> +	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S2_CFG_0,
> +			  AWB_S_SYMBOL_H(gains->gain_g) | AWB_S_SYMBOL_L(gains->gain_g));
> +	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S2_CFG_1,
> +			  AWB_S_SYMBOL_H(gains->gain_g) | AWB_S_SYMBOL_L(gains->gain_g));
> +	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S3_CFG_0,
> +			  AWB_S_SYMBOL_H(gains->gain_b) | AWB_S_SYMBOL_L(gains->gain_b));
> +	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S3_CFG_1,
> +			  AWB_S_SYMBOL_H(gains->gain_b) | AWB_S_SYMBOL_L(gains->gain_b));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_car(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_car];
> +	const struct jh7110_isp_car_setting *setting =
> +		(const struct jh7110_isp_car_setting *)value;
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_ccm(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_ccm];
> +	const struct jh7110_isp_ccm_setting *setting =
> +		(const struct jh7110_isp_ccm_setting *)value;
> +	const struct jh7110_isp_ccm_smlow *ccm = &setting->ccm_smlow;
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_0, DNRM_F(6));
> +	stf_isp_reg_fill_zero(stfcamss, ISP_REG_ICAMD_1, 11);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_12, ccm->ccm[0][0]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_13, ccm->ccm[0][1]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_14, ccm->ccm[0][2]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_15, ccm->ccm[1][0]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_16, ccm->ccm[1][1]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_17, ccm->ccm[1][2]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_18, ccm->ccm[2][0]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_19, ccm->ccm[2][1]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_20, ccm->ccm[2][2]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_21, ccm->offsets[0]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_22, ccm->offsets[1]);
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_23, ccm->offsets[2]);
> +	stf_isp_reg_fill_zero(stfcamss, ISP_REG_ICAMD_24, 2);
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_cfa(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_cfa];
> +	const struct jh7110_isp_cfa_setting *setting =
> +		(const struct jh7110_isp_cfa_setting *)value;
> +	const struct jh7110_isp_cfa_params *cfa = &setting->settings;
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICFAM,
> +			  HV_W(cfa->hv_width) | CROSS_COV(cfa->cross_cov));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_ctc(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_ctc];
> +	const struct jh7110_isp_ctc_setting *setting =
> +		(const struct jh7110_isp_ctc_setting *)value;
> +	const struct jh7110_isp_ctc_params *ctc = &setting->settings;
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_ICTC,
> +			  MINGT(ctc->min_gt) | MAXGT(ctc->max_gt) |
> +			  GF_MODE(ctc->saf_mode | ctc->daf_mode));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_dbc(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_dbc];
> +	const struct jh7110_isp_dbc_setting *setting =
> +		(const struct jh7110_isp_dbc_setting *)value;
> +	const struct jh7110_isp_dbc_params *dbc = &setting->settings;
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_IDBC,
> +			  BADXT(dbc->bad_xt) | BADGT(dbc->bad_gt));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_dnyuv(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_dnyuv];
> +	const struct jh7110_isp_dnyuv_setting *setting =
> +		(const struct jh7110_isp_dnyuv_setting *)value;
> +	const struct jh7110_isp_dnyuv_params *cfg = &setting->settings;
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YSWR0,
> +			  YUVSW0(cfg->y_sweight[0]) | YUVSW1(cfg->y_sweight[1]) |
> +			  YUVSW2(cfg->y_sweight[2]) | YUVSW3(cfg->y_sweight[3]) |
> +			  YUVSW4(cfg->y_sweight[4]) | YUVSW5(cfg->y_sweight[5]));
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YSWR1,
> +			  YUVSW0(cfg->y_sweight[6]) | YUVSW1(cfg->y_sweight[7]) |
> +			  YUVSW2(cfg->y_sweight[8]) | YUVSW3(cfg->y_sweight[9]));
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CSWR0,
> +			  YUVSW0(cfg->uv_sweight[0]) | YUVSW1(cfg->uv_sweight[1]) |
> +			  YUVSW2(cfg->uv_sweight[2]) | YUVSW3(cfg->uv_sweight[3]) |
> +			  YUVSW4(cfg->uv_sweight[4]) | YUVSW5(cfg->uv_sweight[5]));
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CSWR1,
> +			  YUVSW0(cfg->uv_sweight[6]) | YUVSW1(cfg->uv_sweight[7]) |
> +			  YUVSW2(cfg->uv_sweight[8]) | YUVSW3(cfg->uv_sweight[9]));
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YDR0,
> +			  CURVE_D_L(cfg->y_curve[0]) | CURVE_D_H(cfg->y_curve[1]));
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YDR1,
> +			  CURVE_D_L(cfg->y_curve[2]) | CURVE_D_H(cfg->y_curve[3]));
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YDR2,
> +			  CURVE_D_L(cfg->y_curve[4]) | CURVE_D_H(cfg->y_curve[5]));
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CDR0,
> +			  CURVE_D_L(cfg->uv_curve[0]) | CURVE_D_H(cfg->uv_curve[1]));
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CDR1,
> +			  CURVE_D_L(cfg->uv_curve[2]) | CURVE_D_H(cfg->uv_curve[3]));
> +	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CDR2,
> +			  CURVE_D_L(cfg->uv_curve[4]) | CURVE_D_H(cfg->uv_curve[5]));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_gmargb(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_gmargb];
> +	const struct jh7110_isp_gmargb_setting *setting =
> +		(const struct jh7110_isp_gmargb_setting *)value;
> +	const struct jh7110_isp_gmargb_point *curve = setting->curve;
> +	u32 reg_addr = ISP_REG_GAMMA_VAL0;
> +	u32 i;
> +
> +	for (i = 0; i < 15; i++, reg_addr += 4)
> +		stf_isp_reg_write(stfcamss, reg_addr,
> +				  GAMMA_S_VAL(curve[i].sg_val) | GAMMA_VAL(curve[i].g_val));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_lccf(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_lccf];
> +	const struct jh7110_isp_lccf_setting *setting =
> +		(const struct jh7110_isp_lccf_setting *)value;
> +	const struct jh7110_isp_lccf_circle *circle = &setting->circle;
> +	const struct jh7110_isp_lccf_curve_param *r_param = &setting->r_param;
> +	const struct jh7110_isp_lccf_curve_param *gr_param = &setting->gr_param;
> +	const struct jh7110_isp_lccf_curve_param *gb_param = &setting->gb_param;
> +	const struct jh7110_isp_lccf_curve_param *b_param = &setting->b_param;
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_0,
> +			  Y_DISTANCE(circle->center_y) | X_DISTANCE(circle->center_x));
> +	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_1,
> +			  LCCF_MAX_DIS(circle->radius));
> +	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_2,
> +			  LCCF_F1_PAR(r_param->f1) | LCCF_F2_PAR(r_param->f2));
> +	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_3,
> +			  LCCF_F1_PAR(gr_param->f1) | LCCF_F2_PAR(gr_param->f2));
> +	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_4,
> +			  LCCF_F1_PAR(gb_param->f1) | LCCF_F2_PAR(gb_param->f2));
> +	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_5,
> +			  LCCF_F1_PAR(b_param->f1) | LCCF_F2_PAR(b_param->f2));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_obc(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_obc];
> +	const struct jh7110_isp_obc_setting *setting =
> +		(const struct jh7110_isp_obc_setting *)value;
> +	const struct jh7110_isp_obc_win_size *win_size = &setting->win_size;
> +	const struct jh7110_isp_obc_gain *gain = setting->gain;
> +	const struct jh7110_isp_obc_offset *offset = setting->offset;
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_OBC_CFG,
> +			  OBC_W_W(win_size->width) | OBC_W_H(win_size->height));
> +	stf_isp_reg_write(stfcamss, ISP_REG_OBCG_CFG_0,
> +			  GAIN_A_POINT(gain[0].tl_gain) | GAIN_B_POINT(gain[0].tr_gain) |
> +			  GAIN_C_POINT(gain[0].bl_gain) | GAIN_D_POINT(gain[0].br_gain));
> +	stf_isp_reg_write(stfcamss, ISP_REG_OBCG_CFG_1,
> +			  GAIN_A_POINT(gain[1].tl_gain) | GAIN_B_POINT(gain[1].tr_gain) |
> +			  GAIN_C_POINT(gain[1].bl_gain) | GAIN_D_POINT(gain[1].br_gain));
> +	stf_isp_reg_write(stfcamss, ISP_REG_OBCG_CFG_2,
> +			  GAIN_A_POINT(gain[2].tl_gain) | GAIN_B_POINT(gain[2].tr_gain) |
> +			  GAIN_C_POINT(gain[2].bl_gain) | GAIN_D_POINT(gain[2].br_gain));
> +	stf_isp_reg_write(stfcamss, ISP_REG_OBCG_CFG_3,
> +			  GAIN_A_POINT(gain[3].tl_gain) | GAIN_B_POINT(gain[3].tr_gain) |
> +			  GAIN_C_POINT(gain[3].bl_gain) | GAIN_D_POINT(gain[3].br_gain));
> +	stf_isp_reg_write(stfcamss, ISP_REG_OBCO_CFG_0,
> +			  OFFSET_A_POINT(offset[0].tl_offset) |
> +			  OFFSET_B_POINT(offset[0].tr_offset) |
> +			  OFFSET_C_POINT(offset[0].bl_offset) |
> +			  OFFSET_D_POINT(offset[0].br_offset));
> +	stf_isp_reg_write(stfcamss, ISP_REG_OBCO_CFG_1,
> +			  OFFSET_A_POINT(offset[1].tl_offset) |
> +			  OFFSET_B_POINT(offset[1].tr_offset) |
> +			  OFFSET_C_POINT(offset[1].bl_offset) |
> +			  OFFSET_D_POINT(offset[1].br_offset));
> +	stf_isp_reg_write(stfcamss, ISP_REG_OBCO_CFG_2,
> +			  OFFSET_A_POINT(offset[2].tl_offset) |
> +			  OFFSET_B_POINT(offset[2].tr_offset) |
> +			  OFFSET_C_POINT(offset[2].bl_offset) |
> +			  OFFSET_D_POINT(offset[2].br_offset));
> +	stf_isp_reg_write(stfcamss, ISP_REG_OBCO_CFG_3,
> +			  OFFSET_A_POINT(offset[3].tl_offset) |
> +			  OFFSET_B_POINT(offset[3].tr_offset) |
> +			  OFFSET_C_POINT(offset[3].bl_offset) |
> +			  OFFSET_D_POINT(offset[3].br_offset));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_oecf(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_oecf];
> +	const struct jh7110_isp_oecf_setting *setting =
> +		(const struct jh7110_isp_oecf_setting *)value;
> +	const struct jh7110_isp_oecf_point *oecf = setting->r_curve;
> +	u32 reg_x_addr = ISP_REG_OECF_X0_CFG0;
> +	u32 reg_y_addr = ISP_REG_OECF_Y0_CFG0;
> +	u32 reg_s_addr = ISP_REG_OECF_S0_CFG0;
> +	u32 i;
> +
> +	for (i = 0; i < 64; i += 2, reg_x_addr += 4, reg_y_addr += 4, reg_s_addr += 4) {
> +		stf_isp_reg_write(stfcamss, reg_x_addr,
> +				  OCEF_PAR_L(oecf[i].x) | OCEF_PAR_H(oecf[i + 1].x));
> +		stf_isp_reg_write(stfcamss, reg_y_addr,
> +				  OCEF_PAR_L(oecf[i].y) | OCEF_PAR_H(oecf[i + 1].y));
> +		stf_isp_reg_write(stfcamss, reg_s_addr,
> +				  OCEF_PAR_L(oecf[i].slope) | OCEF_PAR_H(oecf[i + 1].slope));
> +	}
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_r2y(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_r2y];
> +	const struct jh7110_isp_r2y_setting *setting =
> +		(const struct jh7110_isp_r2y_setting *)value;
> +	const struct jh7110_isp_r2y_matrix *matrix = &setting->matrix;
> +	u32 reg_addr = ISP_REG_R2Y_0;
> +	u32 i;
> +
> +	for (i = 0; i < 9; i++, reg_addr += 4)
> +		stf_isp_reg_write(stfcamss, reg_addr, matrix->m[i]);
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_sat(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_sat];
> +	const struct jh7110_isp_sat_setting *setting =
> +		(const struct jh7110_isp_sat_setting *)value;
> +	const struct jh7110_isp_sat_info *sat = &setting->sat_info;
> +	const struct jh7110_isp_sat_hue_info *hue = &setting->hue_info;
> +	const struct jh7110_isp_sat_curve *curve = &setting->curve;
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_CS_GAIN,
> +			  CMAB(sat->gain_cmab) | CMAD(sat->gain_cmmd));
> +	stf_isp_reg_write(stfcamss, ISP_REG_CS_THRESHOLD,
> +			  CMB(sat->threshold_cmb) | CMD(sat->threshold_cmd));
> +	stf_isp_reg_write(stfcamss, ISP_REG_CS_OFFSET,
> +			  UOFF(sat->offset_u) | VOFF(sat->offset_v));
> +	stf_isp_reg_write(stfcamss, ISP_REG_CS_SCALE, sat->cmsf);
> +	stf_isp_reg_write(stfcamss, ISP_REG_CS_HUE_F,
> +			  COS(hue->cos) | SIN(hue->sin));
> +	stf_isp_reg_write(stfcamss, ISP_REG_YADJ0,
> +			  YIMIN(curve->yi_min) | YOIR(curve->yo_ir));
> +	stf_isp_reg_write(stfcamss, ISP_REG_YADJ1,
> +			  YOMIN(curve->yo_min) | YOMAX(curve->yo_max));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_sharp(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_shrp];
> +	const struct jh7110_isp_sharp_setting *setting =
> +		(const struct jh7110_isp_sharp_setting *)value;
> +	const struct jh7110_isp_sharp_weight *weight = &setting->weight;
> +	const struct jh7110_isp_sharp_strength *strength = &setting->strength;
> +	u32 reg_addr = ISP_REG_SHARPEN0;
> +	u32 i;
> +
> +	for (i = 0; i < 4; i++, reg_addr += 4)
> +		stf_isp_reg_write(stfcamss, reg_addr,
> +				  S_WEIGHT(weight->weight[i]) | S_DELTA(strength->diff[i]));
> +
> +	for (; i < 15; i++, reg_addr += 4)
> +		stf_isp_reg_write(stfcamss, reg_addr, S_WEIGHT(weight->weight[i]));
> +
> +	reg_addr = ISP_REG_SHARPEN_FS0;
> +
> +	for (i = 0; i < 3; i++, reg_addr += 4)
> +		stf_isp_reg_write(stfcamss, reg_addr,
> +				  S_SLOPE(strength->s[i]) | S_FACTOR(strength->f[i]));
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_SHARPEN_WN,
> +			  WSUM(weight->recip_wei_sum) | NDIRF(setting->ndirf) |
> +			  PDIRF(setting->pdirf));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_ycrv(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_ycrv];
> +	const struct jh7110_isp_ycrv_setting *setting =
> +		(const struct jh7110_isp_ycrv_setting *)value;
> +	const struct jh7110_isp_ycrv_curve *curve = &setting->curve;
> +	u32 reg_addr = ISP_REG_YCURVE_0;
> +	u32 i;
> +
> +	for (i = 0; i < 64; i++, reg_addr += 4)
> +		stf_isp_reg_write(stfcamss, reg_addr, curve->y[i]);
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
> +}
> +
> +int isp_set_ctrl_sc(struct stfcamss *stfcamss, const void *value)
> +{
> +	const struct stf_isp_module_info *reg_info = &mod_info[imi_sc];
> +	const struct jh7110_isp_sc_setting *setting =
> +		(const struct jh7110_isp_sc_setting *)value;
> +	const struct jh7110_isp_sc_config *crop = &setting->crop_config;
> +	const struct jh7110_isp_sc_af_config *af = &setting->af_config;
> +	const struct jh7110_isp_sc_awb_config *awb = &setting->awb_config;
> +	const struct jh7110_isp_sc_awb_ps *awb_ps = &awb->ps_config;
> +	const struct jh7110_isp_sc_awb_ws *awb_ws = &awb->ws_config;
> +	const struct jh7110_isp_sc_awb_point *pts = awb->pts;
> +	u32 reg_addr0, reg_addr1;
> +	u32 i;
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_SCD_CFG_1, AXI_ID(1));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_0,
> +			  HSTART(crop->h_start) | VSTART(crop->v_start));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_1,
> +			  SC_WIDTH(crop->sw_width) | SC_HEIGHT(crop->sw_height) |
> +			  AWB_PS_GRB_BA(awb->awb_ps_grb_ba) | SEL_TYPE(awb->sel));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_DEC,
> +			  SC_DEC_H_PERIOD(crop->hperiod) | SC_DEC_H_KEEP(crop->hkeep) |
> +			  SC_DEC_V_PERIOD(crop->vperiod) | SC_DEC_V_KEEP(crop->vkeep));
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_0,
> +			  AWB_PS_RL(awb_ps->awb_ps_rl) | AWB_PS_RU(awb_ps->awb_ps_ru) |
> +			  AWB_PS_GL(awb_ps->awb_ps_gl) | AWB_PS_GU(awb_ps->awb_ps_gu));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_1,
> +			  AWB_PS_BL(awb_ps->awb_ps_bl) | AWB_PS_BU(awb_ps->awb_ps_bu) |
> +			  AWB_PS_YL(awb_ps->awb_ps_yl) | AWB_PS_YU(awb_ps->awb_ps_yu));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_2,
> +			  AWB_PS_GRL(awb_ps->awb_ps_grl) | AWB_PS_GRU(awb_ps->awb_ps_gru));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_3,
> +			  AWB_PS_GBL(awb_ps->awb_ps_gbl) | AWB_PS_GBU(awb_ps->awb_ps_gbu));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_4,
> +			  AWB_PS_GRBL(awb_ps->awb_ps_grbl) | AWB_PS_GRBU(awb_ps->awb_ps_grbu));
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AF,
> +			  AF_ES_HM(af->es_hor_mode) | AF_ES_SM(af->es_sum_mode) |
> +			  AF_ES_HE(af->hor_en) | AF_ES_VE(af->ver_en) |
> +			  AF_ES_VTHR(af->es_ver_thr) | AF_ES_HTHR(af->es_hor_thr));
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_CFG_0,
> +			  AWB_WS_RL(awb_ws->awb_ws_rl) | AWB_WS_RU(awb_ws->awb_ws_ru) |
> +			  AWB_WS_GRL(awb_ws->awb_ws_grl) | AWB_WS_GRU(awb_ws->awb_ws_gru));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_CFG_1,
> +			  AWB_WS_GBL(awb_ws->awb_ws_gbl) | AWB_WS_GBU(awb_ws->awb_ws_gbu) |
> +			  AWB_WS_BL(awb_ws->awb_ws_bl) | AWB_WS_BU(awb_ws->awb_ws_bu));
> +
> +	reg_addr0 = ISP_REG_SC_AWB_WS_CW0_CFG_0;
> +	reg_addr1 = ISP_REG_SC_AWB_WS_CW0_CFG_1;
> +
> +	for (i = 0; i < 13; i++, reg_addr0 += 8, reg_addr1 += 8) {
> +		stf_isp_reg_write(stfcamss, reg_addr0,
> +				  AWB_WS_CW_W_0(awb->awb_cw[13 * i]) |
> +				  AWB_WS_CW_W_1(awb->awb_cw[13 * i + 1]) |
> +				  AWB_WS_CW_W_2(awb->awb_cw[13 * i + 2]) |
> +				  AWB_WS_CW_W_3(awb->awb_cw[13 * i + 3]) |
> +				  AWB_WS_CW_W_4(awb->awb_cw[13 * i + 4]) |
> +				  AWB_WS_CW_W_5(awb->awb_cw[13 * i + 5]) |
> +				  AWB_WS_CW_W_6(awb->awb_cw[13 * i + 6]) |
> +				  AWB_WS_CW_W_7(awb->awb_cw[13 * i + 7]));
> +		stf_isp_reg_write(stfcamss, reg_addr1,
> +				  AWB_WS_CW_W_0(awb->awb_cw[13 * i + 8]) |
> +				  AWB_WS_CW_W_1(awb->awb_cw[13 * i + 9]) |
> +				  AWB_WS_CW_W_2(awb->awb_cw[13 * i + 10]) |
> +				  AWB_WS_CW_W_3(awb->awb_cw[13 * i + 11]) |
> +				  AWB_WS_CW_W_4(awb->awb_cw[13 * i + 12]));
> +	}
> +
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWV_CFG_0,
> +			  AWB_WS_IW_V_0(pts[0].weight) | AWB_WS_IW_V_1(pts[1].weight) |
> +			  AWB_WS_IW_V_2(pts[2].weight) | AWB_WS_IW_V_3(pts[3].weight) |
> +			  AWB_WS_IW_V_4(pts[4].weight) | AWB_WS_IW_V_5(pts[5].weight) |
> +			  AWB_WS_IW_V_6(pts[6].weight) | AWB_WS_IW_V_7(pts[7].weight));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWV_CFG_1,
> +			  AWB_WS_IW_V_0(pts[8].weight) | AWB_WS_IW_V_1(pts[9].weight) |
> +			  AWB_WS_IW_V_2(pts[10].weight) | AWB_WS_IW_V_3(pts[11].weight) |
> +			  AWB_WS_IW_V_4(pts[12].weight) | AWB_WS_IW_V_5(pts[13].weight) |
> +			  AWB_WS_IW_V_6(pts[14].weight) | AWB_WS_IW_V_7(pts[15].weight));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWS_CFG_0,
> +			  AWB_WS_IW_S_0(2 * (pts[1].weight - pts[0].weight)) |
> +			  AWB_WS_IW_S_1(2 * (pts[2].weight - pts[1].weight)) |
> +			  AWB_WS_IW_S_2(2 * (pts[3].weight - pts[2].weight)) |
> +			  AWB_WS_IW_S_3(2 * (pts[4].weight - pts[3].weight)));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWS_CFG_1,
> +			  AWB_WS_IW_S_0(2 * (pts[5].weight - pts[4].weight)) |
> +			  AWB_WS_IW_S_1(2 * (pts[6].weight - pts[5].weight)) |
> +			  AWB_WS_IW_S_2(2 * (pts[7].weight - pts[6].weight)) |
> +			  AWB_WS_IW_S_3(2 * (pts[8].weight - pts[7].weight)));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWS_CFG_2,
> +			  AWB_WS_IW_S_0(2 * (pts[9].weight - pts[8].weight)) |
> +			  AWB_WS_IW_S_1(2 * (pts[10].weight - pts[9].weight)) |
> +			  AWB_WS_IW_S_2(2 * (pts[11].weight - pts[10].weight)) |
> +			  AWB_WS_IW_S_3(2 * (pts[12].weight - pts[11].weight)));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWS_CFG_3,
> +			  AWB_WS_IW_S_0(2 * (pts[13].weight - pts[12].weight)) |
> +			  AWB_WS_IW_S_1(2 * (pts[14].weight - pts[13].weight)) |
> +			  AWB_WS_IW_S_2(2 * (pts[15].weight - pts[14].weight)) |
> +			  AWB_WS_IW_S_3(2 * (pts[16].weight - pts[15].weight)));
> +
> +	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
> +			    setting->enabled ? 1 << reg_info->en_nbit : 0);
> +
> +	return 0;
>  }
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
> index 76ea943bfe98..80c4571dc522 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.h
> +++ b/drivers/staging/media/starfive/camss/stf-isp.h
> @@ -124,6 +124,44 @@
>  #define SC_HEIGHT(n)				((n) << 8)
>  #define SC_WIDTH(n)				((n) << 0)
>
> +#define ISP_REG_SC_AF				0x0c0
> +#define AF_ES_HTHR(n)				((n) << 16)
> +#define AF_ES_VTHR(n)				((n) << 8)
> +#define AF_ES_VE(n)				((n) << 3)
> +#define AF_ES_HE(n)				((n) << 2)
> +#define AF_ES_SM(n)				((n) << 1)
> +#define AF_ES_HM(n)				((n) << 0)
> +
> +#define ISP_REG_SC_AWB_PS_CFG_0			0x0c4
> +#define AWB_PS_GU(n)				((n) << 24)
> +#define AWB_PS_GL(n)				((n) << 16)
> +#define AWB_PS_RU(n)				((n) << 8)
> +#define AWB_PS_RL(n)				((n) << 0)
> +
> +#define ISP_REG_SC_AWB_PS_CFG_1			0x0c8
> +#define AWB_PS_YU(n)				((n) << 24)
> +#define AWB_PS_YL(n)				((n) << 16)
> +#define AWB_PS_BU(n)				((n) << 8)
> +#define AWB_PS_BL(n)				((n) << 0)
> +
> +#define ISP_REG_SC_AWB_PS_CFG_2			0x0cc
> +#define AWB_PS_GRU(n)				((n) << 16)
> +#define AWB_PS_GRL(n)				((n) << 0)
> +
> +#define ISP_REG_SC_AWB_PS_CFG_3			0x0d0
> +#define AWB_PS_GBU(n)				((n) << 16)
> +#define AWB_PS_GBL(n)				((n) << 0)
> +
> +#define ISP_REG_SC_AWB_PS_CFG_4			0x0d4
> +#define AWB_PS_GRBU(n)				((n) << 16)
> +#define AWB_PS_GRBL(n)				((n) << 0)
> +
> +#define ISP_REG_SC_DEC				0x0d8
> +#define SC_DEC_V_KEEP(n)			((n) << 24)
> +#define SC_DEC_V_PERIOD(n)			((n) << 16)
> +#define SC_DEC_H_KEEP(n)			((n) << 8)
> +#define SC_DEC_H_PERIOD(n)			((n) << 0)
> +
>  #define ISP_REG_LCCF_CFG_2			0x0e0
>  #define ISP_REG_LCCF_CFG_3			0x0e4
>  #define ISP_REG_LCCF_CFG_4			0x0e8
> @@ -140,6 +178,8 @@
>  #define ISP_REG_OECF_X0_CFG6			0x118
>  #define ISP_REG_OECF_X0_CFG7			0x11c
>
> +#define ISP_REG_OECF_Y0_CFG0			0x180
> +
>  #define ISP_REG_OECF_Y3_CFG0			0x1e0
>  #define ISP_REG_OECF_Y3_CFG1			0x1e4
>  #define ISP_REG_OECF_Y3_CFG2			0x1e8
> @@ -204,6 +244,49 @@
>  #define OFFSET_B_POINT(x)			((x) << 8)
>  #define OFFSET_A_POINT(x)			((x) << 0)
>
> +#define ISP_REG_SC_AWB_WS_CW0_CFG_0		0x4d0
> +#define ISP_REG_SC_AWB_WS_CW0_CFG_1		0x4d4
> +#define AWB_WS_CW_W_7(x)			((x) << 28)
> +#define AWB_WS_CW_W_6(x)			((x) << 24)
> +#define AWB_WS_CW_W_5(x)			((x) << 20)
> +#define AWB_WS_CW_W_4(x)			((x) << 16)
> +#define AWB_WS_CW_W_3(x)			((x) << 12)
> +#define AWB_WS_CW_W_2(x)			((x) << 8)
> +#define AWB_WS_CW_W_1(x)			((x) << 4)
> +#define AWB_WS_CW_W_0(x)			((x) << 0)
> +
> +#define ISP_REG_SC_AWB_WS_IWV_CFG_0		0x538
> +#define ISP_REG_SC_AWB_WS_IWV_CFG_1		0x53c
> +#define AWB_WS_IW_V_7(x)			((x) << 28)
> +#define AWB_WS_IW_V_6(x)			((x) << 24)
> +#define AWB_WS_IW_V_5(x)			((x) << 20)
> +#define AWB_WS_IW_V_4(x)			((x) << 16)
> +#define AWB_WS_IW_V_3(x)			((x) << 12)
> +#define AWB_WS_IW_V_2(x)			((x) << 8)
> +#define AWB_WS_IW_V_1(x)			((x) << 4)
> +#define AWB_WS_IW_V_0(x)			((x) << 0)
> +
> +#define ISP_REG_SC_AWB_WS_IWS_CFG_0		0x540
> +#define ISP_REG_SC_AWB_WS_IWS_CFG_1		0x544
> +#define ISP_REG_SC_AWB_WS_IWS_CFG_2		0x548
> +#define ISP_REG_SC_AWB_WS_IWS_CFG_3		0x54c
> +#define AWB_WS_IW_S_3(x)			((x) << 24)
> +#define AWB_WS_IW_S_2(x)			((x) << 16)
> +#define AWB_WS_IW_S_1(x)			((x) << 8)
> +#define AWB_WS_IW_S_0(x)			((x) << 0)
> +
> +#define ISP_REG_SC_AWB_WS_CFG_0			0x5d0
> +#define AWB_WS_GRU(n)				((n) << 24)
> +#define AWB_WS_GRL(n)				((n) << 16)
> +#define AWB_WS_RU(n)				((n) << 8)
> +#define AWB_WS_RL(n)				((n) << 0)
> +
> +#define ISP_REG_SC_AWB_WS_CFG_1			0x5d4
> +#define AWB_WS_BU(n)				((n) << 24)
> +#define AWB_WS_BL(n)				((n) << 16)
> +#define AWB_WS_GBU(n)				((n) << 8)
> +#define AWB_WS_GBL(n)				((n) << 0)
> +
>  #define ISP_REG_ISP_CTRL_0			0xa00
>  #define ISPC_LINE				BIT(27)
>  #define ISPC_SC					BIT(26)
> @@ -315,8 +398,19 @@
>  #define CURVE_D_L(n)				((n) << 0)
>
>  #define ISP_REG_ICAMD_0				0xc40
> +#define ISP_REG_ICAMD_1				0xc44
>  #define ISP_REG_ICAMD_12			0xc70
> +#define ISP_REG_ICAMD_13			0xc74
> +#define ISP_REG_ICAMD_14			0xc78
> +#define ISP_REG_ICAMD_15			0xc7c
> +#define ISP_REG_ICAMD_16			0xc80
> +#define ISP_REG_ICAMD_17			0xc84
> +#define ISP_REG_ICAMD_18			0xc88
> +#define ISP_REG_ICAMD_19			0xc8c
>  #define ISP_REG_ICAMD_20			0xc90
> +#define ISP_REG_ICAMD_21			0xc94
> +#define ISP_REG_ICAMD_22			0xc98
> +#define ISP_REG_ICAMD_23			0xc9c
>  #define ISP_REG_ICAMD_24			0xca0
>  #define ISP_REG_ICAMD_25			0xca4
>  #define DNRM_F(n)				((n) << 16)
> @@ -439,6 +533,30 @@ enum stf_isp_pad_id {
>  	STF_ISP_PAD_MAX
>  };
>
> +enum stf_isp_modules_index {
> +	imi_obc = 0,
> +	imi_oecf,
> +	imi_lccf,
> +	imi_awb,
> +	imi_sc,
> +	imi_cfa,
> +	imi_car,
> +	imi_ccm,
> +	imi_gmargb,
> +	imi_r2y,
> +	imi_shrp,
> +	imi_sat,
> +	imi_dnyuv,
> +	imi_ycrv,
> +	imi_ctc,
> +	imi_dbc,
> +};
> +
> +struct stf_isp_module_info {
> +	u32 en_reg;
> +	u8 en_nbit;
> +};
> +
>  struct stf_isp_format {
>  	u32 code;
>  	u8 bpp;
> @@ -478,4 +596,21 @@ int stf_isp_params_register(struct stfcamss_video *video,
>  			    struct v4l2_device *v4l2_dev,
>  			    const char *name);
>
> +int isp_set_ctrl_wb(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_car(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_ccm(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_cfa(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_ctc(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_dbc(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_dnyuv(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_gmargb(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_lccf(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_obc(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_oecf(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_r2y(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_sat(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_sharp(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_ycrv(struct stfcamss *stfcamss, const void *value);
> +int isp_set_ctrl_sc(struct stfcamss *stfcamss, const void *value);
> +
>  #endif /* STF_ISP_H */
> --
> 2.25.1
>
>

