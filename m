Return-Path: <linux-media+bounces-57762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEtUGkOiy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:30:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB81367FD0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65C4C3095E0F
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC923ECBC3;
	Tue, 31 Mar 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKk0P5KN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539F43A6EE7;
	Tue, 31 Mar 2026 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952489; cv=none; b=mYJn/JwXZ+byCO6kOJFxNfe3CUXGyoK7qcZTpO2nzQY8NYu/hdgRdQTfYuJuQ/7r5Ce+vo4AEFeNCMAF5dvYlkeMjEaF4nfLynKJJo21rEjfc2ly2kT4I0Pc46XvN6nZKXo1e4YobgXqTEo4vtkORJZNj7+LVmXGyly8j+NvcbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952489; c=relaxed/simple;
	bh=8Gv4SeJFuRJKhIsWBZfmmEZDziLV5xYSsqrQSxNEK2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyhwwRopIJMWX/C9ShDc8dOeth3/gt/NwLe7LWarx2X3SQAPqlBWi7ucub124NWVI7kYSciTca+1uTNgwSd3l2XzSPt/sDFkZbHBJEsqSpsvYK6vEppL8NrxTsQOChjiX1rp258GQQ+1kWBmqqs6wb3FFZsaFOMjKhIXxgSIh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKk0P5KN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774952489; x=1806488489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Gv4SeJFuRJKhIsWBZfmmEZDziLV5xYSsqrQSxNEK2s=;
  b=IKk0P5KN6RYAsyZ34gubFQSZhIRDfxiXHAQYqB8vMs9Y26HQjS0FlzQB
   mDUUUWvk2gLxo94pGU42lNx14W4bruJ74R3pmHIwePsScGcFiaXPYpl6U
   HFDEgU7CBjU/PtaFcDTxBpa9P/ztQCujacobE7kdyM1Smw0/X10Me34UX
   dhR1Jy4T9w9F2xpG1B+9XritP7vBdUWm6mQG+s2ifw4dWbYdTlwgNyk4E
   9emPr4qRGfSvbQqLF1mZsO9Wc8UpS0lfvHjPRY0C4dS86gLSDtt/yVww+
   sLUhYp/4N1/uMlp1dtizRk+QGpJhbCuIG8JVrbt9u7tbN0uaKPAI/4nMg
   A==;
X-CSE-ConnectionGUID: nm0KEzN3TKmGft/cMDHtIQ==
X-CSE-MsgGUID: mitQ6W5ASOmkv0PPAdBZTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75978862"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75978862"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:21:28 -0700
X-CSE-ConnectionGUID: sbgXcVTVS7+q1mUqsaQUYw==
X-CSE-MsgGUID: xgKt4W/MT1G/2yzuZx2dMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226576432"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.241])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:21:26 -0700
Date: Tue, 31 Mar 2026 12:21:19 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: v4l2-common: Always register clock with
 device-specific name
Message-ID: <acufcr_WMh2vxl5t@mdjait-mobl>
References: <20260331084340.67613-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331084340.67613-1-paul@crapouillou.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57762-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,crapouillou.net:email]
X-Rspamd-Queue-Id: BDB81367FD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

Thank you for the patch!

On Tue, Mar 31, 2026 at 10:43:40AM +0200, Paul Cercueil wrote:
> If we need to register a dummy fixed-frequency clock, always register it
> using a device-specific name.
> 
> This supports the use case where a system has two of the same sensor,
> meaning two instances of the same driver, which previously both tried
> (and failed) to create a clock with the same name.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

--
Kind Regards
Mehdi Djait

