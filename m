Return-Path: <linux-media+bounces-20908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF19BCB0B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3581C213F9
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 10:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7561D318B;
	Tue,  5 Nov 2024 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIImtxyY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC431D27A9;
	Tue,  5 Nov 2024 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803994; cv=none; b=Ru32OAMWm9iTvMqLtKq/C3v5B5z20aHhoBVQZCWcZQUognnrPUNLc/VuqDU04iDUuxQSb3yUOheRRK5Us/LkfjLd29G0iHk8Fnu9xfppL2UVyblN9ptecAWPNPKnNGhHv6NZkWll1V0b3Bsidtqj8osVUk8qsBLvCdhHdnvAMvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803994; c=relaxed/simple;
	bh=KVvcpQ5F/M9q98s+qccoETOvBMw6mTVjp58jf47uN90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tb3k17paG9LUbVo1HHnwiLhX5NOboCPRpzLFntik/rf8ztxNL3SZ2i8nmPN4h2rWWOUJxCgdOVK5glhX1MMXJ5vtpPWUoP7nBehC04VgEC7mZ2BOALPJwUyVaAXV31QVSLlFDv3QTFKtbFpx2ZLkjB/nLPj3Tdy50Cpo7ssUxm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIImtxyY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730803992; x=1762339992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KVvcpQ5F/M9q98s+qccoETOvBMw6mTVjp58jf47uN90=;
  b=oIImtxyY7kNz+Cxq9MUThZhvLf5MZkkNQ9dhH6ZwiNRKEKoHOoc7FvmC
   HWgy1pcY9oNhP8KJZstnhboNtKGzYe2nFSP0p9xn58+1y65Of+ICy7cII
   gUV7qZbWQGDP4/5lcnFkeIs7KWz0iWx0cCVx4JBvzdO3vhS0y3nKTAMR8
   LP2vvKT9A/sZfqHxzPPqyFjJLIOxuCZ6hbS6SR3HXE0c2sc2IVxgMYbfb
   1SU6oo/EGAbbldI2/pdoqSzQczN7/hJ1RWkcT14ZYheIzpp2u3ozTCcjG
   vRSFBg/Vv8mJ3PrKm1AugxrmIrpyitN+Es5FhzSmfCUoU/9KOHZDD59vY
   A==;
X-CSE-ConnectionGUID: i69TXIUaQeiqJaM7+uxH8w==
X-CSE-MsgGUID: hfiu+kncThKSbDOYsleW6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30653521"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30653521"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 02:53:11 -0800
X-CSE-ConnectionGUID: h4i639knRvOKyDrJl0aW8w==
X-CSE-MsgGUID: dV0VB4bERsKTIxQsQJPO6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88741763"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 02:53:02 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F131411F9C3;
	Tue,  5 Nov 2024 12:52:58 +0200 (EET)
Date: Tue, 5 Nov 2024 10:52:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
	geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
	nfraprado@collabora.com, thierry.reding@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org,
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 04/13] media: uapi: Add
 MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
Message-ID: <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-5-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-5-victor.liu@nxp.com>

Hi Ying,

On Mon, Oct 28, 2024 at 10:37:31AM +0800, Liu Ying wrote:
> Add two media bus formats that identify 30-bit RGB pixels transmitted
> by a LVDS link with five differential data pairs, serialized into 7
> time slots, using standard SPWG/VESA or JEIDA data mapping.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

It's fine to merge this via another tree, too.

-- 
Regards,

Sakari Ailus

