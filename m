Return-Path: <linux-media+bounces-32082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F63AB0C8B
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A66F1BC17BF
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB24272E48;
	Fri,  9 May 2025 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="KMHo14Xh"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAC26A1DA;
	Fri,  9 May 2025 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777862; cv=pass; b=ARmPINbTD5NIL2EvUVbzQ5BmpjYnA1HL3P6C9kqYgVNB3SWAehMkgA0D82kCtbhoia13usTvARW4MqQd1/79/yAq6bCaNSqaNYe201b0Iw8B0g2uDLVLmeZj5oUvT8Z9LmTpDLohWXRoI79W+G7WogEUX3fW97E0mfvvOK84l8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777862; c=relaxed/simple;
	bh=WSVVSjR9v0F9nafz54kXcMqbh19Ccfz/FujkMkLpUYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnvDMg0P0xAWB19TZZHJxLaPXwBsFl+nxhMH3CBOCz13mrWo13Cl62Ibz1VFQuOR73i+z06NPc/ZS2v8FV5RYuVDoSZK2M09JJLehNikb88nBvlRHQRO+ppmL9OwZ+M4flGPPCsgzamOHtr+dGNizy/o+4eFaPg654k5Td6kv50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=KMHo14Xh; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Zv1jf1By4z49PvQ;
	Fri,  9 May 2025 11:04:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1746777846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndTlxJz7Yz555emOllahd5opBiIP16U554waEDHF+Jg=;
	b=KMHo14XhDWvBQT3HhI0JmQto5LDLoe9tZWYOzWwd+sAjepBQ073Mtb0PWON2DPrJrCDhKC
	8HYpnhxg8EwmdGdkQGB7NRrOByIHmRdjQDOV5jjbw/4lncUwKhAFnRR+6BxB8mZ56twjgS
	zj0jd4RINB2fJ6tTME4dLUAKA6K5WDc23jmM8vbu0z2E1QqynqbNMRlu0jaS5/6way/Llz
	r7PL4CKWQPClKue0J+6xQftEv0DnygBlXuzshIcObLPJARnWjDp+ONrP9BDLCVh2MacG+g
	7J0sHfV6OVXsfviugn2/HgwpHuPg6SVpPcD0/zqpVBkFEWkJGcUoe/czhC4ooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1746777846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ndTlxJz7Yz555emOllahd5opBiIP16U554waEDHF+Jg=;
	b=MkWYbPvWFr/yT/Ctpf2vharFX9xEE3XUnfmQJKfvWS5h1cdLWK2b6+vu9jSckFTpETvWuT
	0RL1Cdn8k3motXoux7whfFZS8XrmCWdMgPMGq/vib/AgVZO5Vjp3u/ag/C6LpDtq8aXY4U
	rxWO0LfpowWw7J/xLlrZK1ejNFqPXiVrv1RL0EuNDSXMtjNQ0FL6d2U0esRxAkqVZhcD+J
	YuVa/m74yQRkBDTDMrNk/79obYvYilWz2q6UYMJ3/P4hg48QoKlCIvvgW7qtRNWlC/5Ghp
	WgFRxvcCZFNY2Jr4qyQlvrkKyw+01vxp6O0W0hO9LYoqZX6jaoI0WHdBV4T4nw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1746777846; a=rsa-sha256;
	cv=none;
	b=bXTpiWsJT8Bbdebi8ffP1aRzBS25wTevWvZ2s1kc+v3rUobKDOJ+yoM4Op5xOc/9OEGxvp
	ro290OXmkHYKuWXbfADrBlUyRN7QIVz9z1g8ROEAR7CJimEQignl900Q4Ft7EnMJqCcbR3
	bUdUM2G9g+jKuawGLKlQ4ZYQ8N5fHfiVCG0lq4SFW8E93acwysalmKFbzY03Wpe6n8qvJZ
	VZd2uZFQuubgbTT92oQWFAz8hT3etjOewhd4U1TlTv0F4r3xzFnFpe90t5YzzOA7C8fYLp
	9sO1pUDHgGuwVuw2U5JQetBYZDltBpuV9AoHgXZjikLlrcZwjP0iRD42fsO0kg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BDF4C634C93;
	Fri,  9 May 2025 11:04:04 +0300 (EEST)
Date: Fri, 9 May 2025 08:04:04 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: keke.li@amlogic.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com
Subject: Re: [PATCH v9 08/10] media: platform: Add C3 ISP driver
Message-ID: <aB229JXOH7E98clR@valkosipuli.retiisi.eu>
References: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
 <20250427-c3isp-v9-8-e0fe09433d94@amlogic.com>
 <aBzRb8ZKuGI3E_cu@valkosipuli.retiisi.eu>
 <3ee2qcz3ckhcvd6v5mt6cjbqdysipucqokpud76meilhplhcso@im62bwviw7x4>
 <aB0bhkihpY81TrII@valkosipuli.retiisi.eu>
 <ihqj5zq34qyilswcyiiiefur4bm2k4v4sd7tujh6oawtw5gwra@h63zl25azvgm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ihqj5zq34qyilswcyiiiefur4bm2k4v4sd7tujh6oawtw5gwra@h63zl25azvgm>

Hi Jacopo,

On Fri, May 09, 2025 at 10:00:38AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, May 08, 2025 at 09:00:54PM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Thu, May 08, 2025 at 06:28:41PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Thu, May 08, 2025 at 03:44:47PM +0000, Sakari Ailus wrote:
> > > > Hi Keke, Jacopo,
> > > >
> > > > On Sun, Apr 27, 2025 at 02:27:16PM +0800, Keke Li via B4 Relay wrote:
> > > > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > > > new file mode 100644
> > > > > index 000000000000..0e0b5d61654a
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > >
> > > > ...
> > > >
> > > > > +static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
> > > > > +{
> > > > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > > > +	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
> > > > > +	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > > > > +	struct c3_isp_params_cfg *cfg = buf->cfg;
> > > > > +	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
> > > > > +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> > > > > +	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
> > > > > +	size_t block_offset = 0;
> > > > > +	size_t cfg_size;
> > > > > +
> > > > > +	/* Payload size can't be greater than the destination buffer size */
> > > > > +	if (payload_size > params->vfmt.fmt.meta.buffersize) {
> > > > > +		dev_dbg(params->isp->dev,
> > > > > +			"Payload size is too large: %zu\n", payload_size);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	/* Payload size can't be smaller than the header size */
> > > > > +	if (payload_size < header_size) {
> > > > > +		dev_dbg(params->isp->dev,
> > > > > +			"Payload size is too small: %zu\n", payload_size);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	/*
> > > > > +	 * Use the internal scratch buffer to avoid userspace modifying
> > > > > +	 * the buffer content while the driver is processing it.
> > > > > +	 */
> > > > > +	memcpy(cfg, usr_cfg, payload_size);
> > > > > +
> > > > > +	/* Only v0 is supported at the moment */
> > > > > +	if (cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
> > > > > +		dev_dbg(params->isp->dev,
> > > > > +			"Invalid params buffer version: %u\n", cfg->version);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	/* Validate the size reported in the parameter buffer header */
> > > > > +	cfg_size = header_size + cfg->data_size;
> > > > > +	if (cfg_size != payload_size) {
> > > > > +		dev_dbg(params->isp->dev,
> > > > > +			"Data size %zu and payload size %zu are different\n",
> > > > > +			cfg_size, payload_size);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	/* Walk the list of parameter blocks and validate them */
> > > > > +	cfg_size = cfg->data_size;
> > > > > +	while (cfg_size >= sizeof(struct c3_isp_params_block_header)) {
> > > > > +		const struct c3_isp_params_block_header *block;
> > > > > +		const struct c3_isp_params_handler *handler;
> > > > > +
> > > > > +		block = (struct c3_isp_params_block_header *)
> > > > > +			&cfg->data[block_offset];
> > > > > +
> > > > > +		if (block->type >= ARRAY_SIZE(c3_isp_params_handlers)) {
> > > > > +			dev_dbg(params->isp->dev,
> > > > > +				"Invalid params block type\n");
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		if (block->size > cfg_size) {
> > > > > +			dev_dbg(params->isp->dev,
> > > > > +				"Block size is greater than cfg size\n");
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> > > > > +				     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
> > > > > +		    (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> > > > > +		     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
> > > > > +			dev_dbg(params->isp->dev,
> > > > > +				"Invalid parameters block flags\n");
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		handler = &c3_isp_params_handlers[block->type];
> > > > > +		if (block->size != handler->size) {
> > > > > +			dev_dbg(params->isp->dev,
> > > > > +				"Invalid params block size\n");
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		block_offset += block->size;
> > > > > +		cfg_size -= block->size;
> > > > > +	}
> > > > > +
> > > > > +	if (cfg_size) {
> > > > > +		dev_dbg(params->isp->dev,
> > > > > +			"Unexpected data after the params buffer end\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > >
> > > > The above looks very much like rkisp1_params_prepare_ext_params() in the
> > >
> > > slightly similar, yes :)
> > >
> > > > Rockchip ISP driver. Instead of copying all this non-trivial code in
> > > > verbatim here, could you instead refactor this so both the drivers could
> > > > use the same implementation?
> > > >
> > >
> > > Yeah, that's the plan.
> > >
> > > We have more drivers in the pipeline using extensible parameters and this
> > > code (and possibily other parts) will certainly be factored out.
> > >
> > > My plan is to add at one more user in and the do move common parts to
> > > the framework. Would this work for you ?
> >
> > How about refactoring the two users to use a common framework first and
> > then using it in the third? :-) The more copies there are, the greater the
> > task to unify them.
> >
> 
> Sorry, I probably wasn't clear.
> 
> When upstreaming the third user of extensible parameters I will move
> the common parts to the framework and port these two existing users to
> use the new helpers.
> 
> It's not my intention to upstream a third user and then port all of
> them to use a common helper later on ;)

Ack, thanks for confirming this!

-- 
Regards,

Sakari Ailus

