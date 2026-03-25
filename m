Return-Path: <linux-media+bounces-57084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP8TBzofxGnYwgQAu9opvQ
	(envelope-from <linux-media+bounces-57084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 18:45:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F132A10C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 18:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10E7630DCEFF
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 17:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40157406278;
	Wed, 25 Mar 2026 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPJ7DfLy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CB03FB7E0;
	Wed, 25 Mar 2026 17:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774460304; cv=none; b=WzUhkHogEyfcTu23r9sMLNUOLQ6owgPz0ESNItfmCLUu3+VvEVUeGmj/tUv9ofIga9Vt5l4dpYfmtvUzqnbj0AnyBd0VZs+M4xeQPaHWwzGK0w+ec5uDO+SMLEA8gmYw+e/SE/9RQLGwVVqvl/SIzbLbAuESY5J3SQ5RgzbRb6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774460304; c=relaxed/simple;
	bh=tTM6qpl5dmfbHIRbO8CS8UflwO2BMvQhMGPDek8bavg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDBlzMRqWdbvykrrZm/j5U4cEHytis3F/8Cl+kH39pAEpsX2FTTQ8EY0BWN57z0sDoVhQmqwkrHli9AW0fctgQwVAhhuoXX+1YZbElWA34w3EwzLexGp0QSWqIf2hh8RTrDsn5ALrBYH5/fF7G6N5W0ehs3vb3Shn4jUdBj5+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPJ7DfLy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774460302; x=1805996302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tTM6qpl5dmfbHIRbO8CS8UflwO2BMvQhMGPDek8bavg=;
  b=NPJ7DfLyqjXoka9XhbqbSBmSQ77bu4NTy0DkiEj6lSoreTWVXLmxjFNP
   5voLBGd5DNA6RC35B/5YYsGzLFWJbR9VgchP81V8z+xYGZDdpSKEfkpia
   DLd6Y3h/uDfDIH/oaoZYvTUvqplsd1dCcKS3Qw4ny6X+GFHSFFMiH3eUq
   iWrvD7MqFqHdmb0XmietrDE+2M8ORXfxn25cMFWKUYQ0SJS+H6sq3JV5t
   7KR8Q8dipyZgJ/La4GRjCUyqTAd8FB7nzjYAASx4lKNtW7/v4mgOrNzoX
   r/f+5X1Z4rekcq6Tb8/MpUOAeC/jBMfXrNEbRN9zCaZMyBWdBeXRRBdQ5
   Q==;
X-CSE-ConnectionGUID: ZkvZDmEMTRiwm3XwQDAbzQ==
X-CSE-MsgGUID: gtS8rzu3SkWrprWbJoNQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75527086"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75527086"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 10:38:21 -0700
X-CSE-ConnectionGUID: O2KGlQQqTJadrw+GoRloHw==
X-CSE-MsgGUID: 3jjEfzDVTpCR49VsLPA4fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220347066"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.187])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 10:38:17 -0700
Date: Wed, 25 Mar 2026 18:38:10 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, 
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] media: rockchip: rkcif: add support for rk3588
 vicap mipi capture
Message-ID: <acQdGy39-3H_nyKL@mdjait-mobl>
References: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
 <20250430-rk3588-vicap-v3-3-e38e428868cc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v3-3-e38e428868cc@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-57084-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com,linux.intel.com,vger.kernel.org,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,collabora.com:email]
X-Rspamd-Queue-Id: 710F132A10C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

Thank you for the patch!

On Wed, Mar 25, 2026 at 12:51:08PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
> for this variant to the rkcif driver and enable the MIPI CSI-2
> capture interfaces.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 141 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  18 +++
>  4 files changed, 161 insertions(+), 1 deletion(-)

--
Kind Regards
Mehdi Djait

