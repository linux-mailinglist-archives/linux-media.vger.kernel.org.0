Return-Path: <linux-media+bounces-27960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7348DA59558
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C77003A5031
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9542B22A4CD;
	Mon, 10 Mar 2025 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRxZmoDz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A3322A1D1;
	Mon, 10 Mar 2025 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611398; cv=none; b=p7ZiMBXUEfM9UjTjyJQg9k4d74LN9Ru38C86EHpjHTL6P3oaWsuNxPwjz9VduCWwkadaSL+fJJEyTQe0AO2mOEG4BzE3KwhFYtfegdARUSEilBX9FlG05dL3RbfepORnsmw4KiH+CONwiT2ou8fCzG0qk6UoHK+pZo/xOqCKTN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611398; c=relaxed/simple;
	bh=5N73qh8EifsQZkTSxmRw/xoma2k5h3h+IwdCrN3t9KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNpPem6cAI18EmA0ho7pq09boBpIo5RclMYREgcvfOJiYZ/Vm3EnLwyTBQvGSun8XqpJ/fEdLxx5AVqPLACbE05UTBxp7oVNxB5F3OodkoTXzCsyvrVp39UCAsK7NuIAC6x19kmWcLmaYa++tbs8XrTDVhVlBlBSkhOYQHVxoGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRxZmoDz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741611396; x=1773147396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5N73qh8EifsQZkTSxmRw/xoma2k5h3h+IwdCrN3t9KI=;
  b=DRxZmoDzzOHNC298/f5pvO5hKBtetUCCHVwTPF3w82/m7jtc/meDNHOJ
   eumVaz9OX0VdXph6mW40/YmbhGYKM2JkAtWth0DY1HexJqsDNX9njOgYY
   jabwVBbQ8EiGp4c9agKVjk/dYJIYZYr6iuqZxOWrZrABH4HmuqPKA5oZv
   Cfzv/B2DdvT4eb5VoE9I4pX26ZGmvxwSxwNqmJaeZvWDg6SjDjT4IQTXF
   bujWHlxoMz0gCslF4Q1OdJAO/n5DOJ45KKx+DI7CcU5IliJjuPCU8VU5O
   RNqDmP2J/tM2UuEfz2iXMsVPJsUzTda2jStqOWxGOH+FkT3KQ157Q3gJj
   Q==;
X-CSE-ConnectionGUID: //pv2UtQQW6cRKEanukGhA==
X-CSE-MsgGUID: 7phyuPT6TReSxqr/jfNwHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42796416"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="42796416"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 05:56:35 -0700
X-CSE-ConnectionGUID: BMf4DkPJQBqIMgIjBfTvNw==
X-CSE-MsgGUID: gXdBxlTFQyakFdSJpqqDpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="143185736"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 05:56:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 46BC811F7E5;
	Mon, 10 Mar 2025 14:56:30 +0200 (EET)
Date: Mon, 10 Mar 2025 12:56:30 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com, naush@raspberrypi.com,
	mchehab@kernel.org, hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] media: v4l2-common: Add a helper for obtaining
 the clock producer
Message-ID: <Z87hflLo9Oz3kWja@kekkonen.localdomain>
References: <20250227092643.113939-1-mehdi.djait@linux.intel.com>
 <Z8rd3ipjkbaE4zfc@kekkonen.localdomain>
 <Z8rfDVow6hDeuZRS@kekkonen.localdomain>
 <hg2es6fl4yty3zo6gvf6xabw6kzztaz6awqslvxvumn5hhhsq5@d6xz7khblt7u>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hg2es6fl4yty3zo6gvf6xabw6kzztaz6awqslvxvumn5hhhsq5@d6xz7khblt7u>

Hi Mehdi,

On Mon, Mar 10, 2025 at 01:11:33PM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Fri, Mar 07, 2025 at 11:57:01AM +0000, Sakari Ailus wrote:
> > On Fri, Mar 07, 2025 at 11:51:58AM +0000, Sakari Ailus wrote:
> > > > +	int ret;
> > > > +
> > > > +	clk = devm_clk_get_optional(dev, id);
> > > > +	if (clk || IS_ERR(clk))
> > 
> > I forgot this bit earlier. The IS_ERR() check is redundant.
> > 
> 
> Wouldn't you say that this helps with readability even if it is
> redundant ? This will warn the users of this helper that the call
> may fail and return early ?

If you want to note that the returned clk may be valid or an error, I'd add
a comment for it.

-- 
Regards,

Sakari Ailus

