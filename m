Return-Path: <linux-media+bounces-13523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4A90C973
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 072A3285ECE
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D560143722;
	Tue, 18 Jun 2024 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JcaEa+Al"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3F91B966
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706636; cv=none; b=L+dWliZtMUnQHdz34PDa2h8+38hgXoU5SNxRFj4uS3XMlCQhMTMtYAyNHrT2pppYfnRgdXbHilKPw9n95mXGfwtSUHsxaE/txxaa3XLw29mBcC+Hr0dGgDRH0pIONuZu4DnXhuUOev/MQtvwwAXI3tWytzyKqCx20vHOM46j8YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706636; c=relaxed/simple;
	bh=YSjB+EqD7GfIp2Mqh8DIUazzPva+okVZmw9otbyBm9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guj8W0lAcb1nw37rDbieGFAsBVJIXM0GQgN2zyb55KPpLx/mTYuf2KTm9l28WBtP+qEJNkACxumRGzYbKlEhB7LTepOSwttRViZclIl6PectOTMPINy1KnSIZ0A3hm/ca+iKr8E7kiY+FJ7d2/xft/xmFe33NEXPLoeDiWP17/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JcaEa+Al; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718706635; x=1750242635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YSjB+EqD7GfIp2Mqh8DIUazzPva+okVZmw9otbyBm9s=;
  b=JcaEa+AlpLk82nb2O3SCEMBiA+UnSxgLPB1TVDBtjqUhBv+LIJBOwHn+
   Wv33gulGSF6CFuXHB52lQDBzMrbTSQeWgGB50/Ye+j/Pg2XG5KaHD9n4c
   cB/N0huZi+yWhWCRv+hXmfh8gkgFHazmkR3IaAS9jwDdc2zMXpoubZEty
   8h8fDCdHL4RTpIGhhZO92IQB99/AjaRyrpJCOQKve4AqOJJLzlrQ2O1GH
   7nTkBGaSNZjujKDTzjR92uwDfwpAJ3VoN3r8OuOYvWVE1eqONnzlC03mD
   CPObR3KzzcRaDKOAGivr4DMhzZxxea8YyfKW1K2BdFGMXOJ7mFEatfOfc
   w==;
X-CSE-ConnectionGUID: RQ5EzfOkTt+WnxwzEFcyrw==
X-CSE-MsgGUID: iBcjSEUDRKe84xx/S64bNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15287837"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15287837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 03:30:34 -0700
X-CSE-ConnectionGUID: 11kC4R8qS/SNh8pIefLcJQ==
X-CSE-MsgGUID: Tr0OKzJJQmmfKVFRx5FNVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42187373"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 03:30:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5A8BF11F7E1;
	Tue, 18 Jun 2024 13:30:30 +0300 (EEST)
Date: Tue, 18 Jun 2024 10:30:30 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 00/26] Media device lifetime management
Message-ID: <ZnFhxse4FoN3l2wr@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <7b5e8220-2081-439e-962f-01a4e7839cef@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b5e8220-2081-439e-962f-01a4e7839cef@xs4all.nl>

Hi Hans,

On Mon, Jun 17, 2024 at 01:55:53PM +0200, Hans Verkuil wrote:
> On 10/06/2024 12:05, Sakari Ailus wrote:
> > Hi folks,
> > 
> > This is a refresh of my 2016 RFC patchset to start addressing object
> > lifetime issues in Media controller. It further allows continuing work to
> > address lifetime management of media entities.
> > 
> > The underlying problem is described in detail in v4 of the previous RFC:
> > <URL:https://lore.kernel.org/linux-media/20161108135438.GO3217@valkosipuli.retiisi.org.uk/>.
> > In brief, there is currently no connection between releasing media device
> > (and related) memory and IOCTL calls, meaning that there is a time window
> > during which released kernel memory can be accessed, and that access can be
> > triggered from the user space. The only reason why this is not a grave
> > security issue is that it is not triggerable by the user alone but requires
> > unbinding a device. That is still not an excuse for not fixing it.
> > 
> > This set differs from the earlier RFC to address the issue in the
> > following respects:
> > 
> > - Make changes for ipu3-cio2 driver, too.
> > 
> > - Continue to provide best effort attempt to keep the window between device
> >   removal and user space being able to access released memory as small as
> >   possible. This means the problem won't become worse for drivers for which
> >   Media device lifetime management has not been implemented.
> > 
> > The latter is achieved by adding a new object, Media devnode compat
> > reference, which is allocated, refcounted and eventually released by the
> > Media controller framework itself, and where the information on registration
> > and open filehandles is maintained. This is only done if the driver does not
> > manage the lifetime of the media device itself, i.e. its release operation
> > is NULL.
> > 
> > Due to this, Media device file handles will also be introduced by this
> > patchset. I thought the first user of this would be Media device events but
> > it seems we already need them here.
> > 
> > Some patches are temporarily reverted in order to make reworks easier,
> > then applied later on. Others are not re-applied: this is a change of
> > direction, not development over those patches. It would be possible to
> > squash the reverts into others on the expense of readability, so the
> > reverts are maintained for that reason.
> > 
> > I've tested this on ipu3-cio2 with and without the refcounting patch (media:
> > ipu3-cio2: Release the cio2 device context by media device callback),
> > including failures in a few parts of the driver initialisation process in
> > the MC framework. I've also tested the vimc driver.
> 
> You need to convert at least one m2m test driver (vicodec and ideally also
> vim2m). M2M device have their own media controller setup, so it is good to
> have at least one converted.

My earlier objection to convert vim2m to managed media device lifetime was
that vim2m was obviously intended to be compiled without MC but it seems
since 016baa59bf9f6 CONFIG_MEDIA_CONTROLLER is selected for the driver.
Thus the related #ifdefs can be removed, too.

I'll add two patches for this, one that can be merged independently for
removing the #ifdefs.

-- 
Kind regards,

Sakari Ailus

