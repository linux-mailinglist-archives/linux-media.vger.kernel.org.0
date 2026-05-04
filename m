Return-Path: <linux-media+bounces-60260-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIFPOuZc+GnatQIAu9opvQ
	(envelope-from <linux-media+bounces-60260-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 10:46:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D47B4BA761
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 10:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2E693018C3C
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAE53491C2;
	Mon,  4 May 2026 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtvPvzgh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0741C31A7E4;
	Mon,  4 May 2026 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884363; cv=none; b=lxT+N7012rHu5s40RlICDm4R609DiMOBXxBmcYcjcSGF4v4BT1dqa4jj5VTJdS/NYwVLdJ1nPhOR567oZgBvX/pQTYW8wWUW9mKL9kGggTioDPZDt/xJjVtukRCdaaa2+b25FnfCKk9OdfhD1yy/0Y3GuBsNMdk+Y2s7vStFW5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884363; c=relaxed/simple;
	bh=yWEzCDgoGDnMWPKJjVfR9r0muUqxhdSGv8T8xVqkZ8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iN7stCjLvvLoQ9a1/xXeFUvj/5M3DvV7shULsFNKzAD/u1eJUpWAQ54dibswdYaulmLSjFkpbdgZhDZPVQXwQWxNFVvPplPkNHDMkPd1eydLc1llk8XXPOufe4v8UopiVOzBH9nFCXjhepeirtlynLnKaFF4zMy1IaJUx7KY4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtvPvzgh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777884361; x=1809420361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yWEzCDgoGDnMWPKJjVfR9r0muUqxhdSGv8T8xVqkZ8g=;
  b=DtvPvzgh0I8aMasYcLz2tP3SUoaQCXZjrvoo/qVbUNIduhFFpa+9EMs0
   LWNpquREBajvfcGhYSwX0JCQb+KzyDtfWJyi+mgCviVN+CjBXsMBeIv9p
   /QdCARrxmIIfwm2AwCHE9f5qrxNoDXk7YMYuxFl9Uu/7E8sp/JSaowIR1
   udfD4oHsQE6S3MqS6n91YPGqJhaqC9G0zI0KLBA5+8y69eyvJYHPH/DOY
   1DUdtxbZoQRQd7/yL7KO4fVMiNatPNo/OanekEzto7ONA5+KbQWmOMV42
   kqRNDu9TDT6gNXymr49Vsf+8J8HZUohXnVrrb0as/4D+bO5RueN1XpFCZ
   Q==;
X-CSE-ConnectionGUID: J4k6KAkGTu66VX2fDaV+ww==
X-CSE-MsgGUID: 90tLP/XeTJKLdBwoWvKwtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82349928"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="82349928"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:46:01 -0700
X-CSE-ConnectionGUID: S6cLh6lERmaxYO/jal4ZyA==
X-CSE-MsgGUID: q5GrRO34S1m1keH3QGBBtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240441681"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:45:58 -0700
Date: Mon, 4 May 2026 11:45:56 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shirin Kaul <shirin.kaul11@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: atomisp: isp: xnr 3.0 fix whitespace issue
Message-ID: <afhcxJeQ19nXKvAo@ashevche-desk.local>
References: <20260502082516.16302-1-shirin.kaul11@gmail.com>
 <20260503105445.45058-1-shirin.kaul11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503105445.45058-1-shirin.kaul11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 5D47B4BA761
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60260-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]

On Sun, May 03, 2026 at 10:54:45AM +0000, Shirin Kaul wrote:
> Fix spaces by replacing them with tabs in function calls to comply
> with kernel coding style with checkpatch.pl.

Subject is wrong. The patch doesn't cover things outside the single file.
The patch does two things (has to be split). Also patch doesn't anyhow
rely on the preexisted changes that were submitted to the mailing list
(that cover much more that this one).

> v2:
> - Added trailing commas in arrays
> - Fixed indentation

We have special place for the changelog and comments...

> Signed-off-by: Shirin Kaul <shirin.kaul11@gmail.com>
> ---

...somewhere here.

>  .../kernels/xnr/xnr_3.0/ia_css_xnr3.host.c    | 29 +++++++++----------
>  1 file changed, 13 insertions(+), 16 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



