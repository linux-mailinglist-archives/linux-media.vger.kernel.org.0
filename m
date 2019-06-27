Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A41357C3E
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 08:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfF0Gdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 02:33:53 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44779 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfF0Gdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 02:33:52 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hgNyg-00037l-N0; Thu, 27 Jun 2019 08:33:50 +0200
Message-ID: <1561617229.4216.1.camel@pengutronix.de>
Subject: Re: [PATCH] media: staging/imx: Fix NULL deref in
 find_pipeline_entity()
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Thu, 27 Jun 2019 08:33:49 +0200
In-Reply-To: <20190626185225.11992-1-slongerbeam@gmail.com>
References: <20190626185225.11992-1-slongerbeam@gmail.com>
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

On Wed, 2019-06-26 at 11:52 -0700, Steve Longerbeam wrote:
> Fix a cut&paste error in find_pipeline_entity(). The start entity must be
> passed to media_entity_to_video_device() in find_pipeline_entity(), not
> pad->entity. The pad is only put to use later, after determining the start
> entity is not the entity being searched for.
> 
> Fixes: 3ef46bc97ca2 ("media: staging/imx: Improve pipeline searching")
> 
> Reported-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index b5b8a3b7730a..6fb88c22ee27 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -842,7 +842,7 @@ find_pipeline_entity(struct media_entity *start, u32 grp_id,
>  		if (sd->grp_id & grp_id)
>  			return &sd->entity;
>  	} else if (buftype && is_media_entity_v4l2_video_device(start)) {
> -		vfd = media_entity_to_video_device(pad->entity);
> +		vfd = media_entity_to_video_device(start);
>  		if (buftype == vfd->queue->type)
>  			return &vfd->entity;
>  	}

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
