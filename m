Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359892E9C0C
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 18:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbhADRa1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 4 Jan 2021 12:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbhADRa1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 12:30:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CABC061793
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 09:29:46 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTft-0005Lh-CL; Mon, 04 Jan 2021 18:29:45 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTfs-0001zM-Gi; Mon, 04 Jan 2021 18:29:44 +0100
Message-ID: <11a2420acc2a6387137f10b07e542b749a395056.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] media: imx: Clean capture unregister
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Date:   Mon, 04 Jan 2021 18:29:44 +0100
In-Reply-To: <20201228122131.138454-3-ezequiel@collabora.com>
References: <20201228122131.138454-1-ezequiel@collabora.com>
         <20201228122131.138454-3-ezequiel@collabora.com>
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
> No locking is needed to call video_unregister_device(). Drop it.

The commit message should probably also mention that the superfluous
video_is_registered() check is dropped and media_entity_cleanup() and
video_unregister_device() are reordered.

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/imx/imx-media-capture.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index c1931eb2540e..e10ce103a5b4 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -816,14 +816,8 @@ void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev)
>  	struct capture_priv *priv = to_capture_priv(vdev);
>  	struct video_device *vfd = priv->vdev.vfd;
>  
> -	mutex_lock(&priv->mutex);
> -
> -	if (video_is_registered(vfd)) {
> -		video_unregister_device(vfd);
> -		media_entity_cleanup(&vfd->entity);
> -	}
> -
> -	mutex_unlock(&priv->mutex);
> +	media_entity_cleanup(&vfd->entity);
> +	video_unregister_device(vfd);
>  }
>  EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);

regards
Philipp
