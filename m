Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3378563A6
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfFZHtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:49:16 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35795 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFZHtQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:49:16 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hg2g6-0007fg-EE; Wed, 26 Jun 2019 09:49:14 +0200
Message-ID: <1561535354.4870.2.camel@pengutronix.de>
Subject: Re: [PATCH 02/16] coda: set device_caps in struct video_device
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Date:   Wed, 26 Jun 2019 09:49:14 +0200
In-Reply-To: <20190626074421.38739-3-hverkuil-cisco@xs4all.nl>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
         <20190626074421.38739-3-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-06-26 at 09:44 +0200, Hans Verkuil wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/media/platform/coda/coda-common.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index 01428de2596e..73222c0615c0 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -390,9 +390,6 @@ static int coda_querycap(struct file *file, void *priv,
>  	strscpy(cap->card, coda_product_name(ctx->dev->devtype->product),
>  		sizeof(cap->card));
>  	strscpy(cap->bus_info, "platform:" CODA_NAME, sizeof(cap->bus_info));
> -	cap->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> -
>  	return 0;
>  }
>  
> @@ -2699,6 +2696,7 @@ static int coda_register_device(struct coda_dev *dev, int i)
>  	vfd->lock	= &dev->dev_mutex;
>  	vfd->v4l2_dev	= &dev->v4l2_dev;
>  	vfd->vfl_dir	= VFL_DIR_M2M;
> +	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
>  	video_set_drvdata(vfd, dev);
>  
>  	/* Not applicable, use the selection API instead */

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
