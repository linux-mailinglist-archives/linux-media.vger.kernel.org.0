Return-Path: <linux-media+bounces-54088-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOwuGzWHpWkeDAYAu9opvQ
	(envelope-from <linux-media+bounces-54088-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 13:48:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B491D90E2
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 13:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 327F230797DD
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 12:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAA1385503;
	Mon,  2 Mar 2026 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1CSX99g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96DD36E48F;
	Mon,  2 Mar 2026 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455227; cv=none; b=IDz2vG116IJDorQT2UkXs4EdaU0GEguknx2lUnhp84nPYetOCyz1VWROF2ITMG6tOUbSQ5P9s8lxSeYhcOxdeC2DVDERb2aHkECvVPnAM+aguJaXkYnSW/wHVuxTQbXHlKw68zFYCP/ryIqzqNABQHqyjR2A+xjK+UUIcaeccXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455227; c=relaxed/simple;
	bh=rpzFy+7EAE2esAzP0RPdL71DMr4OTHuvCae1aeeRJGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGaEzuVCt5jSVpwE0eON7ZGS0hagu+rKLq5KPjKUwMT6YQ0qvTpI2t3PxRp5MOKrkpZqIC6+nsQdzjF52OHGviAutrFPK8c8KQI6wP21wgGtFA1tai8/AdXVxH65x6zPf6v9O52shBuXfTV4OyS9Qr6mFJwwT+DIYmNqLa2DxZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1CSX99g; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772455225; x=1803991225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rpzFy+7EAE2esAzP0RPdL71DMr4OTHuvCae1aeeRJGU=;
  b=S1CSX99gtZTuXrsFJc5pOnECB2B9zTEI9jT/vxt/j1kDxm8M/zU0YgkX
   SkwHLrvQ23TAv/rV2aRcAqDnOSK2u8zJFyN2Xl/jZIn+byX/S+d0ebZUK
   fTwZYQx3qZRZoZK4s6+/nmjdcPHPjSwQapsSbEtulfy4libsrjCiUylkf
   Vsum929bGAy+IR952ituqKhTRJLNyxyrvU6t24uLH68bPu7h2bcj+/Wg3
   q4TFxEgrYFeUTxUsNBTRaCqM70rcxq816WZ/tlvganjQQ0w3BE6g4B4kG
   ACnylJyx+PPdAPycuGbV1Os5d3jeNS5b2jXVYQEcr6/gy4vaE3No7gNt3
   Q==;
X-CSE-ConnectionGUID: modLsulHTCiLnE1Vygup6A==
X-CSE-MsgGUID: ltaMJFHHRJaI/Jap1lhl6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84810250"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="84810250"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:40:24 -0800
X-CSE-ConnectionGUID: iBKvTTLERxGUNdL1umrsdw==
X-CSE-MsgGUID: hW9uVTOJRbW9QZNkWNrMsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="214861458"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.89])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:40:22 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 799241212D6;
	Mon, 02 Mar 2026 14:40:49 +0200 (EET)
Date: Mon, 2 Mar 2026 14:40:49 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: intel/ipu6: fix error pointer dereference
Message-ID: <aaWFUapXp4Gz12h7@kekkonen.localdomain>
References: <20260217003420.47280-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217003420.47280-1-ethantidmore06@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54088-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: E0B491D90E2
X-Rspamd-Action: no action

Hi Ethan,

Thanks for the patch.

On Mon, Feb 16, 2026 at 06:34:20PM -0600, Ethan Tidmore wrote:
> After confirming that isp->psys is an error pointer goto is called and
> imminently goes to this code snippet below:
> 
> out_ipu6_bus_del_devices:
> 	if (isp->psys) {
> 		ipu6_cpd_free_pkg_dir(isp->psys);
> 		ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
> 	}
> 
> Since isp->psys is confirmed to be an error pointer not NULL, the
> condition is true and the error pointer is dereferenced. So isp->psys
> should be set to NULL before going to out_ipu6_bus_del_devices.
> 
> Fixes: 25fedc021985a ("media: intel/ipu6: add Intel IPU6 PCI device driver")

Add:

Cc: stable@vger.kernel.org

> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index 24238f8311a6..6e6b7d2a68ff 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -619,6 +619,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  				   psys_base, &psys_ipdata);
>  	if (IS_ERR(isp->psys)) {
>  		ret = PTR_ERR(isp->psys);
> +		isp->psys = NULL;

There are a number of checks for IS_ERR_OR_NULL() in error handling;
instead of setting psys to NULL here I'd add the same test to the condition
after out_ipu6_bus_del_devices:.

>  		goto out_ipu6_bus_del_devices;
>  	}
>  

-- 
Kind regards,

Sakari Ailus

