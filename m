Return-Path: <linux-media+bounces-20180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C49AE28C
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7F921C21A4F
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 10:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947D71B4F32;
	Thu, 24 Oct 2024 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqbTurTK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E539D18B46A
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729765862; cv=none; b=l5spAH4AutRaJaribPVEzcAYvvsz28ShPVatBqmqqNSGNcQ7bWlsFdRFZaMm799H/A+1bwTlV1wExZ0Ubvr1cQU2kNZ53xat14U6g34vs9S1sRFk3XoGLdOSSCsvnotteClVxIWU7xytoAAyw4DLktch/PTkQVUML7m6aTyVCuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729765862; c=relaxed/simple;
	bh=rJQAS64i/UZNFcjM2kcMZrHhAb6lNpv3LFxFhZPrKKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BimF28jJqhJRucb8xsU4eIttUrHJHsvHPjDlb/HJFc74k3Uyuy44nVGnHXLLYQBdcaWyY+LCGcinWq4Z6wj1LRY3V9zTOjtxGXF2Ic87FM+e5/DZT7rjl+TAwAPYUufqAT+8plCZeHBEylUOLomPhyxF8gr+bDqyHfLt3z6EXIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqbTurTK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729765860; x=1761301860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJQAS64i/UZNFcjM2kcMZrHhAb6lNpv3LFxFhZPrKKw=;
  b=IqbTurTKYXCnTAWrEVCuNToIi4jlllnzPF4VIrPgNsa1xa87OtGN1jgQ
   s4afiGrDsLtFh+kLqPHfrBPVfIrJ4yZ81+qZbAhuyVOUZIKwXNX+05V/d
   rDW0+En4MZIzo17x2Lw640pHkxnyCF4EhqNmA0zxsE6RS+20292MdFHY4
   calHFlbCsDccuk038goQSow2kkehZy1ckckPsDDIn5L0kWDsvoUstkajn
   D0Lih64/Vh3W3sWzaCntY0/jAzZyEzaVC6AQUU49S3046gb1AMqWl/VKr
   /ofYVMKJA001+a23M6YQo+pr+Ou4gGFLwbNw5vBczrHQ1nrPb5Cxxnoly
   w==;
X-CSE-ConnectionGUID: WHdGoKQjQBWRsVZSkNOfRw==
X-CSE-MsgGUID: medCNiefSHybiOKT1uWn5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40758456"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="40758456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 03:30:59 -0700
X-CSE-ConnectionGUID: hiRqT08pQWyheKzqf0kzaA==
X-CSE-MsgGUID: ieLDc3MUQgOvk0dvovtpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80719679"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 03:30:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B7AA11F984;
	Thu, 24 Oct 2024 13:30:55 +0300 (EEST)
Date: Thu, 24 Oct 2024 10:30:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hongju Wang <hongju.wang@intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: intel/ipu6: Set the VC of the stream as the SOF
 event id
Message-ID: <Zxoh36bkJaDQIvME@kekkonen.localdomain>
References: <20241024032201.3867638-1-hongju.wang@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024032201.3867638-1-hongju.wang@intel.com>

Hi Hongju,

On Thu, Oct 24, 2024 at 11:22:01AM +0800, Hongju Wang wrote:
> In the virtual channel case, they should use v4l2_event.id to distinguish
> SOF events of different streams. Therefore, we set the virtual channel
> number of the stream as the SOF event ID. This number is unique.
> 
> Signed-off-by: Hongju Wang <hongju.wang@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 051898ce53f4..5ad426afa0f0 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -578,6 +578,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
>  		.type = V4L2_EVENT_FRAME_SYNC,
>  	};
>  
> +	ev.id = stream->vc;
>  	ev.u.frame_sync.frame_sequence = atomic_fetch_inc(&stream->sequence);
>  	v4l2_event_queue(vdev, &ev);
>  

The id field in struct v4l2_event isn't used for the FRAME_SYNC event and
also the virtual channel isn't communicated to the user space currently.

Doesn't the video device itself (and the routing configuration) associate
this to a given sensor already?

-- 
Kind regards,

Sakari Ailus

