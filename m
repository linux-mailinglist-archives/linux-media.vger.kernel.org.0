Return-Path: <linux-media+bounces-13694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE8D90EB5D
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DB9A1C21A93
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 12:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C223814373A;
	Wed, 19 Jun 2024 12:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xfxmq85l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957961422A2
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718801056; cv=none; b=qKrjxRu/dllG1fRMChEFHX/dzuWK/euLCv/u6zc7vOLTt0+OH4JjeTB83F7mafRE5r6Eh77hL47gIBJRHNmiItcMPQoc57hCwuYktbfw043Q5/Y3RUeaDlQUDotXZVS9lYvHvLYEtVZ+279OxSv9YBw84RPcdD7UXbx+pV9lwTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718801056; c=relaxed/simple;
	bh=aljPkIyaWHdE8gm1cJYvefCM42BpJZrEam3LQqvLppk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAUWYu4vQW51RW6KrrbQrOxJveUG+Sh/EIqmC8GA1v/6d2rdzSxIBVGeKnGUkylylzvC9McH/bZK4yTrt3WVP3k7OHRIvOQrdCsWzmhN3xESmfkzML8Q4lSO6xDBV2lhe9+8RhvudQo45tnMaSdMlXyjAwxqkzhEcizXIba++LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xfxmq85l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D418B541;
	Wed, 19 Jun 2024 14:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718801033;
	bh=aljPkIyaWHdE8gm1cJYvefCM42BpJZrEam3LQqvLppk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xfxmq85lN72qLJI/qmRd8jzFM/OAEB11SRk0ZTE45LI0EJKQ6hmuMLfmLJK5Af0d2
	 MokfvEcRWz/6chK8bvUiakTLiw+Oyyh2GzchkoEsyxvMIhmrCT6PR7gdO2zzizPnPY
	 xq2GmUzNMZdhrViDXS52oNOKKeh6HiRevupQ13K4=
Date: Wed, 19 Jun 2024 14:44:08 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/8] uapi: rkisp1-config: Add extensible parameters format
Message-ID: <fez3vu2b24kbcjlkpfeetipa3umfajwh7t7b57ofrnm7ca45yk@pylvihpawggj>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-2-jacopo.mondi@ideasonboard.com>
 <a6ae49b0-4b2b-47a0-b4cd-bf8cb897640f@ideasonboard.com>
 <20240612125600.GA11102@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240612125600.GA11102@pendragon.ideasonboard.com>

Hi Laurent

On Wed, Jun 12, 2024 at 03:56:00PM GMT, Laurent Pinchart wrote:
> On Wed, Jun 12, 2024 at 11:02:58AM +0100, Daniel Scally wrote:
> > Hi Jacopo - thanks for the patchset
> >
> > On 05/06/2024 17:54, Jacopo Mondi wrote:
> > > Add to the rkisp1-config.h header data types and documentation of
> > > the extensible parameters format.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >   include/uapi/linux/rkisp1-config.h | 482 +++++++++++++++++++++++++++++
> > >   1 file changed, 482 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > > index 6eeaf8bf2362..9c93e536f270 100644
> > > --- a/include/uapi/linux/rkisp1-config.h
> > > +++ b/include/uapi/linux/rkisp1-config.h
> > > @@ -996,4 +996,486 @@ struct rkisp1_stat_buffer {
> > >   	struct rkisp1_cif_isp_stat params;
> > >   };
> > >
> > > +/*---------- PART3: Extensible Configuration Parameters  ------------*/
> > > +
> > > +/**
> > > + * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
> > > + *
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS: Black level subtraction
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC: Defect pixel cluster correction
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG: Sensor de-gamma
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS: Auto white balance gains
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT: ISP filtering
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM: Bayer de-mosaic
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK: Cross-talk correction
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC: Gamma out correction
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF: De-noise pre-filter
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGHT: De-noise pre-filter strength
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC: Color processing
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_IE: Image effects
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC: Lens shading correction
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS: Auto white balance statistics
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
> > > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
> > > + */
> > > +enum rkisp1_ext_params_block_type {
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGHT,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_IE,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> > > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL,
> > > +};
> >
> > Laurent suggested referencing the enum value in the comments for each
> > block in his review of the C55 series, and I think that that's a good
> > idea - can we do that?
>
> I would like that too.
>
> > Otherwise, looks good to me:
> >
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> >
> > > +
> > > +/**
> > > + * enum rkisp1_ext_params_block_state - RkISP1 extensible parameter block enable
> > > + *					state flags
> > > + *
> > > + * @RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE: Do not change the block power state
>
> I wouldn't call that "power" state, I don't think it's about power.

How would you call it ? It's about enabling the block, should I use
'enable' ?

>
> > > + * @RKISP1_EXT_PARAMS_BLOCK_DISABLE: Disable the HW block
> > > + * @RKISP1_EXT_PARAMS_BLOCK_ENABLE: Enable the HW block
> > > + */
> > > +enum rkisp1_ext_params_block_state {
> > > +	RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE,
> > > +	RKISP1_EXT_PARAMS_BLOCK_DISABLE,
> > > +	RKISP1_EXT_PARAMS_BLOCK_ENABLE,
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_block_header - RkISP1 extensible parameter block
> > > + *					   header
> > > + *
> > > + * This structure represents the common part of all the ISP configuration
> > > + * blocks. Each parameters block shall embed an instance of this structure type
> > > + * as its first member, followed by the block-specific configuration data. The
> > > + * driver inspects this common header to discern the block type and its size and
> > > + * properly handle the block content by casting it to the correct block-specific
> > > + * type.
> > > + *
> > > + * The @type field is one of the values enumerated by
> > > + * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
> > > + * interpreted by the driver. The @size field specifies the size of the
> > > + * parameters block and is used by the driver for validation purposes.
> > > + *
> > > + * The @state field specifies if the ISP block power state should be changed,
> > > + * and, if it has to, if it has to be enabled to disabled. The possible
> > > + * states are enumerated by :c:type:`rkisp1_ext_params_block_state`.
> > > + * When userspace needs to configure and enable an ISP block it shall fully
> > > + * populate the block configuration and the @state flag shall be set to
> > > + * RKISP1_EXT_PARAMS_BLOCK_ENABLE. When userspace simply wants to disable the
> > > + * ISP block the @state flag shall be set to RKISP1_EXT_PARAMS_BLOCK_DISABLE.
>
> You should document here what happens to the rest of the parameters in
> the block in that case. I think they should be ignored by the driver,
> and possibly set to 0 by userspace.

I'll add "they get ignored"

>
> Another option when disabling a block would be to include the header
> only, with the size field set to the header size, and not include the
> rest of the block contents. It's a bit pointless to include data that
> the kernel won't use. While that would be my preference from an API
> point of view (at least until someone points out to use cases that would
> benefit from a different option), I haven't checked what it would imply
> from a userspace and kernelspace implementation point of view. I could
> agree to keeping the data part of the block in for disabled blocks if
> omitting it would result in implementation issues.
>

I'm not sure it will add issues, but it would make it more cumbersome
for userspace maybe

> > If
> > > + * a new configuration of an ISP block should be applied but the power state
> > > + * doesn't need to be changed, userspace shall fully populate the ISP block
> > > + * configuration and the @state flag shall be set to
> > > + * RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE.
>
> I don't think we need RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE for that. The
> state can just be set to @RKISP1_EXT_PARAMS_BLOCK_ENABLE.
>

The existing code does

        rkisp1_isp_isr_xxx_config()
        {

                if (cfg_update & MODULE_XXX)
                        rkisp1_xxx_config()

                if (en_update & MODULE_XXX)
                        if (enable & MODULE_XXX)
                                set_bit(ENABLE, MODULE_XXX)
                        else
                                clear_bit(ENABLE, MODULE_XXX)
        }

As the enablement maks is separate from the configuration mask,
userspace can in the previous version set (cfg_update |= MODULE_XXX)
without setting the MODULE_XXX bit in en_update.

Now, with the the introduction of this new format, the 'state' field is
always present and I can't express with just two values the "reconfigure
but not enable" case.

Think about LSC, when a new table has to be applied we have to
re-program it without changing the enable bit. I mean, re-asserting
the bit is probably harmless, but isn't it safer avoid doing that ?

> > > + *
> > > + * Userspace is responsible for correctly populating the parameters block header
> > > + * fields (@type, @state and @size) and correctly populate the block-specific
> > > + * parameters.
> > > + *
> > > + * For example:
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
> > > + *		struct rkisp1_ext_params_bls_config *bls =
> > > + *			(struct rkisp1_ext_params_bls_config *)block;
> > > + *
> > > + *		block->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
> > > + *		block->header.state = RKISP1_EXT_PARAMS_BLOCK_ENABLE;
> > > + *		block->header.size = sizeof(struct rkisp1_ext_params_bls_config);
> > > + *
> > > + *		bls->bls_config.enable_auto = 0;
> > > + *		bls->bls_config.fixed_val.r = blackLevelRed_;
> > > + *		bls->bls_config.fixed_val.gr = blackLevelGreenR_;
> > > + *		bls->bls_config.fixed_val.gb = blackLevelGreenB_;
> > > + *		bls->bls_config.fixed_val.b = blackLevelBlue_;
> > > + *	}
> > > + *
> > > + * @type: The parameters block type, see
> > > + *	  :c:type:`rkisp1_ext_params_block_type`
> > > + * @state: The block enable state flag, see
> > > + *	   :c:type:`rkisp1_ext_params_block_state`
> > > + * @size: Size (in bytes) of the parameters block, including this header
> > > + */
> > > +struct rkisp1_ext_params_block_header {
> > > +	__u32 type;
> > > +	__u32 state;
> > > +	__u64 size;
>
> I think a 32-bit size would be move than enough. The header should
> however be 64-bit aligned.

That's why size is 64 bits.

>
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
> > > + *
> > > + * RkISP1 extensible parameters Black Level Subtraction configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @bls_config: Black Level Subtraction configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_bls_config`
> > > + */
> > > +struct rkisp1_ext_params_bls_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_bls_config bls_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_dpcc_config - RkISP1 extensible params DPCC config
> > > + *
> > > + * RkISP1 extensible parameters Defective Pixel Cluster Correction configuration
> > > + * block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @dpcc_config: Defective Pixel Cluster Correction configuration, see
> > > + *		 :c:type:`rkisp1_cif_isp_dpcc_config`
> > > + */
> > > +struct rkisp1_ext_params_dpcc_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_dpcc_config dpcc_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_sdg_config - RkISP1 extensible params SDG config
> > > + *
> > > + * RkISP1 extensible parameters Sensor Degamma configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @sdg_config: Sensor Degamma configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_sdg_config`
> > > + */
> > > +struct rkisp1_ext_params_sdg_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_sdg_config sdg_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_lsc_config - RkISP1 extensible params LSC config
> > > + *
> > > + * RkISP1 extensible parameters Lens Shading Correction configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @lsc_config: Lens Shading Correction configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_lsc_config`
> > > + */
> > > +struct rkisp1_ext_params_lsc_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_lsc_config lsc_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_awb_gain_config - RkISP1 extensible params AWB
> > > + *					      gain config
> > > + *
> > > + * RkISP1 extensible parameters Auto-White Balance Gains configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @awb_config: Auto-White Balance Gains configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_awb_gain_config`
> > > + */
> > > +struct rkisp1_ext_params_awb_gain_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_awb_gain_config awb_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_flt_config - RkISP1 extensible params FLT config
> > > + *
> > > + * RkISP1 extensible parameters Filter configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @flt_config: Filter configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_flt_config`
> > > + */
> > > +struct rkisp1_ext_params_flt_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_flt_config flt_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_bdm_config - RkISP1 extensible params BDM config
> > > + *
> > > + * RkISP1 extensible parameters Demosaicing configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @bdm_config: Demosaicing configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_bdm_config`
> > > + */
> > > +struct rkisp1_ext_params_bdm_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_bdm_config bdm_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_ctk_config - RkISP1 extensible params CTK config
> > > + *
> > > + * RkISP1 extensible parameters Cross-Talk configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @ctk_config: Cross-Talk configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_ctk_config`
> > > + */
> > > +struct rkisp1_ext_params_ctk_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_ctk_config ctk_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_goc_config - RkISP1 extensible params GOC config
> > > + *
> > > + * RkISP1 extensible parameters Gamma-Out configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @goc_config: Gamma-Out configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_goc_config`
> > > + */
> > > +struct rkisp1_ext_params_goc_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_goc_config goc_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_dpf_config - RkISP1 extensible params DPF config
> > > + *
> > > + * RkISP1 extensible parameters De-noise Pre-Filter configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @dpf_config: De-noise Pre-Filter configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_dpf_config`
> > > + */
> > > +struct rkisp1_ext_params_dpf_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_dpf_config dpf_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_dpf_strength_config - RkISP1 extensible params DPF
> > > + *						  strength config
> > > + *
> > > + * RkISP1 extensible parameters De-noise Pre-Filter strength configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @dpf_strength_config: De-noise Pre-Filter strength configuration, see
> > > + *			 :c:type:`rkisp1_cif_isp_dpf_strength_config`
> > > + */
> > > +struct rkisp1_ext_params_dpf_strength_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_dpf_strength_config dpf_strength_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_cproc_config - RkISP1 extensible params CPROC config
> > > + *
> > > + * RkISP1 extensible parameters Color Processing configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @cproc_config: Color processing configuration, see
> > > + *		  :c:type:`rkisp1_cif_isp_cproc_config`
> > > + */
> > > +struct rkisp1_ext_params_cproc_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_cproc_config cproc_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_ie_config - RkISP1 extensible params IE config
> > > + *
> > > + * RkISP1 extensible parameters Image Effect configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @ie_config: Image Effect configuration, see
> > > + *	       :c:type:`rkisp1_cif_isp_ie_config`
> > > + */
> > > +struct rkisp1_ext_params_ie_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_ie_config ie_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_awb_meas_config - RkISP1 extensible params AWB
> > > + *					      Meas config
> > > + *
> > > + * RkISP1 extensible parameters Auto-White Balance Measurement configuration
> > > + * block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @awb_meas_config: Auto-White Balance measure configuration, see
> > > + *		     :c:type:`rkisp1_cif_isp_awb_meas_config`
> > > + */
> > > +struct rkisp1_ext_params_awb_meas_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_awb_meas_config awb_meas_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Histogram config
> > > + *
> > > + * RkISP1 extensible parameters Histogram statistics configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @hst_config: Histogram statistics configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_hst_config`
> > > + */
> > > +struct rkisp1_ext_params_hst_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_hst_config hst_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_aec_config - RkISP1 extensible params AEC config
> > > + *
> > > + * RkISP1 extensible parameters Auto-Exposure statistics configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @aec_config: Auto-Exposure statistics configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_aec_config`
> > > + */
> > > +struct rkisp1_ext_params_aec_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_aec_config aec_config;
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_afc_config - RkISP1 extensible params AFC config
> > > + *
> > > + * RkISP1 extensible parameters Auto-Focus statistics configuration block
> > > + *
> > > + * @header: The RkISP1 extensible parameters header, see
> > > + *	    :c:type:`rkisp1_ext_params_block_header`
> > > + * @afc_config: Auto-Focus statistics configuration, see
> > > + *		:c:type:`rkisp1_cif_isp_afc_config`
> > > + */
> > > +struct rkisp1_ext_params_afc_config {
> > > +	struct rkisp1_ext_params_block_header header;
> > > +	struct rkisp1_cif_isp_afc_config afc_config;
> > > +};
> > > +
> > > +#define RKISP1_EXT_PARAMS_MAX_SIZE					\
> > > +	(sizeof(struct rkisp1_ext_params_bls_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_dpcc_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_sdg_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_lsc_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_awb_gain_config)		+\
> > > +	sizeof(struct rkisp1_ext_params_flt_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_bdm_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_ctk_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_goc_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_dpf_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_dpf_strength_config)		+\
> > > +	sizeof(struct rkisp1_ext_params_cproc_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_ie_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_awb_meas_config)		+\
> > > +	sizeof(struct rkisp1_ext_params_hst_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_aec_config)			+\
> > > +	sizeof(struct rkisp1_ext_params_afc_config))
> > > +
> > > +/**
> > > + * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
> > > + *
> > > + * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible parameters
> > > + */
> > > +enum rksip1_ext_param_buffer_version {
> > > +	RKISP1_EXT_PARAM_BUFFER_V1 = 1,
> > > +};
> > > +
> > > +/**
> > > + * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
> > > + *
> > > + * This struct contains the configuration parameters of the RkISP1 ISP
> > > + * algorithms, serialized by userspace into a data buffer. Each configuration
> > > + * parameter block is represented by a block-specific structure which contains a
> > > + * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
> > > + * populates the @data buffer with configuration parameters for the blocks that
> > > + * it intends to configure. As a consequence, the data buffer effective size
> > > + * changes according to the number of ISP blocks that userspace intends to
> > > + * configure and is set by userspace in the @total_size field.
> > > + *
> > > + * The parameters buffer is versioned by the @version field to allow modifying
> > > + * and extending its definition. Userspace shall populate the @version field to
> > > + * inform the driver about the version it intends to use. The driver will parse
> > > + * and handle the @data buffer according to the data layout specific to the
> > > + * indicated version and return an error if the desired version is not
> > > + * supported.
> > > + *
> > > + * For each ISP block that userspace wants to configure, a block-specific
> > > + * structure is appended to the @data buffer, one after the other without gaps
>
> I think we should align all the blocks to a 64 bits boundary. Otherwise
> we'll have unaligned access issues, as well as layout differences
> between 32-bitand 64-bit userspace.

Each block header is 64 bits aligned, what follows it's not

Should I add
        __attribute__((aligned(8))

To each block ?

>
> > > + * in between nor overlaps. Userspace shall populate the @total_size field with
> > > + * the effective size, in bytes, of the @data buffer.
> > > + *
> > > + * The expected memory layout of the parameters buffer is::
> > > + *
> > > + *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
> > > + *	| version = RKISP_EXT_PARAMS_BUFFER_V1;                               |
> > > + *	| total_size = sizeof(struct rkisp1_ext_params_bls_config)            |
> > > + *	|              sizeof(struct rkisp1_ext_params_dpcc_config);          |
> > > + *	| +------------------------- data  ---------------------------------+ |
> > > + *	| | +------------- struct rkisp1_ext_params_bls_config -----------+ | |
> > > + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
> > > + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS;                | | | |
> > > + *	| | | | state = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                 | | | |
> > > + *	| | | | size = sizeof(struct rkisp1_ext_params_bls_config);     | | | |
> > > + *	| | | +---------------------------------------------------------+ | | |
> > > + *	| | | +---------- struct rkisp1_cif_isp_bls_config -------------+ | | |
> > > + *	| | | | enable_auto = 0;                                        | | | |
> > > + *	| | | | fixed_val.r = 256;                                      | | | |
> > > + *	| | | | fixed_val.gr = 256;                                     | | | |
> > > + *	| | | | fixed_val.gb = 256;                                     | | | |
> > > + *	| | | | fixed_val.b = 256;                                      | | | |
> > > + *	| | | +---------------------------------------------------------+ | | |
> > > + *	| | +------------ struct rkisp1_ext_params_dpcc_config -----------+ | |
> > > + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
> > > + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC;               | | | |
> > > + *	| | | | state = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                 | | | |
> > > + *	| | | | size = sizeof(struct rkisp1_ext_params_dpcc_config);    | | | |
> > > + *	| | | +---------------------------------------------------------+ | | |
> > > + *	| | | +---------- struct rkisp1_cif_isp_dpcc_config ------------+ | | |
> > > + *	| | | | mode = RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE;          | | | |
> > > + *	| | | | output_mode =                                           | | | |
> > > + *	| | | |   RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_G_CENTER; | | | |
> > > + *	| | | | set_use = ... ;                                         | | | |
> > > + *	| | | | ...  = ... ;                                            | | | |
> > > + *	| | | +---------------------------------------------------------+ | | |
> > > + *	| | +-------------------------------------------------------------+ | |
> > > + *	| +-----------------------------------------------------------------+ |
> > > + *	+---------------------------------------------------------------------+
> > > + *
> > > + * @version: The RkISP1 extensible parameters buffer version, see
> > > + *	     :c:type:`rksip1_ext_param_buffer_version`
> > > + * @total_size: The RkISP1 configuration data effective size, excluding this
> > > + *		header
> > > + * @data: The RkISP1 extensible configuration data blocks
> > > + */
> > > +struct rkisp1_ext_params_cfg {
> > > +	__u32 version;
>
> On a 64-bit system there will be a 32-bit hole here, while on a 32-bit
> system there won't. This means that a 32-bit userspace won't run on a
> 64-bit kernel. You can add a a __u32 reserved field to fix that.

Or make version and __u64 ?

>
> > > +	__u64 total_size;
> > > +	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
> > > +};
> > > +
> > >   #endif /* _UAPI_RKISP1_CONFIG_H */
>
> --
> Regards,
>
> Laurent Pinchart
>

