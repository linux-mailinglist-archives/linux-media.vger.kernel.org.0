Return-Path: <linux-media+bounces-20669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 806EE9B8CDF
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 455D3286FE6
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 08:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290BF156678;
	Fri,  1 Nov 2024 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2q8p5NF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6DA1527A7
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449154; cv=none; b=sbDQ7XBIOpuGP9R9xXn2q8kYJdMZl9eevEsihTXqtO+1Zd1amWKIP3so8jpAHapWaMWjb4zparLEL+VSc9OooFf66XsxmxpzYaR9QxcjoNGxEPYNiaVjv5M4und2L6h40O8NtNHriqPr6c3vGOcjzdaUjrZo/QxeClq0vgJC6/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449154; c=relaxed/simple;
	bh=N+wX6DxvEYoGwaqCMCFCz5xJ8WR0mtz5O+ASM9TQ6eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG0Z31Nk2GkVC9OopFXBtIIESkE6OZkwToVik/YcYSuGf+pmTdfVrXQ2ifWQu8Fuhr7zWdeMPEV1WSlBrjLLZOvVDHZiD8ImVnBcvroFTnPxfRAIF/3A39Uh6g+2brb/6zMFkNRFNleHzfLpZlvq/b8SekXnpqB8kNEG4PaixV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2q8p5NF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730449153; x=1761985153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N+wX6DxvEYoGwaqCMCFCz5xJ8WR0mtz5O+ASM9TQ6eM=;
  b=h2q8p5NFE3O8uIPkxjHn4easv2LXmV9EE/f9bV+ALIsHQP0NCbSU9Lbi
   F+gItFZgcU9C9BDaGFjzVW3MjSEc5FewgHgukIJZKLLI1MHogDkPg5Rmy
   RS0bnd5n0EbIQUEgNJJP1Jo98M7oU4odkbH/2JvoMBol4cQHsybQiIXWB
   0/byCajtWujvV1bzJ/5NIcwz8wNO+gxY4gVZf9JTaXWWggEKJWjcKiAit
   CcyRyl3p2yt3Ko1qdOZDLp7diy8vEsxx3BolX1dvTPzQUQnT0MT1F/luP
   k950ZqMaPA07/IVQgvodlyzJpeSleIxy+pdBVTNlAEJRsOcQVQ3beOI3X
   A==;
X-CSE-ConnectionGUID: UP+vWZTsTveOU+PMFb78Mw==
X-CSE-MsgGUID: Nltgatd/Rp2IIPULbuGUUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30101578"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="30101578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:19:12 -0700
X-CSE-ConnectionGUID: jjyYH/IzSCeG4y8JK2nHRA==
X-CSE-MsgGUID: UPLsiSO1RN2drhkNNXuUtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="82811823"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:19:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4B17311FA28;
	Fri,  1 Nov 2024 10:19:08 +0200 (EET)
Date: Fri, 1 Nov 2024 08:19:08 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2] media: intel/ipu6: remove buttress ish structure
Message-ID: <ZySO_J1xDkcSY4sZ@kekkonen.localdomain>
References: <20241031130622.430308-1-stanislaw.gruszka@linux.intel.com>
 <f6e4a8b9-1ee5-04f2-069a-cf2541cca6bd@linux.intel.com>
 <2251d433-ecf0-6300-3598-82438befb456@linux.intel.com>
 <ZySHPtECRXNTSN2d@kekkonen.localdomain>
 <34bb5ca1-8c7c-316e-5886-378c8660f7f1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34bb5ca1-8c7c-316e-5886-378c8660f7f1@linux.intel.com>

Hi Bingbu,

On Fri, Nov 01, 2024 at 03:47:54PM +0800, Bingbu Cao wrote:
> Sakari and Stanislaw,
> 
> On 11/1/24 3:46 PM, Sakari Ailus wrote:
> >>>> @@ -386,10 +382,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
> >>>>  		}
> >>>>  
> >>>>  		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
> >>>> -			dev_dbg(&isp->pdev->dev,
> >>>> -				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
> >>>> -			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
> >>>> -			complete(&b->ish.recv_complete);
> >>>> +			dev_warn(&isp->pdev->dev,
> >>>> +				 "BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
> >>>
> >>> I think this is a unrelated change, right?
> >>
> >> I mean the change from dev_dbg() to dev_warn().
> > 
> > We're not handling these interrupts anymore in any way.
> > 
> > I wonder if the ipu6_buttress_ipc_recv() call should still remain in place,
> > even if we really do nothing with these. It looks like some kind of an
> > acknowledgement mechanism.
> 
> I just confirm that IPC_FROM_ISH_IS_WAITING and IPC_EXEC_DONE_BY_ISH are
> not valid anymore from IPU6, I think the handling here and below could be
> removed.

Do you know which IPU version still needed it?

There are folks who'd like to add IPU4 support to the driver but they can
add it back if it's needed.

-- 
Kind regards,

Sakari Ailus

