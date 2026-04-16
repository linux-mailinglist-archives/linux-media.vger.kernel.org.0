Return-Path: <linux-media+bounces-58947-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAAsMGor4WmQqAAAu9opvQ
	(envelope-from <linux-media+bounces-58947-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 20:33:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C3F413C2C
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 20:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 564B83038179
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC203290D1;
	Thu, 16 Apr 2026 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiofR7sZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B91ADFE4;
	Thu, 16 Apr 2026 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776364383; cv=none; b=jC/aj57JKHyKmLt3c1FemwXo0zc+UZleCRDBLP1Xnf5ljFaDKAkM3DrI5pDC3f5GXJtXq9R2Ied7LJWtZ6Is1CMslDKXTXuVED3TyAm4XK1VhpScOdOW4YiwLXIdZBS994O0pOI+vS4ECUz2GWqcWVKlRG1il/a238+uDHftIcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776364383; c=relaxed/simple;
	bh=1uMkSRDQhG0rZETdqZ6LzYPMwWHz5pC5npxlS0f5EyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HV6u8lvTMPnBFfL3r/rgXHLMSyHGQ/qnfTdxFkRZJAjpVPAI1ygvZlIxncMhqeKBgp233dLvWmIaKuk2niawUi68g73/OnGyhWFbr8BH96N5hy40Z/iPQjQdHwji+aslSioujte6ijor/+QfPFA31z4WQj7RuTk3Wxz23JDUGaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiofR7sZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776364381; x=1807900381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1uMkSRDQhG0rZETdqZ6LzYPMwWHz5pC5npxlS0f5EyQ=;
  b=WiofR7sZKdpjAA/qiK/PDO9LuBx9Tmnxy+oa1anmWMdClylYfDE/l864
   51VLRMy/GrzIegNWl762g3a2tgqti2yl3m/gkRX8lgFofhcOgEbHQgVji
   ujkehoxwjIDQZUbBYQ0FD6HeW0KGWeLnJHeS2j8Neu658w5B6KvD7j/jO
   Cxoq7kCb/qdyDySDQpSfR7kSFqmvKoVTdaMwzLtpvkeZXqN9irdgNEhyz
   92Kit80dcCwfqcE2sw/AV4zbgi19pIXPM+V0iT5YiZ+fRpcnIHpv9gq1A
   Dt1iSJOfHPcBbKT9fE+gkZ98BB4Aj7eslDRYO/61bfQCixhwDTgtj067l
   g==;
X-CSE-ConnectionGUID: 0KgwM8Q4SYGKgFKJKA3GBg==
X-CSE-MsgGUID: WZNywFNJSHm4hDb3OYzvzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81247927"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="81247927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 11:33:01 -0700
X-CSE-ConnectionGUID: FMD6hFrERaqv1HZ5aXPOVw==
X-CSE-MsgGUID: GRp09Ck2SeahQRV38ov3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="268820649"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.23])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 11:32:59 -0700
Date: Thu, 16 Apr 2026 21:32:56 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: fix memory leak of dvs2_coeff
Message-ID: <aeErWPk-gs-iCAN6@ashevche-desk.local>
References: <20260416064152.2482461-1-hhhuang@smu.edu.sg>
 <20260416131626.2544105-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416131626.2544105-1-hhhuang@smu.edu.sg>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58947-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 46C3F413C2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 09:16:26PM +0800, Huihui Huang wrote:
> There is a memory leak in
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.
> 
> In atomisp_alloc_dis_coef_buf(), dvs2_coeff is allocated by
> ia_css_dvs2_coefficients_allocate() and stored in
> asd->params.css_param.dvs2_coeff. If the subsequent
> ia_css_dvs2_statistics_allocate() for dvs_stat fails, the function
> returns -ENOMEM without freeing the previously allocated dvs2_coeff.

> Add the missing ia_css_dvs2_coefficients_free() call and set the
> pointer to NULL before returning on the error path.

Why do we need this?

...

>  	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
> -	if (!asd->params.dvs_stat)
> +	if (!asd->params.dvs_stat) {
> +		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);

> +		asd->params.css_param.dvs2_coeff = NULL;

Actually same Q here: Do we need this NULLification?

>  		return -ENOMEM;
> +	}

-- 
With Best Regards,
Andy Shevchenko



