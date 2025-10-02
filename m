Return-Path: <linux-media+bounces-43586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B10B4BB33F8
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 10:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0541D467171
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 08:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924D82EA48F;
	Thu,  2 Oct 2025 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHvHi6Tf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F48E2E62D1;
	Thu,  2 Oct 2025 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759393032; cv=none; b=OnXlrUw/jG1Dv4LZXAjWgQG5D5xr1FuCygCOy+Wxb0yuLuVNbEGjZspLDhHKtwBX+7PZW4QdruXkKQjpoXjq0Z7lUH9O4LUFOJX8W18DACjL1V3T3/YZF39vXev+lm0Zy2D4AzUbcdMjnScDtiHsXuLW+d899i4XNRahw2LRvqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759393032; c=relaxed/simple;
	bh=qhPCv+hvtTaEhLSvWRtO8cEw6fW/dZWLWErQIn5N/xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeQ5WDdr+s/ZxTERLn5eAoyZYYHGz0JzW5VK7o3RQs0W6pV9Te8jQXla3069C6On7TxYqEDn1cM0pk8STDM1a4OgiZ597JlbkRYN84/PrBt2pbaAfn63KcCFjyHKR3wUrIF6pz1SLgUcKzZq8RR+mLW+47cFtaWhtxMdiFfS5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHvHi6Tf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759393030; x=1790929030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qhPCv+hvtTaEhLSvWRtO8cEw6fW/dZWLWErQIn5N/xI=;
  b=bHvHi6Tf6x/xkfHLwjuXJvMxI5kMnbD1oPi4oBtxQPGxng5MJuc8AsWk
   K3EtIDSVLomCinLwwiFsdP6DEif/5gUgC5DKTu3WgDv94CL7Qzp619hrp
   mXJo/01MjlQ4WBDetvbx0ZUgqSN2xiSqH6ZUMn+CEWOupKGYLDo3cGzUg
   l0VWa1Uj6aC5Wa+PYFOaKFKpOMU+X4O6q9fcZrf0UcwFk9rr7miTItBSl
   rWq//aTKHW/UplK76bGwS//usY7Vkle0Agdhgf4K2vIEzMZVSbuFr/Wef
   l8WkSaSCajNqjWJVNkySxHhMaVYYkRENr44hcrAWu6flRlpDx8C+F4N7I
   w==;
X-CSE-ConnectionGUID: vecdJEyBR8+IG0unCgVxRQ==
X-CSE-MsgGUID: ROiODXKeSXC5jFxFfy0O7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49230498"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="49230498"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 01:17:09 -0700
X-CSE-ConnectionGUID: 6YX8BcraQ+aqUY/Jr4ihHw==
X-CSE-MsgGUID: BdxfyJimRBuNrjmbXHg0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="178797283"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 01:17:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7333A121EC3;
	Thu, 02 Oct 2025 11:17:03 +0300 (EEST)
Date: Thu, 2 Oct 2025 11:17:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/8] media: Introduce V4L2 generic ISP support
Message-ID: <aN40_78P5TaUuglA@kekkonen.localdomain>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>

Hi Jacopo,

On Mon, Sep 15, 2025 at 07:18:09PM +0200, Jacopo Mondi wrote:
> Extensible parameters meta formats have been introduced in the Linux
> kernel v6.12 initially to support different revision of the RkISP1 ISP
> implemented in different SoC. In order to avoid breaking userspace
> everytime an ISP configuration block is added or modified in the uAPI
> these new formats, which are versionated and extensible by their
> definition have been introduced.
> 
> See for reference:
> e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
> 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
> 
> The Amlogic C3 ISP driver followed shortly, introducing an extensible
> format for the ISP configuration:
> 
> 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
> 
> with a very similar, if not identical, implementation of the routines to
> validate and handle the ISP configuration in the ISP driver in the
> c3-isp-params.c file.
> 
> fb2e135208f3 ("media: platform: Add C3 ISP driver")
> 
> With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
> a third user of extensible parameters is going to be itroduced in the
> kernel, duplicating again in the driver the procedure for validating and
> handling the ISP configuration blocks
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/
> 
> To avoid duplicating again the validation routines and common types
> definition, this series introduces v4l2-isp.c/.h for the kAPI
> and v4l2-isp.h for the uAPI and re-organize the RkISP1
> and Amlogic C3 drivers to use the common types and the helper validation
> routines.
> 
> The v4l2-isp abstraction will be augmented to support statistcs as well.
> 
> If the here proposed approach is accepted, I propose to rebase the Mali
> C55 driver on top of this series, to use the new common types and
> helpers.
> 
> I have been able to test this on RkISP1 but not on C3.

Thank you for working on this.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

