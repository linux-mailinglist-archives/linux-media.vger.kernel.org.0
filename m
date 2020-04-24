Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5852B1B75F7
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 14:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgDXMyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 08:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgDXMyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 08:54:16 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1288CC09B045;
        Fri, 24 Apr 2020 05:54:16 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E0DE32A2C38
Message-ID: <cf31ae67792aedf60ee4cf8002861edadc305314.camel@collabora.com>
Subject: Re: [PATCH v2 3/4] media: rockchip: rga: Add support for the PX30
 compatible
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        justin.swartz@risingedge.co.za, Johan Jonker <jbx6244@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Fri, 24 Apr 2020 09:54:04 -0300
In-Reply-To: <20200423200937.1039257-4-paul.kocialkowski@bootlin.com>
References: <20200423200937.1039257-1-paul.kocialkowski@bootlin.com>
         <20200423200937.1039257-4-paul.kocialkowski@bootlin.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Paul,

Thanks for the patch!

On Thu, 2020-04-23 at 22:09 +0200, Paul Kocialkowski wrote:
> The PX30 SoC has a RGA block, so add the associated compatible to
> support it.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 9d122429706e..4fb4615662b7 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -955,6 +955,9 @@ static const struct dev_pm_ops rga_pm = {
>  };
>  
>  static const struct of_device_id rockchip_rga_match[] = {
> +	{
> +		.compatible = "rockchip,px30-rga",
> +	},

Please note that if you don't have anything px30-specific,
then you don't need the compatible in the driver.

You can have something like:

compatible = "rockchip,px30-rga", "rockchip,rk3288-rga"

so you need to add it to the bindings. See Justin Swartz
recent patches for rk3228.

Down the road, if you find something specific for px30,
you can make the driver aware. 

Cheers,
Ezequiel

