Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC4E3264E1
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 16:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhBZPqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 10:46:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51592 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhBZPqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 10:46:37 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5FA6580;
        Fri, 26 Feb 2021 16:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614354354;
        bh=0ydT2Er4WhkOrRj5u74fXxuLeYM2FKvTlCHDdJyCpzQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J/N2ZK9iy/hoReTyaBjaTc5Y3LOAn0T0RUVmjd4FNCphn3xx5vvfxb3/aenQIYOCV
         Pt6cSLCPSGKnvLSrCxCT+3NY74LZDe9pUAp+LApE0rSB4/7/3vf1dRnWcqAfvUHbcQ
         G39uCLt3cCy6rlE/hgWziWxU+lk0uQz4aP8U85GU=
Date:   Fri, 26 Feb 2021 17:45:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 04/77] media: imx: Compile imx6-media-objs only for
 CONFIG_VIDEO_IMX_CSI
Message-ID: <YDkXlhxeFpVAtwOl@pendragon.ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210215042741.28850-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210215042741.28850-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please ignore this patch, it's a rebase leftover and isn't useful.

Reviews for the rest of the series, however, would be nice ;-)

On Mon, Feb 15, 2021 at 06:26:28AM +0200, Laurent Pinchart wrote:
> imx6-media-objs contains a set of objects that are specific to the i.MX6
> IPU-based media subsystem. They're not needed for the i.MX7 CSI. Only
> compile them if CONFIG_VIDEO_IMX_CSI is selected.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/imx/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> index 69cc5da04a2e..6ac33275cc97 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -1,11 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
> +imx-media-common-objs := imx-media-capture.o imx-media-dev-common.o \
> +	imx-media-of.o imx-media-utils.o
> +
>  imx6-media-objs := imx-media-dev.o imx-media-internal-sd.o \
>  	imx-ic-common.o imx-ic-prp.o imx-ic-prpencvf.o imx-media-vdic.o \
>  	imx-media-csc-scaler.o
>  
> -imx-media-common-objs := imx-media-capture.o imx-media-dev-common.o \
> -	imx-media-of.o imx-media-utils.o
> -
>  imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
>  
>  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o

-- 
Regards,

Laurent Pinchart
