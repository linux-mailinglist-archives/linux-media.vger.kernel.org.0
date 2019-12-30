Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 540C412D054
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 14:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfL3Ng0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Dec 2019 08:36:26 -0500
Received: from mga11.intel.com ([192.55.52.93]:43246 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727469AbfL3Ng0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Dec 2019 08:36:26 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 05:36:26 -0800
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="420351700"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 05:36:24 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E455D20628; Mon, 30 Dec 2019 15:36:22 +0200 (EET)
Date:   Mon, 30 Dec 2019 15:36:22 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com
Subject: Re: [PATCH v2] ov5675: add vflip/hflip control support
Message-ID: <20191230133622.GF19828@paasikivi.fi.intel.com>
References: <1577703117-18845-1-git-send-email-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577703117-18845-1-git-send-email-shawnx.tu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On Mon, Dec 30, 2019 at 06:51:57PM +0800, Shawnx Tu wrote:
> From: Shawn Tu <shawnx.tu@intel.com>
> 
> Add V4L2 controls: horizontal/vertical flip
> 
> Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
> ---
>  drivers/media/i2c/ov5675.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 1ae2523..9d948b4 100644
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

As the rotation changes the mbus pixel code, it needs to be taken into
account in setting the mbus format as well as mbus pixel code enumeration.

Could you include that in v3?

Thanks.

> +
>  #define to_ov5675(_sd)			container_of(_sd, struct ov5675, sd)
>  
>  enum {
> @@ -604,6 +609,36 @@ static int ov5675_test_pattern(struct ov5675 *ov5675, u32 pattern)
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
> +	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
> +				OV5675_REG_VALUE_08BIT,
> +				ctrl_val ? val | OV5675_REG_FORMAT1_VFLIP : val);
> +}
> +
>  static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov5675 *ov5675 = container_of(ctrl->handler,
> @@ -654,6 +689,14 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
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
> @@ -722,6 +765,11 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
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
