Return-Path: <linux-media+bounces-45710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6EC10726
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 20:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7032B35125C
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 19:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3621331CA7E;
	Mon, 27 Oct 2025 19:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYkeYUX7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B8232143E;
	Mon, 27 Oct 2025 19:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761591670; cv=none; b=oVgYl7A12sbYAwWFx+aw9/rtkskBk0GIieDYPq+PcRu1gKTbcHn967gw5APDrpIDadYOzIOZ+57FZhb8Fx81xkO8zC5ns+gioA7HZCkqxPCx/VBDh28W49B6obpOVCFoyuwY1JINj8GRP1m9QsWiwk+ZReg4LggE+oMm0LUFtQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761591670; c=relaxed/simple;
	bh=W8tRJW7Y08+nrr9+hqJwGnhZizNTCdlWTgFHrtRsqBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXPEfNULJj/kczyiOszqhcRGCuobLQ1LRgxpnkltDBzisXCXZaOzr9Ea5ZyLSBRiPUhaX1LasSGYiw2HDA+WDZZlYjp7hCr2ZVsbHFA4kmRjUfFHQBX48bVGtK+qB+VIBOwslqnBaEkbOIDWFmdUiwAMj6wK9EBVDtSql0KxU8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYkeYUX7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761591669; x=1793127669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8tRJW7Y08+nrr9+hqJwGnhZizNTCdlWTgFHrtRsqBo=;
  b=SYkeYUX7yH9Ay4zZtN3/ssVaS9+cZXSrkT8pc4UXnTpnLWdxTRAQHdSP
   ALXYcNCziIlai4obHLnh5iyd/0KGo2XAK3iKek6D0GHKSRkukWjFf2YZF
   Vnf2q81Xke3xAB2j5b3+S60ypzLQeGctz5lfUiW0azA/EpMFzmMqyTUeB
   7Vz5Ohsu/TsadBmBdt+6KEdv1mQQ5TU63Jx1PMhXhJT1ZB1zciG1jvH8b
   WKpe1UCGhtw4LSWM4SoUI/pHDNopKCtDkLTZkOlQ7tRrNI3v7Nl5LDZ5J
   ACNtCbMV/VBLvGBpBRuLmXhQUTjXM6fXRaQjWFI9e47ZxP0kDxAcbjVRq
   A==;
X-CSE-ConnectionGUID: bHfzobMKSRG7hnVfIZTIeQ==
X-CSE-MsgGUID: C3UxeyUBQCWf2tMpsZc/Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51258067"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="51258067"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 12:01:08 -0700
X-CSE-ConnectionGUID: sTlBnKt3Q+C4ZHB02Vn4ZQ==
X-CSE-MsgGUID: lqxwmLrXRuaeW1Lti7U+Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="184303720"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.83])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 12:01:06 -0700
Date: Mon, 27 Oct 2025 20:00:59 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 01/25] media: i2c: ov01a10: Fix the horizontal flip
 control
Message-ID: <7nljndz2vpx544v3oasrxdyrxahvfnjyij726qmly44yplq34v@wqrtenp3dgu6>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-2-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-2-hansg@kernel.org>

Hello Hans,

Thank you for the patches.

On Tue, Oct 14, 2025 at 07:40:09PM +0200, Hans de Goede wrote:
> During sensor calibration I noticed that with the hflip control set
> to false/disabled the image was mirrored.
> 
> So it seems that the horizontal flip control is inverted and needs to
> be set to 1 to not flip (just like the similar problem recently fixed
> on the ov08x40 sensor).
> 
> Invert the hflip control to fix the sensor mirroring by default.
> 
> As the comment above the newly added OV01A10_MEDIA_BUS_FMT define explains
> the control being inverted also means that the native Bayer-order of
> the sensor actually is GBRG not BGGR, but so as to not break userspace
> the Bayer-order is kept at BGGR.
> 
> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
> Cc: stable@vger.kernel.org

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Hans de Goede <hansg@kernel.org>

