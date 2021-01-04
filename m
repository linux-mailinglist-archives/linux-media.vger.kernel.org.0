Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E829F2E9BD7
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 18:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbhADRRk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 4 Jan 2021 12:17:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbhADRRk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 12:17:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2866DC061794
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 09:17:00 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTTW-0004IN-QO; Mon, 04 Jan 2021 18:16:58 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwTTW-00015u-2u; Mon, 04 Jan 2021 18:16:58 +0100
Message-ID: <d5fb07fd4f96373382d46b7ef88eaf331286e0e0.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] media: imx: Unregister csc/scaler only if registered
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Date:   Mon, 04 Jan 2021 18:16:57 +0100
In-Reply-To: <20201228122131.138454-1-ezequiel@collabora.com>
References: <20201228122131.138454-1-ezequiel@collabora.com>
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

Hi Ezequiel,

On Mon, 2020-12-28 at 09:21 -0300, Ezequiel Garcia wrote:
> The csc/scaler device pointer (imxmd->m2m_vdev) is assigned
> after the imx media device v4l2-async probe completes,
> therefore we need to check if the device is non-NULL
> before trying to unregister it.
> 
> This can be the case if the non-completed imx media device
> is unbinded (or the driver is removed), leading to a kernel oops.
> 
> Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/imx/imx-media-dev.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
> index 6d2205461e56..b6d5f844ad79 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -107,10 +107,14 @@ static int imx_media_remove(struct platform_device *pdev)
>  
>  	v4l2_info(&imxmd->v4l2_dev, "Removing imx-media\n");
>  
> +	if (imxmd->m2m_vdev) {

Thank you, it's even worse. If imx_media_csc_scaler_device_init() fails
in imx6_media_probe_complete(), imxmd->m2m_vdev contains an error value.

So either this should check

	if (!IS_ERR_OR_NULL(imxmd->m2m_vdev))

or (probably better) probe_complete should be changed as well.

> +		imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
> +		imxmd->m2m_vdev = NULL;
> +	}
> +
>  	v4l2_async_notifier_unregister(&imxmd->notifier);
>  	imx_media_unregister_ipu_internal_subdevs(imxmd);
>  	v4l2_async_notifier_cleanup(&imxmd->notifier);
> -	imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
>  	media_device_unregister(&imxmd->md);
>  	v4l2_device_unregister(&imxmd->v4l2_dev);
>  	media_device_cleanup(&imxmd->md);

regards
Philipp
