Return-Path: <linux-media+bounces-44763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72549BE5385
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 21:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DB434043DE
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 19:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1EE2D9EE1;
	Thu, 16 Oct 2025 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyb8JVmt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE12D97B0;
	Thu, 16 Oct 2025 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760642542; cv=none; b=XWrPow2q31mPAq5Ei7R0TA1erCbFYpwqYjmHKLBhfday0PCoJVO2Kn5UJW5Y0y+zd+pLI6IiYa+I5QfC5hCT2eHK+eXHeZmIoz1wrX5qVcnF3nocrXouXk16ImLWhnBuhzeaVI/UBTBnrDRZtOJvA/HkKBN+WQ4kwd3LwYRHiiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760642542; c=relaxed/simple;
	bh=70CHvEmZWEz+900ZJiNa3jXRD54PcFWARg2uD+iSNUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJtOZT/fFYYrqscrIOk4g6PkJGIwOAaWwnoKx9ONRc2u6wiBB9hsycAFLs1vlhH2WgHe77PWTH9No2rN1Hkc2eVAm9LJFqc7vIAkPJvCBXfHL68lqa1PrWt9zYqO3+Qc0m+PBvdOLPsMq+dyYJ2uii6bE6oFIkUAsd+dzEpYBhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyb8JVmt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760642540; x=1792178540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=70CHvEmZWEz+900ZJiNa3jXRD54PcFWARg2uD+iSNUs=;
  b=cyb8JVmt3NwaLYDvAzzimo0CrYhYUeWK2u6MRT4kPN50LWLjSB1u2qFz
   P7WdllRxJgUTqE+5JqCMUt34g/0teawQEl1KD2aJJG42USV4Y0zK/5//5
   +RHNszWMaeQtRPfuH4S3jg1tKrn3Xausxb8y2453XxI0QUQvXjqZxNfS9
   XtSVkb4IGBuayOZuNAi221oy6K3/LkZ+P7I8yt7WDVYfhA7eXJxKr8YDb
   h2+wZS1ZexTbLEJi8UphPhbxJq1EHa/xkVy8tLgmhHqdETOz7SVucf1om
   5kI9BIN6cIP8EpqQRMj/5b6YCaj81gIzvRCAugMm1yrOOV+YhqK9olOSM
   A==;
X-CSE-ConnectionGUID: qBNRNJYmSfm2iZEQQi8gOg==
X-CSE-MsgGUID: Qh5FJ4xnRc2fbNW1UUAF0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66714841"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66714841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 12:22:19 -0700
X-CSE-ConnectionGUID: bRDS3vRKR4SjOvpt8TyPXQ==
X-CSE-MsgGUID: 6oARni81RACAlb0elSOKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187816556"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 12:22:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 936D312023C;
	Thu, 16 Oct 2025 22:22:06 +0300 (EEST)
Date: Thu, 16 Oct 2025 22:22:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Daniel Scally <djrscally@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/32] media: Use %pe format specifier
Message-ID: <aPFF3n-e7pAUDH5x@kekkonen.localdomain>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>

Hi Ricardo,

On Mon, Oct 13, 2025 at 02:14:40PM +0000, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> The recently introduced test scripts/coccinelle/misc/ptr_err_to_pe.cocci
> checks that we use %pe. Let's make it happy.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks for the set.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

