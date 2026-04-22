Return-Path: <linux-media+bounces-59288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPmgNcB26GmVKgIAu9opvQ
	(envelope-from <linux-media+bounces-59288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:20:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ACC442E49
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE6163074A0C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 07:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B4B36F411;
	Wed, 22 Apr 2026 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOdNn8O8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5645236D9FE;
	Wed, 22 Apr 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842150; cv=none; b=JPGn56CsF60w4fLPjI/Qlq9/ptZCf8wzGMN+NueaqBUjJpYvFxKzNRkOowvFkwmLF07Tvvu/UR2vb/kETozOoVArrkqywBgTYU/uWqk9pmK6+QETQz+n7UDIKNX5R9c1wJjygP3h8xijCISnnR8ltCg+pYBPRfrGFfCNYzJYzE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842150; c=relaxed/simple;
	bh=Gn2Jm42jqE9gFTv8djZxt7QP5Gn6bGlx1l4hDdnT+bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLKkDXQQwAQzz2/qA0HTkz0bsrgbv0J01Tkf5f8iagkxCLotlsIU1+KWl10G+cOXQ+NO8d6tbaE33p2dR2NbdeUiyT3gtdR4BGO5Wuplx5WCgY3WRbENhHPxNhYGjTFiHVnbh/9Ev476ITdlisWXBUg5tBKkAPyF0GJUrfciZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOdNn8O8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776842149; x=1808378149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gn2Jm42jqE9gFTv8djZxt7QP5Gn6bGlx1l4hDdnT+bQ=;
  b=EOdNn8O8moqZye3GPhuNBt/QL9QEwM6kuhPGYzbW8H1zYHEPv7mXPW6N
   ajcFZGaxZIndJ2IkRpwYZTpVLFUSljYk4XpzbOFW89P5vdiX5wcTRblOX
   S2948oPUfJzOvzfzdDbYm20Va6vGPA7XDhgvHuxSCN16Yqh3+oLYbQIYp
   d7jxRC+sIeoq5wmPTkIkEFeAX0EJUWj6vXX4c/dUds3KXifX7ihGEP9Y5
   3hv1mJVEUdtyQadFT5GaKHAkSuxH2oF1TAsGz+3MtnaPv/bLIf+ym1hfQ
   Jl6uDf4vVPBQSCRUsbAO0FP4zB1vSuvRvOfl/bnOqqDLos33fnF77kxKz
   Q==;
X-CSE-ConnectionGUID: SHOfjdKFSLWJ6IzGCIvejw==
X-CSE-MsgGUID: 5xBeKcTcTgS2MnmF81QPUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="100443695"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="100443695"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:15:49 -0700
X-CSE-ConnectionGUID: OWvqMF80S/muHJwqbrrQ2A==
X-CSE-MsgGUID: P0ydl1sOSwyazY4mYuYC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232181867"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:15:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4EDFC1201FC;
	Wed, 22 Apr 2026 10:15:45 +0300 (EEST)
Date: Wed, 22 Apr 2026 10:15:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH v4 5/5] media: ov8858: add ACPI device ID INT3477
Message-ID: <aeh1obUwTJ7eIof9@kekkonen.localdomain>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
 <20260421225217.12472-6-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421225217.12472-6-tchatard@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59288-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44ACC442E49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thierry,

On Tue, Apr 21, 2026 at 03:52:17PM -0700, Thierry Chatard wrote:
> The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
> Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
> INT3477 to the ACPI match table so the driver binds when instantiated by
> ipu_bridge.
> 
> The supply names array already covers the regulators needed on this
> platform: the TPS68470 board data maps VSIO to the "dovdd" supply of
> INT3477, so enabling dovdd via regulator_bulk_enable() also activates the
> S_I2C_CTL passthrough (reg 0x43) that gates I2C access to the sensor.
> No additional supply name is required in the driver.

I think you can drop this paragraph.

> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  drivers/media/i2c/ov8858.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index 3f45f7fab..a1fa0be52 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c
> @@ -79,8 +79,8 @@
>  
>  static const char * const ov8858_supply_names[] = {
>  	"avdd",		/* Analog power */
> -	"dovdd",	/* Digital I/O power */
>  	"dvdd",		/* Digital core power */
> +	"dovdd",	/* Digital I/O power */

Why?

>  };
>  
>  struct regval {
> @@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, ov8858_of_match);
>  
> +static const struct acpi_device_id ov8858_acpi_ids[] = {
> +	{ "INT3477" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
> +
>  static struct i2c_driver ov8858_i2c_driver = {
>  	.driver = {
>  		.name = "ov8858",
>  		.pm = &ov8858_pm_ops,
>  		.of_match_table = ov8858_of_match,
> +		.acpi_match_table = ov8858_acpi_ids,
>  	},
>  	.probe		= ov8858_probe,
>  	.remove		= ov8858_remove,

-- 
Regards,

Sakari Ailus

