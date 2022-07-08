Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0DC56B729
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 12:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237405AbiGHKSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 06:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237201AbiGHKSF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 06:18:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7572A615D
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 03:18:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C280656D;
        Fri,  8 Jul 2022 12:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657275482;
        bh=XorfjcUenbXJyOUcyTNMitnyXmxjg+b9vCmI8x2yVec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nUSdrmeb0bdODxjneodbbWidGV5kiYvhLJ4AryFtazwWN/ayU0sDtbMtFm9Vidik1
         4HgJ6q1CU7BID3RgcNmm53LJpR+9daqx8bB+AJVeerB6pkcfn2OrMsYMHS56s01DYK
         1v8zlN6MELifNKO0kjw+TrISZdbMTW30IKAJWbsY=
Date:   Fri, 8 Jul 2022 13:17:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH 3/8] vivid: add dynamic array test control
Message-ID: <YsgEQZrNHwEBQMeY@pendragon.ideasonboard.com>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
 <20220628120523.2915913-4-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628120523.2915913-4-hverkuil-cisco@xs4all.nl>
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

On Tue, Jun 28, 2022 at 02:05:18PM +0200, Hans Verkuil wrote:
> Add a dynamic array test control to help test support for this
> feature.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Acked-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Tested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index 7ff8fdfda28e..a78d676575bc 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -34,6 +34,7 @@
>  #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
>  #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
>  #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
> +#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
>  
>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
> @@ -190,6 +191,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
>  	.dims = { 1 },
>  };
>  
> +static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
> +	.ops = &vivid_user_gen_ctrl_ops,
> +	.id = VIVID_CID_U32_DYN_ARRAY,
> +	.name = "U32 Dynamic Array",
> +	.type = V4L2_CTRL_TYPE_U32,
> +	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
> +	.def = 50,
> +	.min = 10,
> +	.max = 90,
> +	.step = 1,
> +	.dims = { 100 },
> +};
> +
>  static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
>  	.ops = &vivid_user_gen_ctrl_ops,
>  	.id = VIVID_CID_U16_MATRIX,
> @@ -1625,6 +1639,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
> +	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
>  

-- 
Regards,

Laurent Pinchart
