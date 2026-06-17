Return-Path: <linux-media+bounces-65101-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2fzgL1VsMmrlzgUAu9opvQ
	(envelope-from <linux-media+bounces-65101-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:43:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF962698049
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=KXuSyCVw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65101-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65101-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6CF0305DA8C
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 09:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A493B6C1C;
	Wed, 17 Jun 2026 09:40:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F104439D3F1;
	Wed, 17 Jun 2026 09:40:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689228; cv=none; b=awazaKAK2r+lm4zWX02SfxSi8lw+Gm4XTjm2AC9vjs+4cYgdzmY04f2Qa/AEBDRRcj4qHA5yBdjVPEjGXdTLLzoGq9BkJ4eNpV8TBnawEUZac5Ps1sfH5DY+4q4KPEDyCEyYmVS+sSt/5MMxarAPBP12TniiyZSLcqsYY9BWqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689228; c=relaxed/simple;
	bh=j+ldJkw8refaL1OUAouw/yOdplUz8ecb4jKayH2Uqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIuBK9lOTp/AF3W0hxbcJOzHLhVF3iCRZOfpcNSrb5lk7O/ObFlFr5CZejNoEGZ5bkgJ2FoLGF8bbRvSrFkgbnejQgD+QW6whskM8bsawMmJM3l7nqjM3xBKZiDmGJvCVwSuUlNlrTmFqwFNrDKyJ8ghXUy6kBSOoGhT9J3Fi4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXuSyCVw; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781689227; x=1813225227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j+ldJkw8refaL1OUAouw/yOdplUz8ecb4jKayH2Uqck=;
  b=KXuSyCVwV++GgFzDyGwWelat8/LssG+ybC0fW3qSQmXhWK103KPdum5Y
   d3MY6aIiXlZ/WuvgB7BIrdyi94Y6WPjMpTBA7SkQRgGB99S15DxwEaDfk
   LbLrCKUsTNWP5nAyL0WsDFBMnB9lb/TSOFyTyCddHd8hz7j78V9LfJXdw
   tX71hh5lPkTgahIx/OPxt9grkj1ep7uS0PE8yWAhRGQ7Rb6Wa+DvFmkjI
   /v78Gt172n/JCQWLG1jIWpfbtOWVPDzdl9JVHUPTheRJte+JcPkqWim6H
   pP976V7D64CP0FsQJJPYuof9iHXcfDO/UrNnZzNXaSnvdCifSIZLi0tRB
   g==;
X-CSE-ConnectionGUID: JNd+dsfCQ5GiF7Ewhg0pVA==
X-CSE-MsgGUID: DGj7cKIQSPyC65hZnBs9xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82533998"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82533998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 02:40:26 -0700
X-CSE-ConnectionGUID: InnwzJJjQhK8nW1aZAQbZw==
X-CSE-MsgGUID: eWvv0gDSSLCHsC5E79HWhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="252322044"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 02:40:24 -0700
Date: Wed, 17 Jun 2026 12:40:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: andy@kernel.org, error27@gmail.com, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: Re: [PATCH v3 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ajJrhE3cjwKPom5a@ashevche-desk.local>
References: <20260616134319.3969928-1-dawei.feng@seu.edu.cn>
 <20260616134319.3969928-2-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616134319.3969928-2-dawei.feng@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65101-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dawei.feng@seu.edu.cn,m:andy@kernel.org,m:error27@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF962698049

On Tue, Jun 16, 2026 at 09:43:18PM +0800, Dawei Feng wrote:
> atomisp_initialize_modules() creates CSI2 and ISP subdev media entities
> before atomisp_pci_probe() registers them. Its counterpart,
> atomisp_uninitialize_modules(), only releases part of that module-owned
> state and leaves some media entity cleanup to the entity unregister path.
> 
> That ownership split is incomplete for probe error paths. If
> atomisp_pci_probe() fails after module initialization but before all
> entities are registered, the unwind path cannot rely on unregister
> helpers to release media entity state whose lifetime started in module
> initialization. The CSI2 and ISP subdev media entities can therefore be
> left allocated.
> 
> Refactor the cleanup boundary so module cleanup releases media entities
> created by module initialization, while unregister helpers only undo
> registered V4L2 and media device state. Move CSI2 and ISP subdev media
> entity cleanup into atomisp_mipi_csi2_cleanup() and the new
> atomisp_subdev_cleanup(), and run media_device_cleanup() after module
> cleanup in the probe unwind and remove paths.
> 
> If atomisp_mipi_csi2_init() itself fails, it has already unwound its
> partial setup, so return the error directly. Only the later
> atomisp_subdev_init() failure path needs to clean up CSI2 from the
> caller.

...

>  void atomisp_mipi_csi2_cleanup(struct atomisp_device *isp)
>  {
> +	unsigned int i;
> +
> +	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)

In case you need a new version

	for (unsigned int i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)

> +		media_entity_cleanup(&isp->csi2_port[i].subdev.entity);
>  }

Or maybe Sakari can tweak this whilst applying.

-- 
With Best Regards,
Andy Shevchenko



