Return-Path: <linux-media+bounces-39087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE842B1E3EE
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90C353A8746
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 07:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF42D24BD03;
	Fri,  8 Aug 2025 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpxMPIET"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39F678F39;
	Fri,  8 Aug 2025 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754639764; cv=none; b=i3dnOFb1Ni8qF68GbKU/Cdmjcjxk1kqjyez0zRV23BEKaqj/w/WUY+BhlwCpg+3Ws8DGrf6zstBNGxsYVwB7r56+pNOvgc3IVCgabl5m12GpVSobcLqRGI/C820vy3+g0OEEHsJkwVhPKMlNvDb2lg4z26C6lGcyK8joGmeZVEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754639764; c=relaxed/simple;
	bh=tenxd8OwrXEyBfSoBd/ukFa795p3YM0tkYWXlKKB8Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1yXXLDK5TVSXueDQXl/V51cUfGhMbWuKoWiFTcml+isaK7oOZYajOOYRZPaF53zOjovBi8Tip/G7+UBTHS2wh4a3LbsIfIYzkxnAevZwRbMWYWNR9BEs0V/M1I6ab0Hgda18VgZ8g1dxhshatKvDuAzxI1jnvfNZ5Nx04MwwbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpxMPIET; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754639763; x=1786175763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tenxd8OwrXEyBfSoBd/ukFa795p3YM0tkYWXlKKB8Cg=;
  b=hpxMPIETWFTaObSm0GXY69MAMwGF0ay1xz0xVus9yWdIGXeMeMaSE6c5
   alFpUy6LIa9rR1TEB22tg9bIi4A5S4Tr50PrgK1UXpvAkMq+Ehwuuah1E
   7VyIFrT0PLuIPXmIGrARG7jrMMHG/4Rh0b+BO51fYXL8M12t2iHft+Vi2
   nF2jpDeqIHag91ot9u0Ihp/3tiuJrOBFdwLf6UcSfT7juv7c6bolQySS0
   BxbBSr9x46M6FIZZ+JC5x6gvFoIZLCXLqqIJqgZ1VrjSlbVdp8Jb934PH
   xovkHdGIlhaIVzPPNbrmmafo9iUxbuDBzmoeK6mrC2PK0VxSVNTuvYckN
   w==;
X-CSE-ConnectionGUID: nKn8xgXlRUWOPpHCzlTKNQ==
X-CSE-MsgGUID: rLQqcN1+R4idyE3JcIAurQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79542194"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="79542194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 00:56:02 -0700
X-CSE-ConnectionGUID: zgz0oXI+SMqHdysIwaMfhA==
X-CSE-MsgGUID: 7196ErupQ42DCXj7QXflPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165681202"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.151])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 00:56:00 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7D4C211FC45;
	Fri,  8 Aug 2025 10:55:57 +0300 (EEST)
Date: Fri, 8 Aug 2025 07:55:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 1/4] xhci: Add host support for eUSB2 double
 isochronous bandwidth devices
Message-ID: <aJWtjdD5TAjDkCgH@kekkonen.localdomain>
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
 <20250807055355.1257029-2-sakari.ailus@linux.intel.com>
 <2025080747-stays-snuff-86cc@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025080747-stays-snuff-86cc@gregkh>

Hi Greg,

On Thu, Aug 07, 2025 at 04:25:05PM +0100, Greg KH wrote:
> On Thu, Aug 07, 2025 at 08:53:52AM +0300, Sakari Ailus wrote:
> > From: "Rai, Amardeep" <amardeep.rai@intel.com>
> > 
> > Detect eUSB2 double isoc bw capable hosts and devices, and set the proper
> > xhci endpoint context values such as 'Mult', 'Max Burst Size', and 'Max
> > ESIT Payload' to enable the double isochronous bandwidth endpoints.
> > 
> > Intel xHC uses the endpoint context 'Mult' field for eUSB2 isoc
> > endpoints even if hosts supporting Large ESIT Payload Capability should
> > normally ignore the mult field.
> > 
> > Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> > Co-developed-by: Kannappan R <r.kannappan@intel.com>
> > Signed-off-by: Kannappan R <r.kannappan@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/usb/host/xhci-caps.h |  2 ++
> >  drivers/usb/host/xhci-mem.c  | 60 ++++++++++++++++++++++++++++--------
> >  drivers/usb/host/xhci-ring.c |  6 ++--
> >  drivers/usb/host/xhci.c      | 16 +++++++++-
> >  drivers/usb/host/xhci.h      | 19 ++++++++++++
> >  5 files changed, 87 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
> > index 4b8ff4815644..723a56052439 100644
> > --- a/drivers/usb/host/xhci-caps.h
> > +++ b/drivers/usb/host/xhci-caps.h
> > @@ -89,3 +89,5 @@
> >  #define HCC2_GSC(p)             ((p) & (1 << 8))
> >  /* true: HC support Virtualization Based Trusted I/O Capability */
> >  #define HCC2_VTC(p)             ((p) & (1 << 9))
> > +/* true: HC support Double BW on a eUSB2 HS ISOC EP */
> > +#define HCC2_EUSB2_DIC(p)	((p) & (1 << 11))
> 
> Why tabs when the ones above it were not using tabs?

I'll use spaces for v4 so the macro bodies are aligned.

These macros should be cleaned up but that's for another set I think.

-- 
Regards,

Sakari Ailus

