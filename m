Return-Path: <linux-media+bounces-66960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cO0hKisRTmr5CQIAu9opvQ
	(envelope-from <linux-media+bounces-66960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:58:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D47723645
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:58:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MsDK+o92;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66960-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66960-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60528304C108
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 08:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955C8403B16;
	Wed,  8 Jul 2026 08:49:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BE74028DE;
	Wed,  8 Jul 2026 08:49:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500551; cv=none; b=qW+nzN9n6OUIcHp9BNk1zjAzTge0BmkRpKACWaraNoK356dV8DW7PGqvxF+DpRz5WeYUAp3tQCpcot0jTl8ADElv9HyJu/Ft0FdH0/LKimc6mnKji+YN1+QCstszd+9X2Kk9Hs2fq9JEmFCSBIgDRG1V/HwnrYbwnVb6Lf2A2As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500551; c=relaxed/simple;
	bh=TdHKk8AaGYqgwq6SzGFqzvp5pZtIrEsxkio7aA05sKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8iJz4XIjJZacdX0LbdK8fIRS8WPyWhyfxIxEhY8qVr0l9rlhae+0/ToU5wDCRz56L/jac4uOjz7CSlHevSkNp2IRBvUKFWiHqaCqPCx/ltyuycJI3UKpJwHotDz8eIrO89ZhCA/FsGJf0MNx3jeiWidFwRFjY/mF8JLJeBwHqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsDK+o92; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783500550; x=1815036550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TdHKk8AaGYqgwq6SzGFqzvp5pZtIrEsxkio7aA05sKg=;
  b=MsDK+o92jhWGy+/Pzs3/zUfosZQn9jKPLQVoVFxoeJrrngvTo3r0zHkU
   Db0Jko52OU8ESwjZj7oQIiqb9wMfDr+cBW2qbOO/+9VZejwvD4C5lN4yA
   dS9vFfX3e2FSAsiZgle7mcyIeKEkxGyukhc9pQEllRZC5FoAfUA5tfBrU
   SbF2v7/YzhRHh7XGoUFpto++P5+cTeCz4BPOKwzkQyBYi7pVHcqq3xe8A
   wMo54450YrKh5ndijuKNzFCUbV3N+KYJGjpzQ3ZD9xYNZXy1Dq+69afP2
   v7pesCqEeYNIvOs9DW5F2px36ongckFodqBCFsS3Qd628aNFPkVZeWXcP
   w==;
X-CSE-ConnectionGUID: b8Io8X4rQFKbEUoD+QnnVQ==
X-CSE-MsgGUID: Hzb2FoudR8y02fYDbOAEiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95314893"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95314893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:49:09 -0700
X-CSE-ConnectionGUID: +SDVyQZ9QhiIHEnyStgvsw==
X-CSE-MsgGUID: r7zk34rvQJ65YBgPFyUwkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258103415"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:49:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E0FDD11FB4A;
	Wed, 08 Jul 2026 11:49:07 +0300 (EEST)
Date: Wed, 8 Jul 2026 11:49:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: ov5640: Drop manual fwnode_handle_put()
 via scope-based cleanup
Message-ID: <ak4PAzSTC4yoV3Zy@kekkonen.localdomain>
References: <20260615223055.39953-1-birenpandya@gmail.com>
 <20260615223055.39953-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615223055.39953-2-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66960-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:mani@kernel.org,m:slongerbeam@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,raspberrypi.com,kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0D47723645

Hi Biren,

On Tue, Jun 16, 2026 at 04:00:53AM +0530, Biren Pandya wrote:
> Utilize the __free(fwnode_handle) scoped guard macro from <linux/cleanup.h> to automate the lifecycle management of the endpoint fwnode in ov5640_probe().
> 
> This eliminates the need for the manual fwnode_handle_put() call, preventing potential memory leaks in error paths and simplifying the probe routine.

Please wrap to 75 characters per line.

> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/i2c/ov5640.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index ce6b0724afa1..7795f2de0f75 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2014-2017 Mentor Graphics Inc.
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> @@ -3845,7 +3846,6 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
>  static int ov5640_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> -	struct fwnode_handle *endpoint;
>  	struct ov5640_dev *sensor;
>  	int ret;
>  
> @@ -3870,15 +3870,14 @@ static int ov5640_probe(struct i2c_client *client)
>  
>  	sensor->ae_target = 52;
>  
> -	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> -						  NULL);
> +	struct fwnode_handle *endpoint __free(fwnode_handle) =
> +		fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);

I'm fine with using __free() here.

>  	if (!endpoint) {
>  		dev_err(dev, "endpoint node not found\n");
>  		return -EINVAL;
>  	}

This check can be removed in the same patch. It's now redundant as
v4l2_fwnode_endpoint_parse() also does it.

>  
>  	ret = v4l2_fwnode_endpoint_parse(endpoint, &sensor->ep);
> -	fwnode_handle_put(endpoint);
>  	if (ret) {
>  		dev_err(dev, "Could not parse endpoint\n");
>  		return ret;

-- 
Regards,

Sakari Ailus

