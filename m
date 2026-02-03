Return-Path: <linux-media+bounces-52096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM5JKojFgWkcJwMAu9opvQ
	(envelope-from <linux-media+bounces-52096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 10:53:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D18D7228
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 10:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D0E8308CE1E
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 09:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E9739903A;
	Tue,  3 Feb 2026 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGsC6LzA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0045639902A;
	Tue,  3 Feb 2026 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112233; cv=none; b=WKtFY8fQW/COqEPaeflUbBMFVNJ2n8N41v0+m/lqHlUuinVoLNywP8F3HP2qZRcx+pw9za6v7ZRvHRMKPeNUpf+oBPepTQc9DylwWu7OSoTF0yG+DeOnKJAZwxiTxbSY7cXFRpwCdxCDQvlVURZy/GQbOMJOT4pp3KyLfo5pYDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112233; c=relaxed/simple;
	bh=ZTSYrKMtVQj06vXdZ47qauDE9JYI1808PQ2qR7pe4Gg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hPB1PRxlrlRozx3sAVX7d79p0vp6p7GsxLzCEm1SOEaQ5cSik4mZ4JH9/plUBnazyBAMELa6GF4n9KyABIX2dQtOPPZvvq8xwXZ+qWUzO32/KFmX+W5GYCnQNT9rgZruenARsnsm/crBwBad15yeGHaTy2ok9keHU2At3n9KRkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGsC6LzA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770112231; x=1801648231;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ZTSYrKMtVQj06vXdZ47qauDE9JYI1808PQ2qR7pe4Gg=;
  b=PGsC6LzAFmJXvIcTvlBdVHbfFdQlFfJaEFiRQEGc44ziaTavzzcawlLq
   I4m6fa3v7axEXUH2RRMLSaG/I4aArAL9VRHlAJ7ZuyDzG/q5QJFkTvH8E
   IqrqZDf14ZJTSg6xZyndQxdE5Lzb9RBkBtNQaiuGKRVsqjMIyhcW/Hm37
   zhx+eU4KPlY8n1JpbIzhA0sg3HoHb6iYZXAnxfO+DEfmXyk37cwWj3ISg
   uBKEI5w1NLf92Z56+9NDY4tzfgibM/dUe6HDYAK0OfpqNRuZf0w7+yhyU
   6pYKIBb/+7RIQeaCZ8h26vj1KHd/UVGOpsXUEBlXskCqXj/fDjHyyUkdE
   w==;
X-CSE-ConnectionGUID: S43sHNBqRe2SYOTxVHf+Fg==
X-CSE-MsgGUID: oIPVwsOdQCO4AR6wkRAQFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82016099"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82016099"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:50:30 -0800
X-CSE-ConnectionGUID: vfrlZdaTTOSDGI/6NL6wzw==
X-CSE-MsgGUID: yprZcBEHSkSsgErbjOFqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209088693"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.205])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 01:50:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jarkko Sakkinen
 <jarkko@kernel.org>
Cc: linux-media@vger.kernel.org, anisse@astier.eu, oleksandr@natalenko.name,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo
 Mondi <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda
 <ribalda@chromium.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
In-Reply-To: <20260201200649.GW3374091@killaraus>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260201133342.335680-1-jarkko@kernel.org>
 <20260201182011.GV3374091@killaraus> <aX-joEDl_BJai8wY@kernel.org>
 <20260201200649.GW3374091@killaraus>
Date: Tue, 03 Feb 2026 11:50:23 +0200
Message-ID: <c6b719fdecbfc8a1c15a197b6ae51da56ed54f63@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52096-lists,linux-media=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30D18D7228
X-Rspamd-Action: no action

On Sun, 01 Feb 2026, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> On Sun, Feb 01, 2026 at 09:04:00PM +0200, Jarkko Sakkinen wrote:
>> On Sun, Feb 01, 2026 at 08:20:11PM +0200, Laurent Pinchart wrote:
>> > On Sun, Feb 01, 2026 at 03:33:38PM +0200, Jarkko Sakkinen wrote:
>> > > vcam is a DMA-BUF backed virtual camera driver capable of creating video
>> > > capture devices to which data can be streamed through /dev/vcam after
>> > > calling VCAM_IOC_CREATE. Frames are pushed with VCAM_IOC_QUEUE and recycled
>> > > with VCAM_IOC_DEQUEUE.
>> > > 
>> > > Zero-copy semantics are supported for shared DMA-BUF between capture and
>> > > output.
>> > >
>> > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>> > > ---
>> > > Early feedback e.g., is this completely in wrong direction? V4L2 world
>> > > is relatively alien world, and thus I need a sanity check ;-)
>> > 
>> > We already have multiple virtual drivers, including vivid and vimc.
>> > Could you please explain the rationale for yet another one, and why the
>> > new features it provides (if any) can't be added to existing drivers ?
>> 
>> There is a notable user base for v4l2-loopback. It is the defacto choice
>> for streaming phone cams.
>
> This will then likely face the same hurdles as v4l2-loopback, the main
> one being that camera support should be upstreamed with proper drivers
> instead of a closed-source userspace daemon.

My use case:

Input screen capture and webcam into OBS Studio, output the combined
scene into virtual device, and input that virtual device into an
application that is designed to work with video devices like that, and
is not aware of anything fancier. For example, a web based meeting
software. [1]

There's nothing proprietary or closed-source here. AFAICT using
v4l2-loopback is currently the only method suggested or supported by OBS
Studio, or the plethora of apps that only really understand the video
devices.

I don't want to use that out-of-tree module from distro DKMS or
whatever. Please enlighten me (and apparently a lot of other folks) if
there's a better option that can be made to work out of the box. And it
pretty much has to be as simple as 'apt install v4l2loopback-dkms'.


BR,
Jani.


[1] https://obsproject.com/kb/virtual-camera-guide


-- 
Jani Nikula, Intel

