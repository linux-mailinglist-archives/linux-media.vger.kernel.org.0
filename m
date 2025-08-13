Return-Path: <linux-media+bounces-39822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78193B24C6B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 16:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 038793B800F
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 14:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319782ECEAE;
	Wed, 13 Aug 2025 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jL2Gz9Xf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7CA2EBDC1
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096612; cv=none; b=rRfCl6fqt4JhIUBmAB8yz1kox3Ujb6jF5IMyW/1f62C2pzx94pygESM3/INyTNRKXTUbD9nfBQfv31jcJGPV7YeBirif1sqb6CENTmPD6vqHrLLlTFesB35sEQsf40VJXQXbGtGOJzZdwBI3RdKF9qUHICKuykDCLKkTMbwxi18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096612; c=relaxed/simple;
	bh=J50/3sqQ0kqt0t6Dgr3VqY0jbCX2KTVST8UZsEgv5vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRoFSFVTBWpTLL84pBgKxclJIFtD5gxDX9iv3oJCSZdf4MxUIhDZe1534wD44O02Ac0T3qkgdGYpmAQNSRgNCvilqIHvMqvU89Ky6/4x3dRCzqlzc5l+r/Hd6C2eqYl7lnFrP+zJxClQcP2Rcv5XQ7oOaA2CVqgl1q26Mp8f+UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jL2Gz9Xf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755096611; x=1786632611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J50/3sqQ0kqt0t6Dgr3VqY0jbCX2KTVST8UZsEgv5vo=;
  b=jL2Gz9XfVED91fo9vHn6KIYSMr66UmpQUAsB+ZVh523XIxuC7W830zTw
   q74UisXQbqImZmgR9UoUCPPkib2qcRbQiumYgRgVF0V6/tOoUqP3ovS2g
   0ywShkKRCELhiB4d1PsknHJUrg20wVXrdI9SDKaGQrOmE1jInW9Ilz8nh
   aqkkPIqiCYU0OOZqKYXmqJQPCjcJYiqSc2MhlDTJr7Cd6KYz+oalQrX07
   YfzrK08Jlzhuh5wfX/oy/oHXAg0h4V9/mFdMGNhr4NEPd74qNpHLfCIos
   YNFjCgEsZRGDFhN4EL1Nt9a7bm+hMHp0yt8kKcg5mo58xpXqvkjAxwbwm
   A==;
X-CSE-ConnectionGUID: zvVBee1pRvyGisZFgvkB4A==
X-CSE-MsgGUID: DtLSv61mS767tdaYq5xX/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74842152"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="74842152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:50:09 -0700
X-CSE-ConnectionGUID: +qyiN9jjR6Szk2nEYQbX/Q==
X-CSE-MsgGUID: I1GDREoqSTyYhcMi9awmIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="197349896"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.37])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:50:01 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 72C4F11FC37;
	Wed, 13 Aug 2025 17:49:58 +0300 (EEST)
Date: Wed, 13 Aug 2025 14:49:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
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
Message-ID: <aJymFgQQcIZVk2jX@kekkonen.localdomain>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
 <cd5ac9a7-ada2-4bdf-bc81-8290f0eb88d6@kernel.org>
 <aJyMOEs9UeiudvXh@valkosipuli.retiisi.eu>
 <20250813130831.GG20174@pendragon.ideasonboard.com>
 <70ef88ba-b7b0-488c-a5d7-f90421a1bfda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70ef88ba-b7b0-488c-a5d7-f90421a1bfda@kernel.org>

Hi Hans,

On Wed, Aug 13, 2025 at 03:23:18PM +0200, Hans Verkuil wrote:
> On 13/08/2025 15:08, Laurent Pinchart wrote:
> > On Wed, Aug 13, 2025 at 12:59:36PM +0000, Sakari Ailus wrote:
> >> On Wed, Aug 13, 2025 at 12:15:29PM +0200, Hans Verkuil wrote:
> >>> On 26/06/2025 15:33, Mehdi Djait wrote:
> >>>> Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
> >>>> platforms to retrieve a reference to the clock producer from firmware.
> >>>>
> >>>> This helper behaves the same as devm_clk_get() except where there is
> >>>> no clock producer like in ACPI-based platforms.
> >>>>
> >>>> For ACPI-based platforms the function will read the "clock-frequency"
> >>>> ACPI _DSD property and register a fixed frequency clock with the frequency
> >>>> indicated in the property.
> >>>>
> >>>> This function also handles the special ACPI-based system case where:
> >>>> The clock-frequency _DSD property is present.
> >>>> A reference to the clock producer is present, where the clock is provided
> >>>> by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> >>>> In this case try to set the clock-frequency value to the provided clock.
> >>>
> >>> On irc I wondered about the name of the new function since it is sensor
> >>> specific, and if it can also be used for e.g. video receivers, then it
> >>> should be renamed to something more generic.
> >>>
> >>> According to Laurent there is no ACPI standard for video receivers, so
> >>> that's the reason this is sensor specific.
> >>>
> >>> I'd like to see that documented in this patch. Either in the commit log,
> >>> or, preferred, in the header in the function description.
> >>
> >> Given this patch has been around for quite some time and I've sent a PR on
> >> it, I'd prefer to proceed with the current PR. I'm fine with adding more
> >> documentation though if you think we should do that.
> > 
> > How about a separate patch that Hans can merge just on top of your PR ?
> > Could you send one ?
> 
> I'd like to have the rationale of why this is a sensor-only function
> documented. If I wondered about that, then someone else will likely have
> the same question.
> 
> > 
> >>> I made a suggestion below.
> >>>
> >>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> >>>> ---
> >>>>  drivers/media/v4l2-core/v4l2-common.c | 52 +++++++++++++++++++++++++++
> >>>>  include/media/v4l2-common.h           | 27 ++++++++++++++
> >>>>  2 files changed, 79 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> >>>
> >>> <snip>
> >>>
> >>>> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> >>>> index 0a43f56578bc..1c79ca4d5c73 100644
> >>>> --- a/include/media/v4l2-common.h
> >>>> +++ b/include/media/v4l2-common.h
> >>>> @@ -100,6 +100,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
> >>>>  struct v4l2_device;
> >>>>  struct v4l2_subdev;
> >>>>  struct v4l2_subdev_ops;
> >>>> +struct clk;
> >>>>  
> >>>>  /* I2C Helper functions */
> >>>>  #include <linux/i2c.h>
> >>>> @@ -620,6 +621,32 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
> >>>>  			     unsigned int num_of_driver_link_freqs,
> >>>>  			     unsigned long *bitmap);
> >>>>  
> >>>> +/**
> >>>> + * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
> >>>> + *	for a camera sensor.
> >>>> + *
> >>>> + * @dev: device for v4l2 sensor clock "consumer"
> >>>> + * @id: clock consumer ID
> >>>> + *
> >>>> + * This function behaves the same way as devm_clk_get() except where there
> >>>> + * is no clock producer like in ACPI-based platforms.
> >>>> + *
> >>>> + * For ACPI-based platforms, the function will read the "clock-frequency"
> >>>> + * ACPI _DSD property and register a fixed-clock with the frequency indicated
> >>>> + * in the property.
> >>>> + *
> >>>> + * This function also handles the special ACPI-based system case where:
> >>>> + *
> >>>> + * * The clock-frequency _DSD property is present.
> >>>> + * * A reference to the clock producer is present, where the clock is provided
> >>>> + *   by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
> >>>> + *
> >>>> + * In this case try to set the clock-frequency value to the provided clock.
> >>>
> >>>     *
> >>>     * While ACPI has standardized sensor support, there is no standard support for
> >>>     * e.g. video receivers. So this function is specific to sensors, hence the
> >>>     * chosen function name.
> >>>
> >>> Better suggestions are welcome.
> >>
> >> ACPI itself does not standardise camera sensor support. What driver authors
> > 
> > But there's a de facto standard that makes this helper function
> > suitable, isn't there ?
> > 
> >> should know indeed is that this function provides a clock that can be at
> >> least queried for frequency, independently of how that clock is controlled
> >> or how its frequency is configured.
> >>
> >> How about:
> >>
> >>  * This function may be used in camera sensor drivers only.
> 
> That just restates what is also in the function name. It's the 'why' that I'd
> like to know. Even if you simply don't know if this will work for non-sensor
> driver, just stating that will help.

As I replied on #linux-media:

devm_v4l2_sensor_clk_get() in practice provides a clock to camera sensors
which is what they need; other types of devices generally don't care much
about clocks. Why camera sensors are special is that they have a PLL and a
CSI-2 RX the configuration of which depend on the external clock.

Is something like this what you're looking for, or something more
elaborate? There are different ways the clock can be obtained but I'm not
sure we'll need to go to that in the function documentation.

-- 
Regards,

Sakari Ailus

