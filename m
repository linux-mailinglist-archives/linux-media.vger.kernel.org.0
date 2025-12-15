Return-Path: <linux-media+bounces-48782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E2CBD3D5
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 10:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58D46302E160
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9095C32ABC8;
	Mon, 15 Dec 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzAo0c3W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB9423BCF3;
	Mon, 15 Dec 2025 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791602; cv=none; b=AmRub2BH87bb++fA58+VC1V8ZY0Q0H28RtHJtynntuDimPqZvPdhtdKT0JF60KWxnZoNB/xXRdGV/tNKYxmyn8H1/O0SRGDIDg/Scoio1xogB/0GJ5IcuHigM3LjV8peWV+buc7v7gQSbgoiLVDuFppJqXVEbPMlg/r37tPS6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791602; c=relaxed/simple;
	bh=Pt4quVBYWmoaMIPeeEHlsp/Eb4e9qXcbwudc2NTUoO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOYXl8TiJ5ZMGKvBMm2WELEvmxI3fbX/f3epe0FU810yC93UBUCZoy9i71P+fk9A3t+9AO1d5WHC+V81xXLDKnMEA/JMJFqRWmqj2O78Nh071kUyW2+gVtxPcdY+8VHfK93AmZK4wRQ+g5/beJIky5aooW/rwXSxGSB0efmy6Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzAo0c3W; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765791601; x=1797327601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Pt4quVBYWmoaMIPeeEHlsp/Eb4e9qXcbwudc2NTUoO0=;
  b=gzAo0c3WR4mY6nK4isPOJlU9P9/CqSi/EN4oMo/zq9EzKgUKOWT4W6B4
   jFaOnluvjh3Rst/o87ZtFMKeBjh7Ql802rDo+Ryq+Dl0eQucEY02jRx1l
   7Z3bRBpkK+K51slR1ZxF57NcAeGZlVGu0p+mLNQrnX8PKvU7pw3ib8wSK
   ukPOt0WRwgPP8/g7S/lXJooIvr7kNGoOklmHkVyT11z//QntILYbFshT8
   eW4xUZCZPnLmZcXVBDVE7DI7sq3f03+W9dthUccqET0wbulryyT/n7GrH
   aGbtyNCP2AuEEyLG/OFn4XcIEAyScSDpSwgUv391kmuAgSbe8xyxHoidG
   w==;
X-CSE-ConnectionGUID: iN2D7MNZS8e3uPgYTHuDzw==
X-CSE-MsgGUID: T62FOf92Q12Opf1eEZB9yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="79144494"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="79144494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 01:40:00 -0800
X-CSE-ConnectionGUID: pBlmkE7pTjidDV1szuvXlg==
X-CSE-MsgGUID: WsqdzwHfTsK0+ch8WB7Wxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197671922"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.40])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 01:39:56 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0DB5611F914;
	Mon, 15 Dec 2025 11:40:04 +0200 (EET)
Date: Mon, 15 Dec 2025 11:40:03 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
	dave.stevenson@raspberrypi.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mchehab@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
Message-ID: <aT_Xc6LR161QBRFp@kekkonen.localdomain>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>
 <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
 <CAFEp6-1Tdmr5v0r+q0qeOG6qqA-hiBaF1iTEcmhBA0oTjLgbgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-1Tdmr5v0r+q0qeOG6qqA-hiBaF1iTEcmhBA0oTjLgbgg@mail.gmail.com>

Hi Loic,

On Mon, Dec 15, 2025 at 10:35:15AM +0100, Loic Poulain wrote:
> Hi Sakari,
> 
> On Mon, Nov 17, 2025 at 6:30 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Loic,
> >
> > On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> > > Ensure reset state is low in the power-on state and high in the
> > > power-off state (assert reset). Note that the polarity is abstracted
> > > by the GPIO subsystem, so the logic level reflects the intended reset
> > > behavior.
> >
> > That's an interesting approach to fix DTS gone systematically wrong.
> >
> > I was thinking of the drivers that have this issue, too, but I would have
> > introduced a new GPIO under a different name (many sensors use "enable",
> > too). Any thoughts?
> 
> Apologies for missing your point earlier. We can’t really name it
> enable, as it performs the opposite function and that would be
> confusing in the device tree description. A property like reset2 would
> be more accurate, but I suspect such a binding wouldn’t be acceptable
> from a device tree/bindings perspective.

Many sensor datasheets document a pin called "xshutdown" or alike. That's
not exactly "reset" or "enable" but it can be mapped to either and this can
be seen in the existing bindings. The polarity is effectively the opposite,
yes, but does that matter?

-- 
Regards,

Sakari Ailus

