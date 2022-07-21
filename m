Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86D357C814
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 11:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbiGUJul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 05:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbiGUJuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 05:50:35 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FF448CB3
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397034; x=1689933034;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=99xM4XdyPjJZyzRmzWi7U57Umd6xBNxCj/RGGEI7Xmk=;
  b=H1IUfQ3JA5jTMJJTyvecduFKhB4+0YlVhWzurxVx9bfG6Vhl+qSYj+RP
   ldSVH8rLblE8zF5HSUa+EMqT3f4i7I4ZfnJ4C1mg7fKxe+5LDtYRLm6Cb
   s/w33QPWWh/fnk63qQ/EqhBa+S1xQ/zZj8DEnDVmdUVp1xzbWskvXlwpl
   Yha9CoxdN2P7C3M+qLKEaQsVcm2B+c7g3D76M7QvoZ9VX81WmHkoM7dtE
   YtxkLC5OXTfmxtOlwjVjGe2+C/d2IGz5z89ntyEU3FJD0owldR1gUVae/
   m5j80YsY9aQ+hSgO66zsxXzpuBEi3AF8wB+Cs07XJSwBhLkXOXimQ7mYT
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25180593"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 11:50:32 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 11:50:32 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 11:50:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397032; x=1689933032;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=99xM4XdyPjJZyzRmzWi7U57Umd6xBNxCj/RGGEI7Xmk=;
  b=W/ClTUOP8Adnh/K9viG/25DMoQ16Hwaq4TsP0msEn8CbSaa2k69varCy
   seT4aUZs6J7HjeN9ZleLnNYw2aCB8n3AcH+XTfzIF9qadKCR6Osu6ML6x
   4pnZmbT4PxnHpcNIi7nt4khvWdbKDQgwQ2pcGa/N0nhqLcuvud/QLlseN
   X3R9yfpshDDYD9iF1Za1LtEcuS+SWlegBQ3wV91zVYEH2UmUlfsBmQrWF
   ol4s/E6k8RbMtSQog0FOYL7fAil58QqxpoEDMdif9TTLpEiVOG2aucTsg
   LRv3iy9S+P2vUFiqubRw+owFfS/AKql/Yzp5fmEvNhkFwGkI2bzJhV/1A
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25180592"
Subject: Re: [PATCH 09/19] media: i2c: imx290: Simplify error handling when writing
 registers
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 11:50:32 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0E731280056;
        Thu, 21 Jul 2022 11:50:32 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 11:50:31 +0200
Message-ID: <7343048.MhkbZ0Pkbq@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-10-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-10-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 21. Juli 2022, 10:35:30 CEST schrieb Laurent Pinchart:
> Error handling for register writes requires checking the error status of
> every single write. This makes the code complex, or incorrect when the
> checks are omitted. Simplify this by passing a pointer to an error code
> to the imx290_write_reg() function, which allows writing multiple
> registers in a row and only checking for errors at the end.
> 
> While at it, rename imx290_write_reg() to imx290_write() as there's
> nothing else than registers to write, and rename imx290_read_reg()
> accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 86 ++++++++++++++------------------------
>  1 file changed, 32 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 3f67c4d2417f..5b7f9027b50f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -367,7 +367,7 @@ static inline struct imx290 *to_imx290(struct
> v4l2_subdev *_sd) return container_of(_sd, struct imx290, sd);
>  }
> 
> -static int __always_unused imx290_read_reg(struct imx290 *imx290, u32 addr,
> u32 *value) +static int __always_unused imx290_read(struct imx290 *imx290,
> u32 addr, u32 *value) {
>  	u8 data[3] = { 0, 0, 0 };
>  	int ret;
> @@ -385,17 +385,23 @@ static int __always_unused imx290_read_reg(struct
> imx290 *imx290, u32 addr, u32 return 0;
>  }
> 
> -static int imx290_write_reg(struct imx290 *imx290, u32 addr, u32 value)
> +static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int
> *err) {
>  	u8 data[3] = { value & 0xff, (value >> 8) & 0xff, value >> 16 };
>  	int ret;
> 
> +	if (err && *err)
> +		return *err;
> +
>  	ret = regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
>  			       data, (addr >> IMX290_REG_SIZE_SHIFT) 
& 3);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: 
%d\n",
>  			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
>  			 addr & IMX290_REG_ADDR_MASK, ret);
> +		if (err)
> +			*err = ret;
> +	}
> 
>  	return ret;
>  }
> @@ -408,7 +414,7 @@ static int imx290_set_register_array(struct imx290
> *imx290, int ret;
> 
>  	for (i = 0; i < num_settings; ++i, ++settings) {
> -		ret = imx290_write_reg(imx290, settings->reg, settings-
>val);
> +		ret = imx290_write(imx290, settings->reg, settings->val, 
NULL);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -419,29 +425,16 @@ static int imx290_set_register_array(struct imx290
> *imx290, return 0;
>  }
> 
> -static int imx290_set_gain(struct imx290 *imx290, u32 value)
> -{
> -	int ret;
> -
> -	ret = imx290_write_reg(imx290, IMX290_GAIN, value);
> -	if (ret)
> -		dev_err(imx290->dev, "Unable to write gain\n");
> -
> -	return ret;
> -}
> -
>  /* Stop streaming */
>  static int imx290_stop_streaming(struct imx290 *imx290)
>  {
> -	int ret;
> +	int ret = 0;
> 
> -	ret = imx290_write_reg(imx290, IMX290_STANDBY, 0x01);
> -	if (ret < 0)
> -		return ret;
> +	imx290_write(imx290, IMX290_STANDBY, 0x01, &ret);
> 
>  	msleep(30);
> 
> -	return imx290_write_reg(imx290, IMX290_XMSTA, 0x01);
> +	return imx290_write(imx290, IMX290_XMSTA, 0x01, &ret);
>  }
> 
>  static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> @@ -456,25 +449,25 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> 
>  	switch (ctrl->id) {
>  	case V4L2_CID_GAIN:
> -		ret = imx290_set_gain(imx290, ctrl->val);
> +		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, 
NULL);
>  		break;
>  	case V4L2_CID_TEST_PATTERN:
>  		if (ctrl->val) {
> -			imx290_write_reg(imx290, IMX290_BLKLEVEL, 0);
> +			imx290_write(imx290, IMX290_BLKLEVEL, 0, 
&ret);
>  			usleep_range(10000, 11000);
> -			imx290_write_reg(imx290, IMX290_PGCTRL,
> -					 (u8)
(IMX290_PGCTRL_REGEN |
> -					 IMX290_PGCTRL_THRU |
> -					 
IMX290_PGCTRL_MODE(ctrl->val)));
> +			imx290_write(imx290, IMX290_PGCTRL,
> +				     (u8)(IMX290_PGCTRL_REGEN |
> +				     IMX290_PGCTRL_THRU |
> +				     IMX290_PGCTRL_MODE(ctrl-
>val)), &ret);
>  		} else {
> -			imx290_write_reg(imx290, IMX290_PGCTRL, 
0x00);
> +			imx290_write(imx290, IMX290_PGCTRL, 0x00, 
&ret);
>  			usleep_range(10000, 11000);
>  			if (imx290->bpp == 10)
> -				imx290_write_reg(imx290, 
IMX290_BLKLEVEL,
> -						 0x3c);
> +				imx290_write(imx290, 
IMX290_BLKLEVEL, 0x3c,
> +					     &ret);
>  			else /* 12 bits per pixel */
> -				imx290_write_reg(imx290, 
IMX290_BLKLEVEL,
> -						 0xf0);
> +				imx290_write(imx290, 
IMX290_BLKLEVEL, 0xf0,
> +					     &ret);
>  		}
>  		break;
>  	default:
> @@ -695,7 +688,8 @@ static int imx290_start_streaming(struct imx290 *imx290)
> return ret;
>  	}
> 
> -	ret = imx290_write_reg(imx290, IMX290_HMAX, imx290->current_mode-
>hmax);
> +	ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
> +			   NULL);
>  	if (ret)
>  		return ret;
> 
> @@ -706,14 +700,12 @@ static int imx290_start_streaming(struct imx290
> *imx290) return ret;
>  	}
> 
> -	ret = imx290_write_reg(imx290, IMX290_STANDBY, 0x00);
> -	if (ret < 0)
> -		return ret;
> +	imx290_write(imx290, IMX290_STANDBY, 0x00, &ret);
> 
>  	msleep(30);

Well you introduce a hard 30ms delay when the i2c transfer above fails, but I 
guess that's negligible.

>  	/* Start streaming */
> -	return imx290_write_reg(imx290, IMX290_XMSTA, 0x00);
> +	return imx290_write(imx290, IMX290_XMSTA, 0x00, &ret);
>  }
> 
>  static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
> @@ -772,27 +764,13 @@ static int imx290_set_data_lanes(struct imx290
> *imx290) * validated in probe itself
>  		 */
>  		dev_err(imx290->dev, "Lane configuration not 
supported\n");
> -		ret = -EINVAL;
> -		goto exit;
> +		return -EINVAL;
>  	}
> 
> -	ret = imx290_write_reg(imx290, IMX290_PHY_LANE_NUM, laneval);
> -	if (ret) {
> -		dev_err(imx290->dev, "Error setting Physical Lane number 
register\n");
> -		goto exit;
> -	}
> -
> -	ret = imx290_write_reg(imx290, IMX290_CSI_LANE_MODE, laneval);
> -	if (ret) {
> -		dev_err(imx290->dev, "Error setting CSI Lane mode 
register\n");
> -		goto exit;
> -	}
> -
> -	ret = imx290_write_reg(imx290, IMX290_FR_FDG_SEL, frsel);
> -	if (ret)
> -		dev_err(imx290->dev, "Error setting FR/FDG SEL 
register\n");
> +	imx290_write(imx290, IMX290_PHY_LANE_NUM, laneval, &ret);
> +	imx290_write(imx290, IMX290_CSI_LANE_MODE, laneval, &ret);
> +	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
> 
> -exit:
>  	return ret;
>  }

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



