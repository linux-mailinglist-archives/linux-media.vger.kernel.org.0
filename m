Return-Path: <linux-media+bounces-13475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F1590B8D8
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 20:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 871421C23C6D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4CB195381;
	Mon, 17 Jun 2024 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWg+ppS4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBC51957F4
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647155; cv=none; b=GRaljrwidnN+0gBHrSo474GwCovw6gxhQ5YrONa2++hky2txBJ3YvMxpZnSZl1Z8CtVdXrlkvbbECIZKYOWlRxw99QZ2GyjFkH9hfnYWADohKTRT2DNuY9JrdSTdc2i3xwkEj1kFPto15bQMg/m0k8Gwu4UNtcCGbKfzole5vAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647155; c=relaxed/simple;
	bh=jsIPw3l/PkUOMXN6xdYi9LfwxdZx6oY3P5JhL2FG5y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cw3qIMGCx+xWZOufEjyr/OYLWfTsqZq2yL6LXmPmGl2FHOtWSOTdTqCZS7UZdIzu6sNzKWqX6FfbRzluGUDY18mbnqaH0bWtulSTibFfjqQsRzhulYrzq0zaPxGXeqWJQxR4/Dyf1qaQMd+R3ptuPIWbLUpXPG19ohWyHs9U71k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWg+ppS4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718647154; x=1750183154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jsIPw3l/PkUOMXN6xdYi9LfwxdZx6oY3P5JhL2FG5y0=;
  b=CWg+ppS4W0bo/iA5Ca9fRyj1lCF33mIfQt8HkN+0YYx4bl8QSiDO7x/J
   kmgjc9wf9ghec6saalwvDvlpBEWBOJ0dNOiZmB2KQ3nb4SeSh8SUZyrer
   g1MzICd53+q7Gd/uxo4EOCiH1j63qon2NfS7/cpz38rkTKq3XfnNICfBU
   DccsRd4poSt/jSVC2Nb0C1UyWze+YoqxNimQeqGhdMvGggq3sLn5Y9Pk7
   KkqLbTGVipJ5AApVZXMJRHLpeookEFdoIZXG5NaE1M4lBaYPxe4Zcfjh4
   pM55wS+CAlWetUSnct/BQoLO+XKwjY3hfOtf8/01zQEEpip7ZXFL1d7pq
   Q==;
X-CSE-ConnectionGUID: ABojFdDWRwu4UIKaT2um5g==
X-CSE-MsgGUID: VLY8HKAtThShXqCJhb6gQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15327979"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15327979"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:59:14 -0700
X-CSE-ConnectionGUID: 3JLQezOQTaSNabdZMu3hSA==
X-CSE-MsgGUID: LgYQzBtDQ/u/5eHhFN8Hlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="45809378"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:59:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 970D611F9DB;
	Mon, 17 Jun 2024 20:59:09 +0300 (EEST)
Date: Mon, 17 Jun 2024 17:59:09 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 24/26] media: mc: Warn about drivers not releasing
 media device safely
Message-ID: <ZnB5bXDPyMoWS96h@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-25-sakari.ailus@linux.intel.com>
 <4aa8d1e2-4863-465e-a0f9-e25d88f35c5a@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aa8d1e2-4863-465e-a0f9-e25d88f35c5a@xs4all.nl>

Hi Hans,

On Mon, Jun 17, 2024 at 12:40:31PM +0200, Hans Verkuil wrote:
> On 10/06/2024 12:05, Sakari Ailus wrote:
> > The media device and associated resources may be released only when its
> > memory is no longer used. Warn about drivers not doing this, but instead
> > releasing the resources at driver unbind time.
> 
> I think this should be folded in the previous patch.
> 
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/mc/mc-device.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > index 8cdd0d46e865..51836faa6d1a 100644
> > --- a/drivers/media/mc/mc-device.c
> > +++ b/drivers/media/mc/mc-device.c
> > @@ -822,6 +822,9 @@ int __must_check __media_device_register(struct media_device *mdev,
> >  		ref = kzalloc(sizeof(*mdev->devnode.ref), GFP_KERNEL);
> >  		if (!ref)
> >  			return -ENOMEM;
> > +
> > +		dev_warn(mdev->dev,
> > +			 "Set mdev release op to safely release resources!\n");
> 
> I think this needs a comment as well. Basically stating the same as the
> commit log message.

I'll address these for v5.

-- 
Sakari Ailus

