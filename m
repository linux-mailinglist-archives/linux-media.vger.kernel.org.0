Return-Path: <linux-media+bounces-34199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E21ACFD59
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 09:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A4A618892CE
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 07:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58425283FF9;
	Fri,  6 Jun 2025 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcK+yfmS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47EC1F429C
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 07:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749194324; cv=none; b=A5mfnhRE5PTURUUuWPu7y6Q//ll65P0ufTnXHcEubdIWBF72nBDj0KY6KxWDIno1HJBUTkqKLtC3XV2JkABff5+kierjujiuYSHrai/PjEj2nkt3DkkSyLR3+3eqqPAHpjCcuG00aSR99TnRybr9yLnSfKdCzH4mXh9dHypp1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749194324; c=relaxed/simple;
	bh=A2A5Tagw+p9y5hJFlm3EtNTjEzxH70Y4WJfg+oOSQsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCTTlCqH+nGYebzMFiNCVTKszZ87ZUpStoHDM/hUPQi0bfMCxevWHI9GaQYv2kQcDa8gOi0572giv+Sa9M+hzOXxZNA4xDnXE8PNVD7b1sQ6zf66EEqL1sYG65Q/sWa9ooL+7qt3SmajqLBxLrm8ZWU7D1ok7iHPgw//NNW/XZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcK+yfmS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749194323; x=1780730323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A2A5Tagw+p9y5hJFlm3EtNTjEzxH70Y4WJfg+oOSQsU=;
  b=LcK+yfmScPu7btPZoximlqswwVB2+F27FuVArkoLPjTNiRh0D+Ldyjvy
   VX0Qir/lqSrmXVCl/bS7zrNwkY+yvGXMwuNUIoL8xaFT8rKZvdzRhatVL
   LQo5UEle4h7p9Iq66cxp7yuwgvQq3k/3kDvTLxRfhpfSyoqwNcoOhyKzk
   z5OWgjkiyWmhzfobQI40qrczcoadzdLHv30KmiMWwbYBYewQzSNpFIVQ+
   pqLGp49s1Z2XJLzTsU38aqyjV5e5vewdNNdzSBB9jgIl2SmzJ6kfDmu3o
   KDp54t4Uc33QgZTLyHrliTtoiVXXsMKoGtollUHYapo+CWSN+duWYNTJr
   g==;
X-CSE-ConnectionGUID: vV6T2Ci8SDmVT1dXgdWrog==
X-CSE-MsgGUID: Jz2H9bAtQKelxHoJP96a+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51480337"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="51480337"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 00:17:57 -0700
X-CSE-ConnectionGUID: xpmbE6hEQcmMJlmQlhS+yg==
X-CSE-MsgGUID: 77x9FkaqSnCFOJDbQ030WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="146262416"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.238])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 00:17:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 67B6911FBCE;
	Fri,  6 Jun 2025 10:17:48 +0300 (EEST)
Date: Fri, 6 Jun 2025 07:17:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: hi556: Support full range of power rails
Message-ID: <aEKWHMAAevtfaAqb@kekkonen.localdomain>
References: <20250531190534.94684-1-hansg@kernel.org>
 <20250531190534.94684-3-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531190534.94684-3-hansg@kernel.org>

Hi Hans,

On Sat, May 31, 2025 at 09:05:34PM +0200, Hans de Goede wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> Use regulator_bulk_* to get the array of potential power rails for
> the hi556.
> 
> Previously the driver only supported avdd as only avdd is used on IPU6
> designs. But other designs may also need the driver to control the other
> power rails and the new INT3472 handshake support also makes use of
> dvdd on IPU6 designs.
> 
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/hi556.c | 40 +++++++++++++++++++++------------------
>  1 file changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
> index d3cc65b67855..110dd00c51ae 100644
> --- a/drivers/media/i2c/hi556.c
> +++ b/drivers/media/i2c/hi556.c
> @@ -624,6 +624,12 @@ static const struct hi556_mode supported_modes[] = {
>  	},
>  };
>  
> +static const char * const hi556_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};

As the need to have these regulators is not related to a proper firmware
API, I think we should have at least DT bindings that document them.

Another option would be the GPIO-controlled multi-GPIO driver, I can post
one at some point but I can't promise a schedule at the moment so this is
definitely something for later.

On the other hand, virtually all sensors need at least two regulators so we
should be safe for now...

-- 
Kind regards,

Sakari Ailus

