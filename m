Return-Path: <linux-media+bounces-15924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C3A94A807
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 14:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AFDF1F286B0
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 12:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4961E6734;
	Wed,  7 Aug 2024 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RzbqsbG/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D081C824B
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034749; cv=none; b=SN06MLew2D6wRfe+t2L/OiEWnDirlzJcO3XyTfc/6Q5F0WDIIDXbFdp6QHYKVuJz8iAhARYxHQxVEHghIHcLYAGk+Rz1fodK+xGxid5J1hl25KaKLuvgmfAHj2Et2HaUYaOekmHrxHG0ogg1QXZmBZChCmTDPp1xlrAC0D5RnXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034749; c=relaxed/simple;
	bh=rTsXsGkm2rXB/Lid8LSvvwTKAImnHGUeIDe1XQ2l5t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfSpQHuyRisxKiw4kgmlmrRVQ6KybFUeIhdbz8fDu30MI5DoQp79xvkXDy4dZRtoulF8EGvsHgHlmX9PJlogWeNwUkI9NkuSW7qXbQ3M/2MnqaXyCZ1kV2e6eyoBSjV7t8P5PadK6TdW0sA78KHNQqT/nRgx/n9GfDieUlK/G7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RzbqsbG/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-150-234-175.cust.vodafonedsl.it [93.150.234.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 002502EC;
	Wed,  7 Aug 2024 14:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723034691;
	bh=rTsXsGkm2rXB/Lid8LSvvwTKAImnHGUeIDe1XQ2l5t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzbqsbG/2/14UVtlqcO6rCP0OeaZdEsq6yJ8WxA+pbFvNEyBYbb5AlZ5zHdZ/gNNa
	 bTkN5xYfChCgS1//VSiCxU5VZltBRTM2C4A3/kBBAdIBrT7KH4H43G6xvXpty0r9BI
	 4PemasHaEQjniNL9hy4Byq7OzOvEpTa2bZ5ZeT88=
Date: Wed, 7 Aug 2024 14:45:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v8 01/12] media: uapi: rkisp1-config: Add extensible
 params format
Message-ID: <c6ifbfrubk5cjl7sgywe7jk6vgc4lm6ekvkez72mj543pqx7d4@bjlp5a5ad7ln>
References: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
 <20240806145110.918843-2-jacopo.mondi@ideasonboard.com>
 <f13ba5a2-2f81-481c-bc89-899029d32962@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f13ba5a2-2f81-481c-bc89-899029d32962@xs4all.nl>

Hi Hans

On Wed, Aug 07, 2024 at 10:14:44AM GMT, Hans Verkuil wrote:
> On 06/08/2024 16:50, Jacopo Mondi wrote:
> > Add to the rkisp1-config.h header data types and documentation of
> > the extensible parameters format.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> > Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/uapi/linux/rkisp1-config.h | 494 +++++++++++++++++++++++++++++
> >  1 file changed, 494 insertions(+)
> >
> > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > index 6eeaf8bf2362..552da5fd9f95 100644
> > --- a/include/uapi/linux/rkisp1-config.h
> > +++ b/include/uapi/linux/rkisp1-config.h
> > @@ -996,4 +996,498 @@ struct rkisp1_stat_buffer {
> >  	struct rkisp1_cif_isp_stat params;
> >  };
> >
> > +/*---------- PART3: Extensible Configuration Parameters  ------------*/
> > +
> > +/**
> > + * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
> > + *
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS: Black level subtraction
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC: Defect pixel cluster correction
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG: Sensor de-gamma
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN: Auto white balance gains
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT: ISP filtering
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM: Bayer de-mosaic
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK: Cross-talk correction
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC: Gamma out correction
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF: De-noise pre-filter
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH: De-noise pre-filter strength
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC: Color processing
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_IE: Image effects
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC: Lens shading correction
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS: Auto white balance statistics
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
> > + */
> > +enum rkisp1_ext_params_block_type {
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_IE,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> > +};
> > +
> > +/**
> > + * enum rkisp1_ext_params_block_flags - RkISP1 extensible parameters block flags
> > + *
> > + * @RKISP1_EXT_PARAMS_BLOCK_DISABLE: Disable the HW block
> > + * @RKISP1_EXT_PARAMS_BLOCK_ENABLE: Enable the HW block
> > + */
> > +enum rkisp1_ext_params_block_flags {
> > +	RKISP1_EXT_PARAMS_BLOCK_DISABLE	= 0x1,
> > +	RKISP1_EXT_PARAMS_BLOCK_ENABLE	= 0x2,
> > +};
>
> I'm very confused. Are these bit positions or actual values?
> I.e., do you use this as:
>
> 	flags = (1 << RKISP1_EXT_PARAMS_BLOCK_DISABLE);
>
> or:
>
> 	flags = RKISP1_EXT_PARAMS_BLOCK_DISABLE;
>
> ?
>
> I think it is the first, but IMHO that is a bit unexpected. It is much more usual

I was aiming at the latter actually

> to have defines for this:
>
> #define RKISP1_EXT_PARAMS_BLOCK_FL_DISABLE (1U << 0)
> #define RKISP1_EXT_PARAMS_BLOCK_FL_ENABLE (1U << 1)
>

ack, and I'll take the _FL_ in the name in

> > +
> > +/**
> > + * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
> > + *					   header
> > + *
> > + * This structure represents the common part of all the ISP configuration
> > + * blocks. Each parameters block shall embed an instance of this structure type
> > + * as its first member, followed by the block-specific configuration data. The
> > + * driver inspects this common header to discern the block type and its size and
> > + * properly handle the block content by casting it to the correct block-specific
> > + * type.
> > + *
> > + * The @type field is one of the values enumerated by
> > + * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
> > + * interpreted by the driver. The @size field specifies the size of the
> > + * parameters block and is used by the driver for validation purposes.
> > + *
> > + * The @flags field is a bitmaks of per-block flags, enumerated by
>
> bitmaks -> bitmask
>

ups

> > + * :c:type:`rkisp1_ext_params_block_flags`.
> > + *
> > + * When userspace needs to configure and enable an ISP block it shall fully
> > + * populate the block configuration and set in the
> > + * RKISP1_EXT_PARAMS_BLOCK_ENABLE bit in the @flags field.
> > + *
> > + * When userspace simply wants to disable an ISP block the
> > + * RKISP1_EXT_PARAMS_BLOCK_DISABLE bit should be set in @flags field. The
> > + * driver ignores the rest of the block configuration structure in this case.
> > + *
> > + * If a new configuration of an ISP block has to be applied userspace shall
> > + * fully populate the ISP block configuration and omit setting the
> > + * RKISP1_EXT_PARAMS_BLOCK_ENABLE bit in the @flags field.
>
> You probably mean: omit setting the RKISP1_EXT_PARAMS_BLOCK_ENABLE and DISABLE bits in the @flags field.
>

Yeah, I assumed that DISABLE had to be omitted, otherwise the block
gets.. disabled..  but I can mention both indeed

> > + *
> > + * Userspace shall never set both the RKISP1_EXT_PARAMS_BLOCK_ENABLE and
> > + * RKISP1_EXT_PARAMS_BLOCK_DISABLE bits in the @flags field. The driver
> > + * behaviour is undefined in this case.
>
> Should this be left undefined? Or would it be better to say that the ENABLE
> flag is ignored in this case? (I.e. DISABLE has precedence over ENABLE)
>

That's the behaviour that is implemented today, but I didn't want to
fix that in the uAPI, as specifying ENABLE and DISABLE at the same
time doesn't make any sense and I tried to convey them by mentioning
"undefined behaviour". I can however do as you suggested.

Thanks
  j

> > + *
> > + * Userspace is responsible for correctly populating the parameters block header
> > + * fields (@type, @flags and @size) and the block-specific parameters.
> > + *
> > + * For example:
> > + *
> > + * .. code-block:: c
> > + *
> > + *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
> > + *		struct rkisp1_ext_params_bls_config *bls =
> > + *			(struct rkisp1_ext_params_bls_config *)block;
> > + *
> > + *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
> > + *		bls->header.flags = RKISP1_EXT_PARAMS_BLOCK_ENABLE;
> > + *		bls->header.size = sizeof(*bls);
> > + *
> > + *		bls->config.enable_auto = 0;
> > + *		bls->config.fixed_val.r = blackLevelRed_;
> > + *		bls->config.fixed_val.gr = blackLevelGreenR_;
> > + *		bls->config.fixed_val.gb = blackLevelGreenB_;
> > + *		bls->config.fixed_val.b = blackLevelBlue_;
> > + *	}
> > + *
> > + * @type: The parameters block type, see
> > + *	  :c:type:`rkisp1_ext_params_block_type`
> > + * @flags: A bitmask of block flags, see
> > + *	   :c:type:`rkisp1_ext_params_block_flags`
> > + * @size: Size (in bytes) of the parameters block, including this header
> > + */
> > +struct rkisp1_ext_params_block_header {
> > +	__u16 type;
> > +	__u16 flags;
> > +	__u32 size;
> > +};
>
> Regards,
>
> 	Hans
>
> > +
> > +/**
> > + * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
> > + *
> > + * RkISP1 extensible parameters Black Level Subtraction configuration block.
> > + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Black Level Subtraction configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_bls_config`
> > + */
> > +struct rkisp1_ext_params_bls_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_bls_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_dpcc_config - RkISP1 extensible params DPCC config
> > + *
> > + * RkISP1 extensible parameters Defective Pixel Cluster Correction configuration
> > + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Defective Pixel Cluster Correction configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_dpcc_config`
> > + */
> > +struct rkisp1_ext_params_dpcc_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_dpcc_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_sdg_config - RkISP1 extensible params SDG config
> > + *
> > + * RkISP1 extensible parameters Sensor Degamma configuration block. Identified
> > + * by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Sensor Degamma configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_sdg_config`
> > + */
> > +struct rkisp1_ext_params_sdg_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_sdg_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_lsc_config - RkISP1 extensible params LSC config
> > + *
> > + * RkISP1 extensible parameters Lens Shading Correction configuration block.
> > + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Lens Shading Correction configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_lsc_config`
> > + */
> > +struct rkisp1_ext_params_lsc_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_lsc_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_awb_gain_config - RkISP1 extensible params AWB
> > + *					      gain config
> > + *
> > + * RkISP1 extensible parameters Auto-White Balance Gains configuration block.
> > + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Auto-White Balance Gains configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_awb_gain_config`
> > + */
> > +struct rkisp1_ext_params_awb_gain_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_awb_gain_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_flt_config - RkISP1 extensible params FLT config
> > + *
> > + * RkISP1 extensible parameters Filter configuration block. Identified by
> > + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Filter configuration, see :c:type:`rkisp1_cif_isp_flt_config`
> > + */
> > +struct rkisp1_ext_params_flt_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_flt_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_bdm_config - RkISP1 extensible params BDM config
> > + *
> > + * RkISP1 extensible parameters Demosaicing configuration block. Identified by
> > + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Demosaicing configuration, see :c:type:`rkisp1_cif_isp_bdm_config`
> > + */
> > +struct rkisp1_ext_params_bdm_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_bdm_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_ctk_config - RkISP1 extensible params CTK config
> > + *
> > + * RkISP1 extensible parameters Cross-Talk configuration block. Identified by
> > + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Cross-Talk configuration, see :c:type:`rkisp1_cif_isp_ctk_config`
> > + */
> > +struct rkisp1_ext_params_ctk_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_ctk_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_goc_config - RkISP1 extensible params GOC config
> > + *
> > + * RkISP1 extensible parameters Gamma-Out configuration block. Identified by
> > + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Gamma-Out configuration, see :c:type:`rkisp1_cif_isp_goc_config`
> > + */
> > +struct rkisp1_ext_params_goc_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_goc_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_dpf_config - RkISP1 extensible params DPF config
> > + *
> > + * RkISP1 extensible parameters De-noise Pre-Filter configuration block.
> > + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: De-noise Pre-Filter configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_dpf_config`
> > + */
> > +struct rkisp1_ext_params_dpf_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_dpf_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_dpf_strength_config - RkISP1 extensible params DPF
> > + *						  strength config
> > + *
> > + * RkISP1 extensible parameters De-noise Pre-Filter strength configuration
> > + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: De-noise Pre-Filter strength configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_dpf_strength_config`
> > + */
> > +struct rkisp1_ext_params_dpf_strength_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_dpf_strength_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_cproc_config - RkISP1 extensible params CPROC config
> > + *
> > + * RkISP1 extensible parameters Color Processing configuration block.
> > + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Color processing configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_cproc_config`
> > + */
> > +struct rkisp1_ext_params_cproc_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_cproc_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_ie_config - RkISP1 extensible params IE config
> > + *
> > + * RkISP1 extensible parameters Image Effect configuration block. Identified by
> > + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_IE`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Image Effect configuration, see :c:type:`rkisp1_cif_isp_ie_config`
> > + */
> > +struct rkisp1_ext_params_ie_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_ie_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_awb_meas_config - RkISP1 extensible params AWB
> > + *					      Meas config
> > + *
> > + * RkISP1 extensible parameters Auto-White Balance Measurement configuration
> > + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Auto-White Balance measure configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_awb_meas_config`
> > + */
> > +struct rkisp1_ext_params_awb_meas_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_awb_meas_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Histogram config
> > + *
> > + * RkISP1 extensible parameters Histogram statistics configuration block.
> > + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Histogram statistics configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_hst_config`
> > + */
> > +struct rkisp1_ext_params_hst_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_hst_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_aec_config - RkISP1 extensible params AEC config
> > + *
> > + * RkISP1 extensible parameters Auto-Exposure statistics configuration block.
> > + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Auto-Exposure statistics configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_aec_config`
> > + */
> > +struct rkisp1_ext_params_aec_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_aec_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_afc_config - RkISP1 extensible params AFC config
> > + *
> > + * RkISP1 extensible parameters Auto-Focus statistics configuration block.
> > + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Auto-Focus statistics configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_afc_config`
> > + */
> > +struct rkisp1_ext_params_afc_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_afc_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +#define RKISP1_EXT_PARAMS_MAX_SIZE					\
> > +	(sizeof(struct rkisp1_ext_params_bls_config)			+\
> > +	sizeof(struct rkisp1_ext_params_dpcc_config)			+\
> > +	sizeof(struct rkisp1_ext_params_sdg_config)			+\
> > +	sizeof(struct rkisp1_ext_params_lsc_config)			+\
> > +	sizeof(struct rkisp1_ext_params_awb_gain_config)		+\
> > +	sizeof(struct rkisp1_ext_params_flt_config)			+\
> > +	sizeof(struct rkisp1_ext_params_bdm_config)			+\
> > +	sizeof(struct rkisp1_ext_params_ctk_config)			+\
> > +	sizeof(struct rkisp1_ext_params_goc_config)			+\
> > +	sizeof(struct rkisp1_ext_params_dpf_config)			+\
> > +	sizeof(struct rkisp1_ext_params_dpf_strength_config)		+\
> > +	sizeof(struct rkisp1_ext_params_cproc_config)			+\
> > +	sizeof(struct rkisp1_ext_params_ie_config)			+\
> > +	sizeof(struct rkisp1_ext_params_awb_meas_config)		+\
> > +	sizeof(struct rkisp1_ext_params_hst_config)			+\
> > +	sizeof(struct rkisp1_ext_params_aec_config)			+\
> > +	sizeof(struct rkisp1_ext_params_afc_config))
> > +
> > +/**
> > + * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
> > + *
> > + * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible parameters
> > + */
> > +enum rksip1_ext_param_buffer_version {
> > +	RKISP1_EXT_PARAM_BUFFER_V1 = 1,
> > +};
> > +
> > +/**
> > + * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
> > + *
> > + * This struct contains the configuration parameters of the RkISP1 ISP
> > + * algorithms, serialized by userspace into a data buffer. Each configuration
> > + * parameter block is represented by a block-specific structure which contains a
> > + * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
> > + * populates the @data buffer with configuration parameters for the blocks that
> > + * it intends to configure. As a consequence, the data buffer effective size
> > + * changes according to the number of ISP blocks that userspace intends to
> > + * configure and is set by userspace in the @data_size field.
> > + *
> > + * The parameters buffer is versioned by the @version field to allow modifying
> > + * and extending its definition. Userspace shall populate the @version field to
> > + * inform the driver about the version it intends to use. The driver will parse
> > + * and handle the @data buffer according to the data layout specific to the
> > + * indicated version and return an error if the desired version is not
> > + * supported.
> > + *
> > + * For each ISP block that userspace wants to configure, a block-specific
> > + * structure is appended to the @data buffer, one after the other without gaps
> > + * in between nor overlaps. Userspace shall populate the @data_size field with
> > + * the effective size, in bytes, of the @data buffer.
> > + *
> > + * The expected memory layout of the parameters buffer is::
> > + *
> > + *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
> > + *	| version = RKISP_EXT_PARAMS_BUFFER_V1;                               |
> > + *	| data_size = sizeof(struct rkisp1_ext_params_bls_config)             |
> > + *	|           + sizeof(struct rkisp1_ext_params_dpcc_config);           |
> > + *	| +------------------------- data  ---------------------------------+ |
> > + *	| | +------------- struct rkisp1_ext_params_bls_config -----------+ | |
> > + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
> > + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS;                | | | |
> > + *	| | | | flags = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                 | | | |
> > + *	| | | | size = sizeof(struct rkisp1_ext_params_bls_config);     | | | |
> > + *	| | | +---------------------------------------------------------+ | | |
> > + *	| | | +---------- struct rkisp1_cif_isp_bls_config -------------+ | | |
> > + *	| | | | enable_auto = 0;                                        | | | |
> > + *	| | | | fixed_val.r = 256;                                      | | | |
> > + *	| | | | fixed_val.gr = 256;                                     | | | |
> > + *	| | | | fixed_val.gb = 256;                                     | | | |
> > + *	| | | | fixed_val.b = 256;                                      | | | |
> > + *	| | | +---------------------------------------------------------+ | | |
> > + *	| | +------------ struct rkisp1_ext_params_dpcc_config -----------+ | |
> > + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
> > + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC;               | | | |
> > + *	| | | | flags = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                 | | | |
> > + *	| | | | size = sizeof(struct rkisp1_ext_params_dpcc_config);    | | | |
> > + *	| | | +---------------------------------------------------------+ | | |
> > + *	| | | +---------- struct rkisp1_cif_isp_dpcc_config ------------+ | | |
> > + *	| | | | mode = RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE;          | | | |
> > + *	| | | | output_mode =                                           | | | |
> > + *	| | | |   RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_G_CENTER; | | | |
> > + *	| | | | set_use = ... ;                                         | | | |
> > + *	| | | | ...  = ... ;                                            | | | |
> > + *	| | | +---------------------------------------------------------+ | | |
> > + *	| | +-------------------------------------------------------------+ | |
> > + *	| +-----------------------------------------------------------------+ |
> > + *	+---------------------------------------------------------------------+
> > + *
> > + * @version: The RkISP1 extensible parameters buffer version, see
> > + *	     :c:type:`rksip1_ext_param_buffer_version`
> > + * @data_size: The RkISP1 configuration data effective size, excluding this
> > + *	       header
> > + * @data: The RkISP1 extensible configuration data blocks
> > + */
> > +struct rkisp1_ext_params_cfg {
> > +	__u32 version;
> > +	__u32 data_size;
> > +	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
> > +};
> > +
> >  #endif /* _UAPI_RKISP1_CONFIG_H */
>

