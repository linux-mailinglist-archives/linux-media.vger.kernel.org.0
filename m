Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361FA347B32
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 15:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236405AbhCXOxv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 10:53:51 -0400
Received: from gloria.sntech.de ([185.11.138.130]:34780 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236399AbhCXOxS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 10:53:18 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lP4sX-0000qF-Gw; Wed, 24 Mar 2021 15:53:01 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     dri-devel@lists.freedesktop.org,
        Helen Koike <helen.koike@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, robh+dt@kernel.org,
        sebastian.fricke@posteo.net, linux-media@vger.kernel.org,
        dafna.hirschfeld@collabora.com, ezequiel@collabora.com,
        cmuellner@linux.com
Subject: Re: [PATCH 3/6] drm/rockchip: dsi: add ability to work as a phy instead of full dsi
Date:   Wed, 24 Mar 2021 15:52:59 +0100
Message-ID: <12741091.uLZWGnKmhe@diego>
In-Reply-To: <d7b8137c-66ce-935a-c8d7-e507146143d7@collabora.com>
References: <20210210111020.2476369-1-heiko@sntech.de> <20210210111020.2476369-4-heiko@sntech.de> <d7b8137c-66ce-935a-c8d7-e507146143d7@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Montag, 15. Februar 2021, 15:33:19 CET schrieb Helen Koike:
> > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> > index cb25c0e8fc9b..3094d4533ad6 100644
> > --- a/drivers/gpu/drm/rockchip/Kconfig
> > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > @@ -9,6 +9,8 @@ config DRM_ROCKCHIP
> >   	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> >   	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
> >   	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> > +	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
> > +	select GENERIC_PHY_MIPI_DPHY if ROCKCHIP_DW_MIPI_DSI
> 
> maybe alphabetical order?

ok

> > +static int dw_mipi_dsi_dphy_power_on(struct phy *phy)
> > +{
> > +	struct dw_mipi_dsi_rockchip *dsi = phy_get_drvdata(phy);
> > +	int i, ret;
> 
> It seems "i" could be removed, use ret instead.

I don't think so

I.e. the driver does

	i = max_mbps_to_parameter(...)
	...
	ret = power-on-clocks-and-stuff
	...
	dw_mipi_dsi_phy_write(.... dppa_map[i].hsfreqrange)

So will need to keep the param index separate.


> In general, the patch doesn't look wrong to me.
> 
> For the whole serie:
> Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks a lot :-)


Heiko


