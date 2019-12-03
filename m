Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 127CC10FA24
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 09:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfLCItk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 03:49:40 -0500
Received: from retiisi.org.uk ([95.216.213.190]:45658 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725773AbfLCItk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 03:49:40 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3856E634C87;
        Tue,  3 Dec 2019 10:48:51 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1ic3rW-0001NT-PP; Tue, 03 Dec 2019 10:48:50 +0200
Date:   Tue, 3 Dec 2019 10:48:50 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH 2/5] media: i2c: imx290: Add support for test pattern
 generation
Message-ID: <20191203084850.GA5282@valkosipuli.retiisi.org.uk>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
 <20191129190541.30315-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129190541.30315-3-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Sat, Nov 30, 2019 at 12:35:38AM +0530, Manivannan Sadhasivam wrote:
> Add support for generating following test patterns by IMX290:
> 
> * Sequence Pattern 1
> * Horizontal Color-bar Chart
> * Vertical Color-bar Chart
> * Sequence Pattern 2
> * Gradation Pattern 1
> * Gradation Pattern 2
> * 000/555h Toggle Pattern
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/media/i2c/imx290.c | 41 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 1d49910937fb..e218c959a729 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -26,12 +26,19 @@
>  #define IMX290_REGHOLD 0x3001
>  #define IMX290_XMSTA 0x3002
>  #define IMX290_FR_FDG_SEL 0x3009
> +#define IMX290_BLKLEVEL_LOW 0x300a
> +#define IMX290_BLKLEVEL_HIGH 0x300b
>  #define IMX290_GAIN 0x3014
>  #define IMX290_HMAX_LOW 0x301c
>  #define IMX290_HMAX_HIGH 0x301d
> +#define IMX290_PGCTRL 0x308c
>  #define IMX290_PHY_LANE_NUM 0x3407
>  #define IMX290_CSI_LANE_MODE 0x3443
>  
> +#define IMX290_PGCTRL_REGEN BIT(0)
> +#define IMX290_PGCTRL_THRU BIT(1)
> +#define IMX290_PGCTRL_MODE(n) ((n) << 4)
> +
>  /* HMAX fields */
>  #define IMX290_HMAX_2_1920 0x1130
>  #define IMX290_HMAX_4_1920 0x0898
> @@ -99,6 +106,17 @@ static const struct regmap_config imx290_regmap_config = {
>  	.cache_type = REGCACHE_RBTREE,
>  };
>  
> +static const char * const imx290_test_pattern_menu[] = {
> +	"Disabled",
> +	"Sequence Pattern 1",
> +	"Horizontal Color-bar Chart",
> +	"Vertical Color-bar Chart",
> +	"Sequence Pattern 2",
> +	"Gradation Pattern 1",
> +	"Gradation Pattern 2",
> +	"000/555h Toggle Pattern",
> +};
> +
>  static const struct imx290_regval imx290_global_init_settings[] = {
>  	{ 0x3007, 0x00 },
>  	{ 0x3018, 0x65 },
> @@ -394,6 +412,22 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_GAIN:
>  		ret = imx290_set_gain(imx290, ctrl->val);
>  		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		if (ctrl->val) {
> +			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x00);
> +			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
> +			mdelay(10);

Any particular reason for a busy loop instead of sleeping? Same below.

> +			imx290_write_reg(imx290, IMX290_PGCTRL,
> +					 (u8)(IMX290_PGCTRL_REGEN |
> +					 IMX290_PGCTRL_THRU |
> +					 IMX290_PGCTRL_MODE(ctrl->val)));
> +		} else {
> +			imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
> +			mdelay(10);
> +			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x3c);
> +			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
> +		}
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -878,7 +912,7 @@ static int imx290_probe(struct i2c_client *client)
>  
>  	mutex_init(&imx290->lock);
>  
> -	v4l2_ctrl_handler_init(&imx290->ctrls, 3);
> +	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
>  
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  			  V4L2_CID_GAIN, 0, 72, 1, 0);
> @@ -896,6 +930,11 @@ static int imx290_probe(struct i2c_client *client)
>  					       INT_MAX, 1,
>  					       imx290_modes[0].pixel_rate);
>  
> +	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> +				     0, 0, imx290_test_pattern_menu);
> +
>  	imx290->sd.ctrl_handler = &imx290->ctrls;
>  
>  	if (imx290->ctrls.error) {

-- 
Sakari Ailus
