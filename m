Return-Path: <linux-media+bounces-11786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 306DF8CCFA1
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF6CC284034
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4811313D51A;
	Thu, 23 May 2024 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYyGTyh1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950A913CFA3
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457738; cv=none; b=tWzGx6iZ+fvxqWLRQB+SN3AuCdF5rngY/BCWtQ/pudCSN9kJe0jldXzlv5zq2+44I0gy3cDRf3BqU0uFFveQkvh5vUIY7pGEzPT56TLVYtFtpxcI/Ztncikx9UqfYdrCCMpq1NbGwftyIhI0qIH9XENw6hrIKtlHCrINlQFA+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457738; c=relaxed/simple;
	bh=Tx3GGZO5Pt+tosbRIIyC7OGFGGVeTTH+sK1SCvO4CLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWmSenVggufl+cjw2x2Pi9IBXcQ7WPXKe9/AuSl5mH8Oa3Lefc31meBzDoNmVDnqS+dlG87byewSIzsv+M4Lqcs8FSS8WrvM6GuxgIm/GRrIdeLM6rMA3pMxw2KtfvCALAIzqrnVqBRlx3xYCzTAyVf+5HAEogxFvjvqEh/qTE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYyGTyh1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716457737; x=1747993737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tx3GGZO5Pt+tosbRIIyC7OGFGGVeTTH+sK1SCvO4CLU=;
  b=lYyGTyh1OGzLIsUVcvF1S/GPx4xKDXl6bygAUiXT3uKvzGPBZea6OFFd
   P2ZOsicRp9QtMogxWPeZIom459mzefenW3qisCfwAGBl/mY1GAEfduPEV
   gkXOQOt7KvPioCkChCngofEpPsL1UzHcosWYBOe8NqliYHN6LD/gOJcTQ
   JARazl5IrZF3v6UtgH0VcXWSE2rmJ7z4RW8McYGJZCZfbOMSKA5OEVCGg
   Tr+ngpyep7/lAzSw2V7mSTu/cLpgQhko8fAkcrdPTfVlQcU/lpFxFgllx
   4cu+tYIt7bqIuEkipX8N0RLYg6qwxKi0e5C/p6yr5iFGBv23hMlK03tE+
   A==;
X-CSE-ConnectionGUID: 3tteZ9IVTmGaQh35XN4V+g==
X-CSE-MsgGUID: BzPCUfC7QMWX8KA+FOTFnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16600529"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="16600529"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 02:48:56 -0700
X-CSE-ConnectionGUID: XghauwU3SBm0sdF5F2IvEQ==
X-CSE-MsgGUID: +xik+6hISuuomrpqM0Jc6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="33453517"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 02:48:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7599511F82A;
	Thu, 23 May 2024 12:48:51 +0300 (EEST)
Date: Thu, 23 May 2024 09:48:51 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: Kconfig: Select MEDIA_CONTROLLER for
 VIDEO_V4L2_SUBDEV_API
Message-ID: <Zk8RA5lMFNftBXiO@kekkonen.localdomain>
References: <20240304185125.33713-1-sakari.ailus@linux.intel.com>
 <20240304225907.GA12503@pendragon.ideasonboard.com>
 <ZebAp9eOS4Awsfwp@kekkonen.localdomain>
 <20240523085356.GA18446@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523085356.GA18446@pendragon.ideasonboard.com>

On Thu, May 23, 2024 at 11:53:56AM +0300, Laurent Pinchart wrote:
> On Tue, Mar 05, 2024 at 06:50:15AM +0000, Sakari Ailus wrote:
> > On Tue, Mar 05, 2024 at 12:59:07AM +0200, Laurent Pinchart wrote:
> > > On Mon, Mar 04, 2024 at 08:51:25PM +0200, Sakari Ailus wrote:
> > > > MEDIA_CONTROLLER has no dependencies and VIDEO_V4L2_SUBDEV_API depends on
> > > > it. Select MEDIA_CONTROLLER instead of depending on it. This way Kconfig
> > > > options elsewhere do only need to select VIDEO_V4L2_SUBDEV_API, not both.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > > Mostly untested but seems reasonable. MEDIA_CONTROLLER has no dependencies
> > > > anymore.
> > > 
> > > It seems reasonable to me too, but I think it would make sense to drop
> > > in the same patch the manual selection of MEDIA_CONTROLLER for the
> > > Kconfig symbols that already select VIDEO_V4L2_SUBDEV_API.
> > 
> > This should be done, yes, but I'd add a separate patch for it: this one
> > doesn't require changes elsewhere as such, just enables making them. Same
> > for the other, few users that depend on MEDIA_CONTROLLER, they need to be
> > converted, too.
> 
> I'm OK with a separate patch, but can you send one ? :-)

Yes, a bit later on. This is worth merging without such a change as
also new drivers will need to select both options.

-- 
Sakari Ailus

