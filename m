Return-Path: <linux-media+bounces-39816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FD0B24A12
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 15:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73230189317C
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C0A1487D1;
	Wed, 13 Aug 2025 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="pvVuYb8B"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD4F50F
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090035; cv=pass; b=E+9zrkJpWK6BnfBBpeKr82KXJtmQ98BjIYvjz491Qsat8/YBOiND6Y2hloIVkIoi38q7jVWgSqpKix1E4+0GsfLlI00V9Pq1SYSN+UqK+b9AB372TxatLqV7+FYOAWxrgvpBDobAZE8v8DTWAF1o6D6IZI8WPEqyKKuLjt2NaF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090035; c=relaxed/simple;
	bh=rNhp1zZ9LR8sUL0l+BEM7wVmzfbMlJ91o3y7oR232po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mazGGgdZpH5pPo3KaW1PsmnSEUXNV97fGS9FJwBw6IiMK6Kv9gX+6PXsLmAj9PCKyE+ia5VMkaYS5J0m+mzV61dnNkSC0M9KA/3GUBT9tcDfYWQk5zv4+9E/OleMpAZh/4Zezg0fR9cqBs3zYbaEPv6aovgqHPbpeyPy0YHTWc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=pvVuYb8B; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c27lF4ZZvzyWK;
	Wed, 13 Aug 2025 16:00:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755090029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkKsj+JHSM7ioHyHFT2Lg0hOW4pBSWNl0RAJZmfM+DE=;
	b=pvVuYb8BhhXbwKmqpVaAW45FgpHIpbY+uch7YZwAG/N4SyYTyCNWhdqUtx6F+MLm9wMLzO
	4sS7xnL1ktoxDVy+ZJubgCfFxhe1o/sR6+wp+A7OvCMg7Bt+7M85vtpPCn8lcHGfkBESu7
	U4+f3W4JxXOddLx1gXP7WUAw2yHagYQ=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755090029; a=rsa-sha256; cv=none;
	b=nlaRWtsUZbR58NLpQYAlOSWWP6BVYcUXpeQHvDwkNC8aMM4F7LSLiIQgUZPRMyTkQ0UP5k
	Ryof60qxCqmB0e9xsgAjl9TID/SZBOE8H7TwikI2k0qgz+1vMjY7t7S0WwaXeP1Ia8Kr8V
	fM7v6ObnXl/yTNq6q5gOz/RJNS5ZAao=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755090029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CkKsj+JHSM7ioHyHFT2Lg0hOW4pBSWNl0RAJZmfM+DE=;
	b=Ux2G6V63OvJwQthV5cCPUab/G/Z/BtzCMyIZE2KNPwNrPX0EP/JlLbej6wbHgWCfM1OvIn
	Iq0iEToF92LvcN7SWIpg8sDkLliq79YQIFiand3glyUl3pdZGMcm5zB5eAzUk+3LvtQCQt
	omsFHBoKmovn6Mq7wDfGviLf2sTpgzE=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 800BB634C94;
	Wed, 13 Aug 2025 15:59:35 +0300 (EEST)
Date: Wed, 13 Aug 2025 12:59:36 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com,
	arnd@arndb.de, alain.volmat@foss.st.com, andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
	hansg@kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
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
Message-ID: <aJyMOEs9UeiudvXh@valkosipuli.retiisi.eu>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <cd5ac9a7-ada2-4bdf-bc81-8290f0eb88d6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5ac9a7-ada2-4bdf-bc81-8290f0eb88d6@kernel.org>

Hi Hans,

On Wed, Aug 13, 2025 at 12:15:29PM +0200, Hans Verkuil wrote:
> Hi Mehdi, Sakari, Laurent,
> 
> On 26/06/2025 15:33, Mehdi Djait wrote:
> > Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> > platforms to retrieve a reference to the clock producer from firmware.
> > 
> > This helper behaves the same as devm_clk_get() except where there is
> > no clock producer like in ACPI-based platforms.
> > 
> > For ACPI-based platforms the function will read the "clock-frequency"
> > ACPI _DSD property and register a fixed frequency clock with the frequency
> > indicated in the property.
> > 
> > This function also handles the special ACPI-based system case where:
> > The clock-frequency _DSD property is present.
> > A reference to the clock producer is present, where the clock is provided
> > by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > In this case try to set the clock-frequency value to the provided clock.
> 
> On irc I wondered about the name of the new function since it is sensor
> specific, and if it can also be used for e.g. video receivers, then it
> should be renamed to something more generic.
> 
> According to Laurent there is no ACPI standard for video receivers, so
> that's the reason this is sensor specific.
> 
> I'd like to see that documented in this patch. Either in the commit log,
> or, preferred, in the header in the function description.

Given this patch has been around for quite some time and I've sent a PR on
it, I'd prefer to proceed with the current PR. I'm fine with adding more
documentation though if you think we should do that.

> 
> I made a suggestion below.
> 
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 52 +++++++++++++++++++++++++++
> >  include/media/v4l2-common.h           | 27 ++++++++++++++
> >  2 files changed, 79 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> 
> <snip>
> 
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 0a43f56578bc..1c79ca4d5c73 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -100,6 +100,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
> >  struct v4l2_device;
> >  struct v4l2_subdev;
> >  struct v4l2_subdev_ops;
> > +struct clk;
> >  
> >  /* I2C Helper functions */
> >  #include <linux/i2c.h>
> > @@ -620,6 +621,32 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> >  			     unsigned int num_of_driver_link_freqs,
> >  			     unsigned long *bitmap);
> >  
> > +/**
> > + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
> > + *	for a camera sensor.
> > + *
> > + * @dev: device for v4l2 sensor clock "consumer"
> > + * @id: clock consumer ID
> > + *
> > + * This function behaves the same way as devm_clk_get() except where there
> > + * is no clock producer like in ACPI-based platforms.
> > + *
> > + * For ACPI-based platforms, the function will read the "clock-frequency"
> > + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> > + * in the property.
> > + *
> > + * This function also handles the special ACPI-based system case where:
> > + *
> > + * * The clock-frequency _DSD property is present.
> > + * * A reference to the clock producer is present, where the clock is provided
> > + *   by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> > + *
> > + * In this case try to set the clock-frequency value to the provided clock.
> 
>     *
>     * While ACPI has standardized sensor support, there is no standard support for
>     * e.g. video receivers. So this function is specific to sensors, hence the
>     * chosen function name.
> 
> Better suggestions are welcome.

ACPI itself does not standardise camera sensor support. What driver authors
should know indeed is that this function provides a clock that can be at
least queried for frequency, independently of how that clock is controlled
or how its frequency is configured.

How about:

 * This function may be used in camera sensor drivers only.

> 
> If it is just adding a paragraph, then I can just add that manually. If the change
> is more involved, then a v2.1 for just this patch should be posted.
> 
> Other than this, the series looks good.

-- 
Kind regards,

Sakari Ailus

