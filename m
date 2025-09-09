Return-Path: <linux-media+bounces-42056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07452B4A136
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 07:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B063E4E6FF4
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 05:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968082EBBAD;
	Tue,  9 Sep 2025 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8Rr3gWW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289F51F63CD;
	Tue,  9 Sep 2025 05:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757395228; cv=none; b=aXvlo/dqkIasMfRB+xM8SkR3FjtzTj/dfr6oisC0y2LGZCHJFq4fgrwOkMBZMAAQ2RmohFtK2vjdZwumvGXa4ZGkHvgGgvllfqc1MP+LFlKE0vIRJGFl+xhOjITAO+FPoIvRKed3CklTO5xGwaVIwcH+k35bk4wsR6UAU4OrDVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757395228; c=relaxed/simple;
	bh=FgVYweKQjeosWEp0nTy0wAzvdTLwprY34zSw6dOuufo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQRIbKfLSn3ee7itqSM3nTv0oAsnZESz2M9Tn4C/tmnBD/jE7aHfagQeglx1P26HrybgQagEhuFEr2Bg9FBhteZhbHQP3X177TKCnW4WWp+HZ2cdLVG0HSNrQgymeKZ4QFctHiauutQ8E66JMcKXS6fpt/plTyKI1A7PHXPY5RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8Rr3gWW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757395227; x=1788931227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FgVYweKQjeosWEp0nTy0wAzvdTLwprY34zSw6dOuufo=;
  b=W8Rr3gWW2Q6QMyT6SqOxIfPz1FGuTQWSKhd/qKZJ6pZ0xLgH30+RHs3V
   Zaqncl0iHqu4UhpXsB4C7R+dTWJRwqPGxO7e+fpch44dJHB8/xmvDRUWp
   yO7bWRPREXGoBgwy5scH53i8TOX652jr2lG7V9wpSoBGMiv9FLpAIvplq
   5TOXYnV2W3Vq0CE2zfIomzgyDmq8pVkQz++mGSg59JGvzX6DD46++AzDF
   BOYvHgCEKRnYbTnGY0zPqXJvPN543dKc1MPrfjM8RAOECSks39y2XF2pM
   ZFxMWjxVytTj7ATW24/Ad90nh5x4orEqHr+ZzfgN73SLp7LysOaSB59O/
   A==;
X-CSE-ConnectionGUID: ggyaFNhxTgGw5yuUGaU69Q==
X-CSE-MsgGUID: PhOTitd4QLGUABOpZdRF2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59735669"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59735669"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 22:20:26 -0700
X-CSE-ConnectionGUID: wDey+M3hTs++QwOPkhtdYg==
X-CSE-MsgGUID: jVfXzrTEReeaSAX/M8pqYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="177285755"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.86])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 22:20:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7A83F11F818;
	Tue, 09 Sep 2025 08:20:21 +0300 (EEST)
Date: Tue, 9 Sep 2025 08:20:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com, hans@jjverkuil.nl,
	stable@vger.kernel.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: staging/ipu7: fix isys device runtime PM usage in
 firmware closing
Message-ID: <aL-5FY7-jL3k8rtd@kekkonen.localdomain>
References: <20250909032148.2019162-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909032148.2019162-1-bingbu.cao@intel.com>

Hi Bingbu,

On Tue, Sep 09, 2025 at 11:21:48AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> The PM usage counter of isys was bumped up when start camera stream
> (opening firmware) but it was not dropped after stream stop(closing
> firmware), it forbids system fail to suspend due to the wrong PM state
> of ISYS. This patch drop the PM usage counter in firmware close to fix
> it.
> 
> Cc: Stable@vger.kernel.org

Can you provide a Fixes: tag, too?

> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu7/ipu7-isys-video.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
> index 8756da3a8fb0..173afd405d9b 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-video.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
> @@ -946,6 +946,7 @@ void ipu7_isys_fw_close(struct ipu7_isys *isys)
>  		ipu7_fw_isys_close(isys);
>  
>  	mutex_unlock(&isys->mutex);
> +	pm_runtime_put(&isys->adev->auxdev.dev);
>  }
>  
>  int ipu7_isys_setup_video(struct ipu7_isys_video *av,

-- 
Kind regards,

Sakari Ailus

