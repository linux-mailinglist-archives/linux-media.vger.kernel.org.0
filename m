Return-Path: <linux-media+bounces-50444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7FFD12203
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 466AE302155E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EB1355049;
	Mon, 12 Jan 2026 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnzqKi52"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBAD355044
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215678; cv=none; b=iuKW5iOI7EQeeM96Yn/Wg2lftSUyMpbcta6/M1UinMhZrynqMwGpih0dmecUnzD6bQLuhVtvssCaKuAl4MBmJEcmSLBAeDKUVLmIA0rKLZnqFjjhpXw8Hi+u3cphPBVjGtAYrYvKalq9izLx+kFijwl9dAb/CmlzG51hysG9kME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215678; c=relaxed/simple;
	bh=dKj2Vb+p3ZH7jnAHhfDmpSu01T6Ydz6AqPRUGbeOFYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bO7XRh8qCwiAO94YOYPlTkHpl4xKSuIWXmTtvoTo86h2IPZzPajWIwqArUe3t9lwE4tlVZBWccHWTAW0CXbYAQknQKl6MMnMehXhLJTF4YNpfS+u9118hFKyc9hgKTShpoHLLkSG263E8TKStQRSFfqVxT9LVSPkoxnvxSAxy/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnzqKi52; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768215676; x=1799751676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dKj2Vb+p3ZH7jnAHhfDmpSu01T6Ydz6AqPRUGbeOFYc=;
  b=WnzqKi52SY9WgzWhehY/bSLoMz0qVKjVyQlBrFb4hHBmIj+6E7WyC7fA
   wgd2a5488snzX3mmYP27vkSvMLDWlN11RkNwkgJf5ThFWk/Y0HwHI0kBh
   GTo7qijC7LaQto7q+1NfPX9DCYKPnmX1vf9dfazyWGP6+OXLG2si26+xW
   pXuq7wPafb9so05AImA5TdFqCcSanlW4poG2x1Htdt6/Bg8r4vcMtonOv
   9dgH8uORlIm6ITP2J848+jvpWWUvwT6Eo6cYKYe+0Vd92DN1V6HUdVLJB
   Bk9ELvVU4n/ibqtSGkzApfziyr9B/u/RegpU/5kk2+4eQOrxfR7rm1Gpg
   g==;
X-CSE-ConnectionGUID: qYRQpu/VR1W5VpzNv08Osg==
X-CSE-MsgGUID: +xh1UqZXSYSz1W8kOo5PVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69471874"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69471874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:01:16 -0800
X-CSE-ConnectionGUID: /wOgPmCjS2i/Ddf/maTpdQ==
X-CSE-MsgGUID: 6fapza1OS5mc+wHNYX/V4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204080259"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.37])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:01:13 -0800
Date: Mon, 12 Jan 2026 13:01:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	Unix Antigravity <unix.antigravity@test.com>
Subject: Re: [PATCH 4/4] staging: atomisp: Replace ia_css_region with
 v4l2_rect
Message-ID: <aWTUd6C_dchJ1Xcu@smile.fi.intel.com>
References: <20260112102518.19926-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112102518.19926-1-karthikey3608@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 12, 2026 at 03:55:18PM +0530, Karthikey Kadati wrote:
> Replace custom struct ia_css_region with standard struct v4l2_rect
> 
> to align with V4L2 API.

Your series is split (no common thread in email), please be sure you supplied
`git format-patch --thread ...` when created the series for sending.

...

>  #include <type_support.h>
>  
>  #include "ia_css_frac.h"
> +#include <linux/videodev2.h>

Linux headers should go first before other (there are some more generic headers
like dt-bindings, but it's not the case here).

>  #include "isp/kernels/aa/aa_2/ia_css_aa2_types.h"
>  #include "isp/kernels/anr/anr_1.0/ia_css_anr_types.h"

-- 
With Best Regards,
Andy Shevchenko



