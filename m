Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3114BCB845
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 12:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbfJDKbR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 06:31:17 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:50161 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725730AbfJDKbR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 06:31:17 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id GKrfiwHVajZ8vGKrjitP8k; Fri, 04 Oct 2019 12:31:15 +0200
Subject: Re: [PATCH v9 8/8] media: imx214: Add new control with
 V4L2_CID_UNIT_CELL_SIZE
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191001112421.2778-1-ribalda@kernel.org>
 <20191001112421.2778-9-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <98d3b559-8be0-a240-c94f-3171dd543009@xs4all.nl>
Date:   Fri, 4 Oct 2019 12:31:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001112421.2778-9-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMy/oL8/mlNdx7sRvyQ1IU0HZpBPMjSeYURwQwfB19Shv+jtdoHWFIxac+VpL+bM7ouH7AIQLe9HmNJudktFshuWeHrlD4eepVsMfgkWFvHq3dfV4gYw
 o68AdhF1ud81VSnbLZB63OC/MzuNgRqLNq61bD54jghpKbv9XkK+YmGPRAYPX1R93SkPrtrz4xX/XwdvD9Cfb1jUlpVvz8jC0h6j90Kb5sqdzw9vnqa3KxnM
 VDNuG/0uAr9K20Hv845ps6o7ZdUUMFhhV7J5LYH4dx5SBCv4ez9bxxmxQMKbyDR+WawqQ76ABfOoeCgy3/jYgg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/1/19 1:24 PM, Ricardo Ribalda Delgado wrote:
> According to the product brief, the unit cell size is 1120 nanometers^2.
> 
> https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/i2c/imx214.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 159a3a604f0e..adcaaa8c86d1 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -47,6 +47,7 @@ struct imx214 {
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *unit_size;
>  
>  	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
>  
> @@ -948,6 +949,10 @@ static int imx214_probe(struct i2c_client *client)
>  	static const s64 link_freq[] = {
>  		IMX214_DEFAULT_LINK_FREQ,
>  	};
> +	static const struct v4l2_area unit_size = {
> +		.width = 1120,
> +		.height = 1120,
> +	};
>  	int ret;
>  
>  	ret = imx214_parse_fwnode(dev);
> @@ -1029,6 +1034,10 @@ static int imx214_probe(struct i2c_client *client)
>  					     V4L2_CID_EXPOSURE,
>  					     0, 3184, 1, 0x0c70);
>  
> +	imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
> +				NULL,
> +				V4L2_CID_UNIT_CELL_SIZE,
> +				v4l2_ctrl_ptr_create((void *)&unit_size));

The imx214 supports two modes: 4096x2304 and 1920x1080. I assume that the
latter is using binning? So shouldn't the unit cell size be different in that
case?

I'm not so sure the unit cell size should depend on binning. I'd rather have
the binning information exposed somehow and let userspace do the calculation.

Regards,

	Hans

>  	ret = imx214->ctrls.error;
>  	if (ret) {
>  		dev_err(&client->dev, "%s control init failed (%d)\n",
> 

