Return-Path: <linux-media+bounces-18612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624179871A3
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 124752856E4
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266861AD412;
	Thu, 26 Sep 2024 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5NKbBvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67617BB30
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346945; cv=none; b=fc2pTTmKErChjSWWLuYR4lpqPgH8anInrnTebI+jdPEIRfM2H+X4uHhz4CXvf869Tbt/Jmt0yJg9zkbjIO3mEVxMUnRJZBfF1lXAmgBAMBi5BmMU/pWjtWR62/l+wcMTRoWBOsydqKQIleAs5ziIk3cWqW/vA3d7Toxd9SseCDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346945; c=relaxed/simple;
	bh=SUuVSGpk5q02Dm4uJBEsvhHiRGQGez1yiKQYfuHXQ8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+FqbL1AfWF+qjvihk9F3zshA1qORzDJ8PnIOmfEQzcc5Yk0EvCcWt6ocVTZ7lUzB8of/ZJL/Dhhgd6u/mTUGBpY98ZlCi66cdHKLc1izR694rcMucRH1wYYHpkDOrrpBWks0aG5NxTM10CN9jbQhBPM7SeXo6XBPx7BH4PSdf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5NKbBvj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727346943; x=1758882943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SUuVSGpk5q02Dm4uJBEsvhHiRGQGez1yiKQYfuHXQ8Y=;
  b=C5NKbBvjmlZ59yRrOrWDZ1jCUcSCd3eyEchB8SU1iEKeN6Ltie6nsUVm
   7XDls+7BaRuXlnHOqXd88Ydc7BGyKhB4H9x0w9mcMwQXnIj2Yxhp55w4W
   iGMYqCU1IhQ2tm1M8bRSGUQCGOY3yqguES/m6shlEA0ekLqt+TrUMJ9wX
   Inf28jX64BJ9SaymGPrYE5NlAQJdMbMBSghghIPjVQIMX49CZOaKEQQ5t
   9RR0uWXqOlXAdOiM6A3Fe125iHPVc4dTHa79ehxdGtMHE3MTmi5tjuAGq
   LBehPQAsnCFxWzMFUZlmOX+aEM26kgbcDPCDDmiNhrH0aR9XEeLkMxDhz
   A==;
X-CSE-ConnectionGUID: aV40cHKjQpabsxslYFJXIA==
X-CSE-MsgGUID: WyQEOSsOSxurRkQFb02IeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="43902512"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="43902512"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:35:42 -0700
X-CSE-ConnectionGUID: O7xYiYQwQQ2ND+EyKxt0eQ==
X-CSE-MsgGUID: M7n3RZd6RQKDNgwonamNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="76920089"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:35:37 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 914C311F843;
	Thu, 26 Sep 2024 13:35:34 +0300 (EEST)
Date: Thu, 26 Sep 2024 10:35:34 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <ZvU49mrccFlKDhD0@kekkonen.localdomain>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240925195843.GK30399@pendragon.ideasonboard.com>
 <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>
 <ZvUpuopPY8lwBHEm@kekkonen.localdomain>
 <20240926121914.69b47a50@foz.lan>
 <20240926102448.GA21788@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926102448.GA21788@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Sep 26, 2024 at 01:24:48PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 26, 2024 at 12:19:14PM +0200, Mauro Carvalho Chehab wrote:
> > Em Thu, 26 Sep 2024 09:30:34 +0000
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> > 
> > > > >>> Can you refresh my memory which processes need more work?  
> > > > >>
> > > > >> I have the same doubt. As discussed during the summit, Hans and I had some
> > > > >> discussions yesterday, to address a few details. For both of us the process
> > > > >> sounds well defined.
> > > > >>
> > > > >> From my personal notes, this will be the new process:
> > > > >>
> > > > >> - committers will merge patches at media-committers.git tree at fdo,
> > > > >>   provided that they'll follow the rules defined on a committers agreement
> > > > >>   and (partially?) enforced by media-ci checks;
> > > > >> - core committers follow the same rules, with a broader privilege of
> > > > >>   changing kernel API/ABI;
> > > > >> - committers will ensure that patchwork will reflect the review process of
> > > > >>   the patches;
> > > > >> - maintainers will double-check if everything is ok and, if ok, merge the
> > > > >>   changes at linuxtv.org. We intend to rename the tree there to "media.git",
> > > > >>   being the main tree to be used for development;
> > > > >> - pull requests will keep using the same process as currently. The only
> > > > >>   change is that the media-stage.git tree will be renamed to "media.git";
> > > > >> - maintainers will periodically send patches upstream.
> > > > >>
> > > > >> The media-commiters.git tree at fdo might be rebased if needed; the 
> > > > >> media.git tree at linuxtv.org is stable. A large effort will be taken to
> > > > >> avoid rebasing it.
> > > > >>
> > > > >> We may need some helper scripts and/or use pwclient to keep patchwork
> > > > >> updated after committers reviews.  
> > > > > 
> > > > > What will happen if we update the status of patches in patchwork when
> > > > > merging them to the fdo tree, and the tree is later rebased to drop
> > > > > commits ? Will the person rebasing handle updating patchwork to move the
> > > > > patches back from accepted to a different status ?  
> > > > 
> > > > That should be the responsibility of the person doing the rebase. I think
> > > > that's what is done today as well in the rare cases we rebase.  
> > > 
> > > Sounds reasonable. I'd also like to avoid rebases as much as possible.
> > > 
> > > Do we have a list of cases where a rebase would be needed? A license issue
> > > or a missing Sob line, perhaps?
> > 
> > No, and I don't think we can write a rule to cover such cases. The only rule
> > is that it is up to maintainers to decide to do a rebase or not, and this
> > will be done case by case.
> > 
> > With regards to the cases you mentioned, it is almost surely that license 
> > issues will call for a rebase. The same may apply up to some point for 
> > missing/refused SoBs from authors, co-developers and from the committers.
> > 
> > Yet, I would expect that a more common case is if someone touches the code
> > and another committer/developer/author nacks with such changes.
> > 
> > So, for instance, suppose you maintain driver A. Some other committer
> > may end merging a patch for driver A without your ack. Depending on the
> > patch that could be OK (trivial/doc changes, bugs with bug fixes that
> > are available for some time, etc).
> > 
> > Yet, even if the committer did an honest handling of the patch, you may 
> > still disagree or want some changes at the original patch. On such cases, 
> > the maintainers may decide to drop the changes and do a normal review
> > process. They may otherwise request a patch on the top of the applied
> > one to address the pointed issues.
> 
> Let's do a revert in that case, and keep rebases for cases where having
> content in the git history causes issues other than bisection problems.

I'd very much prefer this as well: revert or fix, if at all reasonable,
instead of rebasing should be a rule.

> 
> I'd argue that even a missing SoB may not be a cause for rebase if it's
> an accident, but that's not worth debating because CI will make sure
> this never happens.

Does it?

checkpatch.pl checks should just be warnings. And that should probably
stay. Sob: and From: being different isn't necessarily that far-fetched as
having an address in .mailmap may change From: field but not Sob:,
resulting in a checkpatch.pl warning.

I wonder if checkpatch.pl should know about .mailmap actually, currently it
doesn't. I could send a patch.

> 
> > There is also worse case scenarios, like a committer violating the
> > committer's agreement.
> 
> I'm fine with rebases if someone gets rogue and merges malicious code,
> or commits with insults in the commit message. I don't foresee that
> happening regularly, if ever.

I'm more concerned of a malicious actor getting access to the committer's
credentials rather than the committer him-/herself going crazy. And if this
happens, changes are it won't be noticed immediately.

Reminding of
<URL:https://github.com/lfit/itpol/blob/master/linux-workstation-security.md>
in the instructions might not be a bad idea.

-- 
Kind regards,

Sakari Ailus

