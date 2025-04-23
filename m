Return-Path: <linux-media+bounces-30865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A208DA997A0
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 20:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E24A74A2914
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465F928DEF0;
	Wed, 23 Apr 2025 18:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bo6+o6B7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132C022F747;
	Wed, 23 Apr 2025 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745432185; cv=none; b=I+4FwiqAhBZMPSQn5F0/MS8WUoHUbmBCa8nNzeNP/xabxQkIKL0s2ZEBeS1wEQMqYM69wMwcwVN639cDmQk8QkTTxAWymbDwleMP+YeRuNRMGG1wLA0RnXfJ4qxrPeK2smzmjAkh+LwBk9/JI5ZxURr1rHU71m1Uf6fwm8F3lWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745432185; c=relaxed/simple;
	bh=zT6WmWKq89q1ikbAI7gacqu8XDLXrdwAY8cZBziJHYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9fuUajc0Yfwqx3y5+f3P0OYQ8Ityuta8c5qn0Jyw4DkLG9Fmqk/UUi1DWQ646ni/Khx11NtpQ7QABUsbiYU8mVXHKkTGPlGzPyDA+bGgECwbUoR9PZmcMIBVFa8xR6HBHR6jJxdtUBW6ZYyhuI/xRtupslip3T7+LFkneG0EDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bo6+o6B7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A3B41AE2;
	Wed, 23 Apr 2025 20:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745432181;
	bh=zT6WmWKq89q1ikbAI7gacqu8XDLXrdwAY8cZBziJHYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bo6+o6B7qpomUzgb6VyAyvahU/9AFhwyFixGWgT1xW/ydmBFGmedoD6yjc6K2QPDU
	 wWuSusjt7vFT24Hrx7BOZGlXgsd3yc8QNCU52gf4+o6tfKLFhf7omsKlkf1WcHmlZK
	 m4QE4XDAh6R9tYNSYMk7WNMwuCEPFtYuaqZkZNdo=
Date: Wed, 23 Apr 2025 21:16:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: mt9m114: Fix deadlock in
 get_frame_interval/set_frame_interval
Message-ID: <20250423181620.GD2675@pendragon.ideasonboard.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
 <20250307093140.370061-6-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307093140.370061-6-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patch.

On Fri, Mar 07, 2025 at 10:31:39AM +0100, Mathis Foerst wrote:
> Getting / Setting the frame interval using the V4L2 subdev pad ops
> get_frame_interval/set_frame_interval causes a deadlock, as the
> subdev state is locked in the [1] but also in the driver itself.
> 
> In [2] it's described that the caller is responsible to acquire and
> release the lock in this case. Therefore, acquiring the lock in the
> driver is wrong.
> 
> Remove the lock acquisitions/releases from mt9m114_ifp_get_frame_interval()
> and mt9m114_ifp_set_frame_interval().
> 
> [1] drivers/media/v4l2-core/v4l2-subdev.c - line 1129
> [2] Documentation/driver-api/media/v4l2-subdev.rst
> 
> Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
> Cc: stable@vger.kernel.org
> 

You can delete this blank line.

> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9m114.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 65b9124e464f..79c97ab19be9 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -1644,13 +1644,9 @@ static int mt9m114_ifp_get_frame_interval(struct v4l2_subdev *sd,
>  	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return -EINVAL;
>  
> -	mutex_lock(sensor->ifp.hdl.lock);
> -
>  	ival->numerator = 1;
>  	ival->denominator = sensor->ifp.frame_rate;
>  
> -	mutex_unlock(sensor->ifp.hdl.lock);
> -
>  	return 0;
>  }
>  
> @@ -1669,8 +1665,6 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
>  	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return -EINVAL;
>  
> -	mutex_lock(sensor->ifp.hdl.lock);
> -
>  	if (ival->numerator != 0 && ival->denominator != 0)
>  		sensor->ifp.frame_rate = min_t(unsigned int,
>  					       ival->denominator / ival->numerator,
> @@ -1684,8 +1678,6 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
>  	if (sensor->streaming)
>  		ret = mt9m114_set_frame_rate(sensor);
>  
> -	mutex_unlock(sensor->ifp.hdl.lock);
> -
>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart

