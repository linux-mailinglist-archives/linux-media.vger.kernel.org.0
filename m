Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3919E5F6366
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbiJFJPy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbiJFJPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:15:50 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CE05F23B
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:15:48 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9D0A61C0002;
        Thu,  6 Oct 2022 09:15:46 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:15:45 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 03/16] media: i2c: ov9282: Remove format code from the
 mode
Message-ID: <20221006091545.htbzmdkcge347ida@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-4-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-4-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Oct 05, 2022 at 04:27:56PM +0100, Dave Stevenson wrote:
> The format code is independent of mode, and each mode could
> support both Y10 and Y8, so disassociate the code from the
> mode.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Makes sense!

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> ---
>  drivers/media/i2c/ov9282.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 9842080cf66f..1c77b77427f0 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -88,7 +88,6 @@ struct ov9282_reg_list {
>   * struct ov9282_mode - ov9282 sensor mode structure
>   * @width: Frame width
>   * @height: Frame height
> - * @code: Format code
>   * @hblank: Horizontal blanking in lines
>   * @vblank: Vertical blanking in lines
>   * @vblank_min: Minimum vertical blanking in lines
> @@ -100,7 +99,6 @@ struct ov9282_reg_list {
>  struct ov9282_mode {
>  	u32 width;
>  	u32 height;
> -	u32 code;
>  	u32 hblank;
>  	u32 vblank;
>  	u32 vblank_min;
> @@ -273,7 +271,6 @@ static const struct ov9282_mode supported_mode = {
>  	.vblank_max = 51540,
>  	.pclk = 160000000,
>  	.link_freq_idx = 0,
> -	.code = MEDIA_BUS_FMT_Y10_1X10,
>  	.reg_list = {
>  		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
>  		.regs = mode_1280x720_regs,
> @@ -523,7 +520,7 @@ static int ov9282_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index > 0)
>  		return -EINVAL;
>
> -	code->code = supported_mode.code;
> +	code->code = MEDIA_BUS_FMT_Y10_1X10;
>
>  	return 0;
>  }
> @@ -543,7 +540,7 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fsize->index > 0)
>  		return -EINVAL;
>
> -	if (fsize->code != supported_mode.code)
> +	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10)
>  		return -EINVAL;
>
>  	fsize->min_width = supported_mode.width;
> @@ -567,7 +564,7 @@ static void ov9282_fill_pad_format(struct ov9282 *ov9282,
>  {
>  	fmt->format.width = mode->width;
>  	fmt->format.height = mode->height;
> -	fmt->format.code = mode->code;
> +	fmt->format.code = MEDIA_BUS_FMT_Y10_1X10;
>  	fmt->format.field = V4L2_FIELD_NONE;
>  	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
>  	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> --
> 2.34.1
>
