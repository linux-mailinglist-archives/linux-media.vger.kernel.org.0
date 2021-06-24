Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F7C3B35DC
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 20:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhFXSjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 14:39:06 -0400
Received: from gloria.sntech.de ([185.11.138.130]:36710 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhFXSjE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 14:39:04 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lwUDS-0000zY-Nu; Thu, 24 Jun 2021 20:36:42 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH 01/12] drm/panel: kd35t133: Add panel orientation support
Date:   Thu, 24 Jun 2021 20:36:41 +0200
Message-ID: <3142080.Ii9rTq9gLj@diego>
In-Reply-To: <20210624182612.177969-2-ezequiel@collabora.com>
References: <20210624182612.177969-1-ezequiel@collabora.com> <20210624182612.177969-2-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 24. Juni 2021, 20:26:01 CEST schrieb Ezequiel Garcia:
> Parse the device tree rotation specifier, and set a DRM
> connector orientation property. The property can then be read
> by compositors to apply hardware plane rotation or a GPU transform.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

similar patch already applied for 5.14:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/panel/panel-elida-kd35t133.c?id=610d9c311b1387f8c4ac602fee1f2a1cb0508707

> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index fe5ac3ef9018..5987d28c874c 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -39,6 +39,7 @@
>  struct kd35t133 {
>  	struct device *dev;
>  	struct drm_panel panel;
> +	enum drm_panel_orientation orientation;
>  	struct gpio_desc *reset_gpio;
>  	struct regulator *vdd;
>  	struct regulator *iovcc;
> @@ -216,6 +217,7 @@ static int kd35t133_get_modes(struct drm_panel *panel,
>  	connector->display_info.width_mm = mode->width_mm;
>  	connector->display_info.height_mm = mode->height_mm;
>  	drm_mode_probed_add(connector, mode);
> +	drm_connector_set_panel_orientation(connector, ctx->orientation);
>  
>  	return 1;
>  }
> @@ -258,6 +260,12 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>  		return ret;
>  	}
>  
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret) {
> +		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
> +		return ret;
> +	}
> +
>  	mipi_dsi_set_drvdata(dsi, ctx);
>  
>  	ctx->dev = dev;
> 




