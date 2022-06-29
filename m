Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4B255FCB8
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 11:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbiF2J4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 05:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbiF2J4w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 05:56:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97753DA4A
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 02:56:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D8DC61EAC
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 09:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C232C34114;
        Wed, 29 Jun 2022 09:56:48 +0000 (UTC)
Message-ID: <b5a9d66b-b182-4b65-efee-cc7a8533b292@xs4all.nl>
Date:   Wed, 29 Jun 2022 11:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] mediatek/jpeg: validate data_offsets for v4l2 planes
Content-Language: en-US
To:     Justin Green <greenjustin@chromium.org>,
        linux-media@vger.kernel.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com,
        nicolas.dufresne@collabora.com, andrescj@chromium.org,
        yunfei.dong@mediatek.com, Justin Green <greenjustin@google.com>
References: <20220623191422.1157518-1-greenjustin@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220623191422.1157518-1-greenjustin@chromium.org>
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

On 23/06/2022 21:14, Justin Green wrote:
> Validate V4L2 plane data_offset values. We need to make sure the size of
> the image we're encoding does not exceed the size of the buffer minus
> its offset.
> 
> Signed-off-by: Justin Green <greenjustin@google.com>
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index bc5b0a0168ec..8f5c1b9937bc 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -687,6 +687,10 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
>  
>  	for (i = 0; i < q_data->fmt->colplanes; i++) {
>  		plane_fmt = q_data->pix_mp.plane_fmt[i];
> +                if (vb->planes[i].data_offset > vb2_plane_size(vb, i) ||
> +                    vb2_plane_size(vb, i) - vb->planes[i].data_offset
> +                    < plane_fmt.sizeimage)

Is this correct? AFAICS this function is used for both buffers containing the
raw image (and it is correct in that case) and for buffers containing the
compressed JPEG data. But in the latter case sizeimage is the worst-case
image size, the actual data can be (and almost certainly is) less than that
and this function returns an error when it shouldn't.

Or did I miss something?

In any case: this needs to be tested on actual hardware for both encoder
and decoder. A Tested-by tag would be very welcome.

Regards,

	Hans

> +                    return -EINVAL;
>  		if (ctx->enable_exif &&
>  		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
>  			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +

