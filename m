Return-Path: <linux-media+bounces-40143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D6B2A166
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10477189C800
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 12:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA93A31B131;
	Mon, 18 Aug 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5IVKfBJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC731A079;
	Mon, 18 Aug 2025 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519193; cv=none; b=PlCHo4/NT+hpOJKtJN3n4Z/fkoBkuYekPkvxC7LcojoIbg+cLYuNSKWK5COlvt1ebg63GxtjDi+aarlZ4LTOjoBcUs8e+Hd0QH19SMIBXXdnnq1j1VkJ4JxVX0J75boRk7YjgVmVB3vTWF6RXK7N5M7TMXpuEmwV1fILSclpKiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519193; c=relaxed/simple;
	bh=ckmz1PsxZyH5g+tpPTblcGbE5hcGe+F53rZFuMOOV3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKl0jxb1yc8txDaeuOoJ74pXMqhFOveEVIuev5z1TKXhnNOkV4iMXwBAyMGluluQ6VmPSsds+Ue56OBWp7uhtmwsSzaoeMqD4W3MLr+apgeHY2KvK+9QL766CM7nCnduvhdmJFuDY/BI3dyEUhN0zJXxIIYcSP5Lm4SRkKgbdU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5IVKfBJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755519191; x=1787055191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ckmz1PsxZyH5g+tpPTblcGbE5hcGe+F53rZFuMOOV3g=;
  b=l5IVKfBJXSPPpwqgS+txmYvOJnTThEZcnq5G8GT+vc8rekItnINulX/l
   cjuq3/F2KVzykBDaQ5SNx2G3ADH79Lo8OSoqqSGIoWopWAL+RIE3ho5Wa
   6MCZ103PjnmTEcDoY36IjKuZpUD+uNx0930A+atRp3MnNnR7GAnzo0iwR
   pHG8mfwlJGtlAATkpA+g7ghbXC+rAqT3kHiXqIWVmjwdv5LcMoUrVxdUh
   B0KfK9JGVlJnrBdm3OkIgOULavg1vENpH4SCafMGSJPgXfMeODhwP5nZF
   XnO3yioReIMXL6js1SCkonVDxwbC/66gEyZPjNnCrR47fk36nSPn4W2oV
   w==;
X-CSE-ConnectionGUID: Kq+TAfshQouX5ZfkyuDFZg==
X-CSE-MsgGUID: 0xUGwLOPTMKRlsdlaqq3Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57453776"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57453776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 05:13:11 -0700
X-CSE-ConnectionGUID: woPZVayaSR+QARnM86Kjnw==
X-CSE-MsgGUID: 1d2tMHGhTBawckJq8giHJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="191249172"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.252])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 05:13:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A1CEB1201E5;
	Mon, 18 Aug 2025 15:13:05 +0300 (EEST)
Date: Mon, 18 Aug 2025 12:13:05 +0000
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
Message-ID: <aKMY0XPLmK-TOWIt@kekkonen.localdomain>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-4-sakari.ailus@linux.intel.com>
 <20250813164958.6c6c34a4@foxbook>
 <aKLDXCchS20kaq20@kekkonen.localdomain>
 <767ac1c3-f09c-47cf-947d-968ae574e577@linux.intel.com>
 <aKMOBPTqZX_yJjOv@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKMOBPTqZX_yJjOv@kekkonen.localdomain>

Hi Mathias,

On Mon, Aug 18, 2025 at 11:27:00AM +0000, Sakari Ailus wrote:
> Hi Mathias,
> 
> On Mon, Aug 18, 2025 at 10:32:48AM +0300, Mathias Nyman wrote:
> > Hi
> > 
> > On 18.8.2025 9.08, Sakari Ailus wrote:
> > > Hi Michał,
> > > 
> > > Thank you for the review.
> > > 
> > > On Wed, Aug 13, 2025 at 04:49:58PM +0200, Michał Pecio wrote:
> > > > On Tue, 12 Aug 2025 16:24:44 +0300, Sakari Ailus wrote:
> > > > > From: "Rai, Amardeep" <amardeep.rai@intel.com>
> > > > > 
> > > > > Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> > > > > isochronous endpoints in a USB version independent way.
> > > > > 
> > > > > Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> > > > > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > > > 
> > > > Hi,
> > > > 
> > > > This is practically identical to xhci_get_max_esit_payload().
> > > > 
> > > > Couldn't xhci also use this helper now, to reduce duplication and
> > > > ensure that it has the same idea of ESIT payload as class drivers?
> > > > 
> > > > Note that this here would need to also accept interrupt EPs:
> > > > > +{
> > > > > +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> > > > > +		return 0;
> > > 
> > > Sounds reasonable, I'll see how to best take that into account in v5.
> > > 
> > > I wonder if I should adopt the name from the xHCI variant as the function
> > > would be also used for interrupt endpoints.
> > > 
> > 
> > I think the "ESIT" acronym (Endpoint Service Interval Time) is very xHCI
> > spec specific. Usb spec usually refers to isoc and interrupt endpoints as
> > "periodic"
> > 
> > how about one of these:
> > usb_endpoint_max_periodic_bytes()
> > usb_endpoint_max_periodic_payload()
> > usb_endpoint_max_periodic_bpi()
> 
> How about usb_endpoint_max_si_payload() ("si" being for service interval)?

I somehow missed your latter sentence earlier. I'm totally fine with these,
perhaps I'm slightly leaning towards usb_endpoint_max_periodic_payload()
but let's see what others think.

-- 
Kind regards,

Sakari Ailus

