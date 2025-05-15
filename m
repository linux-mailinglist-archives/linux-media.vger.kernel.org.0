Return-Path: <linux-media+bounces-32593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16340AB8746
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 15:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 738583AE4A4
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84E4298C12;
	Thu, 15 May 2025 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AIkWM9DE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE45746E;
	Thu, 15 May 2025 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314233; cv=none; b=caY/Swhvp5iVpnhl5piJHDVB00vPX9GOOeXvFmRsRWEG5XsS7bN3bvmUCyGwIp6InJKYXGWB2ig4a+T0XHL3dBYBEQWeA215KwhewdKW8uCghVtdB+xhdV1FNBYcH8Clk56vOG+Hwt0UaDRUYM2BqFFCnBMlDMwnqzXEO/+92Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314233; c=relaxed/simple;
	bh=G4w8+WYceQ0TUvOZZ7wsRh/B3jbJuEiol/rwYLXiXEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtWhwYNiseN4VtGMqldy5SP/tTXefhP5N8yS5kwWEb8pmWN+Dp4ewPoBOTcldzh6AmHGxixct36HuIQCDNwUVLrMPvaOFTjDoPU5P00VNKshi3iCsLPSR/fFo5xEmL/04PNEVnzu9nbON0H3G6l8rtm6wvZ4kr1CcQZdYUwVX3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AIkWM9DE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-100-182-nat.elisa-mobile.fi [85.76.100.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93E27886;
	Thu, 15 May 2025 15:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747314212;
	bh=G4w8+WYceQ0TUvOZZ7wsRh/B3jbJuEiol/rwYLXiXEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AIkWM9DEj9EpoWLMm9YJ2wAODIcNSamGD/ZrViLoOAnyV1UxwrOTccrVBUgYnc0rl
	 NUzjqp+PPRKveyZzRDXYLS742D6dZmLo4YYcs28RqrZq4gHMIiRazgsp69WsxhjMDs
	 gpTnlp1kN/hYwNTpSPdA3SIc80iJh1yopdAAkJZU=
Date: Thu, 15 May 2025 15:03:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: git@apitzsch.eu, Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: i2c: imx214: Remove hard-coded external
 clock frequency
Message-ID: <20250515130340.GC12492@pendragon.ideasonboard.com>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
 <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>
 <aBnHI1APgjfcj2xG@kekkonen.localdomain>
 <20250515085846.GR23592@pendragon.ideasonboard.com>
 <aCXWDnZhffjlt+8i@svinhufvud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCXWDnZhffjlt+8i@svinhufvud>

On Thu, May 15, 2025 at 02:54:54PM +0300, Sakari Ailus wrote:
> On Thu, May 15, 2025 at 10:58:46AM +0200, Laurent Pinchart wrote:
> > On Tue, May 06, 2025 at 08:24:03AM +0000, Sakari Ailus wrote:
> > > On Mon, May 05, 2025 at 11:05:56PM +0200, André Apitzsch via B4 Relay wrote:
> > > > From: André Apitzsch <git@apitzsch.eu>
> > > > 
> > > > Instead rely on the rate set on the clock (using assigned-clock-rates
> > > > etc.)
> > > > 
> > > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > > ---
> > > >  drivers/media/i2c/imx214.c | 6 ------
> > > >  1 file changed, 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > > > index 9e9be47394ec768a5b34d44b06b5bbb0988da5a1..c12996e294dccebb18c608254f1e0d14dc064423 100644
> > > > --- a/drivers/media/i2c/imx214.c
> > > > +++ b/drivers/media/i2c/imx214.c
> > > > @@ -32,7 +32,6 @@
> > > >  
> > > >  #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
> > > >  
> > > > -#define IMX214_DEFAULT_CLK_FREQ	24000000
> > > >  #define IMX214_DEFAULT_LINK_FREQ	600000000
> > > >  /* Keep wrong link frequency for backward compatibility */
> > > >  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> > > > @@ -1405,11 +1404,6 @@ static int imx214_probe(struct i2c_client *client)
> > > >  		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
> > > >  				     "failed to get xclk\n");
> > > >  
> > > > -	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> > > > -	if (ret)
> > > > -		return dev_err_probe(dev, ret,
> > > > -				     "failed to set xclk frequency\n");
> > > > -
> > > 
> > > Oops. I missed this is what the driver was doing already. Indeed, this is
> > > one of the historic sensor drivers that do set the frequency in DT systems.
> > > 
> > > The driver never used the clock-frequency property and instead used a fixed
> > > frequency. Changing the behaviour now could be problematic.
> > > 
> > > There are options here that I think we could do:
> > > 
> > > 1) use your v1 patch (4) which uses "clock-frequency" if it exists and
> > > otherwise uses the default, fixed frequency or
> > > 
> > > 2) set the frequency only if the "clock-frequency" property exists. The DT
> > > currently requires clock-frequency and the YAML conversion was done in 2020
> > > whereas the driver is from 2018. If we do this, the clock-frequency should
> > > be deprecated (or even removed from bingings).
> > > 
> > > I wonder what others think. Cc'd Laurent in any case.
> > 
> > Maybe I'm missing something, but I don't really see the issue here. The
> > clock-frequency DT property is currently ignored, and this patch doesn't
> > change that situation, does it ?
> > 
> > The change of behaviour here is related to the assigned-clock-rates
> > property. If that property is specified today, it will set the clock
> > rate, and the driver will override it to 24MHz right after. With this
> > patch, the clock rate won't be overridden. I think the risk of
> > regression is very low here, as I don't expect systems to set
> > assigned-clock-rates in DT to a value different than 24MHz and expect
> > the driver to override it.
> 
> If the DTS had assigned-clock-rates set correctly, then yes. How much can
> we trust the older DTS did have that?

I am relatively confident that DT-based systems wouldn't have an
assigned-clock-rates property with a frequency that doesn't match
IMX214_DEFAULT_CLK_FREQ. The real question is whether or not I'm
over-confident :-)

-- 
Regards,

Laurent Pinchart

