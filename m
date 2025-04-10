Return-Path: <linux-media+bounces-29941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB8A8480C
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 17:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 226A37B39A1
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100531E98FF;
	Thu, 10 Apr 2025 15:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oH2z5Ytx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7E31E1A16
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299301; cv=none; b=LE8sxgJX7FNF7glGqD0rPJDpOUnWlagWdYJpR6Yje6aO9yX+a9UcmZYU7Q8uhgE7qi0Hhq1YkCRpNEfycxPcgu+T9Q6JN5cFyAqJxnSoM0wK53CRENq+Tz7paWYWt8Gue7Mk2BUlS5I1bUZY1E5QMfoV6Bm/Dzvcv3o1SqL3wEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299301; c=relaxed/simple;
	bh=1sAQFgebmzI0/TDKO5E6NDHF67czI3S3kIg9v5v+9uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Np/p8nRVLp9vFXFzpht0gySXdPe1t+HzPRLk1DgTXwpjlQbk2daG9vFSasKbpGpDumH6iJhC6ddE+mjoJGtx5zPLtMwTNeja0EZKYTJvKlMnoJrTx9K9nJfTdI99nmDWaC1ttJVAUqYJHTGsq3Sqhf0CaFEWLw10cdZHK4sZLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oH2z5Ytx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744299300; x=1775835300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1sAQFgebmzI0/TDKO5E6NDHF67czI3S3kIg9v5v+9uw=;
  b=oH2z5Ytxx4sGN1oknolg2EVLQ0wDCDoqMTGWE+6k7P3DuZmYbozD3241
   c49etxuZ+VDCsH8qwIqKhLOFWnTWemb8w5QSj8s0Rn4NsdNQ4GsZc2Kyt
   mKv4KWNzfzsMXkiHKMKjzubpw/xiYwRLXV+ziHYveEoBUmfLXk7wx5lus
   s3N2XNAGGur7rX2cexrQqGTON1CE5EEPN5h2XNR3aKe4WdQ5A42orpZqn
   GY0BZ/Jv1Cema7V7qBsO+OiY9+xjnomZHbPKstbGnZB7rR5PYob37100r
   hucADI/V1JSVdw/7DyaOSkQaP2gGWG5XDntL+spo81eN+Sm9syqSB/LaH
   g==;
X-CSE-ConnectionGUID: AQZ0XCA7S7WOGRNVLrHTaQ==
X-CSE-MsgGUID: mw2eqP87Q02TGCPklAI4Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="44968932"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="44968932"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:34:58 -0700
X-CSE-ConnectionGUID: CrXMLXjZSwaPG4bhYh3ioA==
X-CSE-MsgGUID: UMgXhGImRkWv5cPZNz/RlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134055599"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:34:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7A10111F74E;
	Thu, 10 Apr 2025 18:34:54 +0300 (EEST)
Date: Thu, 10 Apr 2025 15:34:54 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 2/7] media: intel/ipu6: Remove line_align
Message-ID: <Z_flHugkaBf-qLya@kekkonen.localdomain>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
 <20250407134037.808367-3-stanislaw.gruszka@linux.intel.com>
 <Z_ezvvBNtpcZlAXW@kekkonen.localdomain>
 <Z/fDyNb2evbxipY+@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/fDyNb2evbxipY+@linux.intel.com>

On Thu, Apr 10, 2025 at 03:12:40PM +0200, Stanislaw Gruszka wrote:
> On Thu, Apr 10, 2025 at 12:04:14PM +0000, Sakari Ailus wrote:
> > Hi Stanislaw,
> > 
> > Thanks for the set.
> > 
> > On Mon, Apr 07, 2025 at 03:40:32PM +0200, Stanislaw Gruszka wrote:
> > > isys->line_align value is only used in one place and we can just use
> > > the proper value directly there.
> > > 
> > > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > > ---
> > >  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 +-
> > >  drivers/media/pci/intel/ipu6/ipu6-isys.c       | 1 -
> > >  drivers/media/pci/intel/ipu6/ipu6-isys.h       | 4 ----
> > >  3 files changed, 1 insertion(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > > index e36a21aa9040..3165904d7ebf 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> > > @@ -241,7 +241,7 @@ static void ipu6_isys_try_fmt_cap(struct ipu6_isys_video *av, u32 type,
> > >  	else
> > >  		*bytesperline = DIV_ROUND_UP(*width * pfmt->bpp, BITS_PER_BYTE);
> > >  
> > > -	*bytesperline = ALIGN(*bytesperline, av->isys->line_align);
> > > +	*bytesperline = ALIGN(*bytesperline, 64);
> > 
> > Is this value the same for ipu7?
> 
> Yes.

Ack, thanks for confirming this.

-- 
Sakari Ailus

