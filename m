Return-Path: <linux-media+bounces-15963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827FE94B6C6
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 08:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D434285790
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 06:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F15187853;
	Thu,  8 Aug 2024 06:32:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A049181328
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723098723; cv=none; b=BX1CDUxDGkcCucJ3yAv9GKSzWGKbWX8BWcBw3m7LABPDzSaqNPCqixaKVe9k4Tmb1ZxgdWfuA6B6NCuYKDLPXulFTSNqmhDkxhwrPqO3AZIOJlK7Ur5PQIxxb9g34/WlHg3HzMIQ2hcof/98h41A+fdliNi0m3wrJrT4ExvvnCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723098723; c=relaxed/simple;
	bh=zGxO/HSqETc6g0XQOPA1oQdwUTsa711T+LWX6UV5A30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITDr/2AOo7b6QrmbHdOjhydHoB4O68qSP/oEqBK3FLxJdl9iQmpTyz7YyCM/A3zOouAyZqsDrcR/zQIk7zH9/XHyF0CNl/HRmAHuI8WpgGfaNaFB8sdfhVMgvHND/gllGlfTVfWwjBVme2LQO7Z1RHZjeIJX/MsI9ffZ5HeV1UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E97C32782;
	Thu,  8 Aug 2024 06:32:00 +0000 (UTC)
Message-ID: <5497762f-5959-4890-b02a-176377042387@xs4all.nl>
Date: Thu, 8 Aug 2024 08:31:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/12] media: uapi: rkisp1-config: Add extensible
 params format
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240807212253.1667847-1-jacopo.mondi@ideasonboard.com>
 <20240807212253.1667847-2-jacopo.mondi@ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240807212253.1667847-2-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2024 23:22, Jacopo Mondi wrote:
> Add to the rkisp1-config.h header data types and documentation of
> the extensible parameters format.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/uapi/linux/rkisp1-config.h | 485 +++++++++++++++++++++++++++++
>  1 file changed, 485 insertions(+)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 6eeaf8bf2362..14a23fd9a745 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -996,4 +996,489 @@ struct rkisp1_stat_buffer {
>  	struct rkisp1_cif_isp_stat params;
>  };
>  
> +/*---------- PART3: Extensible Configuration Parameters  ------------*/
> +
> +/**
> + * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
> + *
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS: Black level subtraction
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC: Defect pixel cluster correction
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG: Sensor de-gamma
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN: Auto white balance gains
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT: ISP filtering
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM: Bayer de-mosaic
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK: Cross-talk correction
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC: Gamma out correction
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF: De-noise pre-filter
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH: De-noise pre-filter strength
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC: Color processing
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_IE: Image effects
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC: Lens shading correction
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS: Auto white balance statistics
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
> + */
> +enum rkisp1_ext_params_block_type {
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_IE,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> +};
> +
> +#define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> +#define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
> +
> +/**
> + * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
> + *					   header
> + *
> + * This structure represents the common part of all the ISP configuration
> + * blocks. Each parameters block shall embed an instance of this structure type
> + * as its first member, followed by the block-specific configuration data. The
> + * driver inspects this common header to discern the block type and its size and
> + * properly handle the block content by casting it to the correct block-specific
> + * type.
> + *
> + * The @type field is one of the values enumerated by
> + * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
> + * interpreted by the driver. The @size field specifies the size of the
> + * parameters block and is used by the driver for validation purposes.
> + *
> + * The @flags field is a bitmask of per-block flags RKISP1_EXT_PARAMS_FL_*.
> + *
> + * When userspace wants to configure and enable an ISP block it shall fully
> + * populate the block configuration and set the
> + * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE bit in the @flags field.
> + *
> + * When userspace simply wants to disable an ISP block the
> + * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bit should be set in @flags field. The
> + * driver ignores the rest of the block configuration structure in this case.
> + *
> + * If a new configuration of an ISP block has to be applied userspace shall
> + * fully populate the ISP block configuration and omit setting the
> + * RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits
> + * in the @flags field.
> + *
> + * Setting both the RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE and
> + * RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE bits in the @flags field is not allowed
> + * and not accepted by the driver.
> + *
> + * Userspace is responsible for correctly populating the parameters block header
> + * fields (@type, @flags and @size) and the block-specific parameters.
> + *
> + * For example:
> + *
> + * .. code-block:: c
> + *
> + *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
> + *		struct rkisp1_ext_params_bls_config *bls =
> + *			(struct rkisp1_ext_params_bls_config *)block;
> + *
> + *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
> + *		bls->header.flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;
> + *		bls->header.size = sizeof(*bls);
> + *
> + *		bls->config.enable_auto = 0;
> + *		bls->config.fixed_val.r = blackLevelRed_;
> + *		bls->config.fixed_val.gr = blackLevelGreenR_;
> + *		bls->config.fixed_val.gb = blackLevelGreenB_;
> + *		bls->config.fixed_val.b = blackLevelBlue_;
> + *	}
> + *
> + * @type: The parameters block type, see
> + *	  :c:type:`rkisp1_ext_params_block_type`
> + * @flags: A bitmask of block flags
> + * @size: Size (in bytes) of the parameters block, including this header
> + */
> +struct rkisp1_ext_params_block_header {
> +	__u16 type;
> +	__u16 flags;
> +	__u32 size;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
> + *
> + * RkISP1 extensible parameters Black Level Subtraction configuration block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Black Level Subtraction configuration, see
> + *	    :c:type:`rkisp1_cif_isp_bls_config`
> + */
> +struct rkisp1_ext_params_bls_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_bls_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_dpcc_config - RkISP1 extensible params DPCC config
> + *
> + * RkISP1 extensible parameters Defective Pixel Cluster Correction configuration
> + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Defective Pixel Cluster Correction configuration, see
> + *	    :c:type:`rkisp1_cif_isp_dpcc_config`
> + */
> +struct rkisp1_ext_params_dpcc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_dpcc_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_sdg_config - RkISP1 extensible params SDG config
> + *
> + * RkISP1 extensible parameters Sensor Degamma configuration block. Identified
> + * by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Sensor Degamma configuration, see
> + *	    :c:type:`rkisp1_cif_isp_sdg_config`
> + */
> +struct rkisp1_ext_params_sdg_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_sdg_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_lsc_config - RkISP1 extensible params LSC config
> + *
> + * RkISP1 extensible parameters Lens Shading Correction configuration block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Lens Shading Correction configuration, see
> + *	    :c:type:`rkisp1_cif_isp_lsc_config`
> + */
> +struct rkisp1_ext_params_lsc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_lsc_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_awb_gain_config - RkISP1 extensible params AWB
> + *					      gain config
> + *
> + * RkISP1 extensible parameters Auto-White Balance Gains configuration block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Auto-White Balance Gains configuration, see
> + *	    :c:type:`rkisp1_cif_isp_awb_gain_config`
> + */
> +struct rkisp1_ext_params_awb_gain_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_awb_gain_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_flt_config - RkISP1 extensible params FLT config
> + *
> + * RkISP1 extensible parameters Filter configuration block. Identified by
> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Filter configuration, see :c:type:`rkisp1_cif_isp_flt_config`
> + */
> +struct rkisp1_ext_params_flt_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_flt_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_bdm_config - RkISP1 extensible params BDM config
> + *
> + * RkISP1 extensible parameters Demosaicing configuration block. Identified by
> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Demosaicing configuration, see :c:type:`rkisp1_cif_isp_bdm_config`
> + */
> +struct rkisp1_ext_params_bdm_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_bdm_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_ctk_config - RkISP1 extensible params CTK config
> + *
> + * RkISP1 extensible parameters Cross-Talk configuration block. Identified by
> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Cross-Talk configuration, see :c:type:`rkisp1_cif_isp_ctk_config`
> + */
> +struct rkisp1_ext_params_ctk_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_ctk_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_goc_config - RkISP1 extensible params GOC config
> + *
> + * RkISP1 extensible parameters Gamma-Out configuration block. Identified by
> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Gamma-Out configuration, see :c:type:`rkisp1_cif_isp_goc_config`
> + */
> +struct rkisp1_ext_params_goc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_goc_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_dpf_config - RkISP1 extensible params DPF config
> + *
> + * RkISP1 extensible parameters De-noise Pre-Filter configuration block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: De-noise Pre-Filter configuration, see
> + *	    :c:type:`rkisp1_cif_isp_dpf_config`
> + */
> +struct rkisp1_ext_params_dpf_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_dpf_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_dpf_strength_config - RkISP1 extensible params DPF
> + *						  strength config
> + *
> + * RkISP1 extensible parameters De-noise Pre-Filter strength configuration
> + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: De-noise Pre-Filter strength configuration, see
> + *	    :c:type:`rkisp1_cif_isp_dpf_strength_config`
> + */
> +struct rkisp1_ext_params_dpf_strength_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_dpf_strength_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_cproc_config - RkISP1 extensible params CPROC config
> + *
> + * RkISP1 extensible parameters Color Processing configuration block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Color processing configuration, see
> + *	    :c:type:`rkisp1_cif_isp_cproc_config`
> + */
> +struct rkisp1_ext_params_cproc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_cproc_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_ie_config - RkISP1 extensible params IE config
> + *
> + * RkISP1 extensible parameters Image Effect configuration block. Identified by
> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_IE`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Image Effect configuration, see :c:type:`rkisp1_cif_isp_ie_config`
> + */
> +struct rkisp1_ext_params_ie_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_ie_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_awb_meas_config - RkISP1 extensible params AWB
> + *					      Meas config
> + *
> + * RkISP1 extensible parameters Auto-White Balance Measurement configuration
> + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Auto-White Balance measure configuration, see
> + *	    :c:type:`rkisp1_cif_isp_awb_meas_config`
> + */
> +struct rkisp1_ext_params_awb_meas_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_awb_meas_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Histogram config
> + *
> + * RkISP1 extensible parameters Histogram statistics configuration block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Histogram statistics configuration, see
> + *	    :c:type:`rkisp1_cif_isp_hst_config`
> + */
> +struct rkisp1_ext_params_hst_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_hst_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_aec_config - RkISP1 extensible params AEC config
> + *
> + * RkISP1 extensible parameters Auto-Exposure statistics configuration block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Auto-Exposure statistics configuration, see
> + *	    :c:type:`rkisp1_cif_isp_aec_config`
> + */
> +struct rkisp1_ext_params_aec_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_aec_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_afc_config - RkISP1 extensible params AFC config
> + *
> + * RkISP1 extensible parameters Auto-Focus statistics configuration block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Auto-Focus statistics configuration, see
> + *	    :c:type:`rkisp1_cif_isp_afc_config`
> + */
> +struct rkisp1_ext_params_afc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_afc_config config;
> +} __attribute__((aligned(8)));
> +
> +#define RKISP1_EXT_PARAMS_MAX_SIZE					\
> +	(sizeof(struct rkisp1_ext_params_bls_config)			+\
> +	sizeof(struct rkisp1_ext_params_dpcc_config)			+\
> +	sizeof(struct rkisp1_ext_params_sdg_config)			+\
> +	sizeof(struct rkisp1_ext_params_lsc_config)			+\
> +	sizeof(struct rkisp1_ext_params_awb_gain_config)		+\
> +	sizeof(struct rkisp1_ext_params_flt_config)			+\
> +	sizeof(struct rkisp1_ext_params_bdm_config)			+\
> +	sizeof(struct rkisp1_ext_params_ctk_config)			+\
> +	sizeof(struct rkisp1_ext_params_goc_config)			+\
> +	sizeof(struct rkisp1_ext_params_dpf_config)			+\
> +	sizeof(struct rkisp1_ext_params_dpf_strength_config)		+\
> +	sizeof(struct rkisp1_ext_params_cproc_config)			+\
> +	sizeof(struct rkisp1_ext_params_ie_config)			+\
> +	sizeof(struct rkisp1_ext_params_awb_meas_config)		+\
> +	sizeof(struct rkisp1_ext_params_hst_config)			+\
> +	sizeof(struct rkisp1_ext_params_aec_config)			+\
> +	sizeof(struct rkisp1_ext_params_afc_config))
> +
> +/**
> + * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
> + *
> + * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible parameters
> + */
> +enum rksip1_ext_param_buffer_version {
> +	RKISP1_EXT_PARAM_BUFFER_V1 = 1,

I see no check against this in the rkisp1 code. Shouldn't this be checked?
If the version is unsupported, then just return an error.

Also, how does userspace know which version(s) is/are supported by the driver?

Regards,

	Hans

> +};
> +
> +/**
> + * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
> + *
> + * This struct contains the configuration parameters of the RkISP1 ISP
> + * algorithms, serialized by userspace into a data buffer. Each configuration
> + * parameter block is represented by a block-specific structure which contains a
> + * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
> + * populates the @data buffer with configuration parameters for the blocks that
> + * it intends to configure. As a consequence, the data buffer effective size
> + * changes according to the number of ISP blocks that userspace intends to
> + * configure and is set by userspace in the @data_size field.
> + *
> + * The parameters buffer is versioned by the @version field to allow modifying
> + * and extending its definition. Userspace shall populate the @version field to
> + * inform the driver about the version it intends to use. The driver will parse
> + * and handle the @data buffer according to the data layout specific to the
> + * indicated version and return an error if the desired version is not
> + * supported.
> + *
> + * For each ISP block that userspace wants to configure, a block-specific
> + * structure is appended to the @data buffer, one after the other without gaps
> + * in between nor overlaps. Userspace shall populate the @data_size field with
> + * the effective size, in bytes, of the @data buffer.
> + *
> + * The expected memory layout of the parameters buffer is::
> + *
> + *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
> + *	| version = RKISP_EXT_PARAMS_BUFFER_V1;                               |
> + *	| data_size = sizeof(struct rkisp1_ext_params_bls_config)             |
> + *	|           + sizeof(struct rkisp1_ext_params_dpcc_config);           |
> + *	| +------------------------- data  ---------------------------------+ |
> + *	| | +------------- struct rkisp1_ext_params_bls_config -----------+ | |
> + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
> + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS;                | | | |
> + *	| | | | flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;              | | | |
> + *	| | | | size = sizeof(struct rkisp1_ext_params_bls_config);     | | | |
> + *	| | | +---------------------------------------------------------+ | | |
> + *	| | | +---------- struct rkisp1_cif_isp_bls_config -------------+ | | |
> + *	| | | | enable_auto = 0;                                        | | | |
> + *	| | | | fixed_val.r = 256;                                      | | | |
> + *	| | | | fixed_val.gr = 256;                                     | | | |
> + *	| | | | fixed_val.gb = 256;                                     | | | |
> + *	| | | | fixed_val.b = 256;                                      | | | |
> + *	| | | +---------------------------------------------------------+ | | |
> + *	| | +------------ struct rkisp1_ext_params_dpcc_config -----------+ | |
> + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
> + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC;               | | | |
> + *	| | | | flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;              | | | |
> + *	| | | | size = sizeof(struct rkisp1_ext_params_dpcc_config);    | | | |
> + *	| | | +---------------------------------------------------------+ | | |
> + *	| | | +---------- struct rkisp1_cif_isp_dpcc_config ------------+ | | |
> + *	| | | | mode = RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE;          | | | |
> + *	| | | | output_mode =                                           | | | |
> + *	| | | |   RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_G_CENTER; | | | |
> + *	| | | | set_use = ... ;                                         | | | |
> + *	| | | | ...  = ... ;                                            | | | |
> + *	| | | +---------------------------------------------------------+ | | |
> + *	| | +-------------------------------------------------------------+ | |
> + *	| +-----------------------------------------------------------------+ |
> + *	+---------------------------------------------------------------------+
> + *
> + * @version: The RkISP1 extensible parameters buffer version, see
> + *	     :c:type:`rksip1_ext_param_buffer_version`
> + * @data_size: The RkISP1 configuration data effective size, excluding this
> + *	       header
> + * @data: The RkISP1 extensible configuration data blocks
> + */
> +struct rkisp1_ext_params_cfg {
> +	__u32 version;
> +	__u32 data_size;
> +	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
> +};
> +
>  #endif /* _UAPI_RKISP1_CONFIG_H */


