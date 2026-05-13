Return-Path: <linux-media+bounces-61416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMV/FCBuBGprIQIAu9opvQ
	(envelope-from <linux-media+bounces-61416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:27:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B2533072
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3ABA30069B9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFEE40FDB4;
	Wed, 13 May 2026 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0SHT5xR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BBD255F52;
	Wed, 13 May 2026 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675085; cv=none; b=Zl8JImUle2K8E04WFIYbS3k3TvZLvO9n2aAtFE5eXZTDohbox0dCxpcQ3XJPPGx9HW79oArqmj+K4775c4ZRRclmeNscM1uhMt8AYWRxuWfWjMpjdP5i/k6J2/TBGp23PBYtY1/2MRYS19fqrVlyqvfwSlcTpDZTSbpoJEKxCys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675085; c=relaxed/simple;
	bh=DVAoMViVMASncc7zUcAEkMCzumBkRqZinPLtqskc95s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rctDDkLYgNfkJuWfPDLAPyZaEaTp4U3CqlwF2ygkfmTlv6h+3XOEyuATOdSrx7d7wzdxjngP+juKpy4XbAy1omi2lYXDFZPu4SKFjB4U2LMvgBzUcIYnzRmm4IGgxS29QCyaZuoS/hSqXiixZql64Ivz8mWheFiaVCTFdgO+2Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0SHT5xR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778675084; x=1810211084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DVAoMViVMASncc7zUcAEkMCzumBkRqZinPLtqskc95s=;
  b=T0SHT5xRx8Jd+4gPiZH7mjmhdsQam/MAKXYq/s8Q4pz6P6VjrJ9/Xf4v
   aiwYqDBbY75tVz5IjFFBuU0Fs6uIMvjojsRYzkIB/lqpg6tP8D2NiVapx
   0+REdW10dyNQS4R3qVbPEU3etSKK9DXENxTiJcBd5cpOq3pQC8+XrMuFY
   oPqBK/p/FZ8i+Kosw/SrOPYcYevvn0dE9tGlSQRNNYmrgpHk17DiTNJzl
   wUtcofgNHNS3CRE7p67VwhYTzA+iB4ih+PoSxLdBgK66mindFBFL4ClS0
   cnl3Sv+vAFJ4/rgLTtnt40ia6lpBwmmIYzonlwr/3p0dUUQQWZOexGgoC
   Q==;
X-CSE-ConnectionGUID: UCxIwaTaSLa1ygnAAa3T3g==
X-CSE-MsgGUID: 7n6OF4h4Ta6Nbp/8XARUNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83473065"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83473065"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:24:44 -0700
X-CSE-ConnectionGUID: kUEJoyoSSRK1uFx7wquXlQ==
X-CSE-MsgGUID: EuVz68HXRoy8Wy/p9xm3+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="235398406"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:24:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9BC03121CA3;
	Wed, 13 May 2026 15:24:39 +0300 (EEST)
Date: Wed, 13 May 2026 15:24:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arun T <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com, arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com, dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, mehdi.djait@intel.com
Subject: Re: [PATCH v10 1/2] platform/x86: int3472: Add TPS68470 board data
 for Intel nvl
Message-ID: <agRth_6pb8zjVgIF@kekkonen.localdomain>
References: <20260408104510.392906-1-arun.t@intel.com>
 <20260408104510.392906-2-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408104510.392906-2-arun.t@intel.com>
X-Rspamd-Queue-Id: 4B0B2533072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61416-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gitlab.freedesktop.org:url,qualcomm.com:email,checkpatch.pl:url,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Arun,

On Wed, Apr 08, 2026 at 04:15:06PM +0530, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
> data to configure the GPIOs and regulators for proper camera sensor operation.

Please rewrap this -- checkpatch.pl would have warned about it.

> 
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

...

> @@ -336,10 +418,27 @@ static const struct property_entry msi_p14_ai_evo_gpio_props[] = {
>  	{ }
>  };
>  
> +static const struct property_entry intel_nvl_gpio_props[] = {
> +	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),

After Antti's patches this no longer applies.

Can you rebase the set on my int3472 branch
<URL:https://gitlab.freedesktop.org/linux-media/users/sailus>, please?

With this, I think it'd make sense to rename msi_prestige_ai_evo_gpio_props
and msi_prestige_ai_evo_tps68470_gpio_swnode as
int3472_tps68470_daisy_chain_gpio_swnode and
int3472_tps68470_daisy_chain_gpio_props, respectively, and use it here for
NVL as well.

Can you add a patch for that, to precede these two?

-- 
Kind regards,

Sakari Ailus

