Return-Path: <linux-media+bounces-28559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B1CA6B8F2
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 11:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AB1848427A
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 10:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9531B6CE0;
	Fri, 21 Mar 2025 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ry3akBWp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1B321579C;
	Fri, 21 Mar 2025 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742553687; cv=none; b=mGjzJOIabv97NQ4fbsNIdmCxTT2lF7aN8O+8GaWbQxR7zLg0XCcSnz8KA7IcDOUbBhc5QJD5dwZWU0V5ptmPmQKiOCY4i+OFoktRmia3OyXZolherQXaOLzk/J/n4JzK+vsaGbFEtyCaLVXVo/jZXAT19cM5j2jomBAzSojA8vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742553687; c=relaxed/simple;
	bh=chypnKkbqtDTyot5OV0fDkwQFJeU/VjBRT9g4yNXGEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raWZvRASqfx/lGZP7Rwco9qibhqgtSU9lHTQOfgmh5UN5GWb9bTn+Jh+IZ1zBcPE7U/ZpyLk3z2An7CxFCXOrP505+QAq/t4F9G6cFMgZhR9I8xSZyW+MI29/A1OQuWsUqc6TwdKNdz82SY8welvZMYEvjgkqi82Ld1u9JtB/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ry3akBWp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [157.231.223.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93AA4F6;
	Fri, 21 Mar 2025 11:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742553579;
	bh=chypnKkbqtDTyot5OV0fDkwQFJeU/VjBRT9g4yNXGEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ry3akBWpJvQ9CjN/U/LHMKargAU/fO0Pgz8X27psVQ8vZmkbWYkRHvqcOqRZr7NFA
	 A9L11aLOM9QCjCo3bkOtKousXOhaRPQMduMeMtKA0/L386ml2G5iClRTvnOcew92+6
	 Lo96ESQ+F2q8dFFZv5yFBBW9thlhOhGpd87uDhlA=
Date: Fri, 21 Mar 2025 12:41:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
Message-ID: <20250321104100.GC25483@pendragon.ideasonboard.com>
References: <Z90qM33DvkTMGg_x@mva-rohm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z90qM33DvkTMGg_x@mva-rohm>

Hi Matti,

Thank you for the patch.

On Fri, Mar 21, 2025 at 10:58:27AM +0200, Matti Vaittinen wrote:
> When fwnode_for_each_available_child_node() is used on the device-tree
> backed systems, it renders to same operation as the
> fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
> does only iterate through those device-tree nodes which are available.

This makes me wonder why the OF backend implements
fwnode_for_each_child_node() as fwnode_for_each_available_child_node().
Is that on purpose, or is it a bug ?

> The thp7312 uses the fwnode_for_each_available_child_node() to look up
> and handle nodes with specific names. This means the code is used only
> on the device-tree backed systems because the node names have little
> meaning on ACPI or swnode backed systems.
> 
> Use the fwnode_for_each_child_node() instead of the
> fwnode_for_each_available_child_node() In order to make it clearly
> visible that the 'availability' of the nodes does not need to be
> explicitly considered here. This will also make it clearly visible that
> the code in this driver is suitable candidate to be converted to use the
> new fwnode_for_each_named_child_node()[2] when it gets merged.
> 
> [1]: https://lore.kernel.org/all/Z9rhfJUlCbi7kA2m@kekkonen.localdomain/
> [2]: https://lore.kernel.org/all/9c3880f74476436f39d796b5c10c540ae50b722c.1742225817.git.mazziesaccount@gmail.com/
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Revision history:
> v1 => v2:
>  - rephrase the commit message to not claim the 'availability' has no
>    well defined meaning on the DT backed systems. Instead, explain that
>    the fwnode_for_each_available_child_node() only iterates through the
>    available nodes on the DT backed systems and is thus functionally
>    equivalent to the fwnode_for_each_child_node().
> 
> NOTE: The change is compile tested only! Proper testing and reviewing is
> highly appreciated (as always).
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

