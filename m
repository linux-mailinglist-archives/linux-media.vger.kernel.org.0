Return-Path: <linux-media+bounces-33998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E8CACC4E0
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 13:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48AAE1888835
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 11:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF0322A804;
	Tue,  3 Jun 2025 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HEyIEXYZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E774F5E0
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948654; cv=none; b=QwP+MFfynu4GPW+mMCVZFlcteYzwLp2O4pnGH+JHWj0WW5RN8mu/OeHy1r30pEFQKUOuw20VXtybw175xAlHTy+tQP/M2vpdVko0F43xHYDm06g7gQKdJ3gYlJBloqnvi9b+avx/2rK7UevdVyl0HIQaDQR5NbCJ4QPtwIC+rKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948654; c=relaxed/simple;
	bh=ihhtNsUDT4h37P3VApQ1G8HxK8H40hU7EK0DH+lp5ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd1bwUp1S/4XbUQzR5uHxPo79Hnn4Efk1v743C+jqc2dK5DyPmY/Jmcc4bqv7OgYJMJ4Fam1h3j1KdISN0gO4n+GlU/ZNRdVVgN11mJi0Ix88sm56+EI2TyHOXVKw5klBf27oPFvQ/05VtkzSLARUQ5/GJrTWrGY1SdxqYaD9FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HEyIEXYZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA2F2496;
	Tue,  3 Jun 2025 13:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748948648;
	bh=ihhtNsUDT4h37P3VApQ1G8HxK8H40hU7EK0DH+lp5ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEyIEXYZv1tbAoMyzLplWgw1RZI8NF2eKaL9Lhedh1tCZ5Znwq9xjukMLvE1S4gqH
	 Gz2BzXrwkmEIwGySkBpEyaMM9sKeWKk7XaswS3Uez9yjzET0IjKlnk4F4XGkrxWpE2
	 Tu/VG7nZul3JgEW2nOsEeTT147bLmgq5E/qxWQ4o=
Date: Tue, 3 Jun 2025 14:03:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 11/12] media: mt9m114: Return -EPROBE_DEFER if no
 endpoint is found
Message-ID: <20250603110359.GC27361@pendragon.ideasonboard.com>
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-12-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250531163148.83497-12-hansg@kernel.org>

Hi Hans,

Thank you for the patch.

On Sat, May 31, 2025 at 06:31:46PM +0200, Hans de Goede wrote:
> With IPU# bridges, endpoints may only be created when the IPU bridge is
> initialized. This may happen after the sensor driver's first probe().
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/i2c/mt9m114.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index c4d3122d698e..72914c47ec9a 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -2399,11 +2399,14 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>  	struct fwnode_handle *ep;
>  	int ret;
>  
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
> +	 * wait for this.
> +	 */
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> -	if (!ep) {
> -		dev_err(&sensor->client->dev, "No endpoint found\n");
> -		return -EINVAL;
> -	}
> +	if (!ep)
> +		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");

That's a bit annoying, as in non-ACPI systems we'll then get probe
deferral, making the issue more difficult to debug.

Is there a way, on IPU-based systems, to delay probing the sensor until
the bridge has been initialized ? I suppose this is a question for
Sakari too.

>  
>  	sensor->bus_cfg.bus_type = V4L2_MBUS_UNKNOWN;
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);

-- 
Regards,

Laurent Pinchart

