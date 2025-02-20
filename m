Return-Path: <linux-media+bounces-26489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA05A3DE72
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DA3C19C449A
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747B11FCFF0;
	Thu, 20 Feb 2025 15:25:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2861FECA1;
	Thu, 20 Feb 2025 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065132; cv=none; b=HRFlv16KXcpc81cvhZ49CDA2OqRJu+ZmMkiMNunHlz7YzEKoguIznv6uOAJ2XmRS8HJlVpa4Sar+i/K7FwqofOjx/V9QRLeTX16ZBpCqHc0nYQ+NXDxBrb6BXJDXaqaTpRw7Jk0qKH94xfQq7qa0TEw6WrrnHq3flHk3aGk+MDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065132; c=relaxed/simple;
	bh=f2klmEUwgqFbY44FQoL/3EzI0jobsONaTotywytBXU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7tbnV31szSawIz+evn2hG6rdM/t8hKRl8jmF6qfx5LyiW94QYbA8J5smmgiBN+THtxJA5SLmUwmUBzCpNh52ewRP1cLW42J/lm7mJthndyhyFBuo/hHAvkKYI/quuokVgr8oHPePlAfS/1cbvJsRSiq4mnpbyjrJ47cQQMy9+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: H6m8dKYhRDqeG9eYJYOfhQ==
X-CSE-MsgGUID: LqwXZvIXTU+mmIO+QNNVNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40705300"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40705300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:25:30 -0800
X-CSE-ConnectionGUID: qmtVSK5cSNy+QcnRA6L5zQ==
X-CSE-MsgGUID: +upU1mqiQfig88j8PogIog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="145924174"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:25:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tl8QT-0000000DNH5-3Gm6;
	Thu, 20 Feb 2025 17:25:21 +0200
Date: Thu, 20 Feb 2025 17:25:21 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Message-ID: <Z7dJYemMR-mgZXG6@smile.fi.intel.com>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
 <20241203093114.0ca49c01@foz.lan>
 <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
 <Z7c252IKhXdysjAi@smile.fi.intel.com>
 <55389b80-9f0e-4423-8e92-c486de058720@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55389b80-9f0e-4423-8e92-c486de058720@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 04:12:38PM +0100, Hans Verkuil wrote:
> On 2/20/25 15:06, Andy Shevchenko wrote:
> > On Thu, Feb 20, 2025 at 02:55:42PM +0100, Hans Verkuil wrote:
> >> On 12/3/24 09:31, Mauro Carvalho Chehab wrote:

...

> >> ORing enums is really not a good idea: you would normally never do that, and
> > 
> > I think you missed a keyword "different", so "ORing different enums ..."
> > which I totally agree on, but the same enum values are fine.
> 
> While the compiler might be happy with that, I think ORing enums regardless
> is weird. It's not what enums are for.

I disagree. It's totally normal to have "mixed" enums where we have ranges of
sequential values mixed with bit flags. Cross-enum bit operations (and what
this patch is about) should be prohibited, indeed.

> >> the compiler warning is IMHO appropriate.

-- 
With Best Regards,
Andy Shevchenko



