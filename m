Return-Path: <linux-media+bounces-40137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828B3B2A078
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AC162A6880
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8015126F299;
	Mon, 18 Aug 2025 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJcGf3bB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5202726F28B;
	Mon, 18 Aug 2025 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516427; cv=none; b=hUBlmNr20I7ibr36ctSvGDGYr0sBpsImsKqQrRGbxagLzfCqh/xxYdAzhSF1+ONw4Nohk+61OMn2x6fyTOSk/Egx3njLReIuC0IwPET/7fk5vNRMRYZQ8HjZPzidLv/35HvUC49fWsLlxLanCVEfXBPj01S+6NC2nNipgNnZ/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516427; c=relaxed/simple;
	bh=usmPPtoOvTEir35/xRBRLGQsCz7pzJYPbBZ8raK5X5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtnV3XYoVx4ASF7rz2VHUjzwqTBFZJHe3Qm/4gvxmZkkP0nHUGAmyCipe2a11J17SQM0bHE2UxLMS9VxD7+JFMCYRvfbSZJcNW8eVJD2ks/GwKNfMD6j+9EVnd7hVifoRkxguGQNprvSyX8W/8lU9+qGKq4H6ifXWI4IInb32VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJcGf3bB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755516426; x=1787052426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=usmPPtoOvTEir35/xRBRLGQsCz7pzJYPbBZ8raK5X5g=;
  b=oJcGf3bB/4iFOXDeASW1a3oW8x+SfErQjbxQ/t6XQPD7L9+LajM+ijhT
   H+RUO48T4U2r9rQNQDLLD8zS4oz+bclJu13/ljcIpH2ZvjCqcklgMMlfT
   +XqnSYVRzkxifdYMN1Jd9BPehX7FQN/7V824gKCzDG7UD8JrZStCGUchF
   fCF41thgs0G3LIjrRe0NERSHPkrhnEOd3Lr6LT4RLlAeYTWr4TFjKaHcC
   WykpAhK1SIOxLwk2ymiOw4RBDTbD9m/f8HF28rk8P1Bt+fAtyxv46Ny1M
   nmzXLfKsaLaBK0RWJrWGmEdqFMOeIyeP2vBEdOZ17L0OgEpWgXt56FfhQ
   A==;
X-CSE-ConnectionGUID: +JLOgyWAQoiVyg0RCzkyKg==
X-CSE-MsgGUID: nWZqAtpMTQWr2A/AqmBLmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75304476"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75304476"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:27:05 -0700
X-CSE-ConnectionGUID: A2ixLycMRQm2bmsHm5Pdug==
X-CSE-MsgGUID: mlA1EUIbS4isViyC9OzoTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171791482"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.252])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 04:27:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 54F1312031C;
	Mon, 18 Aug 2025 14:27:00 +0300 (EEST)
Date: Mon, 18 Aug 2025 11:27:00 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <aKMOBPTqZX_yJjOv@kekkonen.localdomain>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-4-sakari.ailus@linux.intel.com>
 <20250813164958.6c6c34a4@foxbook>
 <aKLDXCchS20kaq20@kekkonen.localdomain>
 <767ac1c3-f09c-47cf-947d-968ae574e577@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <767ac1c3-f09c-47cf-947d-968ae574e577@linux.intel.com>

Hi Mathias,

On Mon, Aug 18, 2025 at 10:32:48AM +0300, Mathias Nyman wrote:
> Hi
> 
> On 18.8.2025 9.08, Sakari Ailus wrote:
> > Hi Michał,
> > 
> > Thank you for the review.
> > 
> > On Wed, Aug 13, 2025 at 04:49:58PM +0200, Michał Pecio wrote:
> > > On Tue, 12 Aug 2025 16:24:44 +0300, Sakari Ailus wrote:
> > > > From: "Rai, Amardeep" <amardeep.rai@intel.com>
> > > > 
> > > > Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> > > > isochronous endpoints in a USB version independent way.
> > > > 
> > > > Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> > > > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > > 
> > > Hi,
> > > 
> > > This is practically identical to xhci_get_max_esit_payload().
> > > 
> > > Couldn't xhci also use this helper now, to reduce duplication and
> > > ensure that it has the same idea of ESIT payload as class drivers?
> > > 
> > > Note that this here would need to also accept interrupt EPs:
> > > > +{
> > > > +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> > > > +		return 0;
> > 
> > Sounds reasonable, I'll see how to best take that into account in v5.
> > 
> > I wonder if I should adopt the name from the xHCI variant as the function
> > would be also used for interrupt endpoints.
> > 
> 
> I think the "ESIT" acronym (Endpoint Service Interval Time) is very xHCI
> spec specific. Usb spec usually refers to isoc and interrupt endpoints as
> "periodic"
> 
> how about one of these:
> usb_endpoint_max_periodic_bytes()
> usb_endpoint_max_periodic_payload()
> usb_endpoint_max_periodic_bpi()

How about usb_endpoint_max_si_payload() ("si" being for service interval)?

-- 
Regards,

Sakari Ailus

