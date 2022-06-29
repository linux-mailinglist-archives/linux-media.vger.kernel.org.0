Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 151A55601A8
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 15:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbiF2NrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 09:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiF2NrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 09:47:14 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C9B1705C
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 06:47:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 98BFDCE26B0
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 13:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB160C34114;
        Wed, 29 Jun 2022 13:47:08 +0000 (UTC)
Message-ID: <2e5026f8-4430-511c-c928-3336046bf4f8@xs4all.nl>
Date:   Wed, 29 Jun 2022 15:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] media: v4l2-tpg: Add support for the new YUVA and
 YUVX formats
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-3-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220616183656.19089-3-laurent.pinchart@ideasonboard.com>
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

On 16/06/2022 20:36, Laurent Pinchart wrote:
> Extend the TPG to support generating the newly added YUVA and YUVX pixel
> formats.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> index 7607b516a7c4..29d24f8d7c28 100644
> --- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> +++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> @@ -266,6 +266,8 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
>  	case V4L2_PIX_FMT_XYUV32:
>  	case V4L2_PIX_FMT_VUYA32:
>  	case V4L2_PIX_FMT_VUYX32:
> +	case V4L2_PIX_FMT_YUVA32:
> +	case V4L2_PIX_FMT_YUVX32:
>  		tpg->color_enc = TGP_COLOR_ENC_YCBCR;
>  		break;
>  	case V4L2_PIX_FMT_YUV420M:
> @@ -412,6 +414,8 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
>  	case V4L2_PIX_FMT_XYUV32:
>  	case V4L2_PIX_FMT_VUYA32:
>  	case V4L2_PIX_FMT_VUYX32:
> +	case V4L2_PIX_FMT_YUVA32:
> +	case V4L2_PIX_FMT_YUVX32:
>  	case V4L2_PIX_FMT_HSV32:
>  		tpg->twopixelsize[0] = 2 * 4;
>  		break;
> @@ -1376,9 +1380,11 @@ static void gen_twopix(struct tpg_data *tpg,
>  		buf[0][offset + 3] = b_v;
>  		break;
>  	case V4L2_PIX_FMT_RGBX32:
> +	case V4L2_PIX_FMT_YUVX32:
>  		alpha = 0;
>  		fallthrough;
>  	case V4L2_PIX_FMT_RGBA32:
> +	case V4L2_PIX_FMT_YUVA32:
>  		buf[0][offset] = r_y_h;
>  		buf[0][offset + 1] = g_u_s;
>  		buf[0][offset + 2] = b_v;

