Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683A41C52E4
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbgEEKRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728622AbgEEKRd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:17:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827D6C061A0F
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 03:17:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jVudl-0006U8-R3; Tue, 05 May 2020 12:17:29 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jVudl-0000fG-DQ; Tue, 05 May 2020 12:17:29 +0200
Date:   Tue, 5 May 2020 12:17:29 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>
Subject: Re: [PATCH v7 3/3] media: ov8856: Implement sensor module revision
 identification
Message-ID: <20200505101729.GF18755@pengutronix.de>
References: <20200505100129.104673-1-robert.foss@linaro.org>
 <20200505100129.104673-4-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505100129.104673-4-robert.foss@linaro.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:16:56 up 73 days, 21:33, 142 users,  load average: 0.19, 1.60,
 15.64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On 20-05-05 12:01, Robert Foss wrote:
> Query the sensor for its module revision, and compare it
> to known revisions.
> 
> Currently 2A and 1B revision indentification is supported.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> - Changes since v3:
>   * Actually add module revision 2A
> 
> - Changes since v2:
>   * Add module revision 2A
>   * Sakari: Remove ov8856_check_revision()
>   * Sakari: Stop EEPROM streaming mode
> 
>  drivers/media/i2c/ov8856.c | 53 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index e6418a79801e..3c82c3e588d7 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -32,6 +32,19 @@
>  #define OV8856_MODE_STANDBY		0x00
>  #define OV8856_MODE_STREAMING		0x01
>  
> +/* module revisions */
> +#define OV8856_2A_MODULE		0x01
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
> @@ -1152,6 +1165,46 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
>  		return -ENXIO;
>  	}
>  
> +	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
> +			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
> +			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set otp mode");
> +		return ret;
> +	}
> +
> +	ret = ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
> +			       OV8856_REG_VALUE_08BIT,
> +			       OV8856_OTP_LOAD_CTRL_ENABLE);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to enable load control");
> +		return ret;
> +	}
> +
> +	ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
> +			      OV8856_REG_VALUE_08BIT, &val);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to read module revision");
> +		return ret;
> +	}
> +
> +	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
> +		val,
> +		val == OV8856_2A_MODULE ? "2A" :
> +		val == OV8856_1B_MODULE ? "1B" : "unknown revision",
> +		client->addr);

Pls check the alignment here too.

Regards,
  Marco

> +
> +	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
> +			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STANDBY);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to exit streaming mode");
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.25.1
