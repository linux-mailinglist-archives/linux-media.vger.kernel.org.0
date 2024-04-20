Return-Path: <linux-media+bounces-9792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE78ABA2A
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953401C208A0
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 07:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA0513AC5;
	Sat, 20 Apr 2024 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UXi/TcBr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EEBF9DF
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713599612; cv=none; b=IkO38wLrjxDPm5mS+yr/0PTsgukCPXcysXrZArrJHj1DffWrzzj/hrQjmf6zaaM+xM1jrnmXGcvwoSVCu8YXUZXXCiOv/PpK6d81obtG2Dc3vGjoyZk9b2jCG09lDGaoBjhZnVlwF+oXJarQcTWpG4CQ1QJh8Lbg2eswhn6bV5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713599612; c=relaxed/simple;
	bh=a7qUCKj431NdgOz9nyW0PiuIVQRqmkKVmpZF0TIoSjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLaDO2yXX+ulFahpmRGbm+I/X4slotVM7F3W05d9MHXowcqhcDOkJTYyZ5Gr8ECDqFitw9IgqbPm9K/B/rZqQr3C4Mt+BKmRgk0OeakNwtndUegkSZCTRMZZCbSQCHk5yH+6I0zmJfn7xr67/nuEeHxoT5gPg8tekgSyb9e8Kws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UXi/TcBr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FD722BC;
	Sat, 20 Apr 2024 09:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713599558;
	bh=a7qUCKj431NdgOz9nyW0PiuIVQRqmkKVmpZF0TIoSjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXi/TcBrPQ6rxz/yOfx3a3pAzr3tVCdePzLkNriRwQDhVa2VVK75oZWDA8SWxdTqo
	 hoBOfQRmpd9woDPdka81OAaUErq6ZAiuXw2i8fLidHxqHJtY8GviZY88rGBa9wrxwL
	 w1JBun6KS3OitJcqPdLM1No9evgU7WD1mgZZFeno=
Date: Sat, 20 Apr 2024 10:53:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 19/46] media: ccs: Move ccs_pm_get_init function up
Message-ID: <20240420075319.GL6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-20-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-20-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:32:52PM +0300, Sakari Ailus wrote:
> Prepare for using ccs_pm_get_init from locations earlier than its the
> current place.
> 
> Also add a missing newline while at it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 73 ++++++++++++++++----------------
>  1 file changed, 37 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 7e5474e38732..d7bc9418eabb 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1718,6 +1718,43 @@ static int ccs_power_off(struct device *dev)
>   * Video stream management
>   */
>  
> +static int ccs_pm_get_init(struct ccs_sensor *sensor)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> +	int rval;
> +
> +	/*
> +	 * It can't use pm_runtime_resume_and_get() here, as the driver
> +	 * relies at the returned value to detect if the device was already
> +	 * active or not.
> +	 */
> +	rval = pm_runtime_get_sync(&client->dev);
> +	if (rval < 0)
> +		goto error;
> +
> +	/* Device was already active, so don't set controls */
> +	if (rval == 1 && !sensor->handler_setup_needed)
> +		return 0;
> +
> +	sensor->handler_setup_needed = false;
> +
> +	/* Restore V4L2 controls to the previously suspended device */
> +	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
> +	if (rval)
> +		goto error;
> +
> +	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> +	if (rval)
> +		goto error;
> +
> +	/* Keep PM runtime usage_count incremented on success */
> +	return 0;
> +
> +error:
> +	pm_runtime_put(&client->dev);
> +	return rval;
> +}
> +
>  static int ccs_start_streaming(struct ccs_sensor *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> @@ -1872,42 +1909,6 @@ static int ccs_stop_streaming(struct ccs_sensor *sensor)
>   * V4L2 subdev video operations
>   */
>  
> -static int ccs_pm_get_init(struct ccs_sensor *sensor)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> -	int rval;
> -
> -	/*
> -	 * It can't use pm_runtime_resume_and_get() here, as the driver
> -	 * relies at the returned value to detect if the device was already
> -	 * active or not.
> -	 */
> -	rval = pm_runtime_get_sync(&client->dev);
> -	if (rval < 0)
> -		goto error;
> -
> -	/* Device was already active, so don't set controls */
> -	if (rval == 1 && !sensor->handler_setup_needed)
> -		return 0;
> -
> -	sensor->handler_setup_needed = false;
> -
> -	/* Restore V4L2 controls to the previously suspended device */
> -	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
> -	if (rval)
> -		goto error;
> -
> -	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
> -	if (rval)
> -		goto error;
> -
> -	/* Keep PM runtime usage_count incremented on success */
> -	return 0;
> -error:
> -	pm_runtime_put(&client->dev);
> -	return rval;
> -}
> -
>  static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);

-- 
Regards,

Laurent Pinchart

