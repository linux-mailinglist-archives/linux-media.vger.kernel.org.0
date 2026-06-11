Return-Path: <linux-media+bounces-64564-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 75FdH+t+KmrPrAMAu9opvQ
	(envelope-from <linux-media+bounces-64564-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:24:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBA7670605
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:24:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=dsY1RBHm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64564-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64564-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6500301AA5E
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CD23BB114;
	Thu, 11 Jun 2026 09:24:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B13BE155;
	Thu, 11 Jun 2026 09:24:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169873; cv=none; b=vCRxODAMqY7uJ2GYyfl3eVV5g18zEnln8E7RaTQrcfrK+1vFvNajmpBJdNCqPwsrsVze6XhT/xgpJrx1yneDJKq8gQc51/28fDHWS68wlSKOqvYu16VEC8pPRI4cG40joWm3HAXV+Mf8p7NXEw4cpFlZPtkX1dMqwmDJ7wQwv8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169873; c=relaxed/simple;
	bh=Vpoeq9CJeJAl/f0rQtCJJSZHV8AdYDemmm15xmmUZEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHEqlVxdu+AxDrWQMRMth9dEY4zZsfUr+bXPKpbQUl2ahBqWk3YbtFzKGWSSBIXnzH99jd2d3ek9qQEBNC+esr6wJ8NrP9JpUrtRWgwATvdRtK/Bh9tUUu4UzvZCSjAEql97BakrB7esjBU/4yfPWB+Hymv2hQER0VfD7AqYLOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsY1RBHm; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781169870; x=1812705870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vpoeq9CJeJAl/f0rQtCJJSZHV8AdYDemmm15xmmUZEY=;
  b=dsY1RBHmYzwS+JywZnGZnJ2cvFTC/44pt2Iq9jrGX25gKwfY6WTXQVKr
   dLDXh38EgiyQDdv2JRQmRh77VTP7pAPeIh3/SxkMnxkjsFD1R9asGnzSH
   G3gxEz53aMWCU4IP6naSMfXk3GUbxeHtX8kH2XYPZ8Sxf47hf4nEMhont
   tZUC7C5JAWTgt0XbmWkH3T8IG4cMjrNm4XiqkMsiL0PCl12Xa5jOxs2OQ
   YQbRnOzW4HD/VTnZ7A7cqd06lBYfYzHDwJNhyYETCXLqUp4A3NL3lB8/M
   sSGwxMuEiMy7KuH7hyYRxurr65bxjLBqBcAlk53MSTvZdPmAViA2xI8sw
   Q==;
X-CSE-ConnectionGUID: rcN2iVk2SCGrneGZ5Zq7Xw==
X-CSE-MsgGUID: Sc3XV/fBRXmebPWp6GHr7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85607234"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85607234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 02:24:29 -0700
X-CSE-ConnectionGUID: aeYXjMlKQTyfUn2WuHWlAw==
X-CSE-MsgGUID: HyU1BRt/T1yNMlk4YUoxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="246453708"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 02:24:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E24E1120835;
	Thu, 11 Jun 2026 12:24:23 +0300 (EEST)
Date: Thu, 11 Jun 2026 12:24:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx219: Report streams using frame descriptors
Message-ID: <aip-xwYlKT1d3N0S@kekkonen.localdomain>
References: <20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64564-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.intel.com:from_mime,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CBA7670605

Moi,

On Thu, Jun 11, 2026 at 12:13:02PM +0300, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Implement the .get_frame_desc() subdev operation to report information
> about streams to the connected CSI-2 receiver. This is required to let
> the CSI-2 receiver driver know about virtual channels and data types for
> each stream.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> [tomi.valkeinen: picked from "Generic line based metadata support, internal pads" series]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> This patch that adds .get_frame_desc() support to imx219 driver has been
> circulating for a few years, and is currently posted in "[PATCH v12
> 00/86] Generic line based metadata support, internal pads" series.
> 
> However, as some bridge drivers require modern drivers that support
> .get_frame_desc, specifically ds90ub960.c, let's pick the patch and
> queue it separately from the huge metadata series.

I've been recently working on
<URL:https://lore.kernel.org/linux-media/20260518164318.3367888-1-sakari.ailus@linux.intel.com/>.
In other words, drivers that have a single stream don't need this. We could
probably extend that further by making use of the routing information but I
think that should be left for later.

-- 
Terveisin,

Sakari Ailus

