Return-Path: <linux-media+bounces-66048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E2WBGzJ3Q2qyYwoAu9opvQ
	(envelope-from <linux-media+bounces-66048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:58:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6696E177C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:58:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=kbYfARoA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66048-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66048-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4854301EB65
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 07:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6438A3DE45C;
	Tue, 30 Jun 2026 07:58:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B4D3E5A0A
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 07:58:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806288; cv=none; b=NZv3ZTASMM1PybBluKTm3yySBkUVxoJX53ASXI7bQRBcTzMAVmwxUDP8y6iT+4tb537XqAC2rqeoElcoWyoRuFCcpIGmzuxvVNi4Vdzu1zwrghdfcWEtycG5BQ4SbnLO14gfuX5QVuyrtUKerYLiKx1fjDF97QoDdy2e/Vy5Eu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806288; c=relaxed/simple;
	bh=q1PynG58t9h4o2HtbeoHkswViSz1UylYOiJy0jbbSMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjOLZ+lieqegAs1ePXkbmbupZxITVTZpsSBZksC9Xl3i/IASis4iRNVuSB0srcJhMmRKbCjNj74aZzNzvgOIi6nPTGSebt33RAL+5AxDxVoCqk6LnoTLjA2eMvkoyQaWuZGP1J62p+ydQt5EshPX8yO7XjZgIXEydG1i7pr0oec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbYfARoA; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782806287; x=1814342287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1PynG58t9h4o2HtbeoHkswViSz1UylYOiJy0jbbSMM=;
  b=kbYfARoAiXUixl173eaXZvGeqq1v//9d37UsnW/cJxFKGqXqeDXKcxXU
   t11euMUptVFgS6+7+eWp7DsHG3JlgVFS8aRTRZxYkactfTfKNOHKQN6vz
   aXwNA/9Cvd4ph/gCFlZ+epwKmPD8++bzckhaYShqDOFqe9VUZy4N2cIak
   if21nqhXgdG2jnHnBvH4WxQ2uFoLe3N3qPh08W0BzDxOkayBW4xQkhDDn
   yDbtSdv5tDdWnngVOoU15bLUj0fKEYb+KIEetKrayhl8Rk5GbbPDAmAL1
   ZLUsj8eqk1I1aFuh2SjS5x0RRccfFPMdeX+1FXMdYb43EsY6450odKoNy
   g==;
X-CSE-ConnectionGUID: T5EOJe2DTH6n/GGbsJ77xw==
X-CSE-MsgGUID: uWk+vmviRN6zTj98f3Lhyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82501257"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="82501257"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 00:58:06 -0700
X-CSE-ConnectionGUID: b+I+lHdSRnOVNyU3Rl5tzg==
X-CSE-MsgGUID: aZ54DkhRS0GuOSgqkHAOPQ==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.116])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 00:58:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1C35911FAA5;
	Tue, 30 Jun 2026 10:58:06 +0300 (EEST)
Date: Tue, 30 Jun 2026 10:58:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: Re: [PATCHv3 1/6] media: core: v4l2-async.c: unreg subdev if
 asc_list is empty
Message-ID: <akN3DglbD4LPxES1@kekkonen.localdomain>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
 <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66048-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D6696E177C

Hi Hans,

Thanks for the patch.

On Mon, Jun 29, 2026 at 08:55:49AM +0200, Hans Verkuil wrote:
> In v4l2_device_unregister_subdev(), if sd->asc_list is empty,
> then v4l2_device_unregister_subdev() is never called, but that
> should still happen.
> 
> This causes crashes with em28xx that uses tvp5150: that i2c
> module uses v4l2_async, but em28xx does not as it predates
> v4l2_async.

Isn't the sub-device unregistered via v4l2_device_unregister() or do I miss
something? em28xx_v4l2_fini() calls it.

Or do you mean the issue happens at tvp5150 unbind time?

> 
> So if sd->asc_list is empty, then just call
> v4l2_device_unregister_subdev().
> 
> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 888a2e213b08..d7437c958028 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -898,9 +898,13 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  	sd->subdev_notifier = NULL;
>  
>  	if (sd->asc_list.next) {
> -		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
> -					 asc_subdev_entry) {
> -			v4l2_async_unbind_subdev_one(asc->notifier, asc);
> +		if (list_empty(&sd->asc_list)) {
> +			v4l2_device_unregister_subdev(sd);
> +		} else {
> +			list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
> +						 asc_subdev_entry) {
> +				v4l2_async_unbind_subdev_one(asc->notifier, asc);
> +			}
>  		}
>  	}
>  

-- 
Kind regards,

Sakari Ailus

