Return-Path: <linux-media+bounces-37776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D4BB0590E
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96D5B189DC76
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397172D94A9;
	Tue, 15 Jul 2025 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxY306Af"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD2F34545
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579897; cv=none; b=PdhJANraF6hIGrLONKt7+hDlwbRadlL6fSDHyDC7rrPEFXEIBY7JXc1IBhQYuV02MDAKoxC+OI5nNHgv1AU8WSZN+TmElbZOLCQUbVNug40Ds5NY3uZRpxTMZfRcr35gdFd+Z6J/Bop91LEulVUiw2aDC7ea16cFpCM0A1uAQj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579897; c=relaxed/simple;
	bh=Po8OKh4VFPQjfKpp8TMyfrBDx/vmM7yDG59SZAvKtKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbo7FUEXK0uydp4FAGBHvp4Ok+5QrxY921YsDsI3OpPJGiyi8+8OCxPhn8YZ20fSWMgyqM05jqqh0A6dqwKT1RtSZcs0S4dWk3WEsv/bE0XNTTowrJAGM8Uvx2j6sZKBgVt3y+jRzw2d4dL+Y4uT6cdyeJoa1B4eX2e5Dw5FMeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxY306Af; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752579896; x=1784115896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Po8OKh4VFPQjfKpp8TMyfrBDx/vmM7yDG59SZAvKtKo=;
  b=UxY306Af+USIjkZFxvnf/CCcwNZKattLpiJcNc4kT7kQhPKompBXk8He
   KZlTp8a9qyB5jqKSQbDYO3y4n5XtQMvftYTrUxqEM6lMHMQYPA3vmCDQL
   zbgUzcM2wJ+tGFSvUh7RUDrSowUwO6pGFCLM6vDXxYIsWJnUc6g7Ffbv+
   zPfHOziUmoXeUn4VG+wCIZXeom3RNOA9IrqVQsAYa5uKJdqhf3gdf4Qwc
   qAHoKciizvtcH365z6BBw5BShaSW4lmJkENx1WYl/C5fF1hCb7esYOHNE
   bUj6r2+fSxvdLvr0rslY3jkY/1WpUNwBsnE/ekXnRkp0/q+SK/0lBZAxP
   g==;
X-CSE-ConnectionGUID: MzVKZgT3QimrzPnO/XR3uw==
X-CSE-MsgGUID: TQMKbwcwQE2cnxWfzW3N/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58603793"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="58603793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 04:44:55 -0700
X-CSE-ConnectionGUID: wKGoZWxySxeWRB9lcJUmSw==
X-CSE-MsgGUID: xNSYWtc5TseaB6RDkBsFIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157555294"
Received: from ettammin-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.19])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 04:44:54 -0700
Date: Tue, 15 Jul 2025 13:44:47 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 31/72] media: i2c: og01a1b: Use V4L2 sensor clock helper
Message-ID: <u22wgu2f3cgtcglkew5puby74u4v5lcljp5up4odas6dq7fvdd@yb3esynjm5kh>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-32-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710174808.5361-32-laurent.pinchart@ideasonboard.com>

Hi Laurent,

Thank you for the patch!

On Thu, Jul 10, 2025 at 08:47:27PM +0300, Laurent Pinchart wrote:

[..]

> -	og01a1b->xvclk = devm_clk_get_optional(og01a1b->dev, NULL);
> +	og01a1b->xvclk = devm_v4l2_sensor_clk_get(og01a1b->dev, NULL);
>  	if (IS_ERR(og01a1b->xvclk)) {
>  		ret = PTR_ERR(og01a1b->xvclk);
>  		dev_err(og01a1b->dev, "failed to get xvclk clock: %d\n", ret);
>  		return ret;
>  	}

while at it, you can change this driver to
  	return dev_err_probe(og01a1b->dev, PTR_ERR(og01a1b->xvclk),
			     "failed to get xvclk clock\n");

the only driver that remains weird when handling an err in this series is:
drivers/media/i2c/s5k5baf.c

Feel free to change it or leave it as is.

>  
> +	freq = clk_get_rate(og01a1b->xvclk);
> +	if (freq != OG01A1B_MCLK)
> +		return dev_err_probe(og01a1b->dev, -EINVAL,
> +				     "external clock %lu is not supported",
> +				     freq);
> +

--
Kind Regards
Mehdi Djait

