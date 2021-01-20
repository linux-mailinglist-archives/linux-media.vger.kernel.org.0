Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B45D2FCE94
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 12:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbhATKbS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:31:18 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54277 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731191AbhATJVb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:21:31 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 517C120016;
        Wed, 20 Jan 2021 09:20:46 +0000 (UTC)
Date:   Wed, 20 Jan 2021 10:21:05 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: i2c/Kconfig: Select FWNODE for OV772x sensor
Message-ID: <20210120092105.niausxf2dfe46p7p@uno.localdomain>
References: <20210120090148.30598-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210120090148.30598-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Wed, Jan 20, 2021 at 09:01:48AM +0000, Lad Prabhakar wrote:
> Fix OV772x build breakage by selecting V4L2_FWNODE config:
>
> ia64-linux-ld: drivers/media/i2c/ov772x.o: in function `ov772x_probe':
> ov772x.c:(.text+0x1ee2): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
> ia64-linux-ld: ov772x.c:(.text+0x1f12): undefined reference to `v4l2_fwnode_endpoint_free'
> ia64-linux-ld: ov772x.c:(.text+0x2212): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
>
> Fixes: 8a10b4e3601e ("media: i2c: ov772x: Parse endpoint properties")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

You beat me to it, I was about to hit send for the same patch :)

Thanks!
Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> ---
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index eddb10220953..bb1b5a340431 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1013,6 +1013,7 @@ config VIDEO_OV772X
>  	tristate "OmniVision OV772x sensor support"
>  	depends on I2C && VIDEO_V4L2
>  	select REGMAP_SCCB
> +	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV772x camera.
> --
> 2.17.1
>
