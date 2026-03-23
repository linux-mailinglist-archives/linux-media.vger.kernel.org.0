Return-Path: <linux-media+bounces-56761-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM6RJ892wWkQTQQAu9opvQ
	(envelope-from <linux-media+bounces-56761-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 18:22:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FB62F9CD5
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 18:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7192931A9C08
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 16:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FC33C2764;
	Mon, 23 Mar 2026 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ctwc8oS0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB1138F62C;
	Mon, 23 Mar 2026 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284347; cv=none; b=WJeqYOX4nJHlFAuZ4QJGsVcAmnIO54XWN/gEOe65z3swK2N7cHfJJP8j3mah0FizU02s9bMIF/KpoN0HqhWGvDZE+THHmXqDsZZQyDctQXTMbt96GfTtIf1CIP4vzSaXI8IGJP7Vg43IMKYT0H8xutpOMUETFqcsu3/o2ygjmvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284347; c=relaxed/simple;
	bh=hwPvzWHQD1WDa2CBQIoOfNLXQcKGLnBeYnlNRJCsBJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QASKA7BsbG5yj7FIt6X05kBbE56SQCWEAOw1Fkf29FXK60kNeTAYsJEglvunL43dLAbF+0GJwka725355J0qdICJwb+CnBI6TkCWrUxgzMixaPZWKuf6R+zLp3RuUohMuTGdY/r0iZLn1TOmafd3kV1Lu0muSMaMiez1ifAAU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ctwc8oS0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774284346; x=1805820346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hwPvzWHQD1WDa2CBQIoOfNLXQcKGLnBeYnlNRJCsBJQ=;
  b=Ctwc8oS0bZYCU0gK7RjJ3GGjTdAg4saDF4fCuc5bcrVUYKQzBx0YzmhB
   r9Sb+X/SWMlio63Ll5PBzynK0yq9OHdGZozvtKv8u1xpgGUz4WwB8rnZ9
   +h2j7P6Fvx4WVYSRLX5xNcA8HF+Om0oJDUuDoe6KVdGfkyCsPB6kkj1lE
   ljvPpsDfDjpywfqDCOh2ua653wJLmhB2Wwe3Ptz3PjXLspbJ71VzG0o6C
   MyTjPCfmsk7mnL7XsVuYIEVAokwuI0bo5HBosjl8RXIWMwVJCMfd6fza3
   r0mmdn+5/o7HH0Ihg/mbQZi7qeqij3ULKPDE4TTytWutswc7Shq0BzN8d
   w==;
X-CSE-ConnectionGUID: Oi2TAmAmQjm/Dpc4qIRLBQ==
X-CSE-MsgGUID: R2tzyH8ISny9lFFivi/A4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74307310"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74307310"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:45:46 -0700
X-CSE-ConnectionGUID: Ps5kwGAeTeimgfZndAnLgQ==
X-CSE-MsgGUID: 58deEc/8RMOswi0yIJ0JcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228809618"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:45:44 -0700
Date: Mon, 23 Mar 2026 18:45:41 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mohammed EL Kadiri <med08elkadiri@gmail.com>, hansg@kernel.org,
	mchehab@kernel.org, gregkh@linuxfoundation.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: atomisp: fix spelling mistake
Message-ID: <acFuNfiyxpOfqxit@ashevche-desk.local>
References: <20260323141143.27280-1-med08elkadiri@gmail.com>
 <acFj89pWfmhLKzQ4@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acFj89pWfmhLKzQ4@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-56761-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 20FB62F9CD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:01:55PM +0300, Dan Carpenter wrote:
> On Mon, Mar 23, 2026 at 03:11:43PM +0100, Mohammed EL Kadiri wrote:

...

> > -	 * how to destroy the bo when it is stilled MMAPED?
> > +	 * how to destroy the bo when it is stilled MAPPED?
> 
> MMAPPED was correct.  It means memory mapped.

Probably still needs a double P?

But taking into account FIXME there, I would expect the real patch to fix
the thing.

...

Sakari, perhaps we need to stop this activity, tons of patches without real
progress just waste our time... Note, for fbtft I have updated its README
to mention what kind of patches are accepted.

-- 
With Best Regards,
Andy Shevchenko



