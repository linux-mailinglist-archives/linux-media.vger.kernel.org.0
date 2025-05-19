Return-Path: <linux-media+bounces-32767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85DABBC9C
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2FD017E0C9
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EEE275865;
	Mon, 19 May 2025 11:35:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3864627817E
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654537; cv=none; b=HIoaNiBojP0/zyvzt6Bavu1cEY8gc6o7weLnWJRM3kn68N5f3/RY5ZJUk5IveYFjeAn172j8kkJZZb2iiworz0h+EWd8shdiR0ZMweUz9AE3Eykf12iGJYleNe30vYzMz3oV/2BK0Mn7uXc/s0dR2JX9eV0hFQSqG5wzlr3XiWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654537; c=relaxed/simple;
	bh=gdBL+pCe+KLz4GWDNeuMWa0/KJbHObnxQlrRL58+4xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sExvQ2SrjdMUnd8xkaqy9cg9IN93LW25wYLf25WUhoPhApMYQvS3wVBBSiOqg098vujTTbJIBRwfXyraA1+EaFp2KycfTBNol0Q4yobNmcapoh//UH53Twqtl3ZYIVrk2LEIiVZUTuHv2dE7F6EQzrSko4qIo5tna1hG8ASSLws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: FZlF1rL8QKKdpSrI5TTcOQ==
X-CSE-MsgGUID: UR3Yoo/4RfGugD6fn3D4+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60203110"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60203110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:35:35 -0700
X-CSE-ConnectionGUID: YGRcFTJhTaKfw9fyeqk/2A==
X-CSE-MsgGUID: /YT9wB5uS+aNy9YWFeze8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139246714"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:35:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGymJ-000000031FL-1Dex;
	Mon, 19 May 2025 14:35:31 +0300
Date: Mon, 19 May 2025 14:35:31 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 11/23] media: atomisp: gc0310: Add check_hwcfg() function
Message-ID: <aCsXg_gj2VOoFPeO@smile.fi.intel.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-12-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-12-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 17, 2025 at 01:40:54PM +0200, Hans de Goede wrote:
> Add a check_hwcfg() function to check if the external clk-freq, CSI
> link-freq and lane-count match the driver's expectations.

...

> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY

Leave trailing comma, it might help in case we add anything later on.

> +	};

...

> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +				       &mclk);
> +	if (ret) {
> +		fwnode_handle_put(ep_fwnode);

Hmm... Can we switch driver to use __free() instead?

> +		return dev_err_probe(dev, ret,
> +				     "reading clock-frequency property\n");
> +	}

-- 
With Best Regards,
Andy Shevchenko



