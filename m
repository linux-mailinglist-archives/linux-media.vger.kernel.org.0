Return-Path: <linux-media+bounces-15831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C0A948BF2
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 11:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABA25B23E34
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 09:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE471BD4EC;
	Tue,  6 Aug 2024 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XpHHZztr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A95146A6F
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722935167; cv=none; b=SgQ/uQWxiax7ozEt5T1a39KoVBveGtS9FaTC8gxeK78gURjGTbdC8LMjLhvOHcHJ/00i7wF4wD8aOaNY/ILoLghOfesg9gvIJcCDcFEjB4q8JN7AhE8KRd4Pc847BfnHZmS1hVtmEVieDjPS3YEdQ4kjzvQgM8KmdyGzf9p0IkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722935167; c=relaxed/simple;
	bh=ZVUoqovmeOwML05Uah/dwPBTLY8CsPL3vqLP2AsXaZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9R0vA6IgTWpXo8VymOu56t68dAwKcP8Q5ncW37V1ZiT/l2KVvqh7krfAqL8uGd+W411UA24ieBw27xNsjE9dduL9cfYMdrSAxT5NG5c9gyKV62wyc72cZjI6IjmzMhI18kCPYYAhBhzG0oFnec5EfrIlZJI/P70aGTgP3tMM84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XpHHZztr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-24-0.net.vodafone.it [5.91.24.0])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE3D02C5;
	Tue,  6 Aug 2024 11:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722935107;
	bh=ZVUoqovmeOwML05Uah/dwPBTLY8CsPL3vqLP2AsXaZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpHHZztr3fGF2IY6UtcnVq64sz2N7fK9CY+txmPwpyeHE5FJ2pLN6SJKFw8by5SR5
	 nTbg3Kl6Bpx6iDLAnzQ4EgG/CPTe0XEdV9zKyacpbAekvFac2Gxqp3vFQI3PkOpZMb
	 x62vJMUUvUhswH8KSDo0zHXqwaDaEdozNbdnj0Os=
Date: Tue, 6 Aug 2024 11:05:56 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v7 01/12] media: uapi: rkisp1-config: Add extensible
 params format
Message-ID: <2eb6clr7oloqxxfsoiyxhc3oe46bdmjkuyu2yucjan5lgmqu5n@ycrfhm7nruag>
References: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
 <20240724085004.82694-2-jacopo.mondi@ideasonboard.com>
 <782e20b3-6a4d-45fb-bcee-b3e92fa16719@xs4all.nl>
 <20240730121845.GJ1552@pendragon.ideasonboard.com>
 <719befce-a50a-4128-b8f5-82bff009c361@xs4all.nl>
 <ZrC8_dquaVo7-1L7@valkosipuli.retiisi.eu>
 <oxmlxkhyapax3rzzuouy3gyrr5bysjlhit6hnouzakxrdf7sog@dv3a5to7lvuc>
 <ZrHkeX2j19NGmf-N@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZrHkeX2j19NGmf-N@valkosipuli.retiisi.eu>

Hi Sakari

On Tue, Aug 06, 2024 at 08:53:13AM GMT, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Aug 06, 2024 at 09:30:16AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Mon, Aug 05, 2024 at 11:52:29AM GMT, Sakari Ailus wrote:
> > > Hi Hans, Laurent,
> > >
> > > On Tue, Jul 30, 2024 at 02:37:04PM +0200, Hans Verkuil wrote:
> > > > On 30/07/2024 14:18, Laurent Pinchart wrote:
> > > > > Hi Hans,
> > > > >
> > > > > On Tue, Jul 30, 2024 at 02:11:12PM +0200, Hans Verkuil wrote:
> > > > >> On 24/07/2024 10:49, Jacopo Mondi wrote:
> > > > >>> Add to the rkisp1-config.h header data types and documentation of
> > > > >>> the extensible parameters format.
> > > > >>>
> > > > >>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > >>> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > >>> ---
> > > > >>>  include/uapi/linux/rkisp1-config.h | 489 +++++++++++++++++++++++++++++
> > > > >>>  1 file changed, 489 insertions(+)
> > > > >>>
> > > > >>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > > > >>> index 6eeaf8bf2362..00b09c92cca7 100644
> > > > >>> --- a/include/uapi/linux/rkisp1-config.h
> > > > >>> +++ b/include/uapi/linux/rkisp1-config.h
> > > > >>> @@ -996,4 +996,493 @@ struct rkisp1_stat_buffer {
> > > > >>>  	struct rkisp1_cif_isp_stat params;
> > > > >>>  };
> > > > >>>
> > > > >>> +/*---------- PART3: Extensible Configuration Parameters  ------------*/
> > > > >>> +
> > > > >>> +/**
> > > > >>> + * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
> > > > >>> + *
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS: Black level subtraction
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC: Defect pixel cluster correction
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG: Sensor de-gamma
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN: Auto white balance gains
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT: ISP filtering
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM: Bayer de-mosaic
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK: Cross-talk correction
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC: Gamma out correction
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF: De-noise pre-filter
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH: De-noise pre-filter strength
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC: Color processing
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_IE: Image effects
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC: Lens shading correction
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS: Auto white balance statistics
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
> > > > >>> + */
> > > > >>> +enum rkisp1_ext_params_block_type {
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_IE,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> > > > >>> +};
> > > > >>> +
> > > > >>> +/**
> > > > >>> + * enum rkisp1_ext_params_block_enable - RkISP1 extensible parameter block
> > > > >>> + *					 enable flags
> > > > >>> + *
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_DISABLE: Disable the HW block
> > > > >>> + * @RKISP1_EXT_PARAMS_BLOCK_ENABLE: Enable the HW block
> > > > >>> + */
> > > > >>> +enum rkisp1_ext_params_block_enable {
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_DISABLE,
> > > > >>> +	RKISP1_EXT_PARAMS_BLOCK_ENABLE,
> > > > >>> +};
> > > > >>> +
> > > > >>> +/**
> > > > >>> + * struct rkisp1_ext_params_block_header - RkISP1 extensible parameter block
> > > > >>> + *					   header
> > > > >>> + *
> > > > >>> + * This structure represents the common part of all the ISP configuration
> > > > >>> + * blocks. Each parameters block shall embed an instance of this structure type
> > > > >>> + * as its first member, followed by the block-specific configuration data. The
> > > > >>> + * driver inspects this common header to discern the block type and its size and
> > > > >>> + * properly handle the block content by casting it to the correct block-specific
> > > > >>> + * type.
> > > > >>> + *
> > > > >>> + * The @type field is one of the values enumerated by
> > > > >>> + * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
> > > > >>> + * interpreted by the driver. The @size field specifies the size of the
> > > > >>> + * parameters block and is used by the driver for validation purposes.
> > > > >>> + *
> > > > >>> + * The @enable field specifies the ISP block enablement state. The possible
> > > > >>> + * enablement states are enumerated by :c:type:`rkisp1_ext_params_block_enable`.
> > > > >>> + * When userspace needs to configure and enable an ISP block it shall fully
> > > > >>> + * populate the block configuration and the @enable flag shall be set to
> > > > >>> + * RKISP1_EXT_PARAMS_BLOCK_ENABLE. When userspace simply wants to disable the
> > > > >>> + * ISP block the @enable flag shall be set to RKISP1_EXT_PARAMS_BLOCK_DISABLE.
> > > > >>> + * The driver ignores the rest of the block configuration structure in this
> > > > >>> + * case.
> > > > >>> + *
> > > > >>> + * If a new configuration of an ISP block has to be applied userspace shall
> > > > >>> + * fully populate the ISP block configuration and set the @enable flag to
> > > > >>> + * RKISP1_EXT_PARAMS_BLOCK_ENABLE.
> > > > >>> + *
> > > > >>> + * Userspace is responsible for correctly populating the parameters block header
> > > > >>> + * fields (@type, @enable and @size) and the block-specific parameters.
> > > > >>> + *
> > > > >>> + * For example:
> > > > >>> + *
> > > > >>> + * .. code-block:: c
> > > > >>> + *
> > > > >>> + *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
> > > > >>> + *		struct rkisp1_ext_params_bls_config *bls =
> > > > >>> + *			(struct rkisp1_ext_params_bls_config *)block;
> > > > >>> + *
> > > > >>> + *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
> > > > >>> + *		bls->header.enable = RKISP1_EXT_PARAMS_BLOCK_ENABLE;
> > > > >>> + *		bls->header.size = sizeof(*bls);
> > > > >>> + *
> > > > >>> + *		bls->config.enable_auto = 0;
> > > > >>> + *		bls->config.fixed_val.r = blackLevelRed_;
> > > > >>> + *		bls->config.fixed_val.gr = blackLevelGreenR_;
> > > > >>> + *		bls->config.fixed_val.gb = blackLevelGreenB_;
> > > > >>> + *		bls->config.fixed_val.b = blackLevelBlue_;
> > > > >>> + *	}
> > > > >>> + *
> > > > >>> + * @type: The parameters block type, see
> > > > >>> + *	  :c:type:`rkisp1_ext_params_block_type`
> > > > >>> + * @enable: The block enable flag, see
> > > > >>> + *	   :c:type:`rkisp1_ext_params_block_enable`
> > > > >>> + * @size: Size (in bytes) of the parameters block, including this header
> > > > >>> + */
> > > > >>> +struct rkisp1_ext_params_block_header {
> > > > >>> +	__u16 type;
> > > > >>> +	__u16 enable;
> > > > >>> +	__u16 size;
> > > > >>
> > > > >> I would suggest changing this to '__u32 size;'. It ensures the header is8 bytes
> > > > >> long (much nicer than 6), and if there is ever a block > 65535, then it is supported.
> > > > >
> > > > > I'm pretty confident we will never need a block size larger than 64kB.
> > > >
> > > > Hmm, famous last words :-)
> > > >
> > > > > That would mean more than 64kB of data written to hardware
> > > > > registers/SRAM for a single processing block, and it would be incredibly
> > > > > expensive in terms of hardware. Keeping size a __u16 means we have two
> > > > > bytes of reserved space we could possibly use later, which may come
> > > > > handy.
> > > >
> > > > i would prefer to change the size to a u32, but rename the 'enable' field
> > > > to 'flags', and assign bit 0 to the enable/disable bit. This is a bit
> > > > more flexible IMHO and allows for 15 bits to encode additional data.
> > > >
> > > >  Blocks > 64kB could still be supported in the future by defining
> > > > > a new version of the parameters format (RKISP1_EXT_PARAM_BUFFER_V2)
> > > > > without needing a different 4CC.
> > >
> > > ...or making of use the existing padding. Shouldn't that be a reserved
> > > field btw.?
> > >
> >
> > I might have missed what padding to be made a reserved field you are
> > referring to :)
>
> Related to the struct being discussed, struct
> rkisp1_ext_params_block_header? Due to the alignment, there's padding
> there, isn't there?
>

Ah sorry, I assumed 'size' was going to be changed to be a u32, so
there won't be any padding.

> >
> > > I'm fine either approach, perhaps leaning slightly towards u32 size.

Ok, now that I read the two sentences as "either this or that" it
makes sense. I'm going for an u32 size then.

Thanks
  j

> > >
> > > For the series:
> > >
> > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >
> > > > >
> > > > > This being said, the opposite argument can be made, that a 32-bit size
> > > > > could come handy if we ever have larger blocks, and a new version of the
> > > > > parameters format could be used if we ever need to add more fields to
> > > > > the block header. I won't insist either way.
> > > > >
> > > > >> i wonder if, with this change, the 'aligned(8)' attributes are even needed, but
> > > > >> I didn't dig into that.
> > > > >
> > > > > The header would become 8-bytes long, but its larger field would still
> > > > > be 4-bytes long, so the compiler would only enforce 4-bytes aligned
> > > > > AFAIK.
> > > >
> > > > Normally the actual data blocks (in the non-extensible format) are already aligned
> > > > to either 4 or 8 bytes (depending on whether u64 values are used). So an 8 byte
> > > > header won't mess up the alignment.
>
> --
> Kind regards,
>
> Sakari Ailus

