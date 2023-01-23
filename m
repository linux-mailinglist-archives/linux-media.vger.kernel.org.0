Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603CC678537
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 19:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjAWSqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 13:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbjAWSqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 13:46:48 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED204497
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:46:47 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390620352"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="390620352"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725180270"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="725180270"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2023 10:46:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK1ps-00DsZt-2v;
        Mon, 23 Jan 2023 20:46:28 +0200
Date:   Mon, 23 Jan 2023 20:46:28 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 33/57] media: atomisp: ov2680: Add test pattern control
Message-ID: <Y87WBHnxz7atGdge@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-34-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-34-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:41PM +0100, Hans de Goede wrote:
> Add a test pattern control. This is a 1:1 copy of the test pattern
> control in the main drivers/media/i2c/ov2680.c driver.

Hmm... I'm not sure I understand the trend of the changes.
We have two drivers of the same sensor, correct?
So, the idea is to move the AtomISP-specific one to be like
the generic and then kill it eventually?

If so, why do we add something here?


Code-wise it's okay change, but see above.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-ov2680.c        | 33 +++++++++++++++++++
>  drivers/staging/media/atomisp/i2c/ov2680.h    |  3 ++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 14002a1c22d2..6ca2a5bb0700 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -127,6 +127,24 @@ static int ov2680_gain_set(struct ov2680_device *sensor, u32 gain)
>  	return ovxxxx_write_reg16(sensor->client, OV2680_REG_GAIN_PK, gain);
>  }
>  
> +static int ov2680_test_pattern_set(struct ov2680_device *sensor, int value)
> +{
> +	int ret;
> +
> +	if (!value)
> +		return ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), 0);
> +
> +	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, 0x03, value - 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ovxxxx_mod_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), BIT(7));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> @@ -151,6 +169,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_GAIN:
>  		ret = ov2680_gain_set(sensor, ctrl->val);
>  		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov2680_test_pattern_set(sensor, ctrl->val);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  	}
> @@ -644,6 +665,13 @@ static const struct v4l2_subdev_ops ov2680_ops = {
>  
>  static int ov2680_init_controls(struct ov2680_device *sensor)
>  {
> +	static const char * const test_pattern_menu[] = {
> +		"Disabled",
> +		"Color Bars",
> +		"Random Data",
> +		"Square",
> +		"Black Image",
> +	};
>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> @@ -658,6 +686,11 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
>  	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
>  					    0, exp_max, 1, exp_max);
>  	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 1023, 1, 250);
> +	ctrls->test_pattern =
> +		v4l2_ctrl_new_std_menu_items(hdl,
> +					     &ov2680_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +					     ARRAY_SIZE(test_pattern_menu) - 1,
> +					     0, 0, test_pattern_menu);
>  
>  	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>  	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index e3ad20a7ffd5..45526477b612 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -120,6 +120,8 @@
>  #define OV2680_MWB_BLUE_GAIN_H			0x5008/*0x3404*/
>  #define OV2680_MWB_GAIN_MAX				0x0fff
>  
> +#define OV2680_REG_ISP_CTRL00			0x5080
> +
>  #define OV2680_START_STREAMING			0x01
>  #define OV2680_STOP_STREAMING			0x00
>  
> @@ -171,6 +173,7 @@ struct ov2680_device {
>  		struct v4l2_ctrl *vflip;
>  		struct v4l2_ctrl *exposure;
>  		struct v4l2_ctrl *gain;
> +		struct v4l2_ctrl *test_pattern;
>  	} ctrls;
>  };
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


