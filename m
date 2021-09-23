Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58071416127
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 16:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241707AbhIWOjG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 23 Sep 2021 10:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241702AbhIWOjF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 10:39:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F84CC061756
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 07:37:34 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mTPqu-0001bZ-GD; Thu, 23 Sep 2021 16:37:32 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mTPqt-0006Po-W7; Thu, 23 Sep 2021 16:37:31 +0200
Message-ID: <b26ba662abc999394a7381d4d412fc28fdf6aa39.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/3] media: imx6-mipi-csi2: use pre_streamon callback
 to set sensor into LP11
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de
Date:   Thu, 23 Sep 2021 16:37:31 +0200
In-Reply-To: <20210923105618.365513-2-m.tretter@pengutronix.de>
References: <20210923105618.365513-1-m.tretter@pengutronix.de>
         <20210923105618.365513-2-m.tretter@pengutronix.de>
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

Hi Michael,

On Thu, 2021-09-23 at 12:56 +0200, Michael Tretter wrote:
> Step 5 expects that the sensor is in LP11 mode. Use the new
> pre_streamon callback to signal the sensor that it should switch into
> LP11.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changelog:
> 
> v4:
> 
> - new patch
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index 9de0ebd439dc..4f19e2bce4bb 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -382,13 +382,17 @@ static int csi2_start(struct csi2_dev *csi2)
>  	csi2_enable(csi2, true);
>  
>  	/* Step 5 */
> +	ret = v4l2_subdev_call(csi2->src_sd, video, pre_streamon,
> +			       V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP);
> +	if (ret)
> +		goto err_assert_reset;

I think this should check for (ret && ret != -ENOIOCTLCMD) to avoid
breaking drivers that are still missing pre_streamon implementation.

regards
Philipp
