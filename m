Return-Path: <linux-media+bounces-50221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96280D021F1
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 11:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB935334873C
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42D2347BB9;
	Thu,  8 Jan 2026 08:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvo4+A9E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413DE345CBF;
	Thu,  8 Jan 2026 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862198; cv=none; b=HFhYSh9FU/v0WYB5a+2sVmFE7pKBBc+Hz+yK7lplYKhsjwgwK9P+5YVHIi92Cq2e7BGjSffdh/4+7mPXGTAcTcR3ihHy1UPPg34RHZS9c5uMWVlo0FbssYF1Sqp8NKcj/vyb63JX7xeLU3SkY6P33euVQUS/OF945E+4DRKxvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862198; c=relaxed/simple;
	bh=CcP4M2fIfl+Zsp6RV9ovc01tuBG8/9NSa6NmSQfTg1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKWiT7aaC7ajXQTm2UlDo1+vuoZkeg8QD0qCTAU+q4J+8kBBCDSnR1cBJae/TQWMlRpjR8HQNHTT+Y3F3kv+xLleGDjNEI/2eDIOYdpIPVmNPll6BCryBv6SwK0gC53cCWClOkf1scdf5rUDlhGOwBI9NqdzsflZGKHkodZ8GQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvo4+A9E; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767862192; x=1799398192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CcP4M2fIfl+Zsp6RV9ovc01tuBG8/9NSa6NmSQfTg1k=;
  b=kvo4+A9EGzPc6PoOfEuCcIVni2UF8A9alZSsKz9AUIqGJpArG+orCPs4
   XjZ+LJwTo/PuwzelQJZxc3ConlhLsdad+IVEAf7cVoGU1D0qES5XlG5Pp
   y5CZtswWTvvSI0su9pOdbnITyRRh8N5fz9yb0WCEM5FGs7GbMVOyC1D+I
   FgBlJub73kdmAnKQvn1mlWyAv0AEOu6LbTGz8qtXwMItWIkR7+mUpw0YX
   Xh7+9YWROd4Zofl0cmDG/LwgRoynaFVd4UPefHE+gvXChucwxvnrj876B
   9ABvbsKYh8DTdTK3SvmtPNUN60izWtieTdCtSE54JUIOqZaa/tEWuuRbT
   g==;
X-CSE-ConnectionGUID: lTXgdfn8ThCFZPV0vHzb1A==
X-CSE-MsgGUID: 46B3koi9QhatX/fhy9/pSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94703795"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="94703795"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:49:44 -0800
X-CSE-ConnectionGUID: 6esznvGJRZmfIhuOnwI7nw==
X-CSE-MsgGUID: ehJ8enqqToaAnlafOQd48Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203208075"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 08 Jan 2026 00:49:40 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 072FB98; Thu, 08 Jan 2026 09:49:39 +0100 (CET)
Date: Thu, 8 Jan 2026 09:49:39 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Chris Li <sparse@chrisli.org>, Eric Biggers <ebiggers@kernel.org>,
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aV9vo7_turBr84bs@black.igk.intel.com>
References: <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3>
 <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com>
 <aTn0WdVv-S_EpQmS@agluck-desk3>
 <aTqAxfiVCR2ch4I5@stanley.mountain>
 <CABCJKufWw4VQA_k6Deuf5Bn6401cbYv_St8VV_0-LAau6F0nTw@mail.gmail.com>
 <083ebd92-4b3f-47f8-bf0f-395a604b5f05@kernel.org>
 <aUVI9smf2t7PvDF6@stanley.mountain>
 <aUV7kyjxlijuy5sC@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUV7kyjxlijuy5sC@agluck-desk3>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 19, 2025 at 08:21:39AM -0800, Luck, Tony wrote:
> On Fri, Dec 19, 2025 at 03:45:42PM +0300, Dan Carpenter wrote:
> > On Fri, Dec 12, 2025 at 02:30:48AM +0900, Daniel Gomez wrote:
> > > Maybe the flag fix just needs to be applied to the evaluation? Other op
> > > structs do the same. But Dan's patch did not implement evaluate. E.g.:
> > > 
> > > static struct symbol_op constant_p_op = {
> > > 	.evaluate = evaluate_to_int_const_expr,
> > > 	.expand = expand_constant_p
> > > };
> > 
> > I was waiting for you to send this as a patch.  I can do it if you
> > need me to.
> 
> Al Viro thought this was wrong. His alternative patch is here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/viro/sparse.git/commit/?id=2634e39bf02697a18fece057208150362c985992

Sparse still is PITA as of today, can we get some fix (Al's or alternative)
ASAP to be applied and sparse tagged as 0.6.5 so the distros will pack the
new version, please?

-- 
With Best Regards,
Andy Shevchenko



