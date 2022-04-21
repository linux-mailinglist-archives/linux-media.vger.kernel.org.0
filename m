Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67B450ABD1
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392611AbiDUXK1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiDUXK0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:10:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E12243395
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:07:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 431B3492;
        Fri, 22 Apr 2022 01:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650582452;
        bh=C8Uyq0TDV+7FtHKrWAB484+yMv6lBKcXbuOenDRSl3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m9bq+wMNalVRNYo/OwcKDaRjDgoODVMPSgEad8FY+9qJ6UoKoE32PLSY1chVe/SXa
         TEafgQfwrXYoqfZnV4+4vPJgQn4W7S6JlUMsfuzDJ/uqJOWK9CjCGDfUKMVHQXXopr
         PfMexabx70CC+ttg/BdbX+MRkChNIcpXftKNQHyU=
Date:   Fri, 22 Apr 2022 02:07:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/3] media: v4l2-tpg: Add support for the new YUVA and
 YUVX formats
Message-ID: <YmHjtUTocuKOrDZD@pendragon.ideasonboard.com>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
 <20220307180342.10666-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220307180342.10666-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Would anyone be able to review this patch ?

On Mon, Mar 07, 2022 at 08:03:41PM +0200, Laurent Pinchart wrote:
> Extend the TPG to support generating the newly added YUVA and YUVX pixel
> formats.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> index 7607b516a7c4..763347919d81 100644
> --- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> +++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> @@ -266,6 +266,8 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
>  	case V4L2_PIX_FMT_XYUV32:
>  	case V4L2_PIX_FMT_VUYA32:
>  	case V4L2_PIX_FMT_VUYX32:
> +	case V4L2_PIX_FMT_YUV32A:
> +	case V4L2_PIX_FMT_YUV32X:
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

-- 
Regards,

Laurent Pinchart
