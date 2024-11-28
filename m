Return-Path: <linux-media+bounces-22213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 487D19DB676
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 12:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A4E328186C
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 11:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED6C1990BD;
	Thu, 28 Nov 2024 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpGIm2tE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866DC198E79;
	Thu, 28 Nov 2024 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732793053; cv=none; b=XMx1s2433WXR0HPA3i7UHD46Pq9CbClDyr78+EcViPFDCbfm0Ey5EPF7rrUjZfDSzbz29gcVHbeIaOx/xfDPEwYujVqDd47c27TC7M6DiuCDROn5BLUnu5oNCdR4Jr+Bd7WqHm1c0g6ptFnB9zyuyNbkFOPk+RKFzPi62BGShX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732793053; c=relaxed/simple;
	bh=3qYw6sbQwTjAO4cbxnbZyxUrM8JgP+DtciHJoCIKZM8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cg+45rPTcuhSpMGC/aeFPKRDYVexYYkh8QBODkGmgImy7wRM+qLgd+zw3eldmXY2cSbxSaHocgWffBqJhrfHONiEruGXOGAhZWG8ADhqGXxrJutg9cQWWoYkF/uUteE2uDfaXKP3h3p/phksrtdTQT7I+TtUUBR1b0NecobbH64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpGIm2tE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732793052; x=1764329052;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=3qYw6sbQwTjAO4cbxnbZyxUrM8JgP+DtciHJoCIKZM8=;
  b=fpGIm2tES2Ngyl8qpFMroOD3e4PZBax0aahyDuBbln02DWQbudc4J5WZ
   L/4D+RfAaRSEYvlZBKqS5Fd1OJRYmNgak/ZLhLemCsi32Jo+FnmfawKeT
   Mev+ZXAtuNLiIoibCVLfcG9tfUxxWU9eTc1kp2tCa4kPEW+QAdLbe2QUI
   U/KGfTVoW8Hl38SDn66mRshyiiS4Q4nVqdSN0irBlph9+jitIA2CU0bKC
   CPezPiaxfeSFvKxY/6l4KjyZQAnmV7QSnVaLBReKzKKGGlMqeIUx+mnZf
   Ny6rr9pCVMZ7XJarxp63Bc3i5sPUslNidJKZPSqvu7c6vNX3cuIwJyizJ
   w==;
X-CSE-ConnectionGUID: CIr3L3SoSQi6ssTNzx8/8A==
X-CSE-MsgGUID: VdABw12tSXSlnkzBqKvqEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43511723"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="43511723"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 03:24:11 -0800
X-CSE-ConnectionGUID: qCuUbDpkSeKN6EFU4FEsEA==
X-CSE-MsgGUID: oDCx/odFSc+Yiqe/JAtvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97269350"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.180])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 03:24:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
In-Reply-To: <CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <20241127103948.501b5a05@foz.lan>
 <20241127111901.GG31095@pendragon.ideasonboard.com>
 <CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
Date: Thu, 28 Nov 2024 13:24:04 +0200
Message-ID: <87iks7wqi3.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 27 Nov 2024, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> Jumping in the middle here with some clarifications.
>
> On Wed, 27 Nov 2024 at 12:19, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>> On Wed, Nov 27, 2024 at 10:39:48AM +0100, Mauro Carvalho Chehab wrote:
>> > It is somewhat similar to drm-intel and drm-xe, where reviews are part
>> > of the acceptance criteria to become committers.
>>
>> Those are corporate trees, so it's easier to set such rules.
>
> Imo it's the other way round, because it's corporate you need stricter
> rules and spell them all out clearly - managers just love to apply
> pressure on their engineers too much otherwise "because it's our own
> tree". Totally forgetting that it's still part of the overall upstream,
> and that they don't own upstream.

The required commits and reviews to become a committer may sound
somewhat artificial and arbitrary, but it's a sort of compromise. The
goal is to have a relatively low bar for entry, while ensuring the
committers have just enough experience to judge whether a patch passes
merge criteria (more on that below). It's also the same for everyone,
and something to strive for.

Frankly, I'm not fond of the invite-only model. You need to be careful
to not lose transparency.

It can be scary to have a lot of committers. You put a lot of trust in
them. But at the same time, you do monitor what's going on, and can
revert commits - and commit rights, if needed.

> So that's why the corporate trees are stricter than drm-misc, but the
> goals are still exactly the same:
>
> - peer review is required in a tit-for-tat market, but not more.
>
> - committers push their own stuff, that's all. Senior committers often
>   also push other people's work, like for smaller work they just reviewed
>   or of people they mentor, but it's not required at all.

I think it's also important to define merge criteria. A set of rules by
which a committer can commit. And it's not really about technical
checkboxes. For example, in drm it really boils down to two things: at
least two people have been involved, and there are no open issues.

(And have those people recorded in git trailers with Sob/Rb/Ab, with
tooling to ensure that's the case. There are very few commis in
drm-misc/drm-intel without either 2xSob, Sob+Rb, or Sob+Ab.)

> - maintainership duties, like sending around pr, making sure patches dont
>   get lost and things like that, is separate from commit rights. In my
>   opinion, if you tie commit rights to maintainership you're doing
>   something else than drm and I'd more call it a group maintainership
>   model, not a commit rights model for landing patches.

Agreed. Personally, I like the committer/maintainer model, because it's
a low barrier to entry, with limited responsibilities. Not everyone
wants to become even a committer, and the more loaded it becomes, even
less so. Yet the committers help maintainers immensely, and you grow a
pool of people who can become maintainers.

> Anyway just figured I'll clarify what we do over at drm. I haven't looked
> at all the details of this proposal here and the already lengthy
> discussion, plus it's really not on me to chime in since I'm not involved.

To be honest, IMO the length is one of the shortcomings of the
proposal. Lots of up front process, which will inevitably have to be
ironed out as you gain experience. You just won't be able to figure it
all out in advance.

All that said, I commend all efforts to move towards shared
maintainership models, whether it's group maintainership or
committer/maintainer model or something in between. Just offering my
views here, which you're obviously free to completely ignore to your
benefit or detriment. ;)

BR,
Jani.


-- 
Jani Nikula, Intel

