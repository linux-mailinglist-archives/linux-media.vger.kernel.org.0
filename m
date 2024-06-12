Return-Path: <linux-media+bounces-13020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B6B904FF6
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 12:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCD7C1F242BC
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2FE16DED4;
	Wed, 12 Jun 2024 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="opczECFa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD71B16D9D0
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186585; cv=none; b=Hv0mMQgOHN62akRqaGpQp2omMPepotNEIMpx0B8V0anpbuN9fWRMM95qq0852cDIhOKt+8iZsFz9IjO6VFaIyfdb1OxFf5kXukWuKqFujAnPmRVMuOQnkcN+IHZx1v/O2uLpMGTqQiU2eo6eiQzZtzJE7CBlb8diwgdAqWyMUhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186585; c=relaxed/simple;
	bh=YI/U9e3uRxlXQ06JDFq+6/VY0dcA1yNysvbMuYRCQPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3Z6W/+NS7PYlM9DPJmufpkQtLbUSahKMcazdI/4fCCFKatTfSLR0Didk7d/HFiRFxodNw54tJQVFt35IZT6tpGx0bViJ5xzN4W4HyO2an+/bbbaRe7FgctaIo8DD50w4zOfjATtm6DSFyoKEdeL/Gufeh1/Kz/As+R9C+MitVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=opczECFa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFBD44AB;
	Wed, 12 Jun 2024 12:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718186568;
	bh=YI/U9e3uRxlXQ06JDFq+6/VY0dcA1yNysvbMuYRCQPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=opczECFaDzTqxufFRJ32xkXogPAius2IQB6S9W+okhqnQKO6KfkxJCeC0HJJmtmRp
	 9q2Va8QJZ4AN5H6z6xIBAoszPFpVRpSeEk5+srlZS+S8os1AuYcHWg0jVFFSXvSR0N
	 IMLbVRcysVxDm0uLQiJ46d/myfucbq6qxj8aQvZQ=
Message-ID: <a6ae49b0-4b2b-47a0-b4cd-bf8cb897640f@ideasonboard.com>
Date: Wed, 12 Jun 2024 11:02:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] uapi: rkisp1-config: Add extensible parameters format
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-2-jacopo.mondi@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240605165434.432230-2-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo - thanks for the patchset

On 05/06/2024 17:54, Jacopo Mondi wrote:
> Add to the rkisp1-config.h header data types and documentation of
> the extensible parameters format.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   include/uapi/linux/rkisp1-config.h | 482 +++++++++++++++++++++++++++++
>   1 file changed, 482 insertions(+)
>
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 6eeaf8bf2362..9c93e536f270 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -996,4 +996,486 @@ struct rkisp1_stat_buffer {
>   	struct rkisp1_cif_isp_stat params;
>   };
>   
> +/*---------- PART3: Extensible Configuration Parameters  ------------*/
> +
> +/**
> + * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
> + *
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS: Black level subtraction
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC: Defect pixel cluster correction
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG: Sensor de-gamma
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS: Auto white balance gains
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT: ISP filtering
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM: Bayer de-mosaic
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK: Cross-talk correction
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC: Gamma out correction
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF: De-noise pre-filter
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGHT: De-noise pre-filter strength
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
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGHT,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_IE,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL,
> +};


Laurent suggested referencing the enum value in the comments for each block in his review of the C55 
series, and I think that that's a good idea - can we do that?


Otherwise, looks good to me:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> +
> +/**
> + * enum rkisp1_ext_params_block_state - RkISP1 extensible parameter block enable
> + *					state flags
> + *
> + * @RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE: Do not change the block power state
> + * @RKISP1_EXT_PARAMS_BLOCK_DISABLE: Disable the HW block
> + * @RKISP1_EXT_PARAMS_BLOCK_ENABLE: Enable the HW block
> + */
> +enum rkisp1_ext_params_block_state {
> +	RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE,
> +	RKISP1_EXT_PARAMS_BLOCK_DISABLE,
> +	RKISP1_EXT_PARAMS_BLOCK_ENABLE,
> +};
> +
> +/**
> + * struct rkisp1_ext_params_block_header - RkISP1 extensible parameter block
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
> + * The @state field specifies if the ISP block power state should be changed,
> + * and, if it has to, if it has to be enabled to disabled. The possible
> + * states are enumerated by :c:type:`rkisp1_ext_params_block_state`.
> + * When userspace needs to configure and enable an ISP block it shall fully
> + * populate the block configuration and the @state flag shall be set to
> + * RKISP1_EXT_PARAMS_BLOCK_ENABLE. When userspace simply wants to disable the
> + * ISP block the @state flag shall be set to RKISP1_EXT_PARAMS_BLOCK_DISABLE. If
> + * a new configuration of an ISP block should be applied but the power state
> + * doesn't need to be changed, userspace shall fully populate the ISP block
> + * configuration and the @state flag shall be set to
> + * RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE.
> + *
> + * Userspace is responsible for correctly populating the parameters block header
> + * fields (@type, @state and @size) and correctly populate the block-specific
> + * parameters.
> + *
> + * For example:
> + *
> + * .. code-block:: c
> + *
> + *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
> + *		struct rkisp1_ext_params_bls_config *bls =
> + *			(struct rkisp1_ext_params_bls_config *)block;
> + *
> + *		block->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
> + *		block->header.state = RKISP1_EXT_PARAMS_BLOCK_ENABLE;
> + *		block->header.size = sizeof(struct rkisp1_ext_params_bls_config);
> + *
> + *		bls->bls_config.enable_auto = 0;
> + *		bls->bls_config.fixed_val.r = blackLevelRed_;
> + *		bls->bls_config.fixed_val.gr = blackLevelGreenR_;
> + *		bls->bls_config.fixed_val.gb = blackLevelGreenB_;
> + *		bls->bls_config.fixed_val.b = blackLevelBlue_;
> + *	}
> + *
> + * @type: The parameters block type, see
> + *	  :c:type:`rkisp1_ext_params_block_type`
> + * @state: The block enable state flag, see
> + *	   :c:type:`rkisp1_ext_params_block_state`
> + * @size: Size (in bytes) of the parameters block, including this header
> + */
> +struct rkisp1_ext_params_block_header {
> +	__u32 type;
> +	__u32 state;
> +	__u64 size;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
> + *
> + * RkISP1 extensible parameters Black Level Subtraction configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @bls_config: Black Level Subtraction configuration, see
> + *		:c:type:`rkisp1_cif_isp_bls_config`
> + */
> +struct rkisp1_ext_params_bls_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_bls_config bls_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_dpcc_config - RkISP1 extensible params DPCC config
> + *
> + * RkISP1 extensible parameters Defective Pixel Cluster Correction configuration
> + * block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @dpcc_config: Defective Pixel Cluster Correction configuration, see
> + *		 :c:type:`rkisp1_cif_isp_dpcc_config`
> + */
> +struct rkisp1_ext_params_dpcc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_dpcc_config dpcc_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_sdg_config - RkISP1 extensible params SDG config
> + *
> + * RkISP1 extensible parameters Sensor Degamma configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @sdg_config: Sensor Degamma configuration, see
> + *		:c:type:`rkisp1_cif_isp_sdg_config`
> + */
> +struct rkisp1_ext_params_sdg_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_sdg_config sdg_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_lsc_config - RkISP1 extensible params LSC config
> + *
> + * RkISP1 extensible parameters Lens Shading Correction configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @lsc_config: Lens Shading Correction configuration, see
> + *		:c:type:`rkisp1_cif_isp_lsc_config`
> + */
> +struct rkisp1_ext_params_lsc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_lsc_config lsc_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_awb_gain_config - RkISP1 extensible params AWB
> + *					      gain config
> + *
> + * RkISP1 extensible parameters Auto-White Balance Gains configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @awb_config: Auto-White Balance Gains configuration, see
> + *		:c:type:`rkisp1_cif_isp_awb_gain_config`
> + */
> +struct rkisp1_ext_params_awb_gain_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_awb_gain_config awb_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_flt_config - RkISP1 extensible params FLT config
> + *
> + * RkISP1 extensible parameters Filter configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @flt_config: Filter configuration, see
> + *		:c:type:`rkisp1_cif_isp_flt_config`
> + */
> +struct rkisp1_ext_params_flt_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_flt_config flt_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_bdm_config - RkISP1 extensible params BDM config
> + *
> + * RkISP1 extensible parameters Demosaicing configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @bdm_config: Demosaicing configuration, see
> + *		:c:type:`rkisp1_cif_isp_bdm_config`
> + */
> +struct rkisp1_ext_params_bdm_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_bdm_config bdm_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_ctk_config - RkISP1 extensible params CTK config
> + *
> + * RkISP1 extensible parameters Cross-Talk configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @ctk_config: Cross-Talk configuration, see
> + *		:c:type:`rkisp1_cif_isp_ctk_config`
> + */
> +struct rkisp1_ext_params_ctk_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_ctk_config ctk_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_goc_config - RkISP1 extensible params GOC config
> + *
> + * RkISP1 extensible parameters Gamma-Out configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @goc_config: Gamma-Out configuration, see
> + *		:c:type:`rkisp1_cif_isp_goc_config`
> + */
> +struct rkisp1_ext_params_goc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_goc_config goc_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_dpf_config - RkISP1 extensible params DPF config
> + *
> + * RkISP1 extensible parameters De-noise Pre-Filter configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @dpf_config: De-noise Pre-Filter configuration, see
> + *		:c:type:`rkisp1_cif_isp_dpf_config`
> + */
> +struct rkisp1_ext_params_dpf_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_dpf_config dpf_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_dpf_strength_config - RkISP1 extensible params DPF
> + *						  strength config
> + *
> + * RkISP1 extensible parameters De-noise Pre-Filter strength configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @dpf_strength_config: De-noise Pre-Filter strength configuration, see
> + *			 :c:type:`rkisp1_cif_isp_dpf_strength_config`
> + */
> +struct rkisp1_ext_params_dpf_strength_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_dpf_strength_config dpf_strength_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_cproc_config - RkISP1 extensible params CPROC config
> + *
> + * RkISP1 extensible parameters Color Processing configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @cproc_config: Color processing configuration, see
> + *		  :c:type:`rkisp1_cif_isp_cproc_config`
> + */
> +struct rkisp1_ext_params_cproc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_cproc_config cproc_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_ie_config - RkISP1 extensible params IE config
> + *
> + * RkISP1 extensible parameters Image Effect configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @ie_config: Image Effect configuration, see
> + *	       :c:type:`rkisp1_cif_isp_ie_config`
> + */
> +struct rkisp1_ext_params_ie_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_ie_config ie_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_awb_meas_config - RkISP1 extensible params AWB
> + *					      Meas config
> + *
> + * RkISP1 extensible parameters Auto-White Balance Measurement configuration
> + * block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @awb_meas_config: Auto-White Balance measure configuration, see
> + *		     :c:type:`rkisp1_cif_isp_awb_meas_config`
> + */
> +struct rkisp1_ext_params_awb_meas_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_awb_meas_config awb_meas_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Histogram config
> + *
> + * RkISP1 extensible parameters Histogram statistics configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @hst_config: Histogram statistics configuration, see
> + *		:c:type:`rkisp1_cif_isp_hst_config`
> + */
> +struct rkisp1_ext_params_hst_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_hst_config hst_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_aec_config - RkISP1 extensible params AEC config
> + *
> + * RkISP1 extensible parameters Auto-Exposure statistics configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @aec_config: Auto-Exposure statistics configuration, see
> + *		:c:type:`rkisp1_cif_isp_aec_config`
> + */
> +struct rkisp1_ext_params_aec_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_aec_config aec_config;
> +};
> +
> +/**
> + * struct rkisp1_ext_params_afc_config - RkISP1 extensible params AFC config
> + *
> + * RkISP1 extensible parameters Auto-Focus statistics configuration block
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @afc_config: Auto-Focus statistics configuration, see
> + *		:c:type:`rkisp1_cif_isp_afc_config`
> + */
> +struct rkisp1_ext_params_afc_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_afc_config afc_config;
> +};
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
> + * configure and is set by userspace in the @total_size field.
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
> + * in between nor overlaps. Userspace shall populate the @total_size field with
> + * the effective size, in bytes, of the @data buffer.
> + *
> + * The expected memory layout of the parameters buffer is::
> + *
> + *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
> + *	| version = RKISP_EXT_PARAMS_BUFFER_V1;                               |
> + *	| total_size = sizeof(struct rkisp1_ext_params_bls_config)            |
> + *	|              sizeof(struct rkisp1_ext_params_dpcc_config);          |
> + *	| +------------------------- data  ---------------------------------+ |
> + *	| | +------------- struct rkisp1_ext_params_bls_config -----------+ | |
> + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
> + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS;                | | | |
> + *	| | | | state = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                 | | | |
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
> + *	| | | | state = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                 | | | |
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
> + * @total_size: The RkISP1 configuration data effective size, excluding this
> + *		header
> + * @data: The RkISP1 extensible configuration data blocks
> + */
> +struct rkisp1_ext_params_cfg {
> +	__u32 version;
> +	__u64 total_size;
> +	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
> +};
> +
>   #endif /* _UAPI_RKISP1_CONFIG_H */

