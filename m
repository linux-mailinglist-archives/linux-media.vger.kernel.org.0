Return-Path: <linux-media+bounces-52507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPfmGY/8imlyPAAAu9opvQ
	(envelope-from <linux-media+bounces-52507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:38:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107B118F7E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F8EB30804F5
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B32D341065;
	Tue, 10 Feb 2026 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQ3Ja7OD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776CB340D86;
	Tue, 10 Feb 2026 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716165; cv=none; b=UZEx5G+eDKB4PN9u/KD3zb8gmZOdzo0DT4e39GmHHDYljkTMT0AmHYQ/zB49dn1FsN19YmLd4eo8on30RN4kxWhas6JLFMDx3TmUevoCHDfa56QlFLZlvyY6pWImhkOqi+EOp46GpqGzDbfMonEZlCRrgy8GxN7KK1hxPvJyM60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716165; c=relaxed/simple;
	bh=HCAzEvcUUgphFumwRL+NNWNYLS5ZQFT4YzoX1lMd+mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S87+fVrdfUTlgPl/QiIGSn0C6UtuSPnLibl6LFToLcW7dM8gSCo2yo8YyFWXOhG3WJ7e/sU1ZWwTLnKROhLg9MYVkHeQvcR2Hwu/FI8OJ46VFAkCW/7OEX+O+tFKpR9MXifM2AYS/2EdzYp/3rVXr3NgzF0Y3HlWdXIG/0hg2ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQ3Ja7OD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770716164; x=1802252164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HCAzEvcUUgphFumwRL+NNWNYLS5ZQFT4YzoX1lMd+mo=;
  b=aQ3Ja7ODx6a5kyj1C3MGuCR+qrObobz8mVlWAksOm+47wKIUdPlL26qD
   BuIJnRr/WtFKaIQ3o0Qu16o41C7yWF9L6qQa2z5bQKyWlwEz/KGPjCbiB
   pRCPcFLnpx9ZMenx4gWh+h3bP9Y8ZOaJLNk3j73fAZtU5RhAieAqej17O
   oCwdOz5cQMupXwa8z1N7qESLUXfUnZSrlBwNyexNqNIh4XfO+vqB9D6lU
   OA+rROUHD1j+th3KezY7VzEkSXDMERWS9bZuGlID2dVgzEws477L4nP6L
   CegaGwE2cvYAWwIPXCRp5V+4M7nF1IZEZ6nw2jMLPkGf7drCq4M/ng9XI
   w==;
X-CSE-ConnectionGUID: 4yXVbzd5TEaM9q//Fdk9Vw==
X-CSE-MsgGUID: FNQDVYXsTvi+aOaTZl+kzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89425113"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89425113"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:36:04 -0800
X-CSE-ConnectionGUID: oyF5SJmPSse9dJ8FSr3COA==
X-CSE-MsgGUID: avay1qrHSWW2hb5Idp8Ozw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216399233"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.45])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:36:02 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 888B912033A;
	Tue, 10 Feb 2026 11:36:17 +0200 (EET)
Date: Tue, 10 Feb 2026 11:36:17 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Leif Skunberg <diamondback@cohunt.app>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: ipu-bridge: Add OV5675 sensor config
Message-ID: <aYr8EfzlN59-dNeV@kekkonen.localdomain>
References: <20260210085558.34140-1-diamondback@cohunt.app>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210085558.34140-1-diamondback@cohunt.app>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52507-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9107B118F7E
X-Rspamd-Action: no action

Hi Leif,

Thanks for the patch.

On Tue, Feb 10, 2026 at 09:55:58AM +0100, Leif Skunberg wrote:
> Add the Omnivision OV5675 (ACPI HID OVTI5675) to the
> ipu_supported_sensors[] table with a link frequency of 450 MHz.
> 
> This sensor is found in the Lenovo ThinkPad X1 Fold 16 Gen 1 behind
> an Intel Vision Sensing Controller (IVSC). Without this entry the IPU
> bridge does not create the software-node fwnode graph for the sensor,
> preventing the camera from being enumerated.
> 
> Signed-off-by: Leif Skunberg <diamondback@cohunt.app>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 4e579352a..aaad759dd 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -79,6 +79,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
>  	/* Omnivision OV02E10 */
>  	IPU_SENSOR_CONFIG("OVTI02E1", 1, 360000000),
> +	/* Omnivision OV5675 */
> +	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),

Could you order this alphabetically, please?

>  	/* Omnivision OV08A10 */
>  	IPU_SENSOR_CONFIG("OVTI08A1", 1, 500000000),
>  	/* Omnivision OV08x40 */

-- 
Kind regards,

Sakari Ailus

