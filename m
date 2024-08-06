Return-Path: <linux-media+bounces-15825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A5B948A22
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 09:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34DCF1C23374
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 07:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B92165F09;
	Tue,  6 Aug 2024 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WN+GQfhs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6838AF4FA
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722929425; cv=none; b=fEZ8IYa5uiRrmRG1cZnwj5Nu6JOtLumEgPd1Tfj1/MUM5PIdOccuugnOuLMLsSIyC6cLQyuOsRDHG5geNnjkRJG5ix89FsGqilRRl8O669MZz8KuWl7aXlstezrxG8E3oDaM+A2IdEM8XNg6CUS6mfUMmArUeg58Ufkdr7EQxaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722929425; c=relaxed/simple;
	bh=JTwi5OYq9YjXKgb2UNdUxZeX/JOm/RoubAo5DpQB7wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nt2Ik22YSSdUtCL0AM82B5qtPmcuG95eLeUv7UViwRM5eQYpoEKKPENdMyUCZO9R2hQ5/dImYbG0WRflFCS0XfDbOkGGBiWNtC6BoIPHUrpWcvyOpbawqe/jdZZzxbefisKZQgFLVgEJxarxbjCNOmVB/NNe7uZ3m7WT2Wr6TBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WN+GQfhs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-24-0.net.vodafone.it [5.91.24.0])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A510D2C5;
	Tue,  6 Aug 2024 09:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722929368;
	bh=JTwi5OYq9YjXKgb2UNdUxZeX/JOm/RoubAo5DpQB7wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WN+GQfhsBJL75rmJfXkycYrMSJ4MZAOTpcEK9bDto+KElOJ+Y6BP4Il14MmjMi0NS
	 bCNSfsxQgA6snA95jY4l9l68Hw0cagPjNOSYUkR9PfBSXG4O6+7YjDjkW8145PrrRB
	 vkkOOLMxeEds+/KDgHaHxZnw9dOi6nLA827nlKuc=
Date: Tue, 6 Aug 2024 09:30:16 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v7 01/12] media: uapi: rkisp1-config: Add extensible
 params format
Message-ID: <oxmlxkhyapax3rzzuouy3gyrr5bysjlhit6hnouzakxrdf7sog@dv3a5to7lvuc>
References: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
 <20240724085004.82694-2-jacopo.mondi@ideasonboard.com>
 <782e20b3-6a4d-45fb-bcee-b3e92fa16719@xs4all.nl>
 <20240730121845.GJ1552@pendragon.ideasonboard.com>
 <719befce-a50a-4128-b8f5-82bff009c361@xs4all.nl>
 <ZrC8_dquaVo7-1L7@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZrC8_dquaVo7-1L7@valkosipuli.retiisi.eu>

Hi Sakari

On Mon, Aug 05, 2024 at 11:52:29AM GMT, Sakari Ailus wrote:
> Hi Hans, Laurent,
>
> On Tue, Jul 30, 2024 at 02:37:04PM +0200, Hans Verkuil wrote:
> > On 30/07/2024 14:18, Laurent Pinchart wrote:
> > > Hi Hans,
> > >
> > > On Tue, Jul 30, 2024 at 02:11:12PM +0200, Hans Verkuil wrote:
> > >> On 24/07/2024 10:49, Jacopo Mondi wrote:
> > >>> Add to the rkisp1-config.h header data types and documentation of
> > >>> the extensible parameters format.
> > >>>
> > >>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> > >>> ---
> > >>>  include/uapi/linux/rkisp1-config.h | 489 +++++++++++++++++++++++++++++
> > >>>  1 file changed, 489 insertions(+)
> > >>>
> > >>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > >>> index 6eeaf8bf2362..00b09c92cca7 100644
> > >>> --- a/include/uapi/linux/rkisp1-config.h
> > >>> +++ b/include/uapi/linux/rkisp1-config.h
> > >>> @@ -996,4 +996,493 @@ struct rkisp1_stat_buffer {
> > >>>  	struct rkisp1_cif_isp_stat params;
> > >>>  };
> > >>>
> > >>> +/*---------- PART3: Extensible Configuration Parameters  ------------*/
> > >>> +
> > >>> +/**
> > >>> + * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
> > >>> + *
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS: Black level subtraction
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC: Defect pixel cluster correction
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG: Sensor de-gamma
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN: Auto white balance gains
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT: ISP filtering
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM: Bayer de-mosaic
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK: Cross-talk correction
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC: Gamma out correction
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF: De-noise pre-filter
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH: De-noise pre-filter strength
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC: Color processing
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_IE: Image effects
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC: Lens shading correction
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS: Auto white balance statistics
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
> > >>> + */
> > >>> +enum rkisp1_ext_params_block_type {
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_IE,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> > >>> +};
> > >>> +
> > >>> +/**
> > >>> + * enum rkisp1_ext_params_block_enable - RkISP1 extensible parameter block
> > >>> + *					 enable flags
> > >>> + *
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_DISABLE: Disable the HW block
> > >>> + * @RKISP1_EXT_PARAMS_BLOCK_ENABLE: Enable the HW block
> > >>> + */
> > >>> +enum rkisp1_ext_params_block_enable {
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_DISABLE,
> > >>> +	RKISP1_EXT_PARAMS_BLOCK_ENABLE,
> > >>> +};
> > >>> +
> > >>> +/**
> > >>> + * struct rkisp1_ext_params_block_header - RkISP1 extensible parameter block
> > >>> + *					   header
> > >>> + *
> > >>> + * This structure represents the common part of all the ISP configuration
> > >>> + * blocks. Each parameters block shall embed an instance of this structure type
> > >>> + * as its first member, followed by the block-specific configuration data. The
> > >>> + * driver inspects this common header to discern the block type and its size and
> > >>> + * properly handle the block content by casting it to the correct block-specific
> > >>> + * type.
> > >>> + *
> > >>> + * The @type field is one of the values enumerated by
> > >>> + * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
> > >>> + * interpreted by the driver. The @size field specifies the size of the
> > >>> + * parameters block and is used by the driver for validation purposes.
> > >>> + *
> > >>> + * The @enable field specifies the ISP block enablement state. The possible
> > >>> + * enablement states are enumerated by :c:type:`rkisp1_ext_params_block_enable`.
> > >>> + * When userspace needs to configure and enable an ISP block it shall fully
> > >>> + * populate the block configuration and the @enable flag shall be set to
> > >>> + * RKISP1_EXT_PARAMS_BLOCK_ENABLE. When userspace simply wants to disable the
> > >>> + * ISP block the @enable flag shall be set to RKISP1_EXT_PARAMS_BLOCK_DISABLE.
> > >>> + * The driver ignores the rest of the block configuration structure in this
> > >>> + * case.
> > >>> + *
> > >>> + * If a new configuration of an ISP block has to be applied userspace shall
> > >>> + * fully populate the ISP block configuration and set the @enable flag to
> > >>> + * RKISP1_EXT_PARAMS_BLOCK_ENABLE.
> > >>> + *
> > >>> + * Userspace is responsible for correctly populating the parameters block header
> > >>> + * fields (@type, @enable and @size) and the block-specific parameters.
> > >>> + *
> > >>> + * For example:
> > >>> + *
> > >>> + * .. code-block:: c
> > >>> + *
> > >>> + *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
> > >>> + *		struct rkisp1_ext_params_bls_config *bls =
> > >>> + *			(struct rkisp1_ext_params_bls_config *)block;
> > >>> + *
> > >>> + *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
> > >>> + *		bls->header.enable = RKISP1_EXT_PARAMS_BLOCK_ENABLE;
> > >>> + *		bls->header.size = sizeof(*bls);
> > >>> + *
> > >>> + *		bls->config.enable_auto = 0;
> > >>> + *		bls->config.fixed_val.r = blackLevelRed_;
> > >>> + *		bls->config.fixed_val.gr = blackLevelGreenR_;
> > >>> + *		bls->config.fixed_val.gb = blackLevelGreenB_;
> > >>> + *		bls->config.fixed_val.b = blackLevelBlue_;
> > >>> + *	}
> > >>> + *
> > >>> + * @type: The parameters block type, see
> > >>> + *	  :c:type:`rkisp1_ext_params_block_type`
> > >>> + * @enable: The block enable flag, see
> > >>> + *	   :c:type:`rkisp1_ext_params_block_enable`
> > >>> + * @size: Size (in bytes) of the parameters block, including this header
> > >>> + */
> > >>> +struct rkisp1_ext_params_block_header {
> > >>> +	__u16 type;
> > >>> +	__u16 enable;
> > >>> +	__u16 size;
> > >>
> > >> I would suggest changing this to '__u32 size;'. It ensures the header is8 bytes
> > >> long (much nicer than 6), and if there is ever a block > 65535, then it is supported.
> > >
> > > I'm pretty confident we will never need a block size larger than 64kB.
> >
> > Hmm, famous last words :-)
> >
> > > That would mean more than 64kB of data written to hardware
> > > registers/SRAM for a single processing block, and it would be incredibly
> > > expensive in terms of hardware. Keeping size a __u16 means we have two
> > > bytes of reserved space we could possibly use later, which may come
> > > handy.
> >
> > i would prefer to change the size to a u32, but rename the 'enable' field
> > to 'flags', and assign bit 0 to the enable/disable bit. This is a bit
> > more flexible IMHO and allows for 15 bits to encode additional data.
> >
> >  Blocks > 64kB could still be supported in the future by defining
> > > a new version of the parameters format (RKISP1_EXT_PARAM_BUFFER_V2)
> > > without needing a different 4CC.
>
> ...or making of use the existing padding. Shouldn't that be a reserved
> field btw.?
>

I might have missed what padding to be made a reserved field you are
referring to :)

> I'm fine either approach, perhaps leaning slightly towards u32 size.
>
> For the series:
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> > >
> > > This being said, the opposite argument can be made, that a 32-bit size
> > > could come handy if we ever have larger blocks, and a new version of the
> > > parameters format could be used if we ever need to add more fields to
> > > the block header. I won't insist either way.
> > >
> > >> i wonder if, with this change, the 'aligned(8)' attributes are even needed, but
> > >> I didn't dig into that.
> > >
> > > The header would become 8-bytes long, but its larger field would still
> > > be 4-bytes long, so the compiler would only enforce 4-bytes aligned
> > > AFAIK.
> >
> > Normally the actual data blocks (in the non-extensible format) are already aligned
> > to either 4 or 8 bytes (depending on whether u64 values are used). So an 8 byte
> > header won't mess up the alignment.
>
> --
> Kind regards,
>
> Sakari Ailus

