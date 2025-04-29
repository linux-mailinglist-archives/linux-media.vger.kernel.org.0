Return-Path: <linux-media+bounces-31306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 536FBAA0AF3
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 14:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF7D1B64FAE
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0032C1E1F;
	Tue, 29 Apr 2025 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hx1JN+7L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F3E21325C;
	Tue, 29 Apr 2025 12:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928076; cv=none; b=jl7kIXRaYnVEq7g0fBAXFW6TFtWMbPHZegZRSZ3jAmqnJofMRsQ4w52G0Ekhl+lh1E1DSamWrL02Da+5pyLZMlg3WWzaQD9qPdRUGWFU11MuVVaUzPsjuoWtNnk800patD+/TFmxKnrpOAG+EpScpuJrbHr4bn0jEL4ik+5LmLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928076; c=relaxed/simple;
	bh=Nb6NfT8WKqkyzRVDy8XKyQ8nS6maQi397ouHJdzBsak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THIwN83SE+OCMtz687RdbUGULtiR95kdmP02BURDeER5fhU3KLfXZcMimyy7xgj/7bQrgSHhtKRdf8xETomJkEroan5/02inC3Eoy6L5MUC2HXCWuT6tK707zbLspI//cy6t+vR14yg0cY3r547M34zIHsMsXMzIAjcYLkaCHbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hx1JN+7L; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745928075; x=1777464075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nb6NfT8WKqkyzRVDy8XKyQ8nS6maQi397ouHJdzBsak=;
  b=hx1JN+7L3+kkfH5reOxJaD1ZyFxnQrGipUtybUkwY+P+FAZCB+hlYj54
   s+BD4QFGMHKU0QP3lfO2I6P41Sn9UTIcv6qYZq2THiyQL57jYdSYiOrcw
   8N+AxlmjZirSKP39cgLtAEgJ1ZMIz5Zoj/vB7JRCnI7OEJe4yRS2kK806
   Bmx9hUQHsEE20hhvMeCD1s0ur4fLIRTKXzONUUhFpsBOUobhpnJjDRjMM
   Y+UP9DkAXWCd/zzR/IVAR3pAKMT9w5R8aeHHaFeXOLm3oF/he+OcMxTOJ
   GSaJwsIR5hIIJbVtg0FPF2pLyKqyG1r4d85+dxI7RKc5OwiuUZOBYnYr1
   g==;
X-CSE-ConnectionGUID: EmG7Nl8TThSfn573jRsXJQ==
X-CSE-MsgGUID: rXGVPnFIS/yz71OLO7SNgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47635762"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47635762"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 05:01:14 -0700
X-CSE-ConnectionGUID: 0+AUv4gyQG+k9WOoOzxdLQ==
X-CSE-MsgGUID: rV/r1IICSrekMBjrmlkzow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="164751829"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 05:01:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DAFFE11F944;
	Tue, 29 Apr 2025 15:01:07 +0300 (EEST)
Date: Tue, 29 Apr 2025 12:01:07 +0000
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
Message-ID: <aBC_gx8vFNWLacgB@kekkonen.localdomain>
References: <20250407-b4-vd55g1-v6-0-1850f18b1f24@foss.st.com>
 <20250407-b4-vd55g1-v6-2-1850f18b1f24@foss.st.com>
 <aBCxpuppB6L-Ft2c@kekkonen.localdomain>
 <70f7bc9b-4533-4c8e-a792-aad9a0b7a6d4@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70f7bc9b-4533-4c8e-a792-aad9a0b7a6d4@foss.st.com>

Hi Benjamin,

On Tue, Apr 29, 2025 at 01:29:39PM +0200, Benjamin Mugnier wrote:
> >> +static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
> >> +				 struct fwnode_handle *endpoint)
> >> +{
> >> +	struct i2c_client *client = sensor->i2c_client;
> >> +	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
> >> +	u8 n_lanes;
> >> +	int ret;
> >> +
> >> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
> >> +	if (ret)
> >> +		return -EINVAL;
> >> +
> >> +	/* Check lanes number */
> >> +	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
> >> +	if (n_lanes != 1) {
> >> +		dev_err(&client->dev, "Sensor only supports 1 lane, found %d\n",
> >> +			n_lanes);
> >> +		ret = -EINVAL;
> >> +		goto done;
> >> +	}
> >> +
> >> +	/* Clock lane must be first */
> >> +	if (ep.bus.mipi_csi2.clock_lane != 0) {
> >> +		dev_err(&client->dev, "Clock lane must be mapped to lane 0\n");
> >> +		ret = -EINVAL;
> >> +		goto done;
> >> +	}
> >> +
> >> +	/* Handle polarities in sensor configuration */
> >> +	sensor->oif_ctrl = (ep.bus.mipi_csi2.lane_polarities[0] << 3) |
> >> +			   (ep.bus.mipi_csi2.lane_polarities[1] << 6);
> >> +
> >> +	/* Check the link frequency set in device tree */
> >> +	if (!ep.nr_of_link_frequencies) {
> >> +		dev_err(&client->dev, "link-frequency property not found in DT\n");
> >> +		ret = -EINVAL;
> >> +		goto done;
> >> +	}
> >> +	if (ep.nr_of_link_frequencies != 1) {
> >> +		dev_err(&client->dev, "Multiple link frequencies not supported\n");
> >> +		ret = -EINVAL;
> >> +		goto done;
> > 
> > Please check the link frequency matches with what the driver supports,
> > using e.g. v4l2_link_freq_to_bitmap().
> > 
> 
> Are you referring to checks performed in in vd55g1_prepare_clock_tree()
> ? Keep in mind it will change a bit with Laurent's comments though.
> The sensor supports a range of frequencies therefore I chose to check it
> manually instead of v4l2_link_freq_to_bitmap().

Ok, that's fine then. But please check this results to the frequency that
was requested, currently it may be off AFAIR.

> >> +	ret = v4l2_async_register_subdev(&sensor->sd);
> >> +	if (ret) {
> >> +		dev_err(dev, "async subdev register failed %d\n", ret);
> >> +		goto err_subdev;
> >> +	}
> > 
> > Aren't you missing:
> > 
> > 	pm_runtime_put_autosuspend(dev);
> > 
> > here?
> > 
> 
> Thank you. I'll add it to the pm_runtime block above.
> I also noticed I miss the pm_runtime_dont_use_autosuspend() call in
> err_power_off. I'll add that too.

Ack, sounds good.

-- 
Regards,

Sakari Ailus

