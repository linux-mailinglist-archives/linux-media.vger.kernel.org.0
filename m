Return-Path: <linux-media+bounces-40082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E52B29962
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DFD73A9926
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A222727E2;
	Mon, 18 Aug 2025 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzAejRia"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6D123AE9A;
	Mon, 18 Aug 2025 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755497315; cv=none; b=Jw3CkgFcbyUsXzy+c1DuW9BvBLs7FuoA3futvAwSFqm+a/qIv2IrwCWvQKEgZ7hutWea/Po5xvyHVquVr2lUU/nJtHANHMp3Y/GB6rk9KhM9Kf7noPWVN1NKoVz5bcqKIZDn42KHRTOvua9T0QuGB3pbVRzmtv7Ewt2dQupAhTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755497315; c=relaxed/simple;
	bh=NTb2AaPczZEAquJMxdZvmuT4EQqprD0a24G9265iQJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOEb7l/40MjHF3k5EWS2qkHreFQCA0qdlNBZXk1YcrXHJBhGgFCBtNt//GCJVe/IX2e2hSty543fIdbFosg2qtlqmM+dZXwAUYDybHgyWEHnzwAY3WwVx8Kc0+okkE/lbjMRR//+G9t5Q+m90N4FzilqWjoLM72L4jU69gssplA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzAejRia; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755497314; x=1787033314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NTb2AaPczZEAquJMxdZvmuT4EQqprD0a24G9265iQJc=;
  b=PzAejRiazbHpW5ByjrHCVnTmFzgHp3mShxoRDcxOiWBXM2LaKEUR8929
   vQc+RaOKerwyTJGnNao/+tWhkT4dadKi5FVsW/fdLxNL3SZrHRmDcIR+6
   +WXCQMvb6ZJ4D8L4X2zgc+E3mYr7Wy4VQrJuZJrA953L1x/cNIDxCzn+T
   Ypg1enyTSivN3l77hwdddocNmgsen1odT+AypqaJmffDXvratwq4DlS8g
   8kmcGWNGeUroMvxBKq07eOw3TyctMKUo7J0pkdmzsNpYYvKg7jYnOqYFm
   i56FJMHYda2pt/yld9Drmi5wONyCwl5Xsk9v2UG81uWXNFfhwIXrSfLnL
   g==;
X-CSE-ConnectionGUID: BOZx33SwR56QlPCUwEKoLg==
X-CSE-MsgGUID: TzQ8z4QaSI+iqI5BtUWxuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="67980375"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="67980375"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 23:08:34 -0700
X-CSE-ConnectionGUID: N4C3MGssS2yRH1im6C24UQ==
X-CSE-MsgGUID: 7u2rFr8oRt2mBE+33ZXddg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171733367"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.152])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 23:08:30 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A5E5120339;
	Mon, 18 Aug 2025 09:08:29 +0300 (EEST)
Date: Mon, 18 Aug 2025 06:08:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <aKLDXCchS20kaq20@kekkonen.localdomain>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-4-sakari.ailus@linux.intel.com>
 <20250813164958.6c6c34a4@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813164958.6c6c34a4@foxbook>

Hi Michał,

Thank you for the review.

On Wed, Aug 13, 2025 at 04:49:58PM +0200, Michał Pecio wrote:
> On Tue, 12 Aug 2025 16:24:44 +0300, Sakari Ailus wrote:
> > From: "Rai, Amardeep" <amardeep.rai@intel.com>
> > 
> > Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> > isochronous endpoints in a USB version independent way.
> > 
> > Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> 
> Hi,
> 
> This is practically identical to xhci_get_max_esit_payload().
> 
> Couldn't xhci also use this helper now, to reduce duplication and
> ensure that it has the same idea of ESIT payload as class drivers?
> 
> Note that this here would need to also accept interrupt EPs:
> > +{
> > +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> > +		return 0;

Sounds reasonable, I'll see how to best take that into account in v5.

I wonder if I should adopt the name from the xHCI variant as the function
would be also used for interrupt endpoints.

-- 
Regards,

Sakari Ailus

