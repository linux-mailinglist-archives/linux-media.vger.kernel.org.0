Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE5255C814
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236539AbiF1KWO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 06:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239882AbiF1KWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 06:22:09 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CAEDCD
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 03:22:08 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 963E9240012;
        Tue, 28 Jun 2022 10:22:05 +0000 (UTC)
Date:   Tue, 28 Jun 2022 12:22:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH 2/7] media: v4l2-tpg: Add support for the new YUVA and
 YUVX formats
Message-ID: <20220628102203.fsckmflch5tvprt6@uno.localdomain>
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616183656.19089-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Jun 16, 2022 at 09:36:51PM +0300, Laurent Pinchart wrote:
> Extend the TPG to support generating the newly added YUVA and YUVX pixel
> formats.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

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
> --
> Regards,
>
> Laurent Pinchart
>
