Return-Path: <linux-media+bounces-41816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A81B4530B
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 166931CC1B16
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE750280309;
	Fri,  5 Sep 2025 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eki9L1ZR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C91F4168
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757064033; cv=none; b=gn7a+d7iIfZHqWol7Hw+1X0K4IfGeghvHqMXl/PSrNFPqZc3/n7saYYAaySCLUdn5Lftwx5rOsBUUElja+zR+Q1jpp6qlTgXlLes9qw3/7oaPEAdpU/RXYjGZbpaEci5u3ug1lYecwGFv1rYXl4Er9ugJ8cUBrrV6mZrYpEQHDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757064033; c=relaxed/simple;
	bh=USkjD5EE8GN0PwCJ2DBWcgsX8K/8Wug28l4Pll5wfa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVuqWdpQtYPHEHChcSIgOpg5e3KSyEtHfK50iRVjmEZb2wQF9dUuEd3sthG056yMx6DPEY1pHbdw1kEqsO1RRDRGySRf2H74aDQkj9j6SuyPdL81ah2DC22LCayyosOqiuI+UxP7RAmCNQ+1ESz7T1D5YoyM2FQyRVlZkrrWHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eki9L1ZR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757064031; x=1788600031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USkjD5EE8GN0PwCJ2DBWcgsX8K/8Wug28l4Pll5wfa0=;
  b=Eki9L1ZRgc3WHZy+TW1s8oVSOFOok5gdrYJu2nH5HE5BlUApgjaSLh8w
   smR6VrwBWTUqoNizLWLt4Us9K3KvPDx84zn19sDvuOG1ERAwU11oirSZC
   WbmskIjaxJAZwPIFT/YhUp7pccUh+30TCkWUOsZTb4bSklzAmO9kbRBwI
   k+E1/+VjXnIUtNzIBHoLI56lRyLnJNONe58AmHwwKp0J/SkpI6Rj0dZNK
   D3DJWgzNorT+O7VDVwqTlPnZHAoq40fNPQ47tTjQaswsmJ2ArmXPaPAqS
   XSZDsWmOSdUS2KKYxSgnXEBCclqLydhbrc13vrNqvm6wb6ipZNGxUq8zU
   g==;
X-CSE-ConnectionGUID: vTCOzgLSQ4eLlYyOH/e/HA==
X-CSE-MsgGUID: lAkYtc0xT96RUqMAEdBQ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76868754"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="76868754"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 02:20:31 -0700
X-CSE-ConnectionGUID: 3UzUImwZSHe4daB4TKxy/A==
X-CSE-MsgGUID: DNP0xlSzTay76OXRv/8pcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="172473861"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.241])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 02:20:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D466C121F43;
	Fri, 05 Sep 2025 12:20:26 +0300 (EEST)
Date: Fri, 5 Sep 2025 12:20:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v2 10/72] media: i2c: hi556: Replace client->dev usage
Message-ID: <aLqrWr5RwNKucDvq@kekkonen.localdomain>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-11-laurent.pinchart@ideasonboard.com>
 <aLqifDc9FqUh_oiC@kekkonen.localdomain>
 <20250905084622.GA6549@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905084622.GA6549@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Sep 05, 2025 at 10:46:22AM +0200, Laurent Pinchart wrote:
> On Fri, Sep 05, 2025 at 11:42:36AM +0300, Sakari Ailus wrote:
> > On Wed, Aug 13, 2025 at 12:45:18AM +0300, Laurent Pinchart wrote:
> > > The driver needs to access the struct device in many places, and
> > > retrieves it from the i2c_client itself retrieved with
> > > v4l2_get_subdevdata(). Store it as a pointer in struct hi556 and access
> > > it from there instead, to simplify the driver.
> > > 
> > > While at it, fix a mistake in the sort order of include statements.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Avoiding v4l2_get_subdevdata is a big plus. But instead of adding the dev
> > field to every driver's context struct, could you use the dev field that
> > exists in struct v4l2_subdev already?
> 
> I'd rather not. I think it's much clearer to have a dev pointer in the
> driver structure, initialized right after allocation. The structure is
> available everywhere, this makes lines shorter, and functions called
> from probe won't need to wonder if the subdev has been initialized
> already or not, and get the dev pointer from somewhere else in the
> latter case.

That's something extra you need to initialise, besides the sub-device which
tends to be initialised as one of the first things in the probe function --
usually right after allocating memory for the context struct.

So I see no reason why you should add a new field for this. In fact, we've
rather gotten rid of just this kind of fields that cache data easily
available elsewhere over the past years, there used to be more of them in
many drivers.

-- 
Kind regards,

Sakari Ailus

