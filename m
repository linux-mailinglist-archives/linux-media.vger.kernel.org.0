Return-Path: <linux-media+bounces-31387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD58AA4590
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 324C4467B55
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948F6219A8A;
	Wed, 30 Apr 2025 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mwxz42J3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5166120C472;
	Wed, 30 Apr 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002135; cv=none; b=noCAz2BiL5lule5sVWvDy/FnajOvk0z+pEuAJlT4RohB2OJZQwYFTTmJQ1u99rxbKCl1sMFX51fGeP1G64G4x/dr9VfumoeTicK194XdjuncW52PkpIfN+7oe94OPSPQHD0DLO4d4/07eQJUvwL21q6SE/OiB0dOVC7SswY+eaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002135; c=relaxed/simple;
	bh=W+FK0k6Y1DqaaIqcm9kwWjYuf7rcTjsiKie9eptYe0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXlJtKfuCBB3g68+D0OuOpAzyyhHVxtVWiMAa7PxexjSMMqnic3uEH3oFTyr/GbLBUcA4BPD9lNb4E6aX+N0yR9uD4qxAE0HzmY13Ttk0n27pOCCfvXWI/2jhmXFs5x6+PB4VrTeeqfuZ/AHmEtAMiSUNgzhN8+UCZk+0ISTeL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mwxz42J3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746002133; x=1777538133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W+FK0k6Y1DqaaIqcm9kwWjYuf7rcTjsiKie9eptYe0g=;
  b=Mwxz42J3QWZ8ViFMmQx3awbE1aa0U+jK8H0iuzQdiDxV4z2ZS+xU4TJN
   b+IlhIaEd31hj445sT3BJxWfp2l6VCo9kJ1PbzaJlIe90PpVnTAVaYh8M
   qr+LIWAgROWB9FS9UVAxghiSEjT4/5wRRIXOf89DxYHA3pdwaPRbJTAV7
   SJDjD7J/Y0yzXRAqzMk072TfXKUH0G/yjk3hDvNJTyLBuGUs8NUJFkXVX
   LtbdMb+gPs1BXGNN+azDEACxOd0VsCG4ezHXWOY5IT0Vvv9K3POOWMW4r
   Pep1qVNxzj30AHrUK2ytHDEOuCdv/YBTU34W6Fb+UG9ua66EbmCqCi+Z9
   w==;
X-CSE-ConnectionGUID: K3r/oUmUT3uiG7Ovjktk/Q==
X-CSE-MsgGUID: VjHOKi8VTv+AyYfeIX5kPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51471156"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="51471156"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:35:32 -0700
X-CSE-ConnectionGUID: OGr1YDR/QwSzSeMXOgFSDQ==
X-CSE-MsgGUID: FowCmlJ4St6RnoWA0URrdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138872218"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:35:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AF7BF11F7E7;
	Wed, 30 Apr 2025 11:35:24 +0300 (EEST)
Date: Wed, 30 Apr 2025 08:35:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
Message-ID: <aBHgzJ64pv0z2QAX@kekkonen.localdomain>
References: <20250407-b4-vd55g1-v6-0-1850f18b1f24@foss.st.com>
 <20250407-b4-vd55g1-v6-2-1850f18b1f24@foss.st.com>
 <aBCxpuppB6L-Ft2c@kekkonen.localdomain>
 <70f7bc9b-4533-4c8e-a792-aad9a0b7a6d4@foss.st.com>
 <aBC_gx8vFNWLacgB@kekkonen.localdomain>
 <622301ae-0973-4cdb-936c-3152afdbfb46@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <622301ae-0973-4cdb-936c-3152afdbfb46@foss.st.com>

Hi Benjamin,

On Wed, Apr 30, 2025 at 10:23:22AM +0200, Benjamin Mugnier wrote:
> Hi Sakari,
> 
> On 4/29/25 14:01, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > On Tue, Apr 29, 2025 at 01:29:39PM +0200, Benjamin Mugnier wrote:
> >>>> +static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
> >>>> +				 struct fwnode_handle *endpoint)
> >>>> +{
> >>>> +	struct i2c_client *client = sensor->i2c_client;
> >>>> +	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
> >>>> +	u8 n_lanes;
> >>>> +	int ret;
> >>>> +
> >>>> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
> >>>> +	if (ret)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	/* Check lanes number */
> >>>> +	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
> >>>> +	if (n_lanes != 1) {
> >>>> +		dev_err(&client->dev, "Sensor only supports 1 lane, found %d\n",
> >>>> +			n_lanes);
> >>>> +		ret = -EINVAL;
> >>>> +		goto done;
> >>>> +	}
> >>>> +
> >>>> +	/* Clock lane must be first */
> >>>> +	if (ep.bus.mipi_csi2.clock_lane != 0) {
> >>>> +		dev_err(&client->dev, "Clock lane must be mapped to lane 0\n");
> >>>> +		ret = -EINVAL;
> >>>> +		goto done;
> >>>> +	}
> >>>> +
> >>>> +	/* Handle polarities in sensor configuration */
> >>>> +	sensor->oif_ctrl = (ep.bus.mipi_csi2.lane_polarities[0] << 3) |
> >>>> +			   (ep.bus.mipi_csi2.lane_polarities[1] << 6);
> >>>> +
> >>>> +	/* Check the link frequency set in device tree */
> >>>> +	if (!ep.nr_of_link_frequencies) {
> >>>> +		dev_err(&client->dev, "link-frequency property not found in DT\n");
> >>>> +		ret = -EINVAL;
> >>>> +		goto done;
> >>>> +	}
> >>>> +	if (ep.nr_of_link_frequencies != 1) {
> >>>> +		dev_err(&client->dev, "Multiple link frequencies not supported\n");
> >>>> +		ret = -EINVAL;
> >>>> +		goto done;
> >>>
> >>> Please check the link frequency matches with what the driver supports,
> >>> using e.g. v4l2_link_freq_to_bitmap().
> >>>
> >>
> >> Are you referring to checks performed in in vd55g1_prepare_clock_tree()
> >> ? Keep in mind it will change a bit with Laurent's comments though.
> >> The sensor supports a range of frequencies therefore I chose to check it
> >> manually instead of v4l2_link_freq_to_bitmap().
> > 
> > Ok, that's fine then. But please check this results to the frequency that
> > was requested, currently it may be off AFAIR.
> > 
> 
> As far as I understand it should be fine in v7, could you have a look
> once sent ?

There's still no check the PLL configuration produces the requested
frequency, is there? Or maybe I missed it?

-- 
Regards,

Sakari Ailus

