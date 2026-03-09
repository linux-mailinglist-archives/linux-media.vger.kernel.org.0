Return-Path: <linux-media+bounces-54947-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MPfIgPDrmmRIgIAu9opvQ
	(envelope-from <linux-media+bounces-54947-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 13:54:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B02393A6
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 13:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 553E2307A3DB
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 12:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161653BD645;
	Mon,  9 Mar 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFCT4IqV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0C33AEF22;
	Mon,  9 Mar 2026 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060557; cv=none; b=WprJbljklu9k20u3DO7dUp98G7FJIthpb9qlqC/mPjPy35Jmv5EnY2vkFNAPIuXUeGrq8gL0GfM6KbNH0zwa8q9auCwHMCvaznlTfHgt9wetadliptRUnwe015kJ2HejVlTnDkktlH3jFz9ln8bSKcazHTi1yjG7C4vyqUPnUOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060557; c=relaxed/simple;
	bh=BEPKUiX9C2NLT53pj8DEV+NcgtIg5P0UEE6zZFiAmoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Efx0eW0QcFcp/nvKM3hEsd3j3XfAWM3iTgdFnLjH/lguBq9ZvkVT+1iVlgpEbNqAu75vMXicpnskO7QoSLQNQE3Uvw4BRnAjt1/TJLn6XccTPcEA6xW6vspQB/V4vLou5Nh0Nq7D80EZYQ2txA3RbAWuLPYVohccdl0kPS+cTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFCT4IqV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773060555; x=1804596555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BEPKUiX9C2NLT53pj8DEV+NcgtIg5P0UEE6zZFiAmoc=;
  b=PFCT4IqV0lRpkclHEVboCqd8Zl5zNOWkMsvyIpQ6ouc/IiDgsM+PGwYV
   wgqJ9HYl2FcShj6R7QF7+0r7dmeILa7SAMn1svOGHXdbabFIcVY7wrNXk
   GRIuk7qgb+qCT2d6rNoQbjVxx8DR7dzwYVICS3hzAqOfbQAalrzKGlZ/A
   1a30+F1UOFQJ79njD066O51BtuFEbdxG0GlLkudiRHkc/fZXvaEELG9lo
   /gV2P/bo2PoiedUcd8BYc8eOnMhTrKn7gkFH/1HlB4KNM6v9Z4j6HOmLn
   QmvjTXqGc2fPfMTEoTj3mi9RR7F8v1jCTFvT24AxOgXwy667iyZ2POYS9
   Q==;
X-CSE-ConnectionGUID: y8LVjZ+/TvGMVD6W9j6peg==
X-CSE-MsgGUID: C823S2eqT3uTvvzVgpaEzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99551575"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="99551575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 05:49:14 -0700
X-CSE-ConnectionGUID: 1QcdUI6TTxKDbBhgORdo5A==
X-CSE-MsgGUID: fLFYJct2Sx6PwOAOmx+9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219722028"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 05:49:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 37EC5121D1F;
	Mon, 09 Mar 2026 14:49:42 +0200 (EET)
Date: Mon, 9 Mar 2026 14:49:42 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH 3/8] media: i2c: ov08d10: add support for reset and power
 management
Message-ID: <aa7B5qjfKqYQ9fx0@kekkonen.localdomain>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
 <20260226-ov08d10-v1-3-c3a916368123@emfend.at>
 <6a63b27e567d854e8459bc3a31d99e2d01cd1dd6.camel@pengutronix.de>
 <215f5ff5-0751-4074-9353-dcb5d3c63833@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <215f5ff5-0751-4074-9353-dcb5d3c63833@emfend.at>
X-Rspamd-Queue-Id: 108B02393A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54947-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[emfend.at:email,intel.com:dkim,kekkonen.localdomain:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Matthias,

On Thu, Feb 26, 2026 at 09:30:08PM +0100, Matthias Fend wrote:
> Hi Philipp,
> 
> thanks for your feedback.
> 
> Am 26.02.2026 um 11:13 schrieb Philipp Zabel:
> > On Do, 2026-02-26 at 09:56 +0100, Matthias Fend wrote:
> > > Add support for the required power supplies as well as the control of an
> > > optional sensor reset.
> > > 
> > > Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> > > ---
> > >   drivers/media/i2c/ov08d10.c | 104 +++++++++++++++++++++++++++++++++++++++++---
> > >   1 file changed, 97 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
> > > index cfe18dcde174ddc1f198cb2aaa6b4a3b34045508..4dba264488b3e1950016deb3fa34732871cc34fc 100644
> > > --- a/drivers/media/i2c/ov08d10.c
> > > +++ b/drivers/media/i2c/ov08d10.c
> > [...]
> > > @@ -1379,6 +1442,7 @@ static int ov08d10_probe(struct i2c_client *client)
> > >   {
> > >   	struct ov08d10 *ov08d10;
> > >   	unsigned long freq;
> > > +	unsigned int i;
> > >   	int ret;
> > >   	ov08d10 = devm_kzalloc(&client->dev, sizeof(*ov08d10), GFP_KERNEL);
> > > @@ -1404,12 +1468,32 @@ static int ov08d10_probe(struct i2c_client *client)
> > >   		return ret;
> > >   	}
> > > +	ov08d10->reset = devm_reset_control_get_optional(ov08d10->dev, NULL);
> > 
> > Please use devm_reset_control_get_optional_exclusive() directly.
> 
> ACK
> 
> > 
> > > +	if (IS_ERR(ov08d10->reset))
> > > +		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
> > > +				     "failed to get reset\n");
> > > +	reset_control_assert(ov08d10->reset);
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(ov08d10_supply_names); i++)
> > > +		ov08d10->supplies[i].supply = ov08d10_supply_names[i];
> > > +
> > > +	ret = devm_regulator_bulk_get(ov08d10->dev,
> > > +				      ARRAY_SIZE(ov08d10->supplies),
> > > +				      ov08d10->supplies);
> > > +	if (ret)
> > > +		return dev_err_probe(ov08d10->dev, ret,
> > > +				     "failed to get regulators\n");
> > > +
> > >   	v4l2_i2c_subdev_init(&ov08d10->sd, client, &ov08d10_subdev_ops);
> > > +	ret = ov08d10_power_on(ov08d10->dev);
> > > +	if (ret)
> > > +		return dev_err_probe(ov08d10->dev, ret, "failed to power on\n");
> > > +
> > >   	ret = ov08d10_identify_module(ov08d10);
> > >   	if (ret) {
> > >   		dev_err(ov08d10->dev, "failed to find sensor: %d", ret);
> > > -		return ret;
> > > +		goto probe_error_power_off;
> > >   	}
> > >   	mutex_init(&ov08d10->mutex);
> > > @@ -1430,6 +1514,9 @@ static int ov08d10_probe(struct i2c_client *client)
> > >   		goto probe_error_v4l2_ctrl_handler_free;
> > >   	}
> > > +	pm_runtime_set_active(ov08d10->dev);
> > > +	pm_runtime_enable(ov08d10->dev);
> > > +
> > >   	ret = v4l2_async_register_subdev_sensor(&ov08d10->sd);
> > >   	if (ret < 0) {
> > >   		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d",
> > > @@ -1437,26 +1524,28 @@ static int ov08d10_probe(struct i2c_client *client)
> > >   		goto probe_error_media_entity_cleanup;
> > >   	}
> > > -	/*
> > > -	 * Device is already turned on by i2c-core with ACPI domain PM.
> > > -	 * Enable runtime PM and turn off the device.
> > > -	 */
> > 
> > The commit message does not explain why this comment is dropped.
> 
> I didn't find the comment particularly helpful and since other sensors
> manage without it and there's now more than just ACPI, and "turn off"
> happens later, I thought it was fine to just drop the comment.
> 
> If you think it should still be included, I'd be happy to change it.

I'd drop it and mention this in the commit message, there's nothing
specific to this driver here (nor even camera sensors in general).

> 
> > 
> > > -	pm_runtime_set_active(ov08d10->dev);
> > > -	pm_runtime_enable(ov08d10->dev);
> > >   	pm_runtime_idle(ov08d10->dev);
> > >   	return 0;
> > >   probe_error_media_entity_cleanup:
> > > +	pm_runtime_disable(ov08d10->dev);
> > > +	pm_runtime_set_suspended(ov08d10->dev);
> > 
> > Does this do the correct thing if v4l2_async_register_subdev_sensor()
> > returns -EPROBE_DEFER (for example via privacy led) and then it probes
> > a second time? It looks like the assumption pm_runtime_set_active()
> > doesn't hold then.
> 
> At least it works as expected for me. But as mentioned, I don't have an ACPI
> hardware setup available. Does your point maybe refer to ACPI, or what
> exactly do you mean?
> To me, it now looks very similar to other Omnivision ACPI drivers – do you
> perhaps have a specific suggestion for what should be changed?

Moving pm_runtime_set_active() and pm_runtime_enable() calls above
v4l2_async_register_subdev_sensor() (and related teardown changes) are
actually a bugfix (the driver's external APIs are exposed before runtime PM
is enabled and thus e.g. streaming on will fail). It'd be nice to post that
separately from non-ACPI power management changes.

-- 
Kind regards,

Sakari Ailus

