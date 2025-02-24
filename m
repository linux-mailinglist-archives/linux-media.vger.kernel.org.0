Return-Path: <linux-media+bounces-26765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B70A416CA
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B50B7A35F5
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 07:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDFE241669;
	Mon, 24 Feb 2025 07:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+y24h57"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD74719B5A3
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740383987; cv=none; b=XGQ2NkbHF+sCLT+c2Pcx1ySiEegWbZ020xcBWI1LSBm2oipPbhAFqJUlcEaFW1jGsrb2ZJQxPq72pfBLmWbrKYzhf+sYeTGvnoivdE/QIaiPorxp8YNpg28AsTT2HNUH2oyPAkXYgqWDnLtJ1kpKVJcvWdxcA8UTonMY5I2VLyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740383987; c=relaxed/simple;
	bh=vDvzmI0TzurvFEZOg+Ag0odMO83cH8bjexnSi1Hpx6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MW9WX1aIzSB58cxv4T2aZcrMZkA8TOCCeeFlmokROzMWxu/KLeKZLcoZIMK6l6VikYRQnPF86DKfQijkapUQIh9PZhBhxS+iYOZHZlK5ed861AWmxqNm7fiSO+rnGGosk9YET1zPFNhTpOvN1zoreZT3h4ChWAanef4RKnzozBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+y24h57; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740383986; x=1771919986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vDvzmI0TzurvFEZOg+Ag0odMO83cH8bjexnSi1Hpx6s=;
  b=b+y24h57TQl1zFk/Sg6TniRNG4tLwjrN2+VSh8ADm7ABBzHxvS+mMPKU
   k/hbLvP27Z1Tf56u8uh/HSODsFvyzudm9ECq5FLOlq6EzkOW1oDMWYd1Y
   eBMUraJ3jkVuCFKaPgkrHtrEP8YkqR9x6k+PuQIGwJKTA8dfghjR0OOLE
   YLAHflA+TXcoxs+WqUU3QHrSPCCtpb7wo/nuZx+VQESGVI9IqaYdGVjGU
   bZueu3VFSLB89JRNUuKeyHEWQ68XUGK4vvmImCUWHPazwNtybvYaKKqTh
   rGkDc6Ow7c3cbmWe2Z3tc8oBO7/+316XLRGQh24cHed7Fd4V6BtDH5duL
   g==;
X-CSE-ConnectionGUID: CDljTgjATZG9ssGsu8uNow==
X-CSE-MsgGUID: vWs6kdpcRP2grWfD7NW5Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="28725798"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="28725798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 23:59:45 -0800
X-CSE-ConnectionGUID: VFtprgk5SZO4Lf8XiDHZkA==
X-CSE-MsgGUID: LjjNMghoTBaESiPm2FAfzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116897090"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 23:59:43 -0800
Date: Mon, 24 Feb 2025 08:59:34 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com, 
	tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx219: Add support for 'clock-frequency'
 parsing
Message-ID: <picj7e6sohybmsyb63xuxdglyxk67pj3rfmej27lr2z2pyaqss@ahqmpyszie3a>
References: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
 <20250223230649.GD16159@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223230649.GD16159@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Feb 24, 2025 at 01:06:49AM +0200, Laurent Pinchart wrote:
> Hi Mehdi,
> 
> Thank you for the patch.
> 
> On Thu, Feb 20, 2025 at 04:49:09PM +0100, Mehdi Djait wrote:
> > Make the clock producer reference lookup optional
> > 
> > Add support for ACPI-based platforms by parsing the 'clock-frequency'
> > property when no clock producer is available
> > 
> > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > ---
> >  drivers/media/i2c/imx219.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 2d54cea113e1..a876a6d80a47 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
> >  				     "failed to initialize CCI\n");
> >  
> >  	/* Get system clock (xclk) */
> > -	imx219->xclk = devm_clk_get(dev, NULL);
> > +	imx219->xclk = devm_clk_get_optional(dev, NULL);
> >  	if (IS_ERR(imx219->xclk))
> >  		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> >  				     "failed to get xclk\n");
> >  
> > -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > +	if (imx219->xclk) {
> > +		imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > +	} else {
> > +		ret = fwnode_property_read_u32(dev_fwnode(dev),
> > +					       "clock-frequency",
> > +					       &imx219->xclk_freq);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret,
> > +					     "failed to get clock frequency");
> > +	}
> > +
> 
> This doesn't seem specific to the imx219 driver. Could you turn this
> into a generic V4L2 sensor helper that would take a struct device and a
> clock name, and return the frequency, either retrieved from the clock,
> or from the clock-frequency property as a fallback ?
> 
> Some drivers will also need to control the clock, so the clock should
> probably be returned too.
> 

Yes, I saw that many sensor drivers have the same issue.

I will try to make it into a generic V4L2 helper and send the patches.

--
Kind Regards
Mehdi Djait

