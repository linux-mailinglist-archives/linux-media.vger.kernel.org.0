Return-Path: <linux-media+bounces-57741-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ0pH4aDy2l4IgYAu9opvQ
	(envelope-from <linux-media+bounces-57741-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:19:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D39365FE2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 315EB3076532
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AEE3D8106;
	Tue, 31 Mar 2026 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyagmF99"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177C3D890A;
	Tue, 31 Mar 2026 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944736; cv=none; b=OVS3B/ldcCmJ2jFxo73ewEFoZaSQOPv42NUND3FG2LLSrcldmK2cYhKw4605rPj596utrA+M4KzU4cv1HWq1pg/H5h7KAwmqvYrmYJDr9vNLaUqP9yH14ttiUL99YOZGE/pBB8DZj1IXnuX2heV4UzElOgsh2dvGZOWoLzXf2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944736; c=relaxed/simple;
	bh=gm1qrvYqoa7/mUZ103g4hg6IDigFK+ZO830qVJD+Z/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4tnR5UMmvSxi5UUmf+ZoJz8Qm3ZKuF6RI4Kjyc4mVP7daGv00I2BxBRnHsDhJsQDjnyQ6e8Omlw4kWKewyXKnNXUuvTQYKxxKcTsbItUvk/Eh5LVPYqNQjPBotZhiRrJHmOKnsxUFMbooICrhs18UzUEaUl6ZGWFuZv89JxinY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyagmF99; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774944735; x=1806480735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gm1qrvYqoa7/mUZ103g4hg6IDigFK+ZO830qVJD+Z/o=;
  b=IyagmF99tFqTc10nMS1sn/m8hGKuXcck/VGEW/GT283M1z7nuI2j9IZq
   iRfQH5wDRRYsGTeOMKrUjcK2TFfz/Ud9lIbzCH31igvgJMsfmmuXvVxNO
   WTKRo/cz5WNDwwkJSbUr1+4PAVlYv5reN6CfrRGKNGu/eZJ9W4zRFhrk8
   5T4k2n6Yf7r6ffoyCh/zyAh3QhuazfJTFj1zyXixo0Dsq/bi4vEb1+W50
   qYHPAuzoXKUjD69dnjFQhdRrqjrR6/IxE9Bd7IpSZjlwaJw22TnJ7tihw
   8dMaxdaoLGOOygWxCabKHnDpKlcNi1RnGwJrjBCqV+1YSg7He+K0mjPqr
   g==;
X-CSE-ConnectionGUID: 0O43xXhMR6m4hxzGkkgPBw==
X-CSE-MsgGUID: GT5jWIYPSSSG3qmGS2lCRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75665208"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75665208"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:12:14 -0700
X-CSE-ConnectionGUID: VVnhU/xuTCaq0WUBI+B1fQ==
X-CSE-MsgGUID: qFqkCyVSQ5WrJ/CoJAZywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="231111310"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.241])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:12:12 -0700
Date: Tue, 31 Mar 2026 10:12:05 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-common: Always register clock with
 device-specific name
Message-ID: <acuBpll9hMFB2yh-@mdjait-mobl>
References: <20260327225750.607033-1-paul@crapouillou.net>
 <acqilV_y6FxIgBbY@mdjait-mobl>
 <cbb88a06a4570c6e33b2125819572647efcd5b1a.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbb88a06a4570c6e33b2125819572647efcd5b1a.camel@crapouillou.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57741-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,1c:email]
X-Rspamd-Queue-Id: D3D39365FE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,


[..]

> > 	if (id)
> > 		clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s",
> > dev_name(dev), id);
> > 	else
> > 		clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s",
> > dev_name(dev));
> > 
> > 	if (!clk_id)
> > 		return ERR_PTR(-ENOMEM);
> 
> In the case where "id" is NULL then the name will be e.g.
> "clk-ov2680@1c-(null)" which I assumed was fine - even with a valid
> "id" the clock name wouldn't be very pretty anyway.
> 
> But I can't update it to your suggestion and send a v3.

Yes, please.

--
Kind Regards
Mehdi Djait

