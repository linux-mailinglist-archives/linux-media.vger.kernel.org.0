Return-Path: <linux-media+bounces-52601-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHDILgZujGlmngAAu9opvQ
	(envelope-from <linux-media+bounces-52601-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:54:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416C123FE7
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F198301E6D6
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 11:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA103315D53;
	Wed, 11 Feb 2026 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1JkTRac"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0E314D07
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810879; cv=none; b=Exr+9/GENAFroVYrRCLYchpJ19GUBE2CuKea/uvqcpIHPCByuYNjhHwE0fkFS68aYQ8LC1bBxxX7DLk7XZki5m3tG4Ko0wI2pgdXp65iNzz4cyx3BYw1Fr0a7w2g34hDAePhZFKeENBpHO+z53Cmel7+FAIiUtuME9jamp4uaMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810879; c=relaxed/simple;
	bh=quS9/UMFndmEQVZg8kyW9UvmFECmNjOgMnwlBiMhwcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTarB823TiyyTttlkGHYlLY8TOWQtUVXRE7FufrtmbdAoq+iftslQnvEsxqhzV35fwS6Ya4MqheHX7jxv6TBG+vSgJdxQ6r/xr5sbPIGreJ9R+kwCkKSfEDjtUbTwcFVkKtWgZK5kkXAUo+yCUnIt5dGCRmpLBG6rTfnjI8VCu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1JkTRac; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770810878; x=1802346878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=quS9/UMFndmEQVZg8kyW9UvmFECmNjOgMnwlBiMhwcs=;
  b=N1JkTRactKii2l/5hwpIUPJbONKkWP6OuXWFkFgGRNx4stwQnpfoDasG
   8AFAoEADPJYgO8E8NncYoPu5YTY9EGzs8RkKzNIEDzU/t332WdjNC6yp4
   sCMJ53qdjrSZxtK+JGTFIV/ORjV+cU1LqN3aAfJ3ItrDrX5Ab1OgH5KNo
   kIPCTCTEzlPirQxUdWVwxtuQ+MTs50XJ2ErmE1jxoR4IpsvHG/3o1PB7a
   JDciHGk54zu/QVhPWiyhO2rhWXchrWvJFZYdXpPbYYWo1rPbxZgJxoq1i
   WfU53aMNqrUhQZNFN2QEaVbenHQ08+z/GQGaKGfnjmP2VvwM3lWK77N5R
   Q==;
X-CSE-ConnectionGUID: swGlE6yZQViBT7jy9PKAww==
X-CSE-MsgGUID: tTivMX7LRzONigkdUoQ5FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82277848"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82277848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:54:37 -0800
X-CSE-ConnectionGUID: q2Uybg8TTrGTdLSGO24yZA==
X-CSE-MsgGUID: dyPhT9BNTm+o8xWOVotubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211269061"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 03:54:35 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D63F7121D35;
	Wed, 11 Feb 2026 13:54:51 +0200 (EET)
Date: Wed, 11 Feb 2026 13:54:51 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: johannes.goede@oss.qualcomm.com
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, soufianeda@tutanota.com,
	linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Message-ID: <aYxuCyTizpKM4Ul1@kekkonen.localdomain>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain>
 <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
 <8efb3705-42f3-40c5-9631-d72eb2dda74a@oss.qualcomm.com>
 <aYxqjBSI-t8Jk9UF@smile.fi.intel.com>
 <b8ca670f-c45b-487e-9e29-2b097c1d5c17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8ca670f-c45b-487e-9e29-2b097c1d5c17@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52601-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 1416C123FE7
X-Rspamd-Action: no action

Hi Hans, Andy,

On Wed, Feb 11, 2026 at 12:50:18PM +0100, johannes.goede@oss.qualcomm.com wrote:
> Hi,
> 
> On 11-Feb-26 12:39, Andy Shevchenko wrote:
> > On Wed, Feb 11, 2026 at 12:28:35PM +0100, johannes.goede@oss.qualcomm.com wrote:
> >> On 11-Feb-26 09:11, Sakari Ailus wrote:
> > 
> > ...
> > 
> >> This will cause a bunch of code to turn into dead code, but I would
> >> like to keep that code around since when we add support for
> >> a parameter buffer queue that code can serve as an example how to send
> >> parameters to the ISP.
> > 
> > But it's forever in the Git index, we can remove it, so it's just matter
> > of convenience to keep it in a working copy (tree). That being said,
> > I would rather drop the dead code to avoid a stream of not-so-useful
> > white space, style, and similar cleanups.
> 
> That is a good point, dropping some of the dead-code stemming
> from this is fine with me.
> 
> We should probably stop pruning dead code when we get
> deep into the helpers to pack things into fw specific
> formats.

Either works for me, however the actual IOCTL handling related code
contains less redundancy than the rest of the driver. When it comes to this
patch, I'd keep the changes small allow easy backporting.

-- 
Sakari Ailus

