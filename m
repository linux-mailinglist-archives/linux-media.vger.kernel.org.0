Return-Path: <linux-media+bounces-10171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E798B3247
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14D3F283818
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA9F13C9B3;
	Fri, 26 Apr 2024 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="do4zrMrS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D6B33981
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714120073; cv=none; b=QuV3yWk85Ptk2cyOxWqxQEoeEpAox5Jvk4dWdu+QzyK6rgF23OUKrrKXX6c/QvGox2uZhCQQj7SxOf+1vp57yCvZHdgCRcF6dby2eBVdeaiQQGlEAaGbc7gbyxv9lDQUsL4Qtb3E4rdNeHzAde8tR1OX9cBX5TQTqwf762wiNO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714120073; c=relaxed/simple;
	bh=MMDcna6pV+fqYHLs1uwrkbUS5wxNC96lPRdh3djBkSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4s+ZixGEInsv+xrcT8oD6ASAUBfzESjrcQEG/HufOcZX2b/Z1UlbvaWmlI4saiJZKp/UlLqNrqrMVa7eQKM43fXxOA4cOE+2IHoCLXHYwyKojC5KXgNFe3YrMreLqa5zQ2xumCAiSyAUPNrcUmE22/P1YuIOGyFZ0recbSU/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=do4zrMrS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714120071; x=1745656071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MMDcna6pV+fqYHLs1uwrkbUS5wxNC96lPRdh3djBkSQ=;
  b=do4zrMrSBJ3Mk1YK2fMoVw1dCxL1I1g++jqJD++9+R1nu1zz6zrO7Nrm
   Z5IsvjNN46Oirr48lFLOSPLwaLGAsFp7oC+EpctnwtMtmcxyPJ/F0jN3C
   krC5O4dD7YMtYiLrGZe4bLfjdy6rG0PCr6Xz8fsuz+C/9NA4oPHdcg/rN
   LieUE1j/G5cDIABKMhkc6KfH7q+UvYwo6hYT4qXkDyO/Li3ifZj4NmQ4X
   jbr7PDq2fC86xkjuS06DhPQMztvO1PrhbTFnU5rgW6pLNgCMIBnPT6js6
   Jz9VVCfQFEd932RhYHw/sC1zp/SK7pig8ZiEPLL9C9w2GTTtnh8xuWpOV
   w==;
X-CSE-ConnectionGUID: TfjIq9CdSg6KPauc6yHziw==
X-CSE-MsgGUID: 1I1nILFtSTukexTew/Qdyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13635431"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="13635431"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:27:50 -0700
X-CSE-ConnectionGUID: dA/PVMYmSc2ec3+6RNye/g==
X-CSE-MsgGUID: cdCmTwWZTde+SlAEAg00oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30006435"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:27:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 75DC711F855;
	Fri, 26 Apr 2024 11:27:46 +0300 (EEST)
Date: Fri, 26 Apr 2024 08:27:46 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH 2/3] media: Documentation: v4l: LINK_FREQ can be an
 INTEGER64 control
Message-ID: <ZitlggwtyOwaMdw9@kekkonen.localdomain>
References: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
 <20240220130339.543749-3-sakari.ailus@linux.intel.com>
 <87dbeab5-4c61-403e-9805-da3bac673ffd@xs4all.nl>
 <ZitaOthZ9dnG5-1B@kekkonen.localdomain>
 <ba71685d-5eb8-414e-9893-1e72b1107dfd@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba71685d-5eb8-414e-9893-1e72b1107dfd@xs4all.nl>

Hi Hans,

On Fri, Apr 26, 2024 at 10:12:37AM +0200, Hans Verkuil wrote:
> On 4/26/24 09:39, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Apr 26, 2024 at 09:22:40AM +0200, Hans Verkuil wrote:
> >> On 20/02/2024 14:03, Sakari Ailus wrote:
> >>> When a device passes through the video data while still having its own
> >>> receiver and transmitter, it can use the same frequency as the upstream
> >>> link does. The Intel MEI CSI device is an example of this. An integer menu
> >>> control isn't useful in conveying the actual frequency to the receiver in
> >>> this case.
> >>>
> >>> Document that the LINK_FREQ control may also be a 64-bit integer control.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>> index b1c2ab2854af..7a3ccb100e1d 100644
> >>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>> @@ -22,7 +22,7 @@ Image Process Control IDs
> >>>  
> >>>  .. _v4l2-cid-link-freq:
> >>>  
> >>> -``V4L2_CID_LINK_FREQ (integer menu)``
> >>> +``V4L2_CID_LINK_FREQ (integer menu or 64-bit integer)``
> >>>      The frequency of the data bus (e.g. parallel or CSI-2).
> >>
> >> I really think a new control should be created for this.
> >>
> >> As I understand it, V4L2_CID_LINK_FREQ gives a set of supported frequencies,
> >> and the application has to pick one (I think?). Is it supposed to be a
> >> read-only control? Some driver seem to set the READ_ONLY flag, and some do not.
> >> The documentation isn't helpful in that respect.
> > 
> > This is read-only effectively in current IVSC implementation.
> > 
> >>
> >> In the case of the Intel MEI CSI and similar devices a new control would be
> >> better, I think. Do I understand it correctly that for these devices it would
> >> always be a read-only control? I.e. it just reports the frequency, but applications
> >> cannot change it?
> > 
> > How would you call the new control?
> > 
> > V4L2_CID_LINK_FREQ_READ_ONLY?
> > 
> > Originally the reason for changing LINK_FREQ for sensors was be part of
> > changing sensor's configuration to achieve a given frame interval.
> 
> Will this new variant always be read-only?

At least for this purpose I think so. Apart from the sensor configuration,
I'm not aware of another use case for the user to change it.

> 
> How about V4L2_CID_CUR_LINK_FREQ?
> 
> I.e., it returns the current link frequency. That way it can also be
> used by drivers that implement V4L2_CID_LINK_FREQ.

It could, but the drivers already report this using V4L2_CID_LINK_FREQ.
It'd be extra driver code for little if any gain.

> 
> Better ideas are welcome :-)

V4L2_CID_LINK_FREQ_VALUE? V4L2_CID_LINK_FREQ2?? :-)

-- 
Regards,

Sakari Ailus

