Return-Path: <linux-media+bounces-32060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9DAB0522
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 23:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2280D1892D32
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 21:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A335121E08D;
	Thu,  8 May 2025 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Q1Nkzfye"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EC91F8750;
	Thu,  8 May 2025 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738065; cv=pass; b=PC56bcCw4U4h4o6eEx5xAKQ7t+nFgHojvkitHanwEHnkNFCnqvcsEGhTGxp6YGT0eDRLR0+3gfF110f/TvaQUffCf5YxRNO5qG9auPD1DhVuGT7ves5kI7l15FyxDhLA4HrhjGxxgWPMudtid1mZw6qcMQ7F1ASUuDis1+SfQXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738065; c=relaxed/simple;
	bh=1Lon4LM9waC3VpLnPCCZeGTVE+HncPBV1C3iVXisE/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmzHMBzl1egIwiA+kjR0mNm59KIfZSFGpQ6A5mqk5LW0M433JWrkCKwJtJ1gHN8g9POkf5XXBUZtscdOBPrC2E3J3aVYbHgFxBm1gG1hDjv7NpCZ0FPhZRyiABAOfBLSnAesrUPdLUzS81s3sTwXh4samtb3vd/NA16///S+hJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Q1Nkzfye; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Ztl0Q6jk7z49PvQ;
	Fri,  9 May 2025 00:00:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1746738055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oE4AwKamIQX7sdfsFR4kvsyn0RVFtIAYnU+qUhTKpCI=;
	b=Q1NkzfyeIAnkfDNdhqHra9Bng7Sxt7VGUBFiWFAkVdSkvmu7KG0i1s/0qLyaE47HQA/IUP
	ZOvwsUIyKYCuww91t+E2RyQbxSKrO+YgjN57xAYrDGS3Ya7tn5J61EPhFrhb6l4RLXXWg1
	WS6E+jaHaQjZR2sj3LYW3dn0BpVCsVh2/11+1fpoPrPkLnsQmNpjHTISi7bPPl4SPvQhN2
	STQHyYEurPzGMHp9B8Q+/pvDwwXgMERyGufF5GImfeNsd900QeeX1qXnIJ3lr0z9nqZVPG
	vSAOsOFpkE0U9qgmojEZUeSOA40/1lcNw1ANqkgMFzI1Cih5KKdghV9FCk5dwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1746738055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oE4AwKamIQX7sdfsFR4kvsyn0RVFtIAYnU+qUhTKpCI=;
	b=dQ9TmbcOBE5QihzXH/Is+QvL3vGWQHKby0NVbCwlrQWV1cMysc7tFnjF/wsTp14vfYl+7V
	58EGZYh/fYgEFd/CQn8vEJQgVJf6SF/XMGTMs6wooKaUFjdiOfohjc8c2ARPx9XPoURk60
	mQ159qufEQAboJtjmllKWai8KvDRTW/yEdrqzdfACbdi9jsf+AV4WGqlHv5T2OSzst6nA9
	jND1XYSGtH7KWhf3MQ14yFSVT9tGwJeQvdMHh1GRrA/dtn3bCxv3cOU7P1Y7ci59bA/XnS
	a0pHe7vLQvyNvQ8ibIRbb1QsXv7T1tJ/bjD58qB6zzDuTWTMiGPn334VdoAVEg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1746738055; a=rsa-sha256;
	cv=none;
	b=nIThwl5TCeLzvVuI7VOvnlT1K4yv/1tLxnFoMUu/GAZTHCDk+LbJN1NWUULK0t1RAhhAdd
	dv768jTIrRrF7keFwMi7Py9eLWE22OfhhvwFIfsDp2qz9k+zFjvERZlIDbDerFNmLUShL2
	TBn6/IX63Uu7YU6FoCHl3ejgx4vsrHKw0GZLm8lyylK2QDyhyjNmKMAdMYHdVgAdPUpw+g
	xHrNZW0XqHvWr3L1JE4bxWgr2XJaARWV4uKIwrlZfyq4ysDOuhFfYzN+k1vKmSRJ7chQ9K
	aIi40VGPC+mYA1WEqfbxh6YzUmD+NCR56vsQQEJ0LBiP6B8TJVJtIpkIAnvA5A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 53147634C93;
	Fri,  9 May 2025 00:00:54 +0300 (EEST)
Date: Thu, 8 May 2025 21:00:54 +0000
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
Message-ID: <aB0bhkihpY81TrII@valkosipuli.retiisi.eu>
References: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
 <20250427-c3isp-v9-8-e0fe09433d94@amlogic.com>
 <aBzRb8ZKuGI3E_cu@valkosipuli.retiisi.eu>
 <3ee2qcz3ckhcvd6v5mt6cjbqdysipucqokpud76meilhplhcso@im62bwviw7x4>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ee2qcz3ckhcvd6v5mt6cjbqdysipucqokpud76meilhplhcso@im62bwviw7x4>

Hi Jacopo,

On Thu, May 08, 2025 at 06:28:41PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, May 08, 2025 at 03:44:47PM +0000, Sakari Ailus wrote:
> > Hi Keke, Jacopo,
> >
> > On Sun, Apr 27, 2025 at 02:27:16PM +0800, Keke Li via B4 Relay wrote:
> > > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> > > new file mode 100644
> > > index 000000000000..0e0b5d61654a
> > > --- /dev/null
> > > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> >
> > ...
> >
> > > +static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
> > > +{
> > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > +	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
> > > +	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct c3_isp_params_cfg *cfg = buf->cfg;
> > > +	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
> > > +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> > > +	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
> > > +	size_t block_offset = 0;
> > > +	size_t cfg_size;
> > > +
> > > +	/* Payload size can't be greater than the destination buffer size */
> > > +	if (payload_size > params->vfmt.fmt.meta.buffersize) {
> > > +		dev_dbg(params->isp->dev,
> > > +			"Payload size is too large: %zu\n", payload_size);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Payload size can't be smaller than the header size */
> > > +	if (payload_size < header_size) {
> > > +		dev_dbg(params->isp->dev,
> > > +			"Payload size is too small: %zu\n", payload_size);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Use the internal scratch buffer to avoid userspace modifying
> > > +	 * the buffer content while the driver is processing it.
> > > +	 */
> > > +	memcpy(cfg, usr_cfg, payload_size);
> > > +
> > > +	/* Only v0 is supported at the moment */
> > > +	if (cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
> > > +		dev_dbg(params->isp->dev,
> > > +			"Invalid params buffer version: %u\n", cfg->version);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Validate the size reported in the parameter buffer header */
> > > +	cfg_size = header_size + cfg->data_size;
> > > +	if (cfg_size != payload_size) {
> > > +		dev_dbg(params->isp->dev,
> > > +			"Data size %zu and payload size %zu are different\n",
> > > +			cfg_size, payload_size);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Walk the list of parameter blocks and validate them */
> > > +	cfg_size = cfg->data_size;
> > > +	while (cfg_size >= sizeof(struct c3_isp_params_block_header)) {
> > > +		const struct c3_isp_params_block_header *block;
> > > +		const struct c3_isp_params_handler *handler;
> > > +
> > > +		block = (struct c3_isp_params_block_header *)
> > > +			&cfg->data[block_offset];
> > > +
> > > +		if (block->type >= ARRAY_SIZE(c3_isp_params_handlers)) {
> > > +			dev_dbg(params->isp->dev,
> > > +				"Invalid params block type\n");
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		if (block->size > cfg_size) {
> > > +			dev_dbg(params->isp->dev,
> > > +				"Block size is greater than cfg size\n");
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> > > +				     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
> > > +		    (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> > > +		     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
> > > +			dev_dbg(params->isp->dev,
> > > +				"Invalid parameters block flags\n");
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		handler = &c3_isp_params_handlers[block->type];
> > > +		if (block->size != handler->size) {
> > > +			dev_dbg(params->isp->dev,
> > > +				"Invalid params block size\n");
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		block_offset += block->size;
> > > +		cfg_size -= block->size;
> > > +	}
> > > +
> > > +	if (cfg_size) {
> > > +		dev_dbg(params->isp->dev,
> > > +			"Unexpected data after the params buffer end\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> >
> > The above looks very much like rkisp1_params_prepare_ext_params() in the
> 
> slightly similar, yes :)
> 
> > Rockchip ISP driver. Instead of copying all this non-trivial code in
> > verbatim here, could you instead refactor this so both the drivers could
> > use the same implementation?
> >
> 
> Yeah, that's the plan.
> 
> We have more drivers in the pipeline using extensible parameters and this
> code (and possibily other parts) will certainly be factored out.
> 
> My plan is to add at one more user in and the do move common parts to
> the framework. Would this work for you ?

How about refactoring the two users to use a common framework first and
then using it in the third? :-) The more copies there are, the greater the
task to unify them.

-- 
Regards,

Sakari Ailus

