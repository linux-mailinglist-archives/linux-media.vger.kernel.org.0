Return-Path: <linux-media+bounces-61926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLoJMFfeCmpV8wQAu9opvQ
	(envelope-from <linux-media+bounces-61926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:39:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773F569E17
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07C1B30185AF
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBB83E51E9;
	Mon, 18 May 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hajkxO1b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2256837268C
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097172; cv=none; b=HLluN0mrSHcrgpbGp/s0fKVkjL6ZSMYVA9+foGCy8TMz8gZcKN2v6tZRguPVERpaL3hJXzDpiPWMhTHTplOFDlua3PKSCXzfiZRmG9zFVQsJfKeV75345legXA9icUOjje0rGcbKvMBVIeJXao7rUJJtptwXZOtIRj5jbgZBsaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097172; c=relaxed/simple;
	bh=utweo0nm6hve4T1aR6CaJB8JqAZ5GKFX9O70rPoMwWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKUqkaiP8HuVxrqYxVUjouLHmApbT4R2x6drHrV4W/7vpuJhL7ah8TIajk8nJnfwvLqdDwjGbhbeKA2yLrAwl36UY7ha+aeO2AwrG3jAyYq7eCuB7EjcQ7/csl1qe57tyKM591uZVksSreuJKD+RBgFvd4HQ7mTmD/1GjMprJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hajkxO1b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779097171; x=1810633171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=utweo0nm6hve4T1aR6CaJB8JqAZ5GKFX9O70rPoMwWI=;
  b=hajkxO1bydn/QFa8Nt+CrE/ZijjlGs1B+4LUT4jVig7uySUtGVhJAIkH
   lDFX0i0g9rD/yYsVpof2kKs+V06uuVNt3pnoGVKssPdMLEhBmIzjqa8kf
   oYH8kJYKXJiWoJyC8XwMMhitV6KDeR/iyl6m3j7WLsuwS5vHxXBVrhy8B
   VPLnoo5eupTIVpsbSK/PROGfv1hhCy1Z8wGAIDGCin+ry7W2h1f5hX8ib
   wtPhD7leMxw/J6nITOCuv+2bLsnnKSE6ThNdYdcRCWYq2ZQ5o8nyWOTqc
   3/KhtYtg1wv+Vv81L5PmjPJBmk1JNY8DIhKtq68xghddPj0D1ami6Xuqy
   g==;
X-CSE-ConnectionGUID: WaayFLLcSbedAA10wAsFkw==
X-CSE-MsgGUID: j5/uT24/S1KilovPriMZJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="105406466"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="105406466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 02:39:30 -0700
X-CSE-ConnectionGUID: WE6JLBTiSS6QCDgoH46EAg==
X-CSE-MsgGUID: vZl6Y9aMS2WSJujsT7k1jg==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 02:39:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3911A11F70F;
	Mon, 18 May 2026 12:39:30 +0300 (EEST)
Date: Mon, 18 May 2026 12:39:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 03/17] media: v4l2-subdev: Prepare for changes in getting
 frame descriptors
Message-ID: <agreUuTv5wB7vZ8z@kekkonen.localdomain>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-4-sakari.ailus@linux.intel.com>
 <agT1KlNbw1ISSJu5@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agT1KlNbw1ISSJu5@lizhi-Precision-Tower-5810>
X-Rspamd-Queue-Id: 2773F569E17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61926-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Frank,

Thanks for the review.

On Wed, May 13, 2026 at 06:03:22PM -0400, Frank Li wrote:
> On Wed, May 13, 2026 at 01:43:44PM +0300, Sakari Ailus wrote:
> > Introduce v4l2_subdev_alloc_frame_desc() and v4l2_subdev_free_frame_desc()
> 
> Sorry, where v4l2_subdev_alloc_frame_desc() ? do you means
> v4l2_subdev_get_frame_desc() ?

Yes, I renamed the function and forgot to update it here. I'll fix this for
v2.

-- 
Sakari Ailus

