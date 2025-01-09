Return-Path: <linux-media+bounces-24488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB45A07086
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B690F7A14B3
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 09:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9995F2153E6;
	Thu,  9 Jan 2025 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDQE3LY2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263692153C6;
	Thu,  9 Jan 2025 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413191; cv=none; b=klY3fGvyJHnSE+xAe0vpTO4OKyIb49fNlJi+ON49nnlTdO4Sw6kszgdZuGWOSCIYyOTip8lwOWpgvHWUVFWttfKlgwN5TfkXlncZPrjZ2yyLWuwRpCIMCujhHd3jk5GbI/mBenYkV7Piq1U0kpvnyaZgT/eP3saXd5mQ2yf0QDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413191; c=relaxed/simple;
	bh=vMkW8Jd3t401cpda1zte72FNOnxUDrFrlUhboHmrjLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McwY775HJe63sLlOoL9S+Wn2fc5mYwqINgTIP7SU+vN4H+yVVGDD8AZpdKhYI5n8dD6iawxtpfYvAmSn0nNDsNvQYyAIG2D8kDirGn3aJYjhOGHrBXPI1MAujz9qfKf5Kq4Yf/5UJc9Je7I61N/ZqSpX6UrindFoQv+tcX/I1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDQE3LY2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736413189; x=1767949189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vMkW8Jd3t401cpda1zte72FNOnxUDrFrlUhboHmrjLs=;
  b=WDQE3LY2bGWOQSgiLL5iyghXB8x+t1rck2pbLrX8M8vOk0FGgkHgXw5U
   mEEdRRe1hCYx1ghByPFAgoHHPN9WeYsFJyTxcTmOq50kmVWDQaKXTHdz1
   dXbiQFE4Iude9kiOIGMTU8CaMv4EoiPEkIwDtmkM0olmUWULVsEu5gDBM
   vmGqgWObLIBz5QBGF4y0qZ1ddjT+Qy5LdB/+w5w8yPa/wDubrE2L2UC1p
   5xKKFlbSb0aSt7/ThQoPVlzD2HMVhRno9VL69Ko7JruiJtLWTqwCXzhWc
   rbPzTUK8Vde7l0MGOtTGgS+jTX3CdelXv0EkG+LLs4nR0VLlnuAnD8bSu
   g==;
X-CSE-ConnectionGUID: Gso2pBjfQRaAo3hZBWb9Kg==
X-CSE-MsgGUID: zSCeVKWvRSC9ZQk6Fg32/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47650686"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="47650686"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 00:59:48 -0800
X-CSE-ConnectionGUID: 02fT02SkSQ+9GcBrlDUNSw==
X-CSE-MsgGUID: iaXewZSySQmL7hqT2LeWtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140666372"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 00:59:47 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 39C3A1201CA;
	Thu,  9 Jan 2025 10:59:43 +0200 (EET)
Date: Thu, 9 Jan 2025 08:59:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v6 12/13] media: i2c: imx214: Fix clock handling on probe
 error or remove
Message-ID: <Z3-P__hmxn2uCd_t@kekkonen.localdomain>
References: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
 <20241220-imx214-v6-12-d90a185d82e5@apitzsch.eu>
 <Z35mt_ViYmrJLKZb@kekkonen.localdomain>
 <97f7de9efc16f01b29f98dc888329db33715275c.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97f7de9efc16f01b29f98dc888329db33715275c.camel@apitzsch.eu>

Hi André,

On Wed, Jan 08, 2025 at 10:46:51PM +0100, André Apitzsch wrote:
> Hi Sakari,
> 
> Am Mittwoch, dem 08.01.2025 um 11:51 +0000 schrieb Sakari Ailus:
> > Hi André,
> > 
> > Thanks for the update.
> > 
> > On Fri, Dec 20, 2024 at 02:26:11PM +0100, André Apitzsch via B4 Relay
> > wrote:
> > > From: André Apitzsch <git@apitzsch.eu>
> > > 
> > > The driver should disable or unprepare the clock on probe error and
> > > on
> > > removing the module.
> > > 
> > > Remove regulator_bulk_disable(), because it is called by
> > > imx214_power_off().
> > > 
> > > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > 
> > This and the next one appear to be bugfixes. I think it'd be
> > reasonable to backport them. Any idea where this got broken, for the
> > Fixes: tag?
> > The bug fixed by the last patch was probably introduced with the
> > driver?
> > 
> 
> I think both, the missing imx214_power_off() and the wrong link
> frequency where introduced with
> > 436190596241 ("media: imx214: Add imx214 camera sensor driver")
> 
> The first one could also be considered as a fix for the incomplete
> > 9bc92332cc3f ("media: imx214: Fix the error handling in imx214_probe()")

This one seems to have missed review. :-(

> 
> Shall I submit a new version with the Fixes: tag?

I checked the fix again and it seems the problem isn't as simple:
pm_runtime_idle() call leads to powering the device off. It needs to either
be resumed first or the call to imx214_power_off() be omitted.

I tried to find a good example but the few I found are buggy. :-( Getting
runtime PM right is just hard. I'll drop the last patch and post another to
address the problem (plus the intended example drivers) if you're fine with
that.

-- 
Kind regards,

Sakari Ailus

