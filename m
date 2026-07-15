Return-Path: <linux-media+bounces-67684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DgfcJs2MV2rzWgAAu9opvQ
	(envelope-from <linux-media+bounces-67684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 15:36:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DFD75EBCD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 15:36:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=PR+qLXnZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67684-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67684-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1EAD3074C91
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA6A2BE026;
	Wed, 15 Jul 2026 13:32:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23528504F;
	Wed, 15 Jul 2026 13:32:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122378; cv=none; b=tJbxWSMT3rKGWhysk4CMX9OxTrTt8w16isQnK8ChYyjnV2UIXnFWbUOauzTs5beqLBzyRAD7Vz03peT0iNMdtKMn8Ge4gl+hP9n7SHuQkBRKLiG9UOE44G3rtqVbJWALioJVtDSZ8AxUp1rUouU7w81d6gTQWyCLv8CXajZn7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122378; c=relaxed/simple;
	bh=AC4gKUt0bevhnOPbm47J2rH245XNM9BU/0Silweo334=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIo5xQ7oKuU2OE5Ur3Hn8ItaiAya5bHPGtgOMh//lRMbSzv1qVAI/eRkt7FkH3pjiOcnevOZB2LKO5k7n0BeAZXjXfUGT3IVhV2C1+jc7BRvqnxEs8kqT/BRq3Sj3zKHVguHNkpLDUs4pyrYCyDaa4RiUK1YG8L1mAcVY2+HtXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PR+qLXnZ; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784122377; x=1815658377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AC4gKUt0bevhnOPbm47J2rH245XNM9BU/0Silweo334=;
  b=PR+qLXnZDtm0+B83BBRrkNAtjmxbpuk7QGTKoXsqXE4SNvpVQoLoWq3K
   YD5CAocLLf5u9xB9/68v7lcsrVEXMfsD3s/vBtdr/TJNIVVtJUzNcW0XK
   igCe8RzESW+jpOUAzvr2/mbOGulc3z9X6/VEkf3tefcP/8S+FKO5v+A+t
   89FgQIssQ2da+u9grrs54vc01q4kwXHV7vWq0Rx+K+rXE/P7nUAbXIG/i
   0qdDz8vNDRLZYwGxgYq/KtCYN2TYCV14ndeh4ollan3gH/x2WQS3ytf4y
   S+WbvU3o7tO9Z4e2F6b0iTKWWR9WD3KsU2GM/pvD92P1kYlyb6JKsWBVX
   Q==;
X-CSE-ConnectionGUID: l5ZWvJ9LRiWPQps7cYDitg==
X-CSE-MsgGUID: q5ut0bQMTFit0BEogH6ADA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95901139"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="95901139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:32:57 -0700
X-CSE-ConnectionGUID: gxMSpFxJQoCtcdqB/nWRrw==
X-CSE-MsgGUID: 8Ki/fA4JSRq+GWtCD3+1+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="254437534"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.106])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:32:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2E82012080C;
	Wed, 15 Jul 2026 16:32:50 +0300 (EEST)
Date: Wed, 15 Jul 2026 16:32:50 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Lachlan Michael <Lachlan.Michael@sony.com>,
	Ryuichi Tadano <Ryuichi.Tadano@sony.com>,
	Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] media: Add bindings and driver for Sony IMX678
Message-ID: <aleMAlwBLUekyQMo@kekkonen.localdomain>
References: <20260703-imx678-v5-0-0523dbed0dad@ideasonboard.com>
 <20260715131232.GA1106419-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715131232.GA1106419-robh@kernel.org>
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67684-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:jai.luthra@ideasonboard.com,m:mchehab@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08DFD75EBCD
X-Rspamd-Action: no action

Hi Rob,

On Wed, Jul 15, 2026 at 08:12:32AM -0500, Rob Herring wrote:
> On Fri, Jul 03, 2026 at 02:49:15PM +0530, Jai Luthra wrote:
> > Jai Luthra (2):
> >       dt-bindings: media: i2c: Add Sony IMX678
> >       media: i2c: imx678: Add driver for Sony IMX678
> 
> Media maintainers, it seems the driver was applied, but not the binding.

Thanks for the info, I'll fix it in a moment.

-- 
Sakari Ailus

