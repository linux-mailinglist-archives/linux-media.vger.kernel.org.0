Return-Path: <linux-media+bounces-59013-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNfNF0Al4mnT2AAAu9opvQ
	(envelope-from <linux-media+bounces-59013-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:19:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E029141B2BD
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C314305FFC1
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2843815D3;
	Fri, 17 Apr 2026 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEVRKnA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF4E2765E2;
	Fri, 17 Apr 2026 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428240; cv=none; b=DF0VUEVbrLsp6TsTfmxTYMzLucl0V+geegY9ii2kAGSyJrWGmHzA1veA2RQixPdZsQhuBa96iAjruWYcNpsdWsOja6g6UtcVFsrMdHtYZJrCtTTniBRSL+IsiPbS8IuPtz0ZCLEignMzt0eNussAUeYUrxoMZs9KUQGADmNqipM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428240; c=relaxed/simple;
	bh=uWmlR1t2iiczGuV1IEyg0LPS03vBOy9Q7lm4B/fjozM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fd+if0NUeROllcqOp2yC8Dw9fS94hlKp52oZsUvkZakY2inQFLGgM43hIcDXsLcJxUMu30HfhJcMhOL3wkSynJH+WRXHtA2r/qC+jwYUTQ8MzFbfzgpScQOInxs9YDckGNSXKft2AbrWhEfNQ0603ELfyhbDArgv/dNIVaGJYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEVRKnA4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776428238; x=1807964238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uWmlR1t2iiczGuV1IEyg0LPS03vBOy9Q7lm4B/fjozM=;
  b=OEVRKnA4/nf22OzVNHk/v0ovarrHA49Azpp4qpj07GTU3UxwdkHM0hPI
   L7CrMnZeduuBL1mGpfyfr4FM7YxktRcLvMBNq2qZ7M7BQzPGBWxjQbgI6
   9Sq/xgu38jLNUP2q5aUrxpeQY8IAbiP296Nu6pkRriytvdNlv6m0hu4hh
   EwyqaDJ7Jnc0WNN6gk6V33jfqsHis5OZC299sk+n6dh3pbCOUvMf+Bi8l
   KjFjUEqhNQcdsNEnGHytQb3XWYfes0XXfDiYMUCySuZ9GHJ3L4RcaHB14
   F1R8f52WWnmk2wCFWaMgcJNeNBd6qqbV0t4f13my0bY2xBSGZxOiaxDeR
   Q==;
X-CSE-ConnectionGUID: 0fBG1CBiTiyXXIc6hf1xlA==
X-CSE-MsgGUID: uLm9ZlaETyeYqRsaZXTEcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77515101"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77515101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:17:17 -0700
X-CSE-ConnectionGUID: A0RfwFXBTc6tlLoqezujDg==
X-CSE-MsgGUID: dCKMxc7WQX2jK6Mr7DnXEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="235983067"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.170])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:17:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C7AAB120E0E;
	Fri, 17 Apr 2026 15:17:35 +0300 (EEST)
Date: Fri, 17 Apr 2026 15:17:35 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 2/5] media: lm3560: Add IN supply support
Message-ID: <aeIk3z8f4dvjEXBQ@kekkonen.localdomain>
References: <20260417114226.100033-1-clamor95@gmail.com>
 <20260417114226.100033-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417114226.100033-3-clamor95@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59013-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: E029141B2BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Svyatoslav,

On Fri, Apr 17, 2026 at 02:42:23PM +0300, Svyatoslav Ryhel wrote:
> Add IN supply (2.5V - 5.5V) found in LM3560 to ensure its proper work.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/i2c/lm3560.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> index e6af61415821..a2674af6c9fb 100644
> --- a/drivers/media/i2c/lm3560.c
> +++ b/drivers/media/i2c/lm3560.c
> @@ -16,6 +16,7 @@
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/videodev2.h>
>  #include <media/i2c/lm3560.h>
>  #include <media/v4l2-ctrls.h>
> @@ -434,6 +435,11 @@ static int lm3560_probe(struct i2c_client *client)
>  		return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
>  				     "failed to get hwen gpio\n");
>  
> +	rval = devm_regulator_get_enable(&client->dev, "vin");

I'd also enable this via runtime PM.

Sensor drivers such as imx219 serve as a good example here.

> +	if (rval)
> +		return dev_err_probe(&client->dev, rval,
> +				     "failed to enable regulator\n");
> +
>  	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
>  	if (rval < 0)
>  		return rval;

-- 
Kind regards,

Sakari Ailus

