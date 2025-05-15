Return-Path: <linux-media+bounces-32563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AECAB81C6
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 042417AD4A7
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 08:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A521297B8F;
	Thu, 15 May 2025 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XoovOdPm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE89295DB5;
	Thu, 15 May 2025 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299540; cv=none; b=ktAdOnVnlWpY4BfeFL08egQIUaggK+8+9fIkpw0cpfrlR/+5XQsBXZlRvuQ2RYva63tbAd9sWYK0wPm8DzsjyZo3BEKbIxievYeppT54l/YPjt4pdYZvAWAuLhicNb7p32CKe6tvVOXqRL+Sz+p3woyt1Z90Ikdw1fLTEFvmoEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299540; c=relaxed/simple;
	bh=WKED9sw9AaRYnOXYd8MFwqseZ6zJJk0qej3Fm79ffHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owF01NJDP4X7OCOE1gwZO+B/2mjZyAceupwVMSEVj9CDGepMPzWeHSETaK6L0E+xqyG8yjMhQsUJ2Pt4gUZscZL6j57ADWSaRlaw2Xvvn8rsXTy4rzCzy54l7jXQ0xFGEJtzzOXYEZ6K9017MbfZbvYc/6rQnPN8HEY1JR3dJKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XoovOdPm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-100-138-nat.elisa-mobile.fi [85.76.100.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6F63836;
	Thu, 15 May 2025 10:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747299519;
	bh=WKED9sw9AaRYnOXYd8MFwqseZ6zJJk0qej3Fm79ffHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoovOdPmyr7EB445fvejvr2nyZaScEJvqwiKsjwNym3vmDqJOIzk/MfyDdOaW+oFz
	 emds7U4TpJy29QfZsIQkKa1/MsUvu35Rd4aQCilY7ATdXI06m7rKE1oQmZt4FTjukU
	 SVpZR+o5hknWEWFHUFNF1KpL/tCl+BOZFkGyF2+8=
Date: Thu, 15 May 2025 10:58:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: git@apitzsch.eu, Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: i2c: imx214: Remove hard-coded external
 clock frequency
Message-ID: <20250515085846.GR23592@pendragon.ideasonboard.com>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
 <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>
 <aBnHI1APgjfcj2xG@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBnHI1APgjfcj2xG@kekkonen.localdomain>

Hi Sakari,

On Tue, May 06, 2025 at 08:24:03AM +0000, Sakari Ailus wrote:
> On Mon, May 05, 2025 at 11:05:56PM +0200, André Apitzsch via B4 Relay wrote:
> > From: André Apitzsch <git@apitzsch.eu>
> > 
> > Instead rely on the rate set on the clock (using assigned-clock-rates
> > etc.)
> > 
> > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > ---
> >  drivers/media/i2c/imx214.c | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 9e9be47394ec768a5b34d44b06b5bbb0988da5a1..c12996e294dccebb18c608254f1e0d14dc064423 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -32,7 +32,6 @@
> >  
> >  #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
> >  
> > -#define IMX214_DEFAULT_CLK_FREQ	24000000
> >  #define IMX214_DEFAULT_LINK_FREQ	600000000
> >  /* Keep wrong link frequency for backward compatibility */
> >  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> > @@ -1405,11 +1404,6 @@ static int imx214_probe(struct i2c_client *client)
> >  		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
> >  				     "failed to get xclk\n");
> >  
> > -	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> > -	if (ret)
> > -		return dev_err_probe(dev, ret,
> > -				     "failed to set xclk frequency\n");
> > -
> 
> Oops. I missed this is what the driver was doing already. Indeed, this is
> one of the historic sensor drivers that do set the frequency in DT systems.
> 
> The driver never used the clock-frequency property and instead used a fixed
> frequency. Changing the behaviour now could be problematic.
> 
> There are options here that I think we could do:
> 
> 1) use your v1 patch (4) which uses "clock-frequency" if it exists and
> otherwise uses the default, fixed frequency or
> 
> 2) set the frequency only if the "clock-frequency" property exists. The DT
> currently requires clock-frequency and the YAML conversion was done in 2020
> whereas the driver is from 2018. If we do this, the clock-frequency should
> be deprecated (or even removed from bingings).
> 
> I wonder what others think. Cc'd Laurent in any case.

Maybe I'm missing something, but I don't really see the issue here. The
clock-frequency DT property is currently ignored, and this patch doesn't
change that situation, does it ?

The change of behaviour here is related to the assigned-clock-rates
property. If that property is specified today, it will set the clock
rate, and the driver will override it to 24MHz right after. With this
patch, the clock rate won't be overridden. I think the risk of
regression is very low here, as I don't expect systems to set
assigned-clock-rates in DT to a value different than 24MHz and expect
the driver to override it.

> >  	ret = imx214_get_regulators(dev, imx214);
> >  	if (ret < 0)
> >  		return dev_err_probe(dev, ret, "failed to get regulators\n");

-- 
Regards,

Laurent Pinchart

