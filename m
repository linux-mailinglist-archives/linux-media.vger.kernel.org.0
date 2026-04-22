Return-Path: <linux-media+bounces-59280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMK/Dd5s6GkSKQIAu9opvQ
	(envelope-from <linux-media+bounces-59280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:38:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB574427B5
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC9F53011529
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2B03246F0;
	Wed, 22 Apr 2026 06:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilTBTGa+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5262121CC5A;
	Wed, 22 Apr 2026 06:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839889; cv=none; b=lx1zA9sNLpKm86lXDUJo2AlNgvj26gUqzJQdhq+8vvjPqfzrWC6RqJS5ZlAkyRZyVYIMAwj8QVFG1+j1x5coZEtCJlUJV9h2m4jrfhxvlbKbJSerPwTnvi+ITM8vMVP0vEWY17ll3GVlcp+8zd5fwsJV4U5nmZaXmPIol44s/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839889; c=relaxed/simple;
	bh=KFMauCP2XQjIpQdiAuu6fHPvoVvod+5DcklxZ+tYiKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+XHcQO121T7oS+7wKy4S0HGw7ZTQU2v9RxcMgucPnkNilbzFCgOGmRPZwlJVVA48k8cMpuZ2IWX5nPB2ODTY/AC1vKVHg0J+9+YSnrmOi2TJGZd88iDIZse18m2srjxT8BaM8hBP3RCXYyLMSGNjx7tKTLDHPFnc04QBnt8Lkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilTBTGa+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776839888; x=1808375888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KFMauCP2XQjIpQdiAuu6fHPvoVvod+5DcklxZ+tYiKw=;
  b=ilTBTGa+OiICRogLzZ0vVO7EiCI8mCehTT9HPqLLrKqT5/kvtaJ+/hn4
   tcfvb6B1/56WN2exgKJ0bvTM0k3BZPCQiFlGtQobXlaxEZhvwfmw0Fo0W
   O9U1DGGYog6AZGXnqY+q/kTU28WphMBplbHrBpG+EXkpfGy5nThgO+/Q1
   imrSE40mJgcvMs3Rnf6f+xkPQ7xjOE12OQss9Dk74Iwdksww/t8jTvisX
   7FbdoIKOfW7L/1MytNhheM7I7bXlaGMhgUscgzWJsmkDzK3VJnnWEpXiM
   LpUe3Q4Knrqb9HLhAYehvKhe7KDTc2NDoJae1fiuu2Dc4MqbZviqOxB+P
   A==;
X-CSE-ConnectionGUID: wru6k7QwRJ+9HagTFNcpNQ==
X-CSE-MsgGUID: PkUKc7vRSkG5iiLrI64STA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77800530"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77800530"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:38:08 -0700
X-CSE-ConnectionGUID: VFGKTCX3QImusvcUKZpLYQ==
X-CSE-MsgGUID: ImmJa47eSjqQwHdvz+bXWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232176277"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:38:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E3B931201FC;
	Wed, 22 Apr 2026 09:38:03 +0300 (EEST)
Date: Wed, 22 Apr 2026 09:38:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sajja Easwar Sai <eshwarsajja20@gmail.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, yong.zhi@intel.com, tfiga@chromium.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, iryuken@duck.com
Subject: Re: [PATCH] staging: media: ipu3: fix out-of-bounds access in
 imgu_map_node()
Message-ID: <aehsy3AY7Zpqm8gf@kekkonen.localdomain>
References: <20260422061951.352746-1-eshwarsajja20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422061951.352746-1-eshwarsajja20@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59280-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 3CB574427B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sajja,

On Wed, Apr 22, 2026 at 11:49:51AM +0530, Sajja Easwar Sai wrote:
> imgu_map_node() walks imgu_node_map[] looking for a CSS queue ID. When
> no match is found the loop exits with i == IMGU_NODE_NUM, which is one
> past the end of every array that is indexed by node id.  The value is
> returned without any bounds check, so callers that use it immediately
> as an array subscript produce out-of-bounds reads.
> 
> The most critical caller is the threaded IRQ handler
> imgu_isr_threaded(), where b->queue comes directly from firmware; a
> malformed or buggy firmware return could therefore trigger a kernel
> oops.

Have you seen this happen in practice?

-- 
Regards,

Sakari Ailus

