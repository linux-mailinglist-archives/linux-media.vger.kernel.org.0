Return-Path: <linux-media+bounces-22862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5D9E8E63
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04A211883FAA
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282AC21571C;
	Mon,  9 Dec 2024 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYGOTc/r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46151EB3D;
	Mon,  9 Dec 2024 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733735367; cv=none; b=tWU8B0/bZSEjGqtiGERtbnfMy7A7KGIAOuqEIMlncZEOIcE/gCP5xeQ4wsXojhLa7ted9J0JyAWLpq5+bzu7eK0A1mE2Vc1krvzG0VXPXPZLI4iNK58+HymRUfkQGc0AUuDhG6DP2Payq9sKxvX5YQKotUxPZd2PsQ5qesIO61Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733735367; c=relaxed/simple;
	bh=PADtzJGgC/4YXuf4zQuE1vc3aIAfhrkAvNSzaeymR/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmN7EH9vSdie8n8ShBuRVMmXhkPEaFU6ftJ8AYp3L06XE1e8yf/tTwYEr1f2Hj5vGBgxyr7Qdv6l8XNMaCn6COyx2Z4alvM4U/CBtXK/oQS0pZjMqfsu0YbzLtgxnb1wRdol3SaOu/jekeEVRoj5zdNKVVsjMzp1mo6WvWssFAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYGOTc/r; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733735366; x=1765271366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PADtzJGgC/4YXuf4zQuE1vc3aIAfhrkAvNSzaeymR/I=;
  b=CYGOTc/r55j3ws4rpGwl69nVXcopeG+tzr2JsWietSL50EvcZLAi6inH
   jR5vqzRtpopwyt6cGXNm1YsyIBhgvzSDDO1qrZAGjEIl7mRjwhJ65Tpzv
   CMDL3jk05iK0tmfUeRaL4hTs9CxboYsl+D5mNjjNONW0iL6WkgkT3o6st
   koHTwzcS8Uly1KfFw400SUS5oQoWyRNT5u0yPi3LvkQSGjFEHztVPIdDe
   1/tOJD0cftl/A25Mb4S2wdiIbx7RXg6uLt/A5nF10xf+x2yR9ZYEqcp5A
   D6lrhn2+qmFOPOCsZjLayL3nOk/US1lkS6KnUgGd4UqlPSQDlMd0/NrO9
   A==;
X-CSE-ConnectionGUID: k1LgylgdQQSyLBqOSfEpFA==
X-CSE-MsgGUID: jqm2phHATpuCMvfEfycXiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34168512"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34168512"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 01:09:19 -0800
X-CSE-ConnectionGUID: O8XP34UFSlq0e5uFDdu8Xg==
X-CSE-MsgGUID: aGz9ORMEQcqZVULmL2pnMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95095612"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 01:09:17 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9D81311F775;
	Mon,  9 Dec 2024 11:09:13 +0200 (EET)
Date: Mon, 9 Dec 2024 09:09:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 01/15] media: i2c: ds90ub9x3: Fix extra
 fwnode_handle_put()
Message-ID: <Z1azue3G14MQpfiI@kekkonen.localdomain>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <20241204-ub9xx-fixes-v3-1-a933c109b323@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-ub9xx-fixes-v3-1-a933c109b323@ideasonboard.com>

Huomenta,

On Wed, Dec 04, 2024 at 01:05:15PM +0200, Tomi Valkeinen wrote:
> The ub913 and ub953 drivers call fwnode_handle_put(priv->sd.fwnode) as
> part of their remove process, and if the driver is removed multiple
> times, eventually leads to put "overflow", possibly causing memory

This is, in fact, an extra put. It'll lead to underflow, not overflow.
I'd expect removing it once would be already too much.

> corruption or crash.
> 
> The fwnode_handle_put() is a leftover from commit 905f88ccebb1 ("media:
> i2c: ds90ub9x3: Fix sub-device matching"), which changed the code
> related to the sd.fwnode, but missed removing these fwnode_handle_put()
> calls.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: stable@vger.kernel.org
> Fixes: 905f88ccebb1 ("media: i2c: ds90ub9x3: Fix sub-device matching")
> ---
>  drivers/media/i2c/ds90ub913.c | 1 -
>  drivers/media/i2c/ds90ub953.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> index 8eed4a200fd8..b5375d736629 100644
> --- a/drivers/media/i2c/ds90ub913.c
> +++ b/drivers/media/i2c/ds90ub913.c
> @@ -793,7 +793,6 @@ static void ub913_subdev_uninit(struct ub913_data *priv)
>  	v4l2_async_unregister_subdev(&priv->sd);
>  	ub913_v4l2_nf_unregister(priv);
>  	v4l2_subdev_cleanup(&priv->sd);
> -	fwnode_handle_put(priv->sd.fwnode);
>  	media_entity_cleanup(&priv->sd.entity);
>  }
>  
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index 16f88db14981..10daecf6f457 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -1291,7 +1291,6 @@ static void ub953_subdev_uninit(struct ub953_data *priv)
>  	v4l2_async_unregister_subdev(&priv->sd);
>  	ub953_v4l2_notifier_unregister(priv);
>  	v4l2_subdev_cleanup(&priv->sd);
> -	fwnode_handle_put(priv->sd.fwnode);
>  	media_entity_cleanup(&priv->sd.entity);
>  }
>  
> 

-- 
Terveisin,

Sakari Ailus

