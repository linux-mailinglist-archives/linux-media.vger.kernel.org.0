Return-Path: <linux-media+bounces-65459-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sxp+Fm9eOmpI7QcAu9opvQ
	(envelope-from <linux-media+bounces-65459-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 12:22:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBDD6B63CD
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 12:22:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Lxzl24QX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65459-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65459-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CB0F30686F4
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAAB376A13;
	Tue, 23 Jun 2026 10:17:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E83370AE6;
	Tue, 23 Jun 2026 10:17:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209872; cv=none; b=FwFjJYRoeGsPei/03nk3HXdrwguBvSilpr/mvszQeilm48/euCqanR8CadubxzWsaEt7fdc0TDyJQW7jSF2m9O7uYKi14nqLnf8vRY3k9/tNkjtKVEL0nY33t2FUfsEEyWGRYk19fq7vZ4wbCguudYHKyYuCGWgzC1by4TOciuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209872; c=relaxed/simple;
	bh=yKxWuSxIg6MtigXJlkd4YV7IcsGj0BsCefuviCtPryY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLtbUYMDipCPlxSYog5b9H3UcYQM2pyfK0b7kZcIhBQ48VX+vgVfvyRRHcBhG/yeWKM/b9m+57Pnvhybc+RUnbs5U3RiTmG+NHzHJ00qahE/8iMUbCEnoSDY97gL5serNYckUCsMKF9nMpZ7dlBYUCmm7UsUxZ87XQ2IdMY4zPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lxzl24QX; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782209871; x=1813745871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yKxWuSxIg6MtigXJlkd4YV7IcsGj0BsCefuviCtPryY=;
  b=Lxzl24QXfsyQ6eVEgxwHFye3D3nWWz1jhcW45ygFHdSs17Mce/YTlLx1
   6GuDpsNWd0s7TR9yh4Mz7P/wc1Jq/RMcqwPDQL3hgrFdwA9A2m6hJlXsw
   zbiTBvosTGRbR3syTgmGMeFDZAmCd25zk8JfvTrJkwONRHPHEA1HN9oK4
   m0xSVDG/OXrL/Lgm4to3KkpRNLLXTjJ+BaUyOURq+5zGdcGMa+vacO7uE
   LYcJnX8Ke4oR2BBSokQWKDRdgay3r1OXZBpGS+B/gHkBk9nOxDXNQT3SD
   d5S/VJQ+7R9Pbh36yrgtKdCKnEw5Z0LBIbPpgViGdYi1lgRWX4byocenJ
   g==;
X-CSE-ConnectionGUID: ZTz3ywX4T46JCTOTQL5mnA==
X-CSE-MsgGUID: jh2CW4bxSN6SUwhiJe6yxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="105741655"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="105741655"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:17:49 -0700
X-CSE-ConnectionGUID: G7sg3GILRvyFR4uiszCSKg==
X-CSE-MsgGUID: QsrhBqDFTai4ya99CyYq3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249341451"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:17:44 -0700
Date: Tue, 23 Jun 2026 13:17:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <ajpdRUZhmn1fDXDx@ashevche-desk.local>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65459-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,vger.kernel.org:from_smtp,ashevche-desk.local:mid,linux.intel.com:from_mime,intel.com:dkim,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FBDD6B63CD

On Mon, Jun 22, 2026 at 10:30:10AM -0400, Frank.Li@oss.nxp.com wrote:
> Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
> simplify media code.
> 
> Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
> rkisp1-dev.c only silience improvement.
> 
> Anyways, *_for_each_*_scoped() already use widely and make code clean.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
for patches 2, 3, and 4.
Patch 1 has individual comments.

-- 
With Best Regards,
Andy Shevchenko



