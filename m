Return-Path: <linux-media+bounces-6420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A410871B82
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 11:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E13C1F227B6
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 10:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1645DF0D;
	Tue,  5 Mar 2024 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfCw2ERd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207475D910
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709634163; cv=none; b=hv5NgvNZ+aY1oYBewOvabvSho2y+TBOdGCzaIEO6ClomgXdPdO9gp52ogKbap8P0AuivEXDxFu375uGoA5qEyzYlxUECzc9i9DnVVxaA2GXj8Twsrb4asMaf4qoUEC4KDrr5FSHOhHAoWCuxWdtNFfChpU+DbacyvBOsmwQgJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709634163; c=relaxed/simple;
	bh=8zHOFajhsCZnbGJgPndpN2XIHOF1gyGl6RFn4Uk313E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTvDEBHivzrAOL6XJ6G9cvhu4VQP3ui5w28Dt4sjh5/3Imo7eW8o5FwlE7I/j+2ATvv9+EZOcG8E0PX7XSjg4/mJq3r5vCjxBHH7MmfazEtF4yZrr6FCnfKOjUicJ67zn3KcPflOgQ4JZONzIiUZ2WB+gnAbIaI93idBZOqq4TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfCw2ERd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709634162; x=1741170162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8zHOFajhsCZnbGJgPndpN2XIHOF1gyGl6RFn4Uk313E=;
  b=HfCw2ERdZ5UeRqZ7ElxqJU43GW3RPRYshIjvR/u9vNte4zCmf/2uyKWT
   NGg1Xtd3a9p1RxGAFGR2ZNOBbwD8Hj5Ns0HbT0cT0CCZGhBGsC7Mpn66z
   SovSf5KX1nsM758IKlQElYb7m9JDWhP+iDw61X4kcs+qVB6ZmYQwqoabJ
   Ek86DFzfTRJPF9PEa26+1hOflleIRg9huKukO0xWHW2sRowt+zkAbhx9J
   3E4dQTmGjfCSoI/2K9cLvv26WNMg1nar8hSBNQAoHV8NtMabwTZiAGyzp
   fAdyb6y7ygEI3Q8MSj2D6yXkC18HJnF0zNIZkMusRQAhDG+uR/S9Gj90I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15582225"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="15582225"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 02:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9394025"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 02:22:40 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 413BA11F871;
	Tue,  5 Mar 2024 12:22:37 +0200 (EET)
Date: Tue, 5 Mar 2024 10:22:37 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 20/29] media: ipu3-cio2: Call v4l2_device_unregister()
 earlier
Message-ID: <ZebybXKOREkfDCz6@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-21-sakari.ailus@linux.intel.com>
 <20240207142435.GR23702@pendragon.ideasonboard.com>
 <ZebyQv0vWK9zw1U0@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZebyQv0vWK9zw1U0@kekkonen.localdomain>

On Tue, Mar 05, 2024 at 10:21:54AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Wed, Feb 07, 2024 at 04:24:35PM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Dec 20, 2023 at 12:37:04PM +0200, Sakari Ailus wrote:
> > > v4l2_device_unregister() unregisters V4L2 sub-device nodes among other
> > > things. Call it before releasing memory and other resources.
> > 
> > Please expand the commit message, it's not immediately clear why this is
> > needed and what the consequences are.
> 
> Thanks for the review.
> 
> There's actually a change in APIs here as the async notifier expects the
> V4L2 device to remain in place so the notifier can't be cleaned up before
> unregistering the V4L2 device. Further patches in the set move cleaning up
> the notifier to the release callback but I think it can well be done here,
> too. So I think this patch can be dropped.

That went a bit too fast. The call should be moved after the notifier
cleanup.

-- 
Sakari Ailus

