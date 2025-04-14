Return-Path: <linux-media+bounces-30126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8440FA87BAF
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 853E5172E83
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA71625E821;
	Mon, 14 Apr 2025 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3oSydk7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500FF25DD0A;
	Mon, 14 Apr 2025 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622262; cv=none; b=buc9iMtoScfAAo+ccBEtIaxL3fJre2MtHPm40kIvc9dkKDRD0ptIeXcHxkA1x4pCEH89QeEU0J2oausKodwH2hqBybTtFQFUwX6DCP3wWtjyZNncSU2zfpNQo1N9n4wg7fRtct70y6M9W9fg5oYFZ+eOiy91NCxhSMjpP4nlL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622262; c=relaxed/simple;
	bh=FbKOtCMqZgcAKMzOa3aCVbOG2huZ2szHO6TumeZFplk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPGxj9RICO6wxCXT3p+7vLUpoW12ehMPP1b5N5B22ziBe2WVptJbsck7IRIW+JnRn7zmEBonfYJB1+xBAUWi0u4s2NkPlaj6VUxrpv6Y1YmNBJIu2Mjs0NfpWlq7uXaVbv96fkOZfw3JWzfMHOr4NQHzB7kpXUsVvDmoxJqL2EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3oSydk7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744622261; x=1776158261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FbKOtCMqZgcAKMzOa3aCVbOG2huZ2szHO6TumeZFplk=;
  b=R3oSydk7bP4JCf2gM+njAqQcbZVoMrZ0HjIX88nR5oLEfuJfw8Z65woy
   isYdnY+M9undMkHYvhXf27GEcq1LKXdAs0K0oYMg3ZmYQAmqq4qtCXJAl
   WYcqM5P9r9/Ro+RFqoG07Z5dHjy7eqvQuOHCoQ49ZmkCd5TB5Uy1JQfP/
   /ZieEgoYBKRs02tlolGpu0/g9dg7FCEMEV2GkPJZgr3mbSlbPMf5yT5wM
   0xF0mhfe5zSa2qfGsF/CrGDPcrf/laz6wTk8B/o+VVlib9uLcjZaCWQKK
   Y/OyEvHU8RheX/N2cgNyHXpALpVIejDicqBdELI4bfwP/dqTHLgr0iT/P
   g==;
X-CSE-ConnectionGUID: K0ePyiCtRQWpPZ/WdirOuw==
X-CSE-MsgGUID: CEqixe8qSKu/LZQ0l39X4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46216234"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="46216234"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:17:38 -0700
X-CSE-ConnectionGUID: ZpzJNJ+pSmuuXsIrJKj1NA==
X-CSE-MsgGUID: o3xVxsGWSF+AnWyAWEwlkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130744733"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:17:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CA0F111F871;
	Mon, 14 Apr 2025 12:17:31 +0300 (EEST)
Date: Mon, 14 Apr 2025 09:17:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: add exclude for dt-bindings to imx entry
Message-ID: <Z_zSqzwJS4gkneMy@kekkonen.localdomain>
References: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
 <20250410-maintainer-mriesch-v1-1-cdc5c6c68238@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-maintainer-mriesch-v1-1-cdc5c6c68238@collabora.com>

Hi Michael,

Thanks for the patch.

On Thu, Apr 10, 2025 at 09:41:30PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Since the IMX (as in i.MX, the NXP SoCs) MAINTAINERS entry claims
> everything that contains the name "imx", hanges to device tree
> bindings for any Sony IMX image sensor are likely to be sent to the
> maintainers listed therein. Add the missing exclude to fix that.
> 
> Fixes: da8b7f0fb02b ("MAINTAINERS: add all files matching "imx" and "mxs" to the IMX entry")
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..c87b26eada7b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2519,6 +2519,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
>  F:	arch/arm/boot/dts/nxp/imx/
>  F:	arch/arm/boot/dts/nxp/mxs/
>  F:	arch/arm64/boot/dts/freescale/
> +X:	Documentation/devicetree/bindings/media/i2c/
>  X:	arch/arm64/boot/dts/freescale/fsl-*
>  X:	arch/arm64/boot/dts/freescale/qoriq-*
>  X:	drivers/media/i2c/
> 

-- 
Regards,

Sakari Ailus

