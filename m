Return-Path: <linux-media+bounces-50727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88926D213E3
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 21:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAAAF305B1FD
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 20:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757C3357A33;
	Wed, 14 Jan 2026 20:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrufOdcC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A69426D4E5;
	Wed, 14 Jan 2026 20:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424115; cv=none; b=EOiRQTo4ht+xiTVIkzmFM19Z0qnypHUA4RXPYTZLKul8Hf0oYI/VZ37/skoyvS6VegdknDWq99b5I6TfCWjm3avtwAeR9oSG/StOvBjdu4RybG36cuv2ECOyRkn1JwhsgHdyiIW2mnKoIrnoaIR9fNimMsoBD/DJPSe3v9JDaOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424115; c=relaxed/simple;
	bh=II/zKYLz5HA/M7Q+lZqmaS2Xqc2kUo7KzPN6gzMbBbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1+azesGX7IJaNQGlpMYsfMCHit+mQYmLSvz/c7K92HOcZLj4mfsmCUbWdSpoFL0XrDuIHOdiI5Euff+5821xHkb1TL3RbEet0edsIwEbtVz+0BKBwiNrrzt8BeRE6GNMWG+Wd4w78GCo5nrww3DRWrVwkuzEuOTsJeYicgknSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrufOdcC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768424115; x=1799960115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=II/zKYLz5HA/M7Q+lZqmaS2Xqc2kUo7KzPN6gzMbBbQ=;
  b=UrufOdcCADvp7pmeIUE0Pd51wmJl7JRPg1MjbFYnBV317hApipvZRhB8
   TiDjxu/pexUinjpOKWThZn2UkJmV9gs34IKyvpWGA1KsfbjKYNxX8R8vX
   eGx68uP/rLCnmTYUHuEkAkT2hNOVP04SpUANqWNvsYvr2i1bToi39acRM
   0uK+0pAtjCXqRAiYsVr73pOec7dTm14OFrtBL7ubYrv40NF9n0SdUEdoc
   Qqj4nZle3Q99ssZYqI6Lsl/P4Xqa0xlQeZkAS1Dx106+pow/aoCg9hC0y
   co+4OOzUC+NJZPcvUuSncl0PrSDvD1XAMfmhIRcnPqIMtdLyrMAPMXOiW
   A==;
X-CSE-ConnectionGUID: QTuKnixER22pMmopLSBPhA==
X-CSE-MsgGUID: +gcx43iFTHyILolOBD02bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57285205"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="57285205"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 12:55:14 -0800
X-CSE-ConnectionGUID: knwA8t2VSHK5lnidXILQlA==
X-CSE-MsgGUID: 0oFa+oIqTnOVoC7h6IkOCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204395673"
Received: from inaky-mobl1.amr.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.184])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 12:55:10 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9C1EA120742;
	Wed, 14 Jan 2026 22:55:08 +0200 (EET)
Date: Wed, 14 Jan 2026 22:55:08 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v7 3/7] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <aWgCrG_39DV-j80G@kekkonen.localdomain>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-4-Bin.Du@amd.com>
 <aUkRQEeAWDeQknP6@kekkonen.localdomain>
 <92ccb38a-5c62-4730-8a41-fa80d2f523a7@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92ccb38a-5c62-4730-8a41-fa80d2f523a7@amd.com>

Hi Bin,

On Wed, Jan 07, 2026 at 04:44:11PM +0800, Du, Bin wrote:
> > > +int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmio);
> > 
> > Could you run
> > 
> > 	$ ./scripts/checkpatch.pl --strict --max-line-length=80
> > 
> > on the set, please?
> > 
> 
> Oh, I will change --max-line-length in our checkpatch.pl from 100 to 80 and
> fix all the violations. I used to think that the requirement has been
> relaxed to 100 columns based on
> https://www.phoronix.com/news/Linux-Kernel-Deprecates-80-Col

The default checkpatch.pl warning has been changed but not the coding
style. There are valid reasons why you might want to have longer lines,
still checkpatch.pl not warning about those isn't one. :-)

-- 
Regards,

Sakari Ailus

