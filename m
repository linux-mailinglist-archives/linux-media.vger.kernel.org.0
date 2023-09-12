Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD08C79B91B
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 02:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbjIKUtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235617AbjIKJHE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 05:07:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1E3CCC;
        Mon, 11 Sep 2023 02:07:00 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-67-213.net.vodafone.it [5.90.67.213])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A8759D5;
        Mon, 11 Sep 2023 11:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694423128;
        bh=utX+Op13Fe9EGAGC9XEG9IAkVjy7Od+HkcYT4kcMl38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LTsPbcDdmCSI9XiVoAlH7+KmnsTK6GK6VG5tlh6gTEV+WBlmPJe+/kVxH7y9HjpOf
         m4D04lbDLTYyuCOCSQk2wLicIRLWESPPdW+jM154YFL4enHMEiVHSDHK2WgkUveCtz
         XrnpPfJGFlqwpMedk97rYC0Jwa6JJqeU8RofD73M=
Date:   Mon, 11 Sep 2023 11:06:55 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.au@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] media: mt9p031: Extend match support for OF tables
Message-ID: <tlaikk73c5gc6y3bk6evuwtlizletaws7tuc5nk36hz2adkydp@duv2tjpqnios>
References: <20230910160126.70122-1-biju.das.jz@bp.renesas.com>
 <20230910160126.70122-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230910160126.70122-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju

On Sun, Sep 10, 2023 at 05:01:25PM +0100, Biju Das wrote:
> The driver has an OF match table, still, it uses an ID lookup table for
> retrieving match data. Currently, the driver is working on the
> assumption that an I2C device registered via OF will always match a
> legacy I2C device ID. The correct approach is to have an OF device ID
> table using i2c_get_match_data() if the devices are registered via OF/ID.
>
> Unify the OF/ID table by using MEDIA_BUS_FMT as match data for both these
> tables and replace the ID lookup table for the match data by
> i2c_get_match_data() and simplifly probe() and mt9p031_init_cfg()
>
> Drop mt9p031_init_cfg as there is no user.
>
> While at it, remove the trailing comma in the terminator entry for the OF
> table making code robust against (theoretical) misrebases or other similar
> things where the new entry goes _after_ the termination without the
> compiler noticing.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/i2c/mt9p031.c | 33 +++++++++++----------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 348f1e1098fb..540cb519915c 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -112,11 +112,6 @@
>  #define MT9P031_TEST_PATTERN_RED			0xa2
>  #define MT9P031_TEST_PATTERN_BLUE			0xa3
>
> -enum mt9p031_model {
> -	MT9P031_MODEL_COLOR,
> -	MT9P031_MODEL_MONOCHROME,
> -};
> -
>  struct mt9p031 {
>  	struct v4l2_subdev subdev;
>  	struct media_pad pad;
> @@ -129,7 +124,7 @@ struct mt9p031 {
>  	struct clk *clk;
>  	struct regulator_bulk_data regulators[3];
>
> -	enum mt9p031_model model;
> +	u32 code;
>  	struct aptina_pll pll;
>  	unsigned int clk_div;
>  	bool use_pll;
> @@ -714,12 +709,7 @@ static int mt9p031_init_cfg(struct v4l2_subdev *subdev,
>  	crop->height = MT9P031_WINDOW_HEIGHT_DEF;
>
>  	format = __mt9p031_get_pad_format(mt9p031, sd_state, 0, which);
> -
> -	if (mt9p031->model == MT9P031_MODEL_MONOCHROME)
> -		format->code = MEDIA_BUS_FMT_Y12_1X12;
> -	else
> -		format->code = MEDIA_BUS_FMT_SGRBG12_1X12;
> -
> +	format->code = mt9p031->code;
>  	format->width = MT9P031_WINDOW_WIDTH_DEF;
>  	format->height = MT9P031_WINDOW_HEIGHT_DEF;
>  	format->field = V4L2_FIELD_NONE;
> @@ -1104,7 +1094,6 @@ mt9p031_get_pdata(struct i2c_client *client)
>
>  static int mt9p031_probe(struct i2c_client *client)
>  {
> -	const struct i2c_device_id *did = i2c_client_get_device_id(client);
>  	struct mt9p031_platform_data *pdata = mt9p031_get_pdata(client);
>  	struct i2c_adapter *adapter = client->adapter;
>  	struct mt9p031 *mt9p031;
> @@ -1129,7 +1118,7 @@ static int mt9p031_probe(struct i2c_client *client)
>  	mt9p031->pdata = pdata;
>  	mt9p031->output_control	= MT9P031_OUTPUT_CONTROL_DEF;
>  	mt9p031->mode2 = MT9P031_READ_MODE_2_ROW_BLC;
> -	mt9p031->model = did->driver_data;
> +	mt9p031->code = (uintptr_t)i2c_get_match_data(client);
>
>  	mt9p031->regulators[0].supply = "vdd";
>  	mt9p031->regulators[1].supply = "vdd_io";
> @@ -1226,19 +1215,19 @@ static void mt9p031_remove(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id mt9p031_id[] = {
> -	{ "mt9p006", MT9P031_MODEL_COLOR },
> -	{ "mt9p031", MT9P031_MODEL_COLOR },
> -	{ "mt9p031m", MT9P031_MODEL_MONOCHROME },
> -	{ }
> +	{ "mt9p006", MEDIA_BUS_FMT_SGRBG12_1X12 },
> +	{ "mt9p031", MEDIA_BUS_FMT_SGRBG12_1X12 },
> +	{ "mt9p031m", MEDIA_BUS_FMT_Y12_1X12 },
> +	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, mt9p031_id);
>
>  #if IS_ENABLED(CONFIG_OF)
>  static const struct of_device_id mt9p031_of_match[] = {
> -	{ .compatible = "aptina,mt9p006", },
> -	{ .compatible = "aptina,mt9p031", },
> -	{ .compatible = "aptina,mt9p031m", },
> -	{ /* sentinel */ },
> +	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> +	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> +	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
> +	{ /* sentinel */ }

I know it might sound not necessary, but isn't it better to wrap the
format in some sort of per-model structure. It would avoid a few type
casts too. Up to you thouhg

>  };
>  MODULE_DEVICE_TABLE(of, mt9p031_of_match);
>  #endif
> --
> 2.25.1
>
