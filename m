Return-Path: <linux-media+bounces-62972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE99NiZ5GGqxkQgAu9opvQ
	(envelope-from <linux-media+bounces-62972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:19:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 753855F589E
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 710FD3113335
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 17:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0613F99ED;
	Thu, 28 May 2026 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2K+qOB/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188593E6DD4
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779987939; cv=none; b=dy9bolvjXdIrUzvnDOV4EjUdjZwYWBInnVWdMqG75THHAdhR7p65UYK1CcJEcTonLATaIVTg6/KFqvbZyf3nOuUwSd9E/BxqdkWVJvlGZKXJ8LGq6EA09Tt2yMkuduNNC+Fy1+N5DpU2MiwNTlKcOSMCXKYzV1veG8XYa86SvBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779987939; c=relaxed/simple;
	bh=59fvnQcXkMrQroUoZwuq0OrUz4f194nsV+K0sERQ0DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ze24w+fEyrqCSQAqUhFNr+zZlfK3Qa5ekyAagZWhsMwReYu73jGGZOUXIcOG99UvlqJFm5tmiF+hHesv7ynKrrQt010jPKaTy4U+9ZfKwKAKn2Fay+vAnkaTgLbmA7hhsaxOnlT55TjyM4ZcDPIxLhax0JwKi2N8Wh/2ht34eFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2K+qOB/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779987938; x=1811523938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=59fvnQcXkMrQroUoZwuq0OrUz4f194nsV+K0sERQ0DE=;
  b=f2K+qOB/tRKS2R/ejK8G07MakrmuSAmvDw0YfgbPimC3DyJGV30cCm7b
   WXNxiJrNpetKWyz172IcxHuSVcI5iz18WWX+/ISuTeAmasN+m7wQaLfBE
   EFmdvg4YkkWGGtjDvIP08b3IiWFfwirPwdZljPqPVGkiAyfQlB3G45Tp/
   lWw2u4ieoOBF4YtNfcE0pivSjfvN3SaAJdJ+e3NPJgaT/VxcpKdq5yOjB
   EYfLxc/d2WJViZ2GQZm8VenDZqo5b+qLS42E0yzctJH6DO1jTAGjur0QF
   rHJuisOdsXdlPCIkXxP7FKcs4s0QeLtz6sFl4CEI3UPgjQPUmV9aZ5kkS
   w==;
X-CSE-ConnectionGUID: AIz0ZLmVSkmbEctUAAvT4A==
X-CSE-MsgGUID: HZHQmx5uQZm/KXpOUGHAtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="106288127"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="106288127"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:05:37 -0700
X-CSE-ConnectionGUID: HLLB3FymQxKCMwcUIP0AvQ==
X-CSE-MsgGUID: tJX/VekMS62YMT2UagdxNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="272937951"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.75])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:05:35 -0700
Date: Thu, 28 May 2026 19:05:23 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com, 
	sakari.ailus@linux.intel.com, antti.laakso@linux.intel.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 1/3] media: i2c: cvs: Add driver of Intel Computer
 Vision Sensing Controller(CVS)
Message-ID: <ahh1YmWwCrqIAChN@mdjait-mobl>
References: <20260527170531.383871-1-miguel.vadillo@intel.com>
 <20260527170531.383871-2-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527170531.383871-2-miguel.vadillo@intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62972-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 753855F589E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

thank you for the patch

On Wed, May 27, 2026 at 10:05:29AM -0700, Miguel Vadillo wrote:
> Add driver for Intel Computer Vision Sensing (CVS) devices found on
> Intel Luna Lake (LNL), Panther Lake (PTL), and Arrow Lake (ARL)
> platforms.
> 
> The CVS device acts as a V4L2 sub-device bridge that manages CSI-2
> link ownership between the host (Linux) and firmware for camera
> sensors. It provides:
> 
> - Query the device status via sysfs interface
> - CSI-2 link ownership arbitration between host and CVS firmware
> - MIPI CSI-2 configuration management
> - Privacy LED control coordination
> - Power management integration with runtime PM
> 
> The driver consists of two main components:
>   core.c: Core driver with probe, command transport, and power management
>   v4l2.c: V4L2 sub-device and media framework integration
> 
> Hardware Interface:
> - I2C for command/control communication with device firmware
> - GPIO signals for ownership handshaking (request/response)
> - Optional reset and wake interrupt for full-capability variants
> - Integration with Intel IPU via ipu_bridge
> 
> The driver supports two hardware capability levels:
> - Light capability: Basic GPIO-based ownership (2 GPIOs)
> - Full capability: Enhanced with reset control and wake IRQ (4 GPIOs)
> 
> Device-specific quirks are handled via a quirk table to accommodate
> variations across different CVS implementations (Lattice, Synaptics).
> 
> In addition to I2C-based operation, the driver supports platform
> device instantiation for systems where CVS is exposed without I2C
> transport, falling back to GPIO-only ownership control.
> 
> The CVS driver integrates with the IPU bridge for automatic device
> discovery via ACPI on supported platforms.
> 
> PCI device IDs for Intel IPU7 (0x645d, shared by MTL and LNL) and
> IPU7.5 (0xb05d, shared by ARL and PTL) are included in the
> driver-local icvs_pci_tbl lookup table, enabling CVS to locate these
> IPU variants without modifying the shared ipu6-pci-table header.
> 
> A PM runtime device link is established between IPU (consumer) and CVS
> (supplier) so that the PM framework automatically resumes CVS before
> IPU begins streaming, triggering cvs_runtime_resume() to claim CSI-2
> link ownership. Ownership is released via cvs_runtime_suspend() after
> the autosuspend delay.
> 
> Signed-off-by: Miguel Vadillo <miguel.vadillo@intel.com>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 13 9350 + IPU7
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

