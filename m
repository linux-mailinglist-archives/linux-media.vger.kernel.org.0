Return-Path: <linux-media+bounces-53196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKQVNlSLnGmLJQQAu9opvQ
	(envelope-from <linux-media+bounces-53196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 18:16:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B217A8B2
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 18:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6739B30241B3
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 17:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BD033065C;
	Mon, 23 Feb 2026 17:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdYP22Vo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878AB330648
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866957; cv=none; b=RrQ96sQgB0PJ8s2i6YiUCiI+WQe/h9cjKmxOdUwgAD7MisZeoYxl5rXAFMD9Bs9bD6pbnicBL/bY0+exuDs0DE8UeNHjGAUvyvc3E7nvAAIhCTdbNJ7G1QyJF7d2Xkf8cDPcWXC1VzGHC92bFk5kdt9jMvDaIkJwfXIfmd079qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866957; c=relaxed/simple;
	bh=PGeJHdJ610KKTaaoCz2dgxR9IpjTWddR5IpoyOUFUCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmDg6zkHOpgU5fDvx66izhrDhyJ38B+kkBRCiMGVuqnDFp6sNbyJFc4CY9X8oR+rU7p9aPw5isiVBaXFJmv/hrYTaSZuo4EPLIHwVmd16Y5tWPwdjxBJa3EAK+jh5OiM9N2sSAOhMpuZMOtyVUbPz5EardA/vObDd53VPI6wLgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdYP22Vo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771866956; x=1803402956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PGeJHdJ610KKTaaoCz2dgxR9IpjTWddR5IpoyOUFUCY=;
  b=jdYP22VoQmSTQCRFwtAU2p4zCqumeg2fIt/1p9Ix1fxmlkuSzi6YWS7W
   7lEFPe/RDg+a3W/NcEiDieDIbup9bNVvnalPY2vcYSEU+mkIc06wIKRD3
   SLwuuiBH7B36cHzxpqrpkQ3ylVsrecvft4xC34GtyDOP0801zzPqBv6rJ
   WuMcqIIpfoq97fQUAzKFId4mSbPKEanE7vvCk45cPcMFedFKL24U4UBX+
   wpS6WBNMn5zaUGrLh1CHX1+ETKoILcGci+UwfcqjdBY5xdz17jeLKqz1v
   lROAuAMVyKO4W1IVvjRI4+mgAoU/iYq2veikzDsGm9wiBP8YQJz/kOn1P
   g==;
X-CSE-ConnectionGUID: VvLpsYGWTbWfRZdOz1lyuQ==
X-CSE-MsgGUID: 1wbBeI98RjiJinMqIS38Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73047518"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="73047518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:15:55 -0800
X-CSE-ConnectionGUID: uTGWVmcNTZqSQQEfSlXOjg==
X-CSE-MsgGUID: vQoSDd8CSiur9zcUXqnnmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="253353491"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:15:55 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 65D3D11FC2C;
	Mon, 23 Feb 2026 19:16:20 +0200 (EET)
Date: Mon, 23 Feb 2026 19:16:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Juliusz Chroboczek <jch@irif.fr>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>
Subject: Re: OVTI08F4:00 sensor not in media graph
Message-ID: <aZyLZEftJb02VOxh@kekkonen.localdomain>
References: <875x7niplz.wl-jch@irif.fr>
 <aZxWQHpxWJXciuWU@kekkonen.localdomain>
 <871pibinp1.wl-jch@irif.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pibinp1.wl-jch@irif.fr>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53196-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: EC3B217A8B2
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 02:39:22PM +0100, Juliusz Chroboczek wrote:
> > This laptop should start working with the CVS driver makes it to upstream.
> > I'd hope this happens for Linux v7.1, there are no guarantees though. The
> > ov08x40 and USBIO drivers already exist in the upstream kernel.
> 
> Thanks for the info, I'll wait patiently.

In the meantime you can try the CVS driver from here
<URL:https://github.com/intel/vision-drivers/tree/main/drivers/misc/icvs>.

-- 
Sakari Ailus

