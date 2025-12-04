Return-Path: <linux-media+bounces-48218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF291CA32E6
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 11:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 529743046F8E
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 10:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873F7327BFD;
	Thu,  4 Dec 2025 10:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJiR4BEr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC5928468B;
	Thu,  4 Dec 2025 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843120; cv=none; b=OMgp5eo5wWOXFbiisfXAesQmgikvQ00xaJYpOYJ0RDpuCRXY8Bp7Nv6AbPC9rx9a4IuRIpaH2Js45B4Dp8QFyH0bROxdthiSOJ+So4JOLASszZpqadjWmxl63Szpliahu2TcRdAugg4P9O111knOfOpiL9HoYfOi47s0DmAFvNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843120; c=relaxed/simple;
	bh=eKjp/mzx4cZ8yNxkfIwsGXdNXXZjOIOZ9nxZ6DD/K+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idmejLNVMFG54RL1WcLYjjm/bck54UU2VCfAH6MZqSvRaI72avwKmWvdlh2ZCqARXmuiNfKsR9WCw1TXrZuccCUh+pMu+Ih0K9JT7AETR/PqAlK/TxyjzumKJw89h9/NEfx+i61tKtCfdw5snkbZoJvW2ukrgDAic+UKXuN4CxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJiR4BEr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764843118; x=1796379118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eKjp/mzx4cZ8yNxkfIwsGXdNXXZjOIOZ9nxZ6DD/K+A=;
  b=AJiR4BErJydnlRKtHJu71vE6dZpji6DBN3uTd68yfQAHJGWdKUj2NFIB
   XbogBYsNtsjd1siVSSLE5Pft3miAOuPR/T120O2xFXDpDRAc8Nxussms6
   mETS5fzVOWOhNfYQRU5U3amifKCD17Nzemo7/6rl4oX6/vhelAAMo3ps+
   WVhWuaHfJdKr28q8a5dFIbns2y8gakuZsYf9nNmcC0MioV1aU24PQWQvO
   kylpbE49f0ZgiSmSxQ5fSI8+LPIbxVRuPNJsI608mwhnQQti09VTgezY8
   7j91Uv7u+XUYI1C+o7xGcj7xotra+ix4Lcsq9LTp1GrYOOBIpsUSWcXll
   g==;
X-CSE-ConnectionGUID: I1Wi3pVQRWOgxrb0ra356g==
X-CSE-MsgGUID: XkQsMZzeRjyyMYbfwi9ssg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84459724"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="84459724"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 02:11:57 -0800
X-CSE-ConnectionGUID: ERRanO1DSL2TKbkIW6uSTQ==
X-CSE-MsgGUID: uqHTHuPiSHG4tYqinnndog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="194760687"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.199])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 02:11:55 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C5A36121DA4;
	Thu, 04 Dec 2025 12:11:59 +0200 (EET)
Date: Thu, 4 Dec 2025 12:11:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock
Message-ID: <aTFeb6RG1ER7dzX5@kekkonen.localdomain>
References: <20251201000026.690298-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201000026.690298-1-xiaolei.wang@windriver.com>

Hi Xiaolei,

On Mon, Dec 01, 2025 at 08:00:26AM +0800, Xiaolei Wang wrote:
> __v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range()
> contains an assertion to verify that the v4l2_ctrl_handler::lock
> is held, as it should only be called when the lock has already
> been acquired. Therefore use our own mutex for the ctrl lock,
> otherwise a warning will be  reported.
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/i2c/ov5647.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e193fef4fced..4e14eefba577 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1288,9 +1288,12 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>  	int hblank, exposure_max, exposure_def;
> +	struct v4l2_ctrl_handler *hdl = &sensor->ctrls;
>  
>  	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
>  
> +	hdl->lock = &sensor->lock;

You can use sensor->ctrls here; otherwise change the existing users first
(but that should go to a separate patch anyway).

> +
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
>  

-- 
Kind regards,

Sakari Ailus

