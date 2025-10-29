Return-Path: <linux-media+bounces-45948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 580CBC1C8F0
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 18:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D3D586FA4
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 17:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AE72F6191;
	Wed, 29 Oct 2025 17:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EetOoJeI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8334287510
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 17:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761759020; cv=none; b=VGhWBBGWOMZo1tCUzXAfT2XJlyT1cOeU/lKxqeJZHhffyhEZCZWH2f2+mbptVd0I8uRfwmHn8nlMBgPSPcI6NxzB964PBzruYIV5pZHPCLAC3I/LUKcy5igr9nUEUU9Vq4auH2ZIUu0e4xJZJ0jOy6yVuuD9G9uh9mgzPc3dct0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761759020; c=relaxed/simple;
	bh=32Z2g7knH7zda5xchuVyVuAdN7iqApvfHcyAHYR7K7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvABP0byxMCYnniD5ifD9YHz/OLDYd9FAB8boy7NxYDDqNIr+q64ZHEbvkZX/5Ht2GRRkYXN3EgpC6CotjU9K0D5AqMmye3a/k9S2AfgK47jqSbv78Bx5Nmrb9TiCtvWHr7Rh+W7loo7k6tbvAADuDRw5XyOp2zerkPaV959KMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EetOoJeI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761759018; x=1793295018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=32Z2g7knH7zda5xchuVyVuAdN7iqApvfHcyAHYR7K7k=;
  b=EetOoJeIEAWBszCiaT1eCVsREi8ryRdVBkcuPDLDduGqtOhWQF6BrEf5
   0ahy/lPeXLpW5kdsiWhe2bMA5+B7STo1GC3ybwDLp1YhVy5uQRFE2SUPT
   fWA4SKm4wfI/T2imCLopE48ErwAH7N2aFh6BhDqUZnrBSLUbDNNEsUKdc
   L4+ln0qqReFjv4am3m+2n/t4Lb2VoNyaXHoKE85c9CPHSoOQyXYsLY2PS
   86Pq0DtF6KQYpWpghh+WRSDiWUvX4gWK8C5D3KcY51ipGCjLEf7713RoL
   aBq/m1MTHRYCes7EnGKIxCNrLU1907bbn/VniLP8fYfFK9zo4fMURwQ/R
   Q==;
X-CSE-ConnectionGUID: nEnzNA5+QV+HgnHXafuF7g==
X-CSE-MsgGUID: 5ytJ9A6NRKuqAA+P82y2TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64038943"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="64038943"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:30:16 -0700
X-CSE-ConnectionGUID: Ev/sOJvORsO0Fq/ivz6l8w==
X-CSE-MsgGUID: C/ztXrl4QTOd3H4ZrtHugg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="186473649"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.118])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:30:15 -0700
Date: Wed, 29 Oct 2025 18:30:08 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 11/25] media: i2c: ov01a10: Add ov01a10_check_hwcfg()
 function
Message-ID: <oy6qn6ts2ut5s5uoawwncsucol25fwggy5wl5i4t6uwgwiwz5g@jujvag6exijj>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-12-hansg@kernel.org>
 <c7cp4mcuzoplibfj7jmtcvktbozzbw7qj3bd4kof56rplvjdye@tlpto2deyyeg>
 <a535a51c-215c-48b5-8d7c-e3728425a71c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a535a51c-215c-48b5-8d7c-e3728425a71c@kernel.org>

Hi Hans,

On Tue, Oct 28, 2025 at 09:09:16PM +0100, Hans de Goede wrote:
> Hi Mehdi,
> 
> On 28-Oct-25 6:29 PM, Mehdi Djait wrote:
> > Hi Hans,
> > 
> > Thank you for the patches!
> > 
> > On Tue, Oct 14, 2025 at 07:40:19PM +0200, Hans de Goede wrote:
> >> Add a function to check that the number of mipi-lanes and there frequency
> >> are what the driver expects.
> >>
> >> Signed-off-by: Hans de Goede <hansg@kernel.org>
> > 
> > [..]
> > 
> >> +static int ov01a10_check_hwcfg(struct ov01a10 *ov01a10)
> >> +{
> >> +	struct v4l2_fwnode_endpoint bus_cfg = {
> >> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> >> +	};
> >> +	struct fwnode_handle *ep, *fwnode = dev_fwnode(ov01a10->dev);
> >> +	unsigned long link_freq_bitmap;
> >> +	int ret;
> >> +
> >> +	/*
> >> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
> >> +	 * wait for this.
> >> +	 */
> >> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> >> +	if (!ep)
> >> +		return dev_err_probe(ov01a10->dev, -EPROBE_DEFER,
> >> +				     "waiting for fwnode graph endpoint\n");
> >> +
> >> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> >> +	fwnode_handle_put(ep);
> >> +	if (ret)
> >> +		return dev_err_probe(ov01a10->dev, ret, "parsing endpoint\n");
> >> +
> >> +	ret = v4l2_link_freq_to_bitmap(ov01a10->dev,
> >> +				       bus_cfg.link_frequencies,
> >> +				       bus_cfg.nr_of_link_frequencies,
> >> +				       link_freq_menu_items,
> >> +				       ARRAY_SIZE(link_freq_menu_items),
> >> +				       &link_freq_bitmap);
> >> +	if (ret)
> >> +		goto check_hwcfg_error;
> >> +
> >> +	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
> >> +	ov01a10->link_freq_index = ffs(link_freq_bitmap) - 1;
> >> +
> >> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV01A10_DATA_LANES) {
> >> +		ret = dev_err_probe(ov01a10->dev, -EINVAL,
> >> +				    "number of CSI2 data lanes %u is not supported\n",
> >> +				    bus_cfg.bus.mipi_csi2.num_data_lanes);
> >> +		goto check_hwcfg_error;
> > 
> > You don't need this goto at the end.
> 
> Thank you for the review. I prefer to leave this goto in place even
> though this is the last error check so that if extra checks are added
> later on after this block the error handling is still correct.
> 
> But if you feel strongly about removing the goto I can remove it for
> v2 of this series.
> 
> Please let me know how you want to proceed with this.

I don't feel strongly about it, you can leave the goto but I would
prefer to replace check_hwcfg_error by check_hwcfg_done if we need it
when the function succeeds (we realistically expect the function to
succeed more than fail)

Again, this is really not that important, I am fine with whatever you
send in the v2

--
Kind Regards
Mehdi Djait

