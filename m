Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 399879A429
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 02:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbfHWAIr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 20:08:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53282 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbfHWAIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 20:08:46 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2527F2B2;
        Fri, 23 Aug 2019 02:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566518916;
        bh=AB94zKRv7Sbka5kCW38QMnYx6xpH7uvNNgj5Tc7X/kU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FMIl6zL62Q9s0ZQFeFwoo5OoHDl0v3W6aXZ6DI0tOLceX1QgWpn9uTfiqEdeH6xsG
         P72oL5rMu0wIN0u3wAAlptldfh+4eSdQv/zgbIvNHjSrn7DOIbrYVksfYcb2rZlzuo
         0VZb6kC1341OsKsLJkSMRCD/apGdORKs+4E7v2fk=
Date:   Fri, 23 Aug 2019 03:08:29 +0300
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
        Allison Randal <allison@lohutok.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH 5/7] media: use the BIT() macro
Message-ID: <20190823000829.GN5027@pendragon.ideasonboard.com>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
 <c98344166a27f771db7f6379378080b04c06c814.1566502743.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c98344166a27f771db7f6379378080b04c06c814.1566502743.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Thu, Aug 22, 2019 at 04:39:32PM -0300, Mauro Carvalho Chehab wrote:
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
>  drivers/media/pci/cobalt/cobalt-driver.h      |  63 +-
>  drivers/media/pci/ivtv/ivtv-irq.h             |  28 +-
>  drivers/media/pci/mantis/mantis_reg.h         | 156 ++---
>  drivers/media/pci/solo6x10/solo6x10-regs.h    | 290 ++++-----
>  .../media/platform/am437x/am437x-vpfe_regs.h  |  28 +-
>  .../media/platform/davinci/dm644x_ccdc_regs.h |  22 +-
>  .../media/platform/exynos4-is/fimc-lite-reg.h |  86 +--
>  drivers/media/platform/exynos4-is/fimc-reg.h  | 172 ++---
>  drivers/media/platform/omap3isp/ispreg.h      | 592 +++++++++---------
>  drivers/media/platform/s3c-camif/camif-regs.h | 128 ++--
>  drivers/media/platform/tegra-cec/tegra_cec.h  |  80 +--
>  drivers/media/platform/ti-vpe/vpe_regs.h      |  94 +--
>  drivers/media/platform/vsp1/vsp1_regs.h       | 254 ++++----
>  drivers/media/platform/xilinx/xilinx-vip.h    |  33 +-
>  drivers/media/radio/wl128x/fmdrv_common.h     |  88 +--
>  drivers/staging/media/ipu3/ipu3-tables.h      |   4 +-
>  16 files changed, 1065 insertions(+), 1053 deletions(-)
> 
> diff --git a/drivers/media/pci/cobalt/cobalt-driver.h b/drivers/media/pci/cobalt/cobalt-driver.h
> index 429bee4ef79c..14b8ca2daa17 100644
> --- a/drivers/media/pci/cobalt/cobalt-driver.h
> +++ b/drivers/media/pci/cobalt/cobalt-driver.h
> @@ -10,6 +10,7 @@
>  
>  #ifndef COBALT_DRIVER_H
>  #define COBALT_DRIVER_H
> +#include <linux/bitops.h>
>  

The blank line should go before the header, not after.

>  #include <linux/module.h>
>  #include <linux/pci.h>

[snip]

> diff --git a/drivers/media/platform/omap3isp/ispreg.h b/drivers/media/platform/omap3isp/ispreg.h
> index 38e2b99b3f10..197f8f43c8fc 100644
> --- a/drivers/media/platform/omap3isp/ispreg.h
> +++ b/drivers/media/platform/omap3isp/ispreg.h
> @@ -45,7 +45,7 @@
>  
>  #define ISPCCP2_REVISION		(0x000)
>  #define ISPCCP2_SYSCONFIG		(0x004)
> -#define ISPCCP2_SYSCONFIG_SOFT_RESET	(1 << 1)
> +#define ISPCCP2_SYSCONFIG_SOFT_RESET	BIT(1)
>  #define ISPCCP2_SYSCONFIG_AUTO_IDLE		0x1
>  #define ISPCCP2_SYSCONFIG_MSTANDBY_MODE_SHIFT	12
>  #define ISPCCP2_SYSCONFIG_MSTANDBY_MODE_FORCE	\
> @@ -55,44 +55,44 @@
>  #define ISPCCP2_SYSCONFIG_MSTANDBY_MODE_SMART	\
>  	(0x2 << ISPCCP2_SYSCONFIG_MSTANDBY_MODE_SHIFT)
>  #define ISPCCP2_SYSSTATUS		(0x008)
> -#define ISPCCP2_SYSSTATUS_RESET_DONE	(1 << 0)
> +#define ISPCCP2_SYSSTATUS_RESET_DONE	BIT(0)
>  #define ISPCCP2_LC01_IRQENABLE		(0x00C)
>  #define ISPCCP2_LC01_IRQSTATUS		(0x010)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_FS_IRQ	(1 << 11)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_LE_IRQ	(1 << 10)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_LS_IRQ	(1 << 9)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_FE_IRQ	(1 << 8)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_COUNT_IRQ	(1 << 7)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_FIFO_OVF_IRQ	(1 << 5)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_CRC_IRQ	(1 << 4)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_FSP_IRQ	(1 << 3)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_FW_IRQ	(1 << 2)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_FSC_IRQ	(1 << 1)
> -#define ISPCCP2_LC01_IRQSTATUS_LC0_SSC_IRQ	(1 << 0)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_FS_IRQ	BIT(11)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_LE_IRQ	BIT(10)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_LS_IRQ	BIT(9)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_FE_IRQ	BIT(8)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_COUNT_IRQ	BIT(7)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_FIFO_OVF_IRQ	BIT(5)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_CRC_IRQ	BIT(4)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_FSP_IRQ	BIT(3)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_FW_IRQ	BIT(2)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_FSC_IRQ	BIT(1)
> +#define ISPCCP2_LC01_IRQSTATUS_LC0_SSC_IRQ	BIT(0)
>  
>  #define ISPCCP2_LC23_IRQENABLE		(0x014)
>  #define ISPCCP2_LC23_IRQSTATUS		(0x018)
>  #define ISPCCP2_LCM_IRQENABLE		(0x02C)
> -#define ISPCCP2_LCM_IRQSTATUS_EOF_IRQ		(1 << 0)
> -#define ISPCCP2_LCM_IRQSTATUS_OCPERROR_IRQ	(1 << 1)
> +#define ISPCCP2_LCM_IRQSTATUS_EOF_IRQ		BIT(0)
> +#define ISPCCP2_LCM_IRQSTATUS_OCPERROR_IRQ	BIT(1)
>  #define ISPCCP2_LCM_IRQSTATUS		(0x030)
>  #define ISPCCP2_CTRL			(0x040)
> -#define ISPCCP2_CTRL_IF_EN		(1 << 0)
> -#define ISPCCP2_CTRL_PHY_SEL		(1 << 1)
> +#define ISPCCP2_CTRL_IF_EN		BIT(0)
> +#define ISPCCP2_CTRL_PHY_SEL		BIT(1)
>  #define ISPCCP2_CTRL_PHY_SEL_CLOCK	(0 << 1)
> -#define ISPCCP2_CTRL_PHY_SEL_STROBE	(1 << 1)
> +#define ISPCCP2_CTRL_PHY_SEL_STROBE	BIT(1)

Please don't replace this one, as it defines the value of a field, not a
bit. Otherwise it will not match ISPCCP2_CTRL_PHY_SEL_CLOCK and will be
confusing.

>  #define ISPCCP2_CTRL_PHY_SEL_MASK	0x1
>  #define ISPCCP2_CTRL_PHY_SEL_SHIFT	1
> -#define ISPCCP2_CTRL_IO_OUT_SEL		(1 << 2)
> +#define ISPCCP2_CTRL_IO_OUT_SEL		BIT(2)
>  #define ISPCCP2_CTRL_IO_OUT_SEL_MASK	0x1
>  #define ISPCCP2_CTRL_IO_OUT_SEL_SHIFT	2
> -#define ISPCCP2_CTRL_MODE		(1 << 4)
> -#define ISPCCP2_CTRL_VP_CLK_FORCE_ON	(1 << 9)
> -#define ISPCCP2_CTRL_INV		(1 << 10)
> +#define ISPCCP2_CTRL_MODE		BIT(4)
> +#define ISPCCP2_CTRL_VP_CLK_FORCE_ON	BIT(9)
> +#define ISPCCP2_CTRL_INV		BIT(10)
>  #define ISPCCP2_CTRL_INV_MASK		0x1
>  #define ISPCCP2_CTRL_INV_SHIFT		10
> -#define ISPCCP2_CTRL_VP_ONLY_EN		(1 << 11)
> -#define ISPCCP2_CTRL_VP_CLK_POL		(1 << 12)
> +#define ISPCCP2_CTRL_VP_ONLY_EN		BIT(11)
> +#define ISPCCP2_CTRL_VP_CLK_POL		BIT(12)
>  #define ISPCCP2_CTRL_VP_CLK_POL_MASK	0x1
>  #define ISPCCP2_CTRL_VP_CLK_POL_SHIFT	12
>  #define ISPCCP2_CTRL_VPCLK_DIV_SHIFT	15
> @@ -102,12 +102,12 @@
>  #define ISPCCP2_DBG			(0x044)
>  #define ISPCCP2_GNQ			(0x048)
>  #define ISPCCP2_LCx_CTRL(x)			((0x050)+0x30*(x))
> -#define ISPCCP2_LCx_CTRL_CHAN_EN		(1 << 0)
> -#define ISPCCP2_LCx_CTRL_CRC_EN			(1 << 19)
> +#define ISPCCP2_LCx_CTRL_CHAN_EN		BIT(0)
> +#define ISPCCP2_LCx_CTRL_CRC_EN			BIT(19)
>  #define ISPCCP2_LCx_CTRL_CRC_MASK		0x1
>  #define ISPCCP2_LCx_CTRL_CRC_SHIFT		2
>  #define ISPCCP2_LCx_CTRL_CRC_SHIFT_15_0		19
> -#define ISPCCP2_LCx_CTRL_REGION_EN		(1 << 1)
> +#define ISPCCP2_LCx_CTRL_REGION_EN		BIT(1)
>  #define ISPCCP2_LCx_CTRL_REGION_MASK		0x1
>  #define ISPCCP2_LCx_CTRL_REGION_SHIFT		1
>  #define ISPCCP2_LCx_CTRL_FORMAT_MASK_15_0	0x3f
> @@ -127,8 +127,8 @@
>  #define ISPCCP2_LCx_DAT_PONG_ADDR(x)	((0x074)+0x30*(x))
>  #define ISPCCP2_LCx_DAT_OFST(x)		((0x078)+0x30*(x))
>  #define ISPCCP2_LCM_CTRL		(0x1D0)
> -#define ISPCCP2_LCM_CTRL_CHAN_EN               (1 << 0)
> -#define ISPCCP2_LCM_CTRL_DST_PORT              (1 << 2)
> +#define ISPCCP2_LCM_CTRL_CHAN_EN               BIT(0)
> +#define ISPCCP2_LCM_CTRL_DST_PORT              BIT(2)
>  #define ISPCCP2_LCM_CTRL_DST_PORT_SHIFT		2
>  #define ISPCCP2_LCM_CTRL_READ_THROTTLE_SHIFT	3
>  #define ISPCCP2_LCM_CTRL_READ_THROTTLE_MASK	0x11
> @@ -138,8 +138,8 @@
>  #define ISPCCP2_LCM_CTRL_SRC_FORMAT_MASK	0x7
>  #define ISPCCP2_LCM_CTRL_SRC_DECOMPR_SHIFT	20
>  #define ISPCCP2_LCM_CTRL_SRC_DECOMPR_MASK	0x3
> -#define ISPCCP2_LCM_CTRL_SRC_DPCM_PRED		(1 << 22)
> -#define ISPCCP2_LCM_CTRL_SRC_PACK		(1 << 23)
> +#define ISPCCP2_LCM_CTRL_SRC_DPCM_PRED		BIT(22)
> +#define ISPCCP2_LCM_CTRL_SRC_PACK		BIT(23)
>  #define ISPCCP2_LCM_CTRL_DST_FORMAT_SHIFT	24
>  #define ISPCCP2_LCM_CTRL_DST_FORMAT_MASK	0x7
>  #define ISPCCP2_LCM_VSIZE		(0x1D4)
> @@ -201,19 +201,19 @@
>  
>  /* SBL */
>  #define ISPSBL_PCR			0x4
> -#define ISPSBL_PCR_H3A_AEAWB_WBL_OVF	(1 << 16)
> -#define ISPSBL_PCR_H3A_AF_WBL_OVF	(1 << 17)
> -#define ISPSBL_PCR_RSZ4_WBL_OVF		(1 << 18)
> -#define ISPSBL_PCR_RSZ3_WBL_OVF		(1 << 19)
> -#define ISPSBL_PCR_RSZ2_WBL_OVF		(1 << 20)
> -#define ISPSBL_PCR_RSZ1_WBL_OVF		(1 << 21)
> -#define ISPSBL_PCR_PRV_WBL_OVF		(1 << 22)
> -#define ISPSBL_PCR_CCDC_WBL_OVF		(1 << 23)
> -#define ISPSBL_PCR_CCDCPRV_2_RSZ_OVF	(1 << 24)
> -#define ISPSBL_PCR_CSIA_WBL_OVF		(1 << 25)
> -#define ISPSBL_PCR_CSIB_WBL_OVF		(1 << 26)
> +#define ISPSBL_PCR_H3A_AEAWB_WBL_OVF	BIT(16)
> +#define ISPSBL_PCR_H3A_AF_WBL_OVF	BIT(17)
> +#define ISPSBL_PCR_RSZ4_WBL_OVF		BIT(18)
> +#define ISPSBL_PCR_RSZ3_WBL_OVF		BIT(19)
> +#define ISPSBL_PCR_RSZ2_WBL_OVF		BIT(20)
> +#define ISPSBL_PCR_RSZ1_WBL_OVF		BIT(21)
> +#define ISPSBL_PCR_PRV_WBL_OVF		BIT(22)
> +#define ISPSBL_PCR_CCDC_WBL_OVF		BIT(23)
> +#define ISPSBL_PCR_CCDCPRV_2_RSZ_OVF	BIT(24)
> +#define ISPSBL_PCR_CSIA_WBL_OVF		BIT(25)
> +#define ISPSBL_PCR_CSIB_WBL_OVF		BIT(26)
>  #define ISPSBL_CCDC_WR_0		(0x028)
> -#define ISPSBL_CCDC_WR_0_DATA_READY	(1 << 21)
> +#define ISPSBL_CCDC_WR_0_DATA_READY	BIT(21)
>  #define ISPSBL_CCDC_WR_1		(0x02C)
>  #define ISPSBL_CCDC_WR_2		(0x030)
>  #define ISPSBL_CCDC_WR_3		(0x034)
> @@ -366,40 +366,40 @@
>  
>  #define ISP_INT_CLR			0xFF113F11
>  #define ISPPRV_PCR_EN			1
> -#define ISPPRV_PCR_BUSY			(1 << 1)
> -#define ISPPRV_PCR_SOURCE		(1 << 2)
> -#define ISPPRV_PCR_ONESHOT		(1 << 3)
> -#define ISPPRV_PCR_WIDTH		(1 << 4)
> -#define ISPPRV_PCR_INVALAW		(1 << 5)
> -#define ISPPRV_PCR_DRKFEN		(1 << 6)
> -#define ISPPRV_PCR_DRKFCAP		(1 << 7)
> -#define ISPPRV_PCR_HMEDEN		(1 << 8)
> -#define ISPPRV_PCR_NFEN			(1 << 9)
> -#define ISPPRV_PCR_CFAEN		(1 << 10)
> +#define ISPPRV_PCR_BUSY			BIT(1)
> +#define ISPPRV_PCR_SOURCE		BIT(2)
> +#define ISPPRV_PCR_ONESHOT		BIT(3)
> +#define ISPPRV_PCR_WIDTH		BIT(4)
> +#define ISPPRV_PCR_INVALAW		BIT(5)
> +#define ISPPRV_PCR_DRKFEN		BIT(6)
> +#define ISPPRV_PCR_DRKFCAP		BIT(7)
> +#define ISPPRV_PCR_HMEDEN		BIT(8)
> +#define ISPPRV_PCR_NFEN			BIT(9)
> +#define ISPPRV_PCR_CFAEN		BIT(10)
>  #define ISPPRV_PCR_CFAFMT_SHIFT		11
>  #define ISPPRV_PCR_CFAFMT_MASK		0x7800
>  #define ISPPRV_PCR_CFAFMT_BAYER		(0 << 11)
> -#define ISPPRV_PCR_CFAFMT_SONYVGA	(1 << 11)
> +#define ISPPRV_PCR_CFAFMT_SONYVGA	BIT(11)

Same here.

>  #define ISPPRV_PCR_CFAFMT_RGBFOVEON	(2 << 11)
>  #define ISPPRV_PCR_CFAFMT_DNSPL		(3 << 11)
>  #define ISPPRV_PCR_CFAFMT_HONEYCOMB	(4 << 11)
>  #define ISPPRV_PCR_CFAFMT_RRGGBBFOVEON	(5 << 11)
> -#define ISPPRV_PCR_YNENHEN		(1 << 15)
> -#define ISPPRV_PCR_SUPEN		(1 << 16)
> +#define ISPPRV_PCR_YNENHEN		BIT(15)
> +#define ISPPRV_PCR_SUPEN		BIT(16)
>  #define ISPPRV_PCR_YCPOS_SHIFT		17
>  #define ISPPRV_PCR_YCPOS_YCrYCb		(0 << 17)
> -#define ISPPRV_PCR_YCPOS_YCbYCr		(1 << 17)
> +#define ISPPRV_PCR_YCPOS_YCbYCr		BIT(17)

And here.

>  #define ISPPRV_PCR_YCPOS_CbYCrY		(2 << 17)
>  #define ISPPRV_PCR_YCPOS_CrYCbY		(3 << 17)
> -#define ISPPRV_PCR_RSZPORT		(1 << 19)
> -#define ISPPRV_PCR_SDRPORT		(1 << 20)
> -#define ISPPRV_PCR_SCOMP_EN		(1 << 21)
> +#define ISPPRV_PCR_RSZPORT		BIT(19)
> +#define ISPPRV_PCR_SDRPORT		BIT(20)
> +#define ISPPRV_PCR_SCOMP_EN		BIT(21)
>  #define ISPPRV_PCR_SCOMP_SFT_SHIFT	(22)
>  #define ISPPRV_PCR_SCOMP_SFT_MASK	(7 << 22)
> -#define ISPPRV_PCR_GAMMA_BYPASS		(1 << 26)
> -#define ISPPRV_PCR_DCOREN		(1 << 27)
> -#define ISPPRV_PCR_DCCOUP		(1 << 28)
> -#define ISPPRV_PCR_DRK_FAIL		(1 << 31)
> +#define ISPPRV_PCR_GAMMA_BYPASS		BIT(26)
> +#define ISPPRV_PCR_DCOREN		BIT(27)
> +#define ISPPRV_PCR_DCCOUP		BIT(28)
> +#define ISPPRV_PCR_DRK_FAIL		BIT(31)
>  
>  #define ISPPRV_HORZ_INFO_EPH_SHIFT	0
>  #define ISPPRV_HORZ_INFO_EPH_MASK	0x3fff
> @@ -423,8 +423,8 @@
>  #define ISPPRV_AVE_ODDDIST_4		0x3
>  
>  #define ISPPRV_HMED_THRESHOLD_SHIFT	0
> -#define ISPPRV_HMED_EVENDIST		(1 << 8)
> -#define ISPPRV_HMED_ODDDIST		(1 << 9)
> +#define ISPPRV_HMED_EVENDIST		BIT(8)
> +#define ISPPRV_HMED_ODDDIST		BIT(9)
>  
>  #define ISPPRV_WBGAIN_COEF0_SHIFT	0
>  #define ISPPRV_WBGAIN_COEF1_SHIFT	8
> @@ -517,8 +517,8 @@
>  /* Define bit fields within selected registers */
>  #define ISP_REVISION_SHIFT			0
>  
> -#define ISP_SYSCONFIG_AUTOIDLE			(1 << 0)
> -#define ISP_SYSCONFIG_SOFTRESET			(1 << 1)
> +#define ISP_SYSCONFIG_AUTOIDLE			BIT(0)
> +#define ISP_SYSCONFIG_SOFTRESET			BIT(1)
>  #define ISP_SYSCONFIG_MIDLEMODE_SHIFT		12
>  #define ISP_SYSCONFIG_MIDLEMODE_FORCESTANDBY	0x0
>  #define ISP_SYSCONFIG_MIDLEMODE_NOSTANBY	0x1
> @@ -526,68 +526,68 @@
>  
>  #define ISP_SYSSTATUS_RESETDONE			0
>  
> -#define IRQ0ENABLE_CSIA_IRQ			(1 << 0)
> -#define IRQ0ENABLE_CSIC_IRQ			(1 << 1)
> -#define IRQ0ENABLE_CCP2_LCM_IRQ			(1 << 3)
> -#define IRQ0ENABLE_CCP2_LC0_IRQ			(1 << 4)
> -#define IRQ0ENABLE_CCP2_LC1_IRQ			(1 << 5)
> -#define IRQ0ENABLE_CCP2_LC2_IRQ			(1 << 6)
> -#define IRQ0ENABLE_CCP2_LC3_IRQ			(1 << 7)
> +#define IRQ0ENABLE_CSIA_IRQ			BIT(0)
> +#define IRQ0ENABLE_CSIC_IRQ			BIT(1)
> +#define IRQ0ENABLE_CCP2_LCM_IRQ			BIT(3)
> +#define IRQ0ENABLE_CCP2_LC0_IRQ			BIT(4)
> +#define IRQ0ENABLE_CCP2_LC1_IRQ			BIT(5)
> +#define IRQ0ENABLE_CCP2_LC2_IRQ			BIT(6)
> +#define IRQ0ENABLE_CCP2_LC3_IRQ			BIT(7)
>  #define IRQ0ENABLE_CSIB_IRQ			(IRQ0ENABLE_CCP2_LCM_IRQ | \
>  						IRQ0ENABLE_CCP2_LC0_IRQ | \
>  						IRQ0ENABLE_CCP2_LC1_IRQ | \
>  						IRQ0ENABLE_CCP2_LC2_IRQ | \
>  						IRQ0ENABLE_CCP2_LC3_IRQ)
>  
> -#define IRQ0ENABLE_CCDC_VD0_IRQ			(1 << 8)
> -#define IRQ0ENABLE_CCDC_VD1_IRQ			(1 << 9)
> -#define IRQ0ENABLE_CCDC_VD2_IRQ			(1 << 10)
> -#define IRQ0ENABLE_CCDC_ERR_IRQ			(1 << 11)
> -#define IRQ0ENABLE_H3A_AF_DONE_IRQ		(1 << 12)
> -#define IRQ0ENABLE_H3A_AWB_DONE_IRQ		(1 << 13)
> -#define IRQ0ENABLE_HIST_DONE_IRQ		(1 << 16)
> -#define IRQ0ENABLE_CCDC_LSC_DONE_IRQ		(1 << 17)
> -#define IRQ0ENABLE_CCDC_LSC_PREF_COMP_IRQ	(1 << 18)
> -#define IRQ0ENABLE_CCDC_LSC_PREF_ERR_IRQ	(1 << 19)
> -#define IRQ0ENABLE_PRV_DONE_IRQ			(1 << 20)
> -#define IRQ0ENABLE_RSZ_DONE_IRQ			(1 << 24)
> -#define IRQ0ENABLE_OVF_IRQ			(1 << 25)
> -#define IRQ0ENABLE_PING_IRQ			(1 << 26)
> -#define IRQ0ENABLE_PONG_IRQ			(1 << 27)
> -#define IRQ0ENABLE_MMU_ERR_IRQ			(1 << 28)
> -#define IRQ0ENABLE_OCP_ERR_IRQ			(1 << 29)
> -#define IRQ0ENABLE_SEC_ERR_IRQ			(1 << 30)
> -#define IRQ0ENABLE_HS_VS_IRQ			(1 << 31)
> +#define IRQ0ENABLE_CCDC_VD0_IRQ			BIT(8)
> +#define IRQ0ENABLE_CCDC_VD1_IRQ			BIT(9)
> +#define IRQ0ENABLE_CCDC_VD2_IRQ			BIT(10)
> +#define IRQ0ENABLE_CCDC_ERR_IRQ			BIT(11)
> +#define IRQ0ENABLE_H3A_AF_DONE_IRQ		BIT(12)
> +#define IRQ0ENABLE_H3A_AWB_DONE_IRQ		BIT(13)
> +#define IRQ0ENABLE_HIST_DONE_IRQ		BIT(16)
> +#define IRQ0ENABLE_CCDC_LSC_DONE_IRQ		BIT(17)
> +#define IRQ0ENABLE_CCDC_LSC_PREF_COMP_IRQ	BIT(18)
> +#define IRQ0ENABLE_CCDC_LSC_PREF_ERR_IRQ	BIT(19)
> +#define IRQ0ENABLE_PRV_DONE_IRQ			BIT(20)
> +#define IRQ0ENABLE_RSZ_DONE_IRQ			BIT(24)
> +#define IRQ0ENABLE_OVF_IRQ			BIT(25)
> +#define IRQ0ENABLE_PING_IRQ			BIT(26)
> +#define IRQ0ENABLE_PONG_IRQ			BIT(27)
> +#define IRQ0ENABLE_MMU_ERR_IRQ			BIT(28)
> +#define IRQ0ENABLE_OCP_ERR_IRQ			BIT(29)
> +#define IRQ0ENABLE_SEC_ERR_IRQ			BIT(30)
> +#define IRQ0ENABLE_HS_VS_IRQ			BIT(31)
>  
> -#define IRQ0STATUS_CSIA_IRQ			(1 << 0)
> -#define IRQ0STATUS_CSI2C_IRQ			(1 << 1)
> -#define IRQ0STATUS_CCP2_LCM_IRQ			(1 << 3)
> -#define IRQ0STATUS_CCP2_LC0_IRQ			(1 << 4)
> +#define IRQ0STATUS_CSIA_IRQ			BIT(0)
> +#define IRQ0STATUS_CSI2C_IRQ			BIT(1)
> +#define IRQ0STATUS_CCP2_LCM_IRQ			BIT(3)
> +#define IRQ0STATUS_CCP2_LC0_IRQ			BIT(4)
>  #define IRQ0STATUS_CSIB_IRQ			(IRQ0STATUS_CCP2_LCM_IRQ | \
>  						IRQ0STATUS_CCP2_LC0_IRQ)
>  
> -#define IRQ0STATUS_CSIB_LC1_IRQ			(1 << 5)
> -#define IRQ0STATUS_CSIB_LC2_IRQ			(1 << 6)
> -#define IRQ0STATUS_CSIB_LC3_IRQ			(1 << 7)
> -#define IRQ0STATUS_CCDC_VD0_IRQ			(1 << 8)
> -#define IRQ0STATUS_CCDC_VD1_IRQ			(1 << 9)
> -#define IRQ0STATUS_CCDC_VD2_IRQ			(1 << 10)
> -#define IRQ0STATUS_CCDC_ERR_IRQ			(1 << 11)
> -#define IRQ0STATUS_H3A_AF_DONE_IRQ		(1 << 12)
> -#define IRQ0STATUS_H3A_AWB_DONE_IRQ		(1 << 13)
> -#define IRQ0STATUS_HIST_DONE_IRQ		(1 << 16)
> -#define IRQ0STATUS_CCDC_LSC_DONE_IRQ		(1 << 17)
> -#define IRQ0STATUS_CCDC_LSC_PREF_COMP_IRQ	(1 << 18)
> -#define IRQ0STATUS_CCDC_LSC_PREF_ERR_IRQ	(1 << 19)
> -#define IRQ0STATUS_PRV_DONE_IRQ			(1 << 20)
> -#define IRQ0STATUS_RSZ_DONE_IRQ			(1 << 24)
> -#define IRQ0STATUS_OVF_IRQ			(1 << 25)
> -#define IRQ0STATUS_PING_IRQ			(1 << 26)
> -#define IRQ0STATUS_PONG_IRQ			(1 << 27)
> -#define IRQ0STATUS_MMU_ERR_IRQ			(1 << 28)
> -#define IRQ0STATUS_OCP_ERR_IRQ			(1 << 29)
> -#define IRQ0STATUS_SEC_ERR_IRQ			(1 << 30)
> -#define IRQ0STATUS_HS_VS_IRQ			(1 << 31)
> +#define IRQ0STATUS_CSIB_LC1_IRQ			BIT(5)
> +#define IRQ0STATUS_CSIB_LC2_IRQ			BIT(6)
> +#define IRQ0STATUS_CSIB_LC3_IRQ			BIT(7)
> +#define IRQ0STATUS_CCDC_VD0_IRQ			BIT(8)
> +#define IRQ0STATUS_CCDC_VD1_IRQ			BIT(9)
> +#define IRQ0STATUS_CCDC_VD2_IRQ			BIT(10)
> +#define IRQ0STATUS_CCDC_ERR_IRQ			BIT(11)
> +#define IRQ0STATUS_H3A_AF_DONE_IRQ		BIT(12)
> +#define IRQ0STATUS_H3A_AWB_DONE_IRQ		BIT(13)
> +#define IRQ0STATUS_HIST_DONE_IRQ		BIT(16)
> +#define IRQ0STATUS_CCDC_LSC_DONE_IRQ		BIT(17)
> +#define IRQ0STATUS_CCDC_LSC_PREF_COMP_IRQ	BIT(18)
> +#define IRQ0STATUS_CCDC_LSC_PREF_ERR_IRQ	BIT(19)
> +#define IRQ0STATUS_PRV_DONE_IRQ			BIT(20)
> +#define IRQ0STATUS_RSZ_DONE_IRQ			BIT(24)
> +#define IRQ0STATUS_OVF_IRQ			BIT(25)
> +#define IRQ0STATUS_PING_IRQ			BIT(26)
> +#define IRQ0STATUS_PONG_IRQ			BIT(27)
> +#define IRQ0STATUS_MMU_ERR_IRQ			BIT(28)
> +#define IRQ0STATUS_OCP_ERR_IRQ			BIT(29)
> +#define IRQ0STATUS_SEC_ERR_IRQ			BIT(30)
> +#define IRQ0STATUS_HS_VS_IRQ			BIT(31)
>  
>  #define TCTRL_GRESET_LEN			0
>  
> @@ -607,20 +607,20 @@
>  #define ISPCTRL_PAR_BRIDGE_MASK			(0x3 << 2)
>  
>  #define ISPCTRL_PAR_CLK_POL_SHIFT		4
> -#define ISPCTRL_PAR_CLK_POL_INV			(1 << 4)
> -#define ISPCTRL_PING_PONG_EN			(1 << 5)
> +#define ISPCTRL_PAR_CLK_POL_INV			BIT(4)
> +#define ISPCTRL_PING_PONG_EN			BIT(5)
>  #define ISPCTRL_SHIFT_SHIFT			6
>  #define ISPCTRL_SHIFT_0				(0x0 << 6)
> -#define ISPCTRL_SHIFT_2				(0x1 << 6)
> +#define ISPCTRL_SHIFT_2				BIT(6)

And here.

>  #define ISPCTRL_SHIFT_4				(0x2 << 6)
>  #define ISPCTRL_SHIFT_MASK			(0x3 << 6)
>  
> -#define ISPCTRL_CCDC_CLK_EN			(1 << 8)
> -#define ISPCTRL_SCMP_CLK_EN			(1 << 9)
> -#define ISPCTRL_H3A_CLK_EN			(1 << 10)
> -#define ISPCTRL_HIST_CLK_EN			(1 << 11)
> -#define ISPCTRL_PREV_CLK_EN			(1 << 12)
> -#define ISPCTRL_RSZ_CLK_EN			(1 << 13)
> +#define ISPCTRL_CCDC_CLK_EN			BIT(8)
> +#define ISPCTRL_SCMP_CLK_EN			BIT(9)
> +#define ISPCTRL_H3A_CLK_EN			BIT(10)
> +#define ISPCTRL_HIST_CLK_EN			BIT(11)
> +#define ISPCTRL_PREV_CLK_EN			BIT(12)
> +#define ISPCTRL_RSZ_CLK_EN			BIT(13)
>  #define ISPCTRL_SYNC_DETECT_SHIFT		14
>  #define ISPCTRL_SYNC_DETECT_HSFALL	(0x0 << ISPCTRL_SYNC_DETECT_SHIFT)
>  #define ISPCTRL_SYNC_DETECT_HSRISE	(0x1 << ISPCTRL_SYNC_DETECT_SHIFT)
> @@ -628,17 +628,17 @@
>  #define ISPCTRL_SYNC_DETECT_VSRISE	(0x3 << ISPCTRL_SYNC_DETECT_SHIFT)
>  #define ISPCTRL_SYNC_DETECT_MASK	(0x3 << ISPCTRL_SYNC_DETECT_SHIFT)
>  
> -#define ISPCTRL_CCDC_RAM_EN		(1 << 16)
> -#define ISPCTRL_PREV_RAM_EN		(1 << 17)
> -#define ISPCTRL_SBL_RD_RAM_EN		(1 << 18)
> -#define ISPCTRL_SBL_WR1_RAM_EN		(1 << 19)
> -#define ISPCTRL_SBL_WR0_RAM_EN		(1 << 20)
> -#define ISPCTRL_SBL_AUTOIDLE		(1 << 21)
> -#define ISPCTRL_SBL_SHARED_WPORTC	(1 << 26)
> -#define ISPCTRL_SBL_SHARED_RPORTA	(1 << 27)
> -#define ISPCTRL_SBL_SHARED_RPORTB	(1 << 28)
> -#define ISPCTRL_JPEG_FLUSH		(1 << 30)
> -#define ISPCTRL_CCDC_FLUSH		(1 << 31)
> +#define ISPCTRL_CCDC_RAM_EN		BIT(16)
> +#define ISPCTRL_PREV_RAM_EN		BIT(17)
> +#define ISPCTRL_SBL_RD_RAM_EN		BIT(18)
> +#define ISPCTRL_SBL_WR1_RAM_EN		BIT(19)
> +#define ISPCTRL_SBL_WR0_RAM_EN		BIT(20)
> +#define ISPCTRL_SBL_AUTOIDLE		BIT(21)
> +#define ISPCTRL_SBL_SHARED_WPORTC	BIT(26)
> +#define ISPCTRL_SBL_SHARED_RPORTA	BIT(27)
> +#define ISPCTRL_SBL_SHARED_RPORTB	BIT(28)
> +#define ISPCTRL_JPEG_FLUSH		BIT(30)
> +#define ISPCTRL_CCDC_FLUSH		BIT(31)
>  
>  #define ISPSECURE_SECUREMODE		0
>  
> @@ -655,20 +655,20 @@
>  #define ISPTCTRL_CTRL_DIVC_SHIFT	10
>  #define ISPTCTRL_CTRL_DIVC_NOCLOCK	(0x0 << 10)
>  
> -#define ISPTCTRL_CTRL_SHUTEN		(1 << 21)
> -#define ISPTCTRL_CTRL_PSTRBEN		(1 << 22)
> -#define ISPTCTRL_CTRL_STRBEN		(1 << 23)
> -#define ISPTCTRL_CTRL_SHUTPOL		(1 << 24)
> -#define ISPTCTRL_CTRL_STRBPSTRBPOL	(1 << 26)
> +#define ISPTCTRL_CTRL_SHUTEN		BIT(21)
> +#define ISPTCTRL_CTRL_PSTRBEN		BIT(22)
> +#define ISPTCTRL_CTRL_STRBEN		BIT(23)
> +#define ISPTCTRL_CTRL_SHUTPOL		BIT(24)
> +#define ISPTCTRL_CTRL_STRBPSTRBPOL	BIT(26)
>  
>  #define ISPTCTRL_CTRL_INSEL_SHIFT	27
>  #define ISPTCTRL_CTRL_INSEL_PARALLEL	(0x0 << 27)
> -#define ISPTCTRL_CTRL_INSEL_CSIA	(0x1 << 27)
> +#define ISPTCTRL_CTRL_INSEL_CSIA	BIT(27)

And here.

>  #define ISPTCTRL_CTRL_INSEL_CSIB	(0x2 << 27)
>  
> -#define ISPTCTRL_CTRL_GRESETEn		(1 << 29)
> -#define ISPTCTRL_CTRL_GRESETPOL		(1 << 30)
> -#define ISPTCTRL_CTRL_GRESETDIR		(1 << 31)
> +#define ISPTCTRL_CTRL_GRESETEn		BIT(29)
> +#define ISPTCTRL_CTRL_GRESETPOL		BIT(30)
> +#define ISPTCTRL_CTRL_GRESETDIR		BIT(31)
>  
>  #define ISPTCTRL_FRAME_SHUT_SHIFT		0
>  #define ISPTCTRL_FRAME_PSTRB_SHIFT		6
> @@ -679,33 +679,33 @@
>  #define ISPCCDC_PID_TID_SHIFT			16
>  
>  #define ISPCCDC_PCR_EN				1
> -#define ISPCCDC_PCR_BUSY			(1 << 1)
> +#define ISPCCDC_PCR_BUSY			BIT(1)
>  
>  #define ISPCCDC_SYN_MODE_VDHDOUT		0x1
> -#define ISPCCDC_SYN_MODE_FLDOUT			(1 << 1)
> -#define ISPCCDC_SYN_MODE_VDPOL			(1 << 2)
> -#define ISPCCDC_SYN_MODE_HDPOL			(1 << 3)
> -#define ISPCCDC_SYN_MODE_FLDPOL			(1 << 4)
> -#define ISPCCDC_SYN_MODE_EXWEN			(1 << 5)
> -#define ISPCCDC_SYN_MODE_DATAPOL		(1 << 6)
> -#define ISPCCDC_SYN_MODE_FLDMODE		(1 << 7)
> +#define ISPCCDC_SYN_MODE_FLDOUT			BIT(1)
> +#define ISPCCDC_SYN_MODE_VDPOL			BIT(2)
> +#define ISPCCDC_SYN_MODE_HDPOL			BIT(3)
> +#define ISPCCDC_SYN_MODE_FLDPOL			BIT(4)
> +#define ISPCCDC_SYN_MODE_EXWEN			BIT(5)
> +#define ISPCCDC_SYN_MODE_DATAPOL		BIT(6)
> +#define ISPCCDC_SYN_MODE_FLDMODE		BIT(7)
>  #define ISPCCDC_SYN_MODE_DATSIZ_MASK		(0x7 << 8)
>  #define ISPCCDC_SYN_MODE_DATSIZ_8_16		(0x0 << 8)
>  #define ISPCCDC_SYN_MODE_DATSIZ_12		(0x4 << 8)
>  #define ISPCCDC_SYN_MODE_DATSIZ_11		(0x5 << 8)
>  #define ISPCCDC_SYN_MODE_DATSIZ_10		(0x6 << 8)
>  #define ISPCCDC_SYN_MODE_DATSIZ_8		(0x7 << 8)
> -#define ISPCCDC_SYN_MODE_PACK8			(1 << 11)
> +#define ISPCCDC_SYN_MODE_PACK8			BIT(11)
>  #define ISPCCDC_SYN_MODE_INPMOD_MASK		(3 << 12)
>  #define ISPCCDC_SYN_MODE_INPMOD_RAW		(0 << 12)
> -#define ISPCCDC_SYN_MODE_INPMOD_YCBCR16		(1 << 12)
> +#define ISPCCDC_SYN_MODE_INPMOD_YCBCR16		BIT(12)

And here.

>  #define ISPCCDC_SYN_MODE_INPMOD_YCBCR8		(2 << 12)
> -#define ISPCCDC_SYN_MODE_LPF			(1 << 14)
> -#define ISPCCDC_SYN_MODE_FLDSTAT		(1 << 15)
> -#define ISPCCDC_SYN_MODE_VDHDEN			(1 << 16)
> -#define ISPCCDC_SYN_MODE_WEN			(1 << 17)
> -#define ISPCCDC_SYN_MODE_VP2SDR			(1 << 18)
> -#define ISPCCDC_SYN_MODE_SDR2RSZ		(1 << 19)
> +#define ISPCCDC_SYN_MODE_LPF			BIT(14)
> +#define ISPCCDC_SYN_MODE_FLDSTAT		BIT(15)
> +#define ISPCCDC_SYN_MODE_VDHDEN			BIT(16)
> +#define ISPCCDC_SYN_MODE_WEN			BIT(17)
> +#define ISPCCDC_SYN_MODE_VP2SDR			BIT(18)
> +#define ISPCCDC_SYN_MODE_SDR2RSZ		BIT(19)
>  
>  #define ISPCCDC_HD_VD_WID_VDW_SHIFT		0
>  #define ISPCCDC_HD_VD_WID_HDW_SHIFT		16
> @@ -731,7 +731,7 @@
>  
>  #define ISPCCDC_HSIZE_OFF_SHIFT			0
>  
> -#define ISPCCDC_SDOFST_FIINV			(1 << 14)
> +#define ISPCCDC_SDOFST_FIINV			BIT(14)
>  #define ISPCCDC_SDOFST_FOFST_SHIFT		12
>  #define ISPCCDC_SDOFST_FOFST_MASK		(3 << 12)
>  #define ISPCCDC_SDOFST_LOFST3_SHIFT		0
> @@ -743,7 +743,7 @@
>  #define ISPCCDC_CLAMP_OBST_SHIFT		10
>  #define ISPCCDC_CLAMP_OBSLN_SHIFT		25
>  #define ISPCCDC_CLAMP_OBSLEN_SHIFT		28
> -#define ISPCCDC_CLAMP_CLAMPEN			(1 << 31)
> +#define ISPCCDC_CLAMP_CLAMPEN			BIT(31)
>  
>  #define ISPCCDC_COLPTN_R_Ye			0x0
>  #define ISPCCDC_COLPTN_Gr_Cy			0x1
> @@ -772,8 +772,8 @@
>  #define ISPCCDC_BLKCMP_R_YE_SHIFT		24
>  
>  #define ISPCCDC_FPC_FPNUM_SHIFT			0
> -#define ISPCCDC_FPC_FPCEN			(1 << 15)
> -#define ISPCCDC_FPC_FPERR			(1 << 16)
> +#define ISPCCDC_FPC_FPCEN			BIT(15)
> +#define ISPCCDC_FPC_FPERR			BIT(16)
>  
>  #define ISPCCDC_VDINT_1_SHIFT			0
>  #define ISPCCDC_VDINT_1_MASK			0x00007fff
> @@ -784,23 +784,23 @@
>  #define ISPCCDC_ALAW_GWDI_11_2			(0x4 << 0)
>  #define ISPCCDC_ALAW_GWDI_10_1			(0x5 << 0)
>  #define ISPCCDC_ALAW_GWDI_9_0			(0x6 << 0)
> -#define ISPCCDC_ALAW_CCDTBL			(1 << 3)
> +#define ISPCCDC_ALAW_CCDTBL			BIT(3)
>  
>  #define ISPCCDC_REC656IF_R656ON			1
> -#define ISPCCDC_REC656IF_ECCFVH			(1 << 1)
> +#define ISPCCDC_REC656IF_ECCFVH			BIT(1)
>  
> -#define ISPCCDC_CFG_BW656			(1 << 5)
> +#define ISPCCDC_CFG_BW656			BIT(5)
>  #define ISPCCDC_CFG_FIDMD_SHIFT			6
> -#define ISPCCDC_CFG_WENLOG			(1 << 8)
> +#define ISPCCDC_CFG_WENLOG			BIT(8)
>  #define ISPCCDC_CFG_WENLOG_AND			(0 << 8)
> -#define ISPCCDC_CFG_WENLOG_OR			(1 << 8)
> -#define ISPCCDC_CFG_Y8POS			(1 << 11)
> -#define ISPCCDC_CFG_BSWD			(1 << 12)
> -#define ISPCCDC_CFG_MSBINVI			(1 << 13)
> -#define ISPCCDC_CFG_VDLC			(1 << 15)
> +#define ISPCCDC_CFG_WENLOG_OR			BIT(8)

And here.

> +#define ISPCCDC_CFG_Y8POS			BIT(11)
> +#define ISPCCDC_CFG_BSWD			BIT(12)
> +#define ISPCCDC_CFG_MSBINVI			BIT(13)
> +#define ISPCCDC_CFG_VDLC			BIT(15)
>  
>  #define ISPCCDC_FMTCFG_FMTEN			0x1
> -#define ISPCCDC_FMTCFG_LNALT			(1 << 1)
> +#define ISPCCDC_FMTCFG_LNALT			BIT(1)
>  #define ISPCCDC_FMTCFG_LNUM_SHIFT		2
>  #define ISPCCDC_FMTCFG_PLEN_ODD_SHIFT		4
>  #define ISPCCDC_FMTCFG_PLEN_EVEN_SHIFT		8
> @@ -809,12 +809,12 @@
>  #define ISPCCDC_FMTCFG_VPIN_11_2		(0x4 << 12)
>  #define ISPCCDC_FMTCFG_VPIN_10_1		(0x5 << 12)
>  #define ISPCCDC_FMTCFG_VPIN_9_0			(0x6 << 12)
> -#define ISPCCDC_FMTCFG_VPEN			(1 << 15)
> +#define ISPCCDC_FMTCFG_VPEN			BIT(15)
>  
>  #define ISPCCDC_FMTCFG_VPIF_FRQ_MASK		0x003f0000
>  #define ISPCCDC_FMTCFG_VPIF_FRQ_SHIFT		16
>  #define ISPCCDC_FMTCFG_VPIF_FRQ_BY2		(0x0 << 16)
> -#define ISPCCDC_FMTCFG_VPIF_FRQ_BY3		(0x1 << 16)
> +#define ISPCCDC_FMTCFG_VPIF_FRQ_BY3		BIT(16)

And here.

>  #define ISPCCDC_FMTCFG_VPIF_FRQ_BY4		(0x2 << 16)
>  #define ISPCCDC_FMTCFG_VPIF_FRQ_BY5		(0x3 << 16)
>  #define ISPCCDC_FMTCFG_VPIF_FRQ_BY6		(0x4 << 16)
> @@ -839,9 +839,9 @@
>  #define ISPRSZ_PID_CID_SHIFT			8
>  #define ISPRSZ_PID_TID_SHIFT			16
>  
> -#define ISPRSZ_PCR_ENABLE			(1 << 0)
> -#define ISPRSZ_PCR_BUSY				(1 << 1)
> -#define ISPRSZ_PCR_ONESHOT			(1 << 2)
> +#define ISPRSZ_PCR_ENABLE			BIT(0)
> +#define ISPRSZ_PCR_BUSY				BIT(1)
> +#define ISPRSZ_PCR_ONESHOT			BIT(2)
>  
>  #define ISPRSZ_CNT_HRSZ_SHIFT			0
>  #define ISPRSZ_CNT_HRSZ_MASK			\
> @@ -853,10 +853,10 @@
>  #define ISPRSZ_CNT_HSTPH_MASK			(0x7 << ISPRSZ_CNT_HSTPH_SHIFT)
>  #define ISPRSZ_CNT_VSTPH_SHIFT			23
>  #define ISPRSZ_CNT_VSTPH_MASK			(0x7 << ISPRSZ_CNT_VSTPH_SHIFT)
> -#define ISPRSZ_CNT_YCPOS			(1 << 26)
> -#define ISPRSZ_CNT_INPTYP			(1 << 27)
> -#define ISPRSZ_CNT_INPSRC			(1 << 28)
> -#define ISPRSZ_CNT_CBILIN			(1 << 29)
> +#define ISPRSZ_CNT_YCPOS			BIT(26)
> +#define ISPRSZ_CNT_INPTYP			BIT(27)
> +#define ISPRSZ_CNT_INPSRC			BIT(28)
> +#define ISPRSZ_CNT_CBILIN			BIT(29)
>  
>  #define ISPRSZ_OUT_SIZE_HORZ_SHIFT		0
>  #define ISPRSZ_OUT_SIZE_HORZ_MASK		\
> @@ -1081,8 +1081,8 @@
>  #define ISPH3A_PCR_AF_RGBPOS_SHIFT		11
>  #define ISPH3A_PCR_AEW_AVE2LMT_SHIFT		22
>  #define ISPH3A_PCR_AEW_AVE2LMT_MASK		0xFFC00000
> -#define ISPH3A_PCR_BUSYAF			(1 << 15)
> -#define ISPH3A_PCR_BUSYAEAWB			(1 << 18)
> +#define ISPH3A_PCR_BUSYAF			BIT(15)
> +#define ISPH3A_PCR_BUSYAEAWB			BIT(18)
>  
>  #define ISPH3A_AEWWIN1_WINHC_SHIFT		0
>  #define ISPH3A_AEWWIN1_WINHC_MASK		0x3F
> @@ -1167,14 +1167,14 @@
>  #define ISPHIST_HV_INFO_MASK			0x3FFF3FFF
>  
>  #define ISPCCDC_LSC_ENABLE			1
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
> @@ -1196,43 +1196,43 @@
>  	(0x1 << ISPCSI2_SYSCONFIG_MSTANDBY_MODE_SHIFT)
>  #define ISPCSI2_SYSCONFIG_MSTANDBY_MODE_SMART	\
>  	(0x2 << ISPCSI2_SYSCONFIG_MSTANDBY_MODE_SHIFT)
> -#define ISPCSI2_SYSCONFIG_SOFT_RESET		(1 << 1)
> -#define ISPCSI2_SYSCONFIG_AUTO_IDLE		(1 << 0)
> +#define ISPCSI2_SYSCONFIG_SOFT_RESET		BIT(1)
> +#define ISPCSI2_SYSCONFIG_AUTO_IDLE		BIT(0)
>  
>  #define ISPCSI2_SYSSTATUS			(0x014)
> -#define ISPCSI2_SYSSTATUS_RESET_DONE		(1 << 0)
> +#define ISPCSI2_SYSSTATUS_RESET_DONE		BIT(0)
>  
>  #define ISPCSI2_IRQSTATUS			(0x018)
> -#define ISPCSI2_IRQSTATUS_OCP_ERR_IRQ		(1 << 14)
> -#define ISPCSI2_IRQSTATUS_SHORT_PACKET_IRQ	(1 << 13)
> -#define ISPCSI2_IRQSTATUS_ECC_CORRECTION_IRQ	(1 << 12)
> -#define ISPCSI2_IRQSTATUS_ECC_NO_CORRECTION_IRQ	(1 << 11)
> -#define ISPCSI2_IRQSTATUS_COMPLEXIO2_ERR_IRQ	(1 << 10)
> -#define ISPCSI2_IRQSTATUS_COMPLEXIO1_ERR_IRQ	(1 << 9)
> -#define ISPCSI2_IRQSTATUS_FIFO_OVF_IRQ		(1 << 8)
> +#define ISPCSI2_IRQSTATUS_OCP_ERR_IRQ		BIT(14)
> +#define ISPCSI2_IRQSTATUS_SHORT_PACKET_IRQ	BIT(13)
> +#define ISPCSI2_IRQSTATUS_ECC_CORRECTION_IRQ	BIT(12)
> +#define ISPCSI2_IRQSTATUS_ECC_NO_CORRECTION_IRQ	BIT(11)
> +#define ISPCSI2_IRQSTATUS_COMPLEXIO2_ERR_IRQ	BIT(10)
> +#define ISPCSI2_IRQSTATUS_COMPLEXIO1_ERR_IRQ	BIT(9)
> +#define ISPCSI2_IRQSTATUS_FIFO_OVF_IRQ		BIT(8)
>  #define ISPCSI2_IRQSTATUS_CONTEXT(n)		(1 << (n))

This could be replaced by BIT(n).

>  
>  #define ISPCSI2_IRQENABLE			(0x01c)
>  #define ISPCSI2_CTRL				(0x040)
> -#define ISPCSI2_CTRL_VP_CLK_EN			(1 << 15)
> -#define ISPCSI2_CTRL_VP_ONLY_EN			(1 << 11)
> +#define ISPCSI2_CTRL_VP_CLK_EN			BIT(15)
> +#define ISPCSI2_CTRL_VP_ONLY_EN			BIT(11)
>  #define ISPCSI2_CTRL_VP_OUT_CTRL_SHIFT		8
>  #define ISPCSI2_CTRL_VP_OUT_CTRL_MASK		\
>  	(3 << ISPCSI2_CTRL_VP_OUT_CTRL_SHIFT)
> -#define ISPCSI2_CTRL_DBG_EN			(1 << 7)
> +#define ISPCSI2_CTRL_DBG_EN			BIT(7)
>  #define ISPCSI2_CTRL_BURST_SIZE_SHIFT		5
>  #define ISPCSI2_CTRL_BURST_SIZE_MASK		\
>  	(3 << ISPCSI2_CTRL_BURST_SIZE_SHIFT)
> -#define ISPCSI2_CTRL_FRAME			(1 << 3)
> -#define ISPCSI2_CTRL_ECC_EN			(1 << 2)
> -#define ISPCSI2_CTRL_SECURE			(1 << 1)
> -#define ISPCSI2_CTRL_IF_EN			(1 << 0)
> +#define ISPCSI2_CTRL_FRAME			BIT(3)
> +#define ISPCSI2_CTRL_ECC_EN			BIT(2)
> +#define ISPCSI2_CTRL_SECURE			BIT(1)
> +#define ISPCSI2_CTRL_IF_EN			BIT(0)
>  
>  #define ISPCSI2_DBG_H				(0x044)
>  #define ISPCSI2_GNQ				(0x048)
>  #define ISPCSI2_PHY_CFG				(0x050)
> -#define ISPCSI2_PHY_CFG_RESET_CTRL		(1 << 30)
> -#define ISPCSI2_PHY_CFG_RESET_DONE		(1 << 29)
> +#define ISPCSI2_PHY_CFG_RESET_CTRL		BIT(30)
> +#define ISPCSI2_PHY_CFG_RESET_DONE		BIT(29)
>  #define ISPCSI2_PHY_CFG_PWR_CMD_SHIFT		27
>  #define ISPCSI2_PHY_CFG_PWR_CMD_MASK		\
>  	(0x3 << ISPCSI2_PHY_CFG_PWR_CMD_SHIFT)
> @@ -1251,7 +1251,7 @@
>  	(0x1 << ISPCSI2_PHY_CFG_PWR_STATUS_SHIFT)
>  #define ISPCSI2_PHY_CFG_PWR_STATUS_ULPW		\
>  	(0x2 << ISPCSI2_PHY_CFG_PWR_STATUS_SHIFT)
> -#define ISPCSI2_PHY_CFG_PWR_AUTO		(1 << 24)
> +#define ISPCSI2_PHY_CFG_PWR_AUTO		BIT(24)
>  
>  #define ISPCSI2_PHY_CFG_DATA_POL_SHIFT(n)	(3 + ((n) * 4))
>  #define ISPCSI2_PHY_CFG_DATA_POL_MASK(n)	\
> @@ -1300,63 +1300,63 @@
>  	(0x5 << ISPCSI2_PHY_CFG_CLOCK_POSITION_SHIFT)
>  
>  #define ISPCSI2_PHY_IRQSTATUS			(0x054)
> -#define ISPCSI2_PHY_IRQSTATUS_STATEALLULPMEXIT	(1 << 26)
> -#define ISPCSI2_PHY_IRQSTATUS_STATEALLULPMENTER	(1 << 25)
> -#define ISPCSI2_PHY_IRQSTATUS_STATEULPM5	(1 << 24)
> -#define ISPCSI2_PHY_IRQSTATUS_STATEULPM4	(1 << 23)
> -#define ISPCSI2_PHY_IRQSTATUS_STATEULPM3	(1 << 22)
> -#define ISPCSI2_PHY_IRQSTATUS_STATEULPM2	(1 << 21)
> -#define ISPCSI2_PHY_IRQSTATUS_STATEULPM1	(1 << 20)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL5	(1 << 19)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL4	(1 << 18)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL3	(1 << 17)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL2	(1 << 16)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL1	(1 << 15)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRESC5		(1 << 14)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRESC4		(1 << 13)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRESC3		(1 << 12)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRESC2		(1 << 11)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRESC1		(1 << 10)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS5	(1 << 9)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS4	(1 << 8)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS3	(1 << 7)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS2	(1 << 6)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS1	(1 << 5)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS5		(1 << 4)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS4		(1 << 3)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS3		(1 << 2)
> -#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS2		(1 << 1)
> +#define ISPCSI2_PHY_IRQSTATUS_STATEALLULPMEXIT	BIT(26)
> +#define ISPCSI2_PHY_IRQSTATUS_STATEALLULPMENTER	BIT(25)
> +#define ISPCSI2_PHY_IRQSTATUS_STATEULPM5	BIT(24)
> +#define ISPCSI2_PHY_IRQSTATUS_STATEULPM4	BIT(23)
> +#define ISPCSI2_PHY_IRQSTATUS_STATEULPM3	BIT(22)
> +#define ISPCSI2_PHY_IRQSTATUS_STATEULPM2	BIT(21)
> +#define ISPCSI2_PHY_IRQSTATUS_STATEULPM1	BIT(20)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL5	BIT(19)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL4	BIT(18)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL3	BIT(17)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL2	BIT(16)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL1	BIT(15)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRESC5		BIT(14)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRESC4		BIT(13)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRESC3		BIT(12)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRESC2		BIT(11)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRESC1		BIT(10)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS5	BIT(9)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS4	BIT(8)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS3	BIT(7)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS2	BIT(6)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS1	BIT(5)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS5		BIT(4)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS4		BIT(3)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS3		BIT(2)
> +#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS2		BIT(1)
>  #define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS1		1

And this could be replace by BIT(0).

>  
>  #define ISPCSI2_SHORT_PACKET			(0x05c)
>  #define ISPCSI2_PHY_IRQENABLE			(0x060)
> -#define ISPCSI2_PHY_IRQENABLE_STATEALLULPMEXIT	(1 << 26)
> -#define ISPCSI2_PHY_IRQENABLE_STATEALLULPMENTER	(1 << 25)
> -#define ISPCSI2_PHY_IRQENABLE_STATEULPM5	(1 << 24)
> -#define ISPCSI2_PHY_IRQENABLE_STATEULPM4	(1 << 23)
> -#define ISPCSI2_PHY_IRQENABLE_STATEULPM3	(1 << 22)
> -#define ISPCSI2_PHY_IRQENABLE_STATEULPM2	(1 << 21)
> -#define ISPCSI2_PHY_IRQENABLE_STATEULPM1	(1 << 20)
> -#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL5	(1 << 19)
> -#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL4	(1 << 18)
> -#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL3	(1 << 17)
> -#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL2	(1 << 16)
> -#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL1	(1 << 15)
> -#define ISPCSI2_PHY_IRQENABLE_ERRESC5		(1 << 14)
> -#define ISPCSI2_PHY_IRQENABLE_ERRESC4		(1 << 13)
> -#define ISPCSI2_PHY_IRQENABLE_ERRESC3		(1 << 12)
> -#define ISPCSI2_PHY_IRQENABLE_ERRESC2		(1 << 11)
> -#define ISPCSI2_PHY_IRQENABLE_ERRESC1		(1 << 10)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS5	(1 << 9)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS4	(1 << 8)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS3	(1 << 7)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS2	(1 << 6)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS1	(1 << 5)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS5		(1 << 4)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS4		(1 << 3)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS3		(1 << 2)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS2		(1 << 1)
> -#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS1		(1 << 0)
> +#define ISPCSI2_PHY_IRQENABLE_STATEALLULPMEXIT	BIT(26)
> +#define ISPCSI2_PHY_IRQENABLE_STATEALLULPMENTER	BIT(25)
> +#define ISPCSI2_PHY_IRQENABLE_STATEULPM5	BIT(24)
> +#define ISPCSI2_PHY_IRQENABLE_STATEULPM4	BIT(23)
> +#define ISPCSI2_PHY_IRQENABLE_STATEULPM3	BIT(22)
> +#define ISPCSI2_PHY_IRQENABLE_STATEULPM2	BIT(21)
> +#define ISPCSI2_PHY_IRQENABLE_STATEULPM1	BIT(20)
> +#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL5	BIT(19)
> +#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL4	BIT(18)
> +#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL3	BIT(17)
> +#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL2	BIT(16)
> +#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL1	BIT(15)
> +#define ISPCSI2_PHY_IRQENABLE_ERRESC5		BIT(14)
> +#define ISPCSI2_PHY_IRQENABLE_ERRESC4		BIT(13)
> +#define ISPCSI2_PHY_IRQENABLE_ERRESC3		BIT(12)
> +#define ISPCSI2_PHY_IRQENABLE_ERRESC2		BIT(11)
> +#define ISPCSI2_PHY_IRQENABLE_ERRESC1		BIT(10)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS5	BIT(9)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS4	BIT(8)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS3	BIT(7)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS2	BIT(6)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS1	BIT(5)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS5		BIT(4)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS4		BIT(3)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS3		BIT(2)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS2		BIT(1)
> +#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS1		BIT(0)
>  
>  #define ISPCSI2_DBG_P				(0x068)
>  #define ISPCSI2_TIMING				(0x06c)
> @@ -1371,12 +1371,12 @@
>  #define ISPCSI2_CTX_CTRL1_COUNT_SHIFT		8
>  #define ISPCSI2_CTX_CTRL1_COUNT_MASK		\
>  	(0xff << ISPCSI2_CTX_CTRL1_COUNT_SHIFT)
> -#define ISPCSI2_CTX_CTRL1_EOF_EN		(1 << 7)
> -#define ISPCSI2_CTX_CTRL1_EOL_EN		(1 << 6)
> -#define ISPCSI2_CTX_CTRL1_CS_EN			(1 << 5)
> -#define ISPCSI2_CTX_CTRL1_COUNT_UNLOCK		(1 << 4)
> -#define ISPCSI2_CTX_CTRL1_PING_PONG		(1 << 3)
> -#define ISPCSI2_CTX_CTRL1_CTX_EN		(1 << 0)
> +#define ISPCSI2_CTX_CTRL1_EOF_EN		BIT(7)
> +#define ISPCSI2_CTX_CTRL1_EOL_EN		BIT(6)
> +#define ISPCSI2_CTX_CTRL1_CS_EN			BIT(5)
> +#define ISPCSI2_CTX_CTRL1_COUNT_UNLOCK		BIT(4)
> +#define ISPCSI2_CTX_CTRL1_PING_PONG		BIT(3)
> +#define ISPCSI2_CTX_CTRL1_CTX_EN		BIT(0)
>  
>  #define ISPCSI2_CTX_CTRL2(n)			((0x074) + 0x20 * (n))
>  #define ISPCSI2_CTX_CTRL2_USER_DEF_MAP_SHIFT	13
> @@ -1385,7 +1385,7 @@
>  #define ISPCSI2_CTX_CTRL2_VIRTUAL_ID_SHIFT	11
>  #define ISPCSI2_CTX_CTRL2_VIRTUAL_ID_MASK	\
>  	(0x3 <<	ISPCSI2_CTX_CTRL2_VIRTUAL_ID_SHIFT)
> -#define ISPCSI2_CTX_CTRL2_DPCM_PRED		(1 << 10)
> +#define ISPCSI2_CTX_CTRL2_DPCM_PRED		BIT(10)
>  #define ISPCSI2_CTX_CTRL2_FORMAT_SHIFT		0
>  #define ISPCSI2_CTX_CTRL2_FORMAT_MASK		\
>  	(0x3ff << ISPCSI2_CTX_CTRL2_FORMAT_SHIFT)
> @@ -1401,24 +1401,24 @@
>  #define ISPCSI2_CTX_DAT_PING_ADDR(n)		((0x07c) + 0x20 * (n))
>  #define ISPCSI2_CTX_DAT_PONG_ADDR(n)		((0x080) + 0x20 * (n))
>  #define ISPCSI2_CTX_IRQENABLE(n)		((0x084) + 0x20 * (n))
> -#define ISPCSI2_CTX_IRQENABLE_ECC_CORRECTION_IRQ	(1 << 8)
> -#define ISPCSI2_CTX_IRQENABLE_LINE_NUMBER_IRQ	(1 << 7)
> -#define ISPCSI2_CTX_IRQENABLE_FRAME_NUMBER_IRQ	(1 << 6)
> -#define ISPCSI2_CTX_IRQENABLE_CS_IRQ		(1 << 5)
> -#define ISPCSI2_CTX_IRQENABLE_LE_IRQ		(1 << 3)
> -#define ISPCSI2_CTX_IRQENABLE_LS_IRQ		(1 << 2)
> -#define ISPCSI2_CTX_IRQENABLE_FE_IRQ		(1 << 1)
> -#define ISPCSI2_CTX_IRQENABLE_FS_IRQ		(1 << 0)
> +#define ISPCSI2_CTX_IRQENABLE_ECC_CORRECTION_IRQ	BIT(8)
> +#define ISPCSI2_CTX_IRQENABLE_LINE_NUMBER_IRQ	BIT(7)
> +#define ISPCSI2_CTX_IRQENABLE_FRAME_NUMBER_IRQ	BIT(6)
> +#define ISPCSI2_CTX_IRQENABLE_CS_IRQ		BIT(5)
> +#define ISPCSI2_CTX_IRQENABLE_LE_IRQ		BIT(3)
> +#define ISPCSI2_CTX_IRQENABLE_LS_IRQ		BIT(2)
> +#define ISPCSI2_CTX_IRQENABLE_FE_IRQ		BIT(1)
> +#define ISPCSI2_CTX_IRQENABLE_FS_IRQ		BIT(0)
>  
>  #define ISPCSI2_CTX_IRQSTATUS(n)		((0x088) + 0x20 * (n))
> -#define ISPCSI2_CTX_IRQSTATUS_ECC_CORRECTION_IRQ	(1 << 8)
> -#define ISPCSI2_CTX_IRQSTATUS_LINE_NUMBER_IRQ	(1 << 7)
> -#define ISPCSI2_CTX_IRQSTATUS_FRAME_NUMBER_IRQ	(1 << 6)
> -#define ISPCSI2_CTX_IRQSTATUS_CS_IRQ		(1 << 5)
> -#define ISPCSI2_CTX_IRQSTATUS_LE_IRQ		(1 << 3)
> -#define ISPCSI2_CTX_IRQSTATUS_LS_IRQ		(1 << 2)
> -#define ISPCSI2_CTX_IRQSTATUS_FE_IRQ		(1 << 1)
> -#define ISPCSI2_CTX_IRQSTATUS_FS_IRQ		(1 << 0)
> +#define ISPCSI2_CTX_IRQSTATUS_ECC_CORRECTION_IRQ	BIT(8)
> +#define ISPCSI2_CTX_IRQSTATUS_LINE_NUMBER_IRQ	BIT(7)
> +#define ISPCSI2_CTX_IRQSTATUS_FRAME_NUMBER_IRQ	BIT(6)
> +#define ISPCSI2_CTX_IRQSTATUS_CS_IRQ		BIT(5)
> +#define ISPCSI2_CTX_IRQSTATUS_LE_IRQ		BIT(3)
> +#define ISPCSI2_CTX_IRQSTATUS_LS_IRQ		BIT(2)
> +#define ISPCSI2_CTX_IRQSTATUS_FE_IRQ		BIT(1)
> +#define ISPCSI2_CTX_IRQSTATUS_FS_IRQ		BIT(0)
>  
>  #define ISPCSI2_CTX_CTRL3(n)			((0x08c) + 0x20 * (n))
>  #define ISPCSI2_CTX_CTRL3_ALPHA_SHIFT		5
> @@ -1454,9 +1454,9 @@
>  	(0xff << ISPCSIPHY_REG0_THS_SETTLE_SHIFT)
>  
>  #define ISPCSIPHY_REG1					(0x004)
> -#define ISPCSIPHY_REG1_RESET_DONE_CTRLCLK		(1 << 29)
> +#define ISPCSIPHY_REG1_RESET_DONE_CTRLCLK		BIT(29)
>  /* This field is for OMAP3630 only */
> -#define ISPCSIPHY_REG1_CLOCK_MISS_DETECTOR_STATUS	(1 << 25)
> +#define ISPCSIPHY_REG1_CLOCK_MISS_DETECTOR_STATUS	BIT(25)
>  #define ISPCSIPHY_REG1_TCLK_TERM_SHIFT			18
>  #define ISPCSIPHY_REG1_TCLK_TERM_MASK			\
>  	(0x7f << ISPCSIPHY_REG1_TCLK_TERM_SHIFT)
> @@ -1498,11 +1498,11 @@
>   */
>  
>  /* OMAP343X_CONTROL_CSIRXFE */
> -#define OMAP343X_CONTROL_CSIRXFE_CSIB_INV	(1 << 7)
> -#define OMAP343X_CONTROL_CSIRXFE_RESENABLE	(1 << 8)
> -#define OMAP343X_CONTROL_CSIRXFE_SELFORM	(1 << 10)
> -#define OMAP343X_CONTROL_CSIRXFE_PWRDNZ		(1 << 12)
> -#define OMAP343X_CONTROL_CSIRXFE_RESET		(1 << 13)
> +#define OMAP343X_CONTROL_CSIRXFE_CSIB_INV	BIT(7)
> +#define OMAP343X_CONTROL_CSIRXFE_RESENABLE	BIT(8)
> +#define OMAP343X_CONTROL_CSIRXFE_SELFORM	BIT(10)
> +#define OMAP343X_CONTROL_CSIRXFE_PWRDNZ		BIT(12)
> +#define OMAP343X_CONTROL_CSIRXFE_RESET		BIT(13)
>  
>  /* OMAP3630_CONTROL_CAMERA_PHY_CTRL */
>  #define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_PHY1_SHIFT	2
> @@ -1513,6 +1513,6 @@
>  #define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_GPI		0x3
>  #define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_MASK		0x3
>  /* CCP2B: set to receive data from PHY2 instead of PHY1 */
> -#define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CSI1_RX_SEL_PHY2	(1 << 4)
> +#define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CSI1_RX_SEL_PHY2	BIT(4)
>  
>  #endif	/* OMAP3_ISP_REG_H */

[snip]

> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
> index 1bb1d39c60d9..207c220f42aa 100644
> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> @@ -15,8 +15,8 @@
>   */
>  
>  #define VI6_CMD(n)			(0x0000 + (n) * 4)
> -#define VI6_CMD_UPDHDR			(1 << 4)
> -#define VI6_CMD_STRCMD			(1 << 0)
> +#define VI6_CMD_UPDHDR			BIT(4)
> +#define VI6_CMD_STRCMD			BIT(0)
>  
>  #define VI6_CLK_DCSWT			0x0018
>  #define VI6_CLK_DCSWT_CSTPW_MASK	(0xff << 8)
> @@ -32,21 +32,21 @@
>  #define VI6_STATUS_SYS_ACT(n)		(1 << ((n) + 8))

BIT((n) + 8)

>  
>  #define VI6_WPF_IRQ_ENB(n)		(0x0048 + (n) * 12)
> -#define VI6_WFP_IRQ_ENB_DFEE		(1 << 1)
> -#define VI6_WFP_IRQ_ENB_FREE		(1 << 0)
> +#define VI6_WFP_IRQ_ENB_DFEE		BIT(1)
> +#define VI6_WFP_IRQ_ENB_FREE		BIT(0)
>  
>  #define VI6_WPF_IRQ_STA(n)		(0x004c + (n) * 12)
> -#define VI6_WFP_IRQ_STA_DFE		(1 << 1)
> -#define VI6_WFP_IRQ_STA_FRE		(1 << 0)
> +#define VI6_WFP_IRQ_STA_DFE		BIT(1)
> +#define VI6_WFP_IRQ_STA_FRE		BIT(0)
>  
>  #define VI6_DISP_IRQ_ENB(n)		(0x0078 + (n) * 60)
> -#define VI6_DISP_IRQ_ENB_DSTE		(1 << 8)
> -#define VI6_DISP_IRQ_ENB_MAEE		(1 << 5)
> +#define VI6_DISP_IRQ_ENB_DSTE		BIT(8)
> +#define VI6_DISP_IRQ_ENB_MAEE		BIT(5)
>  #define VI6_DISP_IRQ_ENB_LNEE(n)	(1 << (n))

BIT(n)

>  
>  #define VI6_DISP_IRQ_STA(n)		(0x007c + (n) * 60)
> -#define VI6_DISP_IRQ_STA_DST		(1 << 8)
> -#define VI6_DISP_IRQ_STA_MAE		(1 << 5)
> +#define VI6_DISP_IRQ_STA_DST		BIT(8)
> +#define VI6_DISP_IRQ_STA_MAE		BIT(5)
>  #define VI6_DISP_IRQ_STA_LNE(n)		(1 << (n))

Here too.

>  #define VI6_WPF_LINE_COUNT(n)		(0x0084 + (n) * 4)
> @@ -59,32 +59,32 @@
>  #define VI6_DL_CTRL			0x0100
>  #define VI6_DL_CTRL_AR_WAIT_MASK	(0xffff << 16)
>  #define VI6_DL_CTRL_AR_WAIT_SHIFT	16
> -#define VI6_DL_CTRL_DC2			(1 << 12)
> -#define VI6_DL_CTRL_DC1			(1 << 8)
> -#define VI6_DL_CTRL_DC0			(1 << 4)
> -#define VI6_DL_CTRL_CFM0		(1 << 2)
> -#define VI6_DL_CTRL_NH0			(1 << 1)
> -#define VI6_DL_CTRL_DLE			(1 << 0)
> +#define VI6_DL_CTRL_DC2			BIT(12)
> +#define VI6_DL_CTRL_DC1			BIT(8)
> +#define VI6_DL_CTRL_DC0			BIT(4)
> +#define VI6_DL_CTRL_CFM0		BIT(2)
> +#define VI6_DL_CTRL_NH0			BIT(1)
> +#define VI6_DL_CTRL_DLE			BIT(0)
>  
>  #define VI6_DL_HDR_ADDR(n)		(0x0104 + (n) * 4)
>  
>  #define VI6_DL_SWAP			0x0114
> -#define VI6_DL_SWAP_LWS			(1 << 2)
> -#define VI6_DL_SWAP_WDS			(1 << 1)
> -#define VI6_DL_SWAP_BTS			(1 << 0)
> +#define VI6_DL_SWAP_LWS			BIT(2)
> +#define VI6_DL_SWAP_WDS			BIT(1)
> +#define VI6_DL_SWAP_BTS			BIT(0)
>  
>  #define VI6_DL_EXT_CTRL(n)		(0x011c + (n) * 36)
> -#define VI6_DL_EXT_CTRL_NWE		(1 << 16)
> +#define VI6_DL_EXT_CTRL_NWE		BIT(16)
>  #define VI6_DL_EXT_CTRL_POLINT_MASK	(0x3f << 8)
>  #define VI6_DL_EXT_CTRL_POLINT_SHIFT	8
> -#define VI6_DL_EXT_CTRL_DLPRI		(1 << 5)
> -#define VI6_DL_EXT_CTRL_EXPRI		(1 << 4)
> -#define VI6_DL_EXT_CTRL_EXT		(1 << 0)
> +#define VI6_DL_EXT_CTRL_DLPRI		BIT(5)
> +#define VI6_DL_EXT_CTRL_EXPRI		BIT(4)
> +#define VI6_DL_EXT_CTRL_EXT		BIT(0)
>  
>  #define VI6_DL_EXT_AUTOFLD_INT		BIT(0)
>  
>  #define VI6_DL_BODY_SIZE		0x0120
> -#define VI6_DL_BODY_SIZE_UPD		(1 << 24)
> +#define VI6_DL_BODY_SIZE_UPD		BIT(24)
>  #define VI6_DL_BODY_SIZE_BS_MASK	(0x1ffff << 0)
>  #define VI6_DL_BODY_SIZE_BS_SHIFT	0
>  
> @@ -107,32 +107,32 @@
>  #define VI6_RPF_SRC_ESIZE_EVSIZE_SHIFT	0
>  
>  #define VI6_RPF_INFMT			0x0308
> -#define VI6_RPF_INFMT_VIR		(1 << 28)
> -#define VI6_RPF_INFMT_CIPM		(1 << 16)
> -#define VI6_RPF_INFMT_SPYCS		(1 << 15)
> -#define VI6_RPF_INFMT_SPUVS		(1 << 14)
> +#define VI6_RPF_INFMT_VIR		BIT(28)
> +#define VI6_RPF_INFMT_CIPM		BIT(16)
> +#define VI6_RPF_INFMT_SPYCS		BIT(15)
> +#define VI6_RPF_INFMT_SPUVS		BIT(14)
>  #define VI6_RPF_INFMT_CEXT_ZERO		(0 << 12)
> -#define VI6_RPF_INFMT_CEXT_EXT		(1 << 12)
> +#define VI6_RPF_INFMT_CEXT_EXT		BIT(12)

Please don't replace this one.

>  #define VI6_RPF_INFMT_CEXT_ONE		(2 << 12)
>  #define VI6_RPF_INFMT_CEXT_MASK		(3 << 12)
>  #define VI6_RPF_INFMT_RDTM_BT601	(0 << 9)
> -#define VI6_RPF_INFMT_RDTM_BT601_EXT	(1 << 9)
> +#define VI6_RPF_INFMT_RDTM_BT601_EXT	BIT(9)

And this one.

>  #define VI6_RPF_INFMT_RDTM_BT709	(2 << 9)
>  #define VI6_RPF_INFMT_RDTM_BT709_EXT	(3 << 9)
>  #define VI6_RPF_INFMT_RDTM_MASK		(7 << 9)
> -#define VI6_RPF_INFMT_CSC		(1 << 8)
> +#define VI6_RPF_INFMT_CSC		BIT(8)
>  #define VI6_RPF_INFMT_RDFMT_MASK	(0x7f << 0)
>  #define VI6_RPF_INFMT_RDFMT_SHIFT	0
>  
>  #define VI6_RPF_DSWAP			0x030c
> -#define VI6_RPF_DSWAP_A_LLS		(1 << 11)
> -#define VI6_RPF_DSWAP_A_LWS		(1 << 10)
> -#define VI6_RPF_DSWAP_A_WDS		(1 << 9)
> -#define VI6_RPF_DSWAP_A_BTS		(1 << 8)
> -#define VI6_RPF_DSWAP_P_LLS		(1 << 3)
> -#define VI6_RPF_DSWAP_P_LWS		(1 << 2)
> -#define VI6_RPF_DSWAP_P_WDS		(1 << 1)
> -#define VI6_RPF_DSWAP_P_BTS		(1 << 0)
> +#define VI6_RPF_DSWAP_A_LLS		BIT(11)
> +#define VI6_RPF_DSWAP_A_LWS		BIT(10)
> +#define VI6_RPF_DSWAP_A_WDS		BIT(9)
> +#define VI6_RPF_DSWAP_A_BTS		BIT(8)
> +#define VI6_RPF_DSWAP_P_LLS		BIT(3)
> +#define VI6_RPF_DSWAP_P_LWS		BIT(2)
> +#define VI6_RPF_DSWAP_P_WDS		BIT(1)
> +#define VI6_RPF_DSWAP_P_BTS		BIT(0)
>  
>  #define VI6_RPF_LOC			0x0310
>  #define VI6_RPF_LOC_HCOORD_MASK		(0x1fff << 16)
> @@ -142,7 +142,7 @@
>  
>  #define VI6_RPF_ALPH_SEL		0x0314
>  #define VI6_RPF_ALPH_SEL_ASEL_PACKED	(0 << 28)
> -#define VI6_RPF_ALPH_SEL_ASEL_8B_PLANE	(1 << 28)
> +#define VI6_RPF_ALPH_SEL_ASEL_8B_PLANE	BIT(28)

And this one.

>  #define VI6_RPF_ALPH_SEL_ASEL_SELECT	(2 << 28)
>  #define VI6_RPF_ALPH_SEL_ASEL_1B_PLANE	(3 << 28)
>  #define VI6_RPF_ALPH_SEL_ASEL_FIXED	(4 << 28)
> @@ -150,9 +150,9 @@
>  #define VI6_RPF_ALPH_SEL_ASEL_SHIFT	28
>  #define VI6_RPF_ALPH_SEL_IROP_MASK	(0xf << 24)
>  #define VI6_RPF_ALPH_SEL_IROP_SHIFT	24
> -#define VI6_RPF_ALPH_SEL_BSEL		(1 << 23)
> +#define VI6_RPF_ALPH_SEL_BSEL		BIT(23)
>  #define VI6_RPF_ALPH_SEL_AEXT_ZERO	(0 << 18)
> -#define VI6_RPF_ALPH_SEL_AEXT_EXT	(1 << 18)
> +#define VI6_RPF_ALPH_SEL_AEXT_EXT	BIT(18)

And this one.

>  #define VI6_RPF_ALPH_SEL_AEXT_ONE	(2 << 18)
>  #define VI6_RPF_ALPH_SEL_AEXT_MASK	(3 << 18)
>  #define VI6_RPF_ALPH_SEL_ALPHA1_MASK	(0xff << 8)
> @@ -171,7 +171,7 @@
>  #define VI6_RPF_VRTCOL_SET_LAYB_SHIFT	0
>  
>  #define VI6_RPF_MSK_CTRL		0x031c
> -#define VI6_RPF_MSK_CTRL_MSK_EN		(1 << 24)
> +#define VI6_RPF_MSK_CTRL_MSK_EN		BIT(24)
>  #define VI6_RPF_MSK_CTRL_MGR_MASK	(0xff << 16)
>  #define VI6_RPF_MSK_CTRL_MGR_SHIFT	16
>  #define VI6_RPF_MSK_CTRL_MGG_MASK	(0xff << 8)
> @@ -191,9 +191,9 @@
>  #define VI6_RPF_MSK_SET_MSB_SHIFT	0
>  
>  #define VI6_RPF_CKEY_CTRL		0x0328
> -#define VI6_RPF_CKEY_CTRL_CV		(1 << 4)
> -#define VI6_RPF_CKEY_CTRL_SAPE1		(1 << 1)
> -#define VI6_RPF_CKEY_CTRL_SAPE0		(1 << 0)
> +#define VI6_RPF_CKEY_CTRL_CV		BIT(4)
> +#define VI6_RPF_CKEY_CTRL_SAPE1		BIT(1)
> +#define VI6_RPF_CKEY_CTRL_SAPE0		BIT(0)
>  
>  #define VI6_RPF_CKEY_SET0		0x032c
>  #define VI6_RPF_CKEY_SET1		0x0330
> @@ -220,9 +220,9 @@
>  
>  #define VI6_RPF_MULT_ALPHA		0x036c
>  #define VI6_RPF_MULT_ALPHA_A_MMD_NONE	(0 << 12)
> -#define VI6_RPF_MULT_ALPHA_A_MMD_RATIO	(1 << 12)
> +#define VI6_RPF_MULT_ALPHA_A_MMD_RATIO	BIT(12)

And this one.

>  #define VI6_RPF_MULT_ALPHA_P_MMD_NONE	(0 << 8)
> -#define VI6_RPF_MULT_ALPHA_P_MMD_RATIO	(1 << 8)
> +#define VI6_RPF_MULT_ALPHA_P_MMD_RATIO	BIT(8)

And this one.

>  #define VI6_RPF_MULT_ALPHA_P_MMD_IMAGE	(2 << 8)
>  #define VI6_RPF_MULT_ALPHA_P_MMD_BOTH	(3 << 8)
>  #define VI6_RPF_MULT_ALPHA_RATIO_MASK	(0xff << 0)
> @@ -236,11 +236,11 @@
>  
>  #define VI6_WPF_SRCRPF			0x1000
>  #define VI6_WPF_SRCRPF_VIRACT_DIS	(0 << 28)
> -#define VI6_WPF_SRCRPF_VIRACT_SUB	(1 << 28)
> +#define VI6_WPF_SRCRPF_VIRACT_SUB	BIT(28)

And this one.

>  #define VI6_WPF_SRCRPF_VIRACT_MST	(2 << 28)
>  #define VI6_WPF_SRCRPF_VIRACT_MASK	(3 << 28)
>  #define VI6_WPF_SRCRPF_VIRACT2_DIS	(0 << 24)
> -#define VI6_WPF_SRCRPF_VIRACT2_SUB	(1 << 24)
> +#define VI6_WPF_SRCRPF_VIRACT2_SUB	BIT(24)

And this one.

>  #define VI6_WPF_SRCRPF_VIRACT2_MST	(2 << 24)
>  #define VI6_WPF_SRCRPF_VIRACT2_MASK	(3 << 24)
>  #define VI6_WPF_SRCRPF_RPF_ACT_DIS(n)	(0 << ((n) * 2))
> @@ -250,7 +250,7 @@
>  
>  #define VI6_WPF_HSZCLIP			0x1004
>  #define VI6_WPF_VSZCLIP			0x1008
> -#define VI6_WPF_SZCLIP_EN		(1 << 28)
> +#define VI6_WPF_SZCLIP_EN		BIT(28)
>  #define VI6_WPF_SZCLIP_OFST_MASK	(0xff << 16)
>  #define VI6_WPF_SZCLIP_OFST_SHIFT	16
>  #define VI6_WPF_SZCLIP_SIZE_MASK	(0xfff << 0)
> @@ -259,45 +259,45 @@
>  #define VI6_WPF_OUTFMT			0x100c
>  #define VI6_WPF_OUTFMT_PDV_MASK		(0xff << 24)
>  #define VI6_WPF_OUTFMT_PDV_SHIFT	24
> -#define VI6_WPF_OUTFMT_PXA		(1 << 23)
> -#define VI6_WPF_OUTFMT_ROT		(1 << 18)
> -#define VI6_WPF_OUTFMT_HFLP		(1 << 17)
> -#define VI6_WPF_OUTFMT_FLP		(1 << 16)
> -#define VI6_WPF_OUTFMT_SPYCS		(1 << 15)
> -#define VI6_WPF_OUTFMT_SPUVS		(1 << 14)
> +#define VI6_WPF_OUTFMT_PXA		BIT(23)
> +#define VI6_WPF_OUTFMT_ROT		BIT(18)
> +#define VI6_WPF_OUTFMT_HFLP		BIT(17)
> +#define VI6_WPF_OUTFMT_FLP		BIT(16)
> +#define VI6_WPF_OUTFMT_SPYCS		BIT(15)
> +#define VI6_WPF_OUTFMT_SPUVS		BIT(14)
>  #define VI6_WPF_OUTFMT_DITH_DIS		(0 << 12)
>  #define VI6_WPF_OUTFMT_DITH_EN		(3 << 12)
>  #define VI6_WPF_OUTFMT_DITH_MASK	(3 << 12)
>  #define VI6_WPF_OUTFMT_WRTM_BT601	(0 << 9)
> -#define VI6_WPF_OUTFMT_WRTM_BT601_EXT	(1 << 9)
> +#define VI6_WPF_OUTFMT_WRTM_BT601_EXT	BIT(9)

And this one.

>  #define VI6_WPF_OUTFMT_WRTM_BT709	(2 << 9)
>  #define VI6_WPF_OUTFMT_WRTM_BT709_EXT	(3 << 9)
>  #define VI6_WPF_OUTFMT_WRTM_MASK	(7 << 9)
> -#define VI6_WPF_OUTFMT_CSC		(1 << 8)
> +#define VI6_WPF_OUTFMT_CSC		BIT(8)
>  #define VI6_WPF_OUTFMT_WRFMT_MASK	(0x7f << 0)
>  #define VI6_WPF_OUTFMT_WRFMT_SHIFT	0
>  
>  #define VI6_WPF_DSWAP			0x1010
> -#define VI6_WPF_DSWAP_P_LLS		(1 << 3)
> -#define VI6_WPF_DSWAP_P_LWS		(1 << 2)
> -#define VI6_WPF_DSWAP_P_WDS		(1 << 1)
> -#define VI6_WPF_DSWAP_P_BTS		(1 << 0)
> +#define VI6_WPF_DSWAP_P_LLS		BIT(3)
> +#define VI6_WPF_DSWAP_P_LWS		BIT(2)
> +#define VI6_WPF_DSWAP_P_WDS		BIT(1)
> +#define VI6_WPF_DSWAP_P_BTS		BIT(0)
>  
>  #define VI6_WPF_RNDCTRL			0x1014
> -#define VI6_WPF_RNDCTRL_CBRM		(1 << 28)
> +#define VI6_WPF_RNDCTRL_CBRM		BIT(28)
>  #define VI6_WPF_RNDCTRL_ABRM_TRUNC	(0 << 24)
> -#define VI6_WPF_RNDCTRL_ABRM_ROUND	(1 << 24)
> +#define VI6_WPF_RNDCTRL_ABRM_ROUND	BIT(24)

And this one.

>  #define VI6_WPF_RNDCTRL_ABRM_THRESH	(2 << 24)
>  #define VI6_WPF_RNDCTRL_ABRM_MASK	(3 << 24)
>  #define VI6_WPF_RNDCTRL_ATHRESH_MASK	(0xff << 16)
>  #define VI6_WPF_RNDCTRL_ATHRESH_SHIFT	16
>  #define VI6_WPF_RNDCTRL_CLMD_FULL	(0 << 12)
> -#define VI6_WPF_RNDCTRL_CLMD_CLIP	(1 << 12)
> +#define VI6_WPF_RNDCTRL_CLMD_CLIP	BIT(12)

And this one.

>  #define VI6_WPF_RNDCTRL_CLMD_EXT	(2 << 12)
>  #define VI6_WPF_RNDCTRL_CLMD_MASK	(3 << 12)
>  
>  #define VI6_WPF_ROT_CTRL		0x1018
> -#define VI6_WPF_ROT_CTRL_LN16		(1 << 17)
> +#define VI6_WPF_ROT_CTRL_LN16		BIT(17)
>  #define VI6_WPF_ROT_CTRL_LMEM_WD_MASK	(0x1fff << 0)
>  #define VI6_WPF_ROT_CTRL_LMEM_WD_SHIFT	0
>  
> @@ -308,7 +308,7 @@
>  #define VI6_WPF_DSTM_ADDR_C1		0x102c
>  
>  #define VI6_WPF_WRBCK_CTRL(n)		(0x1034 + (n) * 0x100)
> -#define VI6_WPF_WRBCK_CTRL_WBMD		(1 << 0)
> +#define VI6_WPF_WRBCK_CTRL_WBMD		BIT(0)
>  
>  /* -----------------------------------------------------------------------------
>   * UIF Control Registers
> @@ -317,20 +317,20 @@
>  #define VI6_UIF_OFFSET			0x100
>  
>  #define VI6_UIF_DISCOM_DOCMCR		0x1c00
> -#define VI6_UIF_DISCOM_DOCMCR_CMPRU	(1 << 16)
> -#define VI6_UIF_DISCOM_DOCMCR_CMPR	(1 << 0)
> +#define VI6_UIF_DISCOM_DOCMCR_CMPRU	BIT(16)
> +#define VI6_UIF_DISCOM_DOCMCR_CMPR	BIT(0)
>  
>  #define VI6_UIF_DISCOM_DOCMSTR		0x1c04
> -#define VI6_UIF_DISCOM_DOCMSTR_CMPPRE	(1 << 1)
> -#define VI6_UIF_DISCOM_DOCMSTR_CMPST	(1 << 0)
> +#define VI6_UIF_DISCOM_DOCMSTR_CMPPRE	BIT(1)
> +#define VI6_UIF_DISCOM_DOCMSTR_CMPST	BIT(0)
>  
>  #define VI6_UIF_DISCOM_DOCMCLSTR	0x1c08
> -#define VI6_UIF_DISCOM_DOCMCLSTR_CMPCLPRE	(1 << 1)
> -#define VI6_UIF_DISCOM_DOCMCLSTR_CMPCLST	(1 << 0)
> +#define VI6_UIF_DISCOM_DOCMCLSTR_CMPCLPRE	BIT(1)
> +#define VI6_UIF_DISCOM_DOCMCLSTR_CMPCLST	BIT(0)
>  
>  #define VI6_UIF_DISCOM_DOCMIENR		0x1c0c
> -#define VI6_UIF_DISCOM_DOCMIENR_CMPPREIEN	(1 << 1)
> -#define VI6_UIF_DISCOM_DOCMIENR_CMPIEN		(1 << 0)
> +#define VI6_UIF_DISCOM_DOCMIENR_CMPPREIEN	BIT(1)
> +#define VI6_UIF_DISCOM_DOCMIENR_CMPIEN		BIT(0)
>  
>  #define VI6_UIF_DISCOM_DOCMMDR		0x1c10
>  #define VI6_UIF_DISCOM_DOCMMDR_INTHRH(n)	((n) << 16)
> @@ -338,7 +338,7 @@
>  #define VI6_UIF_DISCOM_DOCMPMR		0x1c14
>  #define VI6_UIF_DISCOM_DOCMPMR_CMPDFF(n)	((n) << 17)
>  #define VI6_UIF_DISCOM_DOCMPMR_CMPDFA(n)	((n) << 8)
> -#define VI6_UIF_DISCOM_DOCMPMR_CMPDAUF		(1 << 7)
> +#define VI6_UIF_DISCOM_DOCMPMR_CMPDAUF		BIT(7)
>  #define VI6_UIF_DISCOM_DOCMPMR_SEL(n)		((n) << 0)
>  
>  #define VI6_UIF_DISCOM_DOCMECRCR	0x1c18
> @@ -365,7 +365,7 @@
>  #define VI6_DPR_HSI_ROUTE		0x2048
>  #define VI6_DPR_BRU_ROUTE		0x204c
>  #define VI6_DPR_ILV_BRS_ROUTE		0x2050
> -#define VI6_DPR_ROUTE_BRSSEL		(1 << 28)
> +#define VI6_DPR_ROUTE_BRSSEL		BIT(28)
>  #define VI6_DPR_ROUTE_FXA_MASK		(0xff << 16)
>  #define VI6_DPR_ROUTE_FXA_SHIFT		16
>  #define VI6_DPR_ROUTE_FP_MASK		(0x3f << 8)
> @@ -407,10 +407,10 @@
>  #define VI6_SRU_CTRL0_PARAM1_MASK	(0x1f << 8)
>  #define VI6_SRU_CTRL0_PARAM1_SHIFT	8
>  #define VI6_SRU_CTRL0_MODE_UPSCALE	(4 << 4)
> -#define VI6_SRU_CTRL0_PARAM2		(1 << 3)
> -#define VI6_SRU_CTRL0_PARAM3		(1 << 2)
> -#define VI6_SRU_CTRL0_PARAM4		(1 << 1)
> -#define VI6_SRU_CTRL0_EN		(1 << 0)
> +#define VI6_SRU_CTRL0_PARAM2		BIT(3)
> +#define VI6_SRU_CTRL0_PARAM3		BIT(2)
> +#define VI6_SRU_CTRL0_PARAM4		BIT(1)
> +#define VI6_SRU_CTRL0_EN		BIT(0)
>  
>  #define VI6_SRU_CTRL1			0x2204
>  #define VI6_SRU_CTRL1_PARAM5		0x7ff
> @@ -427,18 +427,18 @@
>  #define VI6_UDS_OFFSET			0x100
>  
>  #define VI6_UDS_CTRL			0x2300
> -#define VI6_UDS_CTRL_AMD		(1 << 30)
> -#define VI6_UDS_CTRL_FMD		(1 << 29)
> -#define VI6_UDS_CTRL_BLADV		(1 << 28)
> -#define VI6_UDS_CTRL_AON		(1 << 25)
> -#define VI6_UDS_CTRL_ATHON		(1 << 24)
> -#define VI6_UDS_CTRL_BC			(1 << 20)
> -#define VI6_UDS_CTRL_NE_A		(1 << 19)
> -#define VI6_UDS_CTRL_NE_RCR		(1 << 18)
> -#define VI6_UDS_CTRL_NE_GY		(1 << 17)
> -#define VI6_UDS_CTRL_NE_BCB		(1 << 16)
> -#define VI6_UDS_CTRL_AMDSLH		(1 << 2)
> -#define VI6_UDS_CTRL_TDIPC		(1 << 1)
> +#define VI6_UDS_CTRL_AMD		BIT(30)
> +#define VI6_UDS_CTRL_FMD		BIT(29)
> +#define VI6_UDS_CTRL_BLADV		BIT(28)
> +#define VI6_UDS_CTRL_AON		BIT(25)
> +#define VI6_UDS_CTRL_ATHON		BIT(24)
> +#define VI6_UDS_CTRL_BC			BIT(20)
> +#define VI6_UDS_CTRL_NE_A		BIT(19)
> +#define VI6_UDS_CTRL_NE_RCR		BIT(18)
> +#define VI6_UDS_CTRL_NE_GY		BIT(17)
> +#define VI6_UDS_CTRL_NE_BCB		BIT(16)
> +#define VI6_UDS_CTRL_AMDSLH		BIT(2)
> +#define VI6_UDS_CTRL_TDIPC		BIT(1)
>  
>  #define VI6_UDS_SCALE			0x2304
>  #define VI6_UDS_SCALE_HMANT_MASK	(0xf << 28)
> @@ -477,12 +477,12 @@
>  #define VI6_UDS_HPHASE_HEDP_SHIFT	0
>  
>  #define VI6_UDS_IPC			0x2318
> -#define VI6_UDS_IPC_FIELD		(1 << 27)
> +#define VI6_UDS_IPC_FIELD		BIT(27)
>  #define VI6_UDS_IPC_VEDP_MASK		(0xfff << 0)
>  #define VI6_UDS_IPC_VEDP_SHIFT		0
>  
>  #define VI6_UDS_HSZCLIP			0x231c
> -#define VI6_UDS_HSZCLIP_HCEN		(1 << 28)
> +#define VI6_UDS_HSZCLIP_HCEN		BIT(28)
>  #define VI6_UDS_HSZCLIP_HCL_OFST_MASK	(0xff << 16)
>  #define VI6_UDS_HSZCLIP_HCL_OFST_SHIFT	16
>  #define VI6_UDS_HSZCLIP_HCL_SIZE_MASK	(0x1fff << 0)
> @@ -507,36 +507,36 @@
>   */
>  
>  #define VI6_LUT_CTRL			0x2800
> -#define VI6_LUT_CTRL_EN			(1 << 0)
> +#define VI6_LUT_CTRL_EN			BIT(0)
>  
>  /* -----------------------------------------------------------------------------
>   * CLU Control Registers
>   */
>  
>  #define VI6_CLU_CTRL			0x2900
> -#define VI6_CLU_CTRL_AAI		(1 << 28)
> -#define VI6_CLU_CTRL_MVS		(1 << 24)
> +#define VI6_CLU_CTRL_AAI		BIT(28)
> +#define VI6_CLU_CTRL_MVS		BIT(24)
>  #define VI6_CLU_CTRL_AX1I_2D		(3 << 14)
> -#define VI6_CLU_CTRL_AX2I_2D		(1 << 12)
> +#define VI6_CLU_CTRL_AX2I_2D		BIT(12)

This is a 2-bit field, please don't replace it either.

>  #define VI6_CLU_CTRL_OS0_2D		(3 << 8)
> -#define VI6_CLU_CTRL_OS1_2D		(1 << 6)
> +#define VI6_CLU_CTRL_OS1_2D		BIT(6)

Same here.

>  #define VI6_CLU_CTRL_OS2_2D		(3 << 4)
> -#define VI6_CLU_CTRL_M2D		(1 << 1)
> -#define VI6_CLU_CTRL_EN			(1 << 0)
> +#define VI6_CLU_CTRL_M2D		BIT(1)
> +#define VI6_CLU_CTRL_EN			BIT(0)
>  
>  /* -----------------------------------------------------------------------------
>   * HST Control Registers
>   */
>  
>  #define VI6_HST_CTRL			0x2a00
> -#define VI6_HST_CTRL_EN			(1 << 0)
> +#define VI6_HST_CTRL_EN			BIT(0)
>  
>  /* -----------------------------------------------------------------------------
>   * HSI Control Registers
>   */
>  
>  #define VI6_HSI_CTRL			0x2b00
> -#define VI6_HSI_CTRL_EN			(1 << 0)
> +#define VI6_HSI_CTRL_EN			BIT(0)
>  
>  /* -----------------------------------------------------------------------------
>   * BRS and BRU Control Registers
> @@ -563,7 +563,7 @@
>  #define VI6_BRS_BASE			0x3900
>  
>  #define VI6_BRU_INCTRL			0x0000
> -#define VI6_BRU_INCTRL_NRM		(1 << 28)
> +#define VI6_BRU_INCTRL_NRM		BIT(28)
>  #define VI6_BRU_INCTRL_DnON		(1 << (16 + (n)))
>  #define VI6_BRU_INCTRL_DITHn_OFF	(0 << ((n) * 4))
>  #define VI6_BRU_INCTRL_DITHn_18BPP	(1 << ((n) * 4))
> @@ -597,7 +597,7 @@
>  #define VI6_BRU_VIRRPF_COL_BCB_SHIFT	0
>  
>  #define VI6_BRU_CTRL(n)			(0x0010 + (n) * 8 + ((n) <= 3 ? 0 : 4))
> -#define VI6_BRU_CTRL_RBC		(1 << 31)
> +#define VI6_BRU_CTRL_RBC		BIT(31)
>  #define VI6_BRU_CTRL_DSTSEL_BRUIN(n)	(((n) <= 3 ? (n) : (n)+1) << 20)
>  #define VI6_BRU_CTRL_DSTSEL_VRPF	(4 << 20)
>  #define VI6_BRU_CTRL_DSTSEL_MASK	(7 << 20)
> @@ -610,29 +610,29 @@
>  #define VI6_BRU_CTRL_AROP_MASK		(0xf << 0)
>  
>  #define VI6_BRU_BLD(n)			(0x0014 + (n) * 8 + ((n) <= 3 ? 0 : 4))
> -#define VI6_BRU_BLD_CBES		(1 << 31)
> +#define VI6_BRU_BLD_CBES		BIT(31)
>  #define VI6_BRU_BLD_CCMDX_DST_A		(0 << 28)
> -#define VI6_BRU_BLD_CCMDX_255_DST_A	(1 << 28)
> +#define VI6_BRU_BLD_CCMDX_255_DST_A	BIT(28)

This is a 3-bit field, please don't replace it.

>  #define VI6_BRU_BLD_CCMDX_SRC_A		(2 << 28)
>  #define VI6_BRU_BLD_CCMDX_255_SRC_A	(3 << 28)
>  #define VI6_BRU_BLD_CCMDX_COEFX		(4 << 28)
>  #define VI6_BRU_BLD_CCMDX_MASK		(7 << 28)
>  #define VI6_BRU_BLD_CCMDY_DST_A		(0 << 24)
> -#define VI6_BRU_BLD_CCMDY_255_DST_A	(1 << 24)
> +#define VI6_BRU_BLD_CCMDY_255_DST_A	BIT(24)

And this one.

>  #define VI6_BRU_BLD_CCMDY_SRC_A		(2 << 24)
>  #define VI6_BRU_BLD_CCMDY_255_SRC_A	(3 << 24)
>  #define VI6_BRU_BLD_CCMDY_COEFY		(4 << 24)
>  #define VI6_BRU_BLD_CCMDY_MASK		(7 << 24)
>  #define VI6_BRU_BLD_CCMDY_SHIFT		24
> -#define VI6_BRU_BLD_ABES		(1 << 23)
> +#define VI6_BRU_BLD_ABES		BIT(23)
>  #define VI6_BRU_BLD_ACMDX_DST_A		(0 << 20)
> -#define VI6_BRU_BLD_ACMDX_255_DST_A	(1 << 20)
> +#define VI6_BRU_BLD_ACMDX_255_DST_A	BIT(20)

And this one.

>  #define VI6_BRU_BLD_ACMDX_SRC_A		(2 << 20)
>  #define VI6_BRU_BLD_ACMDX_255_SRC_A	(3 << 20)
>  #define VI6_BRU_BLD_ACMDX_COEFX		(4 << 20)
>  #define VI6_BRU_BLD_ACMDX_MASK		(7 << 20)
>  #define VI6_BRU_BLD_ACMDY_DST_A		(0 << 16)
> -#define VI6_BRU_BLD_ACMDY_255_DST_A	(1 << 16)
> +#define VI6_BRU_BLD_ACMDY_255_DST_A	BIT(16)

And this one.

>  #define VI6_BRU_BLD_ACMDY_SRC_A		(2 << 16)
>  #define VI6_BRU_BLD_ACMDY_255_SRC_A	(3 << 16)
>  #define VI6_BRU_BLD_ACMDY_COEFY		(4 << 16)
> @@ -662,11 +662,11 @@
>  #define VI6_HGO_SIZE_HSIZE_SHIFT	16
>  #define VI6_HGO_SIZE_VSIZE_SHIFT	0
>  #define VI6_HGO_MODE			0x3008
> -#define VI6_HGO_MODE_STEP		(1 << 10)
> -#define VI6_HGO_MODE_MAXRGB		(1 << 7)
> -#define VI6_HGO_MODE_OFSB_R		(1 << 6)
> -#define VI6_HGO_MODE_OFSB_G		(1 << 5)
> -#define VI6_HGO_MODE_OFSB_B		(1 << 4)
> +#define VI6_HGO_MODE_STEP		BIT(10)
> +#define VI6_HGO_MODE_MAXRGB		BIT(7)
> +#define VI6_HGO_MODE_OFSB_R		BIT(6)
> +#define VI6_HGO_MODE_OFSB_G		BIT(5)
> +#define VI6_HGO_MODE_OFSB_B		BIT(4)
>  #define VI6_HGO_MODE_HRATIO_SHIFT	2
>  #define VI6_HGO_MODE_VRATIO_SHIFT	0
>  #define VI6_HGO_LB_TH			0x300c
> @@ -687,7 +687,7 @@
>  #define VI6_HGO_EXT_HIST_ADDR		0x335c
>  #define VI6_HGO_EXT_HIST_DATA		0x3360
>  #define VI6_HGO_REGRST			0x33fc
> -#define VI6_HGO_REGRST_RCLEA		(1 << 0)
> +#define VI6_HGO_REGRST_RCLEA		BIT(0)
>  
>  /* -----------------------------------------------------------------------------
>   * HGT Control Registers
> @@ -713,7 +713,7 @@
>  #define VI6_HGT_SUM			0x3754
>  #define VI6_HGT_LB_DET			0x3758
>  #define VI6_HGT_REGRST			0x37fc
> -#define VI6_HGT_REGRST_RCLEA		(1 << 0)
> +#define VI6_HGT_REGRST_RCLEA		BIT(0)
>  
>  /* -----------------------------------------------------------------------------
>   * LIF Control Registers
> @@ -724,9 +724,9 @@
>  #define VI6_LIF_CTRL			0x3b00
>  #define VI6_LIF_CTRL_OBTH_MASK		(0x7ff << 16)
>  #define VI6_LIF_CTRL_OBTH_SHIFT		16
> -#define VI6_LIF_CTRL_CFMT		(1 << 4)
> -#define VI6_LIF_CTRL_REQSEL		(1 << 1)
> -#define VI6_LIF_CTRL_LIF_EN		(1 << 0)
> +#define VI6_LIF_CTRL_CFMT		BIT(4)
> +#define VI6_LIF_CTRL_REQSEL		BIT(1)
> +#define VI6_LIF_CTRL_LIF_EN		BIT(0)
>  
>  #define VI6_LIF_CSBTH			0x3b04
>  #define VI6_LIF_CSBTH_HBTH_MASK		(0x7ff << 16)
> @@ -735,7 +735,7 @@
>  #define VI6_LIF_CSBTH_LBTH_SHIFT	0
>  
>  #define VI6_LIF_LBA			0x3b0c
> -#define VI6_LIF_LBA_LBA0		(1 << 31)
> +#define VI6_LIF_LBA_LBA0		BIT(31)
>  #define VI6_LIF_LBA_LBA1_MASK		(0xfff << 16)
>  #define VI6_LIF_LBA_LBA1_SHIFT		16
>  
> @@ -767,9 +767,9 @@
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
>  #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
> -#define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
> -#define VI6_IP_VERSION_SOC_V2H		(0x01 << 0)
> -#define VI6_IP_VERSION_SOC_V3M		(0x01 << 0)
> +#define VI6_IP_VERSION_SOC_H2		BIT(0)
> +#define VI6_IP_VERSION_SOC_V2H		BIT(0)
> +#define VI6_IP_VERSION_SOC_V3M		BIT(0)

These three are multi-bit fields, please don't replace them.

>  #define VI6_IP_VERSION_SOC_M2		(0x02 << 0)
>  #define VI6_IP_VERSION_SOC_M3W		(0x02 << 0)
>  #define VI6_IP_VERSION_SOC_V3H		(0x02 << 0)
> diff --git a/drivers/media/platform/xilinx/xilinx-vip.h b/drivers/media/platform/xilinx/xilinx-vip.h
> index 47da39211ae4..9ca2c36c84cf 100644
> --- a/drivers/media/platform/xilinx/xilinx-vip.h
> +++ b/drivers/media/platform/xilinx/xilinx-vip.h
> @@ -11,6 +11,7 @@
>  
>  #ifndef __XILINX_VIP_H__
>  #define __XILINX_VIP_H__
> +#include <linux/bitops.h>
>  

The blank line should go above.

>  #include <linux/io.h>
>  #include <media/v4l2-subdev.h>
> @@ -35,23 +36,23 @@ struct clk;
>  
>  /* Xilinx Video IP Control Registers */
>  #define XVIP_CTRL_CONTROL			0x0000
> -#define XVIP_CTRL_CONTROL_SW_ENABLE		(1 << 0)
> -#define XVIP_CTRL_CONTROL_REG_UPDATE		(1 << 1)
> -#define XVIP_CTRL_CONTROL_BYPASS		(1 << 4)
> -#define XVIP_CTRL_CONTROL_TEST_PATTERN		(1 << 5)
> -#define XVIP_CTRL_CONTROL_FRAME_SYNC_RESET	(1 << 30)
> -#define XVIP_CTRL_CONTROL_SW_RESET		(1 << 31)
> +#define XVIP_CTRL_CONTROL_SW_ENABLE		BIT(0)
> +#define XVIP_CTRL_CONTROL_REG_UPDATE		BIT(1)
> +#define XVIP_CTRL_CONTROL_BYPASS		BIT(4)
> +#define XVIP_CTRL_CONTROL_TEST_PATTERN		BIT(5)
> +#define XVIP_CTRL_CONTROL_FRAME_SYNC_RESET	BIT(30)
> +#define XVIP_CTRL_CONTROL_SW_RESET		BIT(31)
>  #define XVIP_CTRL_STATUS			0x0004
> -#define XVIP_CTRL_STATUS_PROC_STARTED		(1 << 0)
> -#define XVIP_CTRL_STATUS_EOF			(1 << 1)
> +#define XVIP_CTRL_STATUS_PROC_STARTED		BIT(0)
> +#define XVIP_CTRL_STATUS_EOF			BIT(1)
>  #define XVIP_CTRL_ERROR				0x0008
> -#define XVIP_CTRL_ERROR_SLAVE_EOL_EARLY		(1 << 0)
> -#define XVIP_CTRL_ERROR_SLAVE_EOL_LATE		(1 << 1)
> -#define XVIP_CTRL_ERROR_SLAVE_SOF_EARLY		(1 << 2)
> -#define XVIP_CTRL_ERROR_SLAVE_SOF_LATE		(1 << 3)
> +#define XVIP_CTRL_ERROR_SLAVE_EOL_EARLY		BIT(0)
> +#define XVIP_CTRL_ERROR_SLAVE_EOL_LATE		BIT(1)
> +#define XVIP_CTRL_ERROR_SLAVE_SOF_EARLY		BIT(2)
> +#define XVIP_CTRL_ERROR_SLAVE_SOF_LATE		BIT(3)
>  #define XVIP_CTRL_IRQ_ENABLE			0x000c
> -#define XVIP_CTRL_IRQ_ENABLE_PROC_STARTED	(1 << 0)
> -#define XVIP_CTRL_IRQ_EOF			(1 << 1)
> +#define XVIP_CTRL_IRQ_ENABLE_PROC_STARTED	BIT(0)
> +#define XVIP_CTRL_IRQ_EOF			BIT(1)
>  #define XVIP_CTRL_VERSION			0x0010
>  #define XVIP_CTRL_VERSION_MAJOR_MASK		(0xff << 24)
>  #define XVIP_CTRL_VERSION_MAJOR_SHIFT		24
> @@ -72,13 +73,13 @@ struct clk;
>  #define XVIP_ACTIVE_HSIZE_SHIFT			0
>  #define XVIP_ENCODING				0x0028
>  #define XVIP_ENCODING_NBITS_8			(0 << 4)
> -#define XVIP_ENCODING_NBITS_10			(1 << 4)
> +#define XVIP_ENCODING_NBITS_10			BIT(4)

Please don't replace this one either.

>  #define XVIP_ENCODING_NBITS_12			(2 << 4)
>  #define XVIP_ENCODING_NBITS_16			(3 << 4)
>  #define XVIP_ENCODING_NBITS_MASK		(3 << 4)
>  #define XVIP_ENCODING_NBITS_SHIFT		4
>  #define XVIP_ENCODING_VIDEO_FORMAT_YUV422	(0 << 0)
> -#define XVIP_ENCODING_VIDEO_FORMAT_YUV444	(1 << 0)
> +#define XVIP_ENCODING_VIDEO_FORMAT_YUV444	BIT(0)

And same here.

>  #define XVIP_ENCODING_VIDEO_FORMAT_RGB		(2 << 0)
>  #define XVIP_ENCODING_VIDEO_FORMAT_YUV420	(3 << 0)
>  #define XVIP_ENCODING_VIDEO_FORMAT_MASK		(3 << 0)
> diff --git a/drivers/media/radio/wl128x/fmdrv_common.h b/drivers/media/radio/wl128x/fmdrv_common.h
> index 7d7a2b17aa76..699f328f3e52 100644
> --- a/drivers/media/radio/wl128x/fmdrv_common.h
> +++ b/drivers/media/radio/wl128x/fmdrv_common.h
> @@ -159,18 +159,18 @@ struct fm_event_msg_hdr {
>  #define FM_DISABLE  0
>  
>  /* FLAG_GET register bits */
> -#define FM_FR_EVENT		(1 << 0)
> -#define FM_BL_EVENT		(1 << 1)
> -#define FM_RDS_EVENT		(1 << 2)
> -#define FM_BBLK_EVENT		(1 << 3)
> -#define FM_LSYNC_EVENT		(1 << 4)
> -#define FM_LEV_EVENT		(1 << 5)
> -#define FM_IFFR_EVENT		(1 << 6)
> -#define FM_PI_EVENT		(1 << 7)
> -#define FM_PD_EVENT		(1 << 8)
> -#define FM_STIC_EVENT		(1 << 9)
> -#define FM_MAL_EVENT		(1 << 10)
> -#define FM_POW_ENB_EVENT	(1 << 11)
> +#define FM_FR_EVENT		BIT(0)
> +#define FM_BL_EVENT		BIT(1)
> +#define FM_RDS_EVENT		BIT(2)
> +#define FM_BBLK_EVENT		BIT(3)
> +#define FM_LSYNC_EVENT		BIT(4)
> +#define FM_LEV_EVENT		BIT(5)
> +#define FM_IFFR_EVENT		BIT(6)
> +#define FM_PI_EVENT		BIT(7)
> +#define FM_PD_EVENT		BIT(8)
> +#define FM_STIC_EVENT		BIT(9)
> +#define FM_MAL_EVENT		BIT(10)
> +#define FM_POW_ENB_EVENT	BIT(11)
>  
>  /*
>   * Firmware files of FM. ASIC ID and ASIC version will be appened to this,
> @@ -268,38 +268,38 @@ struct fm_event_msg_hdr {
>   * Represents an RDS group type & version.
>   * There are 15 groups, each group has 2 versions: A and B.
>   */
> -#define FM_RDS_GROUP_TYPE_MASK_0A	    ((unsigned long)1<<0)
> -#define FM_RDS_GROUP_TYPE_MASK_0B	    ((unsigned long)1<<1)
> -#define FM_RDS_GROUP_TYPE_MASK_1A	    ((unsigned long)1<<2)
> -#define FM_RDS_GROUP_TYPE_MASK_1B	    ((unsigned long)1<<3)
> -#define FM_RDS_GROUP_TYPE_MASK_2A	    ((unsigned long)1<<4)
> -#define FM_RDS_GROUP_TYPE_MASK_2B	    ((unsigned long)1<<5)
> -#define FM_RDS_GROUP_TYPE_MASK_3A	    ((unsigned long)1<<6)
> -#define FM_RDS_GROUP_TYPE_MASK_3B           ((unsigned long)1<<7)
> -#define FM_RDS_GROUP_TYPE_MASK_4A	    ((unsigned long)1<<8)
> -#define FM_RDS_GROUP_TYPE_MASK_4B	    ((unsigned long)1<<9)
> -#define FM_RDS_GROUP_TYPE_MASK_5A	    ((unsigned long)1<<10)
> -#define FM_RDS_GROUP_TYPE_MASK_5B	    ((unsigned long)1<<11)
> -#define FM_RDS_GROUP_TYPE_MASK_6A	    ((unsigned long)1<<12)
> -#define FM_RDS_GROUP_TYPE_MASK_6B	    ((unsigned long)1<<13)
> -#define FM_RDS_GROUP_TYPE_MASK_7A	    ((unsigned long)1<<14)
> -#define FM_RDS_GROUP_TYPE_MASK_7B	    ((unsigned long)1<<15)
> -#define FM_RDS_GROUP_TYPE_MASK_8A           ((unsigned long)1<<16)
> -#define FM_RDS_GROUP_TYPE_MASK_8B	    ((unsigned long)1<<17)
> -#define FM_RDS_GROUP_TYPE_MASK_9A	    ((unsigned long)1<<18)
> -#define FM_RDS_GROUP_TYPE_MASK_9B	    ((unsigned long)1<<19)
> -#define FM_RDS_GROUP_TYPE_MASK_10A	    ((unsigned long)1<<20)
> -#define FM_RDS_GROUP_TYPE_MASK_10B	    ((unsigned long)1<<21)
> -#define FM_RDS_GROUP_TYPE_MASK_11A	    ((unsigned long)1<<22)
> -#define FM_RDS_GROUP_TYPE_MASK_11B	    ((unsigned long)1<<23)
> -#define FM_RDS_GROUP_TYPE_MASK_12A	    ((unsigned long)1<<24)
> -#define FM_RDS_GROUP_TYPE_MASK_12B	    ((unsigned long)1<<25)
> -#define FM_RDS_GROUP_TYPE_MASK_13A	    ((unsigned long)1<<26)
> -#define FM_RDS_GROUP_TYPE_MASK_13B	    ((unsigned long)1<<27)
> -#define FM_RDS_GROUP_TYPE_MASK_14A	    ((unsigned long)1<<28)
> -#define FM_RDS_GROUP_TYPE_MASK_14B	    ((unsigned long)1<<29)
> -#define FM_RDS_GROUP_TYPE_MASK_15A	    ((unsigned long)1<<30)
> -#define FM_RDS_GROUP_TYPE_MASK_15B	    ((unsigned long)1<<31)
> +#define FM_RDS_GROUP_TYPE_MASK_0A	    ((unsigned long)BIT(0))
> +#define FM_RDS_GROUP_TYPE_MASK_0B	    ((unsigned long)BIT(1))
> +#define FM_RDS_GROUP_TYPE_MASK_1A	    ((unsigned long)BIT(2))
> +#define FM_RDS_GROUP_TYPE_MASK_1B	    ((unsigned long)BIT(3))
> +#define FM_RDS_GROUP_TYPE_MASK_2A	    ((unsigned long)BIT(4))
> +#define FM_RDS_GROUP_TYPE_MASK_2B	    ((unsigned long)BIT(5))
> +#define FM_RDS_GROUP_TYPE_MASK_3A	    ((unsigned long)BIT(6))
> +#define FM_RDS_GROUP_TYPE_MASK_3B           ((unsigned long)BIT(7))
> +#define FM_RDS_GROUP_TYPE_MASK_4A	    ((unsigned long)BIT(8))
> +#define FM_RDS_GROUP_TYPE_MASK_4B	    ((unsigned long)BIT(9))
> +#define FM_RDS_GROUP_TYPE_MASK_5A	    ((unsigned long)BIT(10))
> +#define FM_RDS_GROUP_TYPE_MASK_5B	    ((unsigned long)BIT(11))
> +#define FM_RDS_GROUP_TYPE_MASK_6A	    ((unsigned long)BIT(12))
> +#define FM_RDS_GROUP_TYPE_MASK_6B	    ((unsigned long)BIT(13))
> +#define FM_RDS_GROUP_TYPE_MASK_7A	    ((unsigned long)BIT(14))
> +#define FM_RDS_GROUP_TYPE_MASK_7B	    ((unsigned long)BIT(15))
> +#define FM_RDS_GROUP_TYPE_MASK_8A           ((unsigned long)BIT(16))
> +#define FM_RDS_GROUP_TYPE_MASK_8B	    ((unsigned long)BIT(17))
> +#define FM_RDS_GROUP_TYPE_MASK_9A	    ((unsigned long)BIT(18))
> +#define FM_RDS_GROUP_TYPE_MASK_9B	    ((unsigned long)BIT(19))
> +#define FM_RDS_GROUP_TYPE_MASK_10A	    ((unsigned long)BIT(20))
> +#define FM_RDS_GROUP_TYPE_MASK_10B	    ((unsigned long)BIT(21))
> +#define FM_RDS_GROUP_TYPE_MASK_11A	    ((unsigned long)BIT(22))
> +#define FM_RDS_GROUP_TYPE_MASK_11B	    ((unsigned long)BIT(23))
> +#define FM_RDS_GROUP_TYPE_MASK_12A	    ((unsigned long)BIT(24))
> +#define FM_RDS_GROUP_TYPE_MASK_12B	    ((unsigned long)BIT(25))
> +#define FM_RDS_GROUP_TYPE_MASK_13A	    ((unsigned long)BIT(26))
> +#define FM_RDS_GROUP_TYPE_MASK_13B	    ((unsigned long)BIT(27))
> +#define FM_RDS_GROUP_TYPE_MASK_14A	    ((unsigned long)BIT(28))
> +#define FM_RDS_GROUP_TYPE_MASK_14B	    ((unsigned long)BIT(29))
> +#define FM_RDS_GROUP_TYPE_MASK_15A	    ((unsigned long)BIT(30))
> +#define FM_RDS_GROUP_TYPE_MASK_15B	    ((unsigned long)BIT(31))

BIT() includes a UL suffix, I think you can drop the unsigned long cast.

>  
>  /* RX Alternate Frequency info */
>  #define FM_RDS_MIN_AF			  1
> diff --git a/drivers/staging/media/ipu3/ipu3-tables.h b/drivers/staging/media/ipu3/ipu3-tables.h
> index a1bf3286f380..aefd9966a3ad 100644
> --- a/drivers/staging/media/ipu3/ipu3-tables.h
> +++ b/drivers/staging/media/ipu3/ipu3-tables.h
> @@ -4,6 +4,8 @@
>  #ifndef __IPU3_TABLES_H
>  #define __IPU3_TABLES_H
>  
> +#include <linux/bitops.h>
> +
>  #include "ipu3-abi.h"
>  
>  #define IMGU_BDS_GRANULARITY		32	/* Downscaling granularity */
> @@ -12,7 +14,7 @@
>  
>  #define IMGU_SCALER_DOWNSCALE_4TAPS_LEN	128
>  #define IMGU_SCALER_DOWNSCALE_2TAPS_LEN	64
> -#define IMGU_SCALER_FP			((u32)1 << 31) /* 1.0 in fixed point */
> +#define IMGU_SCALER_FP			((u32)BIT(31)) /* 1.0 in fixed point */

Can't we drop the (u32) ?

>  
>  #define IMGU_XNR3_VMEM_LUT_LEN		16

-- 
Regards,

Laurent Pinchart
