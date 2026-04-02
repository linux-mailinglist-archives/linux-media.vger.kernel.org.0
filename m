Return-Path: <linux-media+bounces-57979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EH2BrifzmlZpAYAu9opvQ
	(envelope-from <linux-media+bounces-57979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 18:56:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B211038C403
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 18:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1ACA43036C1B
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 16:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99EE3F8812;
	Thu,  2 Apr 2026 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDkXtS7O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC903F6606;
	Thu,  2 Apr 2026 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147961; cv=none; b=bH0diH2Hrfy+lM45SEop8aY2yZsjhSUvm+M1Tc5BmOHlFVR5/KM3FT62nzSGvWrCpdb1qn2juPthSLO0xhjvypQcOyesfXLqjjpOSVWnhuSs1H7sJAxv0oztlSUiCLJyiJtV7zjW9q7qriIloHxmTI5e4Rv69wNjQnH+TRtFd7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147961; c=relaxed/simple;
	bh=qmfeRpmJ9X/50ADCokFRyOKJhfuKtYr3hKh0UhxfIAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ze81wpUS574/xGA2RTG+XRMoUU1nNWeNBOKbBli5m8dU2vscbsJGhaatGAEQNTEJRw4g7WTUQtJTSWcwrWVdavpTbcLVWhWC34E6XMvpqu5drfR07zDXaQrTBgQo4Gz7T39hIuQZK16BxDOXLvBsQwi0tvJ/W5bvSZ88b8sRH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDkXtS7O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775147953; x=1806683953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qmfeRpmJ9X/50ADCokFRyOKJhfuKtYr3hKh0UhxfIAs=;
  b=gDkXtS7Oxi88o8SH9+5CVvd0xWHagE+//TlYEr184hveI7W3VkfKAJRW
   ES+8XZUyNl4K9JcX4HbHP65003aUgbn85AIZo9nURiCcg64EHi3MBOx10
   XA3oA5CfZ2vLxH35QDBSvqN9S66U5KQyy6bvIxypxR/NqqE+Gh8NGENls
   ESvKdFqt38rixjp2bDcVieJmhUvVncVRZ/S2aEqZi7BfQGXdLMsdWbk7l
   6b1eNHlA/ROMYxI++5z4kJx7YXa0V7R0FanuwK8lkTDmhXXjaoeTidK3k
   W13qwKV6pKgApfpwEkb1AWVpAJhvh3QCJYhv51VuVZPzv1w7qJZF5Q7n8
   g==;
X-CSE-ConnectionGUID: lJ25YfZrRbCYgIsyxjHaQw==
X-CSE-MsgGUID: kjKqhRzQRsiWxZ9lhUY1OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86514487"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="86514487"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:39:10 -0700
X-CSE-ConnectionGUID: 4g4QDT3CR2uhoJEb9Rmjgg==
X-CSE-MsgGUID: s6utDG8ETtGiodLyhQrlgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="227277792"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:39:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1B10011FBE3;
	Thu, 02 Apr 2026 19:39:17 +0300 (EEST)
Date: Thu, 2 Apr 2026 19:39:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lukas Larson <lukaslarson@gmail.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: Add upside-down sensor quirk for Dell
 16 Premium DA16250
Message-ID: <ac6btfUsok-Y0Dw2@kekkonen.localdomain>
References: <20260331190145.11592-1-lukaslarson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331190145.11592-1-lukaslarson@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57979-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: B211038C403
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lukas,

Thanks for the patch.

On Tue, Mar 31, 2026 at 09:01:43PM +0200, Lukas Larson wrote:
> On the Dell 16 Premium DA16250 laptop, the camera sensor (OVTI02C1) is
> mounted upside-down, resulting in a flipped image in userspace
> applications.
> 
> Add this model to the upside_down_sensor_dmi_ids list to provide the
> necessary 180-degree rotation quirk so the image is oriented correctly.

Could you try if these
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=pld> fix your
issue as well?

There are a bunch of Dell laptops with this sensor and only some of them
need this quirk...

> 
> Signed-off-by: Lukas Larson <lukaslarson@gmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 32cc95a766b7..ec2056c268de 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -104,6 +104,13 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>   * without reporting a rotation of 180° in neither the SSDB nor the _PLD.
>   */
>  static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 16 Premium DA16250"),
> +		},
> +		.driver_data = "OVTI02C1",
> +	},
>  	{
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),

-- 
Kind regards,

Sakari Ailus

