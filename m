Return-Path: <linux-media+bounces-62973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BcaFyV4GGqPkQgAu9opvQ
	(envelope-from <linux-media+bounces-62973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:15:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D465F57AD
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75323305EE53
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 17:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF7D28727D;
	Thu, 28 May 2026 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CV3qH15Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DC53F9F45
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 17:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779987981; cv=none; b=Dac/x66W2jV7j2wXvFLFJZaV6SNpOJoykIK7TwkzUBxuryqNE2N0ugGH5mNDEDxdKmKM2oIMXVBnUaTSikUDKKG6TH9S97TO2uzftJlXRxWcv6QpEBCkGguGcmZpDYXi696N+4tcTObvEQresUHhc4/vStiQdqo0EQ88F6Lcgcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779987981; c=relaxed/simple;
	bh=LBjuiURhyLeVnP1VD3oZ12uFqgGzcPg2uyCTkeLAUnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTo/Sq8t+INgwR6OfslbHzNi6MKj1O0neWSSXxC/vkq/GN4Yg1AAWCykOhEBm4ztkZF1yurSh45dNVGz5h+jgroKLZUg3LcpC54svleYNswHRmxeunaz+pR3cDBjsKzfB7VEpaqyy2ZF1JXExngsYN3iOxA+olrZlK0fgFg6PDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CV3qH15Q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779987979; x=1811523979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LBjuiURhyLeVnP1VD3oZ12uFqgGzcPg2uyCTkeLAUnM=;
  b=CV3qH15QB8Cdk+7dCXk7Cr07AEcaABdm3DiHz9RGqniXNBE1BLO/QlRB
   JUl1SDoZAaBK+83okJGkt0p2Blr2k6ztFnjQpfsYsr+fZRYjdqc+Rk3ws
   WowA91e9+OOVyteTxDjdTD9rGI5eCeBhWQKyzct+xJDIt8/KfQghf6DYp
   s49wFo0HwXNEMrMNzZ3OaK+ie2dC2ryWR0V0bx06TUWh2hnLPmcQMQ1n4
   TmYEBMhP23l5bfpJ9EtLnb0yvlqvTaXVoCCNtm634PpCU8ERIXcUg/ZV7
   m/CNQxCajZ0wHgST9qG/B3IqfX1SrvZPbidm/nIOuJKjb/KZAca6TiMKB
   A==;
X-CSE-ConnectionGUID: N2S4J4oSSDi9dlqQOa+CiA==
X-CSE-MsgGUID: y2sJdQRPS1aC2A8Wd34ACg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91405816"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="91405816"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:06:18 -0700
X-CSE-ConnectionGUID: v+Vc6rogSKOKCHs5OU6UYg==
X-CSE-MsgGUID: 7jrgTZeIQvubKW34Pk9Jkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239585539"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.75])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:06:17 -0700
Date: Thu, 28 May 2026 19:06:10 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com, 
	sakari.ailus@linux.intel.com, antti.laakso@linux.intel.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 2/3] media: pci: intel: Add CVS support for IPU bridge
 driver
Message-ID: <ahh15eCp2hNeuIF1@mdjait-mobl>
References: <20260527170531.383871-1-miguel.vadillo@intel.com>
 <20260527170531.383871-3-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527170531.383871-3-miguel.vadillo@intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62973-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 69D465F57AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

Thank you for the patch!

On Wed, May 27, 2026 at 10:05:30AM -0700, Miguel Vadillo wrote:
> CVS is located between IPU device and sensors and is available in
> existing commercial platforms from multiple OEMs. The connection
> information between them in firmware is not enough to build a V4L2
> connection graph. This patch parses the connection properties from the
> SSDB buffer in DSDT and builds the connection using software nodes.
> 
> From the IPU bridge point of view, CVS is just like IVSC.
> 
> Signed-off-by: Miguel Vadillo <miguel.vadillo@intel.com>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 13 9350 + IPU7
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

