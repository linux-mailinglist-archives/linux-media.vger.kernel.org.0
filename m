Return-Path: <linux-media+bounces-30707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5BFA96826
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 13:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A48F165E45
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA17627C173;
	Tue, 22 Apr 2025 11:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Poeqm+Fj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CFB151985
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322609; cv=none; b=FFBBNzJe8IkRhe7cOEWyJSR486dKLAXqUwZd3xHGwAnEgmfLoXSLwswTkhF1LYsvBegRUklUDP0PzHerO+VnlNc5NEb+mjMSi68WeBxoaTiESB7X9nCM2okkLXHAWvloGfcVJTqXRPFqdQn4i4RJC9s83V2yd7qSANQt7gWEYvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322609; c=relaxed/simple;
	bh=pb6icielVc/GOcWFL2UojcdXSB9eASutc5uCDUZncKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJtAA5czAMMrCDtPawkeLHERtyChibm58XNe4mVjFvJGWJR3vIQRrbNMQuB5jM9pNxvy4rKzfWQklFEpLrN417NbQXxClFxe8Qfzg+wXAeBnPVrygF9tUWNz2yxphBcdqB5w8TNeBZPps0rTRK7qpfOgkkliR0m2X4n6UOF1YQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Poeqm+Fj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E19E666;
	Tue, 22 Apr 2025 13:47:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745322477;
	bh=pb6icielVc/GOcWFL2UojcdXSB9eASutc5uCDUZncKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Poeqm+FjF/rU8yqeJ7SdEoD/m3A7fTsXJWwRJP//tEqMhS3QVFVvNHrEWDlxxHtZK
	 FqjqFcMFFx6N2rAoSfue9EboicRuxyEUdLDr0eY8BHslctiqbZttY99XF6crin7lHo
	 yLna/Dt/g/Yg4bf3NiWpL/MEQ3JqNSaPKXVHhkKI=
Date: Tue, 22 Apr 2025 14:50:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 01/11] media: ccs-pll: Start OP pre-PLL multiplier
 search from correct value
Message-ID: <20250422115001.GC329@pendragon.ideasonboard.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-2-sakari.ailus@linux.intel.com>
 <20250421195004.GA17813@pendragon.ideasonboard.com>
 <aAeA1ncpTCgfuI25@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAeA1ncpTCgfuI25@kekkonen.localdomain>

On Tue, Apr 22, 2025 at 11:43:18AM +0000, Sakari Ailus wrote:
> On Mon, Apr 21, 2025 at 10:50:04PM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 17, 2025 at 09:53:44AM +0300, Sakari Ailus wrote:
> > > The ccs_pll_calculate() function does a search over possible PLL
> > > configurations to find the "best" one. If the sensor did not support odd
> > 
> > s/did not/does not/
> > 
> > > pre-PLL divisors and the minimum value (with constraints) wasn't 1, other
> > 
> > s/wasn't/isn't/
> > 
> > > even values could have errorneously searched (and selected) for the
> > 
> > s/could have errorneously searched/
> > s/could be erroneously searched/
> > 
> > Do you mean "other odd values" ?
> 
> Odd values that aren't 1.

You wrote ", other even values could ...". I think s/even/odd/ is what
you meant.

> > > pre-PLL divisor. Fix this.
> > > 
> > > Fixes: 415ddd993978 ("media: ccs-pll: Split limits and PLL configuration into front and back parts")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/i2c/ccs-pll.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> > > index 34ccda666524..e516ed23e899 100644
> > > --- a/drivers/media/i2c/ccs-pll.c
> > > +++ b/drivers/media/i2c/ccs-pll.c
> > > @@ -815,6 +815,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
> > >  			      one_or_more(
> > >  				      DIV_ROUND_UP(op_lim_fr->max_pll_op_clk_freq_hz,
> > >  						   pll->ext_clk_freq_hz))));
> > > +	if (!(pll->flags & CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER))
> > > +		min_op_pre_pll_clk_div = clk_div_even(min_op_pre_pll_clk_div);
> > >  	dev_dbg(dev, "pll_op check: min / max op_pre_pll_clk_div: %u / %u\n",
> > >  		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
> > >  
> > 
> > Is my understanding correct that the problem can only occur during the
> > first iteration of the loop just below ? If so, with the commit message
> > fixed,
> 
> Correct.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > If not, there's something I don't get :-)
> 
> :-)

-- 
Regards,

Laurent Pinchart

