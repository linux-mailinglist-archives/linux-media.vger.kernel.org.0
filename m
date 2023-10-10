Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A007BF541
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 10:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbjJJIFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 04:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234631AbjJJIFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 04:05:24 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D8FA4
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 01:05:21 -0700 (PDT)
X-KPN-MessageId: c122c2b1-6743-11ee-91e6-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id c122c2b1-6743-11ee-91e6-005056994fde;
        Tue, 10 Oct 2023 10:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=tj9fIXbh/D+ooqSlso0OVcd6fcTL9d+cn33J2XNKssA=;
        b=CvondWqZNWS6HdCTf3emNvpaAVux/ziQ2z6h5YgFhhEDQRFR+eiJEuxw+OlGZ0RNU49XyAH65Pzmr
         br4DffwXsmvTSO4Y72KDzvbqfH6s5dryeJ51DZgizvZBOuCgAkidvTeTdqBzYDU8S2hL7bfQ/yDGYX
         Z3XJOLvRVd6R0LqU1xOySuvK7RzOIDU3+tZ2JgHsNfSfZpj7mDpnQUF9jXDeUtemFX9wujvSuhrk3G
         RiFemPNPfgyzljtWostKdCX1Ikuo9FeJvfININ1QseIaNIG+w1xJwxGjXwr7m4M1qauaJFbZVZCTbS
         jkYm6HeZGjGuHbfQizqhLlDsosl5lrg==
X-KPN-MID: 33|ftU4skUh0dEdH83DqzQy4Bx9uxMWTxMozaZWVgDjyUSpwzukxqP0avqgIhYnG35
 1nBC7pjS86fBVsf0V1wyuvr7zk4yU5WHuM69RozEXhxY=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|YtFDZMfDRiqKB9cDrBc0mTx6y2HdrSTPyJj6D/PHbmYw17fTP4euCNRoaxhAYJx
 WHc+P17cwvuhzvX8G/1krQQ==
X-Originating-IP: 173.38.220.40
Received: from [10.47.78.242] (unknown [173.38.220.40])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id c08108a4-6743-11ee-ac79-00505699b758;
        Tue, 10 Oct 2023 10:05:19 +0200 (CEST)
Message-ID: <4f13e0e5-3650-4f81-9c14-367d4f46ecf7@xs4all.nl>
Date:   Tue, 10 Oct 2023 10:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 07/11] media: vivid: Add an rectangle control
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20231010022136.1504015-1-yunkec@google.com>
 <20231010022136.1504015-8-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231010022136.1504015-8-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/10/23 04:21, Yunke Cao wrote:
> This control represents a generic read/write rectangle.
> It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

No SOB!

With that added:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index f2b20e25a7a4..27a1173c7734 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -38,6 +38,7 @@
>  #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
>  #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
>  #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
> +#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
>  
>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
> @@ -357,6 +358,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
>  	.step = 1,
>  };
>  
> +static const struct v4l2_rect rect_def = {
> +	.top = 100,
> +	.left = 200,
> +	.width = 300,
> +	.height = 400,
> +};
> +
> +static const struct v4l2_rect rect_min = {
> +	.top = 0,
> +	.left = 0,
> +	.width = 1,
> +	.height = 1,
> +};
> +
> +static const struct v4l2_rect rect_max = {
> +	.top = 0,
> +	.left = 0,
> +	.width = 1000,
> +	.height = 2000,
> +};
> +
> +static const struct v4l2_ctrl_config vivid_ctrl_rect = {
> +	.ops = &vivid_user_gen_ctrl_ops,
> +	.id = VIVID_CID_RECT,
> +	.name = "Rect",
> +	.type = V4L2_CTRL_TYPE_RECT,
> +	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
> +	.p_def.p_const = &rect_def,
> +	.p_min.p_const = &rect_min,
> +	.p_max.p_const = &rect_max,
> +};
> +
>  /* Framebuffer Controls */
>  
>  static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -1677,6 +1710,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
>  	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
> +	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);

