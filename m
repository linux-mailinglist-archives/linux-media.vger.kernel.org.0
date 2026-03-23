Return-Path: <linux-media+bounces-56674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCHQIF4KwWmtPwQAu9opvQ
	(envelope-from <linux-media+bounces-56674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:39:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8A12EF340
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11F7330421DB
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA76387342;
	Mon, 23 Mar 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mn3zeE19"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CEF1FE44A;
	Mon, 23 Mar 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258466; cv=none; b=mMO5wFLGN8fDXlxVEzgP15839nT7jaghIsMDAEEl0g1Lez8sQLJozil4qAq1RIWDmGMi5RifHY+WGbazYmo+xwqHXg4oyiloj2PmJPoocUK0jGwPDzjJsZmFMmcJ3JtoBHnuftC6irOwyZuWohTArFW19RJmcLkQKzR9lZdqcLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258466; c=relaxed/simple;
	bh=a8iVCF8H5fPzfHcKan+KqiP1Vrf6mCXQ0LkwJlmuTto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdNPHmRmtXMqddXxXqSQzX8Ck7TgSorzQmPWpn0UfxIwY9JhzDk7rkHxsXN7Y6Th3cV0KzLxarugxVW1W1K0JDsnb0qxtT4K3CSzWqghYOqAQXYKj4P2QZO52bBDTqNBokkrKYYn76to5z4zwbQPfoylt7fwvNzZ8q5xduCCwzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mn3zeE19; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774258465; x=1805794465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a8iVCF8H5fPzfHcKan+KqiP1Vrf6mCXQ0LkwJlmuTto=;
  b=mn3zeE19ki5+DRyC9f26dTEwKc75JykuiTOkQelvbaU8/u/NqzMfCoEG
   nxBbY2aqDXGokoc0AFCW/ai4w+8aDVafaIQRCUWEyWtoY1Pwz9TatLH4f
   ehR9dRggil5qob8BDIyY/fnTCQLUrdjQdqsxjAHL0qXqBr6yi++NSywoN
   Kp4a/cyHlds7G6XpONkQnvPx1Vre5jMi0xOp8hEp2fghED94KkNjkGXvA
   4aWLwmTvy5FWdtXvDb5NdcDn+o8W4YVngqHYVTw7HU+n5pHOfHxQbIMSS
   G1x/ulmeg9FnuQADXuhJPGL0UD9IpZ8QXc8ulO3Xzjxvr6e5gukIHNm3Y
   A==;
X-CSE-ConnectionGUID: xrurAFdSS/2UagUViH0Elg==
X-CSE-MsgGUID: 7sgDFVuyQS+neQR3OKlbAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="97871871"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="97871871"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:34:24 -0700
X-CSE-ConnectionGUID: 2yHYcI5DRgGkTO5qtfrbjA==
X-CSE-MsgGUID: 4AYFJyUYQ3WDzM1pX9pbRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223994868"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.18])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:34:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C13B711F94F;
	Mon, 23 Mar 2026 11:34:23 +0200 (EET)
Date: Mon, 23 Mar 2026 11:34:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antoine Bernard <zalnir@proton.me>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH 1/3] media: i2c: ov13b10: Add dvdd, dovdd and device tree
 support
Message-ID: <acEJHxCEjsIvCK3P@kekkonen.localdomain>
References: <WDExF9Cf1ELo55IwClyLBJqXeLe2-Kb2m3QYg7ex6qREa3HBG52CdMovctxuZ7W_ixhvHyjk9L73NDMCJi2ndkuDJcpzHSDs7Z5pEAgET60=@proton.me>
 <ab29XzACA3gXE4MI@kekkonen.localdomain>
 <upbCO5Ov9EM8f4ZCXKxzuKpXo5mOZ3tEI4j0VvTEZ6QQobtULxabIWkHlGTx0-iV9_nxK10rh9zLzccuYMtN0ldUKfwSDWm5I9kflUQ4sg8=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <upbCO5Ov9EM8f4ZCXKxzuKpXo5mOZ3tEI4j0VvTEZ6QQobtULxabIWkHlGTx0-iV9_nxK10rh9zLzccuYMtN0ldUKfwSDWm5I9kflUQ4sg8=@proton.me>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-56674-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,gmail.com,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: BD8A12EF340
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Antoine,

On Sat, Mar 21, 2026 at 04:57:10AM +0000, Antoine Bernard wrote:
> Thanks for reviewing the patch.
> 
> This is my first time sending patches to LKML, so please do
> understand if I make some mistakes.
> --
> > Error handling needs some work here.
> 
> Could you perhaps tell me in detail? The logic is same as with
> avdd, so I am not quite sure how to refactor these.

What happens if enabling the last regulator fails?

> 
> > ACPI supports device probing through of_match_table, too.
> 
> I thought this was needed, because embedded devices don't have
> ACPI. Is it possible to not use of_match_ptr() and instead do
> .of_match_table = ov13b10_of_match directly?

Yes, please.

-- 
Regards,

Sakari Ailus

