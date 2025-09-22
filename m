Return-Path: <linux-media+bounces-42894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885EB8F30F
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD9FA170936
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E27E248F72;
	Mon, 22 Sep 2025 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="vVDfy2lQ"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C84182B7;
	Mon, 22 Sep 2025 06:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758523729; cv=pass; b=gkGSq2oYQRmTxpk62OBTG2oPo3+igUGO5PallBrtbYgQuLJaiMmVw4JNP8vtqfbbm3dg1IzMyH3L6ZYfEKnNI6s0WaR7YYHdqpUDC+SwTVXF0N7zpUSEML90Ptk0cb4N0cEwHnBoishiJxDbAPT4Eujtu8pxDmOH8MG1eyjYz0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758523729; c=relaxed/simple;
	bh=5IuIzBWva9dvgo3S5ZQQdPjYk/zGEYXEvzD6aLl30ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLzT2pBeFKGROSDat8rkiTxBnPFWn/vdv93Z/UMTuMIIpgcRAAGUHHAF0IKbTmw2dY/UvKFpn7Q0sVZUtfiIN1opqjtATB5jI3aR/5vcRRSVyMwGWdZ3QIkeznPiUJf7dvzX7K+3jnVR3wdTHTkJSCC4xQ41TylRw6fg1kV81YM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=vVDfy2lQ; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cVYbr454BzySx;
	Mon, 22 Sep 2025 09:48:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1758523724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c54KfsI4HptCQLSrRHNLP/BIoKR4dJKvmjofNFS6EPc=;
	b=vVDfy2lQjagkvA3af60EKADTdyriSznlKV73hf4JVOoX/TZuMUfLBjaiMLFrP7fPLmqVA3
	sjHSkHtNOQr33qQzzn/ChKilK0YiXSDfnVHTilVwX6eH1NfRryaeLN8ZDSEzdtFbJWAB78
	6h1reBho5da8Kr5sUqDENJOaNj7Qsqc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1758523724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c54KfsI4HptCQLSrRHNLP/BIoKR4dJKvmjofNFS6EPc=;
	b=lzzOw/iUyIuIcE8vKQQTUc6GdwsIGCDBvH/vR8CVyVBzzjk6Kq10jiurbsc9/suXh4ks5q
	6CbEb9suSHT2k6Cla0dSDMppZWu8+sBH1hXp52gEdPxm7ILbjK9GtqOPaCDOCy/VVdasU4
	CnNbB6c/RF3rTciion6y6P6ANl04V64=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1758523724; a=rsa-sha256; cv=none;
	b=M3OqNc5uTmbUDslVQLQe5qkl/wBTqyXYHc3Sn7R/kKSv2WrmAqld7ufyaOoFejSMsWf/qS
	ibPEaYD53GQogiMIFvtzYY57VIksUz23Eq6zSKIfLi5a3lQUvhmO4P+EI6+zZdkVOFWuXZ
	B+91lvnWlX//KGJ4YtkXpl27gEJsbls=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E8CFA634C97;
	Mon, 22 Sep 2025 09:48:39 +0300 (EEST)
Date: Mon, 22 Sep 2025 09:48:39 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
Message-ID: <aNDxR72CmvGofTHy@valkosipuli.retiisi.eu>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
 <20250915-mbus-config-active-lanes-v3-1-97a1282a410b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-mbus-config-active-lanes-v3-1-97a1282a410b@ideasonboard.com>

Hi Isaac,

Thanks for the update.

On Mon, Sep 15, 2025 at 02:18:33PM +0100, Isaac Scott wrote:
> Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> connecting to the MIPI CSI receiver of their device. Add a helper
> function that checks the mbus_config for the device driver to allow
> users to define the number of active data lanes through the
> get_mbus_config op.
> 
> If the driver does not implement this op, fall back to using the number
> of data lanes specified in device tree.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 32 ++++++++++++++++++++++++++++++++
>  include/media/v4l2-common.h           | 21 +++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 6e585bc76367..2ce8407f1397 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -571,6 +571,38 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> +
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
> +					unsigned int max_data_lanes)
> +{
> +	struct v4l2_mbus_config mbus_config = {};
> +	struct v4l2_subdev *sd;
> +	unsigned int lanes;
> +	int ret;
> +
> +	sd = media_entity_to_v4l2_subdev(pad->entity);
> +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> +			       &mbus_config);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		return ret;
> +
> +	/*
> +	 * This relies on the mbus_config being zeroed at init time.
> +	 */
> +	if (!mbus_config.bus.mipi_csi2.num_data_lanes)

I'd either use the local variable for this (lanes) either all the time, or
not at all.

> +		return max_data_lanes;
> +
> +	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> +
> +	if (lanes > max_data_lanes) {
> +		dev_dbg(sd->dev, "Active data lanes (%u) exceeds max (%u)\n",
> +			lanes, max_data_lanes);
> +		return -EINVAL;
> +	}
> +
> +	return lanes;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  /*
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a43f56578bc..6af0695460ab 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -584,6 +584,27 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  	(pad, mul, div)
>  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  			     unsigned int div);

Is your tree up to date?

> +
> +/**
> + * v4l2_get_active_data_lanes - Get number of active data lanes from driver
> + *
> + * @pad: The transmitter's media pad.
> + * @max_data_lanes: The maximum number of active data lanes supported by
> + * 		    the MIPI CSI link in hardware. This can be configured
> + * 		    in device tree.

I'd remove the latter sentence. Alternatively, it needs to be improved:
there are other sources for this information than DT.

> + *
> + * This function is intended for obtaining the number of data lanes that are
> + * actively being used by the driver for a MIPI CSI-2 device on a given media pad.
> + * This information is derived from a mbus_config fetched from a device driver
> + * using the get_mbus_config v4l2_subdev pad op.
> + *
> + * Return:
> + * * >0: Number of active data lanes
> + * * %-EINVAL: Number of active data lanes is invalid, as it exceeds the maximum
> + *	       supported data lanes listed in device tree.
> + */
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad,
> +					unsigned int max_data_lanes);
>  #else
>  #define v4l2_get_link_freq(handler, mul, div)		\
>  	__v4l2_get_link_freq_ctrl(handler, mul, div)
> 

-- 
Regards,

Sakari Ailus

