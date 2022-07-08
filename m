Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDB556B77B
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 12:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238013AbiGHKod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 06:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237998AbiGHKoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 06:44:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5EF814BE
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 03:44:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A1F056D;
        Fri,  8 Jul 2022 12:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657277063;
        bh=ScQRSCflIYPNeBkaKEEZMcKRlbazExb19Tnzj41CNKg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wTIbE9J+D8Q1wSOlTNlb21ozUgG9TVdiKL0/WrRg0dL5ZiL7fVbNKBk4TcijUo2Jh
         ii4ewXn1RzNcYmkUzsnzvchHYiMnn+ubaRZS3jnj3oFmVz+IiDj9xVv1Bbeuoy3TPz
         eHEBiSzB8PkMQnLa8dlDlCzGzK4Jv4D558cd/dMw=
Date:   Fri, 8 Jul 2022 13:43:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH 8/8] vivid: add pixel_array test control
Message-ID: <YsgKbQsqsCiAVpJB@pendragon.ideasonboard.com>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
 <20220628120523.2915913-9-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628120523.2915913-9-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Jun 28, 2022 at 02:05:23PM +0200, Hans Verkuil wrote:
> This control will change dimensions according to the source resolution.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/test-drivers/vivid/vivid-core.h    |  1 +
>  drivers/media/test-drivers/vivid/vivid-ctrls.c   | 14 ++++++++++++++
>  drivers/media/test-drivers/vivid/vivid-vid-cap.c |  4 ++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
> index 176b72cb143b..e7b23ebc705e 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.h
> +++ b/drivers/media/test-drivers/vivid/vivid-core.h
> @@ -227,6 +227,7 @@ struct vivid_dev {
>  	struct v4l2_ctrl		*bitmask;
>  	struct v4l2_ctrl		*int_menu;
>  	struct v4l2_ctrl		*ro_int32;
> +	struct v4l2_ctrl		*pixel_array;
>  	struct v4l2_ctrl		*test_pattern;
>  	struct v4l2_ctrl		*colorspace;
>  	struct v4l2_ctrl		*rgb_range_cap;
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index a78d676575bc..f98a651842ce 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -35,6 +35,7 @@
>  #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
>  #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
>  #define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
> +#define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
>  
>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
> @@ -228,6 +229,18 @@ static const struct v4l2_ctrl_config vivid_ctrl_u8_4d_array = {
>  	.dims = { 2, 3, 4, 5 },
>  };
>  
> +static const struct v4l2_ctrl_config vivid_ctrl_u8_pixel_array = {
> +	.ops = &vivid_user_gen_ctrl_ops,
> +	.id = VIVID_CID_U8_PIXEL_ARRAY,
> +	.name = "U8 Pixel Array",
> +	.type = V4L2_CTRL_TYPE_U8,
> +	.def = 0x80,
> +	.min = 0x00,
> +	.max = 0xff,
> +	.step = 1,
> +	.dims = { 640, 360 },
> +};
> +
>  static const char * const vivid_ctrl_menu_strings[] = {
>  	"Menu Item 0 (Skipped)",
>  	"Menu Item 1",
> @@ -1642,6 +1655,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
> +	dev->pixel_array = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_pixel_array, NULL);
>  
>  	if (dev->has_vid_cap) {
>  		/* Image Processing Controls */
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> index b9caa4b26209..6dc4091fcabb 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> @@ -381,6 +381,7 @@ static enum tpg_pixel_aspect vivid_get_pixel_aspect(const struct vivid_dev *dev)
>  void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
>  {
>  	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
> +	u32 dims[V4L2_CTRL_MAX_DIMS] = {};
>  	unsigned size;
>  	u64 pixelclock;
>  
> @@ -459,6 +460,9 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
>  	tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
>  	tpg_s_pixel_aspect(&dev->tpg, vivid_get_pixel_aspect(dev));
>  	tpg_update_mv_step(&dev->tpg);
> +	dims[0] = dev->src_rect.width;
> +	dims[1] = dev->src_rect.height;
> +	v4l2_ctrl_modify_dimensions(dev->pixel_array, dims);

The implementation looks fine, but calling the init function (twice) on
each element will make vivid_update_format_cap() pretty slow. How about
going for a downsampled resolution here ?

Also, this made me wonder if v4l2_ctrl_modify_dimensions() should return
without doing anything if the new dimensions are identical to the
current ones.

>  }
>  
>  /* Map the field to something that is valid for the current input */

-- 
Regards,

Laurent Pinchart
