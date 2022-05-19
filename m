Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F033552CE54
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 10:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234652AbiESI3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 04:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235371AbiESI3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 04:29:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1FB79832
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 01:29:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 17E4B617A6
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 08:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342CBC385AA;
        Thu, 19 May 2022 08:29:30 +0000 (UTC)
Message-ID: <f849a6c0-4ca3-2cbf-2c9b-c1217988b734@xs4all.nl>
Date:   Thu, 19 May 2022 10:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 6/6] media: vivid: Add a roi rectangle control
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20220518062412.2375586-1-yunkec@google.com>
 <20220518062412.2375586-7-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220518062412.2375586-7-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/18/22 08:24, Yunke Cao wrote:
> The control supports current, default, minimum and maximum.
> 
> Tested by calling ioctls from the user space.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index e7516dc1227b..79093882d386 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -34,6 +34,7 @@
>  #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
>  #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
>  #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
> +#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 13)
>  
>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
> @@ -292,6 +293,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_area = {
>  	.p_def.p_const = &area,
>  };
>  
> +static const struct v4l2_rect def_rect = {
> +	.left = 0,
> +	.top = 0,
> +	.width = 1000,
> +	.height = 2000,
> +};
> +
> +static const struct v4l2_rect min_rect = {
> +	.left = 0,
> +	.top = 0,
> +	.width = 1,
> +	.height = 2,
> +};
> +
> +static const struct v4l2_rect max_rect = {
> +	.left = 0,
> +	.top = 0,
> +	.width = 2000,
> +	.height = 4000,
> +};

The max rect will need to be updated whenever the format changes since
it depends on the image size.

I would also add the V4L2_CID_REGION_OF_INTEREST_AUTO control. It wouldn't
actually do anything, but it makes for a more realistic example.

BTW, is V4L2_CID_REGION_OF_INTEREST_AUTO a required control if you have the
V4L2_CID_REGION_OF_INTEREST_RECT control? It's not clear from the documentation.

I think it should be a required control: if set to 0, then the ROI would be
unused.

I also feel that this control should be an array of ROIs. It is AFAIK not
uncommon for hardware to support multiple ROIs. The dynamic control array
patches that are part of e.g. this series:

https://patchwork.linuxtv.org/project/linux-media/cover/20220503093925.876640-1-xavier.roumegue@oss.nxp.com/

may help with that.

Note that dynamic array support is still not merged. It is used in at least two
outstanding patch series, but neither one is ready yet to be merged. For the use
of ROI it might be interesting if the dynamic array support would allow for empty
arrays, but that's not implemented at the moment (the minimum number of elements
is 1).

If it is an array, then should INTEREST_AUTO become an array as well? Or should
the bitmask be incorporated into each ROI rectangle struct (i.e. it will no longer
be a v4l2_rect but a different struct). 

I think incorporating this in the ROI struct would make more sense, that way it
is an atomic operation: here is the ROI, and here is what it is to be used for.

Apologies for the somewhat rambling email, it's in part a bit of brainstorming.

I think it might be better if you post an RFC with the API proposal, rather than
a patch series. The question here is what the public API should look like, how
generic it should be, what are the use-cases, etc.

Regards,

	Hans

> +
> +static const struct v4l2_ctrl_config vivid_ctrl_rect = {
> +	.ops = &vivid_user_gen_ctrl_ops,
> +	.id = VIVID_CID_RECT,
> +	.name = "Region of Interest Rectangle",
> +	.type = V4L2_CTRL_TYPE_RECT,
> +	.p_def.p_const = &def_rect,
> +	.p_min.p_const = &min_rect,
> +	.p_max.p_const = &max_rect,
> +};
> +
> +
>  static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
>  	.ops = &vivid_user_gen_ctrl_ops,
>  	.id = VIVID_CID_RO_INTEGER,
> @@ -1611,6 +1644,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
>  	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
> +	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
