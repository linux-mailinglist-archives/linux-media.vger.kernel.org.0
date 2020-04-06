Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D39A619FB25
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 19:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729832AbgDFRNx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 13:13:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51896 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgDFRNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 13:13:53 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC5B380E;
        Mon,  6 Apr 2020 19:13:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586193231;
        bh=ukPzAudzQBvAYHEsgfKdDXVabH3Di/A/bJ6ve8PzULk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UOroPd18kbysSMMWsxYub85SfVKtzjzIu+AT7o855JZcCgv1z/L0/hF0wc+UT04bc
         x2G4Bpp6shv8y/CriIf1rei7DzkjjNFUabCwme99qbrTglAGQxsVA7/pggJXmHQwhm
         L0VTlBQjZ3ox9cZ1vmfIxXqoU/58YxXjbz1ZdqPU=
Date:   Mon, 6 Apr 2020 20:13:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH v7 05/11] media: imx: Fix some pixel format selections
Message-ID: <20200406171340.GB16885@pendragon.ideasonboard.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
 <20200406163905.24475-6-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200406163905.24475-6-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Mon, Apr 06, 2020 at 09:38:59AM -0700, Steve Longerbeam wrote:
> - imx_media_capture_device_register() needs to use CS_SEL_ANY when
>   finding the format from the attached source subdevice, because the
>   source can be a CSI which supports bayer, and the CSI may have selected
>   a bayer format when it registered.
> 
> - Likewise, imx_media_init_mbus_fmt() is called from the CSI, so the
>   function may be passed a bayer code. Use CS_SEL_ANY when locating
>   the format.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx-media-capture.c | 2 +-
>  drivers/staging/media/imx/imx-media-utils.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index fe1c49a33fd9..970f54960cac 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -792,7 +792,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>  	vdev->compose.width = fmt_src.format.width;
>  	vdev->compose.height = fmt_src.format.height;
>  	vdev->cc = imx_media_find_format(vdev->fmt.fmt.pix.pixelformat,
> -					 CS_SEL_YUV_RGB);
> +					 CS_SEL_ANY);
>  
>  	v4l2_info(sd, "Registered %s as /dev/%s\n", vfd->name,
>  		  video_device_node_name(vfd));
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 5552039a9d7e..852badd55bd1 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -402,7 +402,7 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
>  	mbus->field = field;
>  	if (code == 0)
>  		imx_media_enum_mbus_format(&code, 0, CS_SEL_YUV);
> -	lcc = imx_media_find_mbus_format(code, CS_SEL_YUV_RGB);
> +	lcc = imx_media_find_mbus_format(code, CS_SEL_ANY);
>  	if (!lcc) {
>  		lcc = imx_media_find_ipu_format(code, CS_SEL_YUV_RGB);
>  		if (!lcc)

-- 
Regards,

Laurent Pinchart
