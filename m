Return-Path: <linux-media+bounces-56737-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJVnGgVGwWnpRwQAu9opvQ
	(envelope-from <linux-media+bounces-56737-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:54:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BEE2F362B
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A2F830A9A85
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF453AE6E2;
	Mon, 23 Mar 2026 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EY0wj28z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B5F3ACA5B;
	Mon, 23 Mar 2026 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273443; cv=none; b=GtAZYNaoNAJV4TkLNhlf+ICZJf4j71L5JIpQgfGQdBN3SkOKrlH3ec7aiap+LhJpKr6f399WEYisPmrvx8dnD2kHpny+G3yh+I5He2QnyjOTnU15130n49dT1ASVR/HoXexVw79gypdUHljPS7pyFSljk/8ru5gdw9F87c2c+Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273443; c=relaxed/simple;
	bh=ip7Htq1vNhaEH+Jk7q0F3mdlbOg8AtmoB+dA7J6Lmqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6g9nwxiOVldl50vL8B00PnQVXP/JPOoZGYN1wkVRHlCLo2Rb8fkt+zFIqn4X5BaT41HL5+SsnaIat3EQ9TtKekrzm97qYq4672MzkkIHWJ3HUB8XD4xExFR/rOcxI82bECvYpZBnzePX5D4ZEp80y5gqfvYkLJI+hRDhr7faXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EY0wj28z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774273442; x=1805809442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ip7Htq1vNhaEH+Jk7q0F3mdlbOg8AtmoB+dA7J6Lmqw=;
  b=EY0wj28zt3+uzPSgLRlc9kPlxuDpiAjYHXMwEKGx0NVQ0+aoxP0iWCWR
   oNM6+SwTyJY69TZaD4sZhydTUoDmwHK7uhVnv5BuUyJX0/XsE09UjToEU
   IhvwkTRiWuHDFBGKUrceTPiU/BmRbd50SWG0+uahMFNBjRYf8FOzV9MoZ
   2SsktsmG/h1Rvjnux5p9ab01jc44vLePQekgKsiQ8Uq2SkxrqkTi9i8NB
   JkwFjz/ByC5pPlnHoBE4mVnSe4PdJdxfvzurb+0/9acHdPVxLQ27iSiA1
   PbYSnDXC40rUs/eJq9vgsRKiUiUxfU3965leLQiSrM6G+PEAJI1lYIsqO
   g==;
X-CSE-ConnectionGUID: bvdgqso6S6m+mcwrZ7PI/g==
X-CSE-MsgGUID: /Ax3R9HISqK5IQfHOLycjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="92650465"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="92650465"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:44:01 -0700
X-CSE-ConnectionGUID: YVmgWCYcTsO891jexXs4Gw==
X-CSE-MsgGUID: Mo9LBC5YQQyhcEua02JLVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228756667"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:43:59 -0700
Date: Mon, 23 Mar 2026 15:43:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: ov2722: flush buffered writes before
 they overflow
Message-ID: <acFDnWZciouvcosa@ashevche-desk.local>
References: <20260323121730.75257-1-pengpeng@iscas.ac.cn>
 <acE9jOa5wTvFy3GX@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acE9jOa5wTvFy3GX@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56737-lists,linux-media=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: D0BEE2F362B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:18:04PM +0300, Dan Carpenter wrote:
> On Mon, Mar 23, 2026 at 08:17:30PM +0800, Pengpeng Hou wrote:
> > __ov2722_buf_reg_array() appends 8-bit or 16-bit values to the buffered
> > register-write payload and only checks whether it should flush after the
> > new value has already been written. When ctrl->index points at the last
> > byte of the fixed 30-byte data buffer and the next register is 16-bit,
> > the helper writes one byte past the end of the local buffer before the
> > flush threshold check runs.
> > 
> > Check whether the next value fits before writing it. If not, flush the
> > current buffered write first and then append the new value.
> > 
> > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> 
> The patch is wrong and just adds dead code.

I believe the idea is not to touch sensor drivers in atomisp at all.
They all should be heavily lifted and updated and moved to generic
folder for all v4l2 cases. I believe Hans had some plans, not sure
what is the state with that now (I know he is busy with something
else).

-- 
With Best Regards,
Andy Shevchenko



