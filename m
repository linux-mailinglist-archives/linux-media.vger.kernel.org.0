Return-Path: <linux-media+bounces-4409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D02EC842469
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 13:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A63A1F27516
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 12:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A8F67E93;
	Tue, 30 Jan 2024 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i02tCRje"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF74E67751;
	Tue, 30 Jan 2024 12:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706616339; cv=none; b=fFH1nV26dL/N/rY/V1+KE/eIhfHtkOFlZth+T14c/6TCS/e46WJZu2nFNfOhESEkTCUxkDox7KedwmnGd9kAEy54CYfhoV5HI3IMFQ9EHN0OEo1w92gaVILfX61v4hsttoD7lIiZNJmAdzF00LItZ4IvPKwUAa8aeA1TB+Bb27s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706616339; c=relaxed/simple;
	bh=ex9KY77rxDKcjHheUhS4HUjdRk4aNjjhVrtSB6+j3Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTVtIvqpirp+rrqrRj7Stg8e6gQiqG25eR3hDVRO0YxsULEOXwgN6lfSokxqAAsP6eoN+8O6BImFUDafK6NBRkHCsUmR6/HVMR5aCDJOcd5D8tx1rKGnI2NwH3D82Tv5R55+pJvDCCqHRNcUSvfoJrdAzVqn5tFh8NwnZfFW70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i02tCRje; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706616338; x=1738152338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ex9KY77rxDKcjHheUhS4HUjdRk4aNjjhVrtSB6+j3Zw=;
  b=i02tCRje4aBfyvDT+VfI9meHzZIziCdszUJeigvTTJHAUl61eQuG/bvC
   hcArhcsBfH3KmPA3IensD9uLslj112u4bxigPmYtVUPaTD2sqXppEb57E
   l8Ndce2pQRpqZ61rpsmoTMGT31TImCb5Vii4oVKNqRrDR5lAcTcCnzCG0
   vOjjUzehcNt0hO/4piIOHRfXyCAcpVCFdbEy5EGxC6fXoa+UWT89Q7FTO
   zFLOSOL7a5tnKmAS+8GEqNG1/gXl2WRIWVyQG31V7gWzdCmHAmIImoVXI
   wRbYq+gDZ45Bta4/n0LCgvr5K9FGvJVZ25qH4JJK4g/IEJvPXJIJvnDQM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="3112736"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3112736"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 04:05:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="911423449"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="911423449"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 04:05:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5646411F8D2;
	Tue, 30 Jan 2024 14:05:33 +0200 (EET)
Date: Tue, 30 Jan 2024 12:05:33 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: v4l: async: Fix completion of chained subnotifiers
Message-ID: <ZbjmDTvI0PiUWvL_@kekkonen.localdomain>
References: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thanks for the patch.

On Mon, Jan 29, 2024 at 08:59:54PM +0100, Niklas Söderlund wrote:
> Allowing multiple connections between entities are very useful but the
> addition of this feature did not considerate nested subnotifiers.
> 
> Consider the scenario,
> 
> rcar-vin.ko     rcar-isp.ko     rcar-csi2.ko    max96712.ko
> 
> video0 ---->    v4l-subdev0 ->  v4l-subdev1 ->  v4l-subdev2
> video1 -´
> 
> Where each videoX or v4l-subdevX is controlled and register by a
> separate instance of the driver listed above it. And each driver
> instance registers a notifier (videoX) or a subnotifier (v4l-subdevX)
> trying to bind to the device pointed to.
> 
> If the devices probe in any other except where the vidoeX ones are
> probed last only one of them will have their complete callback called,
> the one who last registered its notifier. Both of them will however have
> their bind() callback called as expected.
> 
> This is due to v4l2_async_nf_try_complete() only walking the chain from
> the subnotifier to one root notifier and completing it while ignoring
> all other notifiers the subdevice might be part of. This works if there
> are only one subnotifier in the mix. For example if either v4l-subdev0
> or v4l-subdev1 was not part of the pipeline above.
> 
> This patch addresses the issue of nested subnotifiers by instead looking
> at all notifiers and try to complete all the ones that contain the
> subdevice which subnotifier was completed.

Why do you need this?

This is also not a bug, the documentation for the complete callback says:

 * @complete:	All connections have been bound successfully. The complete
 *		callback is only executed for the root notifier.

Rather it would be better to get rid of this callback entirely, one reason
being the impossibility of error handling. We won't be there for quite some
time but extending its scope does go to the other direction.

> 
> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 68 ++++++++++++++++++++--------
>  1 file changed, 49 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 3ec323bd528b..8b603527923c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -176,15 +176,16 @@ static LIST_HEAD(notifier_list);
>  static DEFINE_MUTEX(list_lock);
>  
>  static struct v4l2_async_connection *
> -v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> -		      struct v4l2_subdev *sd)
> +__v4l2_async_find_in_list(struct v4l2_async_notifier *notifier,
> +			  struct v4l2_subdev *sd,
> +			  struct list_head *list)
>  {
>  	bool (*match)(struct v4l2_async_notifier *notifier,
>  		      struct v4l2_subdev *sd,
>  		      struct v4l2_async_match_desc *match);
>  	struct v4l2_async_connection *asc;
>  
> -	list_for_each_entry(asc, &notifier->waiting_list, asc_entry) {
> +	list_for_each_entry(asc, list, asc_entry) {
>  		/* bus_type has been verified valid before */
>  		switch (asc->match.type) {
>  		case V4L2_ASYNC_MATCH_TYPE_I2C:
> @@ -207,6 +208,20 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  	return NULL;
>  }
>  
> +static struct v4l2_async_connection *
> +v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> +		      struct v4l2_subdev *sd)
> +{
> +	return __v4l2_async_find_in_list(notifier, sd, &notifier->waiting_list);
> +}
> +
> +static struct v4l2_async_connection *
> +v4l2_async_find_done(struct v4l2_async_notifier *notifier,
> +		     struct v4l2_subdev *sd)
> +{
> +	return __v4l2_async_find_in_list(notifier, sd, &notifier->done_list);
> +}
> +
>  /* Compare two async match descriptors for equivalence */
>  static bool v4l2_async_match_equal(struct v4l2_async_match_desc *match1,
>  				   struct v4l2_async_match_desc *match2)
> @@ -274,13 +289,14 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
>  }
>  
>  /*
> - * Complete the master notifier if possible. This is done when all async
> + * Complete the master notifiers if possible. This is done when all async
>   * sub-devices have been bound; v4l2_device is also available then.
>   */
>  static int
>  v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>  {
> -	struct v4l2_async_notifier *__notifier = notifier;
> +	struct v4l2_async_notifier *n;
> +	int ret;
>  
>  	/* Quick check whether there are still more sub-devices here. */
>  	if (!list_empty(&notifier->waiting_list))
> @@ -290,24 +306,38 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>  		dev_dbg(notifier_dev(notifier),
>  			"v4l2-async: trying to complete\n");
>  
> -	/* Check the entire notifier tree; find the root notifier first. */
> -	while (notifier->parent)
> -		notifier = notifier->parent;
> +	/*
> +	 * Notifiers without a parent are either a subnotifier that have not
> +	 * yet been associated with it is a root notifier or a root notifier
> +	 * itself. If it is a root notifier try to complete it.
> +	 */
> +	if (!notifier->parent) {
> +		/* This is root if it has v4l2_dev. */
> +		if (!notifier->v4l2_dev) {
> +			dev_dbg(notifier_dev(notifier),
> +				"v4l2-async: V4L2 device not available\n");
> +			return 0;
> +		}
>  
> -	/* This is root if it has v4l2_dev. */
> -	if (!notifier->v4l2_dev) {
> -		dev_dbg(notifier_dev(__notifier),
> -			"v4l2-async: V4L2 device not available\n");
> -		return 0;
> -	}
> +		/* Is everything ready? */
> +		if (!v4l2_async_nf_can_complete(notifier))
> +			return 0;
> +
> +		dev_dbg(notifier_dev(notifier), "v4l2-async: complete\n");
>  
> -	/* Is everything ready? */
> -	if (!v4l2_async_nf_can_complete(notifier))
> -		return 0;
> +		return v4l2_async_nf_call_complete(notifier);
> +	}
>  
> -	dev_dbg(notifier_dev(__notifier), "v4l2-async: complete\n");
> +	/* Try to complete all notifiers containing the subdevices. */
> +	list_for_each_entry(n, &notifier_list, notifier_entry) {
> +		if (v4l2_async_find_done(n, notifier->sd)) {
> +			ret = v4l2_async_nf_try_complete(n);
> +			if (ret)
> +				return ret;
> +		}
> +	}
>  
> -	return v4l2_async_nf_call_complete(notifier);
> +	return 0;
>  }
>  
>  static int

-- 
Regards,

Sakari Ailus

