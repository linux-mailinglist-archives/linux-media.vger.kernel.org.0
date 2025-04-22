Return-Path: <linux-media+bounces-30679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A2FA95F88
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9447D178DA8
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 07:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE221EB5E7;
	Tue, 22 Apr 2025 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiU1pBpX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02E1EA7EB
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307203; cv=none; b=SHhAWOAIPWpR+U6JmUq3+3nhHBQIvwBIgieUmelGV1ZpXrVRg2vPfIZu2+BF2Ap/F5vg8zZUOoR+fQtLpJvaR1qm1zosxYM8I1YLeZXC4lp10QeZFvc7d6wHrpcjnCiJO5DcaYou8V00H32Oe2rrMLmNck/vn2EAXligYRYgioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307203; c=relaxed/simple;
	bh=weSFX5tEpk8W1IgT2CqrHqhWI7Eib/GIF1I8pLS+fSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEcABGGH/Zp6SrIUetwImPd5ZoUufEqlmkSV5CIXnrkXcxDNobEEfx1YYkvOq1+LqaeJlngGuvLKOj+Qw6Y3b20AchIPkoSKA+8a6m8+WWFU/umpvhcMLoSvfV1rcPXydurAaC8HBhndiv0EJ6kndSUCqUQ3SQ1GbVvRJcHytKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiU1pBpX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745307202; x=1776843202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=weSFX5tEpk8W1IgT2CqrHqhWI7Eib/GIF1I8pLS+fSY=;
  b=LiU1pBpX/2Kya9RTeOIjIPJaK3BFUeRDk/GZJjrTVuDUHtLQsra2TUjm
   q97DYPH7iumYU3xh01gTAYa+0FhMPTcLhIxdT2M7s7hp0nd9DnSOw6G1s
   ihf3P44HJYrMz7onieiq+EdDBbePMMJxidI97E3BjHEoIjqbbSAOequ6D
   bAC//J2rlVVoI6+1ayCnOPKxOYqqZ5BUKADmcISwQCOhl1MTa4qKykJ/9
   rdM7PH5hGErEXcdmZyoDfCD3ZJ0eXYeFoX2I1pMKCoCqqLneMWJEuYLlU
   KGs412IXRzXtpNa/bO3Bgb40yTkVcn+Ds416y1TCubHCqIpDhDuCwOhtD
   Q==;
X-CSE-ConnectionGUID: oI5R2ZTcSYuC5fBkoAFWXw==
X-CSE-MsgGUID: 9pyY78bwQyG030jRG/Yzbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57500933"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="57500933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 00:33:21 -0700
X-CSE-ConnectionGUID: 6V0wC2nLRVmdwjH3Ym5HbQ==
X-CSE-MsgGUID: H7vf8i7rTYizXSgLGyIGKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="131781927"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 00:33:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EA13E11F871;
	Tue, 22 Apr 2025 10:33:11 +0300 (EEST)
Date: Tue, 22 Apr 2025 07:33:11 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v2)
Message-ID: <aAdGN8QaxU4XQcL2@kekkonen.localdomain>
References: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>

Hi Hans,

On Mon, Apr 21, 2025 at 02:31:34PM +0200, Hans Verkuil wrote:
> Also, as you can see we are light on topics, so don't hesitate to add more.

I'd like to propose identifying camera modules as a topic.

The camera module isn't a functional component in the system and so has
(mostly) been omitted in system firmware as well as UAPI. Being able to
identify it, however, is becoming more and more important as the user space
becomes less and less system specific, largely thanks to libcamera. This
isn't just about passing information to the userspace as identifying the
modules themselves is a problem on its own.

I intend to post an RFC set regarding this to LMML at least a week before
the summit.

-- 
Kind regards,

Sakari Ailus

