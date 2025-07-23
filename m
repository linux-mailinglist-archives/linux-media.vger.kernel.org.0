Return-Path: <linux-media+bounces-38284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A7EB0F767
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 17:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942761C8535F
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 15:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C41136658;
	Wed, 23 Jul 2025 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EfQk4w0e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5DB469D;
	Wed, 23 Jul 2025 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753285679; cv=none; b=fG/VPS/7v7EP79peBFTJqE2m+ZRtG5ctNzZpWYzBnBMj9aNGhEVUyqJV+hTqahlLpsX8LQpBJa1fFUZUlm6CI6FYApDvWU6MKeo3J2oi5wpXPKqkFzk9G9y2MAJAA/aBN9h/hVfR2r2Jm5Y2AciqtZ77vzJkxlG2vV+8CrcvOlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753285679; c=relaxed/simple;
	bh=B7uklZkk4HktiVAQXYK/Pza7TOFZKCpExs9amyGOK/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9kbQ2OraIQ8drmDbFuMl54K/cKFZRV+OpNcuUKjlTiBhnPVyqyyoVuW2BjeEzH3R+MphTOQ0PHCArtkBfLLEoew6HG9heMNPQYs8bgBpcosjUoQXf2pFww6Muou5dJwGwyW15ELp0XSGWK3asp8+AyMRIR2QpsnLrgdIw6PmMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EfQk4w0e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CA35CE92;
	Wed, 23 Jul 2025 17:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753285638;
	bh=B7uklZkk4HktiVAQXYK/Pza7TOFZKCpExs9amyGOK/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfQk4w0e2QVSUglYsV4uhnUu3dcnzJD+DbeygIrvYi6YlzbhrjeW2CGHSMgNt0HS1
	 cUVinhY5iX53l1OTxDvXyjhZtKx9O9l52qUjnRK2OR5d9c5YcJ3q2q1YCBli582gVZ
	 nbaBvJ0w1JMTl+rqGQqil9uBRW1+wWSGQKVWyPQY=
Date: Wed, 23 Jul 2025 18:47:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Allen Ballway <ballway@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov8865: move mode_configure out of state_configure
Message-ID: <20250723154753.GH6719@pendragon.ideasonboard.com>
References: <20250722-mode_configure-v1-1-5ea35052a01f@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722-mode_configure-v1-1-5ea35052a01f@chromium.org>

On Tue, Jul 22, 2025 at 01:35:43PM -0700, Allen Ballway wrote:
> ov8865_mode_configure() only needs to be called on sensor init, but it can
> be called multiple times from ov8865_state_configure(). Move
> ov8865_mode_configure() to ov8865_sensor_init().
> 
> Signed-off-by: Allen Ballway <ballway@chromium.org>
> ---
>  drivers/media/i2c/ov8865.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..1d1a1f261bf4ab5c09848402dc057e2f572504e7 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2304,14 +2304,6 @@ static int ov8865_state_configure(struct ov8865_sensor *sensor,
>  	if (sensor->state.streaming)
>  		return -EBUSY;
>  
> -	/* State will be configured at first power on otherwise. */
> -	if (pm_runtime_enabled(sensor->dev) &&
> -	    !pm_runtime_suspended(sensor->dev)) {
> -		ret = ov8865_mode_configure(sensor, mode, mbus_code);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	ret = ov8865_state_mipi_configure(sensor, mode, mbus_code);
>  	if (ret)
>  		return ret;
> @@ -2384,6 +2376,13 @@ static int ov8865_sensor_init(struct ov8865_sensor *sensor)
>  	}
>  
>  	/* Configure current mode. */
> +	ret = ov8865_mode_configure(sensor, sensor->state.mode,
> +				     sensor->state.mbus_code);

How about the implication on ov8865_set_fmt() that will not update the
link freq and pixel rate controls anymore ?

> +	if (ret) {
> +		dev_err(sensor->dev, "failed to configure mode\n");
> +		return ret;
> +	}
> +
>  	ret = ov8865_state_configure(sensor, sensor->state.mode,
>  				     sensor->state.mbus_code);
>  	if (ret) {
> 
> ---
> base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> change-id: 20250722-mode_configure-80105fbd835d

-- 
Regards,

Laurent Pinchart

