Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD43D2EF6A9
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 18:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbhAHRnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 12:43:21 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53386 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbhAHRnU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 12:43:20 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A676E1F46CD9
Message-ID: <08b4a9c06e3468615ea55ed4d7d615b5139e1809.camel@collabora.com>
Subject: Re: [PATCH 05/75] media: imx: Compile imx6-media-objs only for
 CONFIG_VIDEO_IMX_CSI
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Date:   Fri, 08 Jan 2021 14:42:32 -0300
In-Reply-To: <20210105152852.5733-6-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-6-laurent.pinchart@ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-01-05 at 17:27 +0200, Laurent Pinchart wrote:
> imx6-media-objs contains a set of objects that are specific to the i.MX6
> IPU-based media subsystem. They're not needed for the i.MX7 CSI. Only
> compile them if CONFIG_VIDEO_IMX_CSI is selected.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/Makefile | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> index 9bd9e873ba7c..6ac33275cc97 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -1,16 +1,16 @@
>  # SPDX-License-Identifier: GPL-2.0
> +imx-media-common-objs := imx-media-capture.o imx-media-dev-common.o \
> +       imx-media-of.o imx-media-utils.o
> +
>  imx6-media-objs := imx-media-dev.o imx-media-internal-sd.o \
>         imx-ic-common.o imx-ic-prp.o imx-ic-prpencvf.o imx-media-vdic.o \
>         imx-media-csc-scaler.o
>  
> -imx-media-common-objs := imx-media-capture.o imx-media-dev-common.o \
> -       imx-media-of.o imx-media-utils.o
> -
>  imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
>  
> -obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
>  obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
>  
> +obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media.o
>  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
>  

Nice change. This shows more clearly what's shared and what not.

Would it be too hard to walk the extra kilometer (not necesarily now,
not necesarily looking at you do it) split imx6 and imx7 better,
so we can start thinking what's needed to destage imx6?

I don't think the imx6 support is all that bad that it has
to live in staging.

Thanks,
Ezequiel


