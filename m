Return-Path: <linux-media+bounces-66052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id epB/CjqCQ2pcZgoAu9opvQ
	(envelope-from <linux-media+bounces-66052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:45:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BCD6E1C96
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:45:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="jC/tcYVu";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66052-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66052-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FDBC3012CEE
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 08:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF946326942;
	Tue, 30 Jun 2026 08:45:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD1038D
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 08:45:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809143; cv=none; b=NKuJqD2hcXuHsZjzR4UP0f4K9IgtxKH5kM3gSaPTPVTW7/Au3KvkS+h4gvDw24mEGYgyBIq7oOj6yZCyDUbSwIMEq84GKVhbVRH6BlOCGXS3ae04Gszb8HteA6oXfUTEjdOeCCFxhj03onyoehVtzN9//EWcfkQkzzJjCdOEaQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809143; c=relaxed/simple;
	bh=NQJoj4RXxGBKdLNsE+Y8Kcx6U+VnFMWLFNdYPbYDydo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpXhWxyNTL7vv1Lr41JnnAcOj2eBb3SoKI43EsIp4eyv2vi1e60NfnvpGEuRvA4hrRXeZthwem9F9c9cJ5Xq71e7O+7YmjQLnnYo+k22BOBa/ef6LyZkRdtgpM6lhN3GBMZgSa3GCmGQ63k9Rp2vfXqjVZT2U4410gMVMGdmxtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jC/tcYVu; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782809142; x=1814345142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NQJoj4RXxGBKdLNsE+Y8Kcx6U+VnFMWLFNdYPbYDydo=;
  b=jC/tcYVuBcoKYMVR//5a7RE12s6iTnOk5sTtR+Hqg41TaTZYquHX+Vyg
   Qzi6iBOxGrcYDgnFsq2HsTdC83B+gwBQMAnd22X/Tu8ZVw6yABMGJic79
   OmUIWD6JJdyujGXDzJ518tAYqefmxmSzaPjeIKBCSTQlUkzPnugygn17h
   E0YaRbBkM8uSA8ofeAfGJWscs1LrbAupGN2mkxeL5XtwoODhLUmUX5SIt
   2HB91KOLvM1sKziW7l6OuBRh35cmpbGQ8jMohP+SK7xROJvWQVRsj8O2v
   HB++Xf1fGGL7HNiy7soKaU1/foUl7+MqE3h8mXAn+haXracG02yzLLd8K
   A==;
X-CSE-ConnectionGUID: ZsPhLDZSQ0q2la0UMe9S7A==
X-CSE-MsgGUID: K/HUi3abSp6tgktu6nKgpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83542848"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83542848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:45:41 -0700
X-CSE-ConnectionGUID: qAUH+CnyT1GscJMT/NQ4+A==
X-CSE-MsgGUID: GQyXDih3TyKmDBF5SBBGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="254119815"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.116])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:45:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A504311FAA5;
	Tue, 30 Jun 2026 11:45:40 +0300 (EEST)
Date: Tue, 30 Jun 2026 11:45:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: Re: [PATCHv3 1/6] media: core: v4l2-async.c: unreg subdev if
 asc_list is empty
Message-ID: <akOCNKRVeRlebCI1@kekkonen.localdomain>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
 <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
 <akN3DglbD4LPxES1@kekkonen.localdomain>
 <3fc7cf62-c7eb-45c0-a961-af2e47f0b589@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fc7cf62-c7eb-45c0-a961-af2e47f0b589@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66052-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42BCD6E1C96

Hi Hans,

On the subject -- I'd write this as, to align with the existing practice:

media: v4l2-async: Unregister sub-device if asc_list is empty

On Tue, Jun 30, 2026 at 10:32:20AM +0200, Hans Verkuil wrote:
> On 6/30/26 09:58, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thanks for the patch.
> > 
> > On Mon, Jun 29, 2026 at 08:55:49AM +0200, Hans Verkuil wrote:
> >> In v4l2_device_unregister_subdev(), if sd->asc_list is empty,

s/device/async/

?

> >> then v4l2_device_unregister_subdev() is never called, but that
> >> should still happen.
> >>
> >> This causes crashes with em28xx that uses tvp5150: that i2c
> >> module uses v4l2_async, but em28xx does not as it predates
> >> v4l2_async.
> > 
> > Isn't the sub-device unregistered via v4l2_device_unregister() or do I miss
> > something? em28xx_v4l2_fini() calls it.
> > 
> > Or do you mean the issue happens at tvp5150 unbind time?
> 
> Yes, that's when it happens. The tvp5150 driver is removed, it calls
> v4l2_async_unregister_subdev(), but that never calls
> v4l2_device_unregister_subdev() since em28xx doesn't use v4l2-async
> and so sd->asc_list is empty.
> 
> This happens when unplugging the USB device.

Ack.

Could you add this to the commit message? It'd help understanding what
really goes on here. I'd also add a comment, see below.

> 
> > 
> >>
> >> So if sd->asc_list is empty, then just call
> >> v4l2_device_unregister_subdev().
> >>
> >> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> 
> It was introduced by commit 28a1295795d8, before that commit this was done correctly.
> 
> Regards,
> 
> 	Hans
> 
> >> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-async.c | 10 +++++++---
> >>  1 file changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> >> index 888a2e213b08..d7437c958028 100644
> >> --- a/drivers/media/v4l2-core/v4l2-async.c
> >> +++ b/drivers/media/v4l2-core/v4l2-async.c
> >> @@ -898,9 +898,13 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> >>  	sd->subdev_notifier = NULL;
> >>  
> >>  	if (sd->asc_list.next) {
> >> -		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
> >> -					 asc_subdev_entry) {
> >> -			v4l2_async_unbind_subdev_one(asc->notifier, asc);
> >> +		if (list_empty(&sd->asc_list)) {

How about:

			/*
			 * If the sub-device was registered through other means
			 * than v4l2-async, there are no async connections but
			 * the sub-device may still well be registered.
			 * Unregister it now.
			 */

> >> +			v4l2_device_unregister_subdev(sd);
> >> +		} else {
> >> +			list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
> >> +						 asc_subdev_entry) {
> >> +				v4l2_async_unbind_subdev_one(asc->notifier, asc);
> >> +			}

These braces are redundant.

> >>  		}
> >>  	}
> >>  
> > 
> 

-- 
Regards,

Sakari Ailus

