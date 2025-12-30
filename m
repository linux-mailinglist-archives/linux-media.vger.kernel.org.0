Return-Path: <linux-media+bounces-49715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25FCE9A8B
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 136FC301C3EA
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 12:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681E329BDBF;
	Tue, 30 Dec 2025 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHHh6EmQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F13D76
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097936; cv=none; b=V21RnwAXSw00mROP/D51M8RciqrU/QO7xWMwzJhYGFRQiQoj/16ly08JZX3cupzxLiRFpC7IuJ7oyvgEBt+gYykBbN7hLT86VtU6ArkBj+z18wLFJV4O0NFlU/uNoWxOI8Cm3xq5/5cqCyGXbD5yvhkUVfBEmkEvSL07BV84gHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097936; c=relaxed/simple;
	bh=vactUywTsWJqfZgWQc6O0OyATlazw4FQgzz66xTVt9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixdSwu8lkGyeVlEG9mSc1wA+HpfGd4+gsqqwH8DAs1FwW6uZdhcOZy+wItk4aO/Qjfz2EhNjwkH9C52L2W+c8KzebSTEK8LIkPMZEHIxTfgcn1PmEVsGTmPVeBJbrITFCngQ8HT1scGo6gHt9atxTSHtykNHjjhV8IP17OU7ujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHHh6EmQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767097935; x=1798633935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vactUywTsWJqfZgWQc6O0OyATlazw4FQgzz66xTVt9c=;
  b=dHHh6EmQQKZDPx6S5s38Zn3qdPMQnwqVe4i7toQ7i74wMdIrc5OwdsPH
   JqHSayGudxCegoQLnyxg+CVgid4HgkG4jTouEndgBEBZqRFQK13vKIHpt
   3vUupl9+X4UF4J2nb9d8KDQUFhjABrgAaak4FxIn0tJVPIrFrZT8J3AB+
   bnScZW1MOGPn2YPGUvzcksoz+zT1yqGAB9wmDmuxDI6akGSucavudPqeu
   4Weg/tB88EM4ZrbMvOMjjFUGEJksMM1DMY4Pmwo3hxWNQm3i3R6ihewwV
   /TF7cmLF9wr3F6DvLNSeJ7UbVRNHJS5tkZfvGJhHGZ2WPD7ViJzIV6Y/0
   Q==;
X-CSE-ConnectionGUID: q8zqfAL9SkuTlfZ6C6Te3Q==
X-CSE-MsgGUID: 7AOZrZU+RoiZtFxM9PLGIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79318789"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79318789"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:32:14 -0800
X-CSE-ConnectionGUID: 1kvlJW2GScySS91iMkzgxw==
X-CSE-MsgGUID: 6f8bEUN7Qv20THoj9ZbymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201211396"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:32:13 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D73E911F8E7;
	Tue, 30 Dec 2025 14:32:20 +0200 (EET)
Date: Tue, 30 Dec 2025 14:32:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH 07/13] media: ipu6: Close firmware streams on streaming
 enable failure
Message-ID: <aVPGVNFnYFtYmUa4@kekkonen.localdomain>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
 <20251219095829.2830843-8-sakari.ailus@linux.intel.com>
 <3xhbxe6luzjcs73qg67mpbkxidphjmpi4unhsnsf4zex5e3gl6@xlkh765yubmj>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3xhbxe6luzjcs73qg67mpbkxidphjmpi4unhsnsf4zex5e3gl6@xlkh765yubmj>

Hi Mehdi,

On Tue, Dec 23, 2025 at 02:38:48PM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> Thank you for the patch!
> 
> On Fri, Dec 19, 2025 at 11:58:23AM +0200, Sakari Ailus wrote:
> > When enabling streaming fails, the stream is stopped in firmware but not
> > closed. Do this to release resources on firmware side.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > index dec8f5ffcfa5..919b77107cef 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > @@ -1066,6 +1066,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
> >  
> >  out_media_entity_stop_streaming_firmware:
> >  	stop_streaming_firmware(av);
> > +	close_streaming_firmware(av);
> 
> while at it, the logic of this function is nearly 100% duplicated in the error
> handling of the start_stream_firmware() function.

Yes. I'm reworking this area heavily in the set after the streaming series,
I'd prefer to tackle this at that time.

-- 
Kind regards,

Sakari Ailus

