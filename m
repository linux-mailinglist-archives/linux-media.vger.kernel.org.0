Return-Path: <linux-media+bounces-35515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E85AE27E2
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 09:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D93D17E785
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 07:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD7F1DDC1B;
	Sat, 21 Jun 2025 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="dPv/ZIV9"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87B619E975;
	Sat, 21 Jun 2025 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750492746; cv=pass; b=jj0rZ2fs55OP7CtnqBRLB72vWm6eruxkgPxPg4gQZjQPBeOPh34qspX3FnWb7KxbTWDWp8DMvRRU+D9YMiMb7mSAHkSEC7WZs25J6tc1LOrxpbtsHNJEPY6LZxNDwys4UMD5VjNgWH+3um5MwcmFy92I1L1dbbPps+GlsS5mtso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750492746; c=relaxed/simple;
	bh=vDEbtPJfTWIkddnv3ZjSiy4sDYEhN+dUtTj59hHSysA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/VFjW58dkAmZ7AGsyzg1aGxGSz/ZSDMrYXF0kGD+if91ytvR57vzOvmKgjkwHK1NX/6Thr4buHT9Ewi+wrhM1rEedcaCMvxzrpjU47LNDTBBngWLjQC7WemQ4LdLoeLlAFa3K8wXjAkdxI77JeSh6wUQXkIvnk8vXqVj9OFDFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=dPv/ZIV9; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4bPRYp3bfDzyRx;
	Sat, 21 Jun 2025 10:58:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1750492739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=huETNdKfR7937ExtLvGennYTafhzIC4yPV+7Y+Br65Q=;
	b=dPv/ZIV9npRz6zTbwo27dVfFPVYP/2sBc2neT2N/tqWNVIbCiLwj2Yzp4aHEEuTIrEzs9C
	mTehYdzaNX4RsrtRVvVHtcxrellLbmnRtVfEcx8xONvT0Q+gj4F3kUKerqmYuus2hLaip0
	RgQlxyGx6ZQdQ48+h2KsiJKgFkIm7KU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1750492739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=huETNdKfR7937ExtLvGennYTafhzIC4yPV+7Y+Br65Q=;
	b=WP7g76HgY2Uo9wb9uDeuCRaxnZvhOmhfc8T3Z2dfCkXgWx1MrMCyaFjBoLCeNZtrAVxS2b
	/px+RRZyf3K/jS9XnFDn7LINKtDMKhm4iwYMI9E8g2Aw38RVBkCGBQjEHD5rm46DvRyHSS
	+C6pUDtAC6iy3B9MPeYeYmPwTUmv7Rs=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1750492739; a=rsa-sha256; cv=none;
	b=dxt2iebGyQ0If6z1HHBwIRSOSmSBmsPWRMKHK352y5SmRy+0Tm3BNUszBUnhBncsbwhhw6
	ud9kuugPkdZhNs7hbhqQr8m0YDQ2WDqNpw2neVFwnBFQmxC4weAqKo0rmknz/UGwf/iUui
	aHZfpcvm135kCbph40w9jtzuHzOBli0=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CFE17634C93;
	Sat, 21 Jun 2025 10:58:52 +0300 (EEST)
Date: Sat, 21 Jun 2025 07:58:52 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, sakari.ailus@linux.intel.com,
	akinobu.mita@gmail.com, stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com,
	andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com, hansg@kernel.org,
	hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com, jonas@kwiboo.se,
	kieran.bingham@ideasonboard.com, khalasa@piap.pl,
	prabhakar.csengg@gmail.com, mani@kernel.org,
	m.felsch@pengutronix.de, martink@posteo.de, mattwmajewski@gmail.com,
	matthias.fend@emfend.at, mchehab@kernel.org,
	michael.riesch@collabora.com, naush@raspberrypi.com,
	nicholas@rothemail.net, nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com, dan.scally@ideasonboard.com,
	pavel@kernel.org, petrcvekcz@gmail.com, rashanmu@gmail.com,
	ribalda@chromium.org, rmfrfs@gmail.com, zhengsq@rock-chips.com,
	slongerbeam@gmail.com, sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 41/55] media: i2c: ov8865: Use the v4l2 helper for
 obtaining the clock
Message-ID: <aFZmPOqYz0Rgv5H0@valkosipuli.retiisi.eu>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <273d77cc78cbe9fd144f96e68407f0f7b41d3895.1750352394.git.mehdi.djait@linux.intel.com>
 <20250619215744.GS22102@pendragon.ideasonboard.com>
 <20250619215951.GA32257@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619215951.GA32257@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Jun 20, 2025 at 12:59:51AM +0300, Laurent Pinchart wrote:
> On Fri, Jun 20, 2025 at 12:57:46AM +0300, Laurent Pinchart wrote:
> > Hi Mehdi,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Jun 19, 2025 at 07:59:34PM +0200, Mehdi Djait wrote:
> > > devm_clk_get() fails on ACPI-based platforms, where firmware does not
> > > provide a direct reference to the clock producer.
> > > 
> > > Replace devm_clk_get() with the new v4l2 helper
> > > devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
> > > platforms to retrieve a reference to the clock producer from firmware.
> > > 
> > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > 
> > > diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> > > index 95ffe7536aa6..5cc278c3e169 100644
> > > --- a/drivers/media/i2c/ov8865.c
> > > +++ b/drivers/media/i2c/ov8865.c
> > > @@ -2956,7 +2956,6 @@ static int ov8865_probe(struct i2c_client *client)
> > >  	struct ov8865_sensor *sensor;
> > >  	struct v4l2_subdev *subdev;
> > >  	struct media_pad *pad;
> > > -	unsigned int rate = 0;
> > >  	unsigned int i;
> > >  	int ret;
> > >  
> > > @@ -3019,39 +3018,14 @@ static int ov8865_probe(struct i2c_client *client)
> > >  
> > >  	/* External Clock */
> > >  
> > > -	sensor->extclk = devm_clk_get(dev, NULL);
> > > -	if (PTR_ERR(sensor->extclk) == -ENOENT) {
> > > -		dev_info(dev, "no external clock found, continuing...\n");
> > > -		sensor->extclk = NULL;
> > > -	} else if (IS_ERR(sensor->extclk)) {
> > > +	sensor->extclk = devm_v4l2_sensor_clk_get(dev, NULL);
> > > +	if (IS_ERR(sensor->extclk)) {
> > >  		dev_err(dev, "failed to get external clock\n");
> > >  		ret = PTR_ERR(sensor->extclk);
> 
> Actually, I'd take this as an opportunity to write
> 
>  		ret = dev_err_probe(dev, PTR_ERR(sensor->extclk),
> 				    "failed to get external clock\n");

Wouldn't printing this kind of a message fit for devm_v4l2_sensor_clk_get()
and consequently be removed from drivers?

-- 
Kind regards,

Sakari Ailus

