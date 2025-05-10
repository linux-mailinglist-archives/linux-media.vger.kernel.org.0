Return-Path: <linux-media+bounces-32221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 921FDAB23DE
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 14:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00A931BA724F
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 12:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E20C25745F;
	Sat, 10 May 2025 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+0dELZy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294191EA65
	for <linux-media@vger.kernel.org>; Sat, 10 May 2025 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746881303; cv=none; b=VIzsMtgX86ljuncl2WiOBrR5b4cjwMuR7mztTR+Vt99fWIS+VL5R3xTJsss7M0tMcP9dSIr16NaEopMoYy0eocvXEbzsjzw9ZWKhldlnMXEfwHtaqZFyskzG0cLSVN204AK6dJCGESs/42yCItMGW8ncE3U4twRfeSap+8CYvNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746881303; c=relaxed/simple;
	bh=mNs3j4DiXDw0F/Qr0UNrfCNfd4654Nta3x6uMAyhb+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOKyxKOc9BHZVPRLvaFZYrUTz3zNtAVwM7dwBZsqi0xX+XrAu3SDmRKo0kR1oYcnNHSgem3RkC5mNKwqj+z6YsnKvK1abcb1CeB65LjAztlUmKM+VplvfBA0sdkWIcgVqG1ChI0nBkQvzC3IfMIyiK36xARBjlI3BTMZldKC26A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+0dELZy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746881301; x=1778417301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mNs3j4DiXDw0F/Qr0UNrfCNfd4654Nta3x6uMAyhb+A=;
  b=c+0dELZyU4S0+tYat9ExPiZ8/Zue6VGtCjFMwNq5y5avfhLa7vLjCQLE
   98pB5FsAqDyKIjjUfForXEP+HjuvQTfxRG24SWpdU1gyY6SeKAgdPvH0u
   h0LrYR9mVxOtY+6xE3IQgds4Oyohg5I5TUthzRuB9Ylz1hAv3lnzs5jkm
   wPB2y+DTyorB/EaP5eL5bX0iw5ikVh3KPiyacDKfN47A5Sb8nhRgDmFTO
   /Hk2449kCym3Azw1iI3vx01csrwLrM5WTGAPSppGvbVNWkigKE+1+J09e
   kyUPp/mCRVeuKxiVVCHRGOSSFmF2WFfhpsJIVyB4RWsQTzNlyp1DkYHDc
   A==;
X-CSE-ConnectionGUID: 2YB5auXkRnqIiKTd9nTY4A==
X-CSE-MsgGUID: 6cNgRvcxSFqWbiV1jtXyAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48610544"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48610544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 05:48:20 -0700
X-CSE-ConnectionGUID: n4QWKCZRRMSZmNCHMLvfGA==
X-CSE-MsgGUID: GLPvSwSBT3yI/X4m7ZnwtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="137365275"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 05:48:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 83822120228;
	Sat, 10 May 2025 15:48:17 +0300 (EEST)
Date: Sat, 10 May 2025 12:48:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 07/13] media: mt9m114: Update hblank and vblank defaults
 on pixel-array format changes
Message-ID: <aB9LEZjRdPBpjnKH@kekkonen.localdomain>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-8-hdegoede@redhat.com>
 <20250509223808.GH19001@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509223808.GH19001@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, May 10, 2025 at 12:38:08AM +0200, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Sun, May 04, 2025 at 12:13:28PM +0200, Hans de Goede wrote:
> > Update hblank and vblank defaults when the pixel-array format changes,
> > to maintain 30 fps on format changes.
> 
> I don't think this should be the kernel's responsibility to do so.
> Sakari, any opinion ?

Generally drivers don't do this indeed. It's the user space's resposibility
to configure the frame rate. Drivers only guarantee hardware limits are
respected.

-- 
Regards,

Sakari Ailus

