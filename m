Return-Path: <linux-media+bounces-33011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C490BABF272
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23A553A76C5
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 11:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C477261390;
	Wed, 21 May 2025 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iSFZeDwC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F4F46B5;
	Wed, 21 May 2025 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747825793; cv=none; b=lpxuYaGI4pQiSgxn4uZPzGSKrWgQ58/zXD79f9HNKwx2YE+BnLPaME+kN8DCycHFz/vV3CmABf89kbsyeNNLpYzOU2HW/MzaRABjXuABoVotfm5zAr1JNSRvSo3SGHiCh0q2aG42HqXjAAo0wee8+njcDshqRJkZv3r9FErpGRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747825793; c=relaxed/simple;
	bh=FmqSkLHmVtDEPzk1G+ecbkXZ5kJ7HmbgVarSfVR4pgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyGNLbSVWPkuuCkE3I+SzrA0EoazHGWTZWxDP8sRiUbMOOPMAZc8mn3ebZOecAQyOhlSlxT+ejOQD5HNgs9bw5YZjBKjrMLwZ0XII2pBZoxlVdCLbvUw2GcU7BsbUTJhLGYRUCC+gCnWWwGJ1CIxiJk4hsTcWp4ws8DCWjJk5PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iSFZeDwC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A4346AF;
	Wed, 21 May 2025 13:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747825769;
	bh=FmqSkLHmVtDEPzk1G+ecbkXZ5kJ7HmbgVarSfVR4pgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSFZeDwCdXXSz7HshnKL/oVl3j97zRV7ocgUmoYOGOx9Ts0pXvLzKCGzk0a4cuALV
	 0QsizBBTnsAKe3ih36NOr3HGaQWjEFg55RfPYzhQzwZnntVGlUGxA/6VyvYYM0TfbB
	 GTCfgi//hI3p3FzrRM8PF+wMyeTuKcEHpFJjLT6k=
Date: Wed, 21 May 2025 13:09:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
	mchehab@kernel.org, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, arnd@arndb.de,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <20250521110944.GG12514@pendragon.ideasonboard.com>
References: <20250521104115.176950-1-mehdi.djait@linux.intel.com>
 <mwh7xx675kulx6tdebuvqtdjfa4ih3ehi2brrcdxfemfnvxsrs@i5nxkvfskfhe>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mwh7xx675kulx6tdebuvqtdjfa4ih3ehi2brrcdxfemfnvxsrs@i5nxkvfskfhe>

On Wed, May 21, 2025 at 12:52:08PM +0200, Mehdi Djait wrote:
> Hi everyone,
> 
> On Wed, May 21, 2025 at 12:41:15PM +0200, Mehdi Djait wrote:
> >  drivers/media/v4l2-core/v4l2-common.c | 46 +++++++++++++++++++++++++++
> >  include/media/v4l2-common.h           | 25 +++++++++++++++
> >  2 files changed, 71 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 4ee4aa19efe6..6099acd339ad 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -34,6 +34,9 @@
> >   * Added Gerd Knorrs v4l1 enhancements (Justin Schoeman)
> >   */
> >  
> > +#include <linux/clk.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/clk-provider.h>
> >  #include <linux/module.h>
> >  #include <linux/types.h>
> >  #include <linux/kernel.h>
> > @@ -665,3 +668,46 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> > +
> > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > +{
> > +	const char *clk_id __free(kfree) = NULL;
> > +	struct clk_hw *clk_hw;
> > +	struct clk *clk;
> > +	u32 rate;
> > +	int ret;
> > +
> > +	clk = devm_clk_get_optional(dev, id);
> > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > +
> > +	if (clk) {
> > +		if (!ret) {
> > +			ret = clk_set_rate(clk, rate);
> > +			if (ret)
> > +				dev_warn(dev, "Failed to set clock rate: %u\n",
> > +					 rate);

I would return ERR_PTR(ret) here.

> > +		}
> > +
> > +		return clk;
> > +	}
> > +
> > +	if (ret)
> > +		return ERR_PTR(ret);

And here, return a fixed error code, maybe -ENOENT, as propagating the
device_property_read_u32() error could result in strange error code for
the user.

> > +
> > +	if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_acpi_node(dev_fwnode(dev)))
> > +		return ERR_PTR(-ENOENT);
> > +
> > +	if (!id) {
> > +		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> > +		if (!clk_id)
> > +			return ERR_PTR(-ENOMEM);
> > +		id = clk_id;
> > +	}
> > +
> > +	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> > +	if (IS_ERR(clk_hw))
> > +		return ERR_CAST(clk_hw);
> > +
> > +	return clk_hw->clk;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> 
> I sent this as an RFC because I am still unsure and need comments on two
> things. After they are addressed, I plan to send a patch, documentation
> patch (what Sakari proposed in the RFC V4 discussion) and convert the
> camera sensors using devm_clk_get()
> 
> 1. Should the case where both the clock and the clock-frequency are
> present be reserved just for ACPI systems ? In other words if a DT
> system provides both, should we also attempt to set the provided clock
> rate ?

I would very much like to reserve this case for ACPI, yes.

> If the former makes more sense, maybe add this:
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 6099acd339ad..3dfbbd699c67 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -674,14 +674,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>         const char *clk_id __free(kfree) = NULL;
>         struct clk_hw *clk_hw;
>         struct clk *clk;
> +       bool acpi_node;
>         u32 rate;
>         int ret;
>  
>         clk = devm_clk_get_optional(dev, id);
>         ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +       acpi_node = is_acpi_node(dev_fwnode(dev));
>  
>         if (clk) {
> -               if (!ret) {
> +               if (!ret && acpi_node) {
>                         ret = clk_set_rate(clk, rate);
>                         if (ret)
>                                 dev_warn(dev, "Failed to set clock rate: %u\n",
> @@ -694,7 +696,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>         if (ret)
>                 return ERR_PTR(ret);
>  
> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_acpi_node(dev_fwnode(dev)))
> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
>                 return ERR_PTR(-ENOENT);

Looks good to me.

> 2. Should we just warn when the clk_set_rate() fails or return err code
> and exit ?

I'd make it a dev_err() and return an error. We can then relax this
check later if there's a need to.

-- 
Regards,

Laurent Pinchart

