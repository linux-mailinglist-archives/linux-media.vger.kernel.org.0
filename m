Return-Path: <linux-media+bounces-59071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dpezJ/xS42l2FAEAu9opvQ
	(envelope-from <linux-media+bounces-59071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 11:46:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A34209A5
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 11:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D42630329AE
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 09:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7885F2EF64F;
	Sat, 18 Apr 2026 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iw7QU0Wk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F972AD2C;
	Sat, 18 Apr 2026 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776505584; cv=none; b=OQJbpBrAL8GJfZ6mvKbpggxHAU6ud3uBV3FaBqI5K16Ds87f/1Fei2VSgVg6c3L3L01GwmwqO2K4SeDHHyN3CGlAUj8/m3B395FMrUk+vxhh/uGFNuXyVijKC65LlfVUbzQutHbcLZFSwibUyo+6egmYBvdTC+JpgBFBjyae31A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776505584; c=relaxed/simple;
	bh=R+ceDlGe4KqOor22BFlrtyzKhwJI/K28p0eZxTHlsf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgilyhbxMYn/pRYFEx2trN6nEC+QG01eQwvyxt9kuFfCanM7lWa5T6FR/nWxfaemv+d8bjKcIwnCI9RX4GVNKT1duNyV5SCnc+DnDcfi1HvaZ/gKLl05WdemAGrktCr2fOEgjO+qJ87AQtzDOvnGQCZQwVUI8YFy9BVY8ZnTf8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iw7QU0Wk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776505583; x=1808041583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R+ceDlGe4KqOor22BFlrtyzKhwJI/K28p0eZxTHlsf0=;
  b=iw7QU0Wk4Jg/jb+O17LYCm4k0HahtZBOk+sEue0ymYDEy7H6a9EOpTKJ
   2qjWkccGLxVHMNjW385O5erqh89kMY1499VJKmz2CoxsldIxfGuOf171y
   cohfA94t7HZlJr3qGtPp0zqpgNsquP5QzGpvakSBco0XmxVU3Hopo3qVc
   MiC063dRvpJadfd3xT5Wt7ukbuDCzN6wvuIjOtB499w73/Oe683VzYprs
   Y+6vzb2XIJgsbRY6DACJsvPmygQWNXaxksfobCGm6uj/3EFuA6/WGJBGm
   pbgaE7TK2UXhT1Rd6f3AsXI9bee/v4Hzek0lA04gOqixgd+H9GmKAi6z6
   w==;
X-CSE-ConnectionGUID: UIqLoDriRBCUPbPJrn1DLw==
X-CSE-MsgGUID: iDAU+HoNTS2HRqJhAt9J0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77689943"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="77689943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 02:46:22 -0700
X-CSE-ConnectionGUID: KMAlhpcTRQeUPBONXrz/KA==
X-CSE-MsgGUID: yLlqNVNnQ66W5nwMH8UaTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="230246083"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 02:46:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1DBE312081C;
	Sat, 18 Apr 2026 12:46:17 +0300 (EEST)
Date: Sat, 18 Apr 2026 12:46:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Robert Mast <rn.mast@zonnet.nl>
Cc: hdegoede@redhat.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, Robert Mast <rmast@live.nl>
Subject: Re: [PATCH 1/1] media: atomisp: mt9m114: Graceful teardown atomisp
 and mt9m114
Message-ID: <aeNS6dP4wcPuRUpk@kekkonen.localdomain>
References: <20260418092651.7873-1-rn.mast@zonnet.nl>
 <20260418092651.7873-2-rn.mast@zonnet.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418092651.7873-2-rn.mast@zonnet.nl>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,vger.kernel.org,lists.linux.dev,linuxfoundation.org,ideasonboard.com,live.nl];
	TAGGED_FROM(0.00)[bounces-59071-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[zonnet.nl];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C70A34209A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Robert,

On Sat, Apr 18, 2026 at 11:26:51AM +0200, Robert Mast wrote:
> From: Robert Mast <rmast@live.nl>
> 
> Signed-off-by: Robert Mast <rmast@live.nl>

Looking at the patch, I presume it wasn't sent intentionally and so I'm
marking it as "changes requested".

-- 
Sakari Ailus

