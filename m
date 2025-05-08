Return-Path: <linux-media+bounces-32050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC2AB006B
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 18:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CCE11C01E22
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 16:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B730528368E;
	Thu,  8 May 2025 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hLuoQ3L3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2F5283122;
	Thu,  8 May 2025 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721729; cv=none; b=tMdm/4hzaGw3AXZaR6BZ58vgUdx/qg0yaDdrzLDBNZPMZcqusbQJhH563pS8Yu9qKsrZM49il+8qGdtPFFx1ImAlHDwYaVpOe/k8FErwmbM40EZg1If7AzmjV8tStl92TDXdionr+0gPKAgGryrOZM7Yit5ycfCU8VAyjnCnM+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721729; c=relaxed/simple;
	bh=s9JXcmjaFF6UWimWMrjQo/Shp4EuldhXxeaRTElLLGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKw7dEPdQqlLSlTCG9Z//kPBXuqkw/2dTZHyUEWpGPl7rOebhQry7thO0vd031kJhsukEux7MSSqjMeZcwlcGJz/3bkGTzMnz42/KAh8S/uuaEsUxyWK4lomVL0xgQoMocN0dDVbBSKiluym39Lk9dalKTHgD6nFaG5UiMR7ayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hLuoQ3L3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:861:3a80:3300:7c3b:c7bf:b733:fa1b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3524D22A;
	Thu,  8 May 2025 18:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746721712;
	bh=s9JXcmjaFF6UWimWMrjQo/Shp4EuldhXxeaRTElLLGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLuoQ3L3nUCwvWIE8HUEgdZ/O1OEG4sAYgJuSzlRz+75DXdlHlz/P1Dhuz/Cz6eo/
	 1rYV/H462Zq/GY3FH0MViRNQ5gc1bRT++Z1fyM3DAuz/YbfWkjpx4tlKCLhlEFq80h
	 5g1KjpfimF1Yn1g4PZNdALTD3/7RiepbDkfDlohs=
Date: Thu, 8 May 2025 18:28:41 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: keke.li@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v9 08/10] media: platform: Add C3 ISP driver
Message-ID: <3ee2qcz3ckhcvd6v5mt6cjbqdysipucqokpud76meilhplhcso@im62bwviw7x4>
References: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
 <20250427-c3isp-v9-8-e0fe09433d94@amlogic.com>
 <aBzRb8ZKuGI3E_cu@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aBzRb8ZKuGI3E_cu@valkosipuli.retiisi.eu>

Hi Sakari

On Thu, May 08, 2025 at 03:44:47PM +0000, Sakari Ailus wrote:
> Hi Keke, Jacopo,
>
> On Sun, Apr 27, 2025 at 02:27:16PM +0800, Keke Li via B4 Relay wrote:
> > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > new file mode 100644
> > index 000000000000..0e0b5d61654a
> > --- /dev/null
> > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
>
> ...
>
> > +static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > +	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
> > +	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct c3_isp_params_cfg *cfg = buf->cfg;
> > +	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
> > +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> > +	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
> > +	size_t block_offset = 0;
> > +	size_t cfg_size;
> > +
> > +	/* Payload size can't be greater than the destination buffer size */
> > +	if (payload_size > params->vfmt.fmt.meta.buffersize) {
> > +		dev_dbg(params->isp->dev,
> > +			"Payload size is too large: %zu\n", payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Payload size can't be smaller than the header size */
> > +	if (payload_size < header_size) {
> > +		dev_dbg(params->isp->dev,
> > +			"Payload size is too small: %zu\n", payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * Use the internal scratch buffer to avoid userspace modifying
> > +	 * the buffer content while the driver is processing it.
> > +	 */
> > +	memcpy(cfg, usr_cfg, payload_size);
> > +
> > +	/* Only v0 is supported at the moment */
> > +	if (cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
> > +		dev_dbg(params->isp->dev,
> > +			"Invalid params buffer version: %u\n", cfg->version);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Validate the size reported in the parameter buffer header */
> > +	cfg_size = header_size + cfg->data_size;
> > +	if (cfg_size != payload_size) {
> > +		dev_dbg(params->isp->dev,
> > +			"Data size %zu and payload size %zu are different\n",
> > +			cfg_size, payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Walk the list of parameter blocks and validate them */
> > +	cfg_size = cfg->data_size;
> > +	while (cfg_size >= sizeof(struct c3_isp_params_block_header)) {
> > +		const struct c3_isp_params_block_header *block;
> > +		const struct c3_isp_params_handler *handler;
> > +
> > +		block = (struct c3_isp_params_block_header *)
> > +			&cfg->data[block_offset];
> > +
> > +		if (block->type >= ARRAY_SIZE(c3_isp_params_handlers)) {
> > +			dev_dbg(params->isp->dev,
> > +				"Invalid params block type\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (block->size > cfg_size) {
> > +			dev_dbg(params->isp->dev,
> > +				"Block size is greater than cfg size\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> > +				     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
> > +		    (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> > +		     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
> > +			dev_dbg(params->isp->dev,
> > +				"Invalid parameters block flags\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		handler = &c3_isp_params_handlers[block->type];
> > +		if (block->size != handler->size) {
> > +			dev_dbg(params->isp->dev,
> > +				"Invalid params block size\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		block_offset += block->size;
> > +		cfg_size -= block->size;
> > +	}
> > +
> > +	if (cfg_size) {
> > +		dev_dbg(params->isp->dev,
> > +			"Unexpected data after the params buffer end\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
>
> The above looks very much like rkisp1_params_prepare_ext_params() in the

slightly similar, yes :)

> Rockchip ISP driver. Instead of copying all this non-trivial code in
> verbatim here, could you instead refactor this so both the drivers could
> use the same implementation?
>

Yeah, that's the plan.

We have more drivers in the pipeline using extensible parameters and this
code (and possibily other parts) will certainly be factored out.

My plan is to add at one more user in and the do move common parts to
the framework. Would this work for you ?


> The types are different so macros will be likely needed.
>
> --
> Regards,
>
> Sakari Ailus

