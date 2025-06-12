Return-Path: <linux-media+bounces-34684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A44AD7DA9
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 23:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8DA67A2B1A
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 21:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBA72BFC8F;
	Thu, 12 Jun 2025 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BF/S71gY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17CD222593;
	Thu, 12 Jun 2025 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749764363; cv=none; b=jKzzfxlFEPXqRw+RC7UAGtAAfsGkzzDdlKWlCB/Gnvuws0EZbABIZsABFB451/hB54rWxZsBpZ4sg1hHSQvdrnrsjosteo+zm1AlZE3JZT//8ao9UiU6W5obAFdYUdsID8vm34QbpO+h/CbNkUTO5gmclpwmUSctCUw8ku4Oji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749764363; c=relaxed/simple;
	bh=ZyW9CC2m0bNFb9ilfuOaP1nCJW0SwsDvuFBWBKIasAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIZxU4RqyfQKlXKrg6pJzbNhKFeOQs8ZtGnJN+Mb0PxY8hnnCO/fxljyZmeyuoUp9fc5AwavsIRh4+Li9g0f0N2zlZUNm3VQVaKLum+0PTtuttS/T8DN51mdf7FMuQruhfOh12Egw/SOSDWK3rJ5O/Acb7M6VLjB2CxGWdn+kfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BF/S71gY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8242CF;
	Thu, 12 Jun 2025 23:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749764349;
	bh=ZyW9CC2m0bNFb9ilfuOaP1nCJW0SwsDvuFBWBKIasAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BF/S71gYm9GbMULR6/KJIharW2yyWhJQUZMcEHsuFzMX/ZdSK5t6F2Wy33e6a3kAm
	 HIJbqi/ZbYq2BtJf9ZftMylJWjLHf7aRq0WleQLKY8aQRCr3lg3T1XR4pMxBiyA5Of
	 iRbKQn40FsFWdEYqhOtRClCWnObK/gCMxsNknq7Q=
Date: Fri, 13 Jun 2025 00:39:04 +0300
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
Message-ID: <20250612213904.GC10542@pendragon.ideasonboard.com>
References: <20250521104115.176950-1-mehdi.djait@linux.intel.com>
 <mwh7xx675kulx6tdebuvqtdjfa4ih3ehi2brrcdxfemfnvxsrs@i5nxkvfskfhe>
 <20250521110944.GG12514@pendragon.ideasonboard.com>
 <hgczrxw25a7jn6ubuwijga7yn7epek4yhtya2gnd77awsgxdgs@lv2oxey567hu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <hgczrxw25a7jn6ubuwijga7yn7epek4yhtya2gnd77awsgxdgs@lv2oxey567hu>

On Thu, Jun 12, 2025 at 02:15:10PM +0200, Mehdi Djait wrote:
> Hi Laurent,
> 
> Thank you for the review!
> 
> A very small question below.
> 
> On Wed, May 21, 2025 at 01:09:44PM +0200, Laurent Pinchart wrote:
> > On Wed, May 21, 2025 at 12:52:08PM +0200, Mehdi Djait wrote:
> 
> > > > +struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> > > > +{
> > > > +	const char *clk_id __free(kfree) = NULL;
> > > > +	struct clk_hw *clk_hw;
> > > > +	struct clk *clk;
> > > > +	u32 rate;
> > > > +	int ret;
> > > > +
> > > > +	clk = devm_clk_get_optional(dev, id);
> > > > +	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> > > > +
> > > > +	if (clk) {
> > > > +		if (!ret) {
> > > > +			ret = clk_set_rate(clk, rate);
> > > > +			if (ret)
> > > > +				dev_warn(dev, "Failed to set clock rate: %u\n",
> > > > +					 rate);
> > 
> > I would return ERR_PTR(ret) here.
> > 
> > > > +		}
> > > > +
> > > > +		return clk;
> > > > +	}
> > > > +
> > > > +	if (ret)
> > > > +		return ERR_PTR(ret);
> > 
> > And here, return a fixed error code, maybe -ENOENT, as propagating the
> > device_property_read_u32() error could result in strange error code for
> > the user.
> 
> device_property_read_u32() returns the following:
> 
> Return: number of values if @val was %NULL,
>         %0 if the property was found (success),
>           %-EINVAL if given arguments are not valid,
>           %-ENODATA if the property does not have a value,
>           %-EPROTO if the property is not an array of numbers,
>           %-EOVERFLOW if the size of the property is not as expected.
>           %-ENXIO if no suitable firmware interface is present.
> 
> Don't you think it is better to keep the return value and not overshadow
> it ? The function is well documented and this may help understand where
> the problem comes from if getting the clk fails.

I don't mind too much either way. If we want to make debugging easier,
may an error message would be appropriate.

-- 
Regards,

Laurent Pinchart

