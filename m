Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1125A125DB0
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 10:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfLSJap (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 04:30:45 -0500
Received: from mga06.intel.com ([134.134.136.31]:5412 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbfLSJap (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 04:30:45 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 01:30:44 -0800
X-IronPort-AV: E=Sophos;i="5.69,331,1571727600"; 
   d="scan'208";a="298658033"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 01:30:43 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 62E802066A; Thu, 19 Dec 2019 11:30:41 +0200 (EET)
Date:   Thu, 19 Dec 2019 11:30:41 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com
Subject: Re: [PATCH v1] ov5675: add vflip/hflip control support
Message-ID: <20191219093041.GJ21246@paasikivi.fi.intel.com>
References: <1576734366-5313-1-git-send-email-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576734366-5313-1-git-send-email-shawnx.tu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

Thank you for the patch.

On Thu, Dec 19, 2019 at 01:46:06PM +0800, Shawnx Tu wrote:
> From: Shawnx <shawnx.tu@intel.com>

Could you fix your name here? It seems to be correct in the Sob tag.

> 
> Add V4L2 controls: horizontal/vertical flip
> 
> Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
> ---
>  drivers/media/i2c/ov5675.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 1ae2523..16874f5 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -63,6 +63,11 @@
>  #define OV5675_TEST_PATTERN_ENABLE	BIT(7)
>  #define OV5675_TEST_PATTERN_BAR_SHIFT	2
>  
> +/* Flip Mirror Controls from sensor */
> +#define OV5675_REG_FORMAT1		0x3820
> +#define OV5675_REG_FORMAT1_HFLIP	BIT(3)
> +#define OV5675_REG_FORMAT1_VFLIP	BIT(4)
> +
>  #define to_ov5675(_sd)			container_of(_sd, struct ov5675, sd)
>  
>  enum {
> @@ -604,6 +609,40 @@ static int ov5675_test_pattern(struct ov5675 *ov5675, u32 pattern)
>  				OV5675_REG_VALUE_08BIT, pattern);
>  }
>  
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
> +	if (ctrl_val)
> +		val &= ~OV5675_REG_FORMAT1_HFLIP;

Shouldn't this be:

	val = (val & ~OV5675_REG_FORMAT1_HFLIP) |
	      (ctrl_val ? OV5675_REG_FORMAT1_HFLIP : 0);

Or something alike? Same below.

> +
> +	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
> +				OV5675_REG_VALUE_08BIT, val);
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
> +	if (ctrl_val)
> +		val |= OV5675_REG_FORMAT1_VFLIP;
> +
> +	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
> +				OV5675_REG_VALUE_08BIT, val);
> +}

As this is a raw Bayer sensor, the pattern changes as a function of the
flip controls. Could you take that into account, please?

> +
>  static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov5675 *ov5675 = container_of(ctrl->handler,
> @@ -654,6 +693,14 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
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
> @@ -722,6 +769,11 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
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
