Return-Path: <linux-media+bounces-63522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nr5pLazbH2oSrQAAu9opvQ
	(envelope-from <linux-media+bounces-63522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:45:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E2B6355A2
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:45:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=DyFr7ud9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63522-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63522-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5B963074673
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81D23FE66C;
	Wed,  3 Jun 2026 07:43:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05F22E54AA;
	Wed,  3 Jun 2026 07:43:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472604; cv=none; b=RpaLejooN0HK0Yk4VTPh77KeeCCOIGANDViUiYTbgEzLCKRzqEim+PQGr+QuO9upgo74sLhxZeQi3yiEwhp+PSgFjAV8Cmy0F8CBxWBOUJzMynLm1gSrlqR1UzYBt0xLzklO6xPbrcUcbVhbQ0QT3IQAG0NKZjfYh0GYR+tbSvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472604; c=relaxed/simple;
	bh=EfL0Y/vc1moO5CywnqEtYC7Ec6QRAJkjLGeMfMk425U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J26OGrY5Z9PwjTvDAvWyMvS/H1wuJg3DovpNZLnFBZmN70Rh47U0ZCAUoRMBSRtsuFBeoqQ0GRkuZT1lYDUuwXkulwZIz3RGZbSjx2PnhyjoinIw9QZcUsR+vshJMhHGh312kpOSgQUX7DnC9OGqfhFIkG6GY+vmCya2X7j+9BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyFr7ud9; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780472603; x=1812008603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EfL0Y/vc1moO5CywnqEtYC7Ec6QRAJkjLGeMfMk425U=;
  b=DyFr7ud9iTNN/6/yvWwpgOsUOxiYeDYvTamNnIhjLaFsmhZ7bEt8znBx
   5sKRtnfQiPnR2z9sKAyAXRr6GxhsTYnKjjKpqrj5BmuqnJLRZOxbchL2Q
   x4WsuWXQQNyp1SVaizVv1g7LLmg+aokcfDJzEIOE/IqNgbPaqDiCaVT5d
   byKA1uppotIARK8pxarMPUSg20cfH0jhkrPNp2ybyWvUZw3fkOa+SuyDA
   8OhJNehEjPHqYaAs0+J05odG0lefsOLXjX34jLXANoxgDT3akPnZFmw7T
   CF3XfQiwgQqR41qkrNaS2PAizd1iR3P1u6A2UjjT2LLL7yUK278KcHfm7
   Q==;
X-CSE-ConnectionGUID: KQdptHfGSRKthnSlFaGjkA==
X-CSE-MsgGUID: 2weHUf4JR92CmKI8WSVJ7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92378633"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92378633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:43:22 -0700
X-CSE-ConnectionGUID: nROCRjs3QNyIgLlKokCflA==
X-CSE-MsgGUID: 4VeEMZS7Tym54okgqXmZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="282257650"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.175])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:43:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C7464121C60;
	Wed, 03 Jun 2026 10:43:17 +0300 (EEST)
Date: Wed, 3 Jun 2026 10:43:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>, rafael@kernel.org
Cc: linux-acpi@vger.kernel.org, lenb@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	mehdi.djait@linux.intel.com, wei.a.xu@intel.com,
	atul.raut@intel.com
Subject: Re: [PATCH] ACPI: scan: Honor _DEP for Intel CVS devices
Message-ID: <ah_bFVtDCzWPeE4z@kekkonen.localdomain>
References: <20260601194040.18223-1-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601194040.18223-1-miguel.vadillo@intel.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63522-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:miguel.vadillo@intel.com,m:rafael@kernel.org,m:linux-acpi@vger.kernel.org,m:lenb@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mehdi.djait@linux.intel.com,m:wei.a.xu@intel.com,m:atul.raut@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,linux.intel.com:from_mime,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55E2B6355A2

Hi Miguel, Rafael,

Thanks for the patch.

On Mon, Jun 01, 2026 at 12:40:40PM -0700, Miguel Vadillo wrote:
> CVS (Computer Vision Sensing) is an ACPI-enumerated device that sits
> inline in the CSI-2 path between the camera sensor and Intel IPU.
> On platforms where CVS is present, the camera sensor's ACPI node
> declares a _DEP dependency on the CVS device.
> 
> The CVS driver must be fully initialized before camera sensor drivers
> probe, because CVS controls the CSI-2 link ownership handshake (via
> GPIO REQ/RESP), the MIPI/CSI-2 lane configuration, and the camera
> power domain. Without CVS ready, the sensor driver can bind but the
> CSI-2 stream will not function correctly.
> 
> The CVS driver calls acpi_dev_clear_dependencies() at the end of its
> probe() to unblock waiting consumers once it is ready.
> 
> Move the CVS HIDs from acpi_ignore_dep_ids[] to acpi_honor_dep_ids[]
> so that camera sensor enumeration is deferred until the CVS driver has
> finished probing, matching the behavior already in place for IVSC.
> 
> Signed-off-by: Miguel Vadillo <miguel.vadillo@intel.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Rafael: do you think this could still make it to 7.2? Otherwise cameras
might not work on a some laptops where they did use to.

The default configuration is appropriate in some laptops so camera used to
work without the CVS driver but now that we have the CVS driver merged and
the CVS device is part of the software node / ACPI graph, probing the
camera sensor driver will in fact not take place at all (and obviously the
camera won't work in this case).

-- 
Kind regards,

Sakari Ailus

