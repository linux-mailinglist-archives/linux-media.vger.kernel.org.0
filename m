Return-Path: <linux-media+bounces-57662-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HTIBPWjymmx+gUAu9opvQ
	(envelope-from <linux-media+bounces-57662-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:25:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98835EB99
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF1D330120D1
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11B7377ECA;
	Mon, 30 Mar 2026 16:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqxO81AC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58118377034;
	Mon, 30 Mar 2026 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887906; cv=none; b=OV7yolog5aHwdvZ6423mRV/rbe11qqGseqORgGG1HebPuQ0CPA/HK2v/4TDzOghuRNpqxE8rRh3DitJT6+JM24bfJY3Q3hGoHFdFZs0GwsMl8RmHmLveYNzbvuFo7fo7mFTzAK6Oqwmegl1+whyZmsErX0V87Bro5ATjhRHiW7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887906; c=relaxed/simple;
	bh=Nt2ovT0ZlQdF5J98XQDKX0klqK3rnOlc1N5nTZXi/OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRHmgDYN3MsnnHPzhm/uvc7vnTDlbhE7EBJwKCtMMLC0HbvYo4Xu+eU3fOhyZQoDxvtzNjWnIsojnGNjenrBxTCZCwA37lRLtPchhh9TES+MhIMEJXXJfboFHv0vb2mW98H1tTIRzDGQ5ZTqjUcLGvH2dbTuZRIoSV0eQLbM+Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqxO81AC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774887906; x=1806423906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nt2ovT0ZlQdF5J98XQDKX0klqK3rnOlc1N5nTZXi/OY=;
  b=UqxO81ACovQU6ZhnIGPDNO5X/0+EXUApEpWn995P3HQ+u+ksTz6zDDGq
   APWnk3CHRz2L7RwIh2CHAWtlZELpqsRcyYnoFfCquX5AtGpvsODnmaUHT
   PY6MoQ00WHqlrjfH0ovdkl4SUUVjWxz4fvtV3vdEjMW4yZYUQvWYQQ/0h
   XpHF8llSBxR8euslvqcQ0CXaZkayKIiHsbr1gqY+swqdR9AAyCqSKeisl
   drRglW8jJruSIV6a+PeH5KYepntGFm8cgQ6VYwjzx/5k7ZMCd1iQh2gUD
   uxoH74eooYAZpXOWtu7Mc5AqC1299JUPDxihiOBCOJzyDO30pnYbrcdwN
   g==;
X-CSE-ConnectionGUID: zgvUpE8lTTeJFgF4JPGreg==
X-CSE-MsgGUID: 9WjydGSOQ+WsJk663CUYjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86188331"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86188331"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 09:25:05 -0700
X-CSE-ConnectionGUID: rXajjx+pTQ2DlQxP1rqy+w==
X-CSE-MsgGUID: zfpbSIkaRRisIeGDlcJqvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="225990134"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.177])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 09:25:04 -0700
Date: Mon, 30 Mar 2026 18:24:55 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-common: Always register clock with
 device-specific name
Message-ID: <acqjbSoLCyemQmnm@mdjait-mobl>
References: <20260327225750.607033-1-paul@crapouillou.net>
 <acqilV_y6FxIgBbY@mdjait-mobl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acqilV_y6FxIgBbY@mdjait-mobl>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57662-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 7E98835EB99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 06:21:56PM +0200, Mehdi Djait wrote:

[..]

> 
> How about this, for drivers calling this without id:
> 
> 	if (id)
> 		clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev), id);
> 	else
> 		clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev));
							|
							+-> of course
							without this %s
> 
> 	if (!clk_id)
> 		return ERR_PTR(-ENOMEM);

--
Kind Regards
Mehdi Djait

