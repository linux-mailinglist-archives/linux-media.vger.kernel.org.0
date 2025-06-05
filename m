Return-Path: <linux-media+bounces-34100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDC4ACED28
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 11:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3998F176243
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 09:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B333211484;
	Thu,  5 Jun 2025 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSFDzF4m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DB22C3242
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749117365; cv=none; b=MeI6rQ+/cDF4yjiqbYifPieGhBmBXPy9ItHjkesQT4kYXBDfdHwOZ2TE9ESsvzJdqaPZQNPp7G+WkgH2Xu5KlHPqFXJM9BIxGBeDL8zmq4S30gDpW2p/OofBVNrcjOXRHCNU6ZKZFMUhjz878fFICwiQe+SSRqH09mkXf9JNvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749117365; c=relaxed/simple;
	bh=gtLeOnUUrsqXxOvHUykTLuzErvwZVJHZkiguXU/0ZSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zq+xBBws2DCsvTbmzDlLet9CacnvuEGmXWToOM0bAdNNO4cp4O4FgJNw+oH+kzjtnG2nXn+N3W5RgyOuQdqDgkK103PmG2+srwxESdrWEb0VKFOfYMJqXZq3O3eGIZprWTgw3yW/7U+yMojAZ4DQV/JbY/pC1DKLS/3K6hM8u0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSFDzF4m; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749117364; x=1780653364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gtLeOnUUrsqXxOvHUykTLuzErvwZVJHZkiguXU/0ZSU=;
  b=YSFDzF4mUKhUJ261NVKMXslOVGx48aHsBOuCdDktHQoXhMHKLI5AfNcD
   6hTKQi3Wu4s7xlryvAx0wH4BMMLUtQ+Ze+2gplww10KnCxB+bxOvbBRXT
   M5nJMS/z96nZSi9pj+cqHJjcpTnFVefmYdfBotHB9ILHYLngIq5DSA9Zt
   uZy8jnYHDzr9XhqBr+rBsDc1AjzrDgbWh2CWjPKOa3W0yjS8VF85DksSI
   noLsSfwXQWqr/DdQrHD1b8s7yed0wEVepOeJidb91gJFh0142W6zARHBz
   TVg/tMXlLC1BwS0Cv6D+1IqZW5SUkiB0HBgehLCxCJCmdYKRtT1zcilo8
   A==;
X-CSE-ConnectionGUID: SpUWPVZ6Sl2M6J6Tqdk0Hw==
X-CSE-MsgGUID: XQ27CCBoQJurSe82sSw1jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62620315"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="62620315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 02:56:02 -0700
X-CSE-ConnectionGUID: 8Nen9uIrT3yJHf9p5K7lWQ==
X-CSE-MsgGUID: f/4/0QhsT/OJhIep+MQWVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="176328094"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 02:55:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 15DD412023B;
	Thu,  5 Jun 2025 12:55:42 +0300 (EEST)
Date: Thu, 5 Jun 2025 09:55:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 11/12] media: mt9m114: Return -EPROBE_DEFER if no
 endpoint is found
Message-ID: <aEFpnjF64Iw3xFmq@kekkonen.localdomain>
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-12-hansg@kernel.org>
 <20250603110359.GC27361@pendragon.ideasonboard.com>
 <bd0f6da2-d358-47c9-b2d8-4f5352b7e28f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd0f6da2-d358-47c9-b2d8-4f5352b7e28f@kernel.org>

Hi Hans, Laurent,

On Tue, Jun 03, 2025 at 03:27:16PM +0200, Hans de Goede wrote:
> Hi Laurent,
> 
> Thank you for your reviews. I agree with most of your
> comments and I'll address them when I can make some time.
> 
> On 3-Jun-25 1:03 PM, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > Thank you for the patch.
> > 
> > On Sat, May 31, 2025 at 06:31:46PM +0200, Hans de Goede wrote:
> >> With IPU# bridges, endpoints may only be created when the IPU bridge is
> >> initialized. This may happen after the sensor driver's first probe().
> >>
> >> Signed-off-by: Hans de Goede <hansg@kernel.org>
> >> ---
> >>  drivers/media/i2c/mt9m114.c | 11 +++++++----
> >>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> >> index c4d3122d698e..72914c47ec9a 100644
> >> --- a/drivers/media/i2c/mt9m114.c
> >> +++ b/drivers/media/i2c/mt9m114.c
> >> @@ -2399,11 +2399,14 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
> >>  	struct fwnode_handle *ep;
> >>  	int ret;
> >>  
> >> +	/*
> >> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
> >> +	 * wait for this.
> >> +	 */
> >>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> >> -	if (!ep) {
> >> -		dev_err(&sensor->client->dev, "No endpoint found\n");
> >> -		return -EINVAL;
> >> -	}
> >> +	if (!ep)
> >> +		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
> >> +				     "waiting for fwnode graph endpoint\n");
> > 
> > That's a bit annoying, as in non-ACPI systems we'll then get probe
> > deferral, making the issue more difficult to debug.
> 
> With "then" I assume you mean when the fwnode graph endpoint is missing
> on DT systems ?
> 
> > Is there a way, on IPU-based systems, to delay probing the sensor until
> > the bridge has been initialized ?
> 
> Waiting for the fwnode graph endpoint to show up is the way to wait for
> bridge init we (Sakari and me) have agreed upon, this is done on all
> drivers used on x86/ACPI platforms.

In the long run it'd be nice to move the code from the IPU bridge to the
ACPI framework. That way we could remove this check as we could guarantee
the endpoints would be where they're needed in time.

But I don't expect this to happen any time soon: reworking the fwnode
infrastructure to accommodate more flexible node/property insertion should
probably be done first. Still, IPU bridge doesn't conflict with DisCo for
Imaging doing largely similar things under the hood as the two are
effectively mutually exclusive (and should remain so).

-- 
Kind regards,

Sakari Ailus

