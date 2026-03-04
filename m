Return-Path: <linux-media+bounces-54541-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PyvEKOoqGlOwQAAu9opvQ
	(envelope-from <linux-media+bounces-54541-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:48:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E331B208315
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F22E3041BC9
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 21:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC5A3CD8C8;
	Wed,  4 Mar 2026 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djt0iN/L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB8C27FB0E;
	Wed,  4 Mar 2026 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772660616; cv=none; b=GZrIPLnjeRjgzVOY/fuySmbvp54PDskp0PSZtX0UDNYwwVmhpxx5qKETEQUnx7GhbfoIikB5RZAzJmapPc8eOGvqErf6P+1o0dELsMll1CDj6WhlH/M4MLwhxsGeoLxHp5CRAo9QshBURwxVkzk1E6SU4p3lpy9EKBSeBCiyi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772660616; c=relaxed/simple;
	bh=7wXP8WRiNeSyKnTYbShOZiG/e+hNJHKsu0WRVUrocSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laYYEOwKGODI3v740Tegwev4feZSXFHdfIB0Mc5/YzVWkid822tc2mGnLJaQmn+4JE5jUzXP721SVKApf93Zyru0bgWkByGgPsO2+L9rL6nrcjE3k37wdJptkkn3PW3bLq9r8Q2PxYF928+bE+q9NraeTZf2FcLZSGcaWPau8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djt0iN/L; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772660615; x=1804196615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7wXP8WRiNeSyKnTYbShOZiG/e+hNJHKsu0WRVUrocSQ=;
  b=djt0iN/LX5Cu9Exh3CYvu6y4p7fM7byIgwwteFYgf6x+4+nVYwVpRfJ6
   0ktjwE3HsaE3Y1cC4+wPJ4xRl3AfkPokNzYPWQ0j1m3QF5JP/y3jNfHc1
   MjJS9gCnZO3qz4076lASbfFjml3HIjQEFOg1sXHQEZvbJ8IyFTG2iqQK5
   r9wsfQzFMgMh3CJdbx/Q1E6BpzZ/mClrcDcMPj+/bU7zfenmfmG6DwxXc
   cmomhjMchxFjoGb5A17cJkc3oNG+elHeXi4lKq+zAxFq05I6p5SCrEfHd
   byYLKEg9J4twQRmaHkw1z7iaXKOI9FZssqaDI88onPVWw/JwfKxixUW25
   Q==;
X-CSE-ConnectionGUID: IJ2pJA+hRQW4ohpZXuoqCA==
X-CSE-MsgGUID: RyymdAe8TOSCB9MKjsuXHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85206487"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="85206487"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:43:35 -0800
X-CSE-ConnectionGUID: HipjXJbqSqOXgbAMz8bTdg==
X-CSE-MsgGUID: QdS6PPkRTU2JfLIcFLOudg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217627119"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.13])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:43:33 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E5CDB120CA3;
	Wed, 04 Mar 2026 23:44:01 +0200 (EET)
Date: Wed, 4 Mar 2026 23:44:01 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Message-ID: <aainoYv6RXkXFcHv@kekkonen.localdomain>
References: <20260304185001.82988-1-clamor95@gmail.com>
 <20260304185001.82988-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304185001.82988-3-clamor95@gmail.com>
X-Rspamd-Queue-Id: E331B208315
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54541-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim]
X-Rspamd-Action: no action

Hi Svyatoslav,

One more thing...

On Wed, Mar 04, 2026 at 08:50:01PM +0200, Svyatoslav Ryhel wrote:
> @@ -2646,9 +2658,18 @@ static void mt9m114_remove(struct i2c_client *client)
>  	pm_runtime_set_suspended(dev);
>  }
>  
> +static const struct mt9m114_model_info mt9m114_models_default = {
> +	.state_standby_polling = true,
> +};
> +
> +static const struct mt9m114_model_info mt9m114_models_aptina = {
> +	.state_standby_polling = false,
> +};
> +
>  static const struct of_device_id mt9m114_of_ids[] = {
> -	{ .compatible = "onnn,mt9m114" },
> -	{ /* sentinel */ },
> +	{ .compatible = "onnn,mt9m114", .data = &mt9m114_models_default },
> +	{ .compatible = "aptina,mi1040", .data = &mt9m114_models_aptina },
> +	{ /* sentinel */ }

The driver also supports ACPI. mt9m114_models_default needs to be added to
the ACPI data, too; otherwise ACPI support breaks.

>  };
>  MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
>  

-- 
Kind regards,

Sakari Ailus

