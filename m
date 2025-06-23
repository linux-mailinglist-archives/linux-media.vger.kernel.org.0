Return-Path: <linux-media+bounces-35623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B01AE3E77
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABBBF161E25
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E862376F7;
	Mon, 23 Jun 2025 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhdKGc1w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E32253FE;
	Mon, 23 Jun 2025 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679250; cv=none; b=BroluRUbpUrWW/k1VljQT9f9z10TuGxkfuyJmYby+uDpKYPf39sSO0VY3vft2I/wamaJio07yRElrTeeE5sL54g6CxSy/6bW5LCWCmZ/RMLbrjgM40VTzGU85PD1XWGVoZ9VWtCc4b8zcbYY/9mvmF3xNjn+qN204/Losb6CkTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679250; c=relaxed/simple;
	bh=41O4gNiNxKPz02OsVRMHdiJHhSwTSQ4o5ElTBRS0TlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r29OGkk9j/H5W5WgsdBv/Iw2G+4al8BK25FbhcIuKTQUj5RYUwCrtfyBgk1z5GkMLJBwyTWjdvOPUE+jxnv7KAvVr8IV6qwq6oTi+zDOMvehgYQwxPUg1eRVPZcj/sZKttLdUalDMNiIuXo5pt0rdZfDngrPl4hd6tXdrqxxwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhdKGc1w; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750679249; x=1782215249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=41O4gNiNxKPz02OsVRMHdiJHhSwTSQ4o5ElTBRS0TlQ=;
  b=BhdKGc1wr0kTfSCn2+LTehIGZe2t5o/8/MJeOqjxy1LsXsmDYL/NxQ/A
   FW2Yf7kxOU2GZLGPV8LSvBHShmMnbxTy2fH7tswvvoi6Iq0ax+7BtVZlb
   jNVHIU7YyZsgwMKw9iZY4NScL6KJWgnj8HoilQXqPAb674vMXs7fQLPSu
   KvMC5Wihmz0ea5XwlC8KpCllcE+i/jEgRPYVg8kvGZCf2fvykRdUAIR/h
   GnX5ix/f730qGBJwvKxWLFTLWUhqXWKLpPu2QspGNyhuOU2hoEtAH9Gul
   6gtbbEh3TPH38IXFQc4ZQU/4r3cEmy+E8xkXEJ6USqo8RpKGKg5u1jCSd
   Q==;
X-CSE-ConnectionGUID: Dq4ZlmikT0a1hQhcz784Pg==
X-CSE-MsgGUID: +cdSVZxNSLaYAu7muDeH7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52970574"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52970574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 04:47:28 -0700
X-CSE-ConnectionGUID: NNEkgUUISDCPawusqMEQ7w==
X-CSE-MsgGUID: JPibauSsRrWbNV/Oed5Qzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151351292"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 04:47:24 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0DCED1201F7;
	Mon, 23 Jun 2025 14:47:21 +0300 (EEST)
Date: Mon, 23 Jun 2025 11:47:21 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v4 0/5] media: i2c: imx214: Add support for more
 clock frequencies
Message-ID: <aFk-yTSOqzmEW1sz@kekkonen.localdomain>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
 <aFj5QnPBO0We5SBQ@kekkonen.localdomain>
 <46a681a84a7493e2d0a6d3a4eedb6c86ccd9903f.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46a681a84a7493e2d0a6d3a4eedb6c86ccd9903f.camel@apitzsch.eu>

Hi André,

On Mon, Jun 23, 2025 at 01:34:03PM +0200, André Apitzsch wrote:
> Hi Sakari,
> 
> Am Montag, dem 23.06.2025 um 06:50 +0000 schrieb Sakari Ailus:
> > Hi André,
> > 
> > On Sat, Jun 21, 2025 at 11:37:24AM +0200, André Apitzsch via B4 Relay
> > wrote:
> > > The imx214 driver currently supports only a 24 MHz external clock.
> > > But
> > > there are devices, like Qualcomm-MSM8916-based phones, which cannot
> > > provide this frequency. To make the sensor usable by those devices,
> > > add
> > > support for additional clock frequencies.
> > > 
> > > This series supersedes
> > > https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu/
> > 
> > Is there a difference in this set from the v4 you posted previously?
> 
> There is no difference to the v4 posted previously. This is a resend
> because there was no activity in the original v4.

It's not useful to resend patches, especially those that already have been
merged somewhere. Please ping people instead.

-- 
Regards,

Sakari Ailus

