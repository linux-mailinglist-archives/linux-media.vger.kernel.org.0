Return-Path: <linux-media+bounces-64068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AnPNFnbWJWoiMgIAu9opvQ
	(envelope-from <linux-media+bounces-64068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:37:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0C7651825
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 22:37:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lfJIQ9ju;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64068-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64068-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 484073008515
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 20:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E136F32D0FC;
	Sun,  7 Jun 2026 20:37:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F026E165;
	Sun,  7 Jun 2026 20:37:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780864626; cv=none; b=tjV6VbF5uWnXjJQpHspgG2twFks8Sniw0NPBsSyWVz6p9DG9ALExJYOlP8w1b2Q5SdfA3CL1MrO3kLD6xRRluBsNsAowMpA0BI+nktdCSYWwwMWLyIuK9W4zL+KvtWcgR4zyoz1ln8Zw+XkYQ96MIjbm5err4mzuDxA1To86Lnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780864626; c=relaxed/simple;
	bh=+eTh50iyNL/DLmkk83te2YGIkbzI3XqmoiPHoiXwDBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsO5Gji8OD+KtaX4WJ8aPtDwn6sbxT5ZVVUHDkKgdI9o5pJ7iVHrmOUuVg1YGPZvErOpglH/sE4zk2ips/WzklNYKQYIntOGpMSZCZ1KMM7NgwsZe2yp3TeOe3kspi98pIUE93BnD4ieoduJpbLiCd5fPdC1Ry4LYcAzzM5nzpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfJIQ9ju; arc=none smtp.client-ip=192.198.163.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780864624; x=1812400624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+eTh50iyNL/DLmkk83te2YGIkbzI3XqmoiPHoiXwDBo=;
  b=lfJIQ9ju0z28KCqr7wd7y0tsEGiktYpZh1+VvXDo4JBxrC790KSeyVmF
   STjp44LgufeGhiIyFLn6H8ytv6s+ELrJ0bu3IS1mSKce+mEJ79zjuiRQ6
   9lFYcYIlsx2/uVeCXu+BJGam+UCHvbY5p/YV8I4VOL2r2vlxBmONgALWM
   /h+OxkrzCT+VXos4GcyL0LS9z663a39PJn3P9nIhZAUP/b1K8SxDz8Hig
   A3VHh3EG3Pz2H3k+sQ2pl7XBgrTobx9GCj1f7j2dqog3/seSMJUzDn3KM
   x5zFfTP5g5rEdg5M6ohWKySsaiPt9PPislgxmfZh927LuTRO3h2CV3kB4
   w==;
X-CSE-ConnectionGUID: 6SmY4MsrSM6T3b/E5FMFTg==
X-CSE-MsgGUID: slyjCkFUTxOLFBy0bXD9xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="92287514"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="92287514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 13:37:03 -0700
X-CSE-ConnectionGUID: Ql/+VqrRSqee51JJ1fnLDQ==
X-CSE-MsgGUID: GlcWti4NTH21tu7oHkOILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="275547356"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 13:37:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9785D11F894;
	Sun, 07 Jun 2026 23:36:58 +0300 (EEST)
Date: Sun, 7 Jun 2026 23:36:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, hao.yao@intel.com,
	jimmy.su@intel.com, jason.z.chen@intel.com, ribalda@chromium.org,
	kees@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: intel: ipu-bridge: add blank line after
 declarations
Message-ID: <aiXWas4G0SW-regg@kekkonen.localdomain>
References: <20260607130853.55980-1-dennylin0707@gmail.com>
 <20260607130853.55980-3-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607130853.55980-3-dennylin0707@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64068-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hao.yao@intel.com,m:jimmy.su@intel.com,m:jason.z.chen@intel.com,m:ribalda@chromium.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E0C7651825

Hi Hungyu,

On Sun, Jun 07, 2026 at 01:08:53PM +0000, Hungyu Lin wrote:
> Add a blank line between the local variable declarations and
> the following statement in ipu_bridge_get_ivsc_acpi_dev().
> 
> This addresses a checkpatch.pl warning.
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 471a449f11f6..28d309646c1e 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -180,6 +180,7 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
>  		struct acpi_device *consumer, *ivsc_adev;
>  
>  		acpi_handle handle = acpi_device_handle(ACPI_PTR(adev));
> +

This newline indeed is added where appropriate, but there's an extra one
just a few lines above. Please remove that one as well.

>  		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
>  			/* camera sensor depends on IVSC in DSDT if exist */
>  			for_each_acpi_consumer_dev(ivsc_adev, consumer)

-- 
Sakari Ailus

