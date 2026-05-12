Return-Path: <linux-media+bounces-61318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Cn8JtV+A2rS6QEAu9opvQ
	(envelope-from <linux-media+bounces-61318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 21:26:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B1528A44
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 21:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BABD301A4E7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EF4387361;
	Tue, 12 May 2026 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW1h9zBa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C338758A;
	Tue, 12 May 2026 19:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613955; cv=none; b=g5fZrtnIlMCKpVsZ8QtgEyHIYXPXq15EiVUzTlQ5s0myjZWVv9xwtewCwbfGrqifJ5YSZo5LfBt0FszEsG1u9IUV5P8rI/5d+OvXhN/l46CDDRM2gZAyQgrO4fCqezitqMySwOYb8SDRwPiujk3Hjhe8MgFzSpLpNOovRbYvQkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613955; c=relaxed/simple;
	bh=2M0rNh8lEVUZOT6LcT/HK0VvW9rDoSXE7U4w2m1Qguo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyFk83N+8Dsk4sj2BBmPoHLwsw/d8tlpQ5ro0Qs7UqsZ8oI1Bn3Az25Uob4fFktS4hEojsKhfB7JyMEPA9Vyp2VvEqG8gCoEWzorOfwCFwWrF1Abr5cOmZSxYOEAhBFKm2huEImESfHdMimQLDxMo/WUmBQA3fEnrtGuNDpQeo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW1h9zBa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778613954; x=1810149954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2M0rNh8lEVUZOT6LcT/HK0VvW9rDoSXE7U4w2m1Qguo=;
  b=XW1h9zBa6yWsury9LTLzrH86K66LVAGjfhf/jwKSC7aZHprcr8bybkCM
   Ak2PcSPYX5Kc0NSntrF4X9d574Ln4N/szkmVNtcz0aQdXzYJ2RZJj07eP
   Qp2Tc4IyUE3ByKzW8RVe2r+VSmzEBAYxLNlAzD24D62Bdrh7qADbuwUke
   TUhU28K84vddTIYSYRZwcCU6ewfiApwopF0kjG75kuKRGEi+Uwn3KmcgP
   nNOMWaEafHt1Yn701Wo0JLAAc9+QCuc7DCuhj1C7zJdVdB+75Rlihr73J
   BF4pFi6TElYZzdoC8OKtAGg9Jb9sHslNL+cKqwflOLFH+f8mVe/gS0iz9
   A==;
X-CSE-ConnectionGUID: fTCVKRFSQEGQM+EedPUUOg==
X-CSE-MsgGUID: ZpbdvWNFQ7KDY5eYfjy+Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79714037"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79714037"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 12:25:54 -0700
X-CSE-ConnectionGUID: GAr/dsSwTMChEN1AVQzTLg==
X-CSE-MsgGUID: OZorbDGtQA2c4kaOTccF2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="235196022"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 12:25:51 -0700
Date: Tue, 12 May 2026 22:25:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove stale "Generated
 code" comments
Message-ID: <agN-vQrNGty8pIEE@ashevche-desk.local>
References: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8.ref@yahoo.pl>
 <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 9C0B1528A44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-61318-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 08:10:52PM +0200, Tomasz Unger wrote:
> Remove the "Generated code: do not edit or commmit." comments and
> the resulting double blank lines from five files. This code is coupled
> with legacy firmware and will never be re-generated, so the comment
> is misleading and should be dropped entirely rather than having its
> typo fixed.

> Suggested-by: Dan Carpenter <error27@gmail.com>

Seems like a flashing tag. I dunno what Dan suggested here, but please, double
check that tags reflect the reality.

Code wise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



