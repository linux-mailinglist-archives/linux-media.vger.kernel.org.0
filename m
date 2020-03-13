Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B91184721
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 13:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgCMMo4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 08:44:56 -0400
Received: from retiisi.org.uk ([95.216.213.190]:34186 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726652AbgCMMo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 08:44:56 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id F3C2F634C89;
        Fri, 13 Mar 2020 14:43:53 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jCjfO-0001it-7j; Fri, 13 Mar 2020 14:43:54 +0200
Date:   Fri, 13 Mar 2020 14:43:54 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [v2 3/3] media: ov8856: Implement sensor module revision
 identification
Message-ID: <20200313124354.GE5730@valkosipuli.retiisi.org.uk>
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-4-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313110350.10864-4-robert.foss@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Fri, Mar 13, 2020 at 12:03:50PM +0100, Robert Foss wrote:
> Query the sensor for its module revision, and compare it
> to known revisions.
> Currently only the '1B' revision has been added.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/media/i2c/ov8856.c | 54 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index db61eed223e8..39662d3d86dd 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -34,6 +34,18 @@
>  #define OV8856_MODE_STANDBY		0x00
>  #define OV8856_MODE_STREAMING		0x01
>  
> +/* define 1B module revision */
> +#define OV8856_1B_MODULE		0x02
> +
> +/* the OTP read-out buffer is at 0x7000 and 0xf is the offset
> + * of the byte in the OTP that means the module revision
> + */
> +#define OV8856_MODULE_REVISION		0x700f
> +#define OV8856_OTP_MODE_CTRL		0x3d84
> +#define OV8856_OTP_LOAD_CTRL		0x3d81
> +#define OV8856_OTP_MODE_AUTO		0x00
> +#define OV8856_OTP_LOAD_CTRL_ENABLE	BIT(0)
> +
>  /* vertical-timings from sensor */
>  #define OV8856_REG_VTS			0x380e
>  #define OV8856_VTS_MAX			0x7fff
> @@ -711,6 +723,25 @@ static int ov8856_test_pattern(struct ov8856 *ov8856, u32 pattern)
>  				OV8856_REG_VALUE_08BIT, pattern);
>  }
>  
> +static int ov8856_check_revision(struct ov8856 *ov8856)

There are no version checks being done here, nor apparently the version is
read by this function. 

> +{
> +	int ret;
> +
> +	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
> +			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
> +			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
> +	if (ret)
> +		return ret;
> +
> +	return ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
> +				OV8856_REG_VALUE_08BIT,
> +				OV8856_OTP_LOAD_CTRL_ENABLE);

If streaming is started to read the EEPROM, shouldn't it be stopped after
reading it as well?

> +}
> +
>  static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov8856 *ov8856 = container_of(ctrl->handler,
> @@ -1144,6 +1175,23 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
>  		return -ENXIO;
>  	}
>  
> +	/* check sensor hardware revision */
> +	ret = ov8856_check_revision(ov8856);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to check sensor revision");
> +		return ret;
> +	}
> +
> +	ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
> +			      OV8856_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;

How about moving this inside the check_revision function above? It looks as
if it's dependent on that.

> +
> +	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
> +		val,
> +		val == OV8856_1B_MODULE ? "1B" : "unknown revision",
> +		client->addr);
> +
>  	return 0;
>  }
>  
> @@ -1254,12 +1302,6 @@ static int ov8856_probe(struct i2c_client *client)
>  		return PTR_ERR(ov8856->xvclk);
>  	}
>  
> -	ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);

This seems like an unrelated change.

> -	if (ret < 0) {
> -		dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
> -		return ret;
> -	}
> -
>  	ov8856->reset_gpio = devm_gpiod_get(&client->dev, "reset",
>  					       GPIOD_OUT_HIGH);
>  	if (IS_ERR(ov8856->reset_gpio)) {

-- 
Regards,

Sakari Ailus
