Return-Path: <linux-media+bounces-53276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM6/EhtknWksPQQAu9opvQ
	(envelope-from <linux-media+bounces-53276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:40:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B7183E33
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A48F30CC189
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BB7366DD5;
	Tue, 24 Feb 2026 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3ryJSM/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4401F30A9;
	Tue, 24 Feb 2026 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922358; cv=none; b=HP5ucPCiCPIiEQq1CwXG1w8DuTtvwChQYX6ypOvmu7EhQ786dXYGlRagUWu5E/EZtFwRPd8v+LD5QYoqtx/LMI2NOJ/7EZ31b0FK30IgZjVkcEwfNIchYvjATLB4+Wftq6BSnt5TdUZ91jyKMchzFwucOFi1L1fJkbhalSduVEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922358; c=relaxed/simple;
	bh=x+GGvXTcIoavmHdYFKAgVvUsCc4anDtQe4AZ1EeKxsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdCKc9NyZmQy8T9iGDTN/6cmc6RfPGu5j+HQgQfIvd/8TjQ/6UNOrjl0pu/qg3raMvTCgCdYUfQTkhxCjKi9PCClaX7vG4g+huy2C28o6JStQombLeZCQzDZ8tfO9iASTBet203Wme7xh8dlv4jf5PLiUxZiVko94zsWiUIKHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3ryJSM/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771922356; x=1803458356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x+GGvXTcIoavmHdYFKAgVvUsCc4anDtQe4AZ1EeKxsw=;
  b=H3ryJSM/t4laeCO0SKmSolRICesyUnNR1kpo+qdeDDJZ5S6EpFS2HUka
   ZEl08j+24E5zv3v27vF2dc3PaovOsRFguq4nwaGOv0ZFgb+xtEhajG/1d
   YJPVinOxe9VFY6FpA7bVrGo4UsPkGqJB6LxQUtmo3v97RMaHajRoZKupP
   cFgULOjsPLyTlZDFyI84P6TG8NOcsnfgnFfcKahH7SurCDnpuOpcchRE5
   h/xzzKTeBfhz2pWMBk4NcnPrpoG+3PmoNDUDosTeUsExb0i8isH7CdGMS
   hIabjknrdzda9ayyVLw61af8KbbcBybCONRCvsAKG9lcsahsXpOFu70n+
   w==;
X-CSE-ConnectionGUID: N97YhgqrRkS+goChAEEVrg==
X-CSE-MsgGUID: 2pnbqQcjTo23NGEIvkz3eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83552960"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="83552960"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:39:16 -0800
X-CSE-ConnectionGUID: IFpjVU2jSmq3nrz3l5V25g==
X-CSE-MsgGUID: ORM1kVjYQRyj9cEkX8jPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="246417030"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:39:14 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1B81D11F70F;
	Tue, 24 Feb 2026 10:39:39 +0200 (EET)
Date: Tue, 24 Feb 2026 10:39:39 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH] media: Documentation: Fix frame interval calculation for
 raw camera sensors
Message-ID: <aZ1jy6QIdNqYgDXa@kekkonen.localdomain>
References: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com>
 <aZwQJZX6sjzLgVL4@zed>
 <177191073323.14753.12002575507884033868@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177191073323.14753.12002575507884033868@freya>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53276-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: AC5B7183E33
X-Rspamd-Action: no action

Hi Jai,

On Tue, Feb 24, 2026 at 10:55:33AM +0530, Jai Luthra wrote:
> >         LLP = (analog_crop_width + HBLANK) / binning_timing_h
> >         FLL = (analog_crop_height + VBLANK) / binning_timing_v
> >         frame_interval = LLP * FLL / pixel_rate
> > 
> > I'm not 100% sure this is correct however, as the blankings should be
> > expressed on a different clock domain that the pixel sampling rate,
> > but I guess this is a reasonable approximation ?
> 
> What does these two extra controls really offer us?

The conclusion earlier on (well, maybe 10 years ago?) was that we should
have had these to begin with, and not to use the blanking values to control
the frame rate, largely because it requires a reference rectangle -- and
the current drivers use a wrong one, mostly because the API doesn't offer
the right one. The assumption back then was that everything would soon be
SMIA (or now CCS) compliant so this wouldn't matter much. But here we
are...

The VBLANK and HBLANK controls effectively also use the wrong reference
(output size) in most drivers and that can't really be changed meaningfully
without breaking things.

> 
> All sensors we have seen thus far map their LLP/FLL (or equivalent HTOT/VTOT)
> values with respect to the digital readout, and not the analogue pixel array.
> 
> If we add these two controls, we will have to support two different models for
> frame interval calculation in the application layer too. Which I'm fine with if
> it has a practical benefit, that is, it makes it easier to deal with some
> particular sensor.

There are three models, effectively:

1. CCS, where vblank and hblank are related to analogue crop rectangle, as in
   hardware;

2. Common raw sensor model, with LLP and FLL; and

3. the rest of the existing drivers (vblank and hblank relative to format
   on source pad).

In the case of frame length vs. blanking, I'd presume the difference in the
user space will be relatively small.

> 
> And if exposing the LLP/FLL directly offer the same benefit, then that is
> cleaner, as it leaves the HBLANK/VBLANK as-is in the new model.

-- 
Kind regards,

Sakari Ailus

