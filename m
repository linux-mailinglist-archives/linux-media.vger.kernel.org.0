Return-Path: <linux-media+bounces-22265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC99DBD53
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C160164A59
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9E51C5793;
	Thu, 28 Nov 2024 21:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FB7HtqZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593E01C4A09;
	Thu, 28 Nov 2024 21:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732829246; cv=none; b=NmhNEMpZIR/gs7RhBMkl2WnZWuEVf9kxX2m5Dobk0HD+NtlICbjDQMKz2qv7pDFVLReyaOyptG34qHENsJem2aSzsH28DrXYEuzopZ3iumDoxWkPUl9/A8JGW7sfWpQFCsVzjMwJqd8op8Xz8g0NSEvVg61wLbp3EmsbJwCOlKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732829246; c=relaxed/simple;
	bh=s+VcTU5fuPZKU8olrgmoGGpranj3388WNP5HiwpP3Hk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cf7uAZ2W7lWFlVmK4iLx9WTGDpmYDvbkTL9taGikolVSDHBfRMQUkuyC0wSh71QkeaQMabtCh4X+5rV5ZAFuIsIBXtVZq0nmKkkJhgLVzfkWIFqPtTqaCywqMyWP4NzL2dAZWb1rmY96wRJeyxTtG9rNaT2HN+LP16R8KFZFeKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FB7HtqZ2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732829244; x=1764365244;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=s+VcTU5fuPZKU8olrgmoGGpranj3388WNP5HiwpP3Hk=;
  b=FB7HtqZ2xPRdDFCIXrJnFDzRKoB32m44xSt+dPDlVGKMP1/LYYH3NPGK
   8psaF/irEVrIf9HhzuG9WwXGWOM1jVykqljIHeF9oTsw8M7mrnVGOhWJP
   zINse0raVR5UKdafxXoYUH99aRRF3RCcxI/or9a9KZr5QA6YhgBH0b3pu
   WqfFVN8dB5kMJqSQO5Fhf0j1likfBP7vOTcUh2xE/cPyypxiFL31SIdpl
   fHzWUjxSOGJ+g5p1TXK2WIBI4mSdhaUILSX0711RDxDRJWjmWrFDlIzqN
   NIzx15HlSIRAItEiwV1DxR1rYFgN3YytBuHZcUaCm0gdeISmvRju3YVmi
   w==;
X-CSE-ConnectionGUID: iGZ4Z6PGTseeQgnxnrFuXQ==
X-CSE-MsgGUID: 9OYGOmyORGm9p7Vhwg3u/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32929821"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="32929821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 13:27:15 -0800
X-CSE-ConnectionGUID: Ao3IuNX5SI+PJIXiwIkb7A==
X-CSE-MsgGUID: V1Su/k2tRme7ZsCtGIrBig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97424569"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.199])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 13:27:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org, Hans Verkuil
 <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
In-Reply-To: <20241128194758.7d2e7656@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <20241127103948.501b5a05@foz.lan>
 <20241127111901.GG31095@pendragon.ideasonboard.com>
 <CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
 <87iks7wqi3.fsf@intel.com> <20241128194758.7d2e7656@foz.lan>
Date: Thu, 28 Nov 2024 23:27:04 +0200
Message-ID: <87v7w76od3.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 28 Nov 2024, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> We used to have a low bar for entry on our past multi-committers
> model (back in 2005-2007). It was a disaster, as one of the
> committer did very evil things. He was blocked, but that didn't
> prevent some of us to be threatened with physical violence - and 
> some people even reported death threats.

While I understand the hesitation, I don't think it's fair towards
potential future collaborators to distrust them based on a bad actor
from nearly 20 years ago.

>> Frankly, I'm not fond of the invite-only model. You need to be careful
>> to not lose transparency.
>
> The intent is to be as transparent as possible without violating regulations
> like GPDR.

I have no idea how GDPR would be relevant here. We don't collect data,
other than what's in git.

>> I think it's also important to define merge criteria. A set of rules by
>> which a committer can commit. And it's not really about technical
>> checkboxes. For example, in drm it really boils down to two things: at
>> least two people have been involved, and there are no open issues.
>
> That's the same criteria we're aiming for. We'll start without
> two people reviewing, as there won't be enough committers at the

It's not two reviewers for us either; it's typically author+reviewer and
either author or reviewer commits. Two sets of eyeballs in total.

> beginning for that, but maintainers may revert/rebase the tree in
> case they don't agree with changes.

Not sure if you really mean it, but saying it like that doesn't really
breed trust, IMO. Sure, there have been patches merged to i915 that I
didn't "agree" with. But bad enough to warrant a revert? Very few and
far between, and always for clear and concrete reasons rather than
anything subjective.

Side note, we don't do rebases in the development branches.

> Currently, for most of the drivers, the number of committers per driver
> is equal to the number of maintainers for the same driver.

FWIW, I think that pretty much matches how it was for most drivers in
drm before the committer model.

> So, on this stage, we're aiming on get maintainers commit rights,
> starting with the ones that are long time contributors and regularly
> participate at the media summits.
>
> Once the "slow start" phase finishes, we can review the process and
> start thinking on getting more developers and committers.

Just saying, it's easier to convince people to become committers with no
strings attached than (co-)maintainers with a bunch of responsibilities,
such as review or travel obligations.


BR,
Jani.

-- 
Jani Nikula, Intel

