Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D07C19ECD7
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 19:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgDERRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 13:17:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58354 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgDERRd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 13:17:33 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87521312;
        Sun,  5 Apr 2020 19:17:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586107051;
        bh=L2WqJ1FrIQVSbk5oEaveBouJTByHJQPfwCTC9GTonDI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j01IyzJangLIWTayNn4j4vdJ5oKoXrjFRljmo7KPjUYr12ygHnXqiDu7kleTZ2gJB
         qbbqivhncsiixDaVLtgJnPXyoo73RUUhPyziQlN5Yu1uL5GvlVTylDdPVJeGNm7j0A
         Mwnoy9fvMGlR7IlRKlHSVHUVMGvC+uRZdACovzRI=
Date:   Sun, 5 Apr 2020 20:17:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH v6 11/11] media: imx: utils: Constify ipu_image argument
 to imx_media_ipu_image_to_mbus_fmt()
Message-ID: <20200405171722.GF5846@pendragon.ideasonboard.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
 <20200404224130.23118-12-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200404224130.23118-12-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Sat, Apr 04, 2020 at 03:41:30PM -0700, Steve Longerbeam wrote:
> The imx_media_ipu_image_to_mbus_fmt() function doesn't need to modify its
> ipu_image argument. Make it const.

You could squash this with patch 10/11. In any case,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 2 +-
>  drivers/staging/media/imx/imx-media.h       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index b8ee005e4445..c00f253976f5 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -580,7 +580,7 @@ int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
>  EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_ipu_image);
>  
>  int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
> -				    struct ipu_image *image)
> +				    const struct ipu_image *image)
>  {
>  	const struct imx_media_pixfmt *fmt;
>  
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index c03114a6f6c8..af806ecc67a9 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -189,7 +189,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>  int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
>  				    const struct v4l2_mbus_framefmt *mbus);
>  int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
> -				    struct ipu_image *image);
> +				    const struct ipu_image *image);
>  void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
>  				 u32 grp_id, int ipu_id);
>  struct v4l2_subdev *

-- 
Regards,

Laurent Pinchart
