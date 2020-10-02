Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A61281D7F
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 23:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgJBVNR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 17:13:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:25280 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgJBVNR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 17:13:17 -0400
IronPort-SDR: 5eH72uC3KWO51DdG+FQdF28p9hZeWYV1ii8h9GjPgEbEpruU/aG88/RQbsV7L2f9ECuoYX+RYn
 Pz3iSWb7mK3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="142468850"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="142468850"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:13:16 -0700
IronPort-SDR: Bv5Rz53pFTtNlwiKW9fbbGI+hnmGq+Cp0DjYj6ybjPVh8auCfUSIUugi5r0AxwiWEI3aiPXFAZ
 mExJdvKfgZsA==
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="385972303"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:13:14 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D2F6D205EA; Sat,  3 Oct 2020 00:13:11 +0300 (EEST)
Date:   Sat, 3 Oct 2020 00:13:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v7 3/3] media: i2c: ov772x: Add test pattern control
Message-ID: <20201002211311.GX26842@paasikivi.fi.intel.com>
References: <20201002165656.16744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201002165656.16744-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002165656.16744-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 02, 2020 at 05:56:56PM +0100, Lad Prabhakar wrote:
> Add support for test pattern control supported by the sensor.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov772x.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 6b46ad493bf7..b7e10c34ef59 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -227,7 +227,7 @@
>  
>  /* COM3 */
>  #define SWAP_MASK       (SWAP_RGB | SWAP_YUV | SWAP_ML)
> -#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG)
> +#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG | SCOLOR_TEST)
>  
>  #define VFLIP_IMG       0x80	/* Vertical flip image ON/OFF selection */
>  #define HFLIP_IMG       0x40	/* Horizontal mirror image ON/OFF selection */
> @@ -425,6 +425,7 @@ struct ov772x_priv {
>  	const struct ov772x_win_size     *win;
>  	struct v4l2_ctrl		 *vflip_ctrl;
>  	struct v4l2_ctrl		 *hflip_ctrl;
> +	unsigned int			  test_pattern;

Alignment.

You can get away with one or possibly two but three is too many in such a
small number of lines. :-)

>  	/* band_filter = COM8[5] ? 256 - BDBASE : 0 */
>  	struct v4l2_ctrl		 *band_filter_ctrl;
>  	unsigned int			  fps;
> @@ -540,6 +541,11 @@ static const struct ov772x_win_size ov772x_win_sizes[] = {
>  	},
>  };
>  
> +static const char * const ov772x_test_pattern_menu[] = {
> +	"Disabled",
> +	"Vertical Color Bar Type 1",
> +};
> +
>  /*
>   * frame rate settings lists
>   */
> @@ -809,6 +815,9 @@ static int ov772x_s_ctrl(struct v4l2_ctrl *ctrl)
>  		}
>  
>  		return ret;
> +	case V4L2_CID_TEST_PATTERN:
> +		priv->test_pattern = ctrl->val;
> +		return 0;
>  	}
>  
>  	return -EINVAL;
> @@ -1107,6 +1116,8 @@ static int ov772x_set_params(struct ov772x_priv *priv,
>  		val ^= VFLIP_IMG;
>  	if (priv->hflip_ctrl->val)
>  		val ^= HFLIP_IMG;
> +	if (priv->test_pattern)
> +		val |= SCOLOR_TEST;
>  
>  	ret = regmap_update_bits(priv->regmap, COM3, SWAP_MASK | IMG_MASK, val);
>  	if (ret < 0)
> @@ -1442,6 +1453,10 @@ static int ov772x_probe(struct i2c_client *client)
>  	priv->band_filter_ctrl = v4l2_ctrl_new_std(&priv->hdl, &ov772x_ctrl_ops,
>  						   V4L2_CID_BAND_STOP_FILTER,
>  						   0, 256, 1, 0);
> +	v4l2_ctrl_new_std_menu_items(&priv->hdl, &ov772x_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov772x_test_pattern_menu) - 1,
> +				     0, 0, ov772x_test_pattern_menu);
>  	priv->subdev.ctrl_handler = &priv->hdl;
>  	if (priv->hdl.error) {
>  		ret = priv->hdl.error;

-- 
Sakari Ailus
