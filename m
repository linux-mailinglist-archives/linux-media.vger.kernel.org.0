Return-Path: <linux-media+bounces-23226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB8E9ED837
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 22:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C4C2827D5
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 21:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415E01DA632;
	Wed, 11 Dec 2024 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVY1kenb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF431259498
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 21:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733951533; cv=none; b=N4Ww02giCPLVfc8E8fV4lLkN01GUf5Ph+C92a725deaJyNe8Zh68bSnajDuC3Zu2Gqe9xJA9agojBJUVrLOy7rQqkh4znd2KLAUIVQyxv9t2Vhu/dHCpxubkycnbt2/KRj+3SRO9IcqMXxcHw9hkv87n12AeGmQxAzX36u2Xolg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733951533; c=relaxed/simple;
	bh=XVySc6o3E018qaJymQPo9eEIUM3AAP1yrqNUeL6V4Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3qduw4yuFR+CGMKlCMFp0e++/L/J5QV3hrMF4Sw4gSFePraKkOSnfzsmIwq1tz4KL5XIit1+lVnb4Zlmdo41vnGr5PbxC7Qllon8+hH+ro6hNPZGF1w2USLZtYyTQQKHMtIyUcNIEAHOJBHeBScGauhtMarJKJZR1WcaXysZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVY1kenb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733951532; x=1765487532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XVySc6o3E018qaJymQPo9eEIUM3AAP1yrqNUeL6V4Sk=;
  b=LVY1kenb+5T7qoy4TJdEbcvMknt0XZ5DuXGMeclDaUTJhzNHNn6x6PKM
   wWYmtMjieF5VwiiQFtqEMfKfIyaejhIWUc/YtqKC98ocqQTS6wCAm4jH2
   0VHQgNHICRdCo04CU0N0eBJ3pxZGJIdYFlVwGY14es0Bulqd6ehEwq5QE
   BQpdWi7HlJVQ+ChBUhpAnptb9nKEwgGyq+/DbQNhCQ+rMXDh/KcQyaTeS
   YjhWNWTSE6dh1V98KGeFY0+wrwcabzEWmYXZ2KaIukjJeMIlKn4+pX8VS
   lTIgCif6M4otsom3lwzYylOnsfMWQpBNq5/efPTsNt6H6rvZZQB5ETUgU
   A==;
X-CSE-ConnectionGUID: lAkXFASgSuSBDdMJPyONqg==
X-CSE-MsgGUID: tgw5zr6xQJyDPuOS1cgnQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45735431"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45735431"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 13:12:11 -0800
X-CSE-ConnectionGUID: 8zznr5P3T6SVwac61IDpXg==
X-CSE-MsgGUID: 8+1BQwmhSKSKCjvcfAyggw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="95808146"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 13:12:08 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A0A6B11FADC;
	Wed, 11 Dec 2024 23:12:05 +0200 (EET)
Date: Wed, 11 Dec 2024 21:12:05 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
	balamurugan.c@intel.com, wei.a.fu@intel.com
Subject: Re: [PATCH v4] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <Z1oAGfRs28hgo-sc@kekkonen.localdomain>
References: <20241129061546.2237511-1-dongcheng.yan@intel.com>
 <Z1hOBpwLfB_wfRwL@kekkonen.localdomain>
 <66e2d69c-9413-48dc-9dcc-1df7576ddf2d@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66e2d69c-9413-48dc-9dcc-1df7576ddf2d@intel.com>

Hi Dongcheng,

On Wed, Dec 11, 2024 at 10:39:53PM +0800, Yan, Dongcheng wrote:
> > > +static int lt6911uxe_init_controls(struct lt6911uxe *lt6911uxe)
> > > +{
> > > +	struct v4l2_ctrl_handler *ctrl_hdlr;
> > > +	s64 pixel_rate;
> > > +	int ret;
> > > +
> > > +	ctrl_hdlr = &lt6911uxe->ctrl_handler;
> > > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	lt6911uxe->link_freq =
> > > +		v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL, V4L2_CID_LINK_FREQ,
> > > +				       sizeof(lt6911uxe->cur_mode.link_freq),
> > There's just a single entry in the array. sizeof() will get the size in
> > bytes, which is 8! Use 1 here instead.
> 
> Hi Sakari, I used CUR_LINK_FREQ before, which refers to your patch:
> 
> <URL:https://lore.kernel.org/linux-media/20240426145538.654212-1-sakari.ailus@linux.intel.com/>.

There were a few iterations of the set and this is
where it eventually ended:

<URL:https://lore.kernel.org/linux-media/20241210075906.609490-1-sakari.ailus@linux.intel.com/T/#t>

I intend to include that in a PR soonish.

> But I am worried about the progress of this patch.
> 
> If you have expectations for it, I can modify it to CUR_LINK_FREQ.

-- 
Kind regards,

Sakari Ailus

