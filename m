Return-Path: <linux-media+bounces-33047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B09ABFBA1
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 18:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B885A1BC50DE
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 16:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237D121E082;
	Wed, 21 May 2025 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FiqMWvNI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16C223311;
	Wed, 21 May 2025 16:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846259; cv=none; b=PZRt9qF1PeJ8ka5iP3BtRpkp3zYf+UNK4IaFFaBPcDt/r/7aVdjbewkMZfZvTBIM3YnNC8Dl1bGWUoKyQQHxoflU+qZD0S3xW+2Yhjd1GvqgGZEzwfqgx/c7tKjiDTpB8dEPd3k/ukLkCMWeTmcoQSXQIJZywW7cYmVDmDqAYfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846259; c=relaxed/simple;
	bh=+9HB5JZYZUStWziezn6DHT6Rxo7nJCm+/PmjLmyDFHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbSFaKeWeSf1NmMby3pV1X51jQSQU1rfdS6QuwmabMQ+9y8A3NcoPZdVx+GyX0AZ2SkXIyt9S7+tnOW6perKM++7AtisJsV/94Oq5gIjAixvOZmSy1S0UOUFpDn21DSdklriSy9Bs7qo5ty+Jt/b6XrM2bMVGEjlmuRe9CYr2Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FiqMWvNI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 045473A4;
	Wed, 21 May 2025 18:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747846233;
	bh=+9HB5JZYZUStWziezn6DHT6Rxo7nJCm+/PmjLmyDFHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FiqMWvNIVgX6BQMJA1SA3s/E6tElHLXvMQ09bQlDzVsTTAJNwu7UN6qZP2xzKs2A/
	 IGKrf7MIclenHv0X23378MyQqyikfn6bu5FEkrFsik3je4bMQpTmOD2yNYQa989xAg
	 82Vz6OkgtFBqEJEX+Ov2m/+GzwjPa+D5uPbbZqew=
Date: Wed, 21 May 2025 18:50:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: i2c: imx214: Remove hard-coded external
 clock frequency
Message-ID: <20250521165048.GA6792@pendragon.ideasonboard.com>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
 <20250505-imx214_ccs_pll-v2-4-f50452061ff1@apitzsch.eu>
 <aBnHI1APgjfcj2xG@kekkonen.localdomain>
 <20250515085846.GR23592@pendragon.ideasonboard.com>
 <aCXWDnZhffjlt+8i@svinhufvud>
 <20250515130340.GC12492@pendragon.ideasonboard.com>
 <aCZWV6xj4vap5PFZ@svinhufvud>
 <7d2d4c3bc5e8d49fbcd4763487f82db634b06205.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d2d4c3bc5e8d49fbcd4763487f82db634b06205.camel@apitzsch.eu>

Hi André,

On Thu, May 15, 2025 at 11:21:42PM +0200, André Apitzsch wrote:
> Am Freitag, dem 16.05.2025 um 00:02 +0300 schrieb Sakari Ailus:
> > On Thu, May 15, 2025 at 03:03:40PM +0200, Laurent Pinchart wrote:
> > > On Thu, May 15, 2025 at 02:54:54PM +0300, Sakari Ailus wrote:
> > > > On Thu, May 15, 2025 at 10:58:46AM +0200, Laurent Pinchart wrote:
> > > > > On Tue, May 06, 2025 at 08:24:03AM +0000, Sakari Ailus wrote:
> > > > > > On Mon, May 05, 2025 at 11:05:56PM +0200, André Apitzsch via
> > > > > > B4 Relay wrote:
> > > > > > > From: André Apitzsch <git@apitzsch.eu>
> > > > > > > 
> > > > > > > Instead rely on the rate set on the clock (using assigned-clock-rates
> > > > > > > etc.)
> > > > > > > 
> > > > > > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/imx214.c | 6 ------
> > > > > > >  1 file changed, 6 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > > > > > > index 9e9be47394ec768a5b34d44b06b5bbb0988da5a1..c12996e294dccebb18c608254f1e0d14dc064423 100644
> > > > > > > --- a/drivers/media/i2c/imx214.c
> > > > > > > +++ b/drivers/media/i2c/imx214.c
> > > > > > > @@ -32,7 +32,6 @@
> > > > > > >  
> > > > > > >  #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
> > > > > > >  
> > > > > > > -#define IMX214_DEFAULT_CLK_FREQ	24000000
> > > > > > >  #define IMX214_DEFAULT_LINK_FREQ	600000000
> > > > > > >  /* Keep wrong link frequency for backward compatibility */
> > > > > > >  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> > > > > > > @@ -1405,11 +1404,6 @@ static int imx214_probe(struct i2c_client *client)
> > > > > > >  		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
> > > > > > >  				     "failed to get xclk\n");
> > > > > > >  
> > > > > > > -	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> > > > > > > -	if (ret)
> > > > > > > -		return dev_err_probe(dev, ret,
> > > > > > > -				     "failed to set xclk frequency\n");
> > > > > > > -
> > > > > > 
> > > > > > Oops. I missed this is what the driver was doing already.
> > > > > > Indeed, this is one of the historic sensor drivers that do
> > > > > > set the frequency in DT systems.
> > > > > > 
> > > > > > The driver never used the clock-frequency property and
> > > > > > instead used a fixed frequency. Changing the behaviour now
> > > > > > could be problematic.
> > > > > > 
> > > > > > There are options here that I think we could do:
> > > > > > 
> > > > > > 1) use your v1 patch (4) which uses "clock-frequency" if it
> > > > > > exists and otherwise uses the default, fixed frequency or
> > > > > > 
> > > > > > 2) set the frequency only if the "clock-frequency" property
> > > > > > exists. The DT currently requires clock-frequency and the
> > > > > > YAML conversion was done in 2020 whereas the driver is from
> > > > > > 2018. If we do this, the clock-frequency should
> > > > > > be deprecated (or even removed from bingings).
> > > > > > 
> > > > > > I wonder what others think. Cc'd Laurent in any case.
> > > > > 
> > > > > Maybe I'm missing something, but I don't really see the issue
> > > > > here. The clock-frequency DT property is currently ignored, and
> > > > > this patch doesn't change that situation, does it ?
> > > > > 
> > > > > The change of behaviour here is related to the assigned-clock-
> > > > > rates property. If that property is specified today, it will
> > > > > set the clock rate, and the driver will override it to 24MHz
> > > > > right after.
> > > > > With this patch, the clock rate won't be overridden. I think
> > > > > the risk of regression is very low here, as I don't expect
> > > > > systems to set assigned-clock-rates in DT to a value different
> > > > > than 24MHz and expect the driver to override it.
> > > > 
> > > > If the DTS had assigned-clock-rates set correctly, then yes. How
> > > > much can we trust the older DTS did have that?
> > > 
> > > I am relatively confident that DT-based systems wouldn't have an
> > > assigned-clock-rates property with a frequency that doesn't match
> > > IMX214_DEFAULT_CLK_FREQ. The real question is whether or not I'm
> > > over-confident :-)
> > 
> > The assigned-clock stuff wasn't always there. But nowadays I guess a
> > lot of things in practice depends on it.
> > 
> > So I guess doing this should be fine then.
> 
> Just to be clear, this patch is fine and no changes are needed?

I'm fine with it.

> Should the bindings be updated in this series or can that be done
> later?

If you could do it in the same series it would be very appreciated. It
should be in a separate patch.

-- 
Regards,

Laurent Pinchart

