Return-Path: <linux-media+bounces-45856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE856C162DD
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 097BE508462
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2506E34C9BF;
	Tue, 28 Oct 2025 17:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzEct97I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D134B34B185
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672591; cv=none; b=MRhwVKKaJYQoZErVU2rSnayovklpGE5W3kEqwYDCSftXFXsdx5g/BBTnbsPAJErkbwToT825Bp2L0qYOpkRcdFZ4/X3cBfR1RZVIsJhF1vByCTf5uiIwjmc6U3f/gFvk6s4KSjfwkIIScxLyghNSJiXkz92+f1iaKdqH+Y39n4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672591; c=relaxed/simple;
	bh=Ki6K6Ue01VYjUvqmtW9ztmKpjNFCmK4pMpHDvAKBEvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzjTaWSD5SpVlmy7oA7G1Ec8BM8n4RwMVoZTISseVAccKrqPZFcZKAINTcW0QIxvngkQ7j3oqRZ7g/WTWVxvXiMmCjxembQ/SREnwYbmzIUmnaZXiOZFpsgLjn81D2wGy69e6Uh91L5ILPk3aCKb3E/mXUx0w10zBLG32+Yzd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzEct97I; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761672586; x=1793208586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ki6K6Ue01VYjUvqmtW9ztmKpjNFCmK4pMpHDvAKBEvY=;
  b=QzEct97IlKWPLJctSXEi+NDEVqHl1zMBr51Ddw4D2W1cs20aiHENa7b5
   GZrzuTyLZr6Ho652uMMJrK4WODjvtlvCzhQ4SoaoOE8wRZI07P2kTr5E5
   N7aKRiIMBO//gNdZWIkfsAOKl20FQT50+UxiS+HMe68BkTzaOt2VeuEA7
   cfD5gBb4qbyhkj1+s180K5C7AypO+BJiQdHyiB+YsA8eCT/G4K9VPyvZ5
   wyx+MeaoE9mhRm1qlqX8sPDsNabnE0N8B35n12ty4mirjzQubHcI+BYLQ
   TDQu5QHYgxw8jzLSjSXV6qpdiHhJAzm8UTPL10i9lB0DNx5O8yUsJZLgM
   A==;
X-CSE-ConnectionGUID: T2JX+jEyT+CTA4vjl3JxMw==
X-CSE-MsgGUID: +YKkkRF4R+CQLOCvx8a63Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75228899"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="75228899"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:29:45 -0700
X-CSE-ConnectionGUID: pUHpOf8NRauzXSwI+OagrA==
X-CSE-MsgGUID: /J8GHK6qQC2ax8mBM1AZpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189767398"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:29:44 -0700
Date: Tue, 28 Oct 2025 18:29:36 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 11/25] media: i2c: ov01a10: Add ov01a10_check_hwcfg()
 function
Message-ID: <c7cp4mcuzoplibfj7jmtcvktbozzbw7qj3bd4kof56rplvjdye@tlpto2deyyeg>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-12-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-12-hansg@kernel.org>

Hi Hans,

Thank you for the patches!

On Tue, Oct 14, 2025 at 07:40:19PM +0200, Hans de Goede wrote:
> Add a function to check that the number of mipi-lanes and there frequency
> are what the driver expects.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

[..]

> +static int ov01a10_check_hwcfg(struct ov01a10 *ov01a10)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep, *fwnode = dev_fwnode(ov01a10->dev);
> +	unsigned long link_freq_bitmap;
> +	int ret;
> +
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
> +	 * wait for this.
> +	 */
> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> +	if (!ep)
> +		return dev_err_probe(ov01a10->dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return dev_err_probe(ov01a10->dev, ret, "parsing endpoint\n");
> +
> +	ret = v4l2_link_freq_to_bitmap(ov01a10->dev,
> +				       bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_freq_menu_items,
> +				       ARRAY_SIZE(link_freq_menu_items),
> +				       &link_freq_bitmap);
> +	if (ret)
> +		goto check_hwcfg_error;
> +
> +	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
> +	ov01a10->link_freq_index = ffs(link_freq_bitmap) - 1;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV01A10_DATA_LANES) {
> +		ret = dev_err_probe(ov01a10->dev, -EINVAL,
> +				    "number of CSI2 data lanes %u is not supported\n",
> +				    bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		goto check_hwcfg_error;

You don't need this goto at the end.

> +	}
> +
> +check_hwcfg_error:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +	return ret;
> +}

--
Kind Regards
Mehdi Djait

