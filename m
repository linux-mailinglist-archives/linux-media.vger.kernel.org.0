Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 032B2136907
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 09:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgAJIf0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 03:35:26 -0500
Received: from mga11.intel.com ([192.55.52.93]:43462 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbgAJIfZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 03:35:25 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jan 2020 00:35:25 -0800
X-IronPort-AV: E=Sophos;i="5.69,415,1571727600"; 
   d="scan'208";a="223665511"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jan 2020 00:35:24 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 087F520F35; Fri, 10 Jan 2020 10:35:22 +0200 (EET)
Date:   Fri, 10 Jan 2020 10:35:21 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com
Subject: Re: [PATCH v4] ov5675: add vflip/hflip control support
Message-ID: <20200110083521.GA5440@paasikivi.fi.intel.com>
References: <1578643034-18356-1-git-send-email-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578643034-18356-1-git-send-email-shawnx.tu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

Thanks for the update.

On Fri, Jan 10, 2020 at 03:57:14PM +0800, Shawnx Tu wrote:
> From: Shawn Tu <shawnx.tu@intel.com>
> 
> - Add V4L2 controls: horizontal/vertical flip,
>   keep SGRBG10 Bayer order output (via change v/hflip)
> - Fix Bayer order output in 1296x972 binning registers
> 
> Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
> ---
>  drivers/media/i2c/ov5675.c | 82 +++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 73 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 1ae2523..dcb703cc 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -63,6 +63,14 @@
>  #define OV5675_TEST_PATTERN_ENABLE	BIT(7)
>  #define OV5675_TEST_PATTERN_BAR_SHIFT	2
>  
> +/* Flip Mirror Controls from sensor */
> +#define OV5675_REG_FORMAT1		0x3820
> +#define OV5675_REG_FORMAT2		0x373d
> +#define OV5675_REG_FORMAT1_HFLIP	BIT(3)
> +#define OV5675_REG_FORMAT1_VFLIP	BIT(4)
> +#define OV5675_REG_FORMAT1_VFLIP_BLC	BIT(5)
> +#define OV5675_REG_FORMAT2_VBLK_FLIP	BIT(1)
> +
>  #define to_ov5675(_sd)			container_of(_sd, struct ov5675, sd)
>  
>  enum {
> @@ -314,21 +322,21 @@ static const struct ov5675_reg mode_1296x972_regs[] = {
>  	{0x3800, 0x00},
>  	{0x3801, 0x00},
>  	{0x3802, 0x00},
> -	{0x3803, 0xf4},
> +	{0x3803, 0x00},
>  	{0x3804, 0x0a},
>  	{0x3805, 0x3f},
> -	{0x3806, 0x06},
> -	{0x3807, 0xb3},
> +	{0x3806, 0x07},
> +	{0x3807, 0xb7},
>  	{0x3808, 0x05},
> -	{0x3809, 0x00},
> -	{0x380a, 0x02},
> -	{0x380b, 0xd0},
> +	{0x3809, 0x10},
> +	{0x380a, 0x03},
> +	{0x380b, 0xcc},
>  	{0x380c, 0x02},
>  	{0x380d, 0xee},
>  	{0x380e, 0x07},
> -	{0x380f, 0xe4},
> -	{0x3811, 0x10},
> -	{0x3813, 0x09},
> +	{0x380f, 0xd0},
> +	{0x3811, 0x08},
> +	{0x3813, 0x0d},
>  	{0x3814, 0x03},
>  	{0x3815, 0x01},
>  	{0x3816, 0x03},
> @@ -604,6 +612,49 @@ static int ov5675_test_pattern(struct ov5675 *ov5675, u32 pattern)
>  				OV5675_REG_VALUE_08BIT, pattern);
>  }
>  

Could you add a comment here telling the Bayer order isn't affected by the
flip controls? Generally the Bayer order is determined by those controls on
pretty much all other sensors.

> +static int ov5675_set_ctrl_hflip(struct ov5675 *ov5675, u32 ctrl_val)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = ov5675_read_reg(ov5675, OV5675_REG_FORMAT1,
> +			      OV5675_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
> +				OV5675_REG_VALUE_08BIT,
> +				ctrl_val ? val & ~OV5675_REG_FORMAT1_HFLIP : val);
> +}
> +
> +static int ov5675_set_ctrl_vflip(struct ov5675 *ov5675, u8 ctrl_val)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = ov5675_read_reg(ov5675, OV5675_REG_FORMAT1,
> +			      OV5675_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
> +			       OV5675_REG_VALUE_08BIT,
> +			       ctrl_val ? val | OV5675_REG_FORMAT1_VFLIP | OV5675_REG_FORMAT1_VFLIP_BLC  : val);

80 characters per line, please. Same below.

You can also write this as:

val | (ctrl_val ? ...)

> +
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_read_reg(ov5675, OV5675_REG_FORMAT2,
> +			      OV5675_REG_VALUE_08BIT, &val);
> +
> +	if (ret)
> +		return ret;
> +
> +	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT2,
> +				OV5675_REG_VALUE_08BIT,
> +				ctrl_val ? val | OV5675_REG_FORMAT2_VBLK_FLIP : val);
> +}
> +
>  static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov5675 *ov5675 = container_of(ctrl->handler,
> @@ -654,6 +705,14 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = ov5675_test_pattern(ov5675, ctrl->val);
>  		break;
>  
> +	case V4L2_CID_HFLIP:
> +		ov5675_set_ctrl_hflip(ov5675, ctrl->val);
> +		break;
> +
> +	case V4L2_CID_VFLIP:
> +		ov5675_set_ctrl_vflip(ov5675, ctrl->val);
> +		break;
> +
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -722,6 +781,11 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
>  				     V4L2_CID_TEST_PATTERN,
>  				     ARRAY_SIZE(ov5675_test_pattern_menu) - 1,
>  				     0, 0, ov5675_test_pattern_menu);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
> +			  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
> +			  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
>  	if (ctrl_hdlr->error)
>  		return ctrl_hdlr->error;
>  

-- 
Kind regards,

Sakari Ailus
