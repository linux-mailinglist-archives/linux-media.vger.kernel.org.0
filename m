Return-Path: <linux-media+bounces-50878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 46090D30F4B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05C85300C9A1
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B0F38A287;
	Fri, 16 Jan 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1v8MQHd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8172FFF9C;
	Fri, 16 Jan 2026 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565732; cv=none; b=Z5S4NaGitgJXrPCkNhVg9PAeQ8eE7dlb0MkfKOGxccSfqUh4soq3uurIlwGM7Cq+BY7aKrmy0yaJbT9u+FsBlxBPjgmZABFXypXkN3rjDz7lSL96NasKyyWgYtk4AX4+mMvqXxiIr+ulQBQauR7eb4TuY1FV9L+MmmJ/d/YrdpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565732; c=relaxed/simple;
	bh=OIr+6UCiu8PtyDY3DO1T3eeJXV/4Zp3ip7vINaVaq1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJjiVa/MEiPR//M/gYfZ5gymT6q5zTTt/+I7lTDWDusEXBIs0ZWmbtN2We6kb9gCO3TjVjLkT0d7GbhKNm7kj26XGEdXePOwpqji1MnQgLJ2KWyxA4S7laRTR8g4tdRxTtuSbNEyU3O+XfcQhsQnzpCaY+WvgR0q0gZEkBk1xH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1v8MQHd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768565730; x=1800101730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OIr+6UCiu8PtyDY3DO1T3eeJXV/4Zp3ip7vINaVaq1c=;
  b=e1v8MQHdIcaFxwbAPjoYOxWhdRmAo1h0souwJuO7EhrZacIbBbvDX+ZQ
   djeiLTH1qFzSHHUb4LQWgyQhNR/OkIjGF/v+yuXqZZxEVCjtRSxbHloGl
   WqlZyrB4t7B3pXCBvvpdZ7J5qIKaYwwwwqfi0Jm+dq+awmNNeAIiqzi5U
   RHxdjwWU0Mkduu1XrUmQLLqwyFyRnMFoHNhafd69tyhXPvYXLZXXuBR8q
   tcunKdbYQQet5fMG0dMeR+zX3YnVlRDN59t3GDY5EhlOV6CCV7rCXcxVQ
   S0YtnBEvZcKPQM/Y5zJlPYNYr35aVPjVS/FdSy+vtdLDetfEWDCGq1O7I
   w==;
X-CSE-ConnectionGUID: thCwA/dKQ8SbM7d/JfIW5Q==
X-CSE-MsgGUID: w35uZFTgSGmH83J3VeJfZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69610997"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69610997"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:15:25 -0800
X-CSE-ConnectionGUID: bQYu/FcJQzSKCczeSozK8Q==
X-CSE-MsgGUID: SZtPAKbWReGUT8lHnDMIYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="236491879"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:15:22 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1866111F726;
	Fri, 16 Jan 2026 14:15:22 +0200 (EET)
Date: Fri, 16 Jan 2026 14:15:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Message-ID: <aWor2m3TNJ-kHJha@kekkonen.localdomain>
References: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
 <20251114-rockchip-mipi-receiver-v3-2-16e83aa7f395@collabora.com>
 <aWdjGuhk9g1iaJuN@kekkonen.localdomain>
 <fc15b8e5-c7ae-4e0e-b3b7-7ce5b5139455@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc15b8e5-c7ae-4e0e-b3b7-7ce5b5139455@collabora.com>

Hi Michael,

On Thu, Jan 15, 2026 at 03:50:59PM +0100, Michael Riesch wrote:
> >> +	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
> >> +	link_freq = v4l2_get_link_freq(source_pad, 0, 0);
> >> +	if (link_freq <= 0)
> >> +		return -EINVAL;
> > 
> > Could you return link_freq here?
> 
> Ack.

You should also test for < 0; v4l2_get_link_freq() returns the frequency or
an error (and 0 isn't valid).

...

> >> +static int rkcsi_register(struct rkcsi_device *csi_dev)
> >> +{
> >> +	struct media_pad *pads = csi_dev->pads;
> >> +	struct v4l2_subdev *sd = &csi_dev->sd;
> >> +	int ret;
> >> +
> >> +	ret = rkcsi_register_notifier(csi_dev);
> >> +	if (ret)
> >> +		goto err;
> >> +
> >> +	v4l2_subdev_init(sd, &rkcsi_ops);
> >> +	sd->dev = csi_dev->dev;
> >> +	sd->entity.ops = &rkcsi_media_ops;
> >> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> >> +	sd->internal_ops = &rkcsi_internal_ops;
> >> +	sd->owner = THIS_MODULE;
> >> +	snprintf(sd->name, sizeof(sd->name), "rockchip-mipi-csi %s",
> >> +		 dev_name(csi_dev->dev));
> > 
> > Do you need to give it an explicit name? (v4l2_i2c_subdev_init() already
> > does that.)
> 
> I do, actually. I don't call the _i2c_ variant. This is a platform device.

Ah, I somehow thought this would be an I²C device. Please ignore the
comment then.

...

> >> +	pm_runtime_enable(dev);
> > 
> > You're not resuming the device in probe(). I guess you depend on CONFIG_PM?
> 
> I do depend on CONFIG_PM.
> 
> I don't think there is need to resume in probe -> resume in
> _enable_streams should do the trick, right?

Ack; that's fine with CONFIG_PM.

-- 
Kind regards,

Sakari Ailus

