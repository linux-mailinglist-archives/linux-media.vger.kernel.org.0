Return-Path: <linux-media+bounces-65145-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KafOIXkhM2pB9wUAu9opvQ
	(envelope-from <linux-media+bounces-65145-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 00:36:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC869CB0D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 00:36:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fYxPKBOe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65145-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65145-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0ABC30FBDBF
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 22:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911D03A3E7E;
	Wed, 17 Jun 2026 22:36:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ED73803F7;
	Wed, 17 Jun 2026 22:36:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781735789; cv=none; b=QC4VKUQCIY5qtm6TlXCT3Mo4ax8IrGlyDrrv8r8+qSwzMMYcUvrZSBfkFb5orETxRwG/b6LljKO3GGbntvEKeErQkLA1zgtJeg0otDe6yO47pJudmqL+ZrcqoAk+1jROz8z1zn4mmXp8laRegKGI12CyE35Qyr1AdV2+7YopwtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781735789; c=relaxed/simple;
	bh=xqYjUeV6vUJ0e8uDgzC+drVzHWfpAA3DVqnkox41OuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLcWhDuyHYlNDs7MuMagrTjwnFkrmvIVPmm1eFj18v/CuXhNGjD3UY9owt9FHJ/CD2ioRjKkbOnmQ3B3n944i33+yPX44r589FSm6gS39WHIjvz4VoqUvsq2c9Oq3MksugxWIAtJFr7A+gRzOCnilyGzNTGIuQBFq9Y8iQFbYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYxPKBOe; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781735788; x=1813271788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xqYjUeV6vUJ0e8uDgzC+drVzHWfpAA3DVqnkox41OuM=;
  b=fYxPKBOe/ZsI/g8diTD+cTlGQfmeb6bxvLLs5HJgS3ls/ohqrf54yAES
   bQBK56CcAjTQMkF3nbzsqFaU1gS3xF4sAWee42MmpYkHLRXO3NurL4JGs
   8dn8G9G66tykEKe0q5srv/wds8YIPd2WKvbKwp73ZaJz8nzrGC6aPDkxd
   PJBt55fwICq5AjKjR6urFE6BTVMdBFmNeTNrkZeMZrRL9UAacWfoVVuOz
   oCJIhV/+IhLECY4nUYMcq9ThpWuLicbijjrAVpF2gZVnJKrrwI5s3iVfX
   uu8Ge/PErM63JfaTeRslPrBfFL38kiaM8oj8CB3TnFem07uxCyd1yjooP
   Q==;
X-CSE-ConnectionGUID: ozcX0t0lTFyfjABU4/prGQ==
X-CSE-MsgGUID: LCKb7US7Qeyu6gyB6uA13A==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86399440"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="86399440"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 15:36:27 -0700
X-CSE-ConnectionGUID: SPtzNDigSgO4NknRt6PRGw==
X-CSE-MsgGUID: wzISkg4lQyqkIxcyu5zSnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="248250158"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 15:36:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0BB2811FAA5;
	Thu, 18 Jun 2026 01:36:20 +0300 (EEST)
Date: Thu, 18 Jun 2026 01:36:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/8] media: v4l2-fwnode: Add common helper library for
 1-to-1 subdev registration
Message-ID: <ajMhZP5YHuQdhc5M@kekkonen.localdomain>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65145-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kekkonen.localdomain:mid,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17EC869CB0D

Hi Frank,

Thanks for the patch.

On Wed, Jun 17, 2026 at 03:50:12PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Many V4L2 subdev drivers implement the same registration and media pad
> setup logic for simple pipelines consisting of a single sink pad and a
> single source pad. As a result, the same boilerplate code is duplicated
> across multiple drivers.
> 
> Introduce a common helper library for 1-to-1 subdevs to encapsulate the
> registration, media entity initialization, and cleanup paths. Drivers
> can embed a struct v4l2_subdev_1to1 instance and use the provided helper
> APIs instead of open-coding the setup sequence.

I appreciate your efforts in trying to reduce the amount of code drivers
need simply to get things done but I think there are a few issues with the
approach taken in this patch:

- The new helpers aren't generic enough, but require two pads; one sink,
  one source. You could provide special helpers for just this case, but
  right now it looks like that if there's something you need that the
  helper assumes you don't, you can't use the helper at all. In other
  words, more modularity would be nice.

- The new helper should work with the existing types and not add new types
  (struct v4l2_subdev_1to1).

- There should be a way to provide default V4L2 fwnode endpoint
  configuration as well as to validate the obtained configuration.

I don't have a good proposal to address the above but at least one way I
can think of making error handling easier would be to use devm_() for
teardown in more places we to today. That certainly does have its own
issues though.

-- 
Kind regards,

Sakari Ailus

