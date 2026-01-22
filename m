Return-Path: <linux-media+bounces-51351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHUNLpAdcmmPdQAAu9opvQ
	(envelope-from <linux-media+bounces-51351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 13:52:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 070DF66E1C
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 13:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B24A38CC557
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 12:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8266B387587;
	Thu, 22 Jan 2026 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIDZ9UeV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2684B2749D2;
	Thu, 22 Jan 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085439; cv=none; b=fRnEKNxRtQmrkkZd4FcElxifza/OQbPlH+HVMa2IAGHXBf1aCdOUKUIv7bXceKenR2EaKpC35tqlRN1zjArFqF3XeN/khbopBClicMcCPO+G4WBOgvTye7HcPUr3QCk9+lnQ1eoenltAMvfDND+oJyAjkbBlvqqyO4ZVaGqrGoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085439; c=relaxed/simple;
	bh=h5ACdgj/nrYu+Mfqs2gWLJaiU+uPJKsNEOROf11gocE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O//Jcsa/7IZW5Fx1Lzo8+MqulfdO7NJw2bX4zsMaI3qH3sa/AfIYLw7/R8mvxZ0BnS7jqGNW8Khju6jIGfFxmUY3XX8B0jjSZ7HNl2mJAEW+Fdc7DcYZg6QceJkPOHTIYDH6PlT2AXwVsffPnCQifxWGxg9igCqIBVzEQqgE6FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIDZ9UeV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769085437; x=1800621437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h5ACdgj/nrYu+Mfqs2gWLJaiU+uPJKsNEOROf11gocE=;
  b=UIDZ9UeVEJrQsnj7kZn9c+WSM9EGBgyOc1AjoIXPEGS/PMrejJDr3Czc
   QXnLspTl3MFp2Z0Azo6IB5zXKz2BeLInsrs9cKL54DOmcci7r4Tfm7U24
   m4+no666Pvpk/i2jqI2ZpFbjsXCwV89e1UxqLRY8AsvFrPdqVol+tt5B1
   1oY/Kz5DEcD+vBdGnRbvioyHFqs73V6WnMbFGVsNKI5OvrIHEO70vD+f/
   TNXjVVGmUfLvbA72dfHWrV64gs2ZqBwGm6JkIyFswNv3CmPOLYEirSaiB
   m2TXQCMLiO9Y6x9Z4ekK6gduCXT9FWiUuw3hBcfnEDQx/oC4N8wk7kM6m
   Q==;
X-CSE-ConnectionGUID: D0iqJnMySNqpZtbtjqtzyQ==
X-CSE-MsgGUID: druDQSQ+TLeqA9skATfPqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70233178"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70233178"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 04:37:16 -0800
X-CSE-ConnectionGUID: fOfCe2huQjSvdRnNZEkgCA==
X-CSE-MsgGUID: qD87YsnxSsWaWfQaX2KRMg==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.231])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 04:37:15 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1675C121D5F;
	Thu, 22 Jan 2026 14:37:18 +0200 (EET)
Date: Thu, 22 Jan 2026 14:37:18 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: imx412: Extend the power-on waiting
 time
Message-ID: <aXIZ_lxi1OeuXbV7@kekkonen.localdomain>
References: <20260122-imx412-v6-0-2c0b54594c2a@oss.qualcomm.com>
 <20260122-imx412-v6-2-2c0b54594c2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122-imx412-v6-2-2c0b54594c2a@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51351-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,intel.com:dkim,qualcomm.com:email,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 070DF66E1C
X-Rspamd-Action: no action

Hi Wenmeng,

On Thu, Jan 22, 2026 at 05:31:19PM +0800, Wenmeng Liu wrote:
> The Arducam IMX577 module requires a longer reset time than the 1000µs
> configured in the current driver. Increase the wait time after power-on
> to ensure proper initialization.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  drivers/media/i2c/imx412.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index aa63dfc349181bf9c180ffd566b0317d05b410c1..9154c238949e4308755e757bd9c71f0b44f433ee 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1037,7 +1037,11 @@ static int imx412_power_on(struct device *dev)
>  		goto error_reset;
>  	}
>  
> -	usleep_range(1000, 1200);
> +	/*
> +	 * Some IMX577 modules require a longer reset settle time.
> +	 * Increasing the delay from 1ms to 10ms ensures reliable startup.
> +	 */

This still doesn't mention the Arducam module. :-(

> +	usleep_range(10000, 12000);
>  
>  	return 0;
>  
> 

-- 
Regards,

Sakari Ailus

