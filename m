Return-Path: <linux-media+bounces-20323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A4D9B099D
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7861C1F218CF
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 16:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDB717622F;
	Fri, 25 Oct 2024 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nMc6sihV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377437082B;
	Fri, 25 Oct 2024 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729873029; cv=none; b=VHJtXMqmejBlUFg+FPJ90PMau4ThK+VXhbcOlGEkxgaIT6SfhOIXro5/gCMwF0k/BkrAexSojO1OQp87BxUMIrZD0LlW2qedInH4WunBZtEPeEea2iaPmlpAQhDOSi1YF1T1UmOCnzdgv3WaZ5xF8gerXnFFiKyL7MMfUf14+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729873029; c=relaxed/simple;
	bh=0L5xVhmjg5M5a4pa+/ZvHmwbAhngpCCSQCFhEC9nV7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4AsHvWQcQ1yZ4TzAWq58QUresSYfiz7zA31RAbCOq1NLrmZ5rSqNwjy88EwmGUI0VrutI2WEtCHT2fOmjyRJPzRAYNIvpRmy0SV4+WWTR1MyXL7ogmkA17Y2S77X5R0EghiivrMmzDKOPE9vZPDk0v8kZkL7NfmTQQ8qWLkq08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nMc6sihV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7235D74C;
	Fri, 25 Oct 2024 18:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729872916;
	bh=0L5xVhmjg5M5a4pa+/ZvHmwbAhngpCCSQCFhEC9nV7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMc6sihVKFveNBFTRA5eK1wFB1JwZO7N2zid3aUccMpVY8n3g4NhkStPx18psvpz6
	 1PWi6lahcOkwGbabubuxwP2lZ9BuC7kvyO62Eu6hzzXgdTYh+PyCjhq82SlkcszjTo
	 ar0gQtaxOYqX1ON/sv4+GghYlFybAyn7HzAbDP2U=
Date: Fri, 25 Oct 2024 19:16:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mt9p031: Refactor format handling for different
 sensor models
Message-ID: <20241025161659.GD6519@pendragon.ideasonboard.com>
References: <20241025130442.17417-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025130442.17417-1-tarang.raval@siliconsignals.io>

Hi Tarang,

Thank you for the patch.

On Fri, Oct 25, 2024 at 06:32:17PM +0530, Tarang Raval wrote:
> Add new structure 'mt9p031_model_info' to encapsulate format codes for
> the mt9p031 camera sensor family. This approach enhances code clarity
> and maintainability.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/mt9p031.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index d8735c246e52..d4fcc692311c 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -113,6 +113,16 @@
>  #define MT9P031_TEST_PATTERN_RED			0xa2
>  #define MT9P031_TEST_PATTERN_BLUE			0xa3
>  
> +struct mt9p031_model_info {
> +       u32 code;
> +};
> +
> +static const struct mt9p031_model_info mt9p031_models[] = {
> +	{.code = MEDIA_BUS_FMT_SGRBG12_1X12}, /* mt9p006  */

There should be spaces after { and before }

> +	{.code = MEDIA_BUS_FMT_SGRBG12_1X12}, /* mt9p031  */

You can use the same entry for both the MT9P006 and MT9P031 as they
don't need to be deferentiated.

> +	{.code = MEDIA_BUS_FMT_Y12_1X12},     /* mt9p031m */
> +};
> +
>  struct mt9p031 {
>  	struct v4l2_subdev subdev;
>  	struct media_pad pad;
> @@ -125,7 +135,7 @@ struct mt9p031 {
>  	struct clk *clk;
>  	struct regulator_bulk_data regulators[3];
>  
> -	u32 code;
> +	const struct mt9p031_model_info *model;
>  	struct aptina_pll pll;
>  	unsigned int clk_div;
>  	bool use_pll;
> @@ -708,7 +718,7 @@ static int mt9p031_init_state(struct v4l2_subdev *subdev,
>  	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
>  
>  	format = __mt9p031_get_pad_format(mt9p031, sd_state, 0, which);
> -	format->code = mt9p031->code;
> +	format->code = mt9p031->model->code;
>  	format->width = MT9P031_WINDOW_WIDTH_DEF;
>  	format->height = MT9P031_WINDOW_HEIGHT_DEF;
>  	format->field = V4L2_FIELD_NONE;
> @@ -1117,7 +1127,7 @@ static int mt9p031_probe(struct i2c_client *client)
>  	mt9p031->pdata = pdata;
>  	mt9p031->output_control	= MT9P031_OUTPUT_CONTROL_DEF;
>  	mt9p031->mode2 = MT9P031_READ_MODE_2_ROW_BLC;
> -	mt9p031->code = (uintptr_t)i2c_get_match_data(client);
> +	mt9p031->model = &mt9p031_models[(uintptr_t)i2c_get_match_data(client)];
>  
>  	mt9p031->regulators[0].supply = "vdd";
>  	mt9p031->regulators[1].supply = "vdd_io";
> @@ -1214,17 +1224,17 @@ static void mt9p031_remove(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id mt9p031_id[] = {
> -	{ "mt9p006", MEDIA_BUS_FMT_SGRBG12_1X12 },
> -	{ "mt9p031", MEDIA_BUS_FMT_SGRBG12_1X12 },
> -	{ "mt9p031m", MEDIA_BUS_FMT_Y12_1X12 },
> +	{ "mt9p006", 0 },
> +	{ "mt9p031", 1 },
> +	{ "mt9p031m", 2 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, mt9p031_id);

I think we can drop mt9p031_id. I'll send a patch series to do so.

>  
>  static const struct of_device_id mt9p031_of_match[] = {
> -	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> -	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> -	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
> +	{ .compatible = "aptina,mt9p006", .data = (void *)0 },
> +	{ .compatible = "aptina,mt9p031", .data = (void *)1 },
> +	{ .compatible = "aptina,mt9p031m", .data = (void *)2 },

Let's avoid magic values. You can write

	{ .compatible = "aptina,mt9p006", .data = &mt9p031_models[0] },
	{ .compatible = "aptina,mt9p031", .data = &mt9p031_models[0] },
	{ .compatible = "aptina,mt9p031m", .data = &mt9p031_models[1] },

but it may be even more readable to introduce a

enum mt9p031_model {
	MT9P031_MODEL_BAYER,
	MT9P031_MODEL_MONO,
};

static const struct mt9p031_model_info mt9p031_models[] = {
	[MT9P031_MODEL_BAYER] = {
		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
	},
	[MT9P031_MODEL_MONO] = {
		.code = MEDIA_BUS_FMT_Y12_1X12,
	},
};

static const struct of_device_id mt9p031_of_match[] = {
	{
		.compatible = "aptina,mt9p006",
		.data = &mt9p031_models[MT9P031_MODEL_BAYER],
	}, {
		.compatible = "aptina,mt9p031",
		.data = &mt9p031_models[MT9P031_MODEL_BAYER],
	}, {
		.compatible = "aptina,mt9p031m",
		.data = &mt9p031_models[MEDIA_BUS_FMT_Y12_1X12],
	},
	{ /* sentinel */ }
};

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mt9p031_of_match);

-- 
Regards,

Laurent Pinchart

