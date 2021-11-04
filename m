Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460F74451D6
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 11:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhKDLBj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:01:39 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42071 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhKDLBj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 07:01:39 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D2317E0006;
        Thu,  4 Nov 2021 10:58:58 +0000 (UTC)
Date:   Thu, 4 Nov 2021 11:59:50 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     sakari.ailus@iki.fi,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: max9286: Depend on VIDEO_V4L2
Message-ID: <20211104105950.krejgjf6adwrztrc@uno.localdomain>
References: <20211102110243.1510895-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211102110243.1510895-1-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran

On Tue, Nov 02, 2021 at 11:02:43AM +0000, Kieran Bingham wrote:
> The MAX9286 has not explicitly declared a dependency upon VIDEO_V4L2.
> While this dependency has likely always been met by configurations
> including it, the device does use V4L2 core, and should depend upon it.
>
> Add VIDEO_V4L2 as a dependency to match other drivers and prevent
> failures when compile testing.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org> o

Thanks
   j

>
> ---
> v2:
>  - Split VIDEO_V4L2 to it's own line
>
> A bit of an RFC almost, as I haven't seen any failure on this, however
> this does stand out as different to other drivers, and the recent
> "max96712: Select VIDEO_V4L2" posting has shown that these deserialiser
> drivers could find themselves being compile tested in a manner which
> would other wise break.
>
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index d6a5d4ca439a..e9cfedf561d3 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -469,6 +469,7 @@ config VIDEO_VPX3220
>  config VIDEO_MAX9286
>  	tristate "Maxim MAX9286 GMSL deserializer support"
>  	depends on I2C && I2C_MUX
> +	depends on VIDEO_V4L2
>  	depends on OF_GPIO
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> --
> 2.30.2
>
