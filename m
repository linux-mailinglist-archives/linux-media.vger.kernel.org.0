Return-Path: <linux-media+bounces-35449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B38EBAE0F90
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 00:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41554189A99E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCF6228C86;
	Thu, 19 Jun 2025 22:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oN7rmd2X"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88930E826
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 22:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750371824; cv=none; b=lrioN/gZu4n04GhBnpyVhcY4DZt+UyphPxXhlhc1e2M256BwPi1Vm6CXGIJVxpApCQ+oHsym7tj8ZnS9XTUBX7/RkIex8Df2TzTw36lFAWPklOu8GVkRNbSqHjhnUnw01Dri+k5AW9ewqZO83CO9hxk3GbyfnShX0t83aRbVusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750371824; c=relaxed/simple;
	bh=Oabf2ojMVWO4Neu48Z1fkMZhmTbGWL9+SF/OxLLnv6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZbp4loV8nQaSa+v0Hk39LQshtuaAODc1sF8ANwRZ6UvTbLJtd82amI/7CO9J7zRwE7/1HEtG9NGEuMAKU5GHzc+oGMvH2xiwciOd1sOxqbXw6mNW55hpnqBvWSvXQ4aYaAofmaiZtXdx30JOiRwtyZeYCY+YPQdt8oqeMA7Ae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oN7rmd2X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B5B5778;
	Fri, 20 Jun 2025 00:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750371807;
	bh=Oabf2ojMVWO4Neu48Z1fkMZhmTbGWL9+SF/OxLLnv6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oN7rmd2XE1lYGYwtMG013SJVPue3dDcJeBpOBo5O87GNsbetWE+5g7W9wTrldeVvQ
	 b/g942xIRdmZlwTECBJP/8lykNqi32nV9wnZ+HVN45NMCF7B92NwB1tBrgRfD+XWUS
	 ZzMmymU1ce3BYMENDHdjRyiSWIt+9mvX7rbSuRTU=
Date: Fri, 20 Jun 2025 01:23:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 10/13] media: v4l2-subdev: Add debug prints to
 v4l2_subdev_collect_streams()
Message-ID: <20250619222323.GN32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-11-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-11-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Jun 19, 2025 at 11:15:43AM +0300, Sakari Ailus wrote:
> Print streams found by v4l2_subdev_collect_streams() at debug level.

Explaining why you found this useful could help.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 932fca795d4a..c549a462dac7 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2219,6 +2219,8 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
>  		*found_streams = BIT_ULL(0);
>  		*enabled_streams =
>  			(sd->enabled_pads & BIT_ULL(pad)) ? BIT_ULL(0) : 0;
> +		dev_dbg(sd->dev,
> +			"collect_streams: sub-device does not support streams\n");

You print the subdev name below, I would print it here too. Maybe

			"collect_streams: '%s':%u: streams not supported\n",
			sd->entity.name, pad);

>  		return;
>  	}
>  
> @@ -2237,6 +2239,9 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
>  		if (src_cfg->enabled)
>  			*enabled_streams |= BIT_ULL(src_cfg->stream);
>  	}

Please add a blank line here.

> +	dev_dbg(sd->dev,
> +		"collect_streams: %s:%u found %#llx enabled %#llx\n",

		"collect_streams: '%s':%u: found %#llx, enabled: %#llx\n",

or possibly

		"%s: '%s':%u: found %#llx, enabled: %#llx\n", __func__,

(same above).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		sd->entity.name, pad, *found_streams, *enabled_streams);
>  }
>  
>  static void v4l2_subdev_set_streams_enabled(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart

