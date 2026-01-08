Return-Path: <linux-media+bounces-50231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E553D040EA
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 16:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3379035DC4EB
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 15:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12444F6C23;
	Thu,  8 Jan 2026 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVXAXsel"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1354F6C1F
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875759; cv=none; b=F297E5Z4Lai2hGWyeA1oQcM9xq12EVlzb3DqLXXGno0L3tcw5mMwxv2Abb+Ilf/6+or4grnTeeuusXqNdP/y1LoWW+juv0ztp6cJLFQZlo+AP/K4j5N+pAhMxi/tgTY9y5iaG1fud/4kJmw4EG5CnB50npcdIIAGKI1ptLtWnmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875759; c=relaxed/simple;
	bh=2LZYJM3DAdg3vaGVsAqkKJyv5xSK7sxLbHAljBVwvno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hw3PJCNOZwJCrkoePA+bSuNVBkrpgZ2e7STKhi+70B2hAADUMqspbel6v/Xb+oNQKJ81Ypm0/BdqWBoRIFBs5XsQpsD1oVqR5e+gaRdbzsSHrKHB2HhIZWDGwUrj7XYaPewWbm3TeWf0MS5ryivEhkCIfS6nrAYcGQPP316chJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVXAXsel; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767875757; x=1799411757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2LZYJM3DAdg3vaGVsAqkKJyv5xSK7sxLbHAljBVwvno=;
  b=GVXAXsel4Df9socivKXYudvrYjUrO4Qg4NpsbGaM0Zm0yMrNSDTZHvO+
   1m0kwHN6/AFouODgyza5cLIiIA9xkfYHyD/+qQd4Wuxm2ZsBm4XL5q0GS
   NnH91TPBPjvPFNsF1vy3y6NSyYdPBp060Br+yFUN3LtCMBhcjbaPF/lj4
   eY/2L13rLqu25y20atyqoESLu2Tu876Ebzq6YHOpvi7Oj1glODHcG+cGg
   iitK1EwCjxh5GTeKseJ35TLxueSd0sUg+2xnFPjbkq2V5vQ8I46u1+5r3
   6gaSRNyuV5Jl9w6OpTkAUr26Lc+q0iR1EfFCPGaTAwMgJaXQ3uYYnYWJp
   w==;
X-CSE-ConnectionGUID: DcG4120/TpaHsW0KtDU7Kw==
X-CSE-MsgGUID: +UpEDuxzSduit/ajkzghbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79971901"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79971901"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:35:56 -0800
X-CSE-ConnectionGUID: S8vNVhauQUqy7veAZZLNdw==
X-CSE-MsgGUID: 41oyLIsOR0yJWLzgDKs+Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="207329543"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:35:54 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 14AC211F72F;
	Thu, 08 Jan 2026 14:36:07 +0200 (EET)
Date: Thu, 8 Jan 2026 14:36:07 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH v4 11/14] media: ipu6: Obtain unique source pad from
 remote sub-device
Message-ID: <aV-kt1lsij40sGNW@kekkonen.localdomain>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-12-sakari.ailus@linux.intel.com>
 <6kdqrlnfnrnlbj6qosseghlkj2ucuhs4heh4qhuj6etwf3ujp5@etr5y5bpj4jy>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6kdqrlnfnrnlbj6qosseghlkj2ucuhs4heh4qhuj6etwf3ujp5@etr5y5bpj4jy>

Hi Mehdi,

Thanks for the review.

On Thu, Jan 08, 2026 at 01:28:57PM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Thu, Jan 08, 2026 at 10:17:08AM +0200, Sakari Ailus wrote:
> > Obtain unique source pad from a remote sub-device, instead of the first
> > one. This means that only one link may be active at stream start. There's
> > no functional change in practice, unless multiple CSI-2 transmitters are
> > directly connected to the receiver.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > index 54d861aca008..1d58e321bda7 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > @@ -1204,10 +1204,10 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
> >  
> >  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> >  	asd = to_ipu6_isys_subdev(remote_sd);
> > -	source_pad = media_pad_remote_pad_first(&remote_pad->entity->pads[0]);
> > -	if (!source_pad) {
> > +	source_pad = media_pad_remote_pad_unique(&remote_pad->entity->pads[0]);
> > +	if (IS_ERR(source_pad)) {
> >  		dev_dbg(dev, "No external source entity\n");
> 
> Don't you think this warrants a dev_err() like elsewhere in the driver ?

This isn't really supposed to happen. But if it does, it allows the user to
fill logs with it. I'd keep it on debug level.

-- 
Kind regards,

Sakari Ailus

