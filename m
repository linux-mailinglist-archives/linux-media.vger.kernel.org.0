Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E775E6970B0
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 23:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbjBNWZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 17:25:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjBNWZL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 17:25:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11134212B6
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 14:25:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34B093D7;
        Tue, 14 Feb 2023 23:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676413508;
        bh=RMgfw/rCJcCHor/qlc9hn0t4jGTrWJLDTwOLawT991Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J0z37hV4+iDkVKN3wjvA1apb+DD0k6OoFrB3MC+ZRp436Gm9tk7P95/7AzCMky98+
         z1D3aLyo9QBkkiDwWo6IWxRgzz54KSdZch4iTtfUzE7eGhAyOT4GzI6yi9U/SWGKFG
         5RGNbTnZvkdDBvzw3WIR+kT/J738HXmqUJs0xU0M=
Date:   Wed, 15 Feb 2023 00:25:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx-mipi-csis: Check csis_fmt validity before use
Message-ID: <Y+wKQ+SSY1hv+x30@pendragon.ideasonboard.com>
References: <20230214222024.165956-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230214222024.165956-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Tue, Feb 14, 2023 at 11:20:24PM +0100, Marek Vasut wrote:
> The find_csis_format() may return NULL in case supported format is not
> found, check the return value of find_csis_format() before using the
> result to avoid NULL pointer dereference.
> 
> Fixes: 11927d0fd0d0 ("media: imx-mipi-csis: Use V4L2 subdev active state")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index e99633565463e..8e307ca0b5688 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1108,6 +1108,8 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  	fmt = v4l2_subdev_get_pad_format(sd, state, CSIS_PAD_SOURCE);
>  	csis_fmt = find_csis_format(fmt->code);
>  	v4l2_subdev_unlock_state(state);
> +	if (!csis_fmt)
> +		return -EINVAL;

Oops.

I'd add a blank line before the check (I can handle this locally), apart
from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
>  	fd->num_entries = 1;

-- 
Regards,

Laurent Pinchart
