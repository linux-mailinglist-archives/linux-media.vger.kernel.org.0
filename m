Return-Path: <linux-media+bounces-23356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE819F066C
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23648188A7D5
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 08:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C7A1AA1DF;
	Fri, 13 Dec 2024 08:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpXr62EW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B2199FB0;
	Fri, 13 Dec 2024 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734078938; cv=none; b=IDWvy9xH5+hK3Pxc6uA2R4IIC9Jr7RP6DGP6g6Fhi0pAq1qWqnK32pz4xjcDcZm5exjxt9bPIHEEcTb/qYlw63l8BTvotDRCv3Xt4IlSgYTdKXn66UyrSsE/mmurY298qKlp1mwSV6Mpm8bupnWFUa3gAlThh2HF06l91OiCciQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734078938; c=relaxed/simple;
	bh=FEp593OEL+hbOl7Yl40v/ukZ5nRmVeQpDnCwW2JZa8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWfORGVpkbrpUE5+nJyDs6bTdfoKP4yeRGZSKP/nNc0Q5fLlgZngjinEp0Nz3gxFWP08AJ2HVv3+Gm0lmSunFCaRuGetOT+bgxl1Z/zPc2AX/+eXm76HYw2zoS1a4dOCHTdKKKW8r/rYlXnEeTSB6J30eTkrU5P4He8PzS5RrvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpXr62EW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734078937; x=1765614937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FEp593OEL+hbOl7Yl40v/ukZ5nRmVeQpDnCwW2JZa8Y=;
  b=HpXr62EWeoMHjHaojq2JnwQOWGBPQF7o3JlRM+jNg2feeO9ouTDiD+UV
   LwvTnPCUm16FGJ2maTI+Dro745A7AT3d6I7t7N9EPgQZ8qKOfiXMTJ1Kh
   WOUvG4vfaZXUe2nVNpEBJSc96pnTY5fWlyrXLdZRiUGphA/EbjOVp/ZY+
   mHjGX75rLXtyIugHsu/W3FMz9VY8bSKD/g1A/bCBQOWKnxuY6UrPpSi3g
   A5ejJSzVeP5aGHnNN8Wb4N+FZyxNmdT2UIdYEaCBdG2FiPzm9wB/qWc0f
   i3jI6gPS6qk7K69eHeE3+kmStCI9eXFX0vHNWmIFe9jqE23FkyRX9kutv
   Q==;
X-CSE-ConnectionGUID: 5hgtqdF9Q9Wp1K7djhDm+A==
X-CSE-MsgGUID: iKIR7MpZT4WP5bAc2v9j/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45911172"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45911172"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 00:35:37 -0800
X-CSE-ConnectionGUID: XZ9W8LSqRf67whqRva1L9Q==
X-CSE-MsgGUID: RCIm71emScmr+21iDp6c5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96915000"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 00:35:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DB99312034A;
	Fri, 13 Dec 2024 10:35:31 +0200 (EET)
Date: Fri, 13 Dec 2024 08:35:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] v4l2: mc: fix endpoint iteration
Message-ID: <Z1vx00vYatRC6Rsc@kekkonen.localdomain>
References: <20241122145525.194253-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122145525.194253-1-demonsingur@gmail.com>

Hi Cosmin,

On Fri, Nov 22, 2024 at 04:55:24PM +0200, Cosmin Tanislav wrote:
> When creating links from a subdev to a sink, the current logic tries to
> iterate over the endpoints of dev's fwnode.
> 
> This might not be correct when the subdev uses a different fwnode
> compared to the dev's fwnode.
> 
> If, when registering, the subdev's fwnode is not set, the code inside
> v4l2_async_register_subdev will set it to the dev's fwnode.
> 
> To fix this, just use the subdev's fwnode.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Fixes: 0d3c81e82da9 ("media: v4l2-mc: add v4l2_create_fwnode_links helpers")

Nowadays Fixes: (almost) requires Cc: stable. I'll add that this time.

> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index 4bb91359e3a9a..937d358697e19 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -329,7 +329,7 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  	if (!(sink->flags & MEDIA_PAD_FL_SINK))
>  		return -EINVAL;
>  
> -	fwnode_graph_for_each_endpoint(dev_fwnode(src_sd->dev), endpoint) {
> +	fwnode_graph_for_each_endpoint(src_sd->fwnode, endpoint) {
>  		struct fwnode_handle *remote_ep;
>  		int src_idx, sink_idx, ret;
>  		struct media_pad *src;

-- 
Regards,

Sakari Ailus

