Return-Path: <linux-media+bounces-50230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE4D02BDF
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 13:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62EC730B9BA4
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 12:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDDD4E894E;
	Thu,  8 Jan 2026 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlB4F90/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BAB4E894A
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875347; cv=none; b=aS5X6e1tE+CalYkJRsqNV75K2y9TIPbvg7WMBR+YB0vj6cGlVTJdgLo/8ekhVPl2BIKGLX8qE+rDWOPrNhWXi6RT+Ty1AYjiDodvOJrZM0cZdU5AXD+OHLb6I669F4n3Fz39D4Qzv6itj3LMWevtxuLLR/NHWe75FMfRpbTSwY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875347; c=relaxed/simple;
	bh=ozKycWjaFqgBIgpo5E2cVkPCM7eYl3zI3MGL1evXKwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYUHKh6ZkhGWOEckikL2GqJwJWk8j38nyZTIlryTwXR9cvN0LNF89Hmzt38z6GnBobMMgoRahM/UYjQcm1UwZnHHkENjs4t3rgTD9j2Vl1s36pOUXb7d0m7xkVEjyFqCy0DtB+uJj6em31B+VaGRMM5Oqfjy77RyqKUzmisa1DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlB4F90/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767875346; x=1799411346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ozKycWjaFqgBIgpo5E2cVkPCM7eYl3zI3MGL1evXKwM=;
  b=OlB4F90/BPeWrnlu2Z5IVGC0Nzv//uQma6B1WPZo3gO/GC/yJ6+gtVy3
   6s18KmLSO5kAnNan7J55GONATzLBUDQj3yakLDGJ5dMaNynoqtjq5GbP7
   TlAoFEl4a3XTNYBJfzuUlb0S0zvGAc27c6kY9SbIxIQXisbSpSlaAbr8x
   UoEDa2vwlxjaa0HGX1hbjUkGKR3B2h9jHpsTib+srncZsG0yv0YnpxqNH
   UocED6cM5r0R+67vN4PIGXOzpUrUsSi3TAItVBOlHrJmGiv2F5m9H21IC
   ftEehZzfZuVNGFv3s2y+JF5MAcaDahHfL1vf/OamYr4HM7bTCrVtuXshc
   w==;
X-CSE-ConnectionGUID: nVw4hMdDTeCkNj/j05zuYg==
X-CSE-MsgGUID: WyXYfk6ERJKsBlE6LcMJ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80615625"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="80615625"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:29:05 -0800
X-CSE-ConnectionGUID: FWel4WOGScCbwqpCPCCjeA==
X-CSE-MsgGUID: n1XdjVTHQUG/ubQsOC5XSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233907930"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.248])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:29:04 -0800
Date: Thu, 8 Jan 2026 13:28:57 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com, 
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH v4 11/14] media: ipu6: Obtain unique source pad from
 remote sub-device
Message-ID: <6kdqrlnfnrnlbj6qosseghlkj2ucuhs4heh4qhuj6etwf3ujp5@etr5y5bpj4jy>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-12-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108081712.543704-12-sakari.ailus@linux.intel.com>

Hi Sakari,

On Thu, Jan 08, 2026 at 10:17:08AM +0200, Sakari Ailus wrote:
> Obtain unique source pad from a remote sub-device, instead of the first
> one. This means that only one link may be active at stream start. There's
> no functional change in practice, unless multiple CSI-2 transmitters are
> directly connected to the receiver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index 54d861aca008..1d58e321bda7 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -1204,10 +1204,10 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
>  
>  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  	asd = to_ipu6_isys_subdev(remote_sd);
> -	source_pad = media_pad_remote_pad_first(&remote_pad->entity->pads[0]);
> -	if (!source_pad) {
> +	source_pad = media_pad_remote_pad_unique(&remote_pad->entity->pads[0]);
> +	if (IS_ERR(source_pad)) {
>  		dev_dbg(dev, "No external source entity\n");

Don't you think this warrants a dev_err() like elsewhere in the driver ?

--
Kind Regards
Mehdi Djait

