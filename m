Return-Path: <linux-media+bounces-63194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id E3lzAyWcHGqVQAkAu9opvQ
	(envelope-from <linux-media+bounces-63194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 22:37:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 465CB617E4C
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 22:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A6B53019912
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 20:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FF33603DA;
	Sun, 31 May 2026 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6pzRw5a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9579116DC28
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780259868; cv=none; b=j4EiI996AHzh+Z90I20Rv1EBQKgqjiOdmji69vrr5VjhKFt+U1dweRYAyAGi1/oxHFbrCWFupxFY6aYfatHaJo/27fRo1G8QCZhy6t4yTwEx0r1e8NjwFkkRIQaFzSGQ2QSvcXUnY81Z31UOTSL5W5H8mQ7mTjbXFUa0+rPInEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780259868; c=relaxed/simple;
	bh=KwYeUkzqi5U7j0BCH7VQrtvzZzZA0KXB3RX3yoLOE0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9v281MP5RL1AojRf6CMAmUCC6ZvQYnzNXahR0+yNTgqgGRz3gZoBnp1y+3pcUIqEwtHW/U+y91izkC/9XqZGlu2z81i8cxJEJdkgVnHh1vl1wBfYF9eDzMdLAOuPeU+27o3GPCwR9Gdab+Rgt33ep1JFnE7ovEmCmqr4AgQKd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6pzRw5a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780259867; x=1811795867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KwYeUkzqi5U7j0BCH7VQrtvzZzZA0KXB3RX3yoLOE0A=;
  b=U6pzRw5a4V37PwhFwgeW/S9TQLncXV/myW7UZF3IEN75swIRvo8hT2Kv
   a2dTCVUJV/vP/KCr5lrLaqZO5sB89RuU2f8xYnJqFM/Ly0QoojmfT/MbW
   6wRf/blMlw15xsxCVr6qh7ZUeF0K/MzbWtyBDj5QftHIov1XiayqN3Mc5
   ZDdAI0uaX7OZlobUJi7IKN+5jg3/+/lQPeKzARTsvlOXuAL3HdJx1JkGa
   ItSEYvsZM2Y/+FXCOqTiW+kN8q2hZ+XcO+TCYSP5q6nAoqlfbjkWbhJUk
   oJ3zmAbSyIpXmGQpmBwD1Or5h6vBIZwNqkqkYF/QKUHA6TINlk3UlUNrg
   g==;
X-CSE-ConnectionGUID: ekA5yuP8RqaOSFWMi5IeSA==
X-CSE-MsgGUID: Fq7hpXKFSJyLW0RA50Ypeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92407789"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="92407789"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 13:37:46 -0700
X-CSE-ConnectionGUID: T4cbvg8rR6u4WTdO8bss5g==
X-CSE-MsgGUID: pPMjAA0YSz67CuVMFB6qoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="243226276"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 13:37:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6F11411FAA5;
	Sun, 31 May 2026 23:37:37 +0300 (EEST)
Date: Sun, 31 May 2026 23:37:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: media: ipu3-imgu: Ensure correct binary
 selection
Message-ID: <ahycERlz_hbEiY1p@kekkonen.localdomain>
References: <20260522225402.247080-1-sakari.ailus@linux.intel.com>
 <CANiDSCtH7treRe_2Y7h9YoiAfRGXZoX9pHNpLhcaoT2qS5+mFA@mail.gmail.com>
 <ahVZAJrW8RxpWe8U@kekkonen.localdomain>
 <CANiDSCufMS4b14QJxaC0vs2joy1r4y04AFDMOphFObwUOLasRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCufMS4b14QJxaC0vs2joy1r4y04AFDMOphFObwUOLasRA@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63194-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 465CB617E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

On Tue, May 26, 2026 at 10:32:56AM +0200, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Tue, 26 May 2026 at 10:25, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Ricardo,
> >
> > On Mon, May 25, 2026 at 05:08:51PM +0200, Ricardo Ribalda wrote:
> > > Hi Sakari
> > >
> > >
> > >
> > > On Sat, 23 May 2026 at 00:55, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > The ImgU has two sets of binaries, those that support striping (fixed at
> > > > 2) and those that don't. There's overlap between the stripes and so that
> > > > implies a minimum width for the images themselves, or the Bayer downscale
> > > > rectangle in particular.
> > > >
> > > > Take this account in binary selection.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > > Hi Ricardo,
> > > >
> > > > I'm not sure if this makes smatch happy but it somehow addresses the issue
> > > > it found. In the end it's up to the userspace to configure this
> > > > correctly...
> > >
> > > Smatch should be calmed now:
> > >
> > > https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/c32fe4c4918c9aa49f61359e3b42619c4d8686de
> >
> > I dislike that because it's written simply to appease smatch and does not
> > properly even try to address a problem. Can you try to revert it once
> > this patch is merged? At the very least we need a comment on why that check
> > is there.
> 
> I think instead of reverting the patch, I think it would make more sense to do:
> 
> - if (offset > 65535)
> + if (WARN_ON(offset > 65535))
> 
> I believe it would be safer, that way if the condition changes in the
> caller we will catch this error earlier.

Is there a need for an extra check in the code if smatch can perform it at
build time?

-- 
Regards,

Sakari Ailus

