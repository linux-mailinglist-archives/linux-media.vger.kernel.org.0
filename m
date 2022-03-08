Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D20A4D16FB
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 13:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346722AbiCHMOF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 07:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236809AbiCHMOE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 07:14:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2421832EDD
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 04:13:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF56C332;
        Tue,  8 Mar 2022 13:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646741586;
        bh=E23Xb9TsDCo4vRUhWayQIoOyr73s50dtodJd+pvMgOY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nAVadiu4NUApA6uzaFBlE8KQkZFvKv03RyiALTAB6B6uYhhfo9/FToK/xSGfN7Aj/
         4NixSzOUrXR9QpAMVwgPJETqjPZ8Zq79cai9e5OA2FDAHsFHQBqSZ3u0MBLpB1Cd2B
         fwyfKyRetvxP9yLGKiR9OdLs/3P39SpmHxfL75q0=
Date:   Tue, 8 Mar 2022 14:12:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arec Kao <arec.kao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        andy.yeh@intel.com, tfiga@google.com
Subject: Re: [PATCH 1/2] Add a V4L2 control to allow configuring BLC from
 userspace.
Message-ID: <YidIQ+DINBpCRgCW@pendragon.ideasonboard.com>
References: <20220308033839.3773-1-arec.kao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220308033839.3773-1-arec.kao@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arec,

Thank you for the patch.

On Tue, Mar 08, 2022 at 11:38:38AM +0800, Arec Kao wrote:
> Trigger BLC update when analog gain change in specific range.
> 
> Signed-off-by: Arec Kao <arec.kao@intel.com>
> ---
>  drivers/media/i2c/ov5675.c                | 41 ++++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c |  1 +
>  include/uapi/linux/v4l2-controls.h        |  1 +

This should be split in two patches, with the changes to
drivers/media/v4l2-core/v4l2-ctrls-defs.c and
include/uapi/linux/v4l2-controls.h bundled with the documentation change
from patch 2/2. A second patch should then implement support for this
control in the ov5675 driver.

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
>  
>  
>  /* Image processing controls */

-- 
Regards,

Laurent Pinchart
