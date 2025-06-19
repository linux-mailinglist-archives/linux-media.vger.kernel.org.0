Return-Path: <linux-media+bounces-35336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDCBAE0748
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2757D1BC5FF3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 13:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3A426C3AA;
	Thu, 19 Jun 2025 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hu0SrS/6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58826B946
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339646; cv=none; b=sod90SDWzBm6aTh0jjNizE/XU3EP81vwF/Us84shcINnVzaibyQPD9cB3wWlNAxy4kjI8NEuazLEjKBE4P1/Oz8LshwAbsnlFscHisOijaT3GmahLNcbDoC/s59sxqfNEsOKc2jwg6mqU4YElNutSAZpMBCH5zMb7yMBiykBFGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339646; c=relaxed/simple;
	bh=FXs7nyDVxK4SK3znUwsgiyc8Hkow5fYGKqRbZ7iPFG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4320kE99pYxg4m96Pi6s7mdAK1bT+3moE9/+IEnQSXMr4VaIIFSZDmkH3GqF0IJP9G9ETAdUsheHMt4pwnCFjLkXyhU5MGebZuTNXDgrp8LxCGf/LHAoq47/UkiVomn5e7GGJBkqy/NN57MDK4LYJURpkKkcwvfPh8b0NJbajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hu0SrS/6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB6A943;
	Thu, 19 Jun 2025 15:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750339629;
	bh=FXs7nyDVxK4SK3znUwsgiyc8Hkow5fYGKqRbZ7iPFG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hu0SrS/6dYrgE+T9dBiaU2FJy6LNuaMmJqT0D22Pb0MeFA/IIUAVewqH4+T8IY5f5
	 /Vee9rWGlD5fJwihby7pbVYfYNfKBDqG9h10qNqSKECVujRwwM8iaOtMI3dtgnAfbx
	 RzADMp9MHEyuGvjl8yDvi04Zo5D43/Yd6muXh3o8=
Date: Thu, 19 Jun 2025 16:27:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 01/13] media: ipu6: Use correct pads for xlate_streams()
Message-ID: <20250619132704.GC32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-2-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Jun 19, 2025 at 11:15:34AM +0300, Sakari Ailus wrote:
> The arguments to v4l2_subdev_state_xlate_streams() were incorrect, the

s/were/are/

> source pads was used as the sink pad and the source pad was a constant

s/pads was/pad is/
s/pad was/pad is/

Are you sure though ? Unless I misread the code, you replace

pad0 = CSI2_PAD_SRC
pad1 = CSI2_PAD_SINK

with

pad0 = pad
pad1 = CSI2_PAD_SINK

This seems to be a correct fix, but I don't see where "the source pad
was used as the sink pad".

> (rather than the actual source pad). Fix these.
> 
> Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index da8581a37e22..6030bd23b4b9 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -354,9 +354,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
>  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
>  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  
> -	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> -						       CSI2_PAD_SINK,
> -						       &streams_mask);
> +	sink_streams =
> +		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> +						&streams_mask);

This is one of the cases where I'd write

	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
						       &streams_mask);

even if it goes to 81 columns.

>  
>  	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
>  	if (ret)
> @@ -384,9 +384,9 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
>  	struct media_pad *remote_pad;
>  	u64 sink_streams;
>  
> -	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> -						       CSI2_PAD_SINK,
> -						       &streams_mask);
> +	sink_streams =
> +		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> +						&streams_mask);

Same here.

>  
>  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
>  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);

-- 
Regards,

Laurent Pinchart

