Return-Path: <linux-media+bounces-58194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCHPHgcf1Wnr0wcAu9opvQ
	(envelope-from <linux-media+bounces-58194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 17:13:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 132BD3B0B83
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 17:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA12B300B455
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 15:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7A435CB66;
	Tue,  7 Apr 2026 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdimICD5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752735BDA4;
	Tue,  7 Apr 2026 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574396; cv=none; b=nqIFc3nbUoI/Gc3BkNKvbxJyS5coSMiJpt8EjKD+lvvu7aVF5DDWyjvF1t1oJzqRDxU9uPveaS1w+GOehWzRuC1+VSQAaj496xNHtEeTEmzIg3j+wCHHFoBz4E2Yw2FrufyfX6ZIIOw4ZGExolBuanIHP/+T/zVSDr3p+zWgn5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574396; c=relaxed/simple;
	bh=xP86zjvYSIpQI8ZG5mdMmk5DvC1axNphzSqM+YKlXBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRHDbYSysWPLZS0kfIQO+QW3eZsavdXQwc35bnwK9/zcR3cUR2oOLeIXYsyKLy030ay/tbRXPKqZwYp0HJdLARkZSJ/B8WCg0HThNyKi+oGDaB5bgb0GWfIG8lrcIsFlrt4axKOHP22PCxKLJJDqyzr3aeVdiRkN/8h5SLTtd+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdimICD5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775574394; x=1807110394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xP86zjvYSIpQI8ZG5mdMmk5DvC1axNphzSqM+YKlXBE=;
  b=AdimICD5E5HZGkMVtBWugQRJUKOs0liTkUHGQ2gv6uZkx/GuLjEXqiL1
   2DkRCi5Qh01HHOTlWPf0pi7VN3R1vAV8a+FADMBEFITSepF/J03UI6x6S
   InZ/AtstJuuk5Bpvs13FzShctlzZyu3ocPlPEweSpMx26dRrQR/hngk+l
   dzo9TAmMnjByXmKzXWc41VQTrF4gHLCM8mYxjBR/bJMW6AP9hX1HOOBnO
   bAB1zTepGSeWko/sdnCMnqwFcwRJ9CLkktDJBGAUBW4GrOp8foBl6lc8W
   XGefCVR486GBF3UuBAqdMfioylh0Pf2F8qMVKqT6dqwANl8LNrtxc2s8I
   w==;
X-CSE-ConnectionGUID: NfXoAOAJTxCXPWM4nbQdbQ==
X-CSE-MsgGUID: L+7idntJStKYLzEy6ecU8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80132825"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80132825"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:06:34 -0700
X-CSE-ConnectionGUID: l7NhUxXRQGyMuteNNQZg3A==
X-CSE-MsgGUID: Z5vouaf3Rq2RPSVMy28rVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227358172"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:06:32 -0700
Date: Tue, 7 Apr 2026 18:06:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] staging: media: atomisp: change copy_from_compatible to
 iov_iter
Message-ID: <adUddSgsIhsZ9WP3@ashevche-desk.local>
References: <CALoEA-wrnqUM_5hDGUL1xJi3crf64ApE7fUrb2_47xVzhBT35Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALoEA-wrnqUM_5hDGUL1xJi3crf64ApE7fUrb2_47xVzhBT35Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58194-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 132BD3B0B83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 04:46:49PM +0200, Joshua Crofts wrote:

> I've had some spare time and looked at the copy_from_compatible function
> in pci/atomisp_cmd.c. You've recommended checking out the korg1212 driver
> and patch for adding iov_iter support. What I find strange is that the korg1212
> driver already expects to receive the userspace data in the form of iov_iter,
> meanwhile atomisp expects a from and to pointer along with a boolean
> whether it's coming from the kernel or userspace. My question is whether
> you meant this as a local fix where I'd use an iov_iter in the atomisp_cmd.c
> file (maybe separating the functions to user/kernel, since I don't
> really like the
> passing of the from_user boolean)

iov_iter has a type that implies the user or kernel buffer.

> or if you were hinting to a ground-up
> rebuild of the underlying atomisp architecture (which is definitely a tedious
> task, looking at the source code).

I believe the second (latter) option. The code has to be revisited to convert
using iov_iter and drop the custom code.

> Thanks for your time.

Thanks for looking into that!

-- 
With Best Regards,
Andy Shevchenko



