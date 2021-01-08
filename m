Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BF92EF697
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 18:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbhAHRio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 12:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbhAHRin (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 12:38:43 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC91C0612FD
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 09:38:03 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 19A1B1F4675E
Message-ID: <1d2eb33ad845e09313cd25e7d5fb35527f29b880.camel@collabora.com>
Subject: Re: [PATCH 31/75] media: imx: capture: Support creating immutable
 link to capture device
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Date:   Fri, 08 Jan 2021 14:37:54 -0300
In-Reply-To: <20210105152852.5733-32-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-32-laurent.pinchart@ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, 2021-01-05 at 17:28 +0200, Laurent Pinchart wrote:
> When the subdevice connected to the capture device has a single possible
> sink, there's no point in making the link mutable. Support creating
> immutable links.
> 

Does this apply to csi2_notify_bound as welll
that is, is there any point in making the sensor link mutable?
 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx-ic-prpencvf.c   | 2 +-
>  drivers/staging/media/imx/imx-media-capture.c | 7 +++++--
>  drivers/staging/media/imx/imx-media-csi.c     | 2 +-
>  drivers/staging/media/imx/imx-media.h         | 3 ++-
>  drivers/staging/media/imx/imx7-media-csi.c    | 2 +-
>  5 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index 88d69425e1b3..6c9c75ffb30c 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -1269,7 +1269,7 @@ static int prp_registered(struct v4l2_subdev *sd)
>         if (IS_ERR(priv->vdev))
>                 return PTR_ERR(priv->vdev);
>  
> -       ret = imx_media_capture_device_register(priv->vdev);
> +       ret = imx_media_capture_device_register(priv->vdev, false);

Maybe it's just me, but I dislike this boolean parameter pattern,
as opposed to passing the flags directly, or some other MUTABLE/IMMUTABLE
enum value.

Cheers,
Ezequiel

