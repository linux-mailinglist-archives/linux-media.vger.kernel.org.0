Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBF62E9C04
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 18:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbhADR2c convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 4 Jan 2021 12:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbhADR2c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 12:28:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01004C061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 09:27:52 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTe2-0005I5-Lb; Mon, 04 Jan 2021 18:27:50 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTe2-0001yE-38; Mon, 04 Jan 2021 18:27:50 +0100
Message-ID: <7f4838ff6c777e1beeea1083f7170e254c1a6a2d.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] media: imx: Fix csc/scaler unregister
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Date:   Mon, 04 Jan 2021 18:27:49 +0100
In-Reply-To: <20201228122131.138454-2-ezequiel@collabora.com>
References: <20201228122131.138454-1-ezequiel@collabora.com>
         <20201228122131.138454-2-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-12-28 at 09:21 -0300, Ezequiel Garcia wrote:
> The csc/scaler device private struct is released by
> ipu_csc_scaler_video_device_release(), which can be called
> by video_unregister_device() if there are no users
> of the underlying struct video device.
> 
> Therefore, the mutex can't be held when calling
> video_unregister_device() as its memory may be freed
> by it, leading to a kernel oops.
> 
> Fortunately, the fix is quite simple as no locking
> is needed when calling video_unregister_device(): v4l2-core
> already has its own internal locking, and the structures
> are also properly refcounted.
> 
> Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/imx/imx-media-csc-scaler.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> index fab1155a5958..63a0204502a8 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -869,11 +869,7 @@ void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev)
>  	struct ipu_csc_scaler_priv *priv = vdev_to_priv(vdev);
>  	struct video_device *vfd = priv->vdev.vfd;
>  
> -	mutex_lock(&priv->mutex);
> -
>  	video_unregister_device(vfd);
> -
> -	mutex_unlock(&priv->mutex);
>  }
>  
>  struct imx_media_video_dev *

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
