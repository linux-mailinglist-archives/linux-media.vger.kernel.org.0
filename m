Return-Path: <linux-media+bounces-10174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA748B3327
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D82CC28924C
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68464824B0;
	Fri, 26 Apr 2024 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4HdXmk+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647FE5B5BE
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714120987; cv=none; b=BeANMY/j/MVSzzfHG6fW376TANnlcx802nk5iqOLbbdAIdaZQh6Emk2XiCIfA6jd2n9Imv91Ha3uTaX3FLvXFIx1Wceni/ODslayR2my0tiprpIgdPtBcTpf2vu+QQWqsnrUX7OD73bqw1WORCegn7iyOGDRE9lLjDkScFlu/XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714120987; c=relaxed/simple;
	bh=THe1LwhkrglqXIEq91YlUhtMtCji9bAzsyPdchPG++8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Km8UXkgyDGzsgefUs4Gp9prPEww3fyvoI1zvp9Q5093BJ0y0IBO1lt8c35Y+aI3VI5tT9y7K8Gv6G6rMKP+JAKN3TEy4CLBNmWlLbHojwt4hmRWZ6bgmQhOj3GxsUCVPLC7N6Vq0rOddhwvFusioEMBcV3ULcAeZN5xnzGR84v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4HdXmk+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714120986; x=1745656986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=THe1LwhkrglqXIEq91YlUhtMtCji9bAzsyPdchPG++8=;
  b=C4HdXmk+u07LoIopAl/X+7jcW5JCt6PrOri3ZUKur18pu0aKxi/m2OoL
   TSx8cWHpjeoD+Hdc4blMSoNFx2hQoWI+Cd61oNnjGLEm/LoQfYd67DCvr
   RzS66/XOaj1C4fJmN2nMojJTw4N/kxSEKODctyxzgr7ZZo6N4gCfSeeAG
   UKkgNxjS4e4kYW+kWNkEKG+dY/u8u0kCvJloh5yXXHQMOPh2h/I07ONrL
   tYKho6877lCXa0i0Uefxzrb8T8UDsYRp1wTfYIh7Syp7TjwOC6aVUnqa9
   OvOK7KU3c15NE9GxRFvuAJcczdjEMVF3qHNE2uBf8ieZfoLkUiaWZQ1kT
   Q==;
X-CSE-ConnectionGUID: E0c/QAN2SUOayxkDb9DM7w==
X-CSE-MsgGUID: i2UA1BQ9Q9euF7YB4c4Vpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20463076"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20463076"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:43:05 -0700
X-CSE-ConnectionGUID: qUnhaa80S+i4Hd4arsWBTQ==
X-CSE-MsgGUID: ab5Ub4HkQCSs7nhaA0VXuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="62829120"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:43:04 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0E35411F855;
	Fri, 26 Apr 2024 11:43:01 +0300 (EEST)
Date: Fri, 26 Apr 2024 08:43:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH 2/3] media: Documentation: v4l: LINK_FREQ can be an
 INTEGER64 control
Message-ID: <ZitpFeiNt5FL3c0f@kekkonen.localdomain>
References: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
 <20240220130339.543749-3-sakari.ailus@linux.intel.com>
 <87dbeab5-4c61-403e-9805-da3bac673ffd@xs4all.nl>
 <ZitaOthZ9dnG5-1B@kekkonen.localdomain>
 <ba71685d-5eb8-414e-9893-1e72b1107dfd@xs4all.nl>
 <ZitlggwtyOwaMdw9@kekkonen.localdomain>
 <8446b3a3-c94e-4be5-ac2f-31d333830a56@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8446b3a3-c94e-4be5-ac2f-31d333830a56@xs4all.nl>

Hi Hans,

On Fri, Apr 26, 2024 at 10:38:26AM +0200, Hans Verkuil wrote:
> On 4/26/24 10:27, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Apr 26, 2024 at 10:12:37AM +0200, Hans Verkuil wrote:
> >> On 4/26/24 09:39, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Fri, Apr 26, 2024 at 09:22:40AM +0200, Hans Verkuil wrote:
> >>>> On 20/02/2024 14:03, Sakari Ailus wrote:
> >>>>> When a device passes through the video data while still having its own
> >>>>> receiver and transmitter, it can use the same frequency as the upstream
> >>>>> link does. The Intel MEI CSI device is an example of this. An integer menu
> >>>>> control isn't useful in conveying the actual frequency to the receiver in
> >>>>> this case.
> >>>>>
> >>>>> Document that the LINK_FREQ control may also be a 64-bit integer control.
> >>>>>
> >>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>>> ---
> >>>>>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>>>> index b1c2ab2854af..7a3ccb100e1d 100644
> >>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>>>> @@ -22,7 +22,7 @@ Image Process Control IDs
> >>>>>  
> >>>>>  .. _v4l2-cid-link-freq:
> >>>>>  
> >>>>> -``V4L2_CID_LINK_FREQ (integer menu)``
> >>>>> +``V4L2_CID_LINK_FREQ (integer menu or 64-bit integer)``
> >>>>>      The frequency of the data bus (e.g. parallel or CSI-2).
> >>>>
> >>>> I really think a new control should be created for this.
> >>>>
> >>>> As I understand it, V4L2_CID_LINK_FREQ gives a set of supported frequencies,
> >>>> and the application has to pick one (I think?). Is it supposed to be a
> >>>> read-only control? Some driver seem to set the READ_ONLY flag, and some do not.
> >>>> The documentation isn't helpful in that respect.
> >>>
> >>> This is read-only effectively in current IVSC implementation.
> >>>
> >>>>
> >>>> In the case of the Intel MEI CSI and similar devices a new control would be
> >>>> better, I think. Do I understand it correctly that for these devices it would
> >>>> always be a read-only control? I.e. it just reports the frequency, but applications
> >>>> cannot change it?
> >>>
> >>> How would you call the new control?
> >>>
> >>> V4L2_CID_LINK_FREQ_READ_ONLY?
> >>>
> >>> Originally the reason for changing LINK_FREQ for sensors was be part of
> >>> changing sensor's configuration to achieve a given frame interval.
> >>
> >> Will this new variant always be read-only?
> > 
> > At least for this purpose I think so. Apart from the sensor configuration,
> > I'm not aware of another use case for the user to change it.
> > 
> >>
> >> How about V4L2_CID_CUR_LINK_FREQ?
> >>
> >> I.e., it returns the current link frequency. That way it can also be
> >> used by drivers that implement V4L2_CID_LINK_FREQ.
> > 
> > It could, but the drivers already report this using V4L2_CID_LINK_FREQ.
> > It'd be extra driver code for little if any gain.
> 
> It's mainly for if we ever want to have consistent support for this
> control for all drivers to make life easier for applications.
> 
> In other words, supporting both controls (if we'd ever want to) wouldn't
> cause problems API-wise.

Apart from the sensor frame interval control, the users generally don't
care. It's for the CSI-2 receiver drivers which use a framework function to
obtain the value (it was amended in one of the three patches).

> 
> > 
> >>
> >> Better ideas are welcome :-)
> > 
> > V4L2_CID_LINK_FREQ_VALUE? V4L2_CID_LINK_FREQ2?? :-)
> > 
> 
> Hmm, I prefer CUR_LINK_FREQ, since that implies that it is a read-only
> control.

I'd be fine with that.

-- 
Regards,

Sakari Ailus

