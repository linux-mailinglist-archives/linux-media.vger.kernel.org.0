Return-Path: <linux-media+bounces-32047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36807AAFF73
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 17:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DB989C552B
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 15:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF31A2798F8;
	Thu,  8 May 2025 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="RpU848U1"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1374F21ADA3;
	Thu,  8 May 2025 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719096; cv=pass; b=Fd78F+mfp6Ik6feigKycQ1YJANlHtVAZlezm5FcoKA8BN2adZGwoTCoSZYMftxJpLOfAEUhgAD0PMqpAFtYyO+xYmY2sEgL+lNfSB1+nO33HauLLvLuEQTdRsFUloxcS31nvahanEkM8nuR4tyXB84QrVm0ZfMUaubKfPN/EEg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719096; c=relaxed/simple;
	bh=/QJMe1FU3KRgGIp4JfDpUvczkHX6BPhSDRl3qX0SDBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWYVk1p8vkEn/esnx8mx6VR76ggaVkN94ekKCM2YzdBJyxS4X5ikjIOYmLuYe5DWJ7qZxSKC7IlNVsJepu60UFijKtwR1ir5uKdKY9+Vq6iwYNTXBNDbWkqbpfZ7RCFUf0W8i7NyMZpNoALMSyGJV3zQD/lvqX5KyIZwui6NXMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=RpU848U1; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Ztbzh16zLz49Q4L;
	Thu,  8 May 2025 18:44:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1746719088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sAam+l0OG4q0MqjsjSZBv6yyI6Tq+opJg9RRKMGreSQ=;
	b=RpU848U1VeBWH8L28DoeJgeiQZZ6eDt9UJSWvd7R5GiTeLDV2akXIMfrs1SL0a+pavykB9
	O86gupSZ1pm15uBWVbJoPO/smWFhnBclPPlQdQUk8+QKUK07uhL3Fw0QuhBLLFFzU02lRw
	Iu8VcwxhR5+sIf+GYvHyq8/FrJvs52PkxYGjXHK8DUQDrUP/NoUyGE7wV4SZ5DLRN4feap
	J1bbzJ0XGia0r1Drxre5mtouKEV8+eHTe98ObrPPiZhlKGoSgKDelhPeohmRzlDaxyxlte
	BWludfw86zyb0h8oHjs8KBOfnyEg+0rgGMTXPSXgVvUqlbrzlk/iA6Z3v1OzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1746719088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sAam+l0OG4q0MqjsjSZBv6yyI6Tq+opJg9RRKMGreSQ=;
	b=tcSioKMUe/vUBTBf00+o+fnvrWUy4AX0BJuUUtoQw2GvvlWf3o4frpMWJn7bN9xLiC7xQh
	3+z84IeflEWR2BjGXWsrx71yk/cBrW83sM9yxBb+ApYExqyCihVC+zfs8tIIXOyNnpSdFA
	JkBAr9/UeQHzpi1mG6IzBmlVZgYYk/919PV4LtjeujmJBa+Wx4GAExjxMrgT3qMzxDkPWw
	w+HxZXLZ0t/G+uI32Qn5oxeMlzIgBrL2GEToWWBGWANoDdgAso9JW1uhhmPUOhOP0jLIZz
	pI/qH7flnhSzvULdC8HNH6UbDxHokBwImkwl9EghWk4jpzcuPfQ72nm1+Btnzg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1746719088; a=rsa-sha256;
	cv=none;
	b=aJyklILiuQRiYeSB6wW7MgQvU5mQLgYmIRxomEcxcdX3U0ySVulvTQAhy/L6uoCQiMwcb3
	RKZtNQ9G5ozsXKs2GB8unRDxabBN4yx4X6nNVO66sf0RpPxlXMCRAx0arcGv4mufp3UGDU
	kXypTscFat9Y4BZNhScZlQWL5mer44cgN8LGBJQZzTEzbmbvpwEkg9Zm9lVWdqJL5gtRc8
	Mam+8iwTfBBTA8LXe6nyg/0QMQgGGLA6Tiy8jTHDkSgAzfbuH7OEZgHZM/OpQ4dasB5Hml
	eDpTKrTprodSJEXCrlN0ISqurY1zriNT7coI/TJBbOlWWooYNnVWOHtwoEs6rg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A028D634C93;
	Thu,  8 May 2025 18:44:47 +0300 (EEST)
Date: Thu, 8 May 2025 15:44:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v9 08/10] media: platform: Add C3 ISP driver
Message-ID: <aBzRb8ZKuGI3E_cu@valkosipuli.retiisi.eu>
References: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
 <20250427-c3isp-v9-8-e0fe09433d94@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427-c3isp-v9-8-e0fe09433d94@amlogic.com>

Hi Keke, Jacopo,

On Sun, Apr 27, 2025 at 02:27:16PM +0800, Keke Li via B4 Relay wrote:
> diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> new file mode 100644
> index 000000000000..0e0b5d61654a
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c

...

> +static int c3_isp_params_vb2_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct c3_isp_params_buffer *buf = to_c3_isp_params_buffer(vbuf);
> +	struct c3_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
> +	struct c3_isp_params_cfg *cfg = buf->cfg;
> +	struct c3_isp_params_cfg *usr_cfg = vb2_plane_vaddr(vb, 0);
> +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> +	size_t header_size = offsetof(struct c3_isp_params_cfg, data);
> +	size_t block_offset = 0;
> +	size_t cfg_size;
> +
> +	/* Payload size can't be greater than the destination buffer size */
> +	if (payload_size > params->vfmt.fmt.meta.buffersize) {
> +		dev_dbg(params->isp->dev,
> +			"Payload size is too large: %zu\n", payload_size);
> +		return -EINVAL;
> +	}
> +
> +	/* Payload size can't be smaller than the header size */
> +	if (payload_size < header_size) {
> +		dev_dbg(params->isp->dev,
> +			"Payload size is too small: %zu\n", payload_size);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Use the internal scratch buffer to avoid userspace modifying
> +	 * the buffer content while the driver is processing it.
> +	 */
> +	memcpy(cfg, usr_cfg, payload_size);
> +
> +	/* Only v0 is supported at the moment */
> +	if (cfg->version != C3_ISP_PARAMS_BUFFER_V0) {
> +		dev_dbg(params->isp->dev,
> +			"Invalid params buffer version: %u\n", cfg->version);
> +		return -EINVAL;
> +	}
> +
> +	/* Validate the size reported in the parameter buffer header */
> +	cfg_size = header_size + cfg->data_size;
> +	if (cfg_size != payload_size) {
> +		dev_dbg(params->isp->dev,
> +			"Data size %zu and payload size %zu are different\n",
> +			cfg_size, payload_size);
> +		return -EINVAL;
> +	}
> +
> +	/* Walk the list of parameter blocks and validate them */
> +	cfg_size = cfg->data_size;
> +	while (cfg_size >= sizeof(struct c3_isp_params_block_header)) {
> +		const struct c3_isp_params_block_header *block;
> +		const struct c3_isp_params_handler *handler;
> +
> +		block = (struct c3_isp_params_block_header *)
> +			&cfg->data[block_offset];
> +
> +		if (block->type >= ARRAY_SIZE(c3_isp_params_handlers)) {
> +			dev_dbg(params->isp->dev,
> +				"Invalid params block type\n");
> +			return -EINVAL;
> +		}
> +
> +		if (block->size > cfg_size) {
> +			dev_dbg(params->isp->dev,
> +				"Block size is greater than cfg size\n");
> +			return -EINVAL;
> +		}
> +
> +		if ((block->flags & (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> +				     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) ==
> +		    (C3_ISP_PARAMS_BLOCK_FL_ENABLE |
> +		     C3_ISP_PARAMS_BLOCK_FL_DISABLE)) {
> +			dev_dbg(params->isp->dev,
> +				"Invalid parameters block flags\n");
> +			return -EINVAL;
> +		}
> +
> +		handler = &c3_isp_params_handlers[block->type];
> +		if (block->size != handler->size) {
> +			dev_dbg(params->isp->dev,
> +				"Invalid params block size\n");
> +			return -EINVAL;
> +		}
> +
> +		block_offset += block->size;
> +		cfg_size -= block->size;
> +	}
> +
> +	if (cfg_size) {
> +		dev_dbg(params->isp->dev,
> +			"Unexpected data after the params buffer end\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

The above looks very much like rkisp1_params_prepare_ext_params() in the
Rockchip ISP driver. Instead of copying all this non-trivial code in
verbatim here, could you instead refactor this so both the drivers could
use the same implementation?

The types are different so macros will be likely needed.

-- 
Regards,

Sakari Ailus

