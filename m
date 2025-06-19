Return-Path: <linux-media+bounces-35445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C1AE0F34
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 00:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7E535A0D12
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 22:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10E726056A;
	Thu, 19 Jun 2025 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AFfQqNnu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE930E841;
	Thu, 19 Jun 2025 22:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750370417; cv=none; b=RfqesKkAh6/cqrao4amGsfE42nf158SldZd/OiP75mpte8ZsxkCoO9UeODydm0AdL+YBsoo6aXFs84//8HKc82E50oC/deVTvKcc0QzPlVA0mwexvqE34s2gtuyI4XUJZJFVAfL6UXc4A7buKmu9TaMj/zywSCkXEKtf5q5pEbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750370417; c=relaxed/simple;
	bh=QX5DnNhpDoUiX1e23Jyyx1os4h4kfqBEFRT7Tr7qCH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8bv2rSqk/+0u+VDviT6zKoRuinvPSLvFp4dfwnK4n75ZB+DI6KQOn1Bc16PK8Lddcs4lixpc6baK2qvpRaNwgIlRiiCr99Sn6P9OckwXEDmM8HDQsDY0Rvudow9orAP7JH8XXM77fonmLX90oFxHKJ3qqqW94ow2c38s5mX+Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AFfQqNnu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C64A725;
	Thu, 19 Jun 2025 23:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750370396;
	bh=QX5DnNhpDoUiX1e23Jyyx1os4h4kfqBEFRT7Tr7qCH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFfQqNnubMqyXG6A71C6RtcE9Pk/JbU5DXn2I8MzeJ716OJZcoiWg9g/JPlNW81FK
	 y/BTaTFn9J8zQhgpP5N27YEj6vLi3Li/kojNSlgzaASUj54q4dhP3fKV4+J3TugJxX
	 +FACnMwd3i37iDIPeUvewnmzb/SqR3lS99sffkCQ=
Date: Fri, 20 Jun 2025 00:59:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: sakari.ailus@linux.intel.com, akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com,
	arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
	hansg@kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se, kieran.bingham@ideasonboard.com, khalasa@piap.pl,
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
Message-ID: <20250619215951.GA32257@pendragon.ideasonboard.com>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <273d77cc78cbe9fd144f96e68407f0f7b41d3895.1750352394.git.mehdi.djait@linux.intel.com>
 <20250619215744.GS22102@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619215744.GS22102@pendragon.ideasonboard.com>

On Fri, Jun 20, 2025 at 12:57:46AM +0300, Laurent Pinchart wrote:
> Hi Mehdi,
> 
> Thank you for the patch.
> 
> On Thu, Jun 19, 2025 at 07:59:34PM +0200, Mehdi Djait wrote:
> > devm_clk_get() fails on ACPI-based platforms, where firmware does not
> > provide a direct reference to the clock producer.
> > 
> > Replace devm_clk_get() with the new v4l2 helper
> > devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
> > platforms to retrieve a reference to the clock producer from firmware.
> > 
> > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > 
> > diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> > index 95ffe7536aa6..5cc278c3e169 100644
> > --- a/drivers/media/i2c/ov8865.c
> > +++ b/drivers/media/i2c/ov8865.c
> > @@ -2956,7 +2956,6 @@ static int ov8865_probe(struct i2c_client *client)
> >  	struct ov8865_sensor *sensor;
> >  	struct v4l2_subdev *subdev;
> >  	struct media_pad *pad;
> > -	unsigned int rate = 0;
> >  	unsigned int i;
> >  	int ret;
> >  
> > @@ -3019,39 +3018,14 @@ static int ov8865_probe(struct i2c_client *client)
> >  
> >  	/* External Clock */
> >  
> > -	sensor->extclk = devm_clk_get(dev, NULL);
> > -	if (PTR_ERR(sensor->extclk) == -ENOENT) {
> > -		dev_info(dev, "no external clock found, continuing...\n");
> > -		sensor->extclk = NULL;
> > -	} else if (IS_ERR(sensor->extclk)) {
> > +	sensor->extclk = devm_v4l2_sensor_clk_get(dev, NULL);
> > +	if (IS_ERR(sensor->extclk)) {
> >  		dev_err(dev, "failed to get external clock\n");
> >  		ret = PTR_ERR(sensor->extclk);

Actually, I'd take this as an opportunity to write

 		ret = dev_err_probe(dev, PTR_ERR(sensor->extclk),
				    "failed to get external clock\n");

> >  		goto error_endpoint;
> >  	}
> >  
> > -	/*
> > -	 * We could have either a 24MHz or 19.2MHz clock rate from either dt or
> > -	 * ACPI...but we also need to support the weird IPU3 case which will
> > -	 * have an external clock AND a clock-frequency property. Check for the
> > -	 * clock-frequency property and if found, set that rate if we managed
> > -	 * to acquire a clock. This should cover the ACPI case. If the system
> > -	 * uses devicetree then the configured rate should already be set, so
> > -	 * we can just read it.
> > -	 */
> > -	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> > -				       &rate);
> > -	if (!ret && sensor->extclk) {
> > -		ret = clk_set_rate(sensor->extclk, rate);
> > -		if (ret) {
> > -			dev_err_probe(dev, ret, "failed to set clock rate\n");
> > -			goto error_endpoint;
> > -		}
> > -	} else if (ret && !sensor->extclk) {
> > -		dev_err_probe(dev, ret, "invalid clock config\n");
> > -		goto error_endpoint;
> > -	}
> > -
> > -	sensor->extclk_rate = rate ? rate : clk_get_rate(sensor->extclk);
> > +	sensor->extclk_rate = clk_get_rate(sensor->extclk);
> >  
> >  	for (i = 0; i < ARRAY_SIZE(supported_extclk_rates); i++) {
> >  		if (sensor->extclk_rate == supported_extclk_rates[i])

-- 
Regards,

Laurent Pinchart

