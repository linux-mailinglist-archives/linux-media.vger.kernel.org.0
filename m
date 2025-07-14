Return-Path: <linux-media+bounces-37613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF58BB03F64
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2F017A4A2
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9C724DCEC;
	Mon, 14 Jul 2025 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQmM5yMA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320A2E36F0
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752498761; cv=none; b=LRbs0mocQkoZ4xHdNFt2W2wQKszvvXxwKn3SAHGG6okUemQywQFbjLATsLid4KJPzTAH/bRSC0ocUy1LKSotIr/Bz0TDXHG8+VYKMpTCxnrrIjFGYs3nLN9SbtlzzvVBXsNAfjPYPpsv49A5HdPrBWNY2/gYg6d/+W7l6uL3+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752498761; c=relaxed/simple;
	bh=7G9oasQeQlyYo0LJq2gZw7TQ4NJlAHcAVxsR/Z2d+Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kupjXmVCl2PuicFwpA67frMe2+mHSE7c/0fvWuhg5NaeFUbD8wg2HVwVn3KnPcbSw12uSTrE4liLvPLJPjShiA85ZMimAGhK/6A3i6Z+CRqW0sfxtVsdTX8osxboFXi2fevGSy/BcqREAIEF4PZ/oMFP+bD56KHt5ElKZnJGsek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQmM5yMA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752498761; x=1784034761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7G9oasQeQlyYo0LJq2gZw7TQ4NJlAHcAVxsR/Z2d+Yc=;
  b=FQmM5yMAmSI/6CN4eN7hb17HZPioxVxhS+FGgYu7PLmB8K0ggcYlwefj
   lsX91wTxmaVyfQpnaI/TmF/2/jgygYf5vDE+y8A6mdsdV9tcdRKt0XLLD
   Tm9taUn6xNre9RyK0r/tZiPqlxBeEW3Z4sWfUeq2Tn9B1fzg/E9vmnCDm
   aGb4nhuCFqSRC3hPGkBlfWuGbAJJ/7hzAPKQvSw9OZz0OmCzy4BVKoKkR
   g4aWqec+n7P3+nrb+wIzIEaH8cIw1HDeOgtacqiQs1lUZz8IJvRScckRg
   avxqdTgTo50Iy0vmrcCYhCPeXJjaTylNYLVxB/cuNnQtm6+xdHRsVF+pD
   Q==;
X-CSE-ConnectionGUID: sAnnY219S3Wph96g7PDGJw==
X-CSE-MsgGUID: OWnw047aRL6m05za5CreKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54839306"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="54839306"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 06:12:40 -0700
X-CSE-ConnectionGUID: U4N1ZTLXSt+yIhOq0TFFkw==
X-CSE-MsgGUID: N3oOz8i1RwWRWZNjBf1qJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="162484906"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.75])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 06:12:35 -0700
Date: Mon, 14 Jul 2025 15:12:28 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Matthew Majewski <mattwmajewski@gmail.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 55/72] media: v4l2-common: Add legacy camera sensor clock
 helper
Message-ID: <3rs65tdti5p7qdrj4f5fx5rkdfk5xz5xcjbr6aupdhd6zpu5xe@fm5qpcvy3ab7>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-56-laurent.pinchart@ideasonboard.com>
 <uidbgwyn7b47zathqq7qdl3iygppvjwzfsytbjmud62csuy2ht@lxa6tgz4w3pc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uidbgwyn7b47zathqq7qdl3iygppvjwzfsytbjmud62csuy2ht@lxa6tgz4w3pc>

Hi Laurent,

On Mon, Jul 14, 2025 at 02:55:02PM +0200, Mehdi Djait wrote:
> Hi Laurent,
> 
> Thank you for the patches!
> 
> On Thu, Jul 10, 2025 at 08:47:51PM +0300, Laurent Pinchart wrote:
> > The recently introduced devm_v4l2_sensor_clk_get() helper aims at
> > simplifying sensor drivers by centralizing clock handling code, as well
> > as reducing cargo-cult and deprecated behaviour.
> > 
> > A set of drivers implement external clock handling in a non-standard
> > way. This can't be changed as there is a high risk of breaking existing
> > platforms, but keeping the code as-is creates a risk of new drivers
> > copying deprecated behaviour.
> > 
> > To fix this, introduce a new devm_v4l2_sensor_clk_get_legacy() helper
> > and use it in those driver. Compared to devm_v4l2_sensor_clk_get(), the
> > new helper takes the "clock-frequency" property into account and sets
> > the external clock rate on OF platforms, and adds the ability to specify
> > a fixed default or fallback clock rate in case the "clock-frequency"
> > property is not present.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 39 +++++++++++++++++++------
> >  include/media/v4l2-common.h           | 41 ++++++++++++++++++++++++++-
> >  2 files changed, 70 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index cfc78ea6276c..6f140a78e683 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -703,24 +703,40 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
> >  
> > -struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > +struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
> > +				       bool legacy, bool fixed_rate,
> > +				       unsigned long clk_rate)
> >  {
> > +	bool of_node = is_of_node(dev_fwnode(dev));
> >  	const char *clk_id __free(kfree) = NULL;
> >  	struct clk_hw *clk_hw;
> >  	struct clk *clk;
> > -	bool of_node;
> > -	u32 rate;
> > -	int ret;
> > +	u32 rate = clk_rate;
> 
> [..]
> 
> > +	int ret = 0;
> >  
> >  	clk = devm_clk_get_optional(dev, id);
> >  	if (IS_ERR(clk))
> >  		return clk;
> >  
> > -	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > -	of_node = is_of_node(dev_fwnode(dev));
> > +	/*
> > +	 * If the caller didn't request a fixed rate, retrieve it from the
> > +	 * clock-frequency property. -EINVAL indicates the property is absent,
> > +	 * and is not a failure. Other errors, or success with a clock-frequency
> > +	 * value of 0, are hard failures.
> > +	 */
> > +	if (!fixed_rate || !clk_rate) {
> > +		ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > +		if (ret != -EINVAL || !rate)

so according to the above comment, I think it should be:
		if (ret != -EINVAL || (!rate && !ret))

> 
> [..]
> 
> Let's take the case of camera sensor on a DT-system:
> 
> it will call the following:
> devm_v4l2_sensor_clk_get(dev, NULL);
> -> __devm_v4l2_sensor_clk_get(dev, id, false, false, 0);
> --> with fixed_rate = 0 and clk_rate = 0 which will be assigned to
> u32 rate
> 
> so it will go into the if statement and try to read the
> "clock-frequency" property, which does not exist.
> 
> ret from device_property_read_u32() is -EINVAL and that is handled but
> rate will still be 0 so we will return ERR_PTR(-EINVAL)
> 
> > +			return ERR_PTR(-EINVAL);
> > +	}
> >  
> >  	if (clk) {
> > -		if (!ret && !of_node) {
> > +		/*
> > +		 * On non-OF platforms, or when legacy behaviour is requested,
> > +		 * set the clock rate if a rate has been specified by the caller
> > +		 * of by the clock-frequency property.
> 		   |
> nit:		   +-> or ? 
> 
> > +		 */
> > +		if (rate && (!of_node || legacy)) {
> >  			ret = clk_set_rate(clk, rate);
> >  			if (ret) {
> >  				dev_err(dev, "Failed to set clock rate: %u\n",
> > @@ -731,9 +747,14 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> >  		return clk;
> >  	}
> >  
> > -	if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
> > +	/*
> > +	 * Register a dummy fixed clock on non-OF platforms or when legacy
> > +	 * behaviour is requested. This required the common clock framework.
> > +	 */
> > +	if (!IS_ENABLED(CONFIG_COMMON_CLK) || (of_node && !legacy))
> >  		return ERR_PTR(-ENOENT);
> >  
> > +	/* We need a rate to create a clock. */
> >  	if (ret)
> >  		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
> >  
> > @@ -750,4 +771,4 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> >  
> >  	return clk_hw->clk;
> >  }
> > -EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> > +EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
> 

--
Kind Regards
Mehdi Djait

