Return-Path: <linux-media+bounces-56084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIOeH3JWuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:26:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 181222AAD35
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D38530B5033
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4758B3CBE87;
	Tue, 17 Mar 2026 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ca4EK0Zp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3453CB2E4;
	Tue, 17 Mar 2026 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753847; cv=none; b=TudyClpiBemdZlZIilK5QK1t5jTO5W44dJn0vYYjTlDBk0kVkhtLqDg5+Ul3jPbwUAUVeJN3NBnt523YmAdkXWxCCZ2/i3K4H8p0IZXkacFHjWEcTzbnM+HFrxpKmOagqxTFTaFkEhVciv4pPfik7A5RXMugfk/oD5e/hDwRYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753847; c=relaxed/simple;
	bh=tEAUK+pa+VR09YaPr4Y45r4hPgbJ47nS8N90OSVRsNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ip50h993cwyoVQqeYbNYkEI8Q8GCzDUQl0jtT/cD2sgwaavlVIORODmLnB5dMXngafFFbJFgE1k/fM20e10bw51BiqubeirJwEyrLVW9NgHXlhsg2m0TnDz/7dTRCELohUYPxGD8WMw295lfwQ5nDeNP9KvBZqFwAXRIYi+i/Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ca4EK0Zp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753846; x=1805289846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tEAUK+pa+VR09YaPr4Y45r4hPgbJ47nS8N90OSVRsNA=;
  b=Ca4EK0Zphi3BPeMntGQgATdg/B67rp0v3ciRl7vvheUSN8tdUWzushsm
   xuzjmvyQh8sHWVQYOSOKzFK+hTP77R8yOzjyne2YuRuJ65vewAWgY/0qj
   NoCqzN3x8ZzoHdJHfUN8TnL9K6v8hETrouj29+Vmey2paeeSmQMOL0E7D
   Vl2RHy3dxL/nKW3/fWsXg9fMZNgm2bvfnPWx6luxrueMciRBI1dm1/GRm
   CuKiJddIkxCLYiI3AoHpiJFzQw3Zx6Kh+4DlEOIKh1WDo/05lOODziD15
   Elict4VZld06Wau5nOwD0PdI9U1gr9/bROtnmk/XykWjkTkS+0xEOzTNc
   A==;
X-CSE-ConnectionGUID: XYBcsjXITYy5ublSuvnRHQ==
X-CSE-MsgGUID: l58JXQFGTxqPs7Zm+6L/jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77395733"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77395733"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:24:05 -0700
X-CSE-ConnectionGUID: t1KaPoM3RfWc9xe3EIi62Q==
X-CSE-MsgGUID: 8oAUK+V8QrazFR3d+q8ogw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226958468"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.171])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:24:01 -0700
Date: Tue, 17 Mar 2026 14:23:54 +0100
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
Subject: Re: [PATCH v2 9/9] arm64: defconfig: enable designware mipi csi-2
 receiver
Message-ID: <ablVqNnYYFoy76NJ@mdjait-mobl>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-9-77de5ee9048e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v2-9-77de5ee9048e@collabora.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56084-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 181222AAD35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

Thank you for the patch!

On Tue, Mar 17, 2026 at 10:32:27AM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
> recent Rockchip SoCs, such as the RK3568 and the RK3588.
> As a consequence, they are used on a lot of Rockchip-based
> single board computers and/or corresponding camera modules, such
> as the Radxa Camera 4K.
> Enable the driver for it in the default configuration.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

--
Kind Regards
Mehdi Djait

