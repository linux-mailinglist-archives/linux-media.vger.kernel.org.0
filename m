Return-Path: <linux-media+bounces-28534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B4EA6A880
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 15:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 891EB485AFC
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 14:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DE722332B;
	Thu, 20 Mar 2025 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Aukq6x1P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6891FB3;
	Thu, 20 Mar 2025 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480822; cv=none; b=pnW+2GYIHkfaBa8XBhsxtzMvPWydoD8rhu4cHsDQ61rMm9Arry5+JHgaU4VjlCR6abBz2EHm5i8ChArNAbhVOGYPnA3wnbGmvY3CAitQX7g7BuNRYQ4VRP8x/ruo/uShECeiWCOpnTydkhm5eLcsHR071pTlNw3lmEncMezN8NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480822; c=relaxed/simple;
	bh=ynXpSHRdDOC30oxaeMpIjavXRHa2KnGj7S1y5h9UGtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPXxcGxxl/b9mZcDIqqppkwuuCE3Ng+yKFvf01i7mi8Uv0h2ZcSzWKokqJ+aRF0EWTgJ8IJdPBTlLKBO/s8yRSeN5lsQsH5HjY0Jva2f5C9/SuS5Q8b/4U54I9SDFqHuN4A7lanM+Pi4j2RBsZcmwVyOTY8dhNYwgpRV7sU8qv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Aukq6x1P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [157.231.223.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30CA4220;
	Thu, 20 Mar 2025 15:25:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742480715;
	bh=ynXpSHRdDOC30oxaeMpIjavXRHa2KnGj7S1y5h9UGtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aukq6x1PHKsykAGPWmi8FFX6eRY31jvQBfhXUFBhFlORwomZ+odPI30/9NgetDd6l
	 skzoKqxiCMBdowKaD4RD5Ywza0DnTZnQL15Weck3ok7s2p+3tMyr3vCs7oJYbU/wD7
	 zjxdPX0q/+JwUjJDW4DU1ws5ylL7u6itam8CLkrk=
Date: Thu, 20 Mar 2025 16:26:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: thp7312: Don't require node availability
Message-ID: <20250320142635.GA14394@pendragon.ideasonboard.com>
References: <Z9vTV7tS2ZI3tM6m@mva-rohm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z9vTV7tS2ZI3tM6m@mva-rohm>

Hi Matti,

On Thu, Mar 20, 2025 at 10:35:35AM +0200, Matti Vaittinen wrote:
> It appears that the concept of available firmware nodes is not really
> applicable to the scenarios where a specific name is required from a
> node.
> 
> As explained[1] by Sakari:
> "OF only enumerates available nodes via the fwnode API, software nodes
> don't have the concept but on ACPI I guess you could have a difference
> in nodes where you have device sub-nodes that aren't available. Still,
> these ACPI device nodes don't have meaningful names in this context
> (they're 4-character object names) so you wouldn't use them like this
> anyway."
> 
> Use the fwnode_for_each_child_node() instead of the
> fwnode_for_each_available_child_node() In order to make it clearly
> visible that the 'availability' of the nodes does not need to be
> considered here.

Why not ? Node availability is a concept that exists in DT, and this
driver has only been tested on DT-based systems. Why can't we keep the
code as-is ?

> This will make it clearly visible that the code in
> this driver is suitable candidate to be converted to use the new
> fwnode_for_each_named_child_node()[2] when it gets merged.
> 
> [1]:
> https://lore.kernel.org/all/Z9rhfJUlCbi7kA2m@kekkonen.localdomain/
> [2]:
> https://lore.kernel.org/all/9c3880f74476436f39d796b5c10c540ae50b722c.1742225817.git.mazziesaccount@gmail.com/
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> NOTE: The change is compile tested only! Proper testing and reviewing is
> highly appreciated (as always).
> 
> ---
>  drivers/media/i2c/thp7312.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> index 8852c56431fe..4b66f64f8d65 100644
> --- a/drivers/media/i2c/thp7312.c
> +++ b/drivers/media/i2c/thp7312.c
> @@ -2067,7 +2067,7 @@ static int thp7312_parse_dt(struct thp7312_device *thp7312)
>  		return -EINVAL;
>  	}
>  
> -	fwnode_for_each_available_child_node(sensors, node) {
> +	fwnode_for_each_child_node(sensors, node) {
>  		if (fwnode_name_eq(node, "sensor")) {
>  			if (!thp7312_sensor_parse_dt(thp7312, node))
>  				num_sensors++;
> 
> base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6

-- 
Regards,

Laurent Pinchart

