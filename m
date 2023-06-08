Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70646727D55
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 12:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbjFHK4o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 06:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234897AbjFHK4n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 06:56:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F41C269F
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 03:56:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126033089000.35.openmobile.ne.jp [126.33.89.0])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA249480;
        Thu,  8 Jun 2023 12:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686221773;
        bh=aPsPnkgduMv/YP3V/VMIplKUS8eyOkbRHYoC2bXL2CM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bJRpBxVWhVjh/Woz9Sqg3XdcQ75al8dPXzMNFVzcfpSuNd0pgY1goI/SaD9U9M/SD
         BkYeVJapwc12nmkKmJqKvP73UtVrRuJ5Rk1ltfEr1HO80Jxcl3Vl3OcW4f8O8PF5Tg
         EZRo6q6AeraRABdvOnHpWZkZnSX7PLHnTC1UwzC8=
Date:   Thu, 8 Jun 2023 13:56:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Add an entry for V4L2 sensor and lens
 drivers
Message-ID: <20230608105637.GQ5058@pendragon.ideasonboard.com>
References: <20230608095157.4055544-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230608095157.4055544-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, Jun 08, 2023 at 12:51:57PM +0300, Sakari Ailus wrote:
> I maintain V4L2 sensor and lens drivers but there hasn't been a specific
> MAINTAINERS entry for them. Add it now.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The purpose is to help people cc me when sending sensor or lens driver
> patches. Of course I find the patches in Patchwork but this always
> introduces a delay in reviewing them.
> 
>  MAINTAINERS | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cec3c9ef43590..57aeca250bf4c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22084,6 +22084,21 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/clk/ux500/
>  
> +V4L2 SENSOR AND LENS DRIVERS
> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/i2c/ar*
> +F:	drivers/media/i2c/hi*
> +F:	drivers/media/i2c/imx*
> +F:	drivers/media/i2c/mt*
> +F:	drivers/media/i2c/og*
> +F:	drivers/media/i2c/ov*
> +F:	drivers/media/i2c/st-vgxy61.c
> +F:	drivers/media/i2c/dw*
> +F:	drivers/media/i2c/ak*
> +F:	drivers/media/i2c/lm*

This almost makes me think we should have sensor/ and lens/
directories...

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  VF610 NAND DRIVER
>  M:	Stefan Agner <stefan@agner.ch>
>  L:	linux-mtd@lists.infradead.org

-- 
Regards,

Laurent Pinchart
