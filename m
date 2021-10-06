Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73E3424AA8
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 01:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbhJFXtC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 19:49:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53908 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhJFXtC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 19:49:02 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23FDA9DC;
        Thu,  7 Oct 2021 01:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633564028;
        bh=nm/kr59EOc4q6BF5/MSDvDQ0QQ9HzP+JNhyEymbxyFk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oD2yc5twOg2JsTGODl73GkX/led2qC6vIdoi2vbfp2UIBT86R/hBTNKJCSOKSVoWc
         giGSWxohZ08ui5DTE/erW68SktgVvw01zvZSpihyvB4uTuj8bJiH1HfsF0gL+czTO8
         +9PUd4z08rRwzkyu1XLFXsOhLFAmtvEx78rwX08Q=
Date:   Thu, 7 Oct 2021 02:46:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 07/11] media: Re-structure TI platform drivers
Message-ID: <YV41c2ortuLLXky9@pendragon.ideasonboard.com>
References: <20210915120240.21572-1-p.yadav@ti.com>
 <20210915120240.21572-8-p.yadav@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120240.21572-8-p.yadav@ti.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pratyush,

Thank you for the patch.

On Wed, Sep 15, 2021 at 05:32:36PM +0530, Pratyush Yadav wrote:
> The ti-vpe/ sub-directory does not only contain the VPE-specific things.
> It also contains the CAL driver, which is a completely different
> subsystem. This is also not a good place to add new drivers for other TI
> platforms since they will all get mixed up.
> 
> Separate the VPE and CAL parts into different sub-directories and rename
> the ti-vpe/ sub-directory to ti/. This is now the place where new TI
> platform drivers can be added.

That looks much better :-)

> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Compile tested only. There should be no functional change.
> 
> (no changes since v3)
> 
> Changes in v3:
> - Add Tomi's R-by.
> 
> Changes in v2:
> - New in v2.
> 
>  MAINTAINERS                                              | 3 ++-
>  drivers/media/platform/Makefile                          | 2 +-
>  drivers/media/platform/ti/Makefile                       | 3 +++
>  drivers/media/platform/ti/cal/Makefile                   | 3 +++
>  drivers/media/platform/{ti-vpe => ti/cal}/cal-camerarx.c | 0
>  drivers/media/platform/{ti-vpe => ti/cal}/cal-video.c    | 0
>  drivers/media/platform/{ti-vpe => ti/cal}/cal.c          | 0
>  drivers/media/platform/{ti-vpe => ti/cal}/cal.h          | 0
>  drivers/media/platform/{ti-vpe => ti/cal}/cal_regs.h     | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/Makefile       | 4 ----
>  drivers/media/platform/{ti-vpe => ti/vpe}/csc.c          | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/csc.h          | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/sc.c           | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/sc.h           | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/sc_coeff.h     | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.c        | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.h        | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/vpdma_priv.h   | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/vpe.c          | 0
>  drivers/media/platform/{ti-vpe => ti/vpe}/vpe_regs.h     | 0
>  20 files changed, 9 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/media/platform/ti/Makefile
>  create mode 100644 drivers/media/platform/ti/cal/Makefile
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal-camerarx.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal-video.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/cal}/cal_regs.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/Makefile (78%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/sc_coeff.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma_priv.h (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe.c (100%)
>  rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe_regs.h (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cad1289793db..62bc4a949ae1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18829,7 +18829,8 @@ W:	http://linuxtv.org/
>  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>  F:	Documentation/devicetree/bindings/media/ti,cal.yaml
>  F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
> -F:	drivers/media/platform/ti-vpe/
> +F:	drivers/media/platform/ti/cal/
> +F:	drivers/media/platform/ti/vpe/
>  
>  TI WILINK WIRELESS DRIVERS
>  L:	linux-wireless@vger.kernel.org
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 73ce083c2fc6..26d15b377a79 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -15,7 +15,7 @@ obj-$(CONFIG_VIDEO_PXA27x)	+= pxa_camera.o
>  
>  obj-$(CONFIG_VIDEO_VIU) += fsl-viu.o
>  
> -obj-y	+= ti-vpe/
> +obj-y	+= ti/
>  
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
>  obj-$(CONFIG_VIDEO_CODA)		+= coda/
> diff --git a/drivers/media/platform/ti/Makefile b/drivers/media/platform/ti/Makefile
> new file mode 100644
> index 000000000000..bbc737ccbbea
> --- /dev/null
> +++ b/drivers/media/platform/ti/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-y += cal/
> +obj-y += vpe/
> diff --git a/drivers/media/platform/ti/cal/Makefile b/drivers/media/platform/ti/cal/Makefile
> new file mode 100644
> index 000000000000..45ac35585f0b
> --- /dev/null
> +++ b/drivers/media/platform/ti/cal/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_TI_CAL) += ti-cal.o
> +ti-cal-y := cal.o cal-camerarx.o cal-video.o
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/cal-camerarx.c
> rename to drivers/media/platform/ti/cal/cal-camerarx.c
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/cal-video.c
> rename to drivers/media/platform/ti/cal/cal-video.c
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti/cal/cal.c
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/cal.c
> rename to drivers/media/platform/ti/cal/cal.c
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti/cal/cal.h
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/cal.h
> rename to drivers/media/platform/ti/cal/cal.h
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti/cal/cal_regs.h
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/cal_regs.h
> rename to drivers/media/platform/ti/cal/cal_regs.h
> diff --git a/drivers/media/platform/ti-vpe/Makefile b/drivers/media/platform/ti/vpe/Makefile
> similarity index 78%
> rename from drivers/media/platform/ti-vpe/Makefile
> rename to drivers/media/platform/ti/vpe/Makefile
> index ad624056e039..3fadfe084f87 100644
> --- a/drivers/media/platform/ti-vpe/Makefile
> +++ b/drivers/media/platform/ti/vpe/Makefile
> @@ -10,7 +10,3 @@ ti-sc-y := sc.o
>  ti-csc-y := csc.o
>  
>  ccflags-$(CONFIG_VIDEO_TI_VPE_DEBUG) += -DDEBUG
> -
> -obj-$(CONFIG_VIDEO_TI_CAL) += ti-cal.o
> -
> -ti-cal-y := cal.o cal-camerarx.o cal-video.o
> diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti/vpe/csc.c
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/csc.c
> rename to drivers/media/platform/ti/vpe/csc.c
> diff --git a/drivers/media/platform/ti-vpe/csc.h b/drivers/media/platform/ti/vpe/csc.h
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/csc.h
> rename to drivers/media/platform/ti/vpe/csc.h
> diff --git a/drivers/media/platform/ti-vpe/sc.c b/drivers/media/platform/ti/vpe/sc.c
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/sc.c
> rename to drivers/media/platform/ti/vpe/sc.c
> diff --git a/drivers/media/platform/ti-vpe/sc.h b/drivers/media/platform/ti/vpe/sc.h
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/sc.h
> rename to drivers/media/platform/ti/vpe/sc.h
> diff --git a/drivers/media/platform/ti-vpe/sc_coeff.h b/drivers/media/platform/ti/vpe/sc_coeff.h
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/sc_coeff.h
> rename to drivers/media/platform/ti/vpe/sc_coeff.h
> diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/vpdma.c
> rename to drivers/media/platform/ti/vpe/vpdma.c
> diff --git a/drivers/media/platform/ti-vpe/vpdma.h b/drivers/media/platform/ti/vpe/vpdma.h
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/vpdma.h
> rename to drivers/media/platform/ti/vpe/vpdma.h
> diff --git a/drivers/media/platform/ti-vpe/vpdma_priv.h b/drivers/media/platform/ti/vpe/vpdma_priv.h
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/vpdma_priv.h
> rename to drivers/media/platform/ti/vpe/vpdma_priv.h
> diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/vpe.c
> rename to drivers/media/platform/ti/vpe/vpe.c
> diff --git a/drivers/media/platform/ti-vpe/vpe_regs.h b/drivers/media/platform/ti/vpe/vpe_regs.h
> similarity index 100%
> rename from drivers/media/platform/ti-vpe/vpe_regs.h
> rename to drivers/media/platform/ti/vpe/vpe_regs.h

-- 
Regards,

Laurent Pinchart
