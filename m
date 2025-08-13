Return-Path: <linux-media+bounces-39819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D5AB24A81
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 15:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B94DB1BC17DF
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1945E2E5B3B;
	Wed, 13 Aug 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="bfyd8wlk"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8A12E8DE9
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755091416; cv=pass; b=X2C7/0tQ28FaEuVAt7nftCRbqfVtzsoVIxyrO2QtPLQ8ZXVORmt6RcoOPNQRdLoB8fz3VSTbT3OQMxzSl+p7TJtX3r5m8poNfugbexRPPV45fy5xpr6ig+r3d13nnNwQLt77rZotZUsdZ5STcj2lSe862T45Q8QL+CQ45FyODLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755091416; c=relaxed/simple;
	bh=JJvQGoA2DKu0gJDwh/Cb7xLea/fNnQivON1hS+qFIvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FebUBsp/3waP9A64nrlT6PSUbx44ls6YBhlZ6rtPKWv7CbKxa++/3e+Ek0ycIER/q57TMsIo9w4SJHwDHCA5rzhP77UGTbdIavGTvEj76nRk/Uu4w6aG8xsZYMLYc09bsA9SN2WyikpTaKgc6KPpbIxJIv2Ipgbsy+FaVN4NzZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=bfyd8wlk; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4c28Ff6VT8z49Q3D;
	Wed, 13 Aug 2025 16:23:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1755091402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMuD9E2qAwmiy5+TXpdEagb8GMe4WAOhAfYqsoF6bOU=;
	b=bfyd8wlk1m3LibEJyVSDsg9NBhME2vnMgL697GPzYq2uYBejniFJjgimgLSpuwuRmfQeYq
	i06glyLFBJOZX06Y2bL/AotqXxWmppLuQLLstIdjUcysoVJBOuyLSt1xkqRivtS0bUPWN/
	HjVuC/59cLp3C4QTmYlSHpW0XaAh59+XXjyhWylDWVJJUgknYCJQ7BRU805dhP8Pd38XQv
	XFbNeSxxhZRNxTAftpMjwCFijpl0AQI7CCvlT7+G9lFw86xnhznEVxzCM1TYGBmzPZ3KB9
	IuZZf5N7ATLS8qybRO9GvdrB4KBVi4H330u30ihMZqP4X4Edh3w0A3cmHOvp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1755091402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uMuD9E2qAwmiy5+TXpdEagb8GMe4WAOhAfYqsoF6bOU=;
	b=b+vhWPE0MFdCeN+JKt0JCijbEmuDQ/T0EDgEByODYbEHXdHERAPotqfbQlsbt6Oo9WtDHn
	WtzJnldCn0JvHYUBBVSFulJpjX4JmrBwZfs7CR5jXeRNuK9CV/NN5RB9HY48E1L/9QbcBf
	V2kVbjZ5vh66SZ1zdal2oPhxSmw6QiDa5NqtBzabjqtDK0MBTpMbCc/qfaXW2zosNrkj34
	z+bo3WLAaRRlwvjFhmvbk3QmUiQlYmSjUVPj7nAc/ibiX81e7qtiSyr5jFPCSI5v+E+Xwq
	hsGJBB5/55pcCo3duo5/CsgRzhakAZBJHOuFehUnMTCGIG9Te6bkEK+Q2lFdrg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1755091402; a=rsa-sha256;
	cv=none;
	b=iAmucjo0WKPuUVpu2keKdiTwjHRwBcTcJMX5ZYIJlY9cuhlUZj6AVW/f9D+4NxEsTRdCGR
	wba5QMhM/CR/nBOf2ytrTTpN4kv0/Jry4t1rqcLV/U6/BHmKJD16SkxpaqKhuizJ4IlcqC
	XpC3wC5FWxpStEilXkjAi2T06qi96JT6/aBpLKimyvwwa0c8f4N/iGsjYUWd7nWy1hBgFL
	P8JmJ1Ab+PH7Qgs1cozxIi8HpAj7P+tBkdUvbeVS1TSiue2fzjC+HRrxh3rQgHgs438euz
	KTU/7pQ6durveD3wu6RBM67cA82B7AkX9YpW8M2HVQLOf8u10NcNDUVm4PZzRQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9D5A3634C93;
	Wed, 13 Aug 2025 16:22:29 +0300 (EEST)
Date: Wed, 13 Aug 2025 13:22:30 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	sakari.ailus@linux.intel.com, stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com,
	andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com, hansg@kernel.org,
	hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com, khalasa@piap.pl, mani@kernel.org,
	m.felsch@pengutronix.de, matthias.fend@emfend.at,
	mchehab@kernel.org, michael.riesch@collabora.com,
	naush@raspberrypi.com, nicholas@rothemail.net,
	nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com, pavel@kernel.org, rashanmu@gmail.com,
	ribalda@chromium.org, slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 01/48] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <aJyRlpCfI2ak31ms@valkosipuli.retiisi.eu>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <cd5ac9a7-ada2-4bdf-bc81-8290f0eb88d6@kernel.org>
 <aJyMOEs9UeiudvXh@valkosipuli.retiisi.eu>
 <20250813130831.GG20174@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813130831.GG20174@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Aug 13, 2025 at 04:08:31PM +0300, Laurent Pinchart wrote:
> On Wed, Aug 13, 2025 at 12:59:36PM +0000, Sakari Ailus wrote:
> > On Wed, Aug 13, 2025 at 12:15:29PM +0200, Hans Verkuil wrote:
> > > On 26/06/2025 15:33, Mehdi Djait wrote:
> > > > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > > > platforms to retrieve a reference to the clock producer from firmware.
> > > > 
> > > > This helper behaves the same as devm_clk_get() except where there is
> > > > no clock producer like in ACPI-based platforms.
> > > > 
> > > > For ACPI-based platforms the function will read the "clock-frequency"
> > > > ACPI _DSD property and register a fixed frequency clock with the frequency
> > > > indicated in the property.
> > > > 
> > > > This function also handles the special ACPI-based system case where:
> > > > The clock-frequency _DSD property is present.
> > > > A reference to the clock producer is present, where the clock is provided
> > > > by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > > > In this case try to set the clock-frequency value to the provided clock.
> > > 
> > > On irc I wondered about the name of the new function since it is sensor
> > > specific, and if it can also be used for e.g. video receivers, then it
> > > should be renamed to something more generic.
> > > 
> > > According to Laurent there is no ACPI standard for video receivers, so
> > > that's the reason this is sensor specific.
> > > 
> > > I'd like to see that documented in this patch. Either in the commit log,
> > > or, preferred, in the header in the function description.
> > 
> > Given this patch has been around for quite some time and I've sent a PR on
> > it, I'd prefer to proceed with the current PR. I'm fine with adding more
> > documentation though if you think we should do that.
> 
> How about a separate patch that Hans can merge just on top of your PR ?
> Could you send one ?

Sure. Let's try to agree on what it should contain. :-)

> 
> > > I made a suggestion below.
> > > 
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-common.c | 52 +++++++++++++++++++++++++++
> > > >  include/media/v4l2-common.h           | 27 ++++++++++++++
> > > >  2 files changed, 79 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > 
> > > <snip>
> > > 
> > > > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > > > index 0a43f56578bc..1c79ca4d5c73 100644
> > > > --- a/include/media/v4l2-common.h
> > > > +++ b/include/media/v4l2-common.h
> > > > @@ -100,6 +100,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
> > > >  struct v4l2_device;
> > > >  struct v4l2_subdev;
> > > >  struct v4l2_subdev_ops;
> > > > +struct clk;
> > > >  
> > > >  /* I2C Helper functions */
> > > >  #include <linux/i2c.h>
> > > > @@ -620,6 +621,32 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> > > >  			     unsigned int num_of_driver_link_freqs,
> > > >  			     unsigned long *bitmap);
> > > >  
> > > > +/**
> > > > + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
> > > > + *	for a camera sensor.
> > > > + *
> > > > + * @dev: device for v4l2 sensor clock "consumer"
> > > > + * @id: clock consumer ID
> > > > + *
> > > > + * This function behaves the same way as devm_clk_get() except where there
> > > > + * is no clock producer like in ACPI-based platforms.
> > > > + *
> > > > + * For ACPI-based platforms, the function will read the "clock-frequency"
> > > > + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> > > > + * in the property.
> > > > + *
> > > > + * This function also handles the special ACPI-based system case where:
> > > > + *
> > > > + * * The clock-frequency _DSD property is present.
> > > > + * * A reference to the clock producer is present, where the clock is provided
> > > > + *   by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > > > + *
> > > > + * In this case try to set the clock-frequency value to the provided clock.
> > > 
> > >     *
> > >     * While ACPI has standardized sensor support, there is no standard support for
> > >     * e.g. video receivers. So this function is specific to sensors, hence the
> > >     * chosen function name.
> > > 
> > > Better suggestions are welcome.
> > 
> > ACPI itself does not standardise camera sensor support. What driver authors
> 
> But there's a de facto standard that makes this helper function
> suitable, isn't there ?

In this context DisCo for Imaging and Intel Windows ACPI camera description
are worth mentioning. I wouldn't call the latter a "standard" though. But
it doesn't matter whether it is or not, all the caller needs to know is
that the function returns a usable clock.

> 
> > should know indeed is that this function provides a clock that can be at
> > least queried for frequency, independently of how that clock is controlled
> > or how its frequency is configured.
> > 
> > How about:
> > 
> >  * This function may be used in camera sensor drivers only.
> > 
> > > If it is just adding a paragraph, then I can just add that manually. If the change
> > > is more involved, then a v2.1 for just this patch should be posted.
> > > 
> > > Other than this, the series looks good.
> 

-- 
Regards,

Sakari Ailus

