Return-Path: <linux-media+bounces-55045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGO7J8PMr2nWcAIAu9opvQ
	(envelope-from <linux-media+bounces-55045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:48:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 895FD2469D0
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75EC5302D18A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 07:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814913630AE;
	Tue, 10 Mar 2026 07:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbYFnJ0s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB83C2D;
	Tue, 10 Mar 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128892; cv=none; b=LT8reOim2aqySzMFvrPBN23inOHDjrVqHn8qYSnAylDXbh4y2nEhxlFUqN9yCtxj8DlQaxPoP94sKhCumt90LGpWO/hx4klccF0Tx6QQlISkwM2UJfiy0GyJAabS/msXr6KME9Wcb6cUnw3mCIFHfeCp+Y86gDBVf9VyRZpES4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128892; c=relaxed/simple;
	bh=fD6Hp7eCwYDUECBDlznXkD8PgSoscI5KzKajcaEClAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnFvUKl5npeSCqEj0ypZ3YYwspL2PK9KzMmRwipi+oN7MgaDFlxEvknFq0DGW0I2LVYDWCDnVBz56VWKuZjYNDO+isCbzpXd3Q8Dv9tv8XuYhrjYSi8dfwPXmmTCM7d+q/5QKKBb7FaTbAugZcnq16RhWt6W3gzes1hpwhthtrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BbYFnJ0s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773128891; x=1804664891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fD6Hp7eCwYDUECBDlznXkD8PgSoscI5KzKajcaEClAk=;
  b=BbYFnJ0sXXcFr/eshvtucMDyq8l790BKAetrXVLQC41IunSSXtDE3CfV
   zlmGpLiC6+6qJQZ33pooN6OPMhYAYySItSpdJLhb3oBxbVzJlxJWz0hwZ
   ZEyLX7nhtk5eml/Bw04D3xDLcatn9idQemFEhb+y5OW03c3EuK+Ght8pq
   b17R6CmIKWq9m7V4An1omhX+xrroEJFkdLNra5tHS+VX3oU8ufWUj7m8h
   yd7XnREpHjLmpwTdvM8EDicuQKpq56Ciz4etMFSzj9mSB98C1fwoImFpb
   9a45XXT0ro9NwLr0qeoMSzgNCdPTcqvfsdDaxgRvz1dcieZeR8ASsxYdT
   Q==;
X-CSE-ConnectionGUID: T/sGJjlSQLWlGo6nGz0LIw==
X-CSE-MsgGUID: fMzGH6LjRiWqJDq9k7CR9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84802879"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84802879"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 00:48:10 -0700
X-CSE-ConnectionGUID: g6iFfNbMStG3MR+Gl2Nd/Q==
X-CSE-MsgGUID: kYgmMaxbQn+u51djDoc9vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224974328"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 00:48:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8D9DA1206B6;
	Tue, 10 Mar 2026 09:48:38 +0200 (EET)
Date: Tue, 10 Mar 2026 09:48:38 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: ov8856: parse and register V4L2
 device tree properties
Message-ID: <aa_M1uWvBG3-gDkf@kekkonen.localdomain>
References: <20260310-ov8856-v4l2-props-v2-0-2717404ed045@pm.me>
 <20260310-ov8856-v4l2-props-v2-2-2717404ed045@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-ov8856-v4l2-props-v2-2-2717404ed045@pm.me>
X-Rspamd-Queue-Id: 895FD2469D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55045-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,pm.me:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

Hi Alexander,

On Tue, Mar 10, 2026 at 04:21:34AM +0000, Alexander Koskovich wrote:
> Parse V4L2 device tree properties and register controls for them.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/media/i2c/ov8856.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index e2998cfa0d18..9d7d16ba8911 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -1887,12 +1887,14 @@ static const struct v4l2_ctrl_ops ov8856_ctrl_ops = {
>  
>  static int ov8856_init_controls(struct ov8856 *ov8856)
>  {
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> +	struct v4l2_fwnode_device_properties props;
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
>  	s64 exposure_max, h_blank;
>  	int ret;
>  
>  	ctrl_hdlr = &ov8856->ctrl_handler;
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>  	if (ret)
>  		return ret;
>  
> @@ -1954,6 +1956,15 @@ static int ov8856_init_controls(struct ov8856 *ov8856)
>  	if (ctrl_hdlr->error)
>  		return ctrl_hdlr->error;
>  
> +	ret = v4l2_fwnode_device_parse(&client->dev, &props);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov8856_ctrl_ops,
> +					      &props);
> +	if (ret)
> +		return ret;
> +

It's not a bug introduced in this patch, but freeing the control handler on
error path was broken to begin with: it was never set to the sub-device on
error so the caller can't release it.

Could you fix that before this patch so we can get it backported?

I think it'd be cleanest to add a new label for freeing it and change all
existing returns to gotos.

>  	ov8856->sd.ctrl_handler = ctrl_hdlr;
>  
>  	return 0;
> 

-- 
Kind regards,

Sakari Ailus

