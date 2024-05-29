Return-Path: <linux-media+bounces-12158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B38D395E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 16:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D56D21C21876
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 14:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234EE15921D;
	Wed, 29 May 2024 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BigCRDHv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1EB1591FD;
	Wed, 29 May 2024 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993261; cv=none; b=gGAFp+g0P6PAy9B5f2uzZsQ+e+5k81LGXgZaK8aauq3+2YJGx5nmZWNF0UJi1P6tLQYKQiyIc1U43rYRO4jQYnk/BdPb+YmXwdmL6lw5/0hRZ7w692wOfviVbd5enUpmexsa1178wtM/kmekCctqD/2CJS+Jql+nLuH+1f0XX7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993261; c=relaxed/simple;
	bh=JLKy8WDpu5HmtB8Z5d4WT7LLGA/yOmYqTdfiaadPM3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHsVa96R4GNs54F2knAHQpggOG/xD4wD2/BeJbwX/wVqPFgK5S3ZlsXyYgCwnOe1zgtCY15N4uEKOXeZuiibkaoFrAy54xkAbj5nMiTxyW3qRbVywvzZHR2KaO1m2t6ypYNk2O7jyn3Q1m8L1YC26ydOCEy29nZtulJ+aZanRo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BigCRDHv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716993260; x=1748529260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JLKy8WDpu5HmtB8Z5d4WT7LLGA/yOmYqTdfiaadPM3k=;
  b=BigCRDHvGxJLvFekcZGYubIBIhYDJGCOHXALwzwApLpNmg6/NOg7UaJn
   h8AMmQaJYGnL3xKsa5gJEcnoYPpZoz3NxY1R7LQHJT5HoUVrhmFWyBe/7
   lkrJ0sB6Q+th1NAQ75SCtfP9aT5dZDUzRror79kjCIwSb3yQozXje6HK5
   yhTEqKhh6lpmVedq+MP4CfzvZAkI662grez808sQ8wKupJvCGxWZXsluI
   lXDclJKDCRddheXeXFjsxH2e1tSZi72dwzYycf4N5fa8oLMCnETaYVU8H
   c8A2wvwx0fd7YnlWIb89sFvbu1JvXcxEzmpQWoj+lVQ4X0PD0VRiP+fPr
   Q==;
X-CSE-ConnectionGUID: WvD5LbVvTFCTbpyoQhpodQ==
X-CSE-MsgGUID: wSettSrzSGqSivlUE/5LKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17231098"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="17231098"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 07:34:20 -0700
X-CSE-ConnectionGUID: uRNd/7unTDGM4mSY9zG97g==
X-CSE-MsgGUID: bs+wwQN7Rmq9zWhhStL9gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35540140"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 07:34:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCKNV-0000000BpVS-2taG;
	Wed, 29 May 2024 17:34:09 +0300
Date: Wed, 29 May 2024 17:34:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
	dlatypov@google.com
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
Message-ID: <Zlc84Z7G1YIEbggN@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180933.1126116-1-devarsht@ti.com>
 <ZlTu_9orsuosNiGk@smile.fi.intel.com>
 <4a8cea8c-4575-bdd8-e8a8-634a2b267ff5@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a8cea8c-4575-bdd8-e8a8-634a2b267ff5@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 28, 2024 at 04:51:46PM +0530, Devarsh Thakkar wrote:
> On 28/05/24 02:07, Andy Shevchenko wrote:

[..]

> >> +#include <kunit/test.h>
> >> +#include <linux/gcd.h>
> >> +#include <linux/lcm.h>
> > 
> > + math.h (where abs()/DIV_ROUND_*()/etc come from?)
> > I believe I mentioned that.
> > 
> 
> I did compile and test this, so math.h was indirectly getting included via
> some other header file already included but I would not rely on that and
> include math.h separately as you suggested.

Please, follow the IWYU principle, what you are suggesting is a fragile
approach.

> >> +#include <linux/reciprocal_div.h>

-- 
With Best Regards,
Andy Shevchenko



