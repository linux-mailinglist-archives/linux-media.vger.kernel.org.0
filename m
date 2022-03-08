Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3DE4D1754
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 13:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242278AbiCHMgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 07:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiCHMgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 07:36:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573B33A703
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 04:35:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBAD260B09
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 12:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E73C340EB;
        Tue,  8 Mar 2022 12:35:14 +0000 (UTC)
Message-ID: <af0230cd-cdeb-8d9d-1c64-3550e92cd0bd@xs4all.nl>
Date:   Tue, 8 Mar 2022 13:35:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] Add a V4L2 control to allow configuring BLC from
 userspace.
Content-Language: en-US
To:     Arec Kao <arec.kao@intel.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com, tfiga@google.com
References: <20220308033839.3773-1-arec.kao@intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220308033839.3773-1-arec.kao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/8/22 04:38, Arec Kao wrote:
> Trigger BLC update when analog gain change in specific range.
> 
> Signed-off-by: Arec Kao <arec.kao@intel.com>
> ---
>  drivers/media/i2c/ov5675.c                | 41 ++++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c |  1 +
>  include/uapi/linux/v4l2-controls.h        |  1 +
>  3 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 82ba9f56baec..39a0a7a06249 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -74,6 +74,13 @@
>  #define OV5675_REG_FORMAT1		0x3820
>  #define OV5675_REG_FORMAT2		0x373d
>  
> +/* BLC Control */
> +#define OV5675_REG_BLC_CTRL10		0x4010
> +#define OV5675_BLC_ENABLE		BIT(6) /* Gain change BLC trigger enable */
> +
> +#define OV5675_REG_BLC_CTRL11		0x4011
> +#define OV5675_BLC_MULTI_FRAME_ENABLE	BIT(4) /* Gain change BLC trigger multi-frame enable */
> +
>  #define to_ov5675(_sd)			container_of(_sd, struct ov5675, sd)
>  
>  enum {
> @@ -684,6 +691,34 @@ static int ov5675_set_ctrl_vflip(struct ov5675 *ov5675, u8 ctrl_val)
>  				ctrl_val ? val | BIT(1) : val & ~BIT(1));
>  }
>  
> +static int ov5675_update_blc(struct ov5675 *ov5675, u8 ctrl_val)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = ov5675_read_reg(ov5675, OV5675_REG_BLC_CTRL10,
> +			      OV5675_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_write_reg(ov5675, OV5675_REG_BLC_CTRL10,
> +			       OV5675_REG_VALUE_08BIT,
> +			       ctrl_val ? val | OV5675_BLC_ENABLE :
> +			       val & ~OV5675_BLC_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5675_read_reg(ov5675, OV5675_REG_BLC_CTRL11,
> +			      OV5675_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	return ov5675_write_reg(ov5675, OV5675_REG_BLC_CTRL11,
> +				OV5675_REG_VALUE_08BIT,
> +				ctrl_val ? val | OV5675_BLC_MULTI_FRAME_ENABLE :
> +				val & ~OV5675_BLC_MULTI_FRAME_ENABLE);
> +}
> +
>  static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov5675 *ov5675 = container_of(ctrl->handler,
> @@ -748,6 +783,9 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ov5675_set_ctrl_vflip(ov5675, ctrl->val);
>  		break;
>  
> +	case V4L2_CID_BLC:
> +		ret = ov5675_update_blc(ov5675, ctrl->val);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -819,7 +857,8 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
>  			  V4L2_CID_HFLIP, 0, 1, 1, 0);
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
>  			  V4L2_CID_VFLIP, 0, 1, 1, 0);
> -
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
> +			  V4L2_CID_BLC, 0, 1, 1, 1);

It's an integer control, but used as a bool. So shouldn't it be a bool control?
Without the documentation of what it does exactly it is hard to tell.

>  	if (ctrl_hdlr->error)
>  		return ctrl_hdlr->error;
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 54ca4e6b820b..2b0b295fc047 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1110,6 +1110,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
>  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> +	case V4L2_CID_BLC:			return "Black Level Calibration";
>  
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index c8e0f84d204d..0a0fb1283124 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1126,6 +1126,7 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
>  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
>  #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> +#define V4L2_CID_BLC				(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)

Please rename this to V4L2_CID_BLACK_LEVEL_CALIB or _CALIBRATION.

Control names should be descriptive, and I had no idea what BLC meant.

I'm leaning to writing _CALIBRATION in full, but Laurent might prefer something
shorter. _CALIB is also understandable, I think.

Regards,

	Hans

>  
>  
>  /* Image processing controls */

