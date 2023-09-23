Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF2837AC44B
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 20:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbjIWSGR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 14:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbjIWSGQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 14:06:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9037FF7
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 11:06:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20BBE4DB;
        Sat, 23 Sep 2023 20:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695492267;
        bh=RSlfBwPUWqwTDmT1ya5Geq0+mRo3zu6WFHfxOU+qQqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nvgFB4ZAUmfPQut3uVj58bHVpKvsIanaOd0oCGCWLhxGKTpDDrmxJdCII/yZ7ohZZ
         784n5M06BXRprwjSVRzlx8UPcRlBzmd29lW6d7JuqzgtTmn/9BnUGop7tAjH2O3IfI
         L7MU3u6nuh4DhWVjCq9bKfyUMpv0brpAeHxi+cfk=
Date:   Sat, 23 Sep 2023 21:06:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCHv2 13/23] media: use sizeof() instead of
 V4L2_SUBDEV_NAME_SIZE
Message-ID: <20230923180618.GL19112@pendragon.ideasonboard.com>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
 <20230923152107.283289-14-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230923152107.283289-14-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Sat, Sep 23, 2023 at 05:20:57PM +0200, Hans Verkuil wrote:
> Don't rely on a define, let the compiler use the actual
> field size.
> 
> Remove all uses of the V4L2_SUBDEV_NAME_SIZE define and also
> drop the define itself.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/msp3400-driver.c                  | 2 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c        | 4 ++--
>  drivers/media/platform/cadence/cdns-csi2tx.c        | 4 ++--
>  drivers/media/platform/renesas/rcar-isp.c           | 2 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-csi2.c | 2 +-
>  drivers/media/platform/ti/omap3isp/ispstat.c        | 2 +-
>  drivers/staging/media/tegra-video/csi.c             | 4 ++--
>  drivers/staging/media/tegra-video/vip.c             | 2 +-
>  include/media/v4l2-subdev.h                         | 4 +---
>  9 files changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
> index bec76801487a..0ed8561edfee 100644
> --- a/drivers/media/i2c/msp3400-driver.c
> +++ b/drivers/media/i2c/msp3400-driver.c
> @@ -561,7 +561,7 @@ static int msp_log_status(struct v4l2_subdev *sd)
>  	struct msp_state *state = to_state(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	const char *p;
> -	char prefix[V4L2_SUBDEV_NAME_SIZE + 20];
> +	char prefix[sizeof(sd->name) + 20];
>  
>  	if (state->opmode == OPMODE_AUTOSELECT)
>  		msp_detect_stereo(client);
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 0d879d71d818..b9d9058e2ce3 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -516,8 +516,8 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	csi2rx->subdev.dev = &pdev->dev;
>  	v4l2_subdev_init(&csi2rx->subdev, &csi2rx_subdev_ops);
>  	v4l2_set_subdevdata(&csi2rx->subdev, &pdev->dev);
> -	snprintf(csi2rx->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s.%s",
> -		 KBUILD_MODNAME, dev_name(&pdev->dev));
> +	snprintf(csi2rx->subdev.name, sizeof(csi2rx->subdev.name),
> +		 "%s.%s", KBUILD_MODNAME, dev_name(&pdev->dev));
>  
>  	/* Create our media pads */
>  	csi2rx->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
> index cbbb77520112..c115742f347f 100644
> --- a/drivers/media/platform/cadence/cdns-csi2tx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2tx.c
> @@ -592,8 +592,8 @@ static int csi2tx_probe(struct platform_device *pdev)
>  	csi2tx->subdev.owner = THIS_MODULE;
>  	csi2tx->subdev.dev = &pdev->dev;
>  	csi2tx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> -	snprintf(csi2tx->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s.%s",
> -		 KBUILD_MODNAME, dev_name(&pdev->dev));
> +	snprintf(csi2tx->subdev.name, sizeof(csi2tx->subdev.name),
> +		 "%s.%s", KBUILD_MODNAME, dev_name(&pdev->dev));
>  
>  	ret = csi2tx_check_lanes(csi2tx);
>  	if (ret)
> diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
> index 7360cf3863f2..19a005d83733 100644
> --- a/drivers/media/platform/renesas/rcar-isp.c
> +++ b/drivers/media/platform/renesas/rcar-isp.c
> @@ -467,7 +467,7 @@ static int risp_probe(struct platform_device *pdev)
>  	isp->subdev.dev = &pdev->dev;
>  	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
>  	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
> -	snprintf(isp->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
> +	snprintf(isp->subdev.name, sizeof(isp->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
>  	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>  
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> index f6326df0b09b..66fe553a00e7 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> @@ -1889,7 +1889,7 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	priv->subdev.dev = &pdev->dev;
>  	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
> -	snprintf(priv->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
> +	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
>  	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>  
> diff --git a/drivers/media/platform/ti/omap3isp/ispstat.c b/drivers/media/platform/ti/omap3isp/ispstat.c
> index 68cf68dbcace..359a846205b0 100644
> --- a/drivers/media/platform/ti/omap3isp/ispstat.c
> +++ b/drivers/media/platform/ti/omap3isp/ispstat.c
> @@ -1039,7 +1039,7 @@ static int isp_stat_init_entities(struct ispstat *stat, const char *name,
>  	struct media_entity *me = &subdev->entity;
>  
>  	v4l2_subdev_init(subdev, sd_ops);
> -	snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "OMAP3 ISP %s", name);
> +	snprintf(subdev->name, sizeof(subdev->name), "OMAP3 ISP %s", name);
>  	subdev->grp_id = BIT(16);	/* group ID for isp subdevs */
>  	subdev->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	v4l2_set_subdevdata(subdev, stat);
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
> index e79657920dc8..9aa72863c213 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -607,10 +607,10 @@ static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
>  	v4l2_subdev_init(subdev, &tegra_csi_ops);
>  	subdev->dev = csi->dev;
>  	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> -		snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
> +		snprintf(subdev->name, sizeof(subdev->name), "%s-%d", "tpg",
>  			 chan->csi_port_nums[0]);
>  	else
> -		snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s",
> +		snprintf(subdev->name, sizeof(subdev->name), "%s",
>  			 kbasename(chan->of_node->full_name));
>  
>  	v4l2_set_subdevdata(subdev, chan);
> diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
> index 191ecd19a6a7..e95cc7bb190e 100644
> --- a/drivers/staging/media/tegra-video/vip.c
> +++ b/drivers/staging/media/tegra-video/vip.c
> @@ -163,7 +163,7 @@ static int tegra_vip_channel_init(struct tegra_vip *vip)
>  	subdev = &vip->chan.subdev;
>  	v4l2_subdev_init(subdev, &tegra_vip_ops);
>  	subdev->dev = vip->dev;
> -	snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s",
> +	snprintf(subdev->name, sizeof(subdev->name), "%s",
>  		 kbasename(vip->chan.of_node->full_name));
>  
>  	v4l2_set_subdevdata(subdev, &vip->chan);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 5711354056b9..c1f90c1223a7 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -951,8 +951,6 @@ struct v4l2_subdev_internal_ops {
>  	void (*release)(struct v4l2_subdev *sd);
>  };
>  
> -#define V4L2_SUBDEV_NAME_SIZE 52
> -
>  /* Set this flag if this subdev is a i2c device. */
>  #define V4L2_SUBDEV_FL_IS_I2C			(1U << 0)
>  /* Set this flag if this subdev is a spi device. */
> @@ -1062,7 +1060,7 @@ struct v4l2_subdev {
>  	const struct v4l2_subdev_ops *ops;
>  	const struct v4l2_subdev_internal_ops *internal_ops;
>  	struct v4l2_ctrl_handler *ctrl_handler;
> -	char name[V4L2_SUBDEV_NAME_SIZE];
> +	char name[52];
>  	u32 grp_id;
>  	void *dev_priv;
>  	void *host_priv;

-- 
Regards,

Laurent Pinchart
