Return-Path: <linux-media+bounces-66962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iqLxDPURTmocCgIAu9opvQ
	(envelope-from <linux-media+bounces-66962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 11:01:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A54723698
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 11:01:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=KPaqrDZg;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66962-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66962-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C07A3018C3E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 08:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B428E405C42;
	Wed,  8 Jul 2026 08:59:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8AB3FC5AE;
	Wed,  8 Jul 2026 08:59:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501159; cv=none; b=JRiUMBamOi43l3G5Rx6wcT7PJ2CgpCMuE/5WEK3wt/a7qfh2G3iH6ifU/DpccMXe0ybE2/J8SXuPV44VQcA43Tihrk6Bd3YtfHyMUB8t0wYCNOwOQqzwMVLQNkfcpLdCK8DR7N3UWkpUljO2nYZERI9UvSGgQDIyTBkc/YHC1qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501159; c=relaxed/simple;
	bh=KM+Dq5MdlBKswMZRY6QrPO7ntWvHafJji+lX5ABnLEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNHFjjCqH7CgNNPrqPq4Sq6STadUrfhIBFVE4gsivv+hkbKeUzr3uTt3K/FPw/rBNRgxSviqbryZZxbQAvXpp3pLtG7zvYVOVJ4SY2vmGQOmvciZTSVzm54eOqgfaGnraz+n5TXTQpJ4wEH86Jxg0oaVs8SdQH0qrHlmfA6SdGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPaqrDZg; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783501158; x=1815037158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KM+Dq5MdlBKswMZRY6QrPO7ntWvHafJji+lX5ABnLEQ=;
  b=KPaqrDZgKG83nctK7s5IBivorsXpvnOXB6GgqqMEeBf73TF9fd/BwLRP
   Y8iOgo8DZcmnr9J2g5grAcOZqHkCHmlqamLMlFfbz5mytnvfFP/JjclJK
   1mwUpeUA/1U7Vcl3kgErqml5QdP4KypISoFCSDGfqGFxEAjiiVROds/Go
   aJ6lDr6xXur5DiSry+/f9xWHvvbS0xPWbmV0x4kk+Tj2oo4dAbHtQddLa
   7Gc/EL9tqqDLRHImukNBd56G4itFKae++50xIkNibmMDAN+1kiRcInJAh
   bGBxf2X1ZVYUgMvPxNDC8SvAjTFbIaABieEBsdLyipykBOlPgmID8BRBk
   g==;
X-CSE-ConnectionGUID: rrVtOYteQWeVbSw4QtWsYQ==
X-CSE-MsgGUID: 6Q+bgOkCTgSnqehNmYP5BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83270193"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83270193"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:59:17 -0700
X-CSE-ConnectionGUID: zHskFotcRj+zsng4F+B3Zw==
X-CSE-MsgGUID: /9ZN1n25TSWSHaxf1umtzQ==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:59:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 19F4E11FB4A;
	Wed, 08 Jul 2026 11:59:17 +0300 (EEST)
Date: Wed, 8 Jul 2026 11:59:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov7740: Fix use-after-destroy in remove()
Message-ID: <ak4RZfYX3EPkGQHk@kekkonen.localdomain>
References: <20260615210412.34567-1-birenpandya@gmail.com>
 <20260615210412.34567-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615210412.34567-2-birenpandya@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66962-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,linux.intel.com:from_mime,kekkonen.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5A54723698

Hi Biren,

On Tue, Jun 16, 2026 at 02:34:11AM +0530, Biren Pandya wrote:
> The ov7740_remove() function had a severe teardown order bug where it
> destroyed the driver's mutex before freeing the V4L2 control handler
> which relies on that mutex, leading to a use-after-destroy kernel panic.
> Furthermore, the driver explicitly called v4l2_ctrl_handler_free() and
> mutex_destroy() sequentially, but then called ov7740_free_controls()
> which invokes both of them a second time, resulting in a double-free.
> 
> This patch fixes the issue by unregistering the subdevice first, and
> relying exclusively on ov7740_free_controls() to safely tear down the
> mutex and control handler in the correct order.
> 
> Fixes: 39c5c4471b8d ("media: i2c: Add the ov7740 image sensor driver")
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>

Can you add Cc: stable... for v2, please?

> ---
>  drivers/media/i2c/ov7740.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
> index 632fb80469be..62c124a1353a 100644
> --- a/drivers/media/i2c/ov7740.c
> +++ b/drivers/media/i2c/ov7740.c
> @@ -1116,10 +1116,8 @@ static void ov7740_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
>  
> -	mutex_destroy(&ov7740->mutex);
> -	v4l2_ctrl_handler_free(ov7740->subdev.ctrl_handler);
> -	media_entity_cleanup(&ov7740->subdev.entity);
>  	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&ov7740->subdev.entity);
>  	ov7740_free_controls(ov7740);
>  
>  	pm_runtime_get_sync(&client->dev);

-- 
Kind regards,

Sakari Ailus

