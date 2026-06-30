Return-Path: <linux-media+bounces-66066-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iEEKC/yWQ2ohcwoAu9opvQ
	(envelope-from <linux-media+bounces-66066-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:14:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F50D6E2B0D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:14:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=gGY9bJTQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66066-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66066-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74A0E302E7CB
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5433ECBD9;
	Tue, 30 Jun 2026 10:13:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755843EBF0C
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 10:13:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814420; cv=none; b=c21SllxGlmORNZRnJlPc3Pu55DSpIHDC+QlQ0ApRFTCoacqr81uZjM4R9mp4S1VXnf9XJcYQzbKm/R73M76tCuMCH0YKNwDJ7YVJ2VhOTcyUukPXyeS7RzumxdO2sOuRVx+NnIbDH3m0K2YnBcWEHDq4Z+Qv2gSiNnFgi6CSXAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814420; c=relaxed/simple;
	bh=4s7TXf5Iw/XAphju1TikY5bLJx9/ScKVxN/mvYdVLBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYI9cv1NvbHK9MfuSBxJlYet+JdHFqCMUevh21qG5H5F/ZH7uy+YDNSRynXsZqmQMMaR0kGdJ6CjllIP59DXm2g7+Up3UBOoYUX4hWVZle/iDmxCRKNNOnVE2a4NVmnVDESw2Ff+4ghd0APcjCf/NNs6Ml4ZDeHxa5UxRMMXdZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGY9bJTQ; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782814419; x=1814350419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4s7TXf5Iw/XAphju1TikY5bLJx9/ScKVxN/mvYdVLBs=;
  b=gGY9bJTQJTqVgf9KcVB24iet7Tvpr17vRO7iDeTV0vfzmQN6ysli3xmZ
   rrTJgp9Tb6GCYv1+f33pE0S5wxaCepcrO2oiMjxKB7+Ioa+h7LXqKXuvn
   N2gpe+ytYeOUNijws742TnwMMVEx+ADL3ZbJ37nqtjzo4NviNsUeW8X9x
   JJ7UfcpRy+anmXICQt/dburU7VZMXvXTD4/xJl+C75JlAVQYCuyt1/oQE
   TTHzDO9u1hfMDwetuGzdjVFczF0kpbtfRn8BE/gtn2IQ4XbzZvC2Rz8lx
   strH+K9qDTeNY+HERO6Oz5AK3EMYIypbMOWtlMtaQJoie8TxuZeW5FcW3
   A==;
X-CSE-ConnectionGUID: BZ9139FcSYutlX8zTh88MA==
X-CSE-MsgGUID: kP/SAuU9TZO5U+9fnrKpGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83580613"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83580613"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:13:38 -0700
X-CSE-ConnectionGUID: f/ixbV5JSWSOR7EfGCAb8g==
X-CSE-MsgGUID: 5CCVw+KoQUukkidj5Es4QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="245876159"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.116])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:13:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7EE29121C13;
	Tue, 30 Jun 2026 13:13:38 +0300 (EEST)
Date: Tue, 30 Jun 2026 13:13:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: Re: [PATCHv4 1/6] media: core: v4l2-async.c: unreg subdev if
 asc_list is, empty
Message-ID: <akOW0ioLKG7WxFHH@kekkonen.localdomain>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
 <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
 <05d38e6d-5f18-4d70-983b-1a28ddd22535@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05d38e6d-5f18-4d70-983b-1a28ddd22535@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66066-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:from_mime,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F50D6E2B0D

Hi Hans,

Thanks for the update.

Did you notice my comment on the subject?

On Tue, Jun 30, 2026 at 12:02:53PM +0200, Hans Verkuil wrote:
> When my em28xx USB device that uses the i2c tvp5150 driver is
> disconnected, it crashes.
> 
> The cause is that the tvp5150 i2c module uses v4l2_async, but
> the em28xx driver does not since it predates v4l2_async.
> 
> In that corner case sd->asc_list is empty, so
> v4l2_async_unregister_subdev() never calls v4l2_device_unregister_subdev().
> 
> Modify the code so that, if sd->asc_list is empty,
> v4l2_device_unregister_subdev() is still called.
> 
> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

