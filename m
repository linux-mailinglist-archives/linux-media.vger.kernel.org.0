Return-Path: <linux-media+bounces-49612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C5CCE539A
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 18:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA49C300EA32
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 17:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0193D1E1DFC;
	Sun, 28 Dec 2025 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C5bp05le"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95B521ABC9;
	Sun, 28 Dec 2025 17:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942460; cv=none; b=dn2RIwJ4/qMFPgQqnAFCSPiUVvSFENqV086mULdobwoXn6LZxXOAZhm2I6R5E+Zd29oeCS19HnATa6X6iAyfk+UtmXKQFmn325xR4DhBJAa7ElPbAuSefB6xaB2Sssw5hlhW1kC+Vdo7P5oLamMJOUun2mzdjg5Dp1SprHeOXfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942460; c=relaxed/simple;
	bh=8IZfX/yM3xs61YxmHkjylTOsB5Fl/bkvn4ebt/lCroM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVDmGuSrgb/fUkHOyPdaAs7GKncGSbmrN8OrO1YuSqp2KGrkvrrM3tqq/qqzRjBu1iH1Am/2MYoECFCMIRHptkVcwROUtOj+UDBMP9BAK8X/VPCpaZIpn2RuJUkaAZQCvF9DDKN+ed4j5A/o/2EaXPGAk+puagY/0dcTpC9o4oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C5bp05le; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7AC664BB;
	Sun, 28 Dec 2025 18:20:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766942440;
	bh=8IZfX/yM3xs61YxmHkjylTOsB5Fl/bkvn4ebt/lCroM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5bp05leXIiTJUZR8K//6YzpoDXz+kwzYI138W1Xm0izSh7+CEcIbym0QrxCUDZCd
	 OV02gUXyFYSu9PcVtkJk49SC7TdScXfkbl2h9KHLKX0z4CZVKrfEpoNJcWh5aqvGoB
	 p3HfFKWxzUVqg4Lp2spdo0tnsufEa9KTGfRFDj7k=
Date: Sun, 28 Dec 2025 19:20:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/15] media: mt9m114: Drop start-, stop-streaming
 sequence from initialize
Message-ID: <20251228172036.GP4094@pendragon.ideasonboard.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
 <20251224-mt9m114-atomisp-v4-13-60b25da7a1bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224-mt9m114-atomisp-v4-13-60b25da7a1bc@oss.qualcomm.com>

Hi Hans,

Thank you for the patch.

On Wed, Dec 24, 2025 at 01:31:22PM +0100, Hans de Goede wrote:
> Drop the start-, stop-streaming sequence from initialize.
> 
> When streaming is started with a runtime-suspended sensor,
> mt9m114_start_streaming() will runtime-resume the sensor which calls
> mt9m114_initialize() immediately followed by calling
> mt9m114_set_state(ENTER_CONFIG_CHANGE).
> 
> This results in the following state changes in quick succession:
> 
> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
> mt9m114_set_state(ENTER_SUSPEND)       -> transitions to SUSPENDED
> mt9m114_set_state(ENTER_CONFIG_CHANGE) -> transitions to STREAMING
> 
> these quick state changes confuses the CSI receiver on atomisp devices
> causing streaming to not work.
> 
> Drop the state changes from mt9m114_initialize() and move
> the mt9m114_initialize() call to mt9m114_start_streaming()
> so that only a single mt9m114_set_state(ENTER_CONFIG_CHANGE) call
> is made when streaming is started with a runtime-suspend sensor.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v4:
> - Move the mt9m114_initialize() call to mt9m114_start_streaming()
>   and drop the config_change_pending flag
> ---
>  drivers/media/i2c/mt9m114.c | 33 +++++++--------------------------
>  1 file changed, 7 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 447a5eb34a6137a8e87bd119401571b5592fc77d..41e98f719a23045293ee47d8980675510a142afa 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -789,14 +789,6 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_SUSPEND);
> -	if (ret < 0)
> -		return ret;
> -
>  	return 0;
>  }
>  
> @@ -967,6 +959,10 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
>  	if (ret)
>  		return ret;
>  
> +	ret = mt9m114_initialize(sensor);
> +	if (ret)
> +		goto error;
> +
>  	ret = mt9m114_configure_ifp(sensor, ifp_state);
>  	if (ret)
>  		goto error;
> @@ -2318,19 +2314,8 @@ static int __maybe_unused mt9m114_runtime_resume(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> -	int ret;
>  
> -	ret = mt9m114_power_on(sensor);
> -	if (ret)
> -		return ret;
> -
> -	ret = mt9m114_initialize(sensor);
> -	if (ret) {
> -		mt9m114_power_off(sensor);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return mt9m114_power_on(sensor);
>  }
>  
>  static int __maybe_unused mt9m114_runtime_suspend(struct device *dev)
> @@ -2562,8 +2547,8 @@ static int mt9m114_probe(struct i2c_client *client)
>  	/*
>  	 * Identify the sensor. The driver supports runtime PM, but needs to
>  	 * work when runtime PM is disabled in the kernel. To that end, power
> -	 * the sensor on manually here, and initialize it after identification
> -	 * to reach the same state as if resumed through runtime PM.
> +	 * the sensor on manually here and identify it to reach the same state

s/and identify it //

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	 * as if resumed through runtime PM.
>  	 */
>  	ret = mt9m114_power_on(sensor);
>  	if (ret < 0) {
> @@ -2575,10 +2560,6 @@ static int mt9m114_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto error_power_off;
>  
> -	ret = mt9m114_initialize(sensor);
> -	if (ret < 0)
> -		goto error_power_off;
> -
>  	/*
>  	 * Enable runtime PM with autosuspend. As the device has been powered
>  	 * manually, mark it as active, and increase the usage count without

-- 
Regards,

Laurent Pinchart

