Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E976D9B7D2
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 22:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392565AbfHWUpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 16:45:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39822 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392116AbfHWUpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 16:45:23 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 036252B2;
        Fri, 23 Aug 2019 22:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566593120;
        bh=GXdixniZ3Ns93+fHiCSuGwQdkf5l0zSVZr1Is85+O+s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DzfersEOoRJak3zOwE9B4hNyWqYQ9PM6vtwQ8r63BzQePsDhmQHZE9MpgOLoNYabS
         8uqAxfK6wU/GD/8KNMXy+5IuEBsBYfBSQNgkNFR3c+h13IaGBDYrpT6H/YqfMbqUlV
         Uab3mOaL4XvidC1ef4qZOiM83EMussD1bNDUfhMI=
Date:   Fri, 23 Aug 2019 23:45:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Andy Walls <awalls@md.metrocast.net>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Ismael Luceno <ismael@iodev.co.uk>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Benoit Parrot <bparrot@ti.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v2 5/7] media: use the BIT() macro
Message-ID: <20190823204513.GF4791@pendragon.ideasonboard.com>
References: <20190823000829.GN5027@pendragon.ideasonboard.com>
 <d6c04bf604084af63fec603b4afbd72c648e0394.1566553525.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d6c04bf604084af63fec603b4afbd72c648e0394.1566553525.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Fri, Aug 23, 2019 at 06:47:30AM -0300, Mauro Carvalho Chehab wrote:
> As warned by cppcheck:
> 
> 	[drivers/media/dvb-frontends/cx24123.c:434]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 	[drivers/media/pci/bt8xx/bttv-input.c:87]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 	[drivers/media/pci/bt8xx/bttv-input.c:98]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 			...
> 	[drivers/media/v4l2-core/v4l2-ioctl.c:1391]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
> 
> There are lots of places where we're doing 1 << 31. That's bad,
> as, depending on the architecture, this has an undefined behavior.
> 
> The BIT() macro is already prepared to handle this, so, let's
> just switch all "1 << number" macros by BIT(number) at the header files
> with has 1 << 31.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
> 
> v2: 
>   As suggested by Laurent:
>      - Don't touch multi-bit masks
>      - remove explicit casts
> 
>  drivers/media/pci/cobalt/cobalt-driver.h      |  63 +-
>  drivers/media/pci/ivtv/ivtv-irq.h             |  28 +-
>  drivers/media/pci/mantis/mantis_reg.h         | 152 ++---
>  drivers/media/pci/solo6x10/solo6x10-regs.h    | 286 ++++-----
>  .../media/platform/am437x/am437x-vpfe_regs.h  |  26 +-
>  .../media/platform/davinci/dm644x_ccdc_regs.h |  20 +-
>  .../media/platform/exynos4-is/fimc-lite-reg.h |  80 +--
>  drivers/media/platform/exynos4-is/fimc-reg.h  | 138 +++--
>  drivers/media/platform/omap3isp/ispreg.h      | 580 +++++++++---------
>  drivers/media/platform/s3c-camif/camif-regs.h | 118 ++--
>  drivers/media/platform/tegra-cec/tegra_cec.h  |  80 +--
>  drivers/media/platform/ti-vpe/vpe_regs.h      |  94 +--
>  drivers/media/platform/vsp1/vsp1_regs.h       | 224 +++----
>  drivers/media/platform/xilinx/xilinx-vip.h    |  29 +-
>  drivers/media/radio/wl128x/fmdrv_common.h     |  88 +--
>  drivers/staging/media/ipu3/ipu3-tables.h      |   4 +-
>  16 files changed, 1011 insertions(+), 999 deletions(-)

[snip]

> diff --git a/drivers/media/platform/omap3isp/ispreg.h b/drivers/media/platform/omap3isp/ispreg.h
> index 38e2b99b3f10..4c6ebc0b74d1 100644
> --- a/drivers/media/platform/omap3isp/ispreg.h
> +++ b/drivers/media/platform/omap3isp/ispreg.h

[snip]

> @@ -1167,14 +1167,14 @@
>  #define ISPHIST_HV_INFO_MASK			0x3FFF3FFF
>  
>  #define ISPCCDC_LSC_ENABLE			1

This is a bit too, it could be replaced with BIT(0).

> -#define ISPCCDC_LSC_BUSY			(1 << 7)
> +#define ISPCCDC_LSC_BUSY			BIT(7)
>  #define ISPCCDC_LSC_GAIN_MODE_N_MASK		0x700
>  #define ISPCCDC_LSC_GAIN_MODE_N_SHIFT		8
>  #define ISPCCDC_LSC_GAIN_MODE_M_MASK		0x3800
>  #define ISPCCDC_LSC_GAIN_MODE_M_SHIFT		12
>  #define ISPCCDC_LSC_GAIN_FORMAT_MASK		0xE
>  #define ISPCCDC_LSC_GAIN_FORMAT_SHIFT		1
> -#define ISPCCDC_LSC_AFTER_REFORMATTER_MASK	(1<<6)
> +#define ISPCCDC_LSC_AFTER_REFORMATTER_MASK	BIT(6)
>  
>  #define ISPCCDC_LSC_INITIAL_X_MASK		0x3F
>  #define ISPCCDC_LSC_INITIAL_X_SHIFT		0

[snip]

With this small issue addressed,

For omap3isp, vsp1, xilinx, wl128x and ipu3,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
