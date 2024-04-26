Return-Path: <linux-media+bounces-10166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 099738B3180
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 09:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41676284C4C
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 07:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D9113C3DF;
	Fri, 26 Apr 2024 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGT/iUE7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158A31E884
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714117184; cv=none; b=GgTt2pJjpYKaiOXvlSMlcExazLKAEH/YP6CGdRxsZIhikz91kmyS5Bwg0/sPXQApkjmawJhHbOFwlMmJUHexIE/ZKVQVrx0C+WN/JWclGF0cSYxTIwRzaam1ESqiLHVSc5KBZrEltTqnayWKTtBls/0hhzAnCW/xA5nMmHVyD5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714117184; c=relaxed/simple;
	bh=nYDsAQ7yX+mNA9lzyvX/2GLfMbFseCT7k/E7dG8VAhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5+fPiS0baNFkENrX95UnWatdefc+Q/naBb1o9c9HKbfQiY7uLUienL02FY+YH2QD0vhgESzPNTlTVihjpt9AmcPIzEmODYQR4FqcGU3zi4VquTeC8Nc2dQLZaK5wD1HnszCuWl1abdgCU46xVtPCG/1jkzmNtxcL/KBdQJMik8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGT/iUE7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714117183; x=1745653183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nYDsAQ7yX+mNA9lzyvX/2GLfMbFseCT7k/E7dG8VAhU=;
  b=BGT/iUE71ws19YyCel8jhqN+Xofp8JP+6ZADAsUrtG4JbKSr1hRugO55
   tLAMsruGKCPpHWWAdFRh2VFKmzwBl3XE9DoBlSISz371SBFjfEyaDaCRp
   DusdmmSdaAXOzG4AbCBEDgY84RzUf0sUq3edusY6QvDrTtPfZb4YFiAOv
   S+KB9aFiQiVwCpmYg7KuCbI5WZydvHT84HS3j1UYEnkrftA7doCWXYXQi
   IY6stcAykSOr1kTSMso8eyVHTFEbBESbG4R6JMeTcnRME4n6Kew5u7NPm
   CgwdWOUIMOLiEBh9n2U50E+rw4RfGB+bJoYZ3Pz+f+dJoCxKWg4atUCd9
   g==;
X-CSE-ConnectionGUID: 3o895UakSmeZYAazobhpiQ==
X-CSE-MsgGUID: K1OAO+3PQV+TkeSp08B0gA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="35232327"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="35232327"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 00:39:42 -0700
X-CSE-ConnectionGUID: G5J8ofmEQBab81o2iGIjLw==
X-CSE-MsgGUID: y9ZuAM+/TR+VhvSQ5XAkug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="29994204"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 00:39:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2B94711F855;
	Fri, 26 Apr 2024 10:39:38 +0300 (EEST)
Date: Fri, 26 Apr 2024 07:39:38 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH 2/3] media: Documentation: v4l: LINK_FREQ can be an
 INTEGER64 control
Message-ID: <ZitaOthZ9dnG5-1B@kekkonen.localdomain>
References: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
 <20240220130339.543749-3-sakari.ailus@linux.intel.com>
 <87dbeab5-4c61-403e-9805-da3bac673ffd@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87dbeab5-4c61-403e-9805-da3bac673ffd@xs4all.nl>

Hi Hans,

On Fri, Apr 26, 2024 at 09:22:40AM +0200, Hans Verkuil wrote:
> On 20/02/2024 14:03, Sakari Ailus wrote:
> > When a device passes through the video data while still having its own
> > receiver and transmitter, it can use the same frequency as the upstream
> > link does. The Intel MEI CSI device is an example of this. An integer menu
> > control isn't useful in conveying the actual frequency to the receiver in
> > this case.
> > 
> > Document that the LINK_FREQ control may also be a 64-bit integer control.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > index b1c2ab2854af..7a3ccb100e1d 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > @@ -22,7 +22,7 @@ Image Process Control IDs
> >  
> >  .. _v4l2-cid-link-freq:
> >  
> > -``V4L2_CID_LINK_FREQ (integer menu)``
> > +``V4L2_CID_LINK_FREQ (integer menu or 64-bit integer)``
> >      The frequency of the data bus (e.g. parallel or CSI-2).
> 
> I really think a new control should be created for this.
> 
> As I understand it, V4L2_CID_LINK_FREQ gives a set of supported frequencies,
> and the application has to pick one (I think?). Is it supposed to be a
> read-only control? Some driver seem to set the READ_ONLY flag, and some do not.
> The documentation isn't helpful in that respect.

This is read-only effectively in current IVSC implementation.

> 
> In the case of the Intel MEI CSI and similar devices a new control would be
> better, I think. Do I understand it correctly that for these devices it would
> always be a read-only control? I.e. it just reports the frequency, but applications
> cannot change it?

How would you call the new control?

V4L2_CID_LINK_FREQ_READ_ONLY?

Originally the reason for changing LINK_FREQ for sensors was be part of
changing sensor's configuration to achieve a given frame interval.

-- 
Regards,

Sakari Ailus

