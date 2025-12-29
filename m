Return-Path: <linux-media+bounces-49650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 460B0CE7F52
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 19:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09440300EA1D
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 18:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0490332900;
	Mon, 29 Dec 2025 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blK9cXPg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67627B335;
	Mon, 29 Dec 2025 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767034518; cv=none; b=bvZ1Te0frFrMkFWrQpeg1csitOIr902wgF/0iju4qH5WGvb6tiTA9yxPx2heLGysHTrY2t803KC1OaXdqdkw1SrdVjs4JJ5WgnJSURgLsAYm3pU1X9prF/LoLUEreCtRnuBjC9Q+XKkKnEmjdYsiQ4PMwSrziFZCJPQecBfRHmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767034518; c=relaxed/simple;
	bh=+RQ+PEEx5EiVW+SfueM9IutFHk8/qNcISvQNvYLC1c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbEo7OZMvWU3MEWy0JL8LOZa+W3kJfbByaSkAH3EuzMR9p2YPhphqaMcP3b67L9k3Nhod0F5LdbZOqmxR8ZUFa177g+ksWiivSWrURWbfD6CtNgjtCRVuIZdBtnBi7R6FrwIOGtvLMwLmPj05FffYV/XzFcU8zvUqLA9sc/+Dgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blK9cXPg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767034515; x=1798570515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+RQ+PEEx5EiVW+SfueM9IutFHk8/qNcISvQNvYLC1c0=;
  b=blK9cXPgWTDaJU+odj/dbru0VmkOuv7OFzLwpc2qENyTPTgtNI7D1JwO
   qSgMOp6Y71gqRFUI6/lrLq/fAVtEBwgMrpPAo/29UttSDk68laT3YPzqq
   i1rwL1iCmLBI2oVgirEq8eMusf5Rkgain250DWSjl0sbvbrCEJ931zlz0
   0cUHY0zMwYfqXsIEhpJvE3X0znRL46hS2OC0UMLZy0AxycH2x3JUVpg57
   qdbnYSaNvzLNgO/kHTrNovdLAB/Rz750xQ5s5+RLlqSFrJe3tEqj/T8vP
   bfolT0kQemfNRicocrO+uHLngY3bHQr6hCl9Oo4Ib+qduvoaujmKWd+Ie
   g==;
X-CSE-ConnectionGUID: UJuZQfocTAqsrZHvrBTF5Q==
X-CSE-MsgGUID: pt/0U8tPSc6rGaiRL3cC1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86219829"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="86219829"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 10:55:14 -0800
X-CSE-ConnectionGUID: 4nIsS+gwShuhf9kSpl/GuA==
X-CSE-MsgGUID: +euSgNiaR8aS52+b/gOu3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="200979069"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.65])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 10:55:13 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0E035121D81;
	Mon, 29 Dec 2025 20:55:19 +0200 (EET)
Date: Mon, 29 Dec 2025 20:55:18 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
	jacopo@jmondi.org, mchehab@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: i2c: ov5647: Switch to using the
 sub-device state lock
Message-ID: <aVLOlkqSHn-N5Wi0@kekkonen.localdomain>
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-3-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229023018.2933405-3-xiaolei.wang@windriver.com>

Hi Xiaolei,

On Mon, Dec 29, 2025 at 10:30:17AM +0800, Xiaolei Wang wrote:
> Switch to using the sub-device state lock and properly call
> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
> remove().
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/i2c/ov5647.c | 40 +++++++++++++-------------------------
>  1 file changed, 14 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index fd69f1616794..f0ca8cc14794 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -91,7 +91,6 @@ struct ov5647 {
>  	struct v4l2_subdev		sd;
>  	struct regmap                   *regmap;
>  	struct media_pad		pad;
> -	struct mutex			lock;
>  	struct clk			*xclk;
>  	struct gpio_desc		*pwdn;
>  	bool				clock_ncont;
> @@ -652,7 +651,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>  	}
>  
>  	/* Apply customized values from user when stream starts. */
> -	ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
> +	ret =  v4l2_ctrl_handler_setup(sd->ctrl_handler);
>  	if (ret)
>  		return ret;
>  
> @@ -807,15 +806,12 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
>  static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	struct ov5647 *sensor = to_sensor(sd);
>  	int ret;
>  
> -	mutex_lock(&sensor->lock);

Note that you shouldn't remove mutex_lock() here quite yet -- s_stream()
callback won't involve sub-device state and thus the caller won't take the
state lock either. In other words, the end result is fine after the third
patch so you should explicitly lock the active state and remove that in the
third patch (see e.g. v4l2_subdev_lock_and_get_active_state() in
drivers/media/i2c/imx290.c).

> -
>  	if (enable) {
>  		ret = pm_runtime_resume_and_get(&client->dev);
>  		if (ret < 0)
> -			goto error_unlock;
> +			return ret;
>  
>  		ret = ov5647_stream_on(sd);
>  		if (ret < 0) {
> @@ -831,14 +827,10 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>  		pm_runtime_put(&client->dev);
>  	}
>  
> -	mutex_unlock(&sensor->lock);
> -
>  	return 0;
>  
>  error_pm:
>  	pm_runtime_put(&client->dev);
> -error_unlock:
> -	mutex_unlock(&sensor->lock);
>  
>  	return ret;
>  }

-- 
Kind regards,

Sakari Ailus

