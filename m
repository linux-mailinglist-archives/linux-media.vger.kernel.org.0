Return-Path: <linux-media+bounces-53803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AQKMK0vommQ0gQAu9opvQ
	(envelope-from <linux-media+bounces-53803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 00:58:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 411711BF473
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 00:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1F013022F41
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB76D33C53F;
	Fri, 27 Feb 2026 23:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MH2xx2RV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A908220F2D
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 23:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772236714; cv=none; b=taBfREhnrZhVj+GO1BSMyS2QvQmVWH8M4Qvr2PWUaiA0W/m6DPQQ++yMfkxYiJ7r/8jPHQL4Q4ZruM57bRptdQCHZELoJ1eZaDgdM8JNg1TNJw2pBNHB3mxL+N41TetDDaScusw9skjn6BWmZnoCNxRzlS3LXCWcw1HuyWyallk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772236714; c=relaxed/simple;
	bh=IPV+cnI1iBilQKRWoIUa0gLL1rLP2G0BRnzL8k8+g0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3Oz+H4tfU86x6DNAcAJzvadsZmgd91iR0o+xyDui+XdeEJX73S5x4/exRyPTO0i6sXBU+uyMJ3LelFi/dsQ0aFplgiCJDEjXHO6JlMkbL5F1F0BQ9Sh2uSmgsAYVRgPGXb2qfVB4RYfS0TAX4k4KyXXjFhD2Z8feODpNmPms+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MH2xx2RV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772236713; x=1803772713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IPV+cnI1iBilQKRWoIUa0gLL1rLP2G0BRnzL8k8+g0E=;
  b=MH2xx2RVl4X1mBrix/+FZK/kf+7/gPJ+LGXag3EUNENBYV7ts/gIv1ce
   hLruIMYK29ZXIdaXng5WOORmxF5VLO5qsIXqse0u71gWHSym6uLJpr/Ft
   ukrdtKMX5uat+eGsMKHsDGj3em+4H19ivcdzXIdAnLIxEGwa1+ZEgwU+E
   feQPCJ+z/lnfQkSaq3sWRLbJ7cVFUtCuzljvFC7ytrZ0p7F3IuT1UHbIO
   1kZnS3VbgL55b8TZKRH7D/EnfRcY9IROdwoA0ueSXZmzIZ7URcVzeGezU
   rYc3cuvTI+f1j4NfOTVElrjiNegyfGZvSgNzjRaQd+TQ/x40kkqwBkFXb
   A==;
X-CSE-ConnectionGUID: xfn7wsEyTeSfvVgPjU3EHQ==
X-CSE-MsgGUID: cxLldpGURHiUg1SoSCfuog==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84035343"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="84035343"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 15:58:32 -0800
X-CSE-ConnectionGUID: lpgT3A0BQpO0ZSlIR/3bEw==
X-CSE-MsgGUID: GGsLYfRsTbqCGWdgcGMMUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="216274000"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.205])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 15:58:30 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 38F4911FA45;
	Sat, 28 Feb 2026 01:58:58 +0200 (EET)
Date: Sat, 28 Feb 2026 01:58:58 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: soufianeda@tutanota.com
Cc: Linux Media <linux-media@vger.kernel.org>,
	Linux Staging <linux-staging@lists.linux.dev>,
	Gregkh <gregkh@linuxfoundation.org>,
	Johannes Goede <johannes.goede@oss.qualcomm.com>,
	Andy <andy@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in
 framebuffer conversion
Message-ID: <aaIvwnCTMkPcfBS2@kekkonen.localdomain>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain>
 <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
 <OlBwH9n--F-9@tutanota.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OlBwH9n--F-9@tutanota.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53803-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 411711BF473
X-Rspamd-Action: no action

Hi Soufiane,

On Wed, Feb 11, 2026 at 02:43:17PM +0100, soufianeda@tutanota.com wrote:
> 
> Hi Sakari,
> 
> I agree that removing the private IOCTL handler is the better
> approach. While fuzzing the driver I found the same class of
> unchecked user-controlled size fields in several other handlers
> (ATOMISP_IOC_S_DIS_VECTOR, morph table, shading table), so
> removing atomisp_vidioc_default() eliminates all of them at once.
> 
> I'm cool with sending a patch removing atomisp_vidioc_default() as
> Hans suggested, if that would be helpful.

Oops. I read your message after posting the patch...

Indeed it sounds like we should disable all private IOCTLs, also the only
one that should have been there to begin with. (I can update my patch as
well.)

-- 
Kind regards,

Sakari Ailus

