Return-Path: <linux-media+bounces-18645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FC9876C9
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 17:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54B401F224EF
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 15:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D855156C73;
	Thu, 26 Sep 2024 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwg77Jvu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA0B4C7E;
	Thu, 26 Sep 2024 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727365548; cv=none; b=V26C0C2pAhMftsSPqOpAoF3J/ZfgHZREYxRtKKKV0jLrlkVmSppYZVgwzi0LX7yKMYSlfma1kPxKKY4h6370IOIKGMq6h7paSBiUpOQv3KhEP5nBPlJ1CRoCr3nC3OSACsgXDFCugJzsY6lCZ0rvEIjv2w28/BX4JIsahLZ/dhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727365548; c=relaxed/simple;
	bh=CLSOSrXAh5PynW/B+LjJqD06hd2C+CRjgR9f3rpXf1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcSLeX7CEEJUasjJ2cfDYGjq678OEx6dLAdNAwoD2xketAo8IAWwFel+7Ib5IxUk/vNCVY6vq+AIJFiujOSKzOt8N256OfJrRNg0EUf8p2iwkX4wGkyMjIkx8S/WAqzZ693svVilvLfwTxTweYfSF94LDrThd1HceyflCLo5uAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwg77Jvu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727365547; x=1758901547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CLSOSrXAh5PynW/B+LjJqD06hd2C+CRjgR9f3rpXf1E=;
  b=gwg77Jvu+Tqn8c3I13AwANe6pII29wWcki8bMCp3e1J9GJuxH7Ql4z9h
   qx6nAgIJWKtNgarRa6jWBGt9dUYVAEUWyEtbyOM5iqadZEQYt80/FZvBN
   wlt+xuVjNYVUJa3e3Bszbl9Yeb9N27Cu6ACsrMxjqwOtFGjPPVyzr+XW9
   krXLqfs0+Ixr9BmliyQrRLnrmrseriIVwHj1e5OOemO97PYCK44ozM14o
   HaRJkXJU0BSjHSQPdnmSECCMRLOEHbF6Nt3BtgiXMTT+QTXXE/Iz8aRE1
   P6ErjpOJtTAmESPoIOYcmjO3QJE1c5DCaZ/mGQ9NwED8DeRfU1nIgwOEE
   A==;
X-CSE-ConnectionGUID: JbqaYAH+Qkeq89Sz6BY83w==
X-CSE-MsgGUID: ikcd1GCTQ6qz+d2MPLjHRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37832740"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="37832740"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 08:45:37 -0700
X-CSE-ConnectionGUID: fo251BJlTguimYm5DXk+oQ==
X-CSE-MsgGUID: 9mrUSJZySPiqV2qq24gLxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72519331"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 08:45:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D8BF011F843;
	Thu, 26 Sep 2024 18:45:26 +0300 (EEST)
Date: Thu, 26 Sep 2024 15:45:26 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 11/11] media: i2c: ov5645: Report streams using frame
 descriptors
Message-ID: <ZvWBlivUaZ92KoAI@kekkonen.localdomain>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-12-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thanks for the set. It looks largely very nice to me, after addressing
Laurent's comments. A few comments here and possibly on other patches...

On Tue, Sep 10, 2024 at 06:06:10PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Implement the .get_frame_desc() subdev operation to report information
> about streams to the connected CSI-2 receiver. This is required to let
> the CSI-2 receiver driver know about virtual channels and data types for
> each stream.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 7f1133292ffc..c24eb6e7a7b5 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -28,6 +28,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
> @@ -829,6 +830,32 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
>  	.s_ctrl = ov5645_s_ctrl,
>  };
>  
> +static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +
> +	if (pad != OV5645_PAD_SOURCE)
> +		return -EINVAL;

As you have a single source pad, and pretty much all sensor drivers will, I
think it'd be nice to add a check for this (that it's not an internal pad)
to the caller side in v4l2-subdev.c. And of course drop this one.

> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	fmt = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0);
> +	v4l2_subdev_unlock_state(state);
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +
> +	memset(fd->entry, 0, sizeof(fd->entry));
> +
> +	fd->entry[0].pixelcode = fmt->code;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_YUV422_8B;
> +
> +	return 0;
> +}
> +
>  static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -1062,6 +1089,7 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> +	.get_frame_desc = ov5645_get_frame_desc,
>  	.enum_mbus_code = ov5645_enum_mbus_code,
>  	.enum_frame_size = ov5645_enum_frame_size,
>  	.get_fmt = v4l2_subdev_get_fmt,
> 

-- 
Kind regards,

Sakari Ailus

