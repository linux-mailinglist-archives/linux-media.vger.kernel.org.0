Return-Path: <linux-media+bounces-15417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CACC93EEAE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DB641C21B28
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 07:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEB212CD9B;
	Mon, 29 Jul 2024 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="He10aKQ4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C212C470;
	Mon, 29 Jul 2024 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722238894; cv=none; b=BB2MLyFr8GYvAqpGds3IQAa+2I5tlpuy/IkTxkfJBDaquzAmhK4246Qojd+VVKvFkEMY9H+ynM6Os3Tv2SOXFqw9Ec60SniAdWXGOtiFDGBR75Wx9WDro+m2bsPOnsKZJzCxBKwObPxXgsJpEuRurFKxyn2AyJVvanBaYEtDv0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722238894; c=relaxed/simple;
	bh=ZZXh6uiKaZbvG8XDUCvcp44wS70SIdDh62lEXLF5RqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilKpkOCr1VdRLrZtzuvG7wCsvxooqD/ERRo7FCRER3nkQtQ9FxumG7jcrlmcb6k8QuSHgOG/Jv0J85pMS+ZYxXnkG7pjJ8sYibo7ZckUEVqJjbq0Q9AX4mSmLrKTprF5H12dLQBpadF2odfLNRQVd/rzC1ZCKK/ihG28hNBo6zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=He10aKQ4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722238893; x=1753774893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZXh6uiKaZbvG8XDUCvcp44wS70SIdDh62lEXLF5RqU=;
  b=He10aKQ4SVHPScBfrZ+6B86Tkwu0vJ4bONPrIEhP7q6lbfqYYoQYJUi2
   YQCZxmV8pyuYZoIHfxG4jQEPhAUnW+iosAPSbLAEQPvf/iNQA+KA5hAIs
   SahSwj+ZNrMnk3nhxYXj5z/H8P0EyjLvXvU+C27ZguqgGPu9k8bopuJT3
   wGF6BHyty5fjZNg2UHfRbYDvc35vkr20edTzF7v0YxQZs7y3EuDISdrpA
   n/1Ynk4v5ZKX7VltVzSxQVeAnL1aopWJMxakXTEU3Vw5ycTiCTeMS/zoW
   8YQ3WA/q0m8cuslHihsMbDWlaxNsSOsOQyeZrKkVpqUslHvdHi514XSxp
   A==;
X-CSE-ConnectionGUID: YND/D1uNSCi6uRPna5rttA==
X-CSE-MsgGUID: qGsX+A8PRhagW2WMc/gqQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23727198"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="23727198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:41:32 -0700
X-CSE-ConnectionGUID: Cv0OBhCKQt6esj8vtx5tWw==
X-CSE-MsgGUID: OMXTC6uQQ7aAl2ee0nrSkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="58735056"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:41:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 54CCE11F8A8;
	Mon, 29 Jul 2024 10:41:27 +0300 (EEST)
Date: Mon, 29 Jul 2024 07:41:27 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	open list <linux-kernel@vger.kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH] media: imx335: Fix reset-gpio handling
Message-ID: <ZqdHpx7k6gzf-jSb@kekkonen.localdomain>
References: <20240729060535.3227-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729060535.3227-1-umang.jain@ideasonboard.com>

Hi Umang,

Thanks for the patch.

On Mon, Jul 29, 2024 at 11:35:35AM +0530, Umang Jain wrote:
> The imx335 reset-gpio is initialised with GPIO_OUT_LOW during probe.

Should it be initialised to high instead, to enable reset?

I think you should also add a Fixes: tag to this and Cc: stable.

> However, the reset-gpio logical value is set to 1 in during power-on
> and to 0 on power-off. This is incorrect as the reset line
> cannot be high during power-on and low during power-off.
> 
> Rectify the logical value of reset-gpio so that it is set to
> 0 during power-on and to 1 during power-off.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

-- 
Kind regards,

Sakari Ailus

