Return-Path: <linux-media+bounces-15777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 924C5947A97
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 13:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46D12280E05
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 11:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFB8155C91;
	Mon,  5 Aug 2024 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Kgi9rPRX"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45CE1547CC
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722858763; cv=pass; b=qBOUtBQxBf7N4dz6KUwhBJiQ8EhiyJfRm2hNIqwFwhJPMiYpFKgiwvr/fx0jKtcb83bZG392euZxMATFvWS0eBmOFzM21ty0tbHgWIdZI0tqJAUaDqTNX3j3LBYsO9iFuqOoZ1GKmeqRAcFJD+Y19UtM19J3Mha34q2A6GurHjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722858763; c=relaxed/simple;
	bh=eVB358m9QPfrHvgpl0OCrj5p5BBlNyMx7k9I7iQ4bj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvYV1DeX1TYfo3isrqOejzM7/Uv/tImwDX7PZi64ntwkNnH9ZZSvAQH+grZvAM6qzywjwqKjJP11vttbm91MVzozuPSD381rypXtNZRyKy1yMKww1enXCmBZMrWBWWyxg5PkOF/Q3v9zpYXD1kszeBVH0SfjFR+WxEdEZLjN1AY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Kgi9rPRX; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Wcvv42d60z49Pxc;
	Mon,  5 Aug 2024 14:52:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1722858752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HePlGAWuZ7KL7SqA6hk041eO6zZElitLILKxsSJLmSU=;
	b=Kgi9rPRXDblpbevSEINOrcZMA2aHdpKxsNb+NtkDOO7VQehTemCo5ZSyzyD0Sfdqg63wng
	hswlc7l7vnEC9TUQfgVJhV04vntAK2Zl8sWOY1Ld5Ilg8ozMwoPaC6RZW2F6Myfb9V7V5c
	eSGwR2rPToi2+hcca85qSCepjoaxtacyS3mWBXsPoXSyxJoqAgHU9gjcrA+7Wz6XwSIwFk
	pzm5p+778w/mFUsPwVtAB3fybyPWFJlmsl1epbNDl9HCE35LSJxBaQjXReE67YoeJ+MK2s
	hoFlzW5rxcIL+QJwLphgrTtwLIUJzzv2kcbgALG5FqQuOwC63W3aVQSVIevuqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1722858752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HePlGAWuZ7KL7SqA6hk041eO6zZElitLILKxsSJLmSU=;
	b=Dlf37syBU1Td3dh3gijShHJTMCA8vWHhMESGcb5Us1qCW1hnpXh67AcTcvkvNYMvpUHoxh
	ZEqHvsrzW29SZ+BGe0Sxxv/uwczxrTsuEvPuNCYhdeaFqBZ9r0ZZB1SjVFQPIX4a4bab/F
	RVDGmdhcsN/e/egBWokjfvmEKZ1NQKnvFNt+d3OAg90MflXpZ4pcDqEDpp5FOt66N1n3pD
	d5EMG24An8oD78ybknWEN1YPeJlgoHQJ9x2cRJ8lx4691+ESjuKP8BZrKsdgUHl8PwNJ1a
	/FztPWlRQNDE7wqUOBi6pAbPpPrHOONIXP3nEgM2ONU2DjYPZHt5UjuhfgRnnQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1722858752; a=rsa-sha256;
	cv=none;
	b=HCXAa+jbo4fwQX/6kl0s9MJIkHr4NsDu7PWkq9bbWvHMxxLrPqCF1e1QIpAbs+6koTFzpG
	jQa4J999GSmOCo/bQGkWsUq94OwnhxxhrMNk4pw3KIwV9NEKZ5BKZ1B9N0Ld67nF51LrhT
	/8abd5Ykdm05st/ygFotL6vN2CNV6bvqOaGpH2PGtSWcMh1GpzYmBcKBzicJp3VNSpoeaL
	ThsSb9bJLNch3W5i6TOWQEInf0vIGHapQopGZXL9Rk76CpNv6BZfQQ4kEdpVFWbyKRIZJW
	ZYQieXdg+UZ6mUwPk1STQu0iHxSesHIEJOMCKGhogSU6hA2RSSRfxnn69Ohxnw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 71BBC634C93;
	Mon,  5 Aug 2024 14:52:29 +0300 (EEST)
Date: Mon, 5 Aug 2024 11:52:29 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v7 01/12] media: uapi: rkisp1-config: Add extensible
 params format
Message-ID: <ZrC8_dquaVo7-1L7@valkosipuli.retiisi.eu>
References: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
 <20240724085004.82694-2-jacopo.mondi@ideasonboard.com>
 <782e20b3-6a4d-45fb-bcee-b3e92fa16719@xs4all.nl>
 <20240730121845.GJ1552@pendragon.ideasonboard.com>
 <719befce-a50a-4128-b8f5-82bff009c361@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <719befce-a50a-4128-b8f5-82bff009c361@xs4all.nl>

Hi Hans, Laurent,

On Tue, Jul 30, 2024 at 02:37:04PM +0200, Hans Verkuil wrote:
> On 30/07/2024 14:18, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > On Tue, Jul 30, 2024 at 02:11:12PM +0200, Hans Verkuil wrote:
> >> On 24/07/2024 10:49, Jacopo Mondi wrote:
> >>> Add to the rkisp1-config.h header data types and documentation of
> >>> the extensible parameters format.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> >>> ---
> >>>  include/uapi/linux/rkisp1-config.h | 489 +++++++++++++++++++++++++++++
> >>>  1 file changed, 489 insertions(+)
> >>>
> >>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> >>> index 6eeaf8bf2362..00b09c92cca7 100644
> >>> --- a/include/uapi/linux/rkisp1-config.h
> >>> +++ b/include/uapi/linux/rkisp1-config.h
> >>> @@ -996,4 +996,493 @@ struct rkisp1_stat_buffer {
> >>>  	struct rkisp1_cif_isp_stat params;
> >>>  };
> >>>  
> >>> +/*---------- PART3: Extensible Configuration Parameters  ------------*/
> >>> +
> >>> +/**
> >>> + * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
> >>> + *
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS: Black level subtraction
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC: Defect pixel cluster correction
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG: Sensor de-gamma
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN: Auto white balance gains
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT: ISP filtering
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM: Bayer de-mosaic
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK: Cross-talk correction
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC: Gamma out correction
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF: De-noise pre-filter
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH: De-noise pre-filter strength
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC: Color processing
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_IE: Image effects
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC: Lens shading correction
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS: Auto white balance statistics
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
> >>> + */
> >>> +enum rkisp1_ext_params_block_type {
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_IE,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> >>> +};
> >>> +
> >>> +/**
> >>> + * enum rkisp1_ext_params_block_enable - RkISP1 extensible parameter block
> >>> + *					 enable flags
> >>> + *
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_DISABLE: Disable the HW block
> >>> + * @RKISP1_EXT_PARAMS_BLOCK_ENABLE: Enable the HW block
> >>> + */
> >>> +enum rkisp1_ext_params_block_enable {
> >>> +	RKISP1_EXT_PARAMS_BLOCK_DISABLE,
> >>> +	RKISP1_EXT_PARAMS_BLOCK_ENABLE,
> >>> +};
> >>> +
> >>> +/**
> >>> + * struct rkisp1_ext_params_block_header - RkISP1 extensible parameter block
> >>> + *					   header
> >>> + *
> >>> + * This structure represents the common part of all the ISP configuration
> >>> + * blocks. Each parameters block shall embed an instance of this structure type
> >>> + * as its first member, followed by the block-specific configuration data. The
> >>> + * driver inspects this common header to discern the block type and its size and
> >>> + * properly handle the block content by casting it to the correct block-specific
> >>> + * type.
> >>> + *
> >>> + * The @type field is one of the values enumerated by
> >>> + * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
> >>> + * interpreted by the driver. The @size field specifies the size of the
> >>> + * parameters block and is used by the driver for validation purposes.
> >>> + *
> >>> + * The @enable field specifies the ISP block enablement state. The possible
> >>> + * enablement states are enumerated by :c:type:`rkisp1_ext_params_block_enable`.
> >>> + * When userspace needs to configure and enable an ISP block it shall fully
> >>> + * populate the block configuration and the @enable flag shall be set to
> >>> + * RKISP1_EXT_PARAMS_BLOCK_ENABLE. When userspace simply wants to disable the
> >>> + * ISP block the @enable flag shall be set to RKISP1_EXT_PARAMS_BLOCK_DISABLE.
> >>> + * The driver ignores the rest of the block configuration structure in this
> >>> + * case.
> >>> + *
> >>> + * If a new configuration of an ISP block has to be applied userspace shall
> >>> + * fully populate the ISP block configuration and set the @enable flag to
> >>> + * RKISP1_EXT_PARAMS_BLOCK_ENABLE.
> >>> + *
> >>> + * Userspace is responsible for correctly populating the parameters block header
> >>> + * fields (@type, @enable and @size) and the block-specific parameters.
> >>> + *
> >>> + * For example:
> >>> + *
> >>> + * .. code-block:: c
> >>> + *
> >>> + *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
> >>> + *		struct rkisp1_ext_params_bls_config *bls =
> >>> + *			(struct rkisp1_ext_params_bls_config *)block;
> >>> + *
> >>> + *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
> >>> + *		bls->header.enable = RKISP1_EXT_PARAMS_BLOCK_ENABLE;
> >>> + *		bls->header.size = sizeof(*bls);
> >>> + *
> >>> + *		bls->config.enable_auto = 0;
> >>> + *		bls->config.fixed_val.r = blackLevelRed_;
> >>> + *		bls->config.fixed_val.gr = blackLevelGreenR_;
> >>> + *		bls->config.fixed_val.gb = blackLevelGreenB_;
> >>> + *		bls->config.fixed_val.b = blackLevelBlue_;
> >>> + *	}
> >>> + *
> >>> + * @type: The parameters block type, see
> >>> + *	  :c:type:`rkisp1_ext_params_block_type`
> >>> + * @enable: The block enable flag, see
> >>> + *	   :c:type:`rkisp1_ext_params_block_enable`
> >>> + * @size: Size (in bytes) of the parameters block, including this header
> >>> + */
> >>> +struct rkisp1_ext_params_block_header {
> >>> +	__u16 type;
> >>> +	__u16 enable;
> >>> +	__u16 size;
> >>
> >> I would suggest changing this to '__u32 size;'. It ensures the header is8 bytes
> >> long (much nicer than 6), and if there is ever a block > 65535, then it is supported.
> > 
> > I'm pretty confident we will never need a block size larger than 64kB.
> 
> Hmm, famous last words :-)
> 
> > That would mean more than 64kB of data written to hardware
> > registers/SRAM for a single processing block, and it would be incredibly
> > expensive in terms of hardware. Keeping size a __u16 means we have two
> > bytes of reserved space we could possibly use later, which may come
> > handy.
> 
> i would prefer to change the size to a u32, but rename the 'enable' field
> to 'flags', and assign bit 0 to the enable/disable bit. This is a bit
> more flexible IMHO and allows for 15 bits to encode additional data.
> 
>  Blocks > 64kB could still be supported in the future by defining
> > a new version of the parameters format (RKISP1_EXT_PARAM_BUFFER_V2)
> > without needing a different 4CC.

...or making of use the existing padding. Shouldn't that be a reserved
field btw.?

I'm fine either approach, perhaps leaning slightly towards u32 size.

For the series:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> > 
> > This being said, the opposite argument can be made, that a 32-bit size
> > could come handy if we ever have larger blocks, and a new version of the
> > parameters format could be used if we ever need to add more fields to
> > the block header. I won't insist either way.
> > 
> >> i wonder if, with this change, the 'aligned(8)' attributes are even needed, but
> >> I didn't dig into that.
> > 
> > The header would become 8-bytes long, but its larger field would still
> > be 4-bytes long, so the compiler would only enforce 4-bytes aligned
> > AFAIK.
> 
> Normally the actual data blocks (in the non-extensible format) are already aligned
> to either 4 or 8 bytes (depending on whether u64 values are used). So an 8 byte
> header won't mess up the alignment.

-- 
Kind regards,

Sakari Ailus

