Return-Path: <linux-media+bounces-56087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MbwAgtXuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:28:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A53B32AADDB
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BA13306A535
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5FD3CB2E0;
	Tue, 17 Mar 2026 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+1HvZoW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B03CB2DB;
	Tue, 17 Mar 2026 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753913; cv=none; b=iaC6nv9XiN87QBY6kILpvX98+fmehSYSlCHmuMIl1gfo87QqMFjoarEwNOxRbjNYUcY5kIvAi2E3olI/Bk9bcJB6/qZQk4Al4rt5eVJkrI7XOM9OxZABUWjAo5I0n0RmGIZW/98t6GsiD95G2p5N+LnBmVO2Sz6qCXP7KKfsUvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753913; c=relaxed/simple;
	bh=dBuwjzBB1D62lvk1sNa+xg+p0CTXR/Rqr/9U+GnpvYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tk/q5C/kd8xBcghntgPjQ1XLccgSuerj5SKqaHBIRp2TsPuMsn81AJbp4G/vqdrUEUv7AEEOHV8bnsLxJULPcY4oCyo3GIX67HsjASUPeQQoQzdBNs2Yg8S9W03e2GfkQ1i1xa2HXAocrq/afNFEghyxf5ordgGP/LS+gpJvCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+1HvZoW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753913; x=1805289913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dBuwjzBB1D62lvk1sNa+xg+p0CTXR/Rqr/9U+GnpvYI=;
  b=Q+1HvZoWghVhjCawDoxmw8wxfqvh0qauVRGeUqN45v5XdbpLDW47dkd4
   J0glU0ws+sZilk0GEKVwgZAPf2g6r+STGyl7O7389m73KCpEszVY9plhJ
   +TTgZatqfpm9cjv+0DpafxfMpfeU1KiQ2uqnoPil9WVj4uJM/IG+9oDed
   B5Q+2iqtyDQuTrlczqrZHJHXe+Zy+JxiUFAZu6A9LJnQIQ8HJNjZmtsTj
   cWvLlEdjB/u/AP4J8BHLotwox6zsRS9F1GgyIbBlbnWy9EhJCRj1J3E5t
   943coWaBqFelSJVG5pBsGryxEp8c1EFod6RU9QpDmplcibPbaKaqxzjAj
   Q==;
X-CSE-ConnectionGUID: iMesU8qMT/mKCpQpNEA3vw==
X-CSE-MsgGUID: jqUHU3YuQHyvX4c7RMJtHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77396018"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77396018"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:25:12 -0700
X-CSE-ConnectionGUID: ezJlcV8uR1aquGhY3Y7RQQ==
X-CSE-MsgGUID: dbuiYPI0Shm6Fo2aVj+CLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218410447"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.171])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:25:07 -0700
Date: Tue, 17 Mar 2026 14:25:00 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, 
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Collabora Kernel Team <kernel@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] Documentation: admin-guide: media: add rk3588
 vicap
Message-ID: <ablV_XW5c7k2_vAX@mdjait-mobl>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-1-77de5ee9048e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v2-1-77de5ee9048e@collabora.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56087-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,linux.intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: A53B32AADDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Michael,

Thank you for the patch!

On Tue, Mar 17, 2026 at 10:32:19AM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add a section that describes the Rockchip RK3588 VICAP.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

--
Kind Regards
Mehdi Djait

