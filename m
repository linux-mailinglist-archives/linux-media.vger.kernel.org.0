Return-Path: <linux-media+bounces-55354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIKkKDc0sWm0rwIAu9opvQ
	(envelope-from <linux-media+bounces-55354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:21:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 050152603D4
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FFCA321D605
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596813C6A50;
	Wed, 11 Mar 2026 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGBRY5XQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C03BB9FD;
	Wed, 11 Mar 2026 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220555; cv=none; b=IO3booPEzpLbcFAZyFCagEFCys8nzTDZYXvtYcpNSu9T7zzfR9NpdAmG0PTmnZJmDx4ncTqj91orYiizR82FliRZfNvwNc1dKvmMwed+fkFCIYj3hJBEONmsyJHL0RwEsoqBHr4PASIStGswRWZcfl4CNO6gkAl2ZOePXdts6+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220555; c=relaxed/simple;
	bh=m7nGXQYeAA0lsTx32pqb/ddeD4x4/BSl2e6adiOao84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtBuVCrWIoCaNo9C4iTls+PjXm9KEA6cEo9YRq3bGhcxsMrfk9BzA2U/NW+u5oXN5GuBLd9UeozVl9uTehRAdt7Xe0qjbVxFbLNTiJV5+O8YB3mTnWMS9/+vtId3a9eQ6yOCY3C9pZZGntYzZ9m/EadroFBTw4g7jnLWqGsPlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGBRY5XQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220548; x=1804756548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m7nGXQYeAA0lsTx32pqb/ddeD4x4/BSl2e6adiOao84=;
  b=aGBRY5XQnJt9MJMUSl5W2aodQcVi6MC0Zh/oeKLIBbUxn4php0Mn+NYZ
   QhC/9+R0X37CLedoEwwF18Oplaf3PIJuy7WBiMLcuP/YexKarZ97K3NWv
   3mDqigWWGBTeDCT5sF7gui/MVDSxokIdVtXntmo/P1Dn4btGVRyCpjlgF
   j/aillEtX2/Rtjqh1h7nF+R47OPw41xeFV37JejndEUM8b5i8HF3vr1aV
   1oute4A5aU1+vZI/ASvXiFclUpDZOMe1xJY5CiqFZETRHRLyKGmrw7jl8
   lm3azNZo/75TSddigrZ1E4pQvDsP7NUsbyz8B6UbVfP/1V51WXs9CYTRJ
   Q==;
X-CSE-ConnectionGUID: SwISaHbXQPeGvm7BwVxoDw==
X-CSE-MsgGUID: +0Tblh5dRX63yoVUNK1zkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96898238"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="96898238"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:15:47 -0700
X-CSE-ConnectionGUID: 2mnOGTD5TUeKm6rTvPhl9A==
X-CSE-MsgGUID: nsoV8RloQG6IFQnDG3LzmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="243411933"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.171])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:15:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8B00F121D1C;
	Wed, 11 Mar 2026 11:17:40 +0200 (EET)
Date: Wed, 11 Mar 2026 11:17:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: renesas: vsp1: Fix NULL pointer deref on module
 unload
Message-ID: <abEzNDElf7b2JVaQ@kekkonen.localdomain>
References: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
 <0a8c0467-04f7-4b8f-8988-cb5665ca1d68@ideasonboard.com>
 <abEwF39-dSVPWVAb@zed>
 <17915103-09f7-40a3-8330-dc4ecb6c3bd6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17915103-09f7-40a3-8330-dc4ecb6c3bd6@ideasonboard.com>
X-Rspamd-Queue-Id: 050152603D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55354-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 11:07:50AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 11/03/2026 11:06, Jacopo Mondi wrote:
> > Hi Tomi
> > 
> >    I intend to send out soon a series for other Renesas components
> > which shouldn't be controversial. If I can get tags quickly I intend
> > to send a pull request for v7.0 next week.
> > 
> > I can include this patch and your other one which I don't see collected yet:
> > [PATCH] media: renesas: vin: Fix RAW8 (again)
> > 
> > unless someone else intends to handle it.
> 
> Sounds fine to me.

Both are already in my tree.

-- 
Sakari Ailus

