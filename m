Return-Path: <linux-media+bounces-35365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA02AE0BA9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 19:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CA964A2631
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 17:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811D828B4EC;
	Thu, 19 Jun 2025 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IhTE3HgG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0C23CB
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352621; cv=none; b=kUofqx+seM4iqJ4VYz8JhM3wGqJ61NxqLa/U3Mf/6bGh+H4OBXn67oUC7DzTrSwbAeowKzy8AnXf8G242FH4RHd1zR3Ha4nd2Hhuk6li+T6ptF1v/GjANMIFI7MH9YT15ateF33J1VTLRwcsUFjZTplztR7gC8qvUMPOPUay+3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352621; c=relaxed/simple;
	bh=84nnx0qEEfo38tV6gI2NcGypOipWhPDHzZbkoitiWGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGcrggjusLGnW4QPR+RRsmdiXM+39kyQeyg3zQkOUN5jtmPnwcMDTMs9s63urx1GWHkf6s7ccXbrC2H+5uIadGNDF0DynhlwvFld9KvE/+2WoEH7qMYPRRsxOEHLcKmW7m76bdTEhEEZ1tm4qIZ9xAF/HE8sfwv5AMRypaOY51c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IhTE3HgG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C032C346;
	Thu, 19 Jun 2025 19:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750352605;
	bh=84nnx0qEEfo38tV6gI2NcGypOipWhPDHzZbkoitiWGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IhTE3HgGMRVNNKdgDPsCwzGTl6Ov/VHZZlRdyL1Ihtp3GY26Nk0bGUVFcn8E3xsxt
	 CK/vVyLJpZlCuVYsZi4JQ0SR0y/GterJZ1mSkfmuZtyKhSqj5xyylO4ZBBN0BxGImm
	 4Eedp2pNAKCpQDBnRN/i4Zb51mJT3dWnyWt+Kq48=
Date: Thu, 19 Jun 2025 20:03:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 08/13] media: v4l2-subdev: Print early in
 v4l2_subdev_{enable,disable}_streams()
Message-ID: <20250619170320.GJ32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-9-sakari.ailus@linux.intel.com>

Hi Sakari,

On Thu, Jun 19, 2025 at 11:15:41AM +0300, Sakari Ailus wrote:
> Print debug messages early in v4l2_subdev_enable_streams() and
> v4l2_subdev_disable_streams(), before sanity checks take place. This can
> help figuring out why something goes wrong, in driver development or
> otherwise.
> 
> Also print the name of the sub-device where streaming is to be enabled or
> disabled.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 5afdd9d548b5..6bc855058ca6 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2273,6 +2273,9 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  	bool use_s_stream;
>  	int ret;
>  
> +	dev_dbg(dev, "enable streams %s:%u/%#llx\n", sd->entity.name, pad,
> +		streams_mask);

I suppose there can be multiple subdevs per struct device, so printing
the entity name can be useful. I'd put quotes around '%s' as the entity
name can contain spaces. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	/* A few basic sanity checks first. */
>  	if (pad >= sd->entity.num_pads)
>  		return -EINVAL;
> @@ -2320,8 +2323,6 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  		goto done;
>  	}
>  
> -	dev_dbg(dev, "enable streams %u:%#llx\n", pad, streams_mask);
> -
>  	already_streaming = v4l2_subdev_is_streaming(sd);
>  
>  	if (!use_s_stream) {
> @@ -2373,6 +2374,9 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  	bool use_s_stream;
>  	int ret;
>  
> +	dev_dbg(dev, "disable streams %s:%u/%#llx\n", sd->entity.name, pad,
> +		streams_mask);
> +
>  	/* A few basic sanity checks first. */
>  	if (pad >= sd->entity.num_pads)
>  		return -EINVAL;
> @@ -2420,8 +2424,6 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  		goto done;
>  	}
>  
> -	dev_dbg(dev, "disable streams %u:%#llx\n", pad, streams_mask);
> -
>  	if (!use_s_stream) {
>  		/* Call the .disable_streams() operation. */
>  		ret = v4l2_subdev_call(sd, pad, disable_streams, state, pad,

-- 
Regards,

Laurent Pinchart

