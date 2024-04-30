Return-Path: <linux-media+bounces-10405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30D8B6BCD
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 09:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0CA91C21F19
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 07:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6ECE823CC;
	Tue, 30 Apr 2024 07:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wa8ibWt9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669538396
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462269; cv=none; b=n/0DCbnIlP6QSBZp/CKkWpOuW2vOm2SB8xNVv8nob+52b+f8z9YkP1J3UrIyYCDqKGcBi3YXAMBPvrIct5f4Urd+6pGg5m6rb8twJE3z485pZBMZYvlNLZmBdAyEquTbM0Gcu5psRGwg9Nms8qEYJ5REoM8e4EJbSk1d0ybRGzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462269; c=relaxed/simple;
	bh=uh/ztwXauYiWMGDZ5AmgKSI4O/xu0BLVOREQSuEho1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZS/Tt/6l5KLJvdJSUgj82Qj+0ZaqRNZy+EA1JjmXbO/I/nxqPxesdasilvuxQyIc9luEb5IY5IJkMhrtLJtC+dBKrxmsKGA6nDDQnT1qGm/2Q6eyF4u0kaRe6RjLzboFpG8fxhqrd5ejxelPh5p2nHP5p1S+YR4L1yaJWnZS3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wa8ibWt9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714462267; x=1745998267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uh/ztwXauYiWMGDZ5AmgKSI4O/xu0BLVOREQSuEho1g=;
  b=Wa8ibWt93eQiCkjuE84Hi0AX/z3by0ghlpPAmFfsRon/R5aW7dw4VTt7
   c2ZIEjM2wqpta0FwDP8iLO1K4o0X38z2fCfZGQDUHflXQiL1/r8660Gpa
   GNQQOq14zzAPv1u9bajhpdQByHukMlrp+3hYzuyVEosb6c5JF3xg+Dx3V
   RvEMJvpgMeGPMp5v46BquLwEqz0ibX/xbwjVMfdkGmgKNY/C3STa8YoBg
   OviQ+P3tBrRrt6RcPjLRq6QBli80SHcViwZ1XJZyKgfZu6JQMCYEZz0YF
   gRz5ipjIC2eyLAUBtsWMVgc5fsoBOhWKPowPVRLYrncc57DeIMz4rgmbd
   w==;
X-CSE-ConnectionGUID: OqA3jKkeQAKHy32nQXvSlA==
X-CSE-MsgGUID: yU15OjSTQJOkyVj2wN9H2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10307821"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10307821"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 00:31:06 -0700
X-CSE-ConnectionGUID: vbVT3FVBTCuIyjjykSn9oA==
X-CSE-MsgGUID: djAgA1sxRamsOQFN/gsIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="31172578"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 00:31:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D487311F830;
	Tue, 30 Apr 2024 10:31:01 +0300 (EEST)
Date: Tue, 30 Apr 2024 07:31:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v4 3/4] media: Documentation: Update link frequency
 driver documentation
Message-ID: <ZjCeNcF1nkt6WKUS@kekkonen.localdomain>
References: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
 <20240429190852.1008003-4-sakari.ailus@linux.intel.com>
 <ojsquq4vgzyxubla4uv6ntgm4p7zoqpn5vqqza5dmevxlosy6l@2icfz6thrffp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ojsquq4vgzyxubla4uv6ntgm4p7zoqpn5vqqza5dmevxlosy6l@2icfz6thrffp>

Hi Jacopo,

On Tue, Apr 30, 2024 at 09:23:52AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Apr 29, 2024 at 10:08:51PM +0300, Sakari Ailus wrote:
> > Add the get_mbus_config() as the means for conveying the link frequency
> > towards the receiver drivers.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/tx-rx.rst | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > index 29d66a47b56e..2f22a1534da9 100644
> > --- a/Documentation/driver-api/media/tx-rx.rst
> > +++ b/Documentation/driver-api/media/tx-rx.rst
> > @@ -49,6 +49,10 @@ Link frequency
> >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> >
> > +For devices where the link frequency is read-only, the link_freq field of struct
> 
> A control can be 'read-only' as well.
> 
> What about something along the lines of:
> 
> For devices where the link frequency doesn't need to be exposed to userspace,
> the link_freq field of struct

I think we could use something like that. The LINK_FREQ control indeed
allows choosing this from the user space but other than that it has little
use AFAIU.

> 
> > +v4l2_mbus_config is recommended over controls for conveying the link frequency
> > +to the downstream driver in the pipeline.
> > +
> >  ``.s_stream()`` callback
> >  ^^^^^^^^^^^^^^^^^^^^^^^^
> >

-- 
Kind regards,

Sakari Ailus

