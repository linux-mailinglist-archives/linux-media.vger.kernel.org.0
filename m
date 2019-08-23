Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE2A9ABA6
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 11:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388486AbfHWJrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 05:47:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41268 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbfHWJrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 05:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0WvxBRKXCqLVoggQeJY1KeDD0Nv1h4FfvA4dBjZkqZM=; b=fj4Mh1GQ2ES71535uV41iBHvaH
        s5Hf358qDF9OTRNB+UVh9m2n6GYJflCpEjnDDEf1OyXSn4H8UaO78GqnnwtyaRNkwXI3cwFkgPNFn
        cxM2V+KOcQTkfYSAj0+ce6cp7KWiaLFsj080Xk36iVyzzLP2g7J0ElUcy7xF9L7xLq0pKbE/AiEbV
        Sj5WQTxfFL5Ly2jeBnQjR5eqjPuR+Sm/Ej/rli5hUHUlb1dFk1JyRTjJKCntZ4HCwQs4Zj2j3JXnT
        q0UxXy4J9L04yDmK8WdTleyAU/9c7MuIfhoVIju5oaWBhWPg+UWcd+7xZCJBcGLKQFqlWweOWoY3O
        13ecUJCQ==;
Received: from [177.133.63.56] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i16AU-0006Wq-ND; Fri, 23 Aug 2019 09:47:40 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i16AQ-0002jv-8d; Fri, 23 Aug 2019 06:47:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: [PATCH v2 5/7] media: use the BIT() macro
Date:   Fri, 23 Aug 2019 06:47:30 -0300
Message-Id: <d6c04bf604084af63fec603b4afbd72c648e0394.1566553525.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823000829.GN5027@pendragon.ideasonboard.com>
References: <20190823000829.GN5027@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As warned by cppcheck:

	[drivers/media/dvb-frontends/cx24123.c:434]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
	[drivers/media/pci/bt8xx/bttv-input.c:87]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
	[drivers/media/pci/bt8xx/bttv-input.c:98]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour
			...
	[drivers/media/v4l2-core/v4l2-ioctl.c:1391]: (error) Shifting signed 32-bit value by 31 bits is undefined behaviour

There are lots of places where we're doing 1 << 31. That's bad,
as, depending on the architecture, this has an undefined behavior.

The BIT() macro is already prepared to handle this, so, let's
just switch all "1 << number" macros by BIT(number) at the header files
with has 1 << 31.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---

v2: 
  As suggested by Laurent:
     - Don't touch multi-bit masks
     - remove explicit casts

 drivers/media/pci/cobalt/cobalt-driver.h      |  63 +-
 drivers/media/pci/ivtv/ivtv-irq.h             |  28 +-
 drivers/media/pci/mantis/mantis_reg.h         | 152 ++---
 drivers/media/pci/solo6x10/solo6x10-regs.h    | 286 ++++-----
 .../media/platform/am437x/am437x-vpfe_regs.h  |  26 +-
 .../media/platform/davinci/dm644x_ccdc_regs.h |  20 +-
 .../media/platform/exynos4-is/fimc-lite-reg.h |  80 +--
 drivers/media/platform/exynos4-is/fimc-reg.h  | 138 +++--
 drivers/media/platform/omap3isp/ispreg.h      | 580 +++++++++---------
 drivers/media/platform/s3c-camif/camif-regs.h | 118 ++--
 drivers/media/platform/tegra-cec/tegra_cec.h  |  80 +--
 drivers/media/platform/ti-vpe/vpe_regs.h      |  94 +--
 drivers/media/platform/vsp1/vsp1_regs.h       | 224 +++----
 drivers/media/platform/xilinx/xilinx-vip.h    |  29 +-
 drivers/media/radio/wl128x/fmdrv_common.h     |  88 +--
 drivers/staging/media/ipu3/ipu3-tables.h      |   4 +-
 16 files changed, 1011 insertions(+), 999 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.h b/drivers/media/pci/cobalt/cobalt-driver.h
index 429bee4ef79c..bca68572b324 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.h
+++ b/drivers/media/pci/cobalt/cobalt-driver.h
@@ -11,6 +11,7 @@
 #ifndef COBALT_DRIVER_H
 #define COBALT_DRIVER_H
 
+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/spinlock.h>
@@ -61,37 +62,37 @@
 #define COBALT_CLK		50000000
 
 /* System status register */
-#define COBALT_SYSSTAT_DIP0_MSK			(1 << 0)
-#define COBALT_SYSSTAT_DIP1_MSK			(1 << 1)
-#define COBALT_SYSSTAT_HSMA_PRSNTN_MSK		(1 << 2)
-#define COBALT_SYSSTAT_FLASH_RDYBSYN_MSK	(1 << 3)
-#define COBALT_SYSSTAT_VI0_5V_MSK		(1 << 4)
-#define COBALT_SYSSTAT_VI0_INT1_MSK		(1 << 5)
-#define COBALT_SYSSTAT_VI0_INT2_MSK		(1 << 6)
-#define COBALT_SYSSTAT_VI0_LOST_DATA_MSK	(1 << 7)
-#define COBALT_SYSSTAT_VI1_5V_MSK		(1 << 8)
-#define COBALT_SYSSTAT_VI1_INT1_MSK		(1 << 9)
-#define COBALT_SYSSTAT_VI1_INT2_MSK		(1 << 10)
-#define COBALT_SYSSTAT_VI1_LOST_DATA_MSK	(1 << 11)
-#define COBALT_SYSSTAT_VI2_5V_MSK		(1 << 12)
-#define COBALT_SYSSTAT_VI2_INT1_MSK		(1 << 13)
-#define COBALT_SYSSTAT_VI2_INT2_MSK		(1 << 14)
-#define COBALT_SYSSTAT_VI2_LOST_DATA_MSK	(1 << 15)
-#define COBALT_SYSSTAT_VI3_5V_MSK		(1 << 16)
-#define COBALT_SYSSTAT_VI3_INT1_MSK		(1 << 17)
-#define COBALT_SYSSTAT_VI3_INT2_MSK		(1 << 18)
-#define COBALT_SYSSTAT_VI3_LOST_DATA_MSK	(1 << 19)
-#define COBALT_SYSSTAT_VIHSMA_5V_MSK		(1 << 20)
-#define COBALT_SYSSTAT_VIHSMA_INT1_MSK		(1 << 21)
-#define COBALT_SYSSTAT_VIHSMA_INT2_MSK		(1 << 22)
-#define COBALT_SYSSTAT_VIHSMA_LOST_DATA_MSK	(1 << 23)
-#define COBALT_SYSSTAT_VOHSMA_INT1_MSK		(1 << 24)
-#define COBALT_SYSSTAT_VOHSMA_PLL_LOCKED_MSK	(1 << 25)
-#define COBALT_SYSSTAT_VOHSMA_LOST_DATA_MSK	(1 << 26)
-#define COBALT_SYSSTAT_AUD_PLL_LOCKED_MSK	(1 << 28)
-#define COBALT_SYSSTAT_AUD_IN_LOST_DATA_MSK	(1 << 29)
-#define COBALT_SYSSTAT_AUD_OUT_LOST_DATA_MSK	(1 << 30)
-#define COBALT_SYSSTAT_PCIE_SMBCLK_MSK		(1 << 31)
+#define COBALT_SYSSTAT_DIP0_MSK			BIT(0)
+#define COBALT_SYSSTAT_DIP1_MSK			BIT(1)
+#define COBALT_SYSSTAT_HSMA_PRSNTN_MSK		BIT(2)
+#define COBALT_SYSSTAT_FLASH_RDYBSYN_MSK	BIT(3)
+#define COBALT_SYSSTAT_VI0_5V_MSK		BIT(4)
+#define COBALT_SYSSTAT_VI0_INT1_MSK		BIT(5)
+#define COBALT_SYSSTAT_VI0_INT2_MSK		BIT(6)
+#define COBALT_SYSSTAT_VI0_LOST_DATA_MSK	BIT(7)
+#define COBALT_SYSSTAT_VI1_5V_MSK		BIT(8)
+#define COBALT_SYSSTAT_VI1_INT1_MSK		BIT(9)
+#define COBALT_SYSSTAT_VI1_INT2_MSK		BIT(10)
+#define COBALT_SYSSTAT_VI1_LOST_DATA_MSK	BIT(11)
+#define COBALT_SYSSTAT_VI2_5V_MSK		BIT(12)
+#define COBALT_SYSSTAT_VI2_INT1_MSK		BIT(13)
+#define COBALT_SYSSTAT_VI2_INT2_MSK		BIT(14)
+#define COBALT_SYSSTAT_VI2_LOST_DATA_MSK	BIT(15)
+#define COBALT_SYSSTAT_VI3_5V_MSK		BIT(16)
+#define COBALT_SYSSTAT_VI3_INT1_MSK		BIT(17)
+#define COBALT_SYSSTAT_VI3_INT2_MSK		BIT(18)
+#define COBALT_SYSSTAT_VI3_LOST_DATA_MSK	BIT(19)
+#define COBALT_SYSSTAT_VIHSMA_5V_MSK		BIT(20)
+#define COBALT_SYSSTAT_VIHSMA_INT1_MSK		BIT(21)
+#define COBALT_SYSSTAT_VIHSMA_INT2_MSK		BIT(22)
+#define COBALT_SYSSTAT_VIHSMA_LOST_DATA_MSK	BIT(23)
+#define COBALT_SYSSTAT_VOHSMA_INT1_MSK		BIT(24)
+#define COBALT_SYSSTAT_VOHSMA_PLL_LOCKED_MSK	BIT(25)
+#define COBALT_SYSSTAT_VOHSMA_LOST_DATA_MSK	BIT(26)
+#define COBALT_SYSSTAT_AUD_PLL_LOCKED_MSK	BIT(28)
+#define COBALT_SYSSTAT_AUD_IN_LOST_DATA_MSK	BIT(29)
+#define COBALT_SYSSTAT_AUD_OUT_LOST_DATA_MSK	BIT(30)
+#define COBALT_SYSSTAT_PCIE_SMBCLK_MSK		BIT(31)
 
 /* Cobalt memory map */
 #define COBALT_I2C_0_BASE			0x0
diff --git a/drivers/media/pci/ivtv/ivtv-irq.h b/drivers/media/pci/ivtv/ivtv-irq.h
index 7d2f45e2b83c..b8b0703a1c82 100644
--- a/drivers/media/pci/ivtv/ivtv-irq.h
+++ b/drivers/media/pci/ivtv/ivtv-irq.h
@@ -10,20 +10,20 @@
 #ifndef IVTV_IRQ_H
 #define IVTV_IRQ_H
 
-#define IVTV_IRQ_ENC_START_CAP		(0x1 << 31)
-#define IVTV_IRQ_ENC_EOS		(0x1 << 30)
-#define IVTV_IRQ_ENC_VBI_CAP		(0x1 << 29)
-#define IVTV_IRQ_ENC_VIM_RST		(0x1 << 28)
-#define IVTV_IRQ_ENC_DMA_COMPLETE	(0x1 << 27)
-#define IVTV_IRQ_ENC_PIO_COMPLETE	(0x1 << 25)
-#define IVTV_IRQ_DEC_AUD_MODE_CHG	(0x1 << 24)
-#define IVTV_IRQ_DEC_DATA_REQ		(0x1 << 22)
-#define IVTV_IRQ_DEC_DMA_COMPLETE	(0x1 << 20)
-#define IVTV_IRQ_DEC_VBI_RE_INSERT	(0x1 << 19)
-#define IVTV_IRQ_DMA_ERR		(0x1 << 18)
-#define IVTV_IRQ_DMA_WRITE		(0x1 << 17)
-#define IVTV_IRQ_DMA_READ		(0x1 << 16)
-#define IVTV_IRQ_DEC_VSYNC		(0x1 << 10)
+#define IVTV_IRQ_ENC_START_CAP		BIT(31)
+#define IVTV_IRQ_ENC_EOS		BIT(30)
+#define IVTV_IRQ_ENC_VBI_CAP		BIT(29)
+#define IVTV_IRQ_ENC_VIM_RST		BIT(28)
+#define IVTV_IRQ_ENC_DMA_COMPLETE	BIT(27)
+#define IVTV_IRQ_ENC_PIO_COMPLETE	BIT(25)
+#define IVTV_IRQ_DEC_AUD_MODE_CHG	BIT(24)
+#define IVTV_IRQ_DEC_DATA_REQ		BIT(22)
+#define IVTV_IRQ_DEC_DMA_COMPLETE	BIT(20)
+#define IVTV_IRQ_DEC_VBI_RE_INSERT	BIT(19)
+#define IVTV_IRQ_DMA_ERR		BIT(18)
+#define IVTV_IRQ_DMA_WRITE		BIT(17)
+#define IVTV_IRQ_DMA_READ		BIT(16)
+#define IVTV_IRQ_DEC_VSYNC		BIT(10)
 
 /* IRQ Masks */
 #define IVTV_IRQ_MASK_INIT (IVTV_IRQ_DMA_ERR|IVTV_IRQ_ENC_DMA_COMPLETE|\
diff --git a/drivers/media/pci/mantis/mantis_reg.h b/drivers/media/pci/mantis/mantis_reg.h
index 67a80e42b5c7..a1e66ef6ac2f 100644
--- a/drivers/media/pci/mantis/mantis_reg.h
+++ b/drivers/media/pci/mantis/mantis_reg.h
@@ -14,44 +14,44 @@
 #define MANTIS_INT_MASK			0x04
 
 #define MANTIS_INT_RISCSTAT		(0x0f << 28)
-#define MANTIS_INT_RISCEN		(0x01 << 27)
-#define MANTIS_INT_I2CRACK		(0x01 << 26)
+#define MANTIS_INT_RISCEN		BIT(27)
+#define MANTIS_INT_I2CRACK		BIT(26)
 
 /* #define MANTIS_INT_GPIF			(0xff << 12) */
 
-#define MANTIS_INT_PCMCIA7		(0x01 << 19)
-#define MANTIS_INT_PCMCIA6		(0x01 << 18)
-#define MANTIS_INT_PCMCIA5		(0x01 << 17)
-#define MANTIS_INT_PCMCIA4		(0x01 << 16)
-#define MANTIS_INT_PCMCIA3		(0x01 << 15)
-#define MANTIS_INT_PCMCIA2		(0x01 << 14)
-#define MANTIS_INT_PCMCIA1		(0x01 << 13)
-#define MANTIS_INT_PCMCIA0		(0x01 << 12)
-#define MANTIS_INT_IRQ1			(0x01 << 11)
-#define MANTIS_INT_IRQ0			(0x01 << 10)
-#define MANTIS_INT_OCERR		(0x01 <<  8)
-#define MANTIS_INT_PABORT		(0x01 <<  7)
-#define MANTIS_INT_RIPERR		(0x01 <<  6)
-#define MANTIS_INT_PPERR		(0x01 <<  5)
-#define MANTIS_INT_FTRGT		(0x01 <<  3)
-#define MANTIS_INT_RISCI		(0x01 <<  1)
-#define MANTIS_INT_I2CDONE		(0x01 <<  0)
+#define MANTIS_INT_PCMCIA7		BIT(19)
+#define MANTIS_INT_PCMCIA6		BIT(18)
+#define MANTIS_INT_PCMCIA5		BIT(17)
+#define MANTIS_INT_PCMCIA4		BIT(16)
+#define MANTIS_INT_PCMCIA3		BIT(15)
+#define MANTIS_INT_PCMCIA2		BIT(14)
+#define MANTIS_INT_PCMCIA1		BIT(13)
+#define MANTIS_INT_PCMCIA0		BIT(12)
+#define MANTIS_INT_IRQ1			BIT(11)
+#define MANTIS_INT_IRQ0			BIT(10)
+#define MANTIS_INT_OCERR		BIT(8)
+#define MANTIS_INT_PABORT		BIT(7)
+#define MANTIS_INT_RIPERR		BIT(6)
+#define MANTIS_INT_PPERR		BIT(5)
+#define MANTIS_INT_FTRGT		BIT(3)
+#define MANTIS_INT_RISCI		BIT(1)
+#define MANTIS_INT_I2CDONE		BIT(0)
 
 /* DMA */
 #define MANTIS_DMA_CTL			0x08
 #define MANTIS_GPIF_RD			(0xff << 24)
 #define MANTIS_GPIF_WR			(0xff << 16)
-#define MANTIS_CPU_DO			(0x01 << 10)
-#define MANTIS_DRV_DO			(0x01 <<  9)
-#define	MANTIS_I2C_RD			(0x01 <<  7)
-#define MANTIS_I2C_WR			(0x01 <<  6)
-#define MANTIS_DCAP_MODE		(0x01 <<  5)
+#define MANTIS_CPU_DO			BIT(10)
+#define MANTIS_DRV_DO			BIT(9)
+#define	MANTIS_I2C_RD			BIT(7)
+#define MANTIS_I2C_WR			BIT(6)
+#define MANTIS_DCAP_MODE		BIT(5)
 #define MANTIS_FIFO_TP_4		(0x00 <<  3)
 #define MANTIS_FIFO_TP_8		(0x01 <<  3)
 #define MANTIS_FIFO_TP_16		(0x02 <<  3)
-#define MANTIS_FIFO_EN			(0x01 <<  2)
-#define MANTIS_DCAP_EN			(0x01 <<  1)
-#define MANTIS_RISC_EN			(0x01 <<  0)
+#define MANTIS_FIFO_EN			BIT(2)
+#define MANTIS_DCAP_EN			BIT(1)
+#define MANTIS_RISC_EN			BIT(0)
 
 /* DEBUG */
 #define MANTIS_DEBUGREG			0x0c
@@ -68,8 +68,8 @@
 #define MANTIS_I2C_RATE_2		(0x01 <<  6)
 #define MANTIS_I2C_RATE_3		(0x02 <<  6)
 #define MANTIS_I2C_RATE_4		(0x03 <<  6)
-#define MANTIS_I2C_STOP			(0x01 <<  5)
-#define MANTIS_I2C_PGMODE		(0x01 <<  3)
+#define MANTIS_I2C_STOP			BIT(5)
+#define MANTIS_I2C_PGMODE		BIT(3)
 
 /* DATA */
 #define MANTIS_CMD_DATA_R1		0x20
@@ -85,77 +85,77 @@
 #define MANTIS_CMD_DATA_4		(0xff <<  0)
 
 #define MANTIS_CONTROL			0x28
-#define MANTIS_DET			(0x01 <<  7)
-#define MANTIS_DAT_CF_EN		(0x01 <<  6)
+#define MANTIS_DET			BIT(7)
+#define MANTIS_DAT_CF_EN		BIT(6)
 #define MANTIS_ACS			(0x03 <<  4)
-#define MANTIS_VCCEN			(0x01 <<  3)
-#define MANTIS_BYPASS			(0x01 <<  2)
-#define MANTIS_MRST			(0x01 <<  1)
-#define MANTIS_CRST_INT			(0x01 <<  0)
+#define MANTIS_VCCEN			BIT(3)
+#define MANTIS_BYPASS			BIT(2)
+#define MANTIS_MRST			BIT(1)
+#define MANTIS_CRST_INT			BIT(0)
 
 #define MANTIS_GPIF_CFGSLA		0x84
 #define MANTIS_GPIF_WAITSMPL		(0x07 << 28)
-#define MANTIS_GPIF_BYTEADDRSUB		(0x01 << 25)
-#define MANTIS_GPIF_WAITPOL		(0x01 << 24)
+#define MANTIS_GPIF_BYTEADDRSUB		BIT(25)
+#define MANTIS_GPIF_WAITPOL		BIT(24)
 #define MANTIS_GPIF_NCDELAY		(0x07 << 20)
 #define MANTIS_GPIF_RW2CSDELAY		(0x07 << 16)
-#define MANTIS_GPIF_SLFTIMEDMODE	(0x01 << 15)
+#define MANTIS_GPIF_SLFTIMEDMODE	BIT(15)
 #define MANTIS_GPIF_SLFTIMEDDELY	(0x7f <<  8)
 #define MANTIS_GPIF_DEVTYPE		(0x07 <<  4)
-#define MANTIS_GPIF_BIGENDIAN		(0x01 <<  3)
+#define MANTIS_GPIF_BIGENDIAN		BIT(3)
 #define MANTIS_GPIF_FETCHCMD		(0x03 <<  1)
-#define MANTIS_GPIF_HWORDDEV		(0x01 <<  0)
+#define MANTIS_GPIF_HWORDDEV		BIT(0)
 
 #define MANTIS_GPIF_WSTOPER		0x90
-#define MANTIS_GPIF_WSTOPERWREN3	(0x01 << 31)
-#define MANTIS_GPIF_PARBOOTN		(0x01 << 29)
+#define MANTIS_GPIF_WSTOPERWREN3	BIT(31)
+#define MANTIS_GPIF_PARBOOTN		BIT(29)
 #define MANTIS_GPIF_WSTOPERSLID3	(0x1f << 24)
-#define MANTIS_GPIF_WSTOPERWREN2	(0x01 << 23)
+#define MANTIS_GPIF_WSTOPERWREN2	BIT(23)
 #define MANTIS_GPIF_WSTOPERSLID2	(0x1f << 16)
-#define MANTIS_GPIF_WSTOPERWREN1	(0x01 << 15)
+#define MANTIS_GPIF_WSTOPERWREN1	BIT(15)
 #define MANTIS_GPIF_WSTOPERSLID1	(0x1f <<  8)
-#define MANTIS_GPIF_WSTOPERWREN0	(0x01 <<  7)
+#define MANTIS_GPIF_WSTOPERWREN0	BIT(7)
 #define MANTIS_GPIF_WSTOPERSLID0	(0x1f <<  0)
 
 #define MANTIS_GPIF_CS2RW		0x94
-#define MANTIS_GPIF_CS2RWWREN3		(0x01 << 31)
+#define MANTIS_GPIF_CS2RWWREN3		BIT(31)
 #define MANTIS_GPIF_CS2RWDELY3		(0x3f << 24)
-#define MANTIS_GPIF_CS2RWWREN2		(0x01 << 23)
+#define MANTIS_GPIF_CS2RWWREN2		BIT(23)
 #define MANTIS_GPIF_CS2RWDELY2		(0x3f << 16)
-#define MANTIS_GPIF_CS2RWWREN1		(0x01 << 15)
+#define MANTIS_GPIF_CS2RWWREN1		BIT(15)
 #define MANTIS_GPIF_CS2RWDELY1		(0x3f <<  8)
-#define MANTIS_GPIF_CS2RWWREN0		(0x01 <<  7)
+#define MANTIS_GPIF_CS2RWWREN0		BIT(7)
 #define MANTIS_GPIF_CS2RWDELY0		(0x3f <<  0)
 
 #define MANTIS_GPIF_IRQCFG		0x98
-#define MANTIS_GPIF_IRQPOL		(0x01 <<  8)
-#define MANTIS_MASK_WRACK		(0x01 <<  7)
-#define MANTIS_MASK_BRRDY		(0x01 <<  6)
-#define MANTIS_MASK_OVFLW		(0x01 <<  5)
-#define MANTIS_MASK_OTHERR		(0x01 <<  4)
-#define MANTIS_MASK_WSTO		(0x01 <<  3)
-#define MANTIS_MASK_EXTIRQ		(0x01 <<  2)
-#define MANTIS_MASK_PLUGIN		(0x01 <<  1)
-#define MANTIS_MASK_PLUGOUT		(0x01 <<  0)
+#define MANTIS_GPIF_IRQPOL		BIT(8)
+#define MANTIS_MASK_WRACK		BIT(7)
+#define MANTIS_MASK_BRRDY		BIT(6)
+#define MANTIS_MASK_OVFLW		BIT(5)
+#define MANTIS_MASK_OTHERR		BIT(4)
+#define MANTIS_MASK_WSTO		BIT(3)
+#define MANTIS_MASK_EXTIRQ		BIT(2)
+#define MANTIS_MASK_PLUGIN		BIT(1)
+#define MANTIS_MASK_PLUGOUT		BIT(0)
 
 #define MANTIS_GPIF_STATUS		0x9c
-#define MANTIS_SBUF_KILLOP		(0x01 << 15)
-#define MANTIS_SBUF_OPDONE		(0x01 << 14)
-#define MANTIS_SBUF_EMPTY		(0x01 << 13)
-#define MANTIS_GPIF_DETSTAT		(0x01 <<  9)
-#define MANTIS_GPIF_INTSTAT		(0x01 <<  8)
-#define MANTIS_GPIF_WRACK		(0x01 <<  7)
-#define MANTIS_GPIF_BRRDY		(0x01 <<  6)
-#define MANTIS_SBUF_OVFLW		(0x01 <<  5)
-#define MANTIS_GPIF_OTHERR		(0x01 <<  4)
-#define MANTIS_SBUF_WSTO		(0x01 <<  3)
-#define MANTIS_GPIF_EXTIRQ		(0x01 <<  2)
-#define MANTIS_CARD_PLUGIN		(0x01 <<  1)
-#define MANTIS_CARD_PLUGOUT		(0x01 <<  0)
+#define MANTIS_SBUF_KILLOP		BIT(15)
+#define MANTIS_SBUF_OPDONE		BIT(14)
+#define MANTIS_SBUF_EMPTY		BIT(13)
+#define MANTIS_GPIF_DETSTAT		BIT(9)
+#define MANTIS_GPIF_INTSTAT		BIT(8)
+#define MANTIS_GPIF_WRACK		BIT(7)
+#define MANTIS_GPIF_BRRDY		BIT(6)
+#define MANTIS_SBUF_OVFLW		BIT(5)
+#define MANTIS_GPIF_OTHERR		BIT(4)
+#define MANTIS_SBUF_WSTO		BIT(3)
+#define MANTIS_GPIF_EXTIRQ		BIT(2)
+#define MANTIS_CARD_PLUGIN		BIT(1)
+#define MANTIS_CARD_PLUGOUT		BIT(0)
 
 #define MANTIS_GPIF_BRADDR		0xa0
-#define MANTIS_GPIF_PCMCIAREG		(0x01		<< 27)
-#define MANTIS_GPIF_PCMCIAIOM		(0x01		<< 26)
+#define MANTIS_GPIF_PCMCIAREG		BIT(27)
+#define MANTIS_GPIF_PCMCIAIOM		BIT(26)
 #define MANTIS_GPIF_BR_ADDR		(0xfffffff	<<  0)
 
 #define MANTIS_GPIF_BRBYTES		0xa4
@@ -167,9 +167,9 @@
 #define MANTIS_CARD_RESET		0xac
 
 #define MANTIS_GPIF_ADDR		0xb0
-#define MANTIS_GPIF_HIFRDWRN		(0x01		<< 31)
-#define MANTIS_GPIF_PCMCIAREG		(0x01		<< 27)
-#define MANTIS_GPIF_PCMCIAIOM		(0x01		<< 26)
+#define MANTIS_GPIF_HIFRDWRN		BIT(31)
+#define MANTIS_GPIF_PCMCIAREG		BIT(27)
+#define MANTIS_GPIF_PCMCIAIOM		BIT(26)
 #define MANTIS_GPIF_HIFADDR		(0xfffffff	<<  0)
 
 #define MANTIS_GPIF_DOUT		0xb4
diff --git a/drivers/media/pci/solo6x10/solo6x10-regs.h b/drivers/media/pci/solo6x10/solo6x10-regs.h
index d88cc02d01d3..804505d01b25 100644
--- a/drivers/media/pci/solo6x10/solo6x10-regs.h
+++ b/drivers/media/pci/solo6x10/solo6x10-regs.h
@@ -12,6 +12,8 @@
 #ifndef __SOLO6X10_REGISTERS_H
 #define __SOLO6X10_REGISTERS_H
 
+#include <linux/bitops.h>
+
 #include "solo6x10-offsets.h"
 
 /* Global 6010 system configuration */
@@ -32,17 +34,17 @@
 #define	  SOLO_DMA_CTRL_REFRESH_CYCLE(n)	((n)<<8)
 /* 0=16/32MB, 1=32/64MB, 2=64/128MB, 3=128/256MB */
 #define	  SOLO_DMA_CTRL_SDRAM_SIZE(n)		((n)<<6)
-#define	  SOLO_DMA_CTRL_SDRAM_CLK_INVERT	(1<<5)
-#define	  SOLO_DMA_CTRL_STROBE_SELECT		(1<<4)
-#define	  SOLO_DMA_CTRL_READ_DATA_SELECT	(1<<3)
-#define	  SOLO_DMA_CTRL_READ_CLK_SELECT		(1<<2)
+#define	  SOLO_DMA_CTRL_SDRAM_CLK_INVERT	BIT(5)
+#define	  SOLO_DMA_CTRL_STROBE_SELECT		BIT(4)
+#define	  SOLO_DMA_CTRL_READ_DATA_SELECT	BIT(3)
+#define	  SOLO_DMA_CTRL_READ_CLK_SELECT		BIT(2)
 #define	  SOLO_DMA_CTRL_LATENCY(n)		((n)<<0)
 
 /* Some things we set in this are undocumented. Why Softlogic?!?! */
 #define SOLO_DMA_CTRL1				0x0008
 
 #define SOLO_SYS_VCLK				0x000C
-#define	  SOLO_VCLK_INVERT			(1<<22)
+#define	  SOLO_VCLK_INVERT			BIT(22)
 /* 0=sys_clk/4, 1=sys_clk/2, 2=clk_in/2 of system input */
 #define	  SOLO_VCLK_SELECT(n)			((n)<<20)
 #define	  SOLO_VCLK_VIN1415_DELAY(n)		((n)<<14)
@@ -56,22 +58,22 @@
 
 #define SOLO_IRQ_STAT				0x0010
 #define SOLO_IRQ_MASK				0x0014
-#define	  SOLO_IRQ_P2M(n)			(1<<((n)+17))
-#define	  SOLO_IRQ_GPIO				(1<<16)
-#define	  SOLO_IRQ_VIDEO_LOSS			(1<<15)
-#define	  SOLO_IRQ_VIDEO_IN			(1<<14)
-#define	  SOLO_IRQ_MOTION			(1<<13)
-#define	  SOLO_IRQ_ATA_CMD			(1<<12)
-#define	  SOLO_IRQ_ATA_DIR			(1<<11)
-#define	  SOLO_IRQ_PCI_ERR			(1<<10)
-#define	  SOLO_IRQ_PS2_1			(1<<9)
-#define	  SOLO_IRQ_PS2_0			(1<<8)
-#define	  SOLO_IRQ_SPI				(1<<7)
-#define	  SOLO_IRQ_IIC				(1<<6)
-#define	  SOLO_IRQ_UART(n)			(1<<((n) + 4))
-#define	  SOLO_IRQ_G723				(1<<3)
-#define	  SOLO_IRQ_DECODER			(1<<1)
-#define	  SOLO_IRQ_ENCODER			(1<<0)
+#define	  SOLO_IRQ_P2M(n)			BIT((n) + 17)
+#define	  SOLO_IRQ_GPIO				BIT(16)
+#define	  SOLO_IRQ_VIDEO_LOSS			BIT(15)
+#define	  SOLO_IRQ_VIDEO_IN			BIT(14)
+#define	  SOLO_IRQ_MOTION			BIT(13)
+#define	  SOLO_IRQ_ATA_CMD			BIT(12)
+#define	  SOLO_IRQ_ATA_DIR			BIT(11)
+#define	  SOLO_IRQ_PCI_ERR			BIT(10)
+#define	  SOLO_IRQ_PS2_1			BIT(9)
+#define	  SOLO_IRQ_PS2_0			BIT(8)
+#define	  SOLO_IRQ_SPI				BIT(7)
+#define	  SOLO_IRQ_IIC				BIT(6)
+#define	  SOLO_IRQ_UART(n)			BIT((n) + 4)
+#define	  SOLO_IRQ_G723				BIT(3)
+#define	  SOLO_IRQ_DECODER			BIT(1)
+#define	  SOLO_IRQ_ENCODER			BIT(0)
 
 #define SOLO_CHIP_OPTION			0x001C
 #define   SOLO_CHIP_ID_MASK			0x00000007
@@ -79,11 +81,11 @@
 #define SOLO_PLL_CONFIG				0x0020 /* 6110 Only */
 
 #define SOLO_EEPROM_CTRL			0x0060
-#define	  SOLO_EEPROM_ACCESS_EN			(1<<7)
-#define	  SOLO_EEPROM_CS			(1<<3)
-#define	  SOLO_EEPROM_CLK			(1<<2)
-#define	  SOLO_EEPROM_DO			(1<<1)
-#define	  SOLO_EEPROM_DI			(1<<0)
+#define	  SOLO_EEPROM_ACCESS_EN			BIT(7)
+#define	  SOLO_EEPROM_CS			BIT(3)
+#define	  SOLO_EEPROM_CLK			BIT(2)
+#define	  SOLO_EEPROM_DO			BIT(1)
+#define	  SOLO_EEPROM_DI			BIT(0)
 #define	  SOLO_EEPROM_ENABLE (SOLO_EEPROM_ACCESS_EN | SOLO_EEPROM_CS)
 
 #define SOLO_PCI_ERR				0x0070
@@ -102,13 +104,13 @@
 
 #define SOLO_P2M_CONFIG(n)			(0x0080 + ((n)*0x20))
 #define	  SOLO_P2M_DMA_INTERVAL(n)		((n)<<6)/* N*32 clocks */
-#define	  SOLO_P2M_CSC_BYTE_REORDER		(1<<5)	/* BGR -> RGB */
+#define	  SOLO_P2M_CSC_BYTE_REORDER		BIT(5)	/* BGR -> RGB */
 /* 0:r=[14:10] g=[9:5] b=[4:0], 1:r=[15:11] g=[10:5] b=[4:0] */
-#define	  SOLO_P2M_CSC_16BIT_565		(1<<4)
-#define	  SOLO_P2M_UV_SWAP			(1<<3)
-#define	  SOLO_P2M_PCI_MASTER_MODE		(1<<2)
-#define	  SOLO_P2M_DESC_INTR_OPT		(1<<1)	/* 1:Empty, 0:Each */
-#define	  SOLO_P2M_DESC_MODE			(1<<0)
+#define	  SOLO_P2M_CSC_16BIT_565		BIT(4)
+#define	  SOLO_P2M_UV_SWAP			BIT(3)
+#define	  SOLO_P2M_PCI_MASTER_MODE		BIT(2)
+#define	  SOLO_P2M_DESC_INTR_OPT		BIT(1)	/* 1:Empty, 0:Each */
+#define	  SOLO_P2M_DESC_MODE			BIT(0)
 
 #define SOLO_P2M_DES_ADR(n)			(0x0084 + ((n)*0x20))
 
@@ -116,7 +118,7 @@
 #define	  SOLO_P2M_UPDATE_ID(n)			((n)<<0)
 
 #define SOLO_P2M_STATUS(n)			(0x008C + ((n)*0x20))
-#define	  SOLO_P2M_COMMAND_DONE			(1<<8)
+#define	  SOLO_P2M_COMMAND_DONE			BIT(8)
 #define	  SOLO_P2M_CURRENT_ID(stat)		(0xff & (stat))
 
 #define SOLO_P2M_CONTROL(n)			(0x0090 + ((n)*0x20))
@@ -129,13 +131,13 @@
 #define	    SOLO_P2M_BURST_128			2
 #define	    SOLO_P2M_BURST_64			3
 #define	    SOLO_P2M_BURST_32			4
-#define	  SOLO_P2M_CSC_16BIT			(1<<6)	/* 0:24bit, 1:16bit */
+#define	  SOLO_P2M_CSC_16BIT			BIT(6)	/* 0:24bit, 1:16bit */
 /* 0:Y[0]<-0(OFF), 1:Y[0]<-1(ON), 2:Y[0]<-G[0], 3:Y[0]<-Bit[15] */
 #define	  SOLO_P2M_ALPHA_MODE(n)		((n)<<4)
-#define	  SOLO_P2M_CSC_ON			(1<<3)
-#define	  SOLO_P2M_INTERRUPT_REQ		(1<<2)
-#define	  SOLO_P2M_WRITE			(1<<1)
-#define	  SOLO_P2M_TRANS_ON			(1<<0)
+#define	  SOLO_P2M_CSC_ON			BIT(3)
+#define	  SOLO_P2M_INTERRUPT_REQ		BIT(2)
+#define	  SOLO_P2M_WRITE			BIT(1)
+#define	  SOLO_P2M_TRANS_ON			BIT(0)
 
 #define SOLO_P2M_EXT_CFG(n)			(0x0094 + ((n)*0x20))
 #define	  SOLO_P2M_EXT_INC(n)			((n)<<20)
@@ -157,9 +159,9 @@
 #define	  SOLO_VI_PROG_MASK(n)			((n)<<0)
 
 #define SOLO_VI_FMT_CFG				0x0114
-#define	  SOLO_VI_FMT_CHECK_VCOUNT		(1<<31)
-#define	  SOLO_VI_FMT_CHECK_HCOUNT		(1<<30)
-#define   SOLO_VI_FMT_TEST_SIGNAL		(1<<28)
+#define	  SOLO_VI_FMT_CHECK_VCOUNT		BIT(31)
+#define	  SOLO_VI_FMT_CHECK_HCOUNT		BIT(30)
+#define   SOLO_VI_FMT_TEST_SIGNAL		BIT(28)
 
 #define	SOLO_VI_PAGE_SW				0x0118
 #define	  SOLO_FI_INV_DISP_LIVE(n)		((n)<<8)
@@ -171,7 +173,7 @@
 #define	SOLO_VI_ACT_I_P				0x011C
 #define	SOLO_VI_ACT_I_S				0x0120
 #define	SOLO_VI_ACT_P				0x0124
-#define	  SOLO_VI_FI_INVERT			(1<<31)
+#define	  SOLO_VI_FI_INVERT			BIT(31)
 #define	  SOLO_VI_H_START(n)			((n)<<21)
 #define	  SOLO_VI_V_START(n)			((n)<<11)
 #define	  SOLO_VI_V_STOP(n)			((n)<<0)
@@ -184,8 +186,8 @@
 #define DISP_PAGE(stat)				((stat) & 0x07)
 
 #define SOLO_VI_PB_CONFIG			0x0130
-#define	  SOLO_VI_PB_USER_MODE			(1<<1)
-#define	  SOLO_VI_PB_PAL			(1<<0)
+#define	  SOLO_VI_PB_USER_MODE			BIT(1)
+#define	  SOLO_VI_PB_PAL			BIT(0)
 #define SOLO_VI_PB_RANGE_HV			0x0134
 #define	  SOLO_VI_PB_HSIZE(h)			((h)<<12)
 #define	  SOLO_VI_PB_VSIZE(v)			((v)<<0)
@@ -226,35 +228,35 @@
 #define	SOLO_VI_MOT_CTRL			0x0264
 #define	  SOLO_VI_MOTION_FRAME_COUNT(n)		((n)<<24)
 #define	  SOLO_VI_MOTION_SAMPLE_LENGTH(n)	((n)<<16)
-#define	  SOLO_VI_MOTION_INTR_START_STOP	(1<<15)
-#define	  SOLO_VI_MOTION_FREEZE_DATA		(1<<14)
+#define	  SOLO_VI_MOTION_INTR_START_STOP	BIT(15)
+#define	  SOLO_VI_MOTION_FREEZE_DATA		BIT(14)
 #define	  SOLO_VI_MOTION_SAMPLE_COUNT(n)	((n)<<0)
 #define SOLO_VI_MOT_CLEAR			0x0268
 #define SOLO_VI_MOT_STATUS			0x026C
 #define	  SOLO_VI_MOTION_CNT(n)			((n)<<0)
 #define SOLO_VI_MOTION_BORDER			0x0270
 #define SOLO_VI_MOTION_BAR			0x0274
-#define	  SOLO_VI_MOTION_Y_SET			(1<<29)
-#define	  SOLO_VI_MOTION_Y_ADD			(1<<28)
-#define	  SOLO_VI_MOTION_CB_SET			(1<<27)
-#define	  SOLO_VI_MOTION_CB_ADD			(1<<26)
-#define	  SOLO_VI_MOTION_CR_SET			(1<<25)
-#define	  SOLO_VI_MOTION_CR_ADD			(1<<24)
+#define	  SOLO_VI_MOTION_Y_SET			BIT(29)
+#define	  SOLO_VI_MOTION_Y_ADD			BIT(28)
+#define	  SOLO_VI_MOTION_CB_SET			BIT(27)
+#define	  SOLO_VI_MOTION_CB_ADD			BIT(26)
+#define	  SOLO_VI_MOTION_CR_SET			BIT(25)
+#define	  SOLO_VI_MOTION_CR_ADD			BIT(24)
 #define	  SOLO_VI_MOTION_Y_VALUE(v)		((v)<<16)
 #define	  SOLO_VI_MOTION_CB_VALUE(v)		((v)<<8)
 #define	  SOLO_VI_MOTION_CR_VALUE(v)		((v)<<0)
 
 #define	SOLO_VO_FMT_ENC				0x0300
-#define	  SOLO_VO_SCAN_MODE_PROGRESSIVE		(1<<31)
-#define	  SOLO_VO_FMT_TYPE_PAL			(1<<30)
+#define	  SOLO_VO_SCAN_MODE_PROGRESSIVE		BIT(31)
+#define	  SOLO_VO_FMT_TYPE_PAL			BIT(30)
 #define   SOLO_VO_FMT_TYPE_NTSC			0
-#define	  SOLO_VO_USER_SET			(1<<29)
+#define	  SOLO_VO_USER_SET			BIT(29)
 
-#define	  SOLO_VO_FI_CHANGE			(1<<20)
-#define	  SOLO_VO_USER_COLOR_SET_VSYNC		(1<<19)
-#define	  SOLO_VO_USER_COLOR_SET_HSYNC		(1<<18)
-#define	  SOLO_VO_USER_COLOR_SET_NAH		(1<<17)
-#define	  SOLO_VO_USER_COLOR_SET_NAV		(1<<16)
+#define	  SOLO_VO_FI_CHANGE			BIT(20)
+#define	  SOLO_VO_USER_COLOR_SET_VSYNC		BIT(19)
+#define	  SOLO_VO_USER_COLOR_SET_HSYNC		BIT(18)
+#define	  SOLO_VO_USER_COLOR_SET_NAH		BIT(17)
+#define	  SOLO_VO_USER_COLOR_SET_NAV		BIT(16)
 #define	  SOLO_VO_NA_COLOR_Y(Y)			((Y)<<8)
 #define	  SOLO_VO_NA_COLOR_CB(CB)		(((CB)/16)<<4)
 #define	  SOLO_VO_NA_COLOR_CR(CR)		(((CR)/16)<<0)
@@ -270,32 +272,32 @@
 #define	  SOLO_VO_V_STOP(n)			((n)<<0)
 
 #define	SOLO_VO_RANGE_HV			0x030C
-#define	  SOLO_VO_SYNC_INVERT			(1<<24)
-#define	  SOLO_VO_HSYNC_INVERT			(1<<23)
-#define	  SOLO_VO_VSYNC_INVERT			(1<<22)
+#define	  SOLO_VO_SYNC_INVERT			BIT(24)
+#define	  SOLO_VO_HSYNC_INVERT			BIT(23)
+#define	  SOLO_VO_VSYNC_INVERT			BIT(22)
 #define	  SOLO_VO_H_LEN(n)			((n)<<11)
 #define	  SOLO_VO_V_LEN(n)			((n)<<0)
 
 #define	SOLO_VO_DISP_CTRL			0x0310
-#define	  SOLO_VO_DISP_ON			(1<<31)
+#define	  SOLO_VO_DISP_ON			BIT(31)
 #define	  SOLO_VO_DISP_ERASE_COUNT(n)		((n&0xf)<<24)
-#define	  SOLO_VO_DISP_DOUBLE_SCAN		(1<<22)
-#define	  SOLO_VO_DISP_SINGLE_PAGE		(1<<21)
+#define	  SOLO_VO_DISP_DOUBLE_SCAN		BIT(22)
+#define	  SOLO_VO_DISP_SINGLE_PAGE		BIT(21)
 #define	  SOLO_VO_DISP_BASE(n)			(((n)>>16) & 0xffff)
 
 #define SOLO_VO_DISP_ERASE			0x0314
-#define	  SOLO_VO_DISP_ERASE_ON			(1<<0)
+#define	  SOLO_VO_DISP_ERASE_ON			BIT(0)
 
 #define	SOLO_VO_ZOOM_CTRL			0x0318
-#define	  SOLO_VO_ZOOM_VER_ON			(1<<24)
-#define	  SOLO_VO_ZOOM_HOR_ON			(1<<23)
-#define	  SOLO_VO_ZOOM_V_COMP			(1<<22)
+#define	  SOLO_VO_ZOOM_VER_ON			BIT(24)
+#define	  SOLO_VO_ZOOM_HOR_ON			BIT(23)
+#define	  SOLO_VO_ZOOM_V_COMP			BIT(22)
 #define	  SOLO_VO_ZOOM_SX(h)			(((h)/2)<<11)
 #define	  SOLO_VO_ZOOM_SY(v)			(((v)/2)<<0)
 
 #define SOLO_VO_FREEZE_CTRL			0x031C
-#define	  SOLO_VO_FREEZE_ON			(1<<1)
-#define	  SOLO_VO_FREEZE_INTERPOLATION		(1<<0)
+#define	  SOLO_VO_FREEZE_ON			BIT(1)
+#define	  SOLO_VO_FREEZE_INTERPOLATION		BIT(0)
 
 #define	SOLO_VO_BKG_COLOR			0x0320
 #define	  SOLO_BG_Y(y)				((y)<<16)
@@ -334,8 +336,8 @@
 #define SOLO_VO_EXPANSION(id)			(0x0250+((id)*4))
 
 #define	SOLO_OSG_CONFIG				0x03E0
-#define	  SOLO_VO_OSG_ON			(1<<31)
-#define	  SOLO_VO_OSG_COLOR_MUTE		(1<<28)
+#define	  SOLO_VO_OSG_ON			BIT(31)
+#define	  SOLO_VO_OSG_COLOR_MUTE		BIT(28)
 #define	  SOLO_VO_OSG_ALPHA_RATE(n)		((n)<<22)
 #define	  SOLO_VO_OSG_ALPHA_BG_RATE(n)		((n)<<16)
 #define	  SOLO_VO_OSG_BASE(offset)		(((offset)>>16)&0xffff)
@@ -345,8 +347,8 @@
 #define	  SOLO_OSG_ERASE_OFF			(0x00)
 
 #define SOLO_VO_OSG_BLINK			0x03E8
-#define	  SOLO_VO_OSG_BLINK_ON			(1<<1)
-#define	  SOLO_VO_OSG_BLINK_INTREVAL18		(1<<0)
+#define	  SOLO_VO_OSG_BLINK_ON			BIT(1)
+#define	  SOLO_VO_OSG_BLINK_INTREVAL18		BIT(0)
 
 #define SOLO_CAP_BASE				0x0400
 #define	  SOLO_CAP_MAX_PAGE(n)			((n)<<16)
@@ -374,19 +376,19 @@
 
 
 #define SOLO_VE_CFG0				0x0610
-#define	  SOLO_VE_TWO_PAGE_MODE			(1<<31)
+#define	  SOLO_VE_TWO_PAGE_MODE			BIT(31)
 #define	  SOLO_VE_INTR_CTRL(n)			((n)<<24)
 #define	  SOLO_VE_BLOCK_SIZE(n)			((n)<<16)
 #define	  SOLO_VE_BLOCK_BASE(n)			((n)<<0)
 
 #define SOLO_VE_CFG1				0x0614
 #define	  SOLO_VE_BYTE_ALIGN(n)			((n)<<24)
-#define	  SOLO_VE_INSERT_INDEX			(1<<18)
+#define	  SOLO_VE_INSERT_INDEX			BIT(18)
 #define	  SOLO_VE_MOTION_MODE(n)		((n)<<16)
 #define	  SOLO_VE_MOTION_BASE(n)		((n)<<0)
 #define   SOLO_VE_MPEG_SIZE_H(n)		((n)<<28) /* 6110 Only */
 #define   SOLO_VE_JPEG_SIZE_H(n)		((n)<<20) /* 6110 Only */
-#define   SOLO_VE_INSERT_INDEX_JPEG		(1<<19)   /* 6110 Only */
+#define   SOLO_VE_INSERT_INDEX_JPEG		BIT(19)   /* 6110 Only */
 
 #define SOLO_VE_WMRK_POLY			0x061C
 #define SOLO_VE_VMRK_INIT_KEY			0x0620
@@ -394,8 +396,8 @@
 #define SOLO_VE_ENCRYP_POLY			0x0628
 #define SOLO_VE_ENCRYP_INIT			0x062C
 #define SOLO_VE_ATTR				0x0630
-#define	  SOLO_VE_LITTLE_ENDIAN			(1<<31)
-#define	  SOLO_COMP_ATTR_RN			(1<<30)
+#define	  SOLO_VE_LITTLE_ENDIAN			BIT(31)
+#define	  SOLO_COMP_ATTR_RN			BIT(30)
 #define	  SOLO_COMP_ATTR_FCODE(n)		((n)<<27)
 #define	  SOLO_COMP_TIME_INC(n)			((n)<<25)
 #define	  SOLO_COMP_TIME_WIDTH(n)		((n)<<21)
@@ -416,9 +418,9 @@
 #define SOLO_VE_OSD_BASE			0x0694
 #define SOLO_VE_OSD_CLR				0x0698
 #define SOLO_VE_OSD_OPT				0x069C
-#define   SOLO_VE_OSD_V_DOUBLE			(1<<16) /* 6110 Only */
-#define   SOLO_VE_OSD_H_SHADOW			(1<<15)
-#define   SOLO_VE_OSD_V_SHADOW			(1<<14)
+#define   SOLO_VE_OSD_V_DOUBLE			BIT(16) /* 6110 Only */
+#define   SOLO_VE_OSD_H_SHADOW			BIT(15)
+#define   SOLO_VE_OSD_V_SHADOW			BIT(14)
 #define   SOLO_VE_OSD_H_OFFSET(n)		((n & 0x7f)<<7)
 #define   SOLO_VE_OSD_V_OFFSET(n)		(n & 0x7f)
 
@@ -435,18 +437,18 @@
 #define SOLO_VE_JPEG_QUE(n)			(0x0A04+((n)*8))
 
 #define SOLO_VD_CFG0				0x0900
-#define	  SOLO_VD_CFG_NO_WRITE_NO_WINDOW	(1<<24)
-#define	  SOLO_VD_CFG_BUSY_WIAT_CODE		(1<<23)
-#define	  SOLO_VD_CFG_BUSY_WIAT_REF		(1<<22)
-#define	  SOLO_VD_CFG_BUSY_WIAT_RES		(1<<21)
-#define	  SOLO_VD_CFG_BUSY_WIAT_MS		(1<<20)
-#define	  SOLO_VD_CFG_SINGLE_MODE		(1<<18)
-#define	  SOLO_VD_CFG_SCAL_MANUAL		(1<<17)
-#define	  SOLO_VD_CFG_USER_PAGE_CTRL		(1<<16)
-#define	  SOLO_VD_CFG_LITTLE_ENDIAN		(1<<15)
-#define	  SOLO_VD_CFG_START_FI			(1<<14)
-#define	  SOLO_VD_CFG_ERR_LOCK			(1<<13)
-#define	  SOLO_VD_CFG_ERR_INT_ENA		(1<<12)
+#define	  SOLO_VD_CFG_NO_WRITE_NO_WINDOW	BIT(24)
+#define	  SOLO_VD_CFG_BUSY_WIAT_CODE		BIT(23)
+#define	  SOLO_VD_CFG_BUSY_WIAT_REF		BIT(22)
+#define	  SOLO_VD_CFG_BUSY_WIAT_RES		BIT(21)
+#define	  SOLO_VD_CFG_BUSY_WIAT_MS		BIT(20)
+#define	  SOLO_VD_CFG_SINGLE_MODE		BIT(18)
+#define	  SOLO_VD_CFG_SCAL_MANUAL		BIT(17)
+#define	  SOLO_VD_CFG_USER_PAGE_CTRL		BIT(16)
+#define	  SOLO_VD_CFG_LITTLE_ENDIAN		BIT(15)
+#define	  SOLO_VD_CFG_START_FI			BIT(14)
+#define	  SOLO_VD_CFG_ERR_LOCK			BIT(13)
+#define	  SOLO_VD_CFG_ERR_INT_ENA		BIT(12)
 #define	  SOLO_VD_CFG_TIME_WIDTH(n)		((n)<<8)
 #define	  SOLO_VD_CFG_DCT_INTERVAL(n)		((n)<<0)
 
@@ -459,37 +461,37 @@
 #define SOLO_VD_CODE_ADR			0x090C
 
 #define SOLO_VD_CTRL				0x0910
-#define	  SOLO_VD_OPER_ON			(1<<31)
+#define	  SOLO_VD_OPER_ON			BIT(31)
 #define	  SOLO_VD_MAX_ITEM(n)			((n)<<0)
 
 #define SOLO_VD_STATUS0				0x0920
-#define	  SOLO_VD_STATUS0_INTR_ACK		(1<<22)
-#define	  SOLO_VD_STATUS0_INTR_EMPTY		(1<<21)
-#define	  SOLO_VD_STATUS0_INTR_ERR		(1<<20)
+#define	  SOLO_VD_STATUS0_INTR_ACK		BIT(22)
+#define	  SOLO_VD_STATUS0_INTR_EMPTY		BIT(21)
+#define	  SOLO_VD_STATUS0_INTR_ERR		BIT(20)
 
 #define SOLO_VD_STATUS1				0x0924
 
 #define SOLO_VD_IDX0				0x0930
-#define	  SOLO_VD_IDX_INTERLACE			(1<<30)
+#define	  SOLO_VD_IDX_INTERLACE			BIT(30)
 #define	  SOLO_VD_IDX_CHANNEL(n)		((n)<<24)
 #define	  SOLO_VD_IDX_SIZE(n)			((n)<<0)
 
 #define SOLO_VD_IDX1				0x0934
 #define	  SOLO_VD_IDX_SRC_SCALE(n)		((n)<<28)
 #define	  SOLO_VD_IDX_WINDOW(n)			((n)<<24)
-#define	  SOLO_VD_IDX_DEINTERLACE		(1<<16)
+#define	  SOLO_VD_IDX_DEINTERLACE		BIT(16)
 #define	  SOLO_VD_IDX_H_BLOCK(n)		((n)<<8)
 #define	  SOLO_VD_IDX_V_BLOCK(n)		((n)<<0)
 
 #define SOLO_VD_IDX2				0x0938
-#define	  SOLO_VD_IDX_REF_BASE_SIDE		(1<<31)
+#define	  SOLO_VD_IDX_REF_BASE_SIDE		BIT(31)
 #define	  SOLO_VD_IDX_REF_BASE(n)		(((n)>>16)&0xffff)
 
 #define SOLO_VD_IDX3				0x093C
 #define	  SOLO_VD_IDX_DISP_SCALE(n)		((n)<<28)
-#define	  SOLO_VD_IDX_INTERLACE_WR		(1<<27)
-#define	  SOLO_VD_IDX_INTERPOL			(1<<26)
-#define	  SOLO_VD_IDX_HOR2X			(1<<25)
+#define	  SOLO_VD_IDX_INTERLACE_WR		BIT(27)
+#define	  SOLO_VD_IDX_INTERPOL			BIT(26)
+#define	  SOLO_VD_IDX_HOR2X			BIT(25)
 #define	  SOLO_VD_IDX_OFFSET_X(n)		((n)<<12)
 #define	  SOLO_VD_IDX_OFFSET_Y(n)		((n)<<0)
 
@@ -511,21 +513,21 @@
 
 
 #define SOLO_IIC_CFG				0x0B20
-#define	  SOLO_IIC_ENABLE			(1<<8)
+#define	  SOLO_IIC_ENABLE			BIT(8)
 #define	  SOLO_IIC_PRESCALE(n)			((n)<<0)
 
 #define SOLO_IIC_CTRL				0x0B24
-#define	  SOLO_IIC_AUTO_CLEAR			(1<<20)
-#define	  SOLO_IIC_STATE_RX_ACK			(1<<19)
-#define	  SOLO_IIC_STATE_BUSY			(1<<18)
-#define	  SOLO_IIC_STATE_SIG_ERR		(1<<17)
-#define	  SOLO_IIC_STATE_TRNS			(1<<16)
+#define	  SOLO_IIC_AUTO_CLEAR			BIT(20)
+#define	  SOLO_IIC_STATE_RX_ACK			BIT(19)
+#define	  SOLO_IIC_STATE_BUSY			BIT(18)
+#define	  SOLO_IIC_STATE_SIG_ERR		BIT(17)
+#define	  SOLO_IIC_STATE_TRNS			BIT(16)
 #define	  SOLO_IIC_CH_SET(n)			((n)<<5)
-#define	  SOLO_IIC_ACK_EN			(1<<4)
-#define	  SOLO_IIC_START			(1<<3)
-#define	  SOLO_IIC_STOP				(1<<2)
-#define	  SOLO_IIC_READ				(1<<1)
-#define	  SOLO_IIC_WRITE			(1<<0)
+#define	  SOLO_IIC_ACK_EN			BIT(4)
+#define	  SOLO_IIC_START			BIT(3)
+#define	  SOLO_IIC_STOP				BIT(2)
+#define	  SOLO_IIC_READ				BIT(1)
+#define	  SOLO_IIC_WRITE			BIT(0)
 
 #define SOLO_IIC_TXD				0x0B28
 #define SOLO_IIC_RXD				0x0B2C
@@ -535,15 +537,15 @@
  */
 #define SOLO_UART_CONTROL(n)			(0x0BA0 + ((n)*0x20))
 #define	  SOLO_UART_CLK_DIV(n)			((n)<<24)
-#define	  SOLO_MODEM_CTRL_EN			(1<<20)
-#define	  SOLO_PARITY_ERROR_DROP		(1<<18)
-#define	  SOLO_IRQ_ERR_EN			(1<<17)
-#define	  SOLO_IRQ_RX_EN			(1<<16)
-#define	  SOLO_IRQ_TX_EN			(1<<15)
-#define	  SOLO_RX_EN				(1<<14)
-#define	  SOLO_TX_EN				(1<<13)
-#define	  SOLO_UART_HALF_DUPLEX			(1<<12)
-#define	  SOLO_UART_LOOPBACK			(1<<11)
+#define	  SOLO_MODEM_CTRL_EN			BIT(20)
+#define	  SOLO_PARITY_ERROR_DROP		BIT(18)
+#define	  SOLO_IRQ_ERR_EN			BIT(17)
+#define	  SOLO_IRQ_RX_EN			BIT(16)
+#define	  SOLO_IRQ_TX_EN			BIT(15)
+#define	  SOLO_RX_EN				BIT(14)
+#define	  SOLO_TX_EN				BIT(13)
+#define	  SOLO_UART_HALF_DUPLEX			BIT(12)
+#define	  SOLO_UART_LOOPBACK			BIT(11)
 
 #define	  SOLO_BAUDRATE_230400			((0<<9)|(0<<6))
 #define	  SOLO_BAUDRATE_115200			((0<<9)|(1<<6))
@@ -569,12 +571,12 @@
 #define	  SOLO_UART_PARITY_ODD			(3<<0)
 
 #define SOLO_UART_STATUS(n)			(0x0BA4 + ((n)*0x20))
-#define	  SOLO_UART_CTS				(1<<15)
-#define	  SOLO_UART_RX_BUSY			(1<<14)
-#define	  SOLO_UART_OVERRUN			(1<<13)
-#define	  SOLO_UART_FRAME_ERR			(1<<12)
-#define	  SOLO_UART_PARITY_ERR			(1<<11)
-#define	  SOLO_UART_TX_BUSY			(1<<5)
+#define	  SOLO_UART_CTS				BIT(15)
+#define	  SOLO_UART_RX_BUSY			BIT(14)
+#define	  SOLO_UART_OVERRUN			BIT(13)
+#define	  SOLO_UART_FRAME_ERR			BIT(12)
+#define	  SOLO_UART_PARITY_ERR			BIT(11)
+#define	  SOLO_UART_TX_BUSY			BIT(5)
 
 #define	  SOLO_UART_RX_BUFF_CNT(stat)		(((stat)>>6) & 0x1f)
 #define	  SOLO_UART_RX_BUFF_SIZE		8
@@ -582,9 +584,9 @@
 #define	  SOLO_UART_TX_BUFF_SIZE		8
 
 #define SOLO_UART_TX_DATA(n)			(0x0BA8 + ((n)*0x20))
-#define	  SOLO_UART_TX_DATA_PUSH		(1<<8)
+#define	  SOLO_UART_TX_DATA_PUSH		BIT(8)
 #define SOLO_UART_RX_DATA(n)			(0x0BAC + ((n)*0x20))
-#define	  SOLO_UART_RX_DATA_POP			(1<<8)
+#define	  SOLO_UART_RX_DATA_POP			BIT(8)
 
 #define SOLO_TIMER_CLOCK_NUM			0x0be0
 #define SOLO_TIMER_USEC				0x0be8
@@ -592,19 +594,19 @@
 #define SOLO_TIMER_USEC_LSB			0x0d20 /* 6110 Only */
 
 #define SOLO_AUDIO_CONTROL			0x0D00
-#define	  SOLO_AUDIO_ENABLE			(1<<31)
-#define	  SOLO_AUDIO_MASTER_MODE		(1<<30)
-#define	  SOLO_AUDIO_I2S_MODE			(1<<29)
-#define	  SOLO_AUDIO_I2S_LR_SWAP		(1<<27)
-#define	  SOLO_AUDIO_I2S_8BIT			(1<<26)
+#define	  SOLO_AUDIO_ENABLE			BIT(31)
+#define	  SOLO_AUDIO_MASTER_MODE		BIT(30)
+#define	  SOLO_AUDIO_I2S_MODE			BIT(29)
+#define	  SOLO_AUDIO_I2S_LR_SWAP		BIT(27)
+#define	  SOLO_AUDIO_I2S_8BIT			BIT(26)
 #define	  SOLO_AUDIO_I2S_MULTI(n)		((n)<<24)
-#define	  SOLO_AUDIO_MIX_9TO0			(1<<23)
+#define	  SOLO_AUDIO_MIX_9TO0			BIT(23)
 #define	  SOLO_AUDIO_DEC_9TO0_VOL(n)		((n)<<20)
-#define	  SOLO_AUDIO_MIX_19TO10			(1<<19)
+#define	  SOLO_AUDIO_MIX_19TO10			BIT(19)
 #define	  SOLO_AUDIO_DEC_19TO10_VOL(n)		((n)<<16)
 #define	  SOLO_AUDIO_MODE(n)			((n)<<0)
 #define SOLO_AUDIO_SAMPLE			0x0D04
-#define	  SOLO_AUDIO_EE_MODE_ON			(1<<30)
+#define	  SOLO_AUDIO_EE_MODE_ON			BIT(30)
 #define	  SOLO_AUDIO_EE_ENC_CH(ch)		((ch)<<25)
 #define	  SOLO_AUDIO_BITRATE(n)			((n)<<16)
 #define	  SOLO_AUDIO_CLK_DIV(n)			((n)<<0)
diff --git a/drivers/media/platform/am437x/am437x-vpfe_regs.h b/drivers/media/platform/am437x/am437x-vpfe_regs.h
index 4a0ed29723e8..0746c48ec23f 100644
--- a/drivers/media/platform/am437x/am437x-vpfe_regs.h
+++ b/drivers/media/platform/am437x/am437x-vpfe_regs.h
@@ -66,13 +66,13 @@
 #define VPFE_PIX_FMT_MASK			3
 #define VPFE_PIX_FMT_SHIFT			12
 #define VPFE_VP2SDR_DISABLE			0xfffbffff
-#define VPFE_WEN_ENABLE				(1 << 17)
+#define VPFE_WEN_ENABLE				BIT(17)
 #define VPFE_SDR2RSZ_DISABLE			0xfff7ffff
-#define VPFE_VDHDEN_ENABLE			(1 << 16)
-#define VPFE_LPF_ENABLE				(1 << 14)
-#define VPFE_ALAW_ENABLE			(1 << 3)
+#define VPFE_VDHDEN_ENABLE			BIT(16)
+#define VPFE_LPF_ENABLE				BIT(14)
+#define VPFE_ALAW_ENABLE			BIT(3)
 #define VPFE_ALAW_GAMMA_WD_MASK			7
-#define VPFE_BLK_CLAMP_ENABLE			(1 << 31)
+#define VPFE_BLK_CLAMP_ENABLE			BIT(31)
 #define VPFE_BLK_SGAIN_MASK			0x1f
 #define VPFE_BLK_ST_PXL_MASK			0x7fff
 #define VPFE_BLK_ST_PXL_SHIFT			10
@@ -85,8 +85,8 @@
 #define VPFE_BLK_COMP_GB_COMP_SHIFT		8
 #define VPFE_BLK_COMP_GR_COMP_SHIFT		16
 #define VPFE_BLK_COMP_R_COMP_SHIFT		24
-#define VPFE_LATCH_ON_VSYNC_DISABLE		(1 << 15)
-#define VPFE_DATA_PACK_ENABLE			(1 << 11)
+#define VPFE_LATCH_ON_VSYNC_DISABLE		BIT(15)
+#define VPFE_DATA_PACK_ENABLE			BIT(11)
 #define VPFE_HORZ_INFO_SPH_SHIFT		16
 #define VPFE_VERT_START_SLV0_SHIFT		16
 #define VPFE_VDINT_VDINT0_SHIFT			16
@@ -114,15 +114,15 @@
 #define VPFE_SYN_FLDMODE_MASK			1
 #define VPFE_SYN_FLDMODE_SHIFT			7
 #define VPFE_REC656IF_BT656_EN			3
-#define VPFE_SYN_MODE_VD_POL_NEGATIVE		(1 << 2)
+#define VPFE_SYN_MODE_VD_POL_NEGATIVE		BIT(2)
 #define VPFE_CCDCFG_Y8POS_SHIFT			11
-#define VPFE_CCDCFG_BW656_10BIT			(1 << 5)
+#define VPFE_CCDCFG_BW656_10BIT			BIT(5)
 #define VPFE_SDOFST_FIELD_INTERLEAVED		0x249
 #define VPFE_NO_CULLING				0xffff00ff
-#define VPFE_VDINT0				(1 << 0)
-#define VPFE_VDINT1				(1 << 1)
-#define VPFE_VDINT2				(1 << 2)
-#define VPFE_DMA_CNTL_OVERFLOW			(1 << 31)
+#define VPFE_VDINT0				BIT(0)
+#define VPFE_VDINT1				BIT(1)
+#define VPFE_VDINT2				BIT(2)
+#define VPFE_DMA_CNTL_OVERFLOW			BIT(31)
 
 #define VPFE_CONFIG_PCLK_INV_SHIFT		0
 #define VPFE_CONFIG_PCLK_INV_MASK		1
diff --git a/drivers/media/platform/davinci/dm644x_ccdc_regs.h b/drivers/media/platform/davinci/dm644x_ccdc_regs.h
index 3ae301320313..c4894f6a254e 100644
--- a/drivers/media/platform/davinci/dm644x_ccdc_regs.h
+++ b/drivers/media/platform/davinci/dm644x_ccdc_regs.h
@@ -66,13 +66,13 @@
 #define CCDC_PIX_FMT_MASK			3
 #define CCDC_PIX_FMT_SHIFT			12
 #define CCDC_VP2SDR_DISABLE			0xFFFBFFFF
-#define CCDC_WEN_ENABLE				(1 << 17)
+#define CCDC_WEN_ENABLE				BIT(17)
 #define CCDC_SDR2RSZ_DISABLE			0xFFF7FFFF
-#define CCDC_VDHDEN_ENABLE			(1 << 16)
-#define CCDC_LPF_ENABLE				(1 << 14)
-#define CCDC_ALAW_ENABLE			(1 << 3)
+#define CCDC_VDHDEN_ENABLE			BIT(16)
+#define CCDC_LPF_ENABLE				BIT(14)
+#define CCDC_ALAW_ENABLE			BIT(3)
 #define CCDC_ALAW_GAMMA_WD_MASK			7
-#define CCDC_BLK_CLAMP_ENABLE			(1 << 31)
+#define CCDC_BLK_CLAMP_ENABLE			BIT(31)
 #define CCDC_BLK_SGAIN_MASK			0x1F
 #define CCDC_BLK_ST_PXL_MASK			0x7FFF
 #define CCDC_BLK_ST_PXL_SHIFT			10
@@ -85,11 +85,11 @@
 #define CCDC_BLK_COMP_GB_COMP_SHIFT		8
 #define CCDC_BLK_COMP_GR_COMP_SHIFT		16
 #define CCDC_BLK_COMP_R_COMP_SHIFT		24
-#define CCDC_LATCH_ON_VSYNC_DISABLE		(1 << 15)
-#define CCDC_FPC_ENABLE				(1 << 15)
+#define CCDC_LATCH_ON_VSYNC_DISABLE		BIT(15)
+#define CCDC_FPC_ENABLE				BIT(15)
 #define CCDC_FPC_DISABLE			0
 #define CCDC_FPC_FPC_NUM_MASK			0x7FFF
-#define CCDC_DATA_PACK_ENABLE			(1 << 11)
+#define CCDC_DATA_PACK_ENABLE			BIT(11)
 #define CCDC_FMTCFG_VPIN_MASK			7
 #define CCDC_FMTCFG_VPIN_SHIFT			12
 #define CCDC_FMT_HORZ_FMTLNH_MASK		0x1FFF
@@ -132,9 +132,9 @@
 #define CCDC_SYN_FLDMODE_MASK			1
 #define CCDC_SYN_FLDMODE_SHIFT			7
 #define CCDC_REC656IF_BT656_EN			3
-#define CCDC_SYN_MODE_VD_POL_NEGATIVE		(1 << 2)
+#define CCDC_SYN_MODE_VD_POL_NEGATIVE		BIT(2)
 #define CCDC_CCDCFG_Y8POS_SHIFT			11
-#define CCDC_CCDCFG_BW656_10BIT			(1 << 5)
+#define CCDC_CCDCFG_BW656_10BIT			BIT(5)
 #define CCDC_SDOFST_FIELD_INTERLEAVED		0x249
 #define CCDC_NO_CULLING				0xffff00ff
 #endif
diff --git a/drivers/media/platform/exynos4-is/fimc-lite-reg.h b/drivers/media/platform/exynos4-is/fimc-lite-reg.h
index 48f2cf1148b8..c5656e902750 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite-reg.h
+++ b/drivers/media/platform/exynos4-is/fimc-lite-reg.h
@@ -6,6 +6,8 @@
 #ifndef FIMC_LITE_REG_H_
 #define FIMC_LITE_REG_H_
 
+#include <linux/bitops.h>
+
 #include "fimc-lite.h"
 
 /* Camera Source size */
@@ -27,27 +29,27 @@
 /* User defined formats. x = 0...15 */
 #define FLITE_REG_CIGCTRL_USER(x)		((0x30 + x - 1) << 24)
 #define FLITE_REG_CIGCTRL_FMT_MASK		(0x3f << 24)
-#define FLITE_REG_CIGCTRL_SHADOWMASK_DISABLE	(1 << 21)
-#define FLITE_REG_CIGCTRL_ODMA_DISABLE		(1 << 20)
-#define FLITE_REG_CIGCTRL_SWRST_REQ		(1 << 19)
-#define FLITE_REG_CIGCTRL_SWRST_RDY		(1 << 18)
-#define FLITE_REG_CIGCTRL_SWRST			(1 << 17)
-#define FLITE_REG_CIGCTRL_TEST_PATTERN_COLORBAR	(1 << 15)
-#define FLITE_REG_CIGCTRL_INVPOLPCLK		(1 << 14)
-#define FLITE_REG_CIGCTRL_INVPOLVSYNC		(1 << 13)
-#define FLITE_REG_CIGCTRL_INVPOLHREF		(1 << 12)
+#define FLITE_REG_CIGCTRL_SHADOWMASK_DISABLE	BIT(21)
+#define FLITE_REG_CIGCTRL_ODMA_DISABLE		BIT(20)
+#define FLITE_REG_CIGCTRL_SWRST_REQ		BIT(19)
+#define FLITE_REG_CIGCTRL_SWRST_RDY		BIT(18)
+#define FLITE_REG_CIGCTRL_SWRST			BIT(17)
+#define FLITE_REG_CIGCTRL_TEST_PATTERN_COLORBAR	BIT(15)
+#define FLITE_REG_CIGCTRL_INVPOLPCLK		BIT(14)
+#define FLITE_REG_CIGCTRL_INVPOLVSYNC		BIT(13)
+#define FLITE_REG_CIGCTRL_INVPOLHREF		BIT(12)
 /* Interrupts mask bits (1 disables an interrupt) */
-#define FLITE_REG_CIGCTRL_IRQ_LASTEN		(1 << 8)
-#define FLITE_REG_CIGCTRL_IRQ_ENDEN		(1 << 7)
-#define FLITE_REG_CIGCTRL_IRQ_STARTEN		(1 << 6)
-#define FLITE_REG_CIGCTRL_IRQ_OVFEN		(1 << 5)
+#define FLITE_REG_CIGCTRL_IRQ_LASTEN		BIT(8)
+#define FLITE_REG_CIGCTRL_IRQ_ENDEN		BIT(7)
+#define FLITE_REG_CIGCTRL_IRQ_STARTEN		BIT(6)
+#define FLITE_REG_CIGCTRL_IRQ_OVFEN		BIT(5)
 #define FLITE_REG_CIGCTRL_IRQ_DISABLE_MASK	(0xf << 5)
-#define FLITE_REG_CIGCTRL_SELCAM_MIPI		(1 << 3)
+#define FLITE_REG_CIGCTRL_SELCAM_MIPI		BIT(3)
 
 /* Image Capture Enable */
 #define FLITE_REG_CIIMGCPT			0x08
-#define FLITE_REG_CIIMGCPT_IMGCPTEN		(1 << 31)
-#define FLITE_REG_CIIMGCPT_CPT_FREN		(1 << 25)
+#define FLITE_REG_CIIMGCPT_IMGCPTEN		BIT(31)
+#define FLITE_REG_CIIMGCPT_CPT_FREN		BIT(25)
 #define FLITE_REG_CIIMGCPT_CPT_MOD_FRCNT	(1 << 18)
 #define FLITE_REG_CIIMGCPT_CPT_MOD_FREN		(0 << 18)
 
@@ -56,10 +58,10 @@
 
 /* Camera Window Offset */
 #define FLITE_REG_CIWDOFST			0x10
-#define FLITE_REG_CIWDOFST_WINOFSEN		(1 << 31)
-#define FLITE_REG_CIWDOFST_CLROVIY		(1 << 31)
-#define FLITE_REG_CIWDOFST_CLROVFICB		(1 << 15)
-#define FLITE_REG_CIWDOFST_CLROVFICR		(1 << 14)
+#define FLITE_REG_CIWDOFST_WINOFSEN		BIT(31)
+#define FLITE_REG_CIWDOFST_CLROVIY		BIT(31)
+#define FLITE_REG_CIWDOFST_CLROVFICB		BIT(15)
+#define FLITE_REG_CIWDOFST_CLROVFICR		BIT(14)
 #define FLITE_REG_CIWDOFST_OFST_MASK		((0x1fff << 16) | 0x1fff)
 
 /* Camera Window Offset2 */
@@ -67,8 +69,8 @@
 
 /* Camera Output DMA Format */
 #define FLITE_REG_CIODMAFMT			0x18
-#define FLITE_REG_CIODMAFMT_RAW_CON		(1 << 15)
-#define FLITE_REG_CIODMAFMT_PACK12		(1 << 14)
+#define FLITE_REG_CIODMAFMT_RAW_CON		BIT(15)
+#define FLITE_REG_CIODMAFMT_PACK12		BIT(14)
 #define FLITE_REG_CIODMAFMT_YCBYCR		(0 << 4)
 #define FLITE_REG_CIODMAFMT_YCRYCB		(1 << 4)
 #define FLITE_REG_CIODMAFMT_CBYCRY		(2 << 4)
@@ -88,34 +90,34 @@
 
 /* Camera Status */
 #define FLITE_REG_CISTATUS			0x40
-#define FLITE_REG_CISTATUS_MIPI_VVALID		(1 << 22)
-#define FLITE_REG_CISTATUS_MIPI_HVALID		(1 << 21)
-#define FLITE_REG_CISTATUS_MIPI_DVALID		(1 << 20)
-#define FLITE_REG_CISTATUS_ITU_VSYNC		(1 << 14)
-#define FLITE_REG_CISTATUS_ITU_HREFF		(1 << 13)
-#define FLITE_REG_CISTATUS_OVFIY		(1 << 10)
-#define FLITE_REG_CISTATUS_OVFICB		(1 << 9)
-#define FLITE_REG_CISTATUS_OVFICR		(1 << 8)
-#define FLITE_REG_CISTATUS_IRQ_SRC_OVERFLOW	(1 << 7)
-#define FLITE_REG_CISTATUS_IRQ_SRC_LASTCAPEND	(1 << 6)
-#define FLITE_REG_CISTATUS_IRQ_SRC_FRMSTART	(1 << 5)
-#define FLITE_REG_CISTATUS_IRQ_SRC_FRMEND	(1 << 4)
-#define FLITE_REG_CISTATUS_IRQ_CAM		(1 << 0)
+#define FLITE_REG_CISTATUS_MIPI_VVALID		BIT(22)
+#define FLITE_REG_CISTATUS_MIPI_HVALID		BIT(21)
+#define FLITE_REG_CISTATUS_MIPI_DVALID		BIT(20)
+#define FLITE_REG_CISTATUS_ITU_VSYNC		BIT(14)
+#define FLITE_REG_CISTATUS_ITU_HREFF		BIT(13)
+#define FLITE_REG_CISTATUS_OVFIY		BIT(10)
+#define FLITE_REG_CISTATUS_OVFICB		BIT(9)
+#define FLITE_REG_CISTATUS_OVFICR		BIT(8)
+#define FLITE_REG_CISTATUS_IRQ_SRC_OVERFLOW	BIT(7)
+#define FLITE_REG_CISTATUS_IRQ_SRC_LASTCAPEND	BIT(6)
+#define FLITE_REG_CISTATUS_IRQ_SRC_FRMSTART	BIT(5)
+#define FLITE_REG_CISTATUS_IRQ_SRC_FRMEND	BIT(4)
+#define FLITE_REG_CISTATUS_IRQ_CAM		BIT(0)
 #define FLITE_REG_CISTATUS_IRQ_MASK		(0xf << 4)
 
 /* Camera Status2 */
 #define FLITE_REG_CISTATUS2			0x44
-#define FLITE_REG_CISTATUS2_LASTCAPEND		(1 << 1)
-#define FLITE_REG_CISTATUS2_FRMEND		(1 << 0)
+#define FLITE_REG_CISTATUS2_LASTCAPEND		BIT(1)
+#define FLITE_REG_CISTATUS2_FRMEND		BIT(0)
 
 /* Qos Threshold */
 #define FLITE_REG_CITHOLD			0xf0
-#define FLITE_REG_CITHOLD_W_QOS_EN		(1 << 30)
+#define FLITE_REG_CITHOLD_W_QOS_EN		BIT(30)
 
 /* Camera General Purpose */
 #define FLITE_REG_CIGENERAL			0xfc
 /* b0: 1 - camera B, 0 - camera A */
-#define FLITE_REG_CIGENERAL_CAM_B		(1 << 0)
+#define FLITE_REG_CIGENERAL_CAM_B		BIT(0)
 
 #define FLITE_REG_CIFCNTSEQ			0x100
 #define FLITE_REG_CIOSAN(x)			(0x200 + (4 * (x)))
diff --git a/drivers/media/platform/exynos4-is/fimc-reg.h b/drivers/media/platform/exynos4-is/fimc-reg.h
index 03ba6c2bc84b..b81826d04936 100644
--- a/drivers/media/platform/exynos4-is/fimc-reg.h
+++ b/drivers/media/platform/exynos4-is/fimc-reg.h
@@ -8,12 +8,14 @@
 #ifndef FIMC_REG_H_
 #define FIMC_REG_H_
 
+#include <linux/bitops.h>
+
 #include "fimc-core.h"
 
 /* Input source format */
 #define FIMC_REG_CISRCFMT			0x00
-#define FIMC_REG_CISRCFMT_ITU601_8BIT		(1 << 31)
-#define FIMC_REG_CISRCFMT_ITU601_16BIT		(1 << 29)
+#define FIMC_REG_CISRCFMT_ITU601_8BIT		BIT(31)
+#define FIMC_REG_CISRCFMT_ITU601_16BIT		BIT(29)
 #define FIMC_REG_CISRCFMT_ORDER422_YCBYCR	(0 << 14)
 #define FIMC_REG_CISRCFMT_ORDER422_YCRYCB	(1 << 14)
 #define FIMC_REG_CISRCFMT_ORDER422_CBYCRY	(2 << 14)
@@ -21,45 +23,45 @@
 
 /* Window offset */
 #define FIMC_REG_CIWDOFST			0x04
-#define FIMC_REG_CIWDOFST_OFF_EN		(1 << 31)
-#define FIMC_REG_CIWDOFST_CLROVFIY		(1 << 30)
-#define FIMC_REG_CIWDOFST_CLROVRLB		(1 << 29)
+#define FIMC_REG_CIWDOFST_OFF_EN		BIT(31)
+#define FIMC_REG_CIWDOFST_CLROVFIY		BIT(30)
+#define FIMC_REG_CIWDOFST_CLROVRLB		BIT(29)
 #define FIMC_REG_CIWDOFST_HOROFF_MASK		(0x7ff << 16)
-#define FIMC_REG_CIWDOFST_CLROVFICB		(1 << 15)
-#define FIMC_REG_CIWDOFST_CLROVFICR		(1 << 14)
+#define FIMC_REG_CIWDOFST_CLROVFICB		BIT(15)
+#define FIMC_REG_CIWDOFST_CLROVFICR		BIT(14)
 #define FIMC_REG_CIWDOFST_VEROFF_MASK		(0xfff << 0)
 
 /* Global control */
 #define FIMC_REG_CIGCTRL			0x08
-#define FIMC_REG_CIGCTRL_SWRST			(1 << 31)
-#define FIMC_REG_CIGCTRL_CAMRST_A		(1 << 30)
-#define FIMC_REG_CIGCTRL_SELCAM_ITU_A		(1 << 29)
+#define FIMC_REG_CIGCTRL_SWRST			BIT(31)
+#define FIMC_REG_CIGCTRL_CAMRST_A		BIT(30)
+#define FIMC_REG_CIGCTRL_SELCAM_ITU_A		BIT(29)
 #define FIMC_REG_CIGCTRL_TESTPAT_NORMAL		(0 << 27)
 #define FIMC_REG_CIGCTRL_TESTPAT_COLOR_BAR	(1 << 27)
 #define FIMC_REG_CIGCTRL_TESTPAT_HOR_INC	(2 << 27)
 #define FIMC_REG_CIGCTRL_TESTPAT_VER_INC	(3 << 27)
 #define FIMC_REG_CIGCTRL_TESTPAT_MASK		(3 << 27)
 #define FIMC_REG_CIGCTRL_TESTPAT_SHIFT		27
-#define FIMC_REG_CIGCTRL_INVPOLPCLK		(1 << 26)
-#define FIMC_REG_CIGCTRL_INVPOLVSYNC		(1 << 25)
-#define FIMC_REG_CIGCTRL_INVPOLHREF		(1 << 24)
-#define FIMC_REG_CIGCTRL_IRQ_OVFEN		(1 << 22)
-#define FIMC_REG_CIGCTRL_HREF_MASK		(1 << 21)
-#define FIMC_REG_CIGCTRL_IRQ_LEVEL		(1 << 20)
-#define FIMC_REG_CIGCTRL_IRQ_CLR		(1 << 19)
-#define FIMC_REG_CIGCTRL_IRQ_ENABLE		(1 << 16)
-#define FIMC_REG_CIGCTRL_SHDW_DISABLE		(1 << 12)
+#define FIMC_REG_CIGCTRL_INVPOLPCLK		BIT(26)
+#define FIMC_REG_CIGCTRL_INVPOLVSYNC		BIT(25)
+#define FIMC_REG_CIGCTRL_INVPOLHREF		BIT(24)
+#define FIMC_REG_CIGCTRL_IRQ_OVFEN		BIT(22)
+#define FIMC_REG_CIGCTRL_HREF_MASK		BIT(21)
+#define FIMC_REG_CIGCTRL_IRQ_LEVEL		BIT(20)
+#define FIMC_REG_CIGCTRL_IRQ_CLR		BIT(19)
+#define FIMC_REG_CIGCTRL_IRQ_ENABLE		BIT(16)
+#define FIMC_REG_CIGCTRL_SHDW_DISABLE		BIT(12)
 /* 0 - selects Writeback A (LCD), 1 - selects Writeback B (LCD/ISP) */
-#define FIMC_REG_CIGCTRL_SELWB_A		(1 << 10)
-#define FIMC_REG_CIGCTRL_CAM_JPEG		(1 << 8)
-#define FIMC_REG_CIGCTRL_SELCAM_MIPI_A		(1 << 7)
-#define FIMC_REG_CIGCTRL_CAMIF_SELWB		(1 << 6)
+#define FIMC_REG_CIGCTRL_SELWB_A		BIT(10)
+#define FIMC_REG_CIGCTRL_CAM_JPEG		BIT(8)
+#define FIMC_REG_CIGCTRL_SELCAM_MIPI_A		BIT(7)
+#define FIMC_REG_CIGCTRL_CAMIF_SELWB		BIT(6)
 /* 0 - ITU601; 1 - ITU709 */
-#define FIMC_REG_CIGCTRL_CSC_ITU601_709		(1 << 5)
-#define FIMC_REG_CIGCTRL_INVPOLHSYNC		(1 << 4)
-#define FIMC_REG_CIGCTRL_SELCAM_MIPI		(1 << 3)
-#define FIMC_REG_CIGCTRL_INVPOLFIELD		(1 << 1)
-#define FIMC_REG_CIGCTRL_INTERLACE		(1 << 0)
+#define FIMC_REG_CIGCTRL_CSC_ITU601_709		BIT(5)
+#define FIMC_REG_CIGCTRL_INVPOLHSYNC		BIT(4)
+#define FIMC_REG_CIGCTRL_SELCAM_MIPI		BIT(3)
+#define FIMC_REG_CIGCTRL_INVPOLFIELD		BIT(1)
+#define FIMC_REG_CIGCTRL_INTERLACE		BIT(0)
 
 /* Window offset 2 */
 #define FIMC_REG_CIWDOFST2			0x14
@@ -73,7 +75,7 @@
 
 /* Target image format */
 #define FIMC_REG_CITRGFMT			0x48
-#define FIMC_REG_CITRGFMT_INROT90		(1 << 31)
+#define FIMC_REG_CITRGFMT_INROT90		BIT(31)
 #define FIMC_REG_CITRGFMT_YCBCR420		(0 << 29)
 #define FIMC_REG_CITRGFMT_YCBCR422		(1 << 29)
 #define FIMC_REG_CITRGFMT_YCBCR422_1P		(2 << 29)
@@ -86,7 +88,7 @@
 #define FIMC_REG_CITRGFMT_FLIP_Y_MIRROR		(2 << 14)
 #define FIMC_REG_CITRGFMT_FLIP_180		(3 << 14)
 #define FIMC_REG_CITRGFMT_FLIP_MASK		(3 << 14)
-#define FIMC_REG_CITRGFMT_OUTROT90		(1 << 13)
+#define FIMC_REG_CITRGFMT_OUTROT90		BIT(13)
 #define FIMC_REG_CITRGFMT_VSIZE_MASK		(0xfff << 0)
 
 /* Output DMA control */
@@ -96,7 +98,7 @@
 #define FIMC_REG_CIOCTRL_ORDER422_YCRYCB	(1 << 0)
 #define FIMC_REG_CIOCTRL_ORDER422_CBYCRY	(2 << 0)
 #define FIMC_REG_CIOCTRL_ORDER422_CRYCBY	(3 << 0)
-#define FIMC_REG_CIOCTRL_LASTIRQ_ENABLE		(1 << 2)
+#define FIMC_REG_CIOCTRL_LASTIRQ_ENABLE		BIT(2)
 #define FIMC_REG_CIOCTRL_YCBCR_3PLANE		(0 << 3)
 #define FIMC_REG_CIOCTRL_YCBCR_2PLANE		(1 << 3)
 #define FIMC_REG_CIOCTRL_YCBCR_PLANE_MASK	(1 << 3)
@@ -116,14 +118,14 @@
 
 /* Main scaler control */
 #define FIMC_REG_CISCCTRL			0x58
-#define FIMC_REG_CISCCTRL_SCALERBYPASS		(1 << 31)
-#define FIMC_REG_CISCCTRL_SCALEUP_H		(1 << 30)
-#define FIMC_REG_CISCCTRL_SCALEUP_V		(1 << 29)
-#define FIMC_REG_CISCCTRL_CSCR2Y_WIDE		(1 << 28)
-#define FIMC_REG_CISCCTRL_CSCY2R_WIDE		(1 << 27)
-#define FIMC_REG_CISCCTRL_LCDPATHEN_FIFO	(1 << 26)
-#define FIMC_REG_CISCCTRL_INTERLACE		(1 << 25)
-#define FIMC_REG_CISCCTRL_SCALERSTART		(1 << 15)
+#define FIMC_REG_CISCCTRL_SCALERBYPASS		BIT(31)
+#define FIMC_REG_CISCCTRL_SCALEUP_H		BIT(30)
+#define FIMC_REG_CISCCTRL_SCALEUP_V		BIT(29)
+#define FIMC_REG_CISCCTRL_CSCR2Y_WIDE		BIT(28)
+#define FIMC_REG_CISCCTRL_CSCY2R_WIDE		BIT(27)
+#define FIMC_REG_CISCCTRL_LCDPATHEN_FIFO	BIT(26)
+#define FIMC_REG_CISCCTRL_INTERLACE		BIT(25)
+#define FIMC_REG_CISCCTRL_SCALERSTART		BIT(15)
 #define FIMC_REG_CISCCTRL_INRGB_FMT_RGB565	(0 << 13)
 #define FIMC_REG_CISCCTRL_INRGB_FMT_RGB666	(1 << 13)
 #define FIMC_REG_CISCCTRL_INRGB_FMT_RGB888	(2 << 13)
@@ -132,8 +134,8 @@
 #define FIMC_REG_CISCCTRL_OUTRGB_FMT_RGB666	(1 << 11)
 #define FIMC_REG_CISCCTRL_OUTRGB_FMT_RGB888	(2 << 11)
 #define FIMC_REG_CISCCTRL_OUTRGB_FMT_MASK	(3 << 11)
-#define FIMC_REG_CISCCTRL_RGB_EXT		(1 << 10)
-#define FIMC_REG_CISCCTRL_ONE2ONE		(1 << 9)
+#define FIMC_REG_CISCCTRL_RGB_EXT		BIT(10)
+#define FIMC_REG_CISCCTRL_ONE2ONE		BIT(9)
 #define FIMC_REG_CISCCTRL_MHRATIO(x)		((x) << 16)
 #define FIMC_REG_CISCCTRL_MVRATIO(x)		((x) << 0)
 #define FIMC_REG_CISCCTRL_MHRATIO_MASK		(0x1ff << 16)
@@ -147,39 +149,39 @@
 
 /* General status */
 #define FIMC_REG_CISTATUS			0x64
-#define FIMC_REG_CISTATUS_OVFIY			(1 << 31)
-#define FIMC_REG_CISTATUS_OVFICB		(1 << 30)
-#define FIMC_REG_CISTATUS_OVFICR		(1 << 29)
-#define FIMC_REG_CISTATUS_VSYNC			(1 << 28)
+#define FIMC_REG_CISTATUS_OVFIY			BIT(31)
+#define FIMC_REG_CISTATUS_OVFICB		BIT(30)
+#define FIMC_REG_CISTATUS_OVFICR		BIT(29)
+#define FIMC_REG_CISTATUS_VSYNC			BIT(28)
 #define FIMC_REG_CISTATUS_FRAMECNT_MASK		(3 << 26)
 #define FIMC_REG_CISTATUS_FRAMECNT_SHIFT	26
-#define FIMC_REG_CISTATUS_WINOFF_EN		(1 << 25)
-#define FIMC_REG_CISTATUS_IMGCPT_EN		(1 << 22)
-#define FIMC_REG_CISTATUS_IMGCPT_SCEN		(1 << 21)
-#define FIMC_REG_CISTATUS_VSYNC_A		(1 << 20)
-#define FIMC_REG_CISTATUS_VSYNC_B		(1 << 19)
-#define FIMC_REG_CISTATUS_OVRLB			(1 << 18)
-#define FIMC_REG_CISTATUS_FRAME_END		(1 << 17)
-#define FIMC_REG_CISTATUS_LASTCAPT_END		(1 << 16)
-#define FIMC_REG_CISTATUS_VVALID_A		(1 << 15)
-#define FIMC_REG_CISTATUS_VVALID_B		(1 << 14)
+#define FIMC_REG_CISTATUS_WINOFF_EN		BIT(25)
+#define FIMC_REG_CISTATUS_IMGCPT_EN		BIT(22)
+#define FIMC_REG_CISTATUS_IMGCPT_SCEN		BIT(21)
+#define FIMC_REG_CISTATUS_VSYNC_A		BIT(20)
+#define FIMC_REG_CISTATUS_VSYNC_B		BIT(19)
+#define FIMC_REG_CISTATUS_OVRLB			BIT(18)
+#define FIMC_REG_CISTATUS_FRAME_END		BIT(17)
+#define FIMC_REG_CISTATUS_LASTCAPT_END		BIT(16)
+#define FIMC_REG_CISTATUS_VVALID_A		BIT(15)
+#define FIMC_REG_CISTATUS_VVALID_B		BIT(14)
 
 /* Indexes to the last and the currently processed buffer. */
 #define FIMC_REG_CISTATUS2			0x68
 
 /* Image capture control */
 #define FIMC_REG_CIIMGCPT			0xc0
-#define FIMC_REG_CIIMGCPT_IMGCPTEN		(1 << 31)
-#define FIMC_REG_CIIMGCPT_IMGCPTEN_SC		(1 << 30)
-#define FIMC_REG_CIIMGCPT_CPT_FREN_ENABLE	(1 << 25)
-#define FIMC_REG_CIIMGCPT_CPT_FRMOD_CNT		(1 << 18)
+#define FIMC_REG_CIIMGCPT_IMGCPTEN		BIT(31)
+#define FIMC_REG_CIIMGCPT_IMGCPTEN_SC		BIT(30)
+#define FIMC_REG_CIIMGCPT_CPT_FREN_ENABLE	BIT(25)
+#define FIMC_REG_CIIMGCPT_CPT_FRMOD_CNT		BIT(18)
 
 /* Frame capture sequence */
 #define FIMC_REG_CICPTSEQ			0xc4
 
 /* Image effect */
 #define FIMC_REG_CIIMGEFF			0xd0
-#define FIMC_REG_CIIMGEFF_IE_ENABLE		(1 << 30)
+#define FIMC_REG_CIIMGEFF_IE_ENABLE		BIT(30)
 #define FIMC_REG_CIIMGEFF_IE_SC_BEFORE		(0 << 29)
 #define FIMC_REG_CIIMGEFF_IE_SC_AFTER		(1 << 29)
 #define FIMC_REG_CIIMGEFF_FIN_BYPASS		(0 << 26)
@@ -198,8 +200,8 @@
 
 /* Real input DMA image size */
 #define FIMC_REG_CIREAL_ISIZE			0xf8
-#define FIMC_REG_CIREAL_ISIZE_AUTOLOAD_EN	(1 << 31)
-#define FIMC_REG_CIREAL_ISIZE_ADDR_CH_DIS	(1 << 30)
+#define FIMC_REG_CIREAL_ISIZE_AUTOLOAD_EN	BIT(31)
+#define FIMC_REG_CIREAL_ISIZE_ADDR_CH_DIS	BIT(30)
 
 /* Input DMA control */
 #define FIMC_REG_MSCTRL				0xfc
@@ -215,7 +217,7 @@
 #define FIMC_REG_MSCTRL_FLIP_X_MIRROR		(1 << 13)
 #define FIMC_REG_MSCTRL_FLIP_Y_MIRROR		(2 << 13)
 #define FIMC_REG_MSCTRL_FLIP_180		(3 << 13)
-#define FIMC_REG_MSCTRL_FIFO_CTRL_FULL		(1 << 12)
+#define FIMC_REG_MSCTRL_FIFO_CTRL_FULL		BIT(12)
 #define FIMC_REG_MSCTRL_ORDER422_SHIFT		4
 #define FIMC_REG_MSCTRL_ORDER422_CRYCBY		(0 << 4)
 #define FIMC_REG_MSCTRL_ORDER422_YCRYCB		(1 << 4)
@@ -223,14 +225,14 @@
 #define FIMC_REG_MSCTRL_ORDER422_YCBYCR		(3 << 4)
 #define FIMC_REG_MSCTRL_ORDER422_MASK		(3 << 4)
 #define FIMC_REG_MSCTRL_INPUT_EXTCAM		(0 << 3)
-#define FIMC_REG_MSCTRL_INPUT_MEMORY		(1 << 3)
-#define FIMC_REG_MSCTRL_INPUT_MASK		(1 << 3)
+#define FIMC_REG_MSCTRL_INPUT_MEMORY		BIT(3)
+#define FIMC_REG_MSCTRL_INPUT_MASK		BIT(3)
 #define FIMC_REG_MSCTRL_INFORMAT_YCBCR420	(0 << 1)
 #define FIMC_REG_MSCTRL_INFORMAT_YCBCR422	(1 << 1)
 #define FIMC_REG_MSCTRL_INFORMAT_YCBCR422_1P	(2 << 1)
 #define FIMC_REG_MSCTRL_INFORMAT_RGB		(3 << 1)
 #define FIMC_REG_MSCTRL_INFORMAT_MASK		(3 << 1)
-#define FIMC_REG_MSCTRL_ENVID			(1 << 0)
+#define FIMC_REG_MSCTRL_ENVID			BIT(0)
 #define FIMC_REG_MSCTRL_IN_BURST_COUNT(x)	((x) << 24)
 
 /* Output DMA Y/Cb/Cr offset */
@@ -277,10 +279,10 @@
 
 /* SYSREG ISP Writeback register address offsets */
 #define SYSREG_ISPBLK				0x020c
-#define SYSREG_ISPBLK_FIFORST_CAM_BLK		(1 << 7)
+#define SYSREG_ISPBLK_FIFORST_CAM_BLK		BIT(7)
 
 #define SYSREG_CAMBLK				0x0218
-#define SYSREG_CAMBLK_FIFORST_ISP		(1 << 15)
+#define SYSREG_CAMBLK_FIFORST_ISP		BIT(15)
 #define SYSREG_CAMBLK_ISPWB_FULL_EN		(7 << 20)
 
 /*
diff --git a/drivers/media/platform/omap3isp/ispreg.h b/drivers/media/platform/omap3isp/ispreg.h
index 38e2b99b3f10..4c6ebc0b74d1 100644
--- a/drivers/media/platform/omap3isp/ispreg.h
+++ b/drivers/media/platform/omap3isp/ispreg.h
@@ -45,7 +45,7 @@
 
 #define ISPCCP2_REVISION		(0x000)
 #define ISPCCP2_SYSCONFIG		(0x004)
-#define ISPCCP2_SYSCONFIG_SOFT_RESET	(1 << 1)
+#define ISPCCP2_SYSCONFIG_SOFT_RESET	BIT(1)
 #define ISPCCP2_SYSCONFIG_AUTO_IDLE		0x1
 #define ISPCCP2_SYSCONFIG_MSTANDBY_MODE_SHIFT	12
 #define ISPCCP2_SYSCONFIG_MSTANDBY_MODE_FORCE	\
@@ -55,44 +55,44 @@
 #define ISPCCP2_SYSCONFIG_MSTANDBY_MODE_SMART	\
 	(0x2 << ISPCCP2_SYSCONFIG_MSTANDBY_MODE_SHIFT)
 #define ISPCCP2_SYSSTATUS		(0x008)
-#define ISPCCP2_SYSSTATUS_RESET_DONE	(1 << 0)
+#define ISPCCP2_SYSSTATUS_RESET_DONE	BIT(0)
 #define ISPCCP2_LC01_IRQENABLE		(0x00C)
 #define ISPCCP2_LC01_IRQSTATUS		(0x010)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_FS_IRQ	(1 << 11)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_LE_IRQ	(1 << 10)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_LS_IRQ	(1 << 9)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_FE_IRQ	(1 << 8)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_COUNT_IRQ	(1 << 7)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_FIFO_OVF_IRQ	(1 << 5)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_CRC_IRQ	(1 << 4)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_FSP_IRQ	(1 << 3)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_FW_IRQ	(1 << 2)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_FSC_IRQ	(1 << 1)
-#define ISPCCP2_LC01_IRQSTATUS_LC0_SSC_IRQ	(1 << 0)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_FS_IRQ	BIT(11)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_LE_IRQ	BIT(10)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_LS_IRQ	BIT(9)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_FE_IRQ	BIT(8)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_COUNT_IRQ	BIT(7)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_FIFO_OVF_IRQ	BIT(5)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_CRC_IRQ	BIT(4)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_FSP_IRQ	BIT(3)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_FW_IRQ	BIT(2)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_FSC_IRQ	BIT(1)
+#define ISPCCP2_LC01_IRQSTATUS_LC0_SSC_IRQ	BIT(0)
 
 #define ISPCCP2_LC23_IRQENABLE		(0x014)
 #define ISPCCP2_LC23_IRQSTATUS		(0x018)
 #define ISPCCP2_LCM_IRQENABLE		(0x02C)
-#define ISPCCP2_LCM_IRQSTATUS_EOF_IRQ		(1 << 0)
-#define ISPCCP2_LCM_IRQSTATUS_OCPERROR_IRQ	(1 << 1)
+#define ISPCCP2_LCM_IRQSTATUS_EOF_IRQ		BIT(0)
+#define ISPCCP2_LCM_IRQSTATUS_OCPERROR_IRQ	BIT(1)
 #define ISPCCP2_LCM_IRQSTATUS		(0x030)
 #define ISPCCP2_CTRL			(0x040)
-#define ISPCCP2_CTRL_IF_EN		(1 << 0)
-#define ISPCCP2_CTRL_PHY_SEL		(1 << 1)
+#define ISPCCP2_CTRL_IF_EN		BIT(0)
+#define ISPCCP2_CTRL_PHY_SEL		BIT(1)
 #define ISPCCP2_CTRL_PHY_SEL_CLOCK	(0 << 1)
 #define ISPCCP2_CTRL_PHY_SEL_STROBE	(1 << 1)
 #define ISPCCP2_CTRL_PHY_SEL_MASK	0x1
 #define ISPCCP2_CTRL_PHY_SEL_SHIFT	1
-#define ISPCCP2_CTRL_IO_OUT_SEL		(1 << 2)
+#define ISPCCP2_CTRL_IO_OUT_SEL		BIT(2)
 #define ISPCCP2_CTRL_IO_OUT_SEL_MASK	0x1
 #define ISPCCP2_CTRL_IO_OUT_SEL_SHIFT	2
-#define ISPCCP2_CTRL_MODE		(1 << 4)
-#define ISPCCP2_CTRL_VP_CLK_FORCE_ON	(1 << 9)
-#define ISPCCP2_CTRL_INV		(1 << 10)
+#define ISPCCP2_CTRL_MODE		BIT(4)
+#define ISPCCP2_CTRL_VP_CLK_FORCE_ON	BIT(9)
+#define ISPCCP2_CTRL_INV		BIT(10)
 #define ISPCCP2_CTRL_INV_MASK		0x1
 #define ISPCCP2_CTRL_INV_SHIFT		10
-#define ISPCCP2_CTRL_VP_ONLY_EN		(1 << 11)
-#define ISPCCP2_CTRL_VP_CLK_POL		(1 << 12)
+#define ISPCCP2_CTRL_VP_ONLY_EN		BIT(11)
+#define ISPCCP2_CTRL_VP_CLK_POL		BIT(12)
 #define ISPCCP2_CTRL_VP_CLK_POL_MASK	0x1
 #define ISPCCP2_CTRL_VP_CLK_POL_SHIFT	12
 #define ISPCCP2_CTRL_VPCLK_DIV_SHIFT	15
@@ -102,12 +102,12 @@
 #define ISPCCP2_DBG			(0x044)
 #define ISPCCP2_GNQ			(0x048)
 #define ISPCCP2_LCx_CTRL(x)			((0x050)+0x30*(x))
-#define ISPCCP2_LCx_CTRL_CHAN_EN		(1 << 0)
-#define ISPCCP2_LCx_CTRL_CRC_EN			(1 << 19)
+#define ISPCCP2_LCx_CTRL_CHAN_EN		BIT(0)
+#define ISPCCP2_LCx_CTRL_CRC_EN			BIT(19)
 #define ISPCCP2_LCx_CTRL_CRC_MASK		0x1
 #define ISPCCP2_LCx_CTRL_CRC_SHIFT		2
 #define ISPCCP2_LCx_CTRL_CRC_SHIFT_15_0		19
-#define ISPCCP2_LCx_CTRL_REGION_EN		(1 << 1)
+#define ISPCCP2_LCx_CTRL_REGION_EN		BIT(1)
 #define ISPCCP2_LCx_CTRL_REGION_MASK		0x1
 #define ISPCCP2_LCx_CTRL_REGION_SHIFT		1
 #define ISPCCP2_LCx_CTRL_FORMAT_MASK_15_0	0x3f
@@ -127,8 +127,8 @@
 #define ISPCCP2_LCx_DAT_PONG_ADDR(x)	((0x074)+0x30*(x))
 #define ISPCCP2_LCx_DAT_OFST(x)		((0x078)+0x30*(x))
 #define ISPCCP2_LCM_CTRL		(0x1D0)
-#define ISPCCP2_LCM_CTRL_CHAN_EN               (1 << 0)
-#define ISPCCP2_LCM_CTRL_DST_PORT              (1 << 2)
+#define ISPCCP2_LCM_CTRL_CHAN_EN               BIT(0)
+#define ISPCCP2_LCM_CTRL_DST_PORT              BIT(2)
 #define ISPCCP2_LCM_CTRL_DST_PORT_SHIFT		2
 #define ISPCCP2_LCM_CTRL_READ_THROTTLE_SHIFT	3
 #define ISPCCP2_LCM_CTRL_READ_THROTTLE_MASK	0x11
@@ -138,8 +138,8 @@
 #define ISPCCP2_LCM_CTRL_SRC_FORMAT_MASK	0x7
 #define ISPCCP2_LCM_CTRL_SRC_DECOMPR_SHIFT	20
 #define ISPCCP2_LCM_CTRL_SRC_DECOMPR_MASK	0x3
-#define ISPCCP2_LCM_CTRL_SRC_DPCM_PRED		(1 << 22)
-#define ISPCCP2_LCM_CTRL_SRC_PACK		(1 << 23)
+#define ISPCCP2_LCM_CTRL_SRC_DPCM_PRED		BIT(22)
+#define ISPCCP2_LCM_CTRL_SRC_PACK		BIT(23)
 #define ISPCCP2_LCM_CTRL_DST_FORMAT_SHIFT	24
 #define ISPCCP2_LCM_CTRL_DST_FORMAT_MASK	0x7
 #define ISPCCP2_LCM_VSIZE		(0x1D4)
@@ -201,19 +201,19 @@
 
 /* SBL */
 #define ISPSBL_PCR			0x4
-#define ISPSBL_PCR_H3A_AEAWB_WBL_OVF	(1 << 16)
-#define ISPSBL_PCR_H3A_AF_WBL_OVF	(1 << 17)
-#define ISPSBL_PCR_RSZ4_WBL_OVF		(1 << 18)
-#define ISPSBL_PCR_RSZ3_WBL_OVF		(1 << 19)
-#define ISPSBL_PCR_RSZ2_WBL_OVF		(1 << 20)
-#define ISPSBL_PCR_RSZ1_WBL_OVF		(1 << 21)
-#define ISPSBL_PCR_PRV_WBL_OVF		(1 << 22)
-#define ISPSBL_PCR_CCDC_WBL_OVF		(1 << 23)
-#define ISPSBL_PCR_CCDCPRV_2_RSZ_OVF	(1 << 24)
-#define ISPSBL_PCR_CSIA_WBL_OVF		(1 << 25)
-#define ISPSBL_PCR_CSIB_WBL_OVF		(1 << 26)
+#define ISPSBL_PCR_H3A_AEAWB_WBL_OVF	BIT(16)
+#define ISPSBL_PCR_H3A_AF_WBL_OVF	BIT(17)
+#define ISPSBL_PCR_RSZ4_WBL_OVF		BIT(18)
+#define ISPSBL_PCR_RSZ3_WBL_OVF		BIT(19)
+#define ISPSBL_PCR_RSZ2_WBL_OVF		BIT(20)
+#define ISPSBL_PCR_RSZ1_WBL_OVF		BIT(21)
+#define ISPSBL_PCR_PRV_WBL_OVF		BIT(22)
+#define ISPSBL_PCR_CCDC_WBL_OVF		BIT(23)
+#define ISPSBL_PCR_CCDCPRV_2_RSZ_OVF	BIT(24)
+#define ISPSBL_PCR_CSIA_WBL_OVF		BIT(25)
+#define ISPSBL_PCR_CSIB_WBL_OVF		BIT(26)
 #define ISPSBL_CCDC_WR_0		(0x028)
-#define ISPSBL_CCDC_WR_0_DATA_READY	(1 << 21)
+#define ISPSBL_CCDC_WR_0_DATA_READY	BIT(21)
 #define ISPSBL_CCDC_WR_1		(0x02C)
 #define ISPSBL_CCDC_WR_2		(0x030)
 #define ISPSBL_CCDC_WR_3		(0x034)
@@ -366,16 +366,16 @@
 
 #define ISP_INT_CLR			0xFF113F11
 #define ISPPRV_PCR_EN			1
-#define ISPPRV_PCR_BUSY			(1 << 1)
-#define ISPPRV_PCR_SOURCE		(1 << 2)
-#define ISPPRV_PCR_ONESHOT		(1 << 3)
-#define ISPPRV_PCR_WIDTH		(1 << 4)
-#define ISPPRV_PCR_INVALAW		(1 << 5)
-#define ISPPRV_PCR_DRKFEN		(1 << 6)
-#define ISPPRV_PCR_DRKFCAP		(1 << 7)
-#define ISPPRV_PCR_HMEDEN		(1 << 8)
-#define ISPPRV_PCR_NFEN			(1 << 9)
-#define ISPPRV_PCR_CFAEN		(1 << 10)
+#define ISPPRV_PCR_BUSY			BIT(1)
+#define ISPPRV_PCR_SOURCE		BIT(2)
+#define ISPPRV_PCR_ONESHOT		BIT(3)
+#define ISPPRV_PCR_WIDTH		BIT(4)
+#define ISPPRV_PCR_INVALAW		BIT(5)
+#define ISPPRV_PCR_DRKFEN		BIT(6)
+#define ISPPRV_PCR_DRKFCAP		BIT(7)
+#define ISPPRV_PCR_HMEDEN		BIT(8)
+#define ISPPRV_PCR_NFEN			BIT(9)
+#define ISPPRV_PCR_CFAEN		BIT(10)
 #define ISPPRV_PCR_CFAFMT_SHIFT		11
 #define ISPPRV_PCR_CFAFMT_MASK		0x7800
 #define ISPPRV_PCR_CFAFMT_BAYER		(0 << 11)
@@ -384,22 +384,22 @@
 #define ISPPRV_PCR_CFAFMT_DNSPL		(3 << 11)
 #define ISPPRV_PCR_CFAFMT_HONEYCOMB	(4 << 11)
 #define ISPPRV_PCR_CFAFMT_RRGGBBFOVEON	(5 << 11)
-#define ISPPRV_PCR_YNENHEN		(1 << 15)
-#define ISPPRV_PCR_SUPEN		(1 << 16)
+#define ISPPRV_PCR_YNENHEN		BIT(15)
+#define ISPPRV_PCR_SUPEN		BIT(16)
 #define ISPPRV_PCR_YCPOS_SHIFT		17
 #define ISPPRV_PCR_YCPOS_YCrYCb		(0 << 17)
 #define ISPPRV_PCR_YCPOS_YCbYCr		(1 << 17)
 #define ISPPRV_PCR_YCPOS_CbYCrY		(2 << 17)
 #define ISPPRV_PCR_YCPOS_CrYCbY		(3 << 17)
-#define ISPPRV_PCR_RSZPORT		(1 << 19)
-#define ISPPRV_PCR_SDRPORT		(1 << 20)
-#define ISPPRV_PCR_SCOMP_EN		(1 << 21)
+#define ISPPRV_PCR_RSZPORT		BIT(19)
+#define ISPPRV_PCR_SDRPORT		BIT(20)
+#define ISPPRV_PCR_SCOMP_EN		BIT(21)
 #define ISPPRV_PCR_SCOMP_SFT_SHIFT	(22)
 #define ISPPRV_PCR_SCOMP_SFT_MASK	(7 << 22)
-#define ISPPRV_PCR_GAMMA_BYPASS		(1 << 26)
-#define ISPPRV_PCR_DCOREN		(1 << 27)
-#define ISPPRV_PCR_DCCOUP		(1 << 28)
-#define ISPPRV_PCR_DRK_FAIL		(1 << 31)
+#define ISPPRV_PCR_GAMMA_BYPASS		BIT(26)
+#define ISPPRV_PCR_DCOREN		BIT(27)
+#define ISPPRV_PCR_DCCOUP		BIT(28)
+#define ISPPRV_PCR_DRK_FAIL		BIT(31)
 
 #define ISPPRV_HORZ_INFO_EPH_SHIFT	0
 #define ISPPRV_HORZ_INFO_EPH_MASK	0x3fff
@@ -423,8 +423,8 @@
 #define ISPPRV_AVE_ODDDIST_4		0x3
 
 #define ISPPRV_HMED_THRESHOLD_SHIFT	0
-#define ISPPRV_HMED_EVENDIST		(1 << 8)
-#define ISPPRV_HMED_ODDDIST		(1 << 9)
+#define ISPPRV_HMED_EVENDIST		BIT(8)
+#define ISPPRV_HMED_ODDDIST		BIT(9)
 
 #define ISPPRV_WBGAIN_COEF0_SHIFT	0
 #define ISPPRV_WBGAIN_COEF1_SHIFT	8
@@ -517,8 +517,8 @@
 /* Define bit fields within selected registers */
 #define ISP_REVISION_SHIFT			0
 
-#define ISP_SYSCONFIG_AUTOIDLE			(1 << 0)
-#define ISP_SYSCONFIG_SOFTRESET			(1 << 1)
+#define ISP_SYSCONFIG_AUTOIDLE			BIT(0)
+#define ISP_SYSCONFIG_SOFTRESET			BIT(1)
 #define ISP_SYSCONFIG_MIDLEMODE_SHIFT		12
 #define ISP_SYSCONFIG_MIDLEMODE_FORCESTANDBY	0x0
 #define ISP_SYSCONFIG_MIDLEMODE_NOSTANBY	0x1
@@ -526,68 +526,68 @@
 
 #define ISP_SYSSTATUS_RESETDONE			0
 
-#define IRQ0ENABLE_CSIA_IRQ			(1 << 0)
-#define IRQ0ENABLE_CSIC_IRQ			(1 << 1)
-#define IRQ0ENABLE_CCP2_LCM_IRQ			(1 << 3)
-#define IRQ0ENABLE_CCP2_LC0_IRQ			(1 << 4)
-#define IRQ0ENABLE_CCP2_LC1_IRQ			(1 << 5)
-#define IRQ0ENABLE_CCP2_LC2_IRQ			(1 << 6)
-#define IRQ0ENABLE_CCP2_LC3_IRQ			(1 << 7)
+#define IRQ0ENABLE_CSIA_IRQ			BIT(0)
+#define IRQ0ENABLE_CSIC_IRQ			BIT(1)
+#define IRQ0ENABLE_CCP2_LCM_IRQ			BIT(3)
+#define IRQ0ENABLE_CCP2_LC0_IRQ			BIT(4)
+#define IRQ0ENABLE_CCP2_LC1_IRQ			BIT(5)
+#define IRQ0ENABLE_CCP2_LC2_IRQ			BIT(6)
+#define IRQ0ENABLE_CCP2_LC3_IRQ			BIT(7)
 #define IRQ0ENABLE_CSIB_IRQ			(IRQ0ENABLE_CCP2_LCM_IRQ | \
 						IRQ0ENABLE_CCP2_LC0_IRQ | \
 						IRQ0ENABLE_CCP2_LC1_IRQ | \
 						IRQ0ENABLE_CCP2_LC2_IRQ | \
 						IRQ0ENABLE_CCP2_LC3_IRQ)
 
-#define IRQ0ENABLE_CCDC_VD0_IRQ			(1 << 8)
-#define IRQ0ENABLE_CCDC_VD1_IRQ			(1 << 9)
-#define IRQ0ENABLE_CCDC_VD2_IRQ			(1 << 10)
-#define IRQ0ENABLE_CCDC_ERR_IRQ			(1 << 11)
-#define IRQ0ENABLE_H3A_AF_DONE_IRQ		(1 << 12)
-#define IRQ0ENABLE_H3A_AWB_DONE_IRQ		(1 << 13)
-#define IRQ0ENABLE_HIST_DONE_IRQ		(1 << 16)
-#define IRQ0ENABLE_CCDC_LSC_DONE_IRQ		(1 << 17)
-#define IRQ0ENABLE_CCDC_LSC_PREF_COMP_IRQ	(1 << 18)
-#define IRQ0ENABLE_CCDC_LSC_PREF_ERR_IRQ	(1 << 19)
-#define IRQ0ENABLE_PRV_DONE_IRQ			(1 << 20)
-#define IRQ0ENABLE_RSZ_DONE_IRQ			(1 << 24)
-#define IRQ0ENABLE_OVF_IRQ			(1 << 25)
-#define IRQ0ENABLE_PING_IRQ			(1 << 26)
-#define IRQ0ENABLE_PONG_IRQ			(1 << 27)
-#define IRQ0ENABLE_MMU_ERR_IRQ			(1 << 28)
-#define IRQ0ENABLE_OCP_ERR_IRQ			(1 << 29)
-#define IRQ0ENABLE_SEC_ERR_IRQ			(1 << 30)
-#define IRQ0ENABLE_HS_VS_IRQ			(1 << 31)
+#define IRQ0ENABLE_CCDC_VD0_IRQ			BIT(8)
+#define IRQ0ENABLE_CCDC_VD1_IRQ			BIT(9)
+#define IRQ0ENABLE_CCDC_VD2_IRQ			BIT(10)
+#define IRQ0ENABLE_CCDC_ERR_IRQ			BIT(11)
+#define IRQ0ENABLE_H3A_AF_DONE_IRQ		BIT(12)
+#define IRQ0ENABLE_H3A_AWB_DONE_IRQ		BIT(13)
+#define IRQ0ENABLE_HIST_DONE_IRQ		BIT(16)
+#define IRQ0ENABLE_CCDC_LSC_DONE_IRQ		BIT(17)
+#define IRQ0ENABLE_CCDC_LSC_PREF_COMP_IRQ	BIT(18)
+#define IRQ0ENABLE_CCDC_LSC_PREF_ERR_IRQ	BIT(19)
+#define IRQ0ENABLE_PRV_DONE_IRQ			BIT(20)
+#define IRQ0ENABLE_RSZ_DONE_IRQ			BIT(24)
+#define IRQ0ENABLE_OVF_IRQ			BIT(25)
+#define IRQ0ENABLE_PING_IRQ			BIT(26)
+#define IRQ0ENABLE_PONG_IRQ			BIT(27)
+#define IRQ0ENABLE_MMU_ERR_IRQ			BIT(28)
+#define IRQ0ENABLE_OCP_ERR_IRQ			BIT(29)
+#define IRQ0ENABLE_SEC_ERR_IRQ			BIT(30)
+#define IRQ0ENABLE_HS_VS_IRQ			BIT(31)
 
-#define IRQ0STATUS_CSIA_IRQ			(1 << 0)
-#define IRQ0STATUS_CSI2C_IRQ			(1 << 1)
-#define IRQ0STATUS_CCP2_LCM_IRQ			(1 << 3)
-#define IRQ0STATUS_CCP2_LC0_IRQ			(1 << 4)
+#define IRQ0STATUS_CSIA_IRQ			BIT(0)
+#define IRQ0STATUS_CSI2C_IRQ			BIT(1)
+#define IRQ0STATUS_CCP2_LCM_IRQ			BIT(3)
+#define IRQ0STATUS_CCP2_LC0_IRQ			BIT(4)
 #define IRQ0STATUS_CSIB_IRQ			(IRQ0STATUS_CCP2_LCM_IRQ | \
 						IRQ0STATUS_CCP2_LC0_IRQ)
 
-#define IRQ0STATUS_CSIB_LC1_IRQ			(1 << 5)
-#define IRQ0STATUS_CSIB_LC2_IRQ			(1 << 6)
-#define IRQ0STATUS_CSIB_LC3_IRQ			(1 << 7)
-#define IRQ0STATUS_CCDC_VD0_IRQ			(1 << 8)
-#define IRQ0STATUS_CCDC_VD1_IRQ			(1 << 9)
-#define IRQ0STATUS_CCDC_VD2_IRQ			(1 << 10)
-#define IRQ0STATUS_CCDC_ERR_IRQ			(1 << 11)
-#define IRQ0STATUS_H3A_AF_DONE_IRQ		(1 << 12)
-#define IRQ0STATUS_H3A_AWB_DONE_IRQ		(1 << 13)
-#define IRQ0STATUS_HIST_DONE_IRQ		(1 << 16)
-#define IRQ0STATUS_CCDC_LSC_DONE_IRQ		(1 << 17)
-#define IRQ0STATUS_CCDC_LSC_PREF_COMP_IRQ	(1 << 18)
-#define IRQ0STATUS_CCDC_LSC_PREF_ERR_IRQ	(1 << 19)
-#define IRQ0STATUS_PRV_DONE_IRQ			(1 << 20)
-#define IRQ0STATUS_RSZ_DONE_IRQ			(1 << 24)
-#define IRQ0STATUS_OVF_IRQ			(1 << 25)
-#define IRQ0STATUS_PING_IRQ			(1 << 26)
-#define IRQ0STATUS_PONG_IRQ			(1 << 27)
-#define IRQ0STATUS_MMU_ERR_IRQ			(1 << 28)
-#define IRQ0STATUS_OCP_ERR_IRQ			(1 << 29)
-#define IRQ0STATUS_SEC_ERR_IRQ			(1 << 30)
-#define IRQ0STATUS_HS_VS_IRQ			(1 << 31)
+#define IRQ0STATUS_CSIB_LC1_IRQ			BIT(5)
+#define IRQ0STATUS_CSIB_LC2_IRQ			BIT(6)
+#define IRQ0STATUS_CSIB_LC3_IRQ			BIT(7)
+#define IRQ0STATUS_CCDC_VD0_IRQ			BIT(8)
+#define IRQ0STATUS_CCDC_VD1_IRQ			BIT(9)
+#define IRQ0STATUS_CCDC_VD2_IRQ			BIT(10)
+#define IRQ0STATUS_CCDC_ERR_IRQ			BIT(11)
+#define IRQ0STATUS_H3A_AF_DONE_IRQ		BIT(12)
+#define IRQ0STATUS_H3A_AWB_DONE_IRQ		BIT(13)
+#define IRQ0STATUS_HIST_DONE_IRQ		BIT(16)
+#define IRQ0STATUS_CCDC_LSC_DONE_IRQ		BIT(17)
+#define IRQ0STATUS_CCDC_LSC_PREF_COMP_IRQ	BIT(18)
+#define IRQ0STATUS_CCDC_LSC_PREF_ERR_IRQ	BIT(19)
+#define IRQ0STATUS_PRV_DONE_IRQ			BIT(20)
+#define IRQ0STATUS_RSZ_DONE_IRQ			BIT(24)
+#define IRQ0STATUS_OVF_IRQ			BIT(25)
+#define IRQ0STATUS_PING_IRQ			BIT(26)
+#define IRQ0STATUS_PONG_IRQ			BIT(27)
+#define IRQ0STATUS_MMU_ERR_IRQ			BIT(28)
+#define IRQ0STATUS_OCP_ERR_IRQ			BIT(29)
+#define IRQ0STATUS_SEC_ERR_IRQ			BIT(30)
+#define IRQ0STATUS_HS_VS_IRQ			BIT(31)
 
 #define TCTRL_GRESET_LEN			0
 
@@ -607,20 +607,20 @@
 #define ISPCTRL_PAR_BRIDGE_MASK			(0x3 << 2)
 
 #define ISPCTRL_PAR_CLK_POL_SHIFT		4
-#define ISPCTRL_PAR_CLK_POL_INV			(1 << 4)
-#define ISPCTRL_PING_PONG_EN			(1 << 5)
+#define ISPCTRL_PAR_CLK_POL_INV			BIT(4)
+#define ISPCTRL_PING_PONG_EN			BIT(5)
 #define ISPCTRL_SHIFT_SHIFT			6
 #define ISPCTRL_SHIFT_0				(0x0 << 6)
 #define ISPCTRL_SHIFT_2				(0x1 << 6)
 #define ISPCTRL_SHIFT_4				(0x2 << 6)
 #define ISPCTRL_SHIFT_MASK			(0x3 << 6)
 
-#define ISPCTRL_CCDC_CLK_EN			(1 << 8)
-#define ISPCTRL_SCMP_CLK_EN			(1 << 9)
-#define ISPCTRL_H3A_CLK_EN			(1 << 10)
-#define ISPCTRL_HIST_CLK_EN			(1 << 11)
-#define ISPCTRL_PREV_CLK_EN			(1 << 12)
-#define ISPCTRL_RSZ_CLK_EN			(1 << 13)
+#define ISPCTRL_CCDC_CLK_EN			BIT(8)
+#define ISPCTRL_SCMP_CLK_EN			BIT(9)
+#define ISPCTRL_H3A_CLK_EN			BIT(10)
+#define ISPCTRL_HIST_CLK_EN			BIT(11)
+#define ISPCTRL_PREV_CLK_EN			BIT(12)
+#define ISPCTRL_RSZ_CLK_EN			BIT(13)
 #define ISPCTRL_SYNC_DETECT_SHIFT		14
 #define ISPCTRL_SYNC_DETECT_HSFALL	(0x0 << ISPCTRL_SYNC_DETECT_SHIFT)
 #define ISPCTRL_SYNC_DETECT_HSRISE	(0x1 << ISPCTRL_SYNC_DETECT_SHIFT)
@@ -628,17 +628,17 @@
 #define ISPCTRL_SYNC_DETECT_VSRISE	(0x3 << ISPCTRL_SYNC_DETECT_SHIFT)
 #define ISPCTRL_SYNC_DETECT_MASK	(0x3 << ISPCTRL_SYNC_DETECT_SHIFT)
 
-#define ISPCTRL_CCDC_RAM_EN		(1 << 16)
-#define ISPCTRL_PREV_RAM_EN		(1 << 17)
-#define ISPCTRL_SBL_RD_RAM_EN		(1 << 18)
-#define ISPCTRL_SBL_WR1_RAM_EN		(1 << 19)
-#define ISPCTRL_SBL_WR0_RAM_EN		(1 << 20)
-#define ISPCTRL_SBL_AUTOIDLE		(1 << 21)
-#define ISPCTRL_SBL_SHARED_WPORTC	(1 << 26)
-#define ISPCTRL_SBL_SHARED_RPORTA	(1 << 27)
-#define ISPCTRL_SBL_SHARED_RPORTB	(1 << 28)
-#define ISPCTRL_JPEG_FLUSH		(1 << 30)
-#define ISPCTRL_CCDC_FLUSH		(1 << 31)
+#define ISPCTRL_CCDC_RAM_EN		BIT(16)
+#define ISPCTRL_PREV_RAM_EN		BIT(17)
+#define ISPCTRL_SBL_RD_RAM_EN		BIT(18)
+#define ISPCTRL_SBL_WR1_RAM_EN		BIT(19)
+#define ISPCTRL_SBL_WR0_RAM_EN		BIT(20)
+#define ISPCTRL_SBL_AUTOIDLE		BIT(21)
+#define ISPCTRL_SBL_SHARED_WPORTC	BIT(26)
+#define ISPCTRL_SBL_SHARED_RPORTA	BIT(27)
+#define ISPCTRL_SBL_SHARED_RPORTB	BIT(28)
+#define ISPCTRL_JPEG_FLUSH		BIT(30)
+#define ISPCTRL_CCDC_FLUSH		BIT(31)
 
 #define ISPSECURE_SECUREMODE		0
 
@@ -655,20 +655,20 @@
 #define ISPTCTRL_CTRL_DIVC_SHIFT	10
 #define ISPTCTRL_CTRL_DIVC_NOCLOCK	(0x0 << 10)
 
-#define ISPTCTRL_CTRL_SHUTEN		(1 << 21)
-#define ISPTCTRL_CTRL_PSTRBEN		(1 << 22)
-#define ISPTCTRL_CTRL_STRBEN		(1 << 23)
-#define ISPTCTRL_CTRL_SHUTPOL		(1 << 24)
-#define ISPTCTRL_CTRL_STRBPSTRBPOL	(1 << 26)
+#define ISPTCTRL_CTRL_SHUTEN		BIT(21)
+#define ISPTCTRL_CTRL_PSTRBEN		BIT(22)
+#define ISPTCTRL_CTRL_STRBEN		BIT(23)
+#define ISPTCTRL_CTRL_SHUTPOL		BIT(24)
+#define ISPTCTRL_CTRL_STRBPSTRBPOL	BIT(26)
 
 #define ISPTCTRL_CTRL_INSEL_SHIFT	27
 #define ISPTCTRL_CTRL_INSEL_PARALLEL	(0x0 << 27)
 #define ISPTCTRL_CTRL_INSEL_CSIA	(0x1 << 27)
 #define ISPTCTRL_CTRL_INSEL_CSIB	(0x2 << 27)
 
-#define ISPTCTRL_CTRL_GRESETEn		(1 << 29)
-#define ISPTCTRL_CTRL_GRESETPOL		(1 << 30)
-#define ISPTCTRL_CTRL_GRESETDIR		(1 << 31)
+#define ISPTCTRL_CTRL_GRESETEn		BIT(29)
+#define ISPTCTRL_CTRL_GRESETPOL		BIT(30)
+#define ISPTCTRL_CTRL_GRESETDIR		BIT(31)
 
 #define ISPTCTRL_FRAME_SHUT_SHIFT		0
 #define ISPTCTRL_FRAME_PSTRB_SHIFT		6
@@ -679,33 +679,33 @@
 #define ISPCCDC_PID_TID_SHIFT			16
 
 #define ISPCCDC_PCR_EN				1
-#define ISPCCDC_PCR_BUSY			(1 << 1)
+#define ISPCCDC_PCR_BUSY			BIT(1)
 
 #define ISPCCDC_SYN_MODE_VDHDOUT		0x1
-#define ISPCCDC_SYN_MODE_FLDOUT			(1 << 1)
-#define ISPCCDC_SYN_MODE_VDPOL			(1 << 2)
-#define ISPCCDC_SYN_MODE_HDPOL			(1 << 3)
-#define ISPCCDC_SYN_MODE_FLDPOL			(1 << 4)
-#define ISPCCDC_SYN_MODE_EXWEN			(1 << 5)
-#define ISPCCDC_SYN_MODE_DATAPOL		(1 << 6)
-#define ISPCCDC_SYN_MODE_FLDMODE		(1 << 7)
+#define ISPCCDC_SYN_MODE_FLDOUT			BIT(1)
+#define ISPCCDC_SYN_MODE_VDPOL			BIT(2)
+#define ISPCCDC_SYN_MODE_HDPOL			BIT(3)
+#define ISPCCDC_SYN_MODE_FLDPOL			BIT(4)
+#define ISPCCDC_SYN_MODE_EXWEN			BIT(5)
+#define ISPCCDC_SYN_MODE_DATAPOL		BIT(6)
+#define ISPCCDC_SYN_MODE_FLDMODE		BIT(7)
 #define ISPCCDC_SYN_MODE_DATSIZ_MASK		(0x7 << 8)
 #define ISPCCDC_SYN_MODE_DATSIZ_8_16		(0x0 << 8)
 #define ISPCCDC_SYN_MODE_DATSIZ_12		(0x4 << 8)
 #define ISPCCDC_SYN_MODE_DATSIZ_11		(0x5 << 8)
 #define ISPCCDC_SYN_MODE_DATSIZ_10		(0x6 << 8)
 #define ISPCCDC_SYN_MODE_DATSIZ_8		(0x7 << 8)
-#define ISPCCDC_SYN_MODE_PACK8			(1 << 11)
+#define ISPCCDC_SYN_MODE_PACK8			BIT(11)
 #define ISPCCDC_SYN_MODE_INPMOD_MASK		(3 << 12)
 #define ISPCCDC_SYN_MODE_INPMOD_RAW		(0 << 12)
 #define ISPCCDC_SYN_MODE_INPMOD_YCBCR16		(1 << 12)
 #define ISPCCDC_SYN_MODE_INPMOD_YCBCR8		(2 << 12)
-#define ISPCCDC_SYN_MODE_LPF			(1 << 14)
-#define ISPCCDC_SYN_MODE_FLDSTAT		(1 << 15)
-#define ISPCCDC_SYN_MODE_VDHDEN			(1 << 16)
-#define ISPCCDC_SYN_MODE_WEN			(1 << 17)
-#define ISPCCDC_SYN_MODE_VP2SDR			(1 << 18)
-#define ISPCCDC_SYN_MODE_SDR2RSZ		(1 << 19)
+#define ISPCCDC_SYN_MODE_LPF			BIT(14)
+#define ISPCCDC_SYN_MODE_FLDSTAT		BIT(15)
+#define ISPCCDC_SYN_MODE_VDHDEN			BIT(16)
+#define ISPCCDC_SYN_MODE_WEN			BIT(17)
+#define ISPCCDC_SYN_MODE_VP2SDR			BIT(18)
+#define ISPCCDC_SYN_MODE_SDR2RSZ		BIT(19)
 
 #define ISPCCDC_HD_VD_WID_VDW_SHIFT		0
 #define ISPCCDC_HD_VD_WID_HDW_SHIFT		16
@@ -731,7 +731,7 @@
 
 #define ISPCCDC_HSIZE_OFF_SHIFT			0
 
-#define ISPCCDC_SDOFST_FIINV			(1 << 14)
+#define ISPCCDC_SDOFST_FIINV			BIT(14)
 #define ISPCCDC_SDOFST_FOFST_SHIFT		12
 #define ISPCCDC_SDOFST_FOFST_MASK		(3 << 12)
 #define ISPCCDC_SDOFST_LOFST3_SHIFT		0
@@ -743,7 +743,7 @@
 #define ISPCCDC_CLAMP_OBST_SHIFT		10
 #define ISPCCDC_CLAMP_OBSLN_SHIFT		25
 #define ISPCCDC_CLAMP_OBSLEN_SHIFT		28
-#define ISPCCDC_CLAMP_CLAMPEN			(1 << 31)
+#define ISPCCDC_CLAMP_CLAMPEN			BIT(31)
 
 #define ISPCCDC_COLPTN_R_Ye			0x0
 #define ISPCCDC_COLPTN_Gr_Cy			0x1
@@ -772,8 +772,8 @@
 #define ISPCCDC_BLKCMP_R_YE_SHIFT		24
 
 #define ISPCCDC_FPC_FPNUM_SHIFT			0
-#define ISPCCDC_FPC_FPCEN			(1 << 15)
-#define ISPCCDC_FPC_FPERR			(1 << 16)
+#define ISPCCDC_FPC_FPCEN			BIT(15)
+#define ISPCCDC_FPC_FPERR			BIT(16)
 
 #define ISPCCDC_VDINT_1_SHIFT			0
 #define ISPCCDC_VDINT_1_MASK			0x00007fff
@@ -784,23 +784,23 @@
 #define ISPCCDC_ALAW_GWDI_11_2			(0x4 << 0)
 #define ISPCCDC_ALAW_GWDI_10_1			(0x5 << 0)
 #define ISPCCDC_ALAW_GWDI_9_0			(0x6 << 0)
-#define ISPCCDC_ALAW_CCDTBL			(1 << 3)
+#define ISPCCDC_ALAW_CCDTBL			BIT(3)
 
 #define ISPCCDC_REC656IF_R656ON			1
-#define ISPCCDC_REC656IF_ECCFVH			(1 << 1)
+#define ISPCCDC_REC656IF_ECCFVH			BIT(1)
 
-#define ISPCCDC_CFG_BW656			(1 << 5)
+#define ISPCCDC_CFG_BW656			BIT(5)
 #define ISPCCDC_CFG_FIDMD_SHIFT			6
-#define ISPCCDC_CFG_WENLOG			(1 << 8)
+#define ISPCCDC_CFG_WENLOG			BIT(8)
 #define ISPCCDC_CFG_WENLOG_AND			(0 << 8)
 #define ISPCCDC_CFG_WENLOG_OR			(1 << 8)
-#define ISPCCDC_CFG_Y8POS			(1 << 11)
-#define ISPCCDC_CFG_BSWD			(1 << 12)
-#define ISPCCDC_CFG_MSBINVI			(1 << 13)
-#define ISPCCDC_CFG_VDLC			(1 << 15)
+#define ISPCCDC_CFG_Y8POS			BIT(11)
+#define ISPCCDC_CFG_BSWD			BIT(12)
+#define ISPCCDC_CFG_MSBINVI			BIT(13)
+#define ISPCCDC_CFG_VDLC			BIT(15)
 
 #define ISPCCDC_FMTCFG_FMTEN			0x1
-#define ISPCCDC_FMTCFG_LNALT			(1 << 1)
+#define ISPCCDC_FMTCFG_LNALT			BIT(1)
 #define ISPCCDC_FMTCFG_LNUM_SHIFT		2
 #define ISPCCDC_FMTCFG_PLEN_ODD_SHIFT		4
 #define ISPCCDC_FMTCFG_PLEN_EVEN_SHIFT		8
@@ -809,7 +809,7 @@
 #define ISPCCDC_FMTCFG_VPIN_11_2		(0x4 << 12)
 #define ISPCCDC_FMTCFG_VPIN_10_1		(0x5 << 12)
 #define ISPCCDC_FMTCFG_VPIN_9_0			(0x6 << 12)
-#define ISPCCDC_FMTCFG_VPEN			(1 << 15)
+#define ISPCCDC_FMTCFG_VPEN			BIT(15)
 
 #define ISPCCDC_FMTCFG_VPIF_FRQ_MASK		0x003f0000
 #define ISPCCDC_FMTCFG_VPIF_FRQ_SHIFT		16
@@ -839,9 +839,9 @@
 #define ISPRSZ_PID_CID_SHIFT			8
 #define ISPRSZ_PID_TID_SHIFT			16
 
-#define ISPRSZ_PCR_ENABLE			(1 << 0)
-#define ISPRSZ_PCR_BUSY				(1 << 1)
-#define ISPRSZ_PCR_ONESHOT			(1 << 2)
+#define ISPRSZ_PCR_ENABLE			BIT(0)
+#define ISPRSZ_PCR_BUSY				BIT(1)
+#define ISPRSZ_PCR_ONESHOT			BIT(2)
 
 #define ISPRSZ_CNT_HRSZ_SHIFT			0
 #define ISPRSZ_CNT_HRSZ_MASK			\
@@ -853,10 +853,10 @@
 #define ISPRSZ_CNT_HSTPH_MASK			(0x7 << ISPRSZ_CNT_HSTPH_SHIFT)
 #define ISPRSZ_CNT_VSTPH_SHIFT			23
 #define ISPRSZ_CNT_VSTPH_MASK			(0x7 << ISPRSZ_CNT_VSTPH_SHIFT)
-#define ISPRSZ_CNT_YCPOS			(1 << 26)
-#define ISPRSZ_CNT_INPTYP			(1 << 27)
-#define ISPRSZ_CNT_INPSRC			(1 << 28)
-#define ISPRSZ_CNT_CBILIN			(1 << 29)
+#define ISPRSZ_CNT_YCPOS			BIT(26)
+#define ISPRSZ_CNT_INPTYP			BIT(27)
+#define ISPRSZ_CNT_INPSRC			BIT(28)
+#define ISPRSZ_CNT_CBILIN			BIT(29)
 
 #define ISPRSZ_OUT_SIZE_HORZ_SHIFT		0
 #define ISPRSZ_OUT_SIZE_HORZ_MASK		\
@@ -1081,8 +1081,8 @@
 #define ISPH3A_PCR_AF_RGBPOS_SHIFT		11
 #define ISPH3A_PCR_AEW_AVE2LMT_SHIFT		22
 #define ISPH3A_PCR_AEW_AVE2LMT_MASK		0xFFC00000
-#define ISPH3A_PCR_BUSYAF			(1 << 15)
-#define ISPH3A_PCR_BUSYAEAWB			(1 << 18)
+#define ISPH3A_PCR_BUSYAF			BIT(15)
+#define ISPH3A_PCR_BUSYAEAWB			BIT(18)
 
 #define ISPH3A_AEWWIN1_WINHC_SHIFT		0
 #define ISPH3A_AEWWIN1_WINHC_MASK		0x3F
@@ -1167,14 +1167,14 @@
 #define ISPHIST_HV_INFO_MASK			0x3FFF3FFF
 
 #define ISPCCDC_LSC_ENABLE			1
-#define ISPCCDC_LSC_BUSY			(1 << 7)
+#define ISPCCDC_LSC_BUSY			BIT(7)
 #define ISPCCDC_LSC_GAIN_MODE_N_MASK		0x700
 #define ISPCCDC_LSC_GAIN_MODE_N_SHIFT		8
 #define ISPCCDC_LSC_GAIN_MODE_M_MASK		0x3800
 #define ISPCCDC_LSC_GAIN_MODE_M_SHIFT		12
 #define ISPCCDC_LSC_GAIN_FORMAT_MASK		0xE
 #define ISPCCDC_LSC_GAIN_FORMAT_SHIFT		1
-#define ISPCCDC_LSC_AFTER_REFORMATTER_MASK	(1<<6)
+#define ISPCCDC_LSC_AFTER_REFORMATTER_MASK	BIT(6)
 
 #define ISPCCDC_LSC_INITIAL_X_MASK		0x3F
 #define ISPCCDC_LSC_INITIAL_X_SHIFT		0
@@ -1196,43 +1196,43 @@
 	(0x1 << ISPCSI2_SYSCONFIG_MSTANDBY_MODE_SHIFT)
 #define ISPCSI2_SYSCONFIG_MSTANDBY_MODE_SMART	\
 	(0x2 << ISPCSI2_SYSCONFIG_MSTANDBY_MODE_SHIFT)
-#define ISPCSI2_SYSCONFIG_SOFT_RESET		(1 << 1)
-#define ISPCSI2_SYSCONFIG_AUTO_IDLE		(1 << 0)
+#define ISPCSI2_SYSCONFIG_SOFT_RESET		BIT(1)
+#define ISPCSI2_SYSCONFIG_AUTO_IDLE		BIT(0)
 
 #define ISPCSI2_SYSSTATUS			(0x014)
-#define ISPCSI2_SYSSTATUS_RESET_DONE		(1 << 0)
+#define ISPCSI2_SYSSTATUS_RESET_DONE		BIT(0)
 
 #define ISPCSI2_IRQSTATUS			(0x018)
-#define ISPCSI2_IRQSTATUS_OCP_ERR_IRQ		(1 << 14)
-#define ISPCSI2_IRQSTATUS_SHORT_PACKET_IRQ	(1 << 13)
-#define ISPCSI2_IRQSTATUS_ECC_CORRECTION_IRQ	(1 << 12)
-#define ISPCSI2_IRQSTATUS_ECC_NO_CORRECTION_IRQ	(1 << 11)
-#define ISPCSI2_IRQSTATUS_COMPLEXIO2_ERR_IRQ	(1 << 10)
-#define ISPCSI2_IRQSTATUS_COMPLEXIO1_ERR_IRQ	(1 << 9)
-#define ISPCSI2_IRQSTATUS_FIFO_OVF_IRQ		(1 << 8)
-#define ISPCSI2_IRQSTATUS_CONTEXT(n)		(1 << (n))
+#define ISPCSI2_IRQSTATUS_OCP_ERR_IRQ		BIT(14)
+#define ISPCSI2_IRQSTATUS_SHORT_PACKET_IRQ	BIT(13)
+#define ISPCSI2_IRQSTATUS_ECC_CORRECTION_IRQ	BIT(12)
+#define ISPCSI2_IRQSTATUS_ECC_NO_CORRECTION_IRQ	BIT(11)
+#define ISPCSI2_IRQSTATUS_COMPLEXIO2_ERR_IRQ	BIT(10)
+#define ISPCSI2_IRQSTATUS_COMPLEXIO1_ERR_IRQ	BIT(9)
+#define ISPCSI2_IRQSTATUS_FIFO_OVF_IRQ		BIT(8)
+#define ISPCSI2_IRQSTATUS_CONTEXT(n)		BIT(n)
 
 #define ISPCSI2_IRQENABLE			(0x01c)
 #define ISPCSI2_CTRL				(0x040)
-#define ISPCSI2_CTRL_VP_CLK_EN			(1 << 15)
-#define ISPCSI2_CTRL_VP_ONLY_EN			(1 << 11)
+#define ISPCSI2_CTRL_VP_CLK_EN			BIT(15)
+#define ISPCSI2_CTRL_VP_ONLY_EN			BIT(11)
 #define ISPCSI2_CTRL_VP_OUT_CTRL_SHIFT		8
 #define ISPCSI2_CTRL_VP_OUT_CTRL_MASK		\
 	(3 << ISPCSI2_CTRL_VP_OUT_CTRL_SHIFT)
-#define ISPCSI2_CTRL_DBG_EN			(1 << 7)
+#define ISPCSI2_CTRL_DBG_EN			BIT(7)
 #define ISPCSI2_CTRL_BURST_SIZE_SHIFT		5
 #define ISPCSI2_CTRL_BURST_SIZE_MASK		\
 	(3 << ISPCSI2_CTRL_BURST_SIZE_SHIFT)
-#define ISPCSI2_CTRL_FRAME			(1 << 3)
-#define ISPCSI2_CTRL_ECC_EN			(1 << 2)
-#define ISPCSI2_CTRL_SECURE			(1 << 1)
-#define ISPCSI2_CTRL_IF_EN			(1 << 0)
+#define ISPCSI2_CTRL_FRAME			BIT(3)
+#define ISPCSI2_CTRL_ECC_EN			BIT(2)
+#define ISPCSI2_CTRL_SECURE			BIT(1)
+#define ISPCSI2_CTRL_IF_EN			BIT(0)
 
 #define ISPCSI2_DBG_H				(0x044)
 #define ISPCSI2_GNQ				(0x048)
 #define ISPCSI2_PHY_CFG				(0x050)
-#define ISPCSI2_PHY_CFG_RESET_CTRL		(1 << 30)
-#define ISPCSI2_PHY_CFG_RESET_DONE		(1 << 29)
+#define ISPCSI2_PHY_CFG_RESET_CTRL		BIT(30)
+#define ISPCSI2_PHY_CFG_RESET_DONE		BIT(29)
 #define ISPCSI2_PHY_CFG_PWR_CMD_SHIFT		27
 #define ISPCSI2_PHY_CFG_PWR_CMD_MASK		\
 	(0x3 << ISPCSI2_PHY_CFG_PWR_CMD_SHIFT)
@@ -1251,7 +1251,7 @@
 	(0x1 << ISPCSI2_PHY_CFG_PWR_STATUS_SHIFT)
 #define ISPCSI2_PHY_CFG_PWR_STATUS_ULPW		\
 	(0x2 << ISPCSI2_PHY_CFG_PWR_STATUS_SHIFT)
-#define ISPCSI2_PHY_CFG_PWR_AUTO		(1 << 24)
+#define ISPCSI2_PHY_CFG_PWR_AUTO		BIT(24)
 
 #define ISPCSI2_PHY_CFG_DATA_POL_SHIFT(n)	(3 + ((n) * 4))
 #define ISPCSI2_PHY_CFG_DATA_POL_MASK(n)	\
@@ -1300,63 +1300,63 @@
 	(0x5 << ISPCSI2_PHY_CFG_CLOCK_POSITION_SHIFT)
 
 #define ISPCSI2_PHY_IRQSTATUS			(0x054)
-#define ISPCSI2_PHY_IRQSTATUS_STATEALLULPMEXIT	(1 << 26)
-#define ISPCSI2_PHY_IRQSTATUS_STATEALLULPMENTER	(1 << 25)
-#define ISPCSI2_PHY_IRQSTATUS_STATEULPM5	(1 << 24)
-#define ISPCSI2_PHY_IRQSTATUS_STATEULPM4	(1 << 23)
-#define ISPCSI2_PHY_IRQSTATUS_STATEULPM3	(1 << 22)
-#define ISPCSI2_PHY_IRQSTATUS_STATEULPM2	(1 << 21)
-#define ISPCSI2_PHY_IRQSTATUS_STATEULPM1	(1 << 20)
-#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL5	(1 << 19)
-#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL4	(1 << 18)
-#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL3	(1 << 17)
-#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL2	(1 << 16)
-#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL1	(1 << 15)
-#define ISPCSI2_PHY_IRQSTATUS_ERRESC5		(1 << 14)
-#define ISPCSI2_PHY_IRQSTATUS_ERRESC4		(1 << 13)
-#define ISPCSI2_PHY_IRQSTATUS_ERRESC3		(1 << 12)
-#define ISPCSI2_PHY_IRQSTATUS_ERRESC2		(1 << 11)
-#define ISPCSI2_PHY_IRQSTATUS_ERRESC1		(1 << 10)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS5	(1 << 9)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS4	(1 << 8)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS3	(1 << 7)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS2	(1 << 6)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS1	(1 << 5)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS5		(1 << 4)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS4		(1 << 3)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS3		(1 << 2)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS2		(1 << 1)
-#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS1		1
+#define ISPCSI2_PHY_IRQSTATUS_STATEALLULPMEXIT	BIT(26)
+#define ISPCSI2_PHY_IRQSTATUS_STATEALLULPMENTER	BIT(25)
+#define ISPCSI2_PHY_IRQSTATUS_STATEULPM5	BIT(24)
+#define ISPCSI2_PHY_IRQSTATUS_STATEULPM4	BIT(23)
+#define ISPCSI2_PHY_IRQSTATUS_STATEULPM3	BIT(22)
+#define ISPCSI2_PHY_IRQSTATUS_STATEULPM2	BIT(21)
+#define ISPCSI2_PHY_IRQSTATUS_STATEULPM1	BIT(20)
+#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL5	BIT(19)
+#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL4	BIT(18)
+#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL3	BIT(17)
+#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL2	BIT(16)
+#define ISPCSI2_PHY_IRQSTATUS_ERRCONTROL1	BIT(15)
+#define ISPCSI2_PHY_IRQSTATUS_ERRESC5		BIT(14)
+#define ISPCSI2_PHY_IRQSTATUS_ERRESC4		BIT(13)
+#define ISPCSI2_PHY_IRQSTATUS_ERRESC3		BIT(12)
+#define ISPCSI2_PHY_IRQSTATUS_ERRESC2		BIT(11)
+#define ISPCSI2_PHY_IRQSTATUS_ERRESC1		BIT(10)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS5	BIT(9)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS4	BIT(8)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS3	BIT(7)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS2	BIT(6)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTSYNCHS1	BIT(5)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS5		BIT(4)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS4		BIT(3)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS3		BIT(2)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS2		BIT(1)
+#define ISPCSI2_PHY_IRQSTATUS_ERRSOTHS1		BIT(0)
 
 #define ISPCSI2_SHORT_PACKET			(0x05c)
 #define ISPCSI2_PHY_IRQENABLE			(0x060)
-#define ISPCSI2_PHY_IRQENABLE_STATEALLULPMEXIT	(1 << 26)
-#define ISPCSI2_PHY_IRQENABLE_STATEALLULPMENTER	(1 << 25)
-#define ISPCSI2_PHY_IRQENABLE_STATEULPM5	(1 << 24)
-#define ISPCSI2_PHY_IRQENABLE_STATEULPM4	(1 << 23)
-#define ISPCSI2_PHY_IRQENABLE_STATEULPM3	(1 << 22)
-#define ISPCSI2_PHY_IRQENABLE_STATEULPM2	(1 << 21)
-#define ISPCSI2_PHY_IRQENABLE_STATEULPM1	(1 << 20)
-#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL5	(1 << 19)
-#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL4	(1 << 18)
-#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL3	(1 << 17)
-#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL2	(1 << 16)
-#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL1	(1 << 15)
-#define ISPCSI2_PHY_IRQENABLE_ERRESC5		(1 << 14)
-#define ISPCSI2_PHY_IRQENABLE_ERRESC4		(1 << 13)
-#define ISPCSI2_PHY_IRQENABLE_ERRESC3		(1 << 12)
-#define ISPCSI2_PHY_IRQENABLE_ERRESC2		(1 << 11)
-#define ISPCSI2_PHY_IRQENABLE_ERRESC1		(1 << 10)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS5	(1 << 9)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS4	(1 << 8)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS3	(1 << 7)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS2	(1 << 6)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS1	(1 << 5)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS5		(1 << 4)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS4		(1 << 3)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS3		(1 << 2)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS2		(1 << 1)
-#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS1		(1 << 0)
+#define ISPCSI2_PHY_IRQENABLE_STATEALLULPMEXIT	BIT(26)
+#define ISPCSI2_PHY_IRQENABLE_STATEALLULPMENTER	BIT(25)
+#define ISPCSI2_PHY_IRQENABLE_STATEULPM5	BIT(24)
+#define ISPCSI2_PHY_IRQENABLE_STATEULPM4	BIT(23)
+#define ISPCSI2_PHY_IRQENABLE_STATEULPM3	BIT(22)
+#define ISPCSI2_PHY_IRQENABLE_STATEULPM2	BIT(21)
+#define ISPCSI2_PHY_IRQENABLE_STATEULPM1	BIT(20)
+#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL5	BIT(19)
+#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL4	BIT(18)
+#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL3	BIT(17)
+#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL2	BIT(16)
+#define ISPCSI2_PHY_IRQENABLE_ERRCONTROL1	BIT(15)
+#define ISPCSI2_PHY_IRQENABLE_ERRESC5		BIT(14)
+#define ISPCSI2_PHY_IRQENABLE_ERRESC4		BIT(13)
+#define ISPCSI2_PHY_IRQENABLE_ERRESC3		BIT(12)
+#define ISPCSI2_PHY_IRQENABLE_ERRESC2		BIT(11)
+#define ISPCSI2_PHY_IRQENABLE_ERRESC1		BIT(10)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS5	BIT(9)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS4	BIT(8)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS3	BIT(7)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS2	BIT(6)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTSYNCHS1	BIT(5)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS5		BIT(4)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS4		BIT(3)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS3		BIT(2)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS2		BIT(1)
+#define ISPCSI2_PHY_IRQENABLE_ERRSOTHS1		BIT(0)
 
 #define ISPCSI2_DBG_P				(0x068)
 #define ISPCSI2_TIMING				(0x06c)
@@ -1371,12 +1371,12 @@
 #define ISPCSI2_CTX_CTRL1_COUNT_SHIFT		8
 #define ISPCSI2_CTX_CTRL1_COUNT_MASK		\
 	(0xff << ISPCSI2_CTX_CTRL1_COUNT_SHIFT)
-#define ISPCSI2_CTX_CTRL1_EOF_EN		(1 << 7)
-#define ISPCSI2_CTX_CTRL1_EOL_EN		(1 << 6)
-#define ISPCSI2_CTX_CTRL1_CS_EN			(1 << 5)
-#define ISPCSI2_CTX_CTRL1_COUNT_UNLOCK		(1 << 4)
-#define ISPCSI2_CTX_CTRL1_PING_PONG		(1 << 3)
-#define ISPCSI2_CTX_CTRL1_CTX_EN		(1 << 0)
+#define ISPCSI2_CTX_CTRL1_EOF_EN		BIT(7)
+#define ISPCSI2_CTX_CTRL1_EOL_EN		BIT(6)
+#define ISPCSI2_CTX_CTRL1_CS_EN			BIT(5)
+#define ISPCSI2_CTX_CTRL1_COUNT_UNLOCK		BIT(4)
+#define ISPCSI2_CTX_CTRL1_PING_PONG		BIT(3)
+#define ISPCSI2_CTX_CTRL1_CTX_EN		BIT(0)
 
 #define ISPCSI2_CTX_CTRL2(n)			((0x074) + 0x20 * (n))
 #define ISPCSI2_CTX_CTRL2_USER_DEF_MAP_SHIFT	13
@@ -1385,7 +1385,7 @@
 #define ISPCSI2_CTX_CTRL2_VIRTUAL_ID_SHIFT	11
 #define ISPCSI2_CTX_CTRL2_VIRTUAL_ID_MASK	\
 	(0x3 <<	ISPCSI2_CTX_CTRL2_VIRTUAL_ID_SHIFT)
-#define ISPCSI2_CTX_CTRL2_DPCM_PRED		(1 << 10)
+#define ISPCSI2_CTX_CTRL2_DPCM_PRED		BIT(10)
 #define ISPCSI2_CTX_CTRL2_FORMAT_SHIFT		0
 #define ISPCSI2_CTX_CTRL2_FORMAT_MASK		\
 	(0x3ff << ISPCSI2_CTX_CTRL2_FORMAT_SHIFT)
@@ -1401,24 +1401,24 @@
 #define ISPCSI2_CTX_DAT_PING_ADDR(n)		((0x07c) + 0x20 * (n))
 #define ISPCSI2_CTX_DAT_PONG_ADDR(n)		((0x080) + 0x20 * (n))
 #define ISPCSI2_CTX_IRQENABLE(n)		((0x084) + 0x20 * (n))
-#define ISPCSI2_CTX_IRQENABLE_ECC_CORRECTION_IRQ	(1 << 8)
-#define ISPCSI2_CTX_IRQENABLE_LINE_NUMBER_IRQ	(1 << 7)
-#define ISPCSI2_CTX_IRQENABLE_FRAME_NUMBER_IRQ	(1 << 6)
-#define ISPCSI2_CTX_IRQENABLE_CS_IRQ		(1 << 5)
-#define ISPCSI2_CTX_IRQENABLE_LE_IRQ		(1 << 3)
-#define ISPCSI2_CTX_IRQENABLE_LS_IRQ		(1 << 2)
-#define ISPCSI2_CTX_IRQENABLE_FE_IRQ		(1 << 1)
-#define ISPCSI2_CTX_IRQENABLE_FS_IRQ		(1 << 0)
+#define ISPCSI2_CTX_IRQENABLE_ECC_CORRECTION_IRQ	BIT(8)
+#define ISPCSI2_CTX_IRQENABLE_LINE_NUMBER_IRQ	BIT(7)
+#define ISPCSI2_CTX_IRQENABLE_FRAME_NUMBER_IRQ	BIT(6)
+#define ISPCSI2_CTX_IRQENABLE_CS_IRQ		BIT(5)
+#define ISPCSI2_CTX_IRQENABLE_LE_IRQ		BIT(3)
+#define ISPCSI2_CTX_IRQENABLE_LS_IRQ		BIT(2)
+#define ISPCSI2_CTX_IRQENABLE_FE_IRQ		BIT(1)
+#define ISPCSI2_CTX_IRQENABLE_FS_IRQ		BIT(0)
 
 #define ISPCSI2_CTX_IRQSTATUS(n)		((0x088) + 0x20 * (n))
-#define ISPCSI2_CTX_IRQSTATUS_ECC_CORRECTION_IRQ	(1 << 8)
-#define ISPCSI2_CTX_IRQSTATUS_LINE_NUMBER_IRQ	(1 << 7)
-#define ISPCSI2_CTX_IRQSTATUS_FRAME_NUMBER_IRQ	(1 << 6)
-#define ISPCSI2_CTX_IRQSTATUS_CS_IRQ		(1 << 5)
-#define ISPCSI2_CTX_IRQSTATUS_LE_IRQ		(1 << 3)
-#define ISPCSI2_CTX_IRQSTATUS_LS_IRQ		(1 << 2)
-#define ISPCSI2_CTX_IRQSTATUS_FE_IRQ		(1 << 1)
-#define ISPCSI2_CTX_IRQSTATUS_FS_IRQ		(1 << 0)
+#define ISPCSI2_CTX_IRQSTATUS_ECC_CORRECTION_IRQ	BIT(8)
+#define ISPCSI2_CTX_IRQSTATUS_LINE_NUMBER_IRQ	BIT(7)
+#define ISPCSI2_CTX_IRQSTATUS_FRAME_NUMBER_IRQ	BIT(6)
+#define ISPCSI2_CTX_IRQSTATUS_CS_IRQ		BIT(5)
+#define ISPCSI2_CTX_IRQSTATUS_LE_IRQ		BIT(3)
+#define ISPCSI2_CTX_IRQSTATUS_LS_IRQ		BIT(2)
+#define ISPCSI2_CTX_IRQSTATUS_FE_IRQ		BIT(1)
+#define ISPCSI2_CTX_IRQSTATUS_FS_IRQ		BIT(0)
 
 #define ISPCSI2_CTX_CTRL3(n)			((0x08c) + 0x20 * (n))
 #define ISPCSI2_CTX_CTRL3_ALPHA_SHIFT		5
@@ -1454,9 +1454,9 @@
 	(0xff << ISPCSIPHY_REG0_THS_SETTLE_SHIFT)
 
 #define ISPCSIPHY_REG1					(0x004)
-#define ISPCSIPHY_REG1_RESET_DONE_CTRLCLK		(1 << 29)
+#define ISPCSIPHY_REG1_RESET_DONE_CTRLCLK		BIT(29)
 /* This field is for OMAP3630 only */
-#define ISPCSIPHY_REG1_CLOCK_MISS_DETECTOR_STATUS	(1 << 25)
+#define ISPCSIPHY_REG1_CLOCK_MISS_DETECTOR_STATUS	BIT(25)
 #define ISPCSIPHY_REG1_TCLK_TERM_SHIFT			18
 #define ISPCSIPHY_REG1_TCLK_TERM_MASK			\
 	(0x7f << ISPCSIPHY_REG1_TCLK_TERM_SHIFT)
@@ -1498,11 +1498,11 @@
  */
 
 /* OMAP343X_CONTROL_CSIRXFE */
-#define OMAP343X_CONTROL_CSIRXFE_CSIB_INV	(1 << 7)
-#define OMAP343X_CONTROL_CSIRXFE_RESENABLE	(1 << 8)
-#define OMAP343X_CONTROL_CSIRXFE_SELFORM	(1 << 10)
-#define OMAP343X_CONTROL_CSIRXFE_PWRDNZ		(1 << 12)
-#define OMAP343X_CONTROL_CSIRXFE_RESET		(1 << 13)
+#define OMAP343X_CONTROL_CSIRXFE_CSIB_INV	BIT(7)
+#define OMAP343X_CONTROL_CSIRXFE_RESENABLE	BIT(8)
+#define OMAP343X_CONTROL_CSIRXFE_SELFORM	BIT(10)
+#define OMAP343X_CONTROL_CSIRXFE_PWRDNZ		BIT(12)
+#define OMAP343X_CONTROL_CSIRXFE_RESET		BIT(13)
 
 /* OMAP3630_CONTROL_CAMERA_PHY_CTRL */
 #define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_PHY1_SHIFT	2
@@ -1513,6 +1513,6 @@
 #define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_GPI		0x3
 #define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_MASK		0x3
 /* CCP2B: set to receive data from PHY2 instead of PHY1 */
-#define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CSI1_RX_SEL_PHY2	(1 << 4)
+#define OMAP3630_CONTROL_CAMERA_PHY_CTRL_CSI1_RX_SEL_PHY2	BIT(4)
 
 #endif	/* OMAP3_ISP_REG_H */
diff --git a/drivers/media/platform/s3c-camif/camif-regs.h b/drivers/media/platform/s3c-camif/camif-regs.h
index 29f839cdb486..052948a7b669 100644
--- a/drivers/media/platform/s3c-camif/camif-regs.h
+++ b/drivers/media/platform/s3c-camif/camif-regs.h
@@ -9,6 +9,8 @@
 #ifndef CAMIF_REGS_H_
 #define CAMIF_REGS_H_
 
+#include <linux/bitops.h>
+
 #include "camif-core.h"
 #include <media/drv-intf/s3c_camif.h>
 
@@ -19,7 +21,7 @@
 
 /* Camera input format */
 #define S3C_CAMIF_REG_CISRCFMT			0x00
-#define  CISRCFMT_ITU601_8BIT			(1 << 31)
+#define  CISRCFMT_ITU601_8BIT			BIT(31)
 #define  CISRCFMT_ITU656_8BIT			(0 << 31)
 #define  CISRCFMT_ORDER422_YCBYCR		(0 << 14)
 #define  CISRCFMT_ORDER422_YCRYCB		(1 << 14)
@@ -30,14 +32,14 @@
 
 /* Window offset */
 #define S3C_CAMIF_REG_CIWDOFST			0x04
-#define  CIWDOFST_WINOFSEN			(1 << 31)
-#define  CIWDOFST_CLROVCOFIY			(1 << 30)
-#define  CIWDOFST_CLROVRLB_PR			(1 << 28)
-/* #define  CIWDOFST_CLROVPRFIY			(1 << 27) */
-#define  CIWDOFST_CLROVCOFICB			(1 << 15)
-#define  CIWDOFST_CLROVCOFICR			(1 << 14)
-#define  CIWDOFST_CLROVPRFICB			(1 << 13)
-#define  CIWDOFST_CLROVPRFICR			(1 << 12)
+#define  CIWDOFST_WINOFSEN			BIT(31)
+#define  CIWDOFST_CLROVCOFIY			BIT(30)
+#define  CIWDOFST_CLROVRLB_PR			BIT(28)
+/* #define  CIWDOFST_CLROVPRFIY			BIT(27) */
+#define  CIWDOFST_CLROVCOFICB			BIT(15)
+#define  CIWDOFST_CLROVCOFICR			BIT(14)
+#define  CIWDOFST_CLROVPRFICB			BIT(13)
+#define  CIWDOFST_CLROVPRFICR			BIT(12)
 #define  CIWDOFST_OFST_MASK			(0x7ff << 16 | 0x7ff)
 
 /* Window offset 2 */
@@ -46,24 +48,24 @@
 
 /* Global control */
 #define S3C_CAMIF_REG_CIGCTRL			0x08
-#define  CIGCTRL_SWRST				(1 << 31)
-#define  CIGCTRL_CAMRST				(1 << 30)
+#define  CIGCTRL_SWRST				BIT(31)
+#define  CIGCTRL_CAMRST				BIT(30)
 #define  CIGCTRL_TESTPATTERN_NORMAL		(0 << 27)
 #define  CIGCTRL_TESTPATTERN_COLOR_BAR		(1 << 27)
 #define  CIGCTRL_TESTPATTERN_HOR_INC		(2 << 27)
 #define  CIGCTRL_TESTPATTERN_VER_INC		(3 << 27)
 #define  CIGCTRL_TESTPATTERN_MASK		(3 << 27)
-#define  CIGCTRL_INVPOLPCLK			(1 << 26)
-#define  CIGCTRL_INVPOLVSYNC			(1 << 25)
-#define  CIGCTRL_INVPOLHREF			(1 << 24)
-#define  CIGCTRL_IRQ_OVFEN			(1 << 22)
-#define  CIGCTRL_HREF_MASK			(1 << 21)
-#define  CIGCTRL_IRQ_LEVEL			(1 << 20)
+#define  CIGCTRL_INVPOLPCLK			BIT(26)
+#define  CIGCTRL_INVPOLVSYNC			BIT(25)
+#define  CIGCTRL_INVPOLHREF			BIT(24)
+#define  CIGCTRL_IRQ_OVFEN			BIT(22)
+#define  CIGCTRL_HREF_MASK			BIT(21)
+#define  CIGCTRL_IRQ_LEVEL			BIT(20)
 /* IRQ_CLR_C, IRQ_CLR_P */
-#define  CIGCTRL_IRQ_CLR(id)			(1 << (19 - (id)))
-#define  CIGCTRL_FIELDMODE			(1 << 2)
-#define  CIGCTRL_INVPOLFIELD			(1 << 1)
-#define  CIGCTRL_CAM_INTERLACE			(1 << 0)
+#define  CIGCTRL_IRQ_CLR(id)			BIT(19 - (id))
+#define  CIGCTRL_FIELDMODE			BIT(2)
+#define  CIGCTRL_INVPOLFIELD			BIT(1)
+#define  CIGCTRL_CAM_INTERLACE			BIT(0)
 
 /* Y DMA output frame start address. n = 0..3. */
 #define S3C_CAMIF_REG_CIYSA(id, n)		(0x18 + (id) * 0x54 + (n) * 4)
@@ -74,8 +76,8 @@
 
 /* CICOTRGFMT, CIPRTRGFMT - Target format */
 #define S3C_CAMIF_REG_CITRGFMT(id, _offs)	(0x48 + (id) * (0x34 + (_offs)))
-#define  CITRGFMT_IN422				(1 << 31) /* only for s3c24xx */
-#define  CITRGFMT_OUT422			(1 << 30) /* only for s3c24xx */
+#define  CITRGFMT_IN422				BIT(31) /* only for s3c24xx */
+#define  CITRGFMT_OUT422			BIT(30) /* only for s3c24xx */
 #define  CITRGFMT_OUTFORMAT_YCBCR420		(0 << 29) /* only for s3c6410 */
 #define  CITRGFMT_OUTFORMAT_YCBCR422		(1 << 29) /* only for s3c6410 */
 #define  CITRGFMT_OUTFORMAT_YCBCR422I		(2 << 29) /* only for s3c6410 */
@@ -88,7 +90,7 @@
 #define  CITRGFMT_FLIP_180			(3 << 14)
 #define  CITRGFMT_FLIP_MASK			(3 << 14)
 /* Preview path only */
-#define  CITRGFMT_ROT90_PR			(1 << 13)
+#define  CITRGFMT_ROT90_PR			BIT(13)
 #define  CITRGFMT_TARGETVSIZE(x)		((x) << 0)
 #define  CITRGFMT_TARGETSIZE_MASK		((0x1fff << 16) | 0x1fff)
 
@@ -102,7 +104,7 @@
 #define  CICTRL_RGBBURST2(x)			((x) << 14)
 #define  CICTRL_CBURST1(x)			((x) << 9)
 #define  CICTRL_CBURST2(x)			((x) << 4)
-#define  CICTRL_LASTIRQ_ENABLE			(1 << 2)
+#define  CICTRL_LASTIRQ_ENABLE			BIT(2)
 #define  CICTRL_ORDER422_MASK			(3 << 0)
 
 /* CICOSCPRERATIO, CIPRSCPRERATIO. Pre-scaler control 1. */
@@ -113,22 +115,22 @@
 
 /* CICOSCCTRL, CIPRSCCTRL. Main scaler control. */
 #define S3C_CAMIF_REG_CISCCTRL(id, _offs)	(0x58 + (id) * (0x34 + (_offs)))
-#define  CISCCTRL_SCALERBYPASS			(1 << 31)
+#define  CISCCTRL_SCALERBYPASS			BIT(31)
 /* s3c244x preview path only, s3c64xx both */
-#define  CIPRSCCTRL_SAMPLE			(1 << 31)
+#define  CIPRSCCTRL_SAMPLE			BIT(31)
 /* 0 - 16-bit RGB, 1 - 24-bit RGB */
-#define  CIPRSCCTRL_RGB_FORMAT_24BIT		(1 << 30) /* only for s3c244x */
-#define  CIPRSCCTRL_SCALEUP_H			(1 << 29) /* only for s3c244x */
-#define  CIPRSCCTRL_SCALEUP_V			(1 << 28) /* only for s3c244x */
+#define  CIPRSCCTRL_RGB_FORMAT_24BIT		BIT(30) /* only for s3c244x */
+#define  CIPRSCCTRL_SCALEUP_H			BIT(29) /* only for s3c244x */
+#define  CIPRSCCTRL_SCALEUP_V			BIT(28) /* only for s3c244x */
 /* s3c64xx */
-#define  CISCCTRL_SCALEUP_H			(1 << 30)
-#define  CISCCTRL_SCALEUP_V			(1 << 29)
+#define  CISCCTRL_SCALEUP_H			BIT(30)
+#define  CISCCTRL_SCALEUP_V			BIT(29)
 #define  CISCCTRL_SCALEUP_MASK			(0x3 << 29)
-#define  CISCCTRL_CSCR2Y_WIDE			(1 << 28)
-#define  CISCCTRL_CSCY2R_WIDE			(1 << 27)
-#define  CISCCTRL_LCDPATHEN_FIFO		(1 << 26)
-#define  CISCCTRL_INTERLACE			(1 << 25)
-#define  CISCCTRL_SCALERSTART			(1 << 15)
+#define  CISCCTRL_CSCR2Y_WIDE			BIT(28)
+#define  CISCCTRL_CSCY2R_WIDE			BIT(27)
+#define  CISCCTRL_LCDPATHEN_FIFO		BIT(26)
+#define  CISCCTRL_INTERLACE			BIT(25)
+#define  CISCCTRL_SCALERSTART			BIT(15)
 #define  CISCCTRL_INRGB_FMT_RGB565		(0 << 13)
 #define  CISCCTRL_INRGB_FMT_RGB666		(1 << 13)
 #define  CISCCTRL_INRGB_FMT_RGB888		(2 << 13)
@@ -137,8 +139,8 @@
 #define  CISCCTRL_OUTRGB_FMT_RGB666		(1 << 11)
 #define  CISCCTRL_OUTRGB_FMT_RGB888		(2 << 11)
 #define  CISCCTRL_OUTRGB_FMT_MASK		(3 << 11)
-#define  CISCCTRL_EXTRGB_EXTENSION		(1 << 10)
-#define  CISCCTRL_ONE2ONE			(1 << 9)
+#define  CISCCTRL_EXTRGB_EXTENSION		BIT(10)
+#define  CISCCTRL_ONE2ONE			BIT(9)
 #define  CISCCTRL_MAIN_RATIO_MASK		(0x1ff << 16 | 0x1ff)
 
 /* CICOTAREA, CIPRTAREA. Target area for DMA (Hsize x Vsize). */
@@ -147,38 +149,38 @@
 
 /* Codec (id = 0) or preview (id = 1) path status. */
 #define S3C_CAMIF_REG_CISTATUS(id, _offs)	(0x64 + (id) * (0x34 + (_offs)))
-#define  CISTATUS_OVFIY_STATUS			(1 << 31)
-#define  CISTATUS_OVFICB_STATUS			(1 << 30)
-#define  CISTATUS_OVFICR_STATUS			(1 << 29)
+#define  CISTATUS_OVFIY_STATUS			BIT(31)
+#define  CISTATUS_OVFICB_STATUS			BIT(30)
+#define  CISTATUS_OVFICR_STATUS			BIT(29)
 #define  CISTATUS_OVF_MASK			(0x7 << 29)
 #define  CIPRSTATUS_OVF_MASK			(0x3 << 30)
-#define  CISTATUS_VSYNC_STATUS			(1 << 28)
+#define  CISTATUS_VSYNC_STATUS			BIT(28)
 #define  CISTATUS_FRAMECNT_MASK			(3 << 26)
 #define  CISTATUS_FRAMECNT(__reg)		(((__reg) >> 26) & 0x3)
-#define  CISTATUS_WINOFSTEN_STATUS		(1 << 25)
-#define  CISTATUS_IMGCPTEN_STATUS		(1 << 22)
-#define  CISTATUS_IMGCPTENSC_STATUS		(1 << 21)
-#define  CISTATUS_VSYNC_A_STATUS		(1 << 20)
-#define  CISTATUS_FRAMEEND_STATUS		(1 << 19) /* 17 on s3c64xx */
+#define  CISTATUS_WINOFSTEN_STATUS		BIT(25)
+#define  CISTATUS_IMGCPTEN_STATUS		BIT(22)
+#define  CISTATUS_IMGCPTENSC_STATUS		BIT(21)
+#define  CISTATUS_VSYNC_A_STATUS		BIT(20)
+#define  CISTATUS_FRAMEEND_STATUS		BIT(19) /* 17 on s3c64xx */
 
 /* Image capture enable */
 #define S3C_CAMIF_REG_CIIMGCPT(_offs)		(0xa0 + (_offs))
-#define  CIIMGCPT_IMGCPTEN			(1 << 31)
-#define  CIIMGCPT_IMGCPTEN_SC(id)		(1 << (30 - (id)))
+#define  CIIMGCPT_IMGCPTEN			BIT(31)
+#define  CIIMGCPT_IMGCPTEN_SC(id)		BIT(30 - (id))
 /* Frame control: 1 - one-shot, 0 - free run */
-#define  CIIMGCPT_CPT_FREN_ENABLE(id)		(1 << (25 - (id)))
+#define  CIIMGCPT_CPT_FREN_ENABLE(id)		BIT(25 - (id))
 #define  CIIMGCPT_CPT_FRMOD_ENABLE		(0 << 18)
-#define  CIIMGCPT_CPT_FRMOD_CNT			(1 << 18)
+#define  CIIMGCPT_CPT_FRMOD_CNT			BIT(18)
 
 /* Capture sequence */
 #define S3C_CAMIF_REG_CICPTSEQ			0xc4
 
 /* Image effects */
 #define S3C_CAMIF_REG_CIIMGEFF(_offs)		(0xb0 + (_offs))
-#define  CIIMGEFF_IE_ENABLE(id)			(1 << (30 + (id)))
+#define  CIIMGEFF_IE_ENABLE(id)			BIT(30 + (id))
 #define  CIIMGEFF_IE_ENABLE_MASK		(3 << 30)
 /* Image effect: 1 - after scaler, 0 - before scaler */
-#define  CIIMGEFF_IE_AFTER_SC			(1 << 29)
+#define  CIIMGEFF_IE_AFTER_SC			BIT(29)
 #define  CIIMGEFF_FIN_MASK			(7 << 26)
 #define  CIIMGEFF_FIN_BYPASS			(0 << 26)
 #define  CIIMGEFF_FIN_ARBITRARY			(1 << 26)
@@ -207,8 +209,8 @@
 
 /* Real input DMA data size. n = 0 - codec, 1 - preview. */
 #define S3C_CAMIF_REG_MSWIDTH(id)		(0xf8 + (id) * 0x2c)
-#define  AUTOLOAD_ENABLE			(1 << 31)
-#define  ADDR_CH_DIS				(1 << 30)
+#define  AUTOLOAD_ENABLE			BIT(31)
+#define  ADDR_CH_DIS				BIT(30)
 #define  MSHEIGHT(x)				(((x) & 0x3ff) << 16)
 #define  MSWIDTH(x)				((x) & 0x3ff)
 
@@ -219,12 +221,12 @@
 #define  MSCTRL_ORDER422_M_CBYCRY		(2 << 4)
 #define  MSCTRL_ORDER422_M_CRYCBY		(3 << 4)
 /* 0 - camera, 1 - DMA */
-#define  MSCTRL_SEL_DMA_CAM			(1 << 3)
+#define  MSCTRL_SEL_DMA_CAM			BIT(3)
 #define  MSCTRL_INFORMAT_M_YCBCR420		(0 << 1)
 #define  MSCTRL_INFORMAT_M_YCBCR422		(1 << 1)
 #define  MSCTRL_INFORMAT_M_YCBCR422I		(2 << 1)
 #define  MSCTRL_INFORMAT_M_RGB			(3 << 1)
-#define  MSCTRL_ENVID_M				(1 << 0)
+#define  MSCTRL_ENVID_M				BIT(0)
 
 /* CICOSCOSY, CIPRSCOSY. Scan line Y/Cb/Cr offset. */
 #define S3C_CAMIF_REG_CISSY(id)			(0x12c + (id) * 0x0c)
diff --git a/drivers/media/platform/tegra-cec/tegra_cec.h b/drivers/media/platform/tegra-cec/tegra_cec.h
index 32d7d69f9491..8c370be38e1e 100644
--- a/drivers/media/platform/tegra-cec/tegra_cec.h
+++ b/drivers/media/platform/tegra-cec/tegra_cec.h
@@ -34,24 +34,24 @@
 #define TEGRA_CEC_HWCTRL_RX_LADDR_MASK				0x7fff
 #define TEGRA_CEC_HWCTRL_RX_LADDR(x)	\
 	((x) & TEGRA_CEC_HWCTRL_RX_LADDR_MASK)
-#define TEGRA_CEC_HWCTRL_RX_SNOOP				(1 << 15)
-#define TEGRA_CEC_HWCTRL_RX_NAK_MODE				(1 << 16)
-#define TEGRA_CEC_HWCTRL_TX_NAK_MODE				(1 << 24)
-#define TEGRA_CEC_HWCTRL_FAST_SIM_MODE				(1 << 30)
-#define TEGRA_CEC_HWCTRL_TX_RX_MODE				(1 << 31)
+#define TEGRA_CEC_HWCTRL_RX_SNOOP				BIT(15)
+#define TEGRA_CEC_HWCTRL_RX_NAK_MODE				BIT(16)
+#define TEGRA_CEC_HWCTRL_TX_NAK_MODE				BIT(24)
+#define TEGRA_CEC_HWCTRL_FAST_SIM_MODE				BIT(30)
+#define TEGRA_CEC_HWCTRL_TX_RX_MODE				BIT(31)
 
-#define TEGRA_CEC_INPUT_FILTER_MODE				(1 << 31)
+#define TEGRA_CEC_INPUT_FILTER_MODE				BIT(31)
 #define TEGRA_CEC_INPUT_FILTER_FIFO_LENGTH_SHIFT		0
 
 #define TEGRA_CEC_TX_REG_DATA_SHIFT				0
-#define TEGRA_CEC_TX_REG_EOM					(1 << 8)
-#define TEGRA_CEC_TX_REG_BCAST					(1 << 12)
-#define TEGRA_CEC_TX_REG_START_BIT				(1 << 16)
-#define TEGRA_CEC_TX_REG_RETRY					(1 << 17)
+#define TEGRA_CEC_TX_REG_EOM					BIT(8)
+#define TEGRA_CEC_TX_REG_BCAST					BIT(12)
+#define TEGRA_CEC_TX_REG_START_BIT				BIT(16)
+#define TEGRA_CEC_TX_REG_RETRY					BIT(17)
 
 #define TEGRA_CEC_RX_REGISTER_SHIFT				0
-#define TEGRA_CEC_RX_REGISTER_EOM				(1 << 8)
-#define TEGRA_CEC_RX_REGISTER_ACK				(1 << 9)
+#define TEGRA_CEC_RX_REGISTER_EOM				BIT(8)
+#define TEGRA_CEC_RX_REGISTER_ACK				BIT(9)
 
 #define TEGRA_CEC_RX_TIM0_START_BIT_MAX_LO_TIME_SHIFT		0
 #define TEGRA_CEC_RX_TIM0_START_BIT_MIN_LO_TIME_SHIFT		8
@@ -79,38 +79,38 @@
 #define TEGRA_CEC_TX_TIM2_BUS_IDLE_TIME_NEW_FRAME_SHIFT		4
 #define TEGRA_CEC_TX_TIM2_BUS_IDLE_TIME_RETRY_FRAME_SHIFT	8
 
-#define TEGRA_CEC_INT_STAT_TX_REGISTER_EMPTY			(1 << 0)
-#define TEGRA_CEC_INT_STAT_TX_REGISTER_UNDERRUN			(1 << 1)
-#define TEGRA_CEC_INT_STAT_TX_FRAME_OR_BLOCK_NAKD		(1 << 2)
-#define TEGRA_CEC_INT_STAT_TX_ARBITRATION_FAILED		(1 << 3)
-#define TEGRA_CEC_INT_STAT_TX_BUS_ANOMALY_DETECTED		(1 << 4)
-#define TEGRA_CEC_INT_STAT_TX_FRAME_TRANSMITTED			(1 << 5)
-#define TEGRA_CEC_INT_STAT_RX_REGISTER_FULL			(1 << 8)
-#define TEGRA_CEC_INT_STAT_RX_REGISTER_OVERRUN			(1 << 9)
-#define TEGRA_CEC_INT_STAT_RX_START_BIT_DETECTED		(1 << 10)
-#define TEGRA_CEC_INT_STAT_RX_BUS_ANOMALY_DETECTED		(1 << 11)
-#define TEGRA_CEC_INT_STAT_RX_BUS_ERROR_DETECTED		(1 << 12)
-#define TEGRA_CEC_INT_STAT_FILTERED_RX_DATA_PIN_TRANSITION_H2L	(1 << 13)
-#define TEGRA_CEC_INT_STAT_FILTERED_RX_DATA_PIN_TRANSITION_L2H	(1 << 14)
+#define TEGRA_CEC_INT_STAT_TX_REGISTER_EMPTY			BIT(0)
+#define TEGRA_CEC_INT_STAT_TX_REGISTER_UNDERRUN			BIT(1)
+#define TEGRA_CEC_INT_STAT_TX_FRAME_OR_BLOCK_NAKD		BIT(2)
+#define TEGRA_CEC_INT_STAT_TX_ARBITRATION_FAILED		BIT(3)
+#define TEGRA_CEC_INT_STAT_TX_BUS_ANOMALY_DETECTED		BIT(4)
+#define TEGRA_CEC_INT_STAT_TX_FRAME_TRANSMITTED			BIT(5)
+#define TEGRA_CEC_INT_STAT_RX_REGISTER_FULL			BIT(8)
+#define TEGRA_CEC_INT_STAT_RX_REGISTER_OVERRUN			BIT(9)
+#define TEGRA_CEC_INT_STAT_RX_START_BIT_DETECTED		BIT(10)
+#define TEGRA_CEC_INT_STAT_RX_BUS_ANOMALY_DETECTED		BIT(11)
+#define TEGRA_CEC_INT_STAT_RX_BUS_ERROR_DETECTED		BIT(12)
+#define TEGRA_CEC_INT_STAT_FILTERED_RX_DATA_PIN_TRANSITION_H2L	BIT(13)
+#define TEGRA_CEC_INT_STAT_FILTERED_RX_DATA_PIN_TRANSITION_L2H	BIT(14)
 
-#define TEGRA_CEC_INT_MASK_TX_REGISTER_EMPTY			(1 << 0)
-#define TEGRA_CEC_INT_MASK_TX_REGISTER_UNDERRUN			(1 << 1)
-#define TEGRA_CEC_INT_MASK_TX_FRAME_OR_BLOCK_NAKD		(1 << 2)
-#define TEGRA_CEC_INT_MASK_TX_ARBITRATION_FAILED		(1 << 3)
-#define TEGRA_CEC_INT_MASK_TX_BUS_ANOMALY_DETECTED		(1 << 4)
-#define TEGRA_CEC_INT_MASK_TX_FRAME_TRANSMITTED			(1 << 5)
-#define TEGRA_CEC_INT_MASK_RX_REGISTER_FULL			(1 << 8)
-#define TEGRA_CEC_INT_MASK_RX_REGISTER_OVERRUN			(1 << 9)
-#define TEGRA_CEC_INT_MASK_RX_START_BIT_DETECTED		(1 << 10)
-#define TEGRA_CEC_INT_MASK_RX_BUS_ANOMALY_DETECTED		(1 << 11)
-#define TEGRA_CEC_INT_MASK_RX_BUS_ERROR_DETECTED		(1 << 12)
-#define TEGRA_CEC_INT_MASK_FILTERED_RX_DATA_PIN_TRANSITION_H2L	(1 << 13)
-#define TEGRA_CEC_INT_MASK_FILTERED_RX_DATA_PIN_TRANSITION_L2H	(1 << 14)
+#define TEGRA_CEC_INT_MASK_TX_REGISTER_EMPTY			BIT(0)
+#define TEGRA_CEC_INT_MASK_TX_REGISTER_UNDERRUN			BIT(1)
+#define TEGRA_CEC_INT_MASK_TX_FRAME_OR_BLOCK_NAKD		BIT(2)
+#define TEGRA_CEC_INT_MASK_TX_ARBITRATION_FAILED		BIT(3)
+#define TEGRA_CEC_INT_MASK_TX_BUS_ANOMALY_DETECTED		BIT(4)
+#define TEGRA_CEC_INT_MASK_TX_FRAME_TRANSMITTED			BIT(5)
+#define TEGRA_CEC_INT_MASK_RX_REGISTER_FULL			BIT(8)
+#define TEGRA_CEC_INT_MASK_RX_REGISTER_OVERRUN			BIT(9)
+#define TEGRA_CEC_INT_MASK_RX_START_BIT_DETECTED		BIT(10)
+#define TEGRA_CEC_INT_MASK_RX_BUS_ANOMALY_DETECTED		BIT(11)
+#define TEGRA_CEC_INT_MASK_RX_BUS_ERROR_DETECTED		BIT(12)
+#define TEGRA_CEC_INT_MASK_FILTERED_RX_DATA_PIN_TRANSITION_H2L	BIT(13)
+#define TEGRA_CEC_INT_MASK_FILTERED_RX_DATA_PIN_TRANSITION_L2H	BIT(14)
 
 #define TEGRA_CEC_HW_DEBUG_TX_DURATION_COUNT_SHIFT		0
 #define TEGRA_CEC_HW_DEBUG_TX_TXBIT_COUNT_SHIFT			17
 #define TEGRA_CEC_HW_DEBUG_TX_STATE_SHIFT			21
-#define TEGRA_CEC_HW_DEBUG_TX_FORCELOOUT			(1 << 25)
-#define TEGRA_CEC_HW_DEBUG_TX_TXDATABIT_SAMPLE_TIMER		(1 << 26)
+#define TEGRA_CEC_HW_DEBUG_TX_FORCELOOUT			BIT(25)
+#define TEGRA_CEC_HW_DEBUG_TX_TXDATABIT_SAMPLE_TIMER		BIT(26)
 
 #endif /* TEGRA_CEC_H */
diff --git a/drivers/media/platform/ti-vpe/vpe_regs.h b/drivers/media/platform/ti-vpe/vpe_regs.h
index 9969bea0dded..1a1ad5ae1228 100644
--- a/drivers/media/platform/ti-vpe/vpe_regs.h
+++ b/drivers/media/platform/ti-vpe/vpe_regs.h
@@ -48,24 +48,24 @@
 #define VPE_INT0_ENABLE0_SET		0x0030
 #define VPE_INT0_ENABLE0		VPE_INT0_ENABLE0_SET
 #define VPE_INT0_ENABLE0_CLR		0x0038
-#define VPE_INT0_LIST0_COMPLETE		(1 << 0)
-#define VPE_INT0_LIST0_NOTIFY		(1 << 1)
-#define VPE_INT0_LIST1_COMPLETE		(1 << 2)
-#define VPE_INT0_LIST1_NOTIFY		(1 << 3)
-#define VPE_INT0_LIST2_COMPLETE		(1 << 4)
-#define VPE_INT0_LIST2_NOTIFY		(1 << 5)
-#define VPE_INT0_LIST3_COMPLETE		(1 << 6)
-#define VPE_INT0_LIST3_NOTIFY		(1 << 7)
-#define VPE_INT0_LIST4_COMPLETE		(1 << 8)
-#define VPE_INT0_LIST4_NOTIFY		(1 << 9)
-#define VPE_INT0_LIST5_COMPLETE		(1 << 10)
-#define VPE_INT0_LIST5_NOTIFY		(1 << 11)
-#define VPE_INT0_LIST6_COMPLETE		(1 << 12)
-#define VPE_INT0_LIST6_NOTIFY		(1 << 13)
-#define VPE_INT0_LIST7_COMPLETE		(1 << 14)
-#define VPE_INT0_LIST7_NOTIFY		(1 << 15)
-#define VPE_INT0_DESCRIPTOR		(1 << 16)
-#define VPE_DEI_FMD_INT			(1 << 18)
+#define VPE_INT0_LIST0_COMPLETE		BIT(0)
+#define VPE_INT0_LIST0_NOTIFY		BIT(1)
+#define VPE_INT0_LIST1_COMPLETE		BIT(2)
+#define VPE_INT0_LIST1_NOTIFY		BIT(3)
+#define VPE_INT0_LIST2_COMPLETE		BIT(4)
+#define VPE_INT0_LIST2_NOTIFY		BIT(5)
+#define VPE_INT0_LIST3_COMPLETE		BIT(6)
+#define VPE_INT0_LIST3_NOTIFY		BIT(7)
+#define VPE_INT0_LIST4_COMPLETE		BIT(8)
+#define VPE_INT0_LIST4_NOTIFY		BIT(9)
+#define VPE_INT0_LIST5_COMPLETE		BIT(10)
+#define VPE_INT0_LIST5_NOTIFY		BIT(11)
+#define VPE_INT0_LIST6_COMPLETE		BIT(12)
+#define VPE_INT0_LIST6_NOTIFY		BIT(13)
+#define VPE_INT0_LIST7_COMPLETE		BIT(14)
+#define VPE_INT0_LIST7_NOTIFY		BIT(15)
+#define VPE_INT0_DESCRIPTOR		BIT(16)
+#define VPE_DEI_FMD_INT			BIT(18)
 
 #define VPE_INT0_STATUS1_RAW_SET	0x0024
 #define VPE_INT0_STATUS1_RAW		VPE_INT0_STATUS1_RAW_SET
@@ -74,21 +74,21 @@
 #define VPE_INT0_ENABLE1_SET		0x0034
 #define VPE_INT0_ENABLE1		VPE_INT0_ENABLE1_SET
 #define VPE_INT0_ENABLE1_CLR		0x003c
-#define VPE_INT0_CHANNEL_GROUP0		(1 << 0)
-#define VPE_INT0_CHANNEL_GROUP1		(1 << 1)
-#define VPE_INT0_CHANNEL_GROUP2		(1 << 2)
-#define VPE_INT0_CHANNEL_GROUP3		(1 << 3)
-#define VPE_INT0_CHANNEL_GROUP4		(1 << 4)
-#define VPE_INT0_CHANNEL_GROUP5		(1 << 5)
-#define VPE_INT0_CLIENT			(1 << 7)
-#define VPE_DEI_ERROR_INT		(1 << 16)
-#define VPE_DS1_UV_ERROR_INT		(1 << 22)
+#define VPE_INT0_CHANNEL_GROUP0		BIT(0)
+#define VPE_INT0_CHANNEL_GROUP1		BIT(1)
+#define VPE_INT0_CHANNEL_GROUP2		BIT(2)
+#define VPE_INT0_CHANNEL_GROUP3		BIT(3)
+#define VPE_INT0_CHANNEL_GROUP4		BIT(4)
+#define VPE_INT0_CHANNEL_GROUP5		BIT(5)
+#define VPE_INT0_CLIENT			BIT(7)
+#define VPE_DEI_ERROR_INT		BIT(16)
+#define VPE_DS1_UV_ERROR_INT		BIT(22)
 
 #define VPE_INTC_EOI			0x00a0
 
 #define VPE_CLK_ENABLE			0x0100
-#define VPE_VPEDMA_CLK_ENABLE		(1 << 0)
-#define VPE_DATA_PATH_CLK_ENABLE	(1 << 1)
+#define VPE_VPEDMA_CLK_ENABLE		BIT(0)
+#define VPE_DATA_PATH_CLK_ENABLE	BIT(1)
 
 #define VPE_CLK_RESET			0x0104
 #define VPE_VPDMA_CLK_RESET_MASK	0x1
@@ -101,11 +101,11 @@
 #define VPE_CLK_FORMAT_SELECT		0x010c
 #define VPE_CSC_SRC_SELECT_MASK		0x03
 #define VPE_CSC_SRC_SELECT_SHIFT	0
-#define VPE_RGB_OUT_SELECT		(1 << 8)
+#define VPE_RGB_OUT_SELECT		BIT(8)
 #define VPE_DS_SRC_SELECT_MASK		0x07
 #define VPE_DS_SRC_SELECT_SHIFT		9
-#define VPE_DS_BYPASS			(1 << 16)
-#define VPE_COLOR_SEPARATE_422		(1 << 18)
+#define VPE_DS_BYPASS			BIT(16)
+#define VPE_COLOR_SEPARATE_422		BIT(18)
 
 #define VPE_DS_SRC_DEI_SCALER		(5 << VPE_DS_SRC_SELECT_SHIFT)
 #define VPE_CSC_SRC_DEI_SCALER		(3 << VPE_CSC_SRC_SELECT_SHIFT)
@@ -115,8 +115,8 @@
 #define VPE_RANGE_RANGE_MAP_Y_SHIFT	0
 #define VPE_RANGE_RANGE_MAP_UV_MASK	0x07
 #define VPE_RANGE_RANGE_MAP_UV_SHIFT	3
-#define VPE_RANGE_MAP_ON		(1 << 6)
-#define VPE_RANGE_REDUCTION_ON		(1 << 28)
+#define VPE_RANGE_MAP_ON		BIT(6)
+#define VPE_RANGE_REDUCTION_ON		BIT(28)
 
 /* VPE chrominance upsampler regs */
 #define VPE_US1_R0			0x0304
@@ -195,13 +195,13 @@
 #define VPE_DEI_WIDTH_SHIFT		0
 #define VPE_DEI_HEIGHT_MASK		0x07ff
 #define VPE_DEI_HEIGHT_SHIFT		16
-#define VPE_DEI_INTERLACE_BYPASS	(1 << 29)
-#define VPE_DEI_FIELD_FLUSH		(1 << 30)
-#define VPE_DEI_PROGRESSIVE		(1 << 31)
+#define VPE_DEI_INTERLACE_BYPASS	BIT(29)
+#define VPE_DEI_FIELD_FLUSH		BIT(30)
+#define VPE_DEI_PROGRESSIVE		BIT(31)
 
 #define VPE_MDT_BYPASS			0x0604
-#define VPE_MDT_TEMPMAX_BYPASS		(1 << 0)
-#define VPE_MDT_SPATMAX_BYPASS		(1 << 1)
+#define VPE_MDT_TEMPMAX_BYPASS		BIT(0)
+#define VPE_MDT_SPATMAX_BYPASS		BIT(1)
 
 #define VPE_MDT_SF_THRESHOLD		0x0608
 #define VPE_MDT_SF_SC_THR1_MASK		0xff
@@ -214,8 +214,8 @@
 #define VPE_EDI_CONFIG			0x060c
 #define VPE_EDI_INP_MODE_MASK		0x03
 #define VPE_EDI_INP_MODE_SHIFT		0
-#define VPE_EDI_ENABLE_3D		(1 << 2)
-#define VPE_EDI_ENABLE_CHROMA_3D	(1 << 3)
+#define VPE_EDI_ENABLE_3D		BIT(2)
+#define VPE_EDI_ENABLE_CHROMA_3D	BIT(3)
 #define VPE_EDI_CHROMA3D_COR_THR_MASK	0xff
 #define VPE_EDI_CHROMA3D_COR_THR_SHIFT	8
 #define VPE_EDI_DIR_COR_LOWER_THR_MASK	0xff
@@ -268,7 +268,7 @@
 #define VPE_FMD_WINDOW_MINX_SHIFT	0
 #define VPE_FMD_WINDOW_MAXX_MASK	0x07ff
 #define VPE_FMD_WINDOW_MAXX_SHIFT	16
-#define VPE_FMD_WINDOW_ENABLE		(1 << 31)
+#define VPE_FMD_WINDOW_ENABLE		BIT(31)
 
 #define VPE_DEI_FMD_WINDOW_R1		0x0624
 #define VPE_FMD_WINDOW_MINY_MASK	0x07ff
@@ -277,10 +277,10 @@
 #define VPE_FMD_WINDOW_MAXY_SHIFT	16
 
 #define VPE_DEI_FMD_CONTROL_R0		0x0628
-#define VPE_FMD_ENABLE			(1 << 0)
-#define VPE_FMD_LOCK			(1 << 1)
-#define VPE_FMD_JAM_DIR			(1 << 2)
-#define VPE_FMD_BED_ENABLE		(1 << 3)
+#define VPE_FMD_ENABLE			BIT(0)
+#define VPE_FMD_LOCK			BIT(1)
+#define VPE_FMD_JAM_DIR			BIT(2)
+#define VPE_FMD_BED_ENABLE		BIT(3)
 #define VPE_FMD_CAF_FIELD_THR_MASK	0xff
 #define VPE_FMD_CAF_FIELD_THR_SHIFT	16
 #define VPE_FMD_CAF_LINE_THR_MASK	0xff
@@ -293,7 +293,7 @@
 #define VPE_DEI_FMD_STATUS_R0		0x0630
 #define VPE_FMD_CAF_MASK		0x000fffff
 #define VPE_FMD_CAF_SHIFT		0
-#define VPE_FMD_RESET			(1 << 24)
+#define VPE_FMD_RESET			BIT(24)
 
 #define VPE_DEI_FMD_STATUS_R1		0x0634
 #define VPE_FMD_FIELD_DIFF_MASK		0x0fffffff
diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
index 1bb1d39c60d9..5c67ff92d97a 100644
--- a/drivers/media/platform/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/vsp1/vsp1_regs.h
@@ -15,8 +15,8 @@
  */
 
 #define VI6_CMD(n)			(0x0000 + (n) * 4)
-#define VI6_CMD_UPDHDR			(1 << 4)
-#define VI6_CMD_STRCMD			(1 << 0)
+#define VI6_CMD_UPDHDR			BIT(4)
+#define VI6_CMD_STRCMD			BIT(0)
 
 #define VI6_CLK_DCSWT			0x0018
 #define VI6_CLK_DCSWT_CSTPW_MASK	(0xff << 8)
@@ -25,29 +25,29 @@
 #define VI6_CLK_DCSWT_CSTRW_SHIFT	0
 
 #define VI6_SRESET			0x0028
-#define VI6_SRESET_SRTS(n)		(1 << (n))
+#define VI6_SRESET_SRTS(n)		BIT(n)
 
 #define VI6_STATUS			0x0038
-#define VI6_STATUS_FLD_STD(n)		(1 << ((n) + 28))
-#define VI6_STATUS_SYS_ACT(n)		(1 << ((n) + 8))
+#define VI6_STATUS_FLD_STD(n)		BIT((n) + 28)
+#define VI6_STATUS_SYS_ACT(n)		BIT((n) + 8)
 
 #define VI6_WPF_IRQ_ENB(n)		(0x0048 + (n) * 12)
-#define VI6_WFP_IRQ_ENB_DFEE		(1 << 1)
-#define VI6_WFP_IRQ_ENB_FREE		(1 << 0)
+#define VI6_WFP_IRQ_ENB_DFEE		BIT(1)
+#define VI6_WFP_IRQ_ENB_FREE		BIT(0)
 
 #define VI6_WPF_IRQ_STA(n)		(0x004c + (n) * 12)
-#define VI6_WFP_IRQ_STA_DFE		(1 << 1)
-#define VI6_WFP_IRQ_STA_FRE		(1 << 0)
+#define VI6_WFP_IRQ_STA_DFE		BIT(1)
+#define VI6_WFP_IRQ_STA_FRE		BIT(0)
 
 #define VI6_DISP_IRQ_ENB(n)		(0x0078 + (n) * 60)
-#define VI6_DISP_IRQ_ENB_DSTE		(1 << 8)
-#define VI6_DISP_IRQ_ENB_MAEE		(1 << 5)
-#define VI6_DISP_IRQ_ENB_LNEE(n)	(1 << (n))
+#define VI6_DISP_IRQ_ENB_DSTE		BIT(8)
+#define VI6_DISP_IRQ_ENB_MAEE		BIT(5)
+#define VI6_DISP_IRQ_ENB_LNEE(n)	BIT(n)
 
 #define VI6_DISP_IRQ_STA(n)		(0x007c + (n) * 60)
-#define VI6_DISP_IRQ_STA_DST		(1 << 8)
-#define VI6_DISP_IRQ_STA_MAE		(1 << 5)
-#define VI6_DISP_IRQ_STA_LNE(n)		(1 << (n))
+#define VI6_DISP_IRQ_STA_DST		BIT(8)
+#define VI6_DISP_IRQ_STA_MAE		BIT(5)
+#define VI6_DISP_IRQ_STA_LNE(n)		BIT(n)
 
 #define VI6_WPF_LINE_COUNT(n)		(0x0084 + (n) * 4)
 #define VI6_WPF_LINE_COUNT_MASK		(0x1fffff << 0)
@@ -59,32 +59,32 @@
 #define VI6_DL_CTRL			0x0100
 #define VI6_DL_CTRL_AR_WAIT_MASK	(0xffff << 16)
 #define VI6_DL_CTRL_AR_WAIT_SHIFT	16
-#define VI6_DL_CTRL_DC2			(1 << 12)
-#define VI6_DL_CTRL_DC1			(1 << 8)
-#define VI6_DL_CTRL_DC0			(1 << 4)
-#define VI6_DL_CTRL_CFM0		(1 << 2)
-#define VI6_DL_CTRL_NH0			(1 << 1)
-#define VI6_DL_CTRL_DLE			(1 << 0)
+#define VI6_DL_CTRL_DC2			BIT(12)
+#define VI6_DL_CTRL_DC1			BIT(8)
+#define VI6_DL_CTRL_DC0			BIT(4)
+#define VI6_DL_CTRL_CFM0		BIT(2)
+#define VI6_DL_CTRL_NH0			BIT(1)
+#define VI6_DL_CTRL_DLE			BIT(0)
 
 #define VI6_DL_HDR_ADDR(n)		(0x0104 + (n) * 4)
 
 #define VI6_DL_SWAP			0x0114
-#define VI6_DL_SWAP_LWS			(1 << 2)
-#define VI6_DL_SWAP_WDS			(1 << 1)
-#define VI6_DL_SWAP_BTS			(1 << 0)
+#define VI6_DL_SWAP_LWS			BIT(2)
+#define VI6_DL_SWAP_WDS			BIT(1)
+#define VI6_DL_SWAP_BTS			BIT(0)
 
 #define VI6_DL_EXT_CTRL(n)		(0x011c + (n) * 36)
-#define VI6_DL_EXT_CTRL_NWE		(1 << 16)
+#define VI6_DL_EXT_CTRL_NWE		BIT(16)
 #define VI6_DL_EXT_CTRL_POLINT_MASK	(0x3f << 8)
 #define VI6_DL_EXT_CTRL_POLINT_SHIFT	8
-#define VI6_DL_EXT_CTRL_DLPRI		(1 << 5)
-#define VI6_DL_EXT_CTRL_EXPRI		(1 << 4)
-#define VI6_DL_EXT_CTRL_EXT		(1 << 0)
+#define VI6_DL_EXT_CTRL_DLPRI		BIT(5)
+#define VI6_DL_EXT_CTRL_EXPRI		BIT(4)
+#define VI6_DL_EXT_CTRL_EXT		BIT(0)
 
 #define VI6_DL_EXT_AUTOFLD_INT		BIT(0)
 
 #define VI6_DL_BODY_SIZE		0x0120
-#define VI6_DL_BODY_SIZE_UPD		(1 << 24)
+#define VI6_DL_BODY_SIZE_UPD		BIT(24)
 #define VI6_DL_BODY_SIZE_BS_MASK	(0x1ffff << 0)
 #define VI6_DL_BODY_SIZE_BS_SHIFT	0
 
@@ -107,10 +107,10 @@
 #define VI6_RPF_SRC_ESIZE_EVSIZE_SHIFT	0
 
 #define VI6_RPF_INFMT			0x0308
-#define VI6_RPF_INFMT_VIR		(1 << 28)
-#define VI6_RPF_INFMT_CIPM		(1 << 16)
-#define VI6_RPF_INFMT_SPYCS		(1 << 15)
-#define VI6_RPF_INFMT_SPUVS		(1 << 14)
+#define VI6_RPF_INFMT_VIR		BIT(28)
+#define VI6_RPF_INFMT_CIPM		BIT(16)
+#define VI6_RPF_INFMT_SPYCS		BIT(15)
+#define VI6_RPF_INFMT_SPUVS		BIT(14)
 #define VI6_RPF_INFMT_CEXT_ZERO		(0 << 12)
 #define VI6_RPF_INFMT_CEXT_EXT		(1 << 12)
 #define VI6_RPF_INFMT_CEXT_ONE		(2 << 12)
@@ -120,19 +120,19 @@
 #define VI6_RPF_INFMT_RDTM_BT709	(2 << 9)
 #define VI6_RPF_INFMT_RDTM_BT709_EXT	(3 << 9)
 #define VI6_RPF_INFMT_RDTM_MASK		(7 << 9)
-#define VI6_RPF_INFMT_CSC		(1 << 8)
+#define VI6_RPF_INFMT_CSC		BIT(8)
 #define VI6_RPF_INFMT_RDFMT_MASK	(0x7f << 0)
 #define VI6_RPF_INFMT_RDFMT_SHIFT	0
 
 #define VI6_RPF_DSWAP			0x030c
-#define VI6_RPF_DSWAP_A_LLS		(1 << 11)
-#define VI6_RPF_DSWAP_A_LWS		(1 << 10)
-#define VI6_RPF_DSWAP_A_WDS		(1 << 9)
-#define VI6_RPF_DSWAP_A_BTS		(1 << 8)
-#define VI6_RPF_DSWAP_P_LLS		(1 << 3)
-#define VI6_RPF_DSWAP_P_LWS		(1 << 2)
-#define VI6_RPF_DSWAP_P_WDS		(1 << 1)
-#define VI6_RPF_DSWAP_P_BTS		(1 << 0)
+#define VI6_RPF_DSWAP_A_LLS		BIT(11)
+#define VI6_RPF_DSWAP_A_LWS		BIT(10)
+#define VI6_RPF_DSWAP_A_WDS		BIT(9)
+#define VI6_RPF_DSWAP_A_BTS		BIT(8)
+#define VI6_RPF_DSWAP_P_LLS		BIT(3)
+#define VI6_RPF_DSWAP_P_LWS		BIT(2)
+#define VI6_RPF_DSWAP_P_WDS		BIT(1)
+#define VI6_RPF_DSWAP_P_BTS		BIT(0)
 
 #define VI6_RPF_LOC			0x0310
 #define VI6_RPF_LOC_HCOORD_MASK		(0x1fff << 16)
@@ -150,7 +150,7 @@
 #define VI6_RPF_ALPH_SEL_ASEL_SHIFT	28
 #define VI6_RPF_ALPH_SEL_IROP_MASK	(0xf << 24)
 #define VI6_RPF_ALPH_SEL_IROP_SHIFT	24
-#define VI6_RPF_ALPH_SEL_BSEL		(1 << 23)
+#define VI6_RPF_ALPH_SEL_BSEL		BIT(23)
 #define VI6_RPF_ALPH_SEL_AEXT_ZERO	(0 << 18)
 #define VI6_RPF_ALPH_SEL_AEXT_EXT	(1 << 18)
 #define VI6_RPF_ALPH_SEL_AEXT_ONE	(2 << 18)
@@ -171,7 +171,7 @@
 #define VI6_RPF_VRTCOL_SET_LAYB_SHIFT	0
 
 #define VI6_RPF_MSK_CTRL		0x031c
-#define VI6_RPF_MSK_CTRL_MSK_EN		(1 << 24)
+#define VI6_RPF_MSK_CTRL_MSK_EN		BIT(24)
 #define VI6_RPF_MSK_CTRL_MGR_MASK	(0xff << 16)
 #define VI6_RPF_MSK_CTRL_MGR_SHIFT	16
 #define VI6_RPF_MSK_CTRL_MGG_MASK	(0xff << 8)
@@ -191,9 +191,9 @@
 #define VI6_RPF_MSK_SET_MSB_SHIFT	0
 
 #define VI6_RPF_CKEY_CTRL		0x0328
-#define VI6_RPF_CKEY_CTRL_CV		(1 << 4)
-#define VI6_RPF_CKEY_CTRL_SAPE1		(1 << 1)
-#define VI6_RPF_CKEY_CTRL_SAPE0		(1 << 0)
+#define VI6_RPF_CKEY_CTRL_CV		BIT(4)
+#define VI6_RPF_CKEY_CTRL_SAPE1		BIT(1)
+#define VI6_RPF_CKEY_CTRL_SAPE0		BIT(0)
 
 #define VI6_RPF_CKEY_SET0		0x032c
 #define VI6_RPF_CKEY_SET1		0x0330
@@ -250,7 +250,7 @@
 
 #define VI6_WPF_HSZCLIP			0x1004
 #define VI6_WPF_VSZCLIP			0x1008
-#define VI6_WPF_SZCLIP_EN		(1 << 28)
+#define VI6_WPF_SZCLIP_EN		BIT(28)
 #define VI6_WPF_SZCLIP_OFST_MASK	(0xff << 16)
 #define VI6_WPF_SZCLIP_OFST_SHIFT	16
 #define VI6_WPF_SZCLIP_SIZE_MASK	(0xfff << 0)
@@ -259,12 +259,12 @@
 #define VI6_WPF_OUTFMT			0x100c
 #define VI6_WPF_OUTFMT_PDV_MASK		(0xff << 24)
 #define VI6_WPF_OUTFMT_PDV_SHIFT	24
-#define VI6_WPF_OUTFMT_PXA		(1 << 23)
-#define VI6_WPF_OUTFMT_ROT		(1 << 18)
-#define VI6_WPF_OUTFMT_HFLP		(1 << 17)
-#define VI6_WPF_OUTFMT_FLP		(1 << 16)
-#define VI6_WPF_OUTFMT_SPYCS		(1 << 15)
-#define VI6_WPF_OUTFMT_SPUVS		(1 << 14)
+#define VI6_WPF_OUTFMT_PXA		BIT(23)
+#define VI6_WPF_OUTFMT_ROT		BIT(18)
+#define VI6_WPF_OUTFMT_HFLP		BIT(17)
+#define VI6_WPF_OUTFMT_FLP		BIT(16)
+#define VI6_WPF_OUTFMT_SPYCS		BIT(15)
+#define VI6_WPF_OUTFMT_SPUVS		BIT(14)
 #define VI6_WPF_OUTFMT_DITH_DIS		(0 << 12)
 #define VI6_WPF_OUTFMT_DITH_EN		(3 << 12)
 #define VI6_WPF_OUTFMT_DITH_MASK	(3 << 12)
@@ -273,18 +273,18 @@
 #define VI6_WPF_OUTFMT_WRTM_BT709	(2 << 9)
 #define VI6_WPF_OUTFMT_WRTM_BT709_EXT	(3 << 9)
 #define VI6_WPF_OUTFMT_WRTM_MASK	(7 << 9)
-#define VI6_WPF_OUTFMT_CSC		(1 << 8)
+#define VI6_WPF_OUTFMT_CSC		BIT(8)
 #define VI6_WPF_OUTFMT_WRFMT_MASK	(0x7f << 0)
 #define VI6_WPF_OUTFMT_WRFMT_SHIFT	0
 
 #define VI6_WPF_DSWAP			0x1010
-#define VI6_WPF_DSWAP_P_LLS		(1 << 3)
-#define VI6_WPF_DSWAP_P_LWS		(1 << 2)
-#define VI6_WPF_DSWAP_P_WDS		(1 << 1)
-#define VI6_WPF_DSWAP_P_BTS		(1 << 0)
+#define VI6_WPF_DSWAP_P_LLS		BIT(3)
+#define VI6_WPF_DSWAP_P_LWS		BIT(2)
+#define VI6_WPF_DSWAP_P_WDS		BIT(1)
+#define VI6_WPF_DSWAP_P_BTS		BIT(0)
 
 #define VI6_WPF_RNDCTRL			0x1014
-#define VI6_WPF_RNDCTRL_CBRM		(1 << 28)
+#define VI6_WPF_RNDCTRL_CBRM		BIT(28)
 #define VI6_WPF_RNDCTRL_ABRM_TRUNC	(0 << 24)
 #define VI6_WPF_RNDCTRL_ABRM_ROUND	(1 << 24)
 #define VI6_WPF_RNDCTRL_ABRM_THRESH	(2 << 24)
@@ -297,7 +297,7 @@
 #define VI6_WPF_RNDCTRL_CLMD_MASK	(3 << 12)
 
 #define VI6_WPF_ROT_CTRL		0x1018
-#define VI6_WPF_ROT_CTRL_LN16		(1 << 17)
+#define VI6_WPF_ROT_CTRL_LN16		BIT(17)
 #define VI6_WPF_ROT_CTRL_LMEM_WD_MASK	(0x1fff << 0)
 #define VI6_WPF_ROT_CTRL_LMEM_WD_SHIFT	0
 
@@ -308,7 +308,7 @@
 #define VI6_WPF_DSTM_ADDR_C1		0x102c
 
 #define VI6_WPF_WRBCK_CTRL(n)		(0x1034 + (n) * 0x100)
-#define VI6_WPF_WRBCK_CTRL_WBMD		(1 << 0)
+#define VI6_WPF_WRBCK_CTRL_WBMD		BIT(0)
 
 /* -----------------------------------------------------------------------------
  * UIF Control Registers
@@ -317,20 +317,20 @@
 #define VI6_UIF_OFFSET			0x100
 
 #define VI6_UIF_DISCOM_DOCMCR		0x1c00
-#define VI6_UIF_DISCOM_DOCMCR_CMPRU	(1 << 16)
-#define VI6_UIF_DISCOM_DOCMCR_CMPR	(1 << 0)
+#define VI6_UIF_DISCOM_DOCMCR_CMPRU	BIT(16)
+#define VI6_UIF_DISCOM_DOCMCR_CMPR	BIT(0)
 
 #define VI6_UIF_DISCOM_DOCMSTR		0x1c04
-#define VI6_UIF_DISCOM_DOCMSTR_CMPPRE	(1 << 1)
-#define VI6_UIF_DISCOM_DOCMSTR_CMPST	(1 << 0)
+#define VI6_UIF_DISCOM_DOCMSTR_CMPPRE	BIT(1)
+#define VI6_UIF_DISCOM_DOCMSTR_CMPST	BIT(0)
 
 #define VI6_UIF_DISCOM_DOCMCLSTR	0x1c08
-#define VI6_UIF_DISCOM_DOCMCLSTR_CMPCLPRE	(1 << 1)
-#define VI6_UIF_DISCOM_DOCMCLSTR_CMPCLST	(1 << 0)
+#define VI6_UIF_DISCOM_DOCMCLSTR_CMPCLPRE	BIT(1)
+#define VI6_UIF_DISCOM_DOCMCLSTR_CMPCLST	BIT(0)
 
 #define VI6_UIF_DISCOM_DOCMIENR		0x1c0c
-#define VI6_UIF_DISCOM_DOCMIENR_CMPPREIEN	(1 << 1)
-#define VI6_UIF_DISCOM_DOCMIENR_CMPIEN		(1 << 0)
+#define VI6_UIF_DISCOM_DOCMIENR_CMPPREIEN	BIT(1)
+#define VI6_UIF_DISCOM_DOCMIENR_CMPIEN		BIT(0)
 
 #define VI6_UIF_DISCOM_DOCMMDR		0x1c10
 #define VI6_UIF_DISCOM_DOCMMDR_INTHRH(n)	((n) << 16)
@@ -338,7 +338,7 @@
 #define VI6_UIF_DISCOM_DOCMPMR		0x1c14
 #define VI6_UIF_DISCOM_DOCMPMR_CMPDFF(n)	((n) << 17)
 #define VI6_UIF_DISCOM_DOCMPMR_CMPDFA(n)	((n) << 8)
-#define VI6_UIF_DISCOM_DOCMPMR_CMPDAUF		(1 << 7)
+#define VI6_UIF_DISCOM_DOCMPMR_CMPDAUF		BIT(7)
 #define VI6_UIF_DISCOM_DOCMPMR_SEL(n)		((n) << 0)
 
 #define VI6_UIF_DISCOM_DOCMECRCR	0x1c18
@@ -365,7 +365,7 @@
 #define VI6_DPR_HSI_ROUTE		0x2048
 #define VI6_DPR_BRU_ROUTE		0x204c
 #define VI6_DPR_ILV_BRS_ROUTE		0x2050
-#define VI6_DPR_ROUTE_BRSSEL		(1 << 28)
+#define VI6_DPR_ROUTE_BRSSEL		BIT(28)
 #define VI6_DPR_ROUTE_FXA_MASK		(0xff << 16)
 #define VI6_DPR_ROUTE_FXA_SHIFT		16
 #define VI6_DPR_ROUTE_FP_MASK		(0x3f << 8)
@@ -407,10 +407,10 @@
 #define VI6_SRU_CTRL0_PARAM1_MASK	(0x1f << 8)
 #define VI6_SRU_CTRL0_PARAM1_SHIFT	8
 #define VI6_SRU_CTRL0_MODE_UPSCALE	(4 << 4)
-#define VI6_SRU_CTRL0_PARAM2		(1 << 3)
-#define VI6_SRU_CTRL0_PARAM3		(1 << 2)
-#define VI6_SRU_CTRL0_PARAM4		(1 << 1)
-#define VI6_SRU_CTRL0_EN		(1 << 0)
+#define VI6_SRU_CTRL0_PARAM2		BIT(3)
+#define VI6_SRU_CTRL0_PARAM3		BIT(2)
+#define VI6_SRU_CTRL0_PARAM4		BIT(1)
+#define VI6_SRU_CTRL0_EN		BIT(0)
 
 #define VI6_SRU_CTRL1			0x2204
 #define VI6_SRU_CTRL1_PARAM5		0x7ff
@@ -427,18 +427,18 @@
 #define VI6_UDS_OFFSET			0x100
 
 #define VI6_UDS_CTRL			0x2300
-#define VI6_UDS_CTRL_AMD		(1 << 30)
-#define VI6_UDS_CTRL_FMD		(1 << 29)
-#define VI6_UDS_CTRL_BLADV		(1 << 28)
-#define VI6_UDS_CTRL_AON		(1 << 25)
-#define VI6_UDS_CTRL_ATHON		(1 << 24)
-#define VI6_UDS_CTRL_BC			(1 << 20)
-#define VI6_UDS_CTRL_NE_A		(1 << 19)
-#define VI6_UDS_CTRL_NE_RCR		(1 << 18)
-#define VI6_UDS_CTRL_NE_GY		(1 << 17)
-#define VI6_UDS_CTRL_NE_BCB		(1 << 16)
-#define VI6_UDS_CTRL_AMDSLH		(1 << 2)
-#define VI6_UDS_CTRL_TDIPC		(1 << 1)
+#define VI6_UDS_CTRL_AMD		BIT(30)
+#define VI6_UDS_CTRL_FMD		BIT(29)
+#define VI6_UDS_CTRL_BLADV		BIT(28)
+#define VI6_UDS_CTRL_AON		BIT(25)
+#define VI6_UDS_CTRL_ATHON		BIT(24)
+#define VI6_UDS_CTRL_BC			BIT(20)
+#define VI6_UDS_CTRL_NE_A		BIT(19)
+#define VI6_UDS_CTRL_NE_RCR		BIT(18)
+#define VI6_UDS_CTRL_NE_GY		BIT(17)
+#define VI6_UDS_CTRL_NE_BCB		BIT(16)
+#define VI6_UDS_CTRL_AMDSLH		BIT(2)
+#define VI6_UDS_CTRL_TDIPC		BIT(1)
 
 #define VI6_UDS_SCALE			0x2304
 #define VI6_UDS_SCALE_HMANT_MASK	(0xf << 28)
@@ -477,12 +477,12 @@
 #define VI6_UDS_HPHASE_HEDP_SHIFT	0
 
 #define VI6_UDS_IPC			0x2318
-#define VI6_UDS_IPC_FIELD		(1 << 27)
+#define VI6_UDS_IPC_FIELD		BIT(27)
 #define VI6_UDS_IPC_VEDP_MASK		(0xfff << 0)
 #define VI6_UDS_IPC_VEDP_SHIFT		0
 
 #define VI6_UDS_HSZCLIP			0x231c
-#define VI6_UDS_HSZCLIP_HCEN		(1 << 28)
+#define VI6_UDS_HSZCLIP_HCEN		BIT(28)
 #define VI6_UDS_HSZCLIP_HCL_OFST_MASK	(0xff << 16)
 #define VI6_UDS_HSZCLIP_HCL_OFST_SHIFT	16
 #define VI6_UDS_HSZCLIP_HCL_SIZE_MASK	(0x1fff << 0)
@@ -507,36 +507,36 @@
  */
 
 #define VI6_LUT_CTRL			0x2800
-#define VI6_LUT_CTRL_EN			(1 << 0)
+#define VI6_LUT_CTRL_EN			BIT(0)
 
 /* -----------------------------------------------------------------------------
  * CLU Control Registers
  */
 
 #define VI6_CLU_CTRL			0x2900
-#define VI6_CLU_CTRL_AAI		(1 << 28)
-#define VI6_CLU_CTRL_MVS		(1 << 24)
+#define VI6_CLU_CTRL_AAI		BIT(28)
+#define VI6_CLU_CTRL_MVS		BIT(24)
 #define VI6_CLU_CTRL_AX1I_2D		(3 << 14)
 #define VI6_CLU_CTRL_AX2I_2D		(1 << 12)
 #define VI6_CLU_CTRL_OS0_2D		(3 << 8)
 #define VI6_CLU_CTRL_OS1_2D		(1 << 6)
 #define VI6_CLU_CTRL_OS2_2D		(3 << 4)
-#define VI6_CLU_CTRL_M2D		(1 << 1)
-#define VI6_CLU_CTRL_EN			(1 << 0)
+#define VI6_CLU_CTRL_M2D		BIT(1)
+#define VI6_CLU_CTRL_EN			BIT(0)
 
 /* -----------------------------------------------------------------------------
  * HST Control Registers
  */
 
 #define VI6_HST_CTRL			0x2a00
-#define VI6_HST_CTRL_EN			(1 << 0)
+#define VI6_HST_CTRL_EN			BIT(0)
 
 /* -----------------------------------------------------------------------------
  * HSI Control Registers
  */
 
 #define VI6_HSI_CTRL			0x2b00
-#define VI6_HSI_CTRL_EN			(1 << 0)
+#define VI6_HSI_CTRL_EN			BIT(0)
 
 /* -----------------------------------------------------------------------------
  * BRS and BRU Control Registers
@@ -563,7 +563,7 @@
 #define VI6_BRS_BASE			0x3900
 
 #define VI6_BRU_INCTRL			0x0000
-#define VI6_BRU_INCTRL_NRM		(1 << 28)
+#define VI6_BRU_INCTRL_NRM		BIT(28)
 #define VI6_BRU_INCTRL_DnON		(1 << (16 + (n)))
 #define VI6_BRU_INCTRL_DITHn_OFF	(0 << ((n) * 4))
 #define VI6_BRU_INCTRL_DITHn_18BPP	(1 << ((n) * 4))
@@ -597,7 +597,7 @@
 #define VI6_BRU_VIRRPF_COL_BCB_SHIFT	0
 
 #define VI6_BRU_CTRL(n)			(0x0010 + (n) * 8 + ((n) <= 3 ? 0 : 4))
-#define VI6_BRU_CTRL_RBC		(1 << 31)
+#define VI6_BRU_CTRL_RBC		BIT(31)
 #define VI6_BRU_CTRL_DSTSEL_BRUIN(n)	(((n) <= 3 ? (n) : (n)+1) << 20)
 #define VI6_BRU_CTRL_DSTSEL_VRPF	(4 << 20)
 #define VI6_BRU_CTRL_DSTSEL_MASK	(7 << 20)
@@ -610,7 +610,7 @@
 #define VI6_BRU_CTRL_AROP_MASK		(0xf << 0)
 
 #define VI6_BRU_BLD(n)			(0x0014 + (n) * 8 + ((n) <= 3 ? 0 : 4))
-#define VI6_BRU_BLD_CBES		(1 << 31)
+#define VI6_BRU_BLD_CBES		BIT(31)
 #define VI6_BRU_BLD_CCMDX_DST_A		(0 << 28)
 #define VI6_BRU_BLD_CCMDX_255_DST_A	(1 << 28)
 #define VI6_BRU_BLD_CCMDX_SRC_A		(2 << 28)
@@ -624,7 +624,7 @@
 #define VI6_BRU_BLD_CCMDY_COEFY		(4 << 24)
 #define VI6_BRU_BLD_CCMDY_MASK		(7 << 24)
 #define VI6_BRU_BLD_CCMDY_SHIFT		24
-#define VI6_BRU_BLD_ABES		(1 << 23)
+#define VI6_BRU_BLD_ABES		BIT(23)
 #define VI6_BRU_BLD_ACMDX_DST_A		(0 << 20)
 #define VI6_BRU_BLD_ACMDX_255_DST_A	(1 << 20)
 #define VI6_BRU_BLD_ACMDX_SRC_A		(2 << 20)
@@ -662,11 +662,11 @@
 #define VI6_HGO_SIZE_HSIZE_SHIFT	16
 #define VI6_HGO_SIZE_VSIZE_SHIFT	0
 #define VI6_HGO_MODE			0x3008
-#define VI6_HGO_MODE_STEP		(1 << 10)
-#define VI6_HGO_MODE_MAXRGB		(1 << 7)
-#define VI6_HGO_MODE_OFSB_R		(1 << 6)
-#define VI6_HGO_MODE_OFSB_G		(1 << 5)
-#define VI6_HGO_MODE_OFSB_B		(1 << 4)
+#define VI6_HGO_MODE_STEP		BIT(10)
+#define VI6_HGO_MODE_MAXRGB		BIT(7)
+#define VI6_HGO_MODE_OFSB_R		BIT(6)
+#define VI6_HGO_MODE_OFSB_G		BIT(5)
+#define VI6_HGO_MODE_OFSB_B		BIT(4)
 #define VI6_HGO_MODE_HRATIO_SHIFT	2
 #define VI6_HGO_MODE_VRATIO_SHIFT	0
 #define VI6_HGO_LB_TH			0x300c
@@ -687,7 +687,7 @@
 #define VI6_HGO_EXT_HIST_ADDR		0x335c
 #define VI6_HGO_EXT_HIST_DATA		0x3360
 #define VI6_HGO_REGRST			0x33fc
-#define VI6_HGO_REGRST_RCLEA		(1 << 0)
+#define VI6_HGO_REGRST_RCLEA		BIT(0)
 
 /* -----------------------------------------------------------------------------
  * HGT Control Registers
@@ -713,7 +713,7 @@
 #define VI6_HGT_SUM			0x3754
 #define VI6_HGT_LB_DET			0x3758
 #define VI6_HGT_REGRST			0x37fc
-#define VI6_HGT_REGRST_RCLEA		(1 << 0)
+#define VI6_HGT_REGRST_RCLEA		BIT(0)
 
 /* -----------------------------------------------------------------------------
  * LIF Control Registers
@@ -724,9 +724,9 @@
 #define VI6_LIF_CTRL			0x3b00
 #define VI6_LIF_CTRL_OBTH_MASK		(0x7ff << 16)
 #define VI6_LIF_CTRL_OBTH_SHIFT		16
-#define VI6_LIF_CTRL_CFMT		(1 << 4)
-#define VI6_LIF_CTRL_REQSEL		(1 << 1)
-#define VI6_LIF_CTRL_LIF_EN		(1 << 0)
+#define VI6_LIF_CTRL_CFMT		BIT(4)
+#define VI6_LIF_CTRL_REQSEL		BIT(1)
+#define VI6_LIF_CTRL_LIF_EN		BIT(0)
 
 #define VI6_LIF_CSBTH			0x3b04
 #define VI6_LIF_CSBTH_HBTH_MASK		(0x7ff << 16)
@@ -735,7 +735,7 @@
 #define VI6_LIF_CSBTH_LBTH_SHIFT	0
 
 #define VI6_LIF_LBA			0x3b0c
-#define VI6_LIF_LBA_LBA0		(1 << 31)
+#define VI6_LIF_LBA_LBA0		BIT(31)
 #define VI6_LIF_LBA_LBA1_MASK		(0xfff << 16)
 #define VI6_LIF_LBA_LBA1_SHIFT		16
 
diff --git a/drivers/media/platform/xilinx/xilinx-vip.h b/drivers/media/platform/xilinx/xilinx-vip.h
index 47da39211ae4..f71e2b650453 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.h
+++ b/drivers/media/platform/xilinx/xilinx-vip.h
@@ -12,6 +12,7 @@
 #ifndef __XILINX_VIP_H__
 #define __XILINX_VIP_H__
 
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <media/v4l2-subdev.h>
 
@@ -35,23 +36,23 @@ struct clk;
 
 /* Xilinx Video IP Control Registers */
 #define XVIP_CTRL_CONTROL			0x0000
-#define XVIP_CTRL_CONTROL_SW_ENABLE		(1 << 0)
-#define XVIP_CTRL_CONTROL_REG_UPDATE		(1 << 1)
-#define XVIP_CTRL_CONTROL_BYPASS		(1 << 4)
-#define XVIP_CTRL_CONTROL_TEST_PATTERN		(1 << 5)
-#define XVIP_CTRL_CONTROL_FRAME_SYNC_RESET	(1 << 30)
-#define XVIP_CTRL_CONTROL_SW_RESET		(1 << 31)
+#define XVIP_CTRL_CONTROL_SW_ENABLE		BIT(0)
+#define XVIP_CTRL_CONTROL_REG_UPDATE		BIT(1)
+#define XVIP_CTRL_CONTROL_BYPASS		BIT(4)
+#define XVIP_CTRL_CONTROL_TEST_PATTERN		BIT(5)
+#define XVIP_CTRL_CONTROL_FRAME_SYNC_RESET	BIT(30)
+#define XVIP_CTRL_CONTROL_SW_RESET		BIT(31)
 #define XVIP_CTRL_STATUS			0x0004
-#define XVIP_CTRL_STATUS_PROC_STARTED		(1 << 0)
-#define XVIP_CTRL_STATUS_EOF			(1 << 1)
+#define XVIP_CTRL_STATUS_PROC_STARTED		BIT(0)
+#define XVIP_CTRL_STATUS_EOF			BIT(1)
 #define XVIP_CTRL_ERROR				0x0008
-#define XVIP_CTRL_ERROR_SLAVE_EOL_EARLY		(1 << 0)
-#define XVIP_CTRL_ERROR_SLAVE_EOL_LATE		(1 << 1)
-#define XVIP_CTRL_ERROR_SLAVE_SOF_EARLY		(1 << 2)
-#define XVIP_CTRL_ERROR_SLAVE_SOF_LATE		(1 << 3)
+#define XVIP_CTRL_ERROR_SLAVE_EOL_EARLY		BIT(0)
+#define XVIP_CTRL_ERROR_SLAVE_EOL_LATE		BIT(1)
+#define XVIP_CTRL_ERROR_SLAVE_SOF_EARLY		BIT(2)
+#define XVIP_CTRL_ERROR_SLAVE_SOF_LATE		BIT(3)
 #define XVIP_CTRL_IRQ_ENABLE			0x000c
-#define XVIP_CTRL_IRQ_ENABLE_PROC_STARTED	(1 << 0)
-#define XVIP_CTRL_IRQ_EOF			(1 << 1)
+#define XVIP_CTRL_IRQ_ENABLE_PROC_STARTED	BIT(0)
+#define XVIP_CTRL_IRQ_EOF			BIT(1)
 #define XVIP_CTRL_VERSION			0x0010
 #define XVIP_CTRL_VERSION_MAJOR_MASK		(0xff << 24)
 #define XVIP_CTRL_VERSION_MAJOR_SHIFT		24
diff --git a/drivers/media/radio/wl128x/fmdrv_common.h b/drivers/media/radio/wl128x/fmdrv_common.h
index 7d7a2b17aa76..6a287eadae75 100644
--- a/drivers/media/radio/wl128x/fmdrv_common.h
+++ b/drivers/media/radio/wl128x/fmdrv_common.h
@@ -159,18 +159,18 @@ struct fm_event_msg_hdr {
 #define FM_DISABLE  0
 
 /* FLAG_GET register bits */
-#define FM_FR_EVENT		(1 << 0)
-#define FM_BL_EVENT		(1 << 1)
-#define FM_RDS_EVENT		(1 << 2)
-#define FM_BBLK_EVENT		(1 << 3)
-#define FM_LSYNC_EVENT		(1 << 4)
-#define FM_LEV_EVENT		(1 << 5)
-#define FM_IFFR_EVENT		(1 << 6)
-#define FM_PI_EVENT		(1 << 7)
-#define FM_PD_EVENT		(1 << 8)
-#define FM_STIC_EVENT		(1 << 9)
-#define FM_MAL_EVENT		(1 << 10)
-#define FM_POW_ENB_EVENT	(1 << 11)
+#define FM_FR_EVENT		BIT(0)
+#define FM_BL_EVENT		BIT(1)
+#define FM_RDS_EVENT		BIT(2)
+#define FM_BBLK_EVENT		BIT(3)
+#define FM_LSYNC_EVENT		BIT(4)
+#define FM_LEV_EVENT		BIT(5)
+#define FM_IFFR_EVENT		BIT(6)
+#define FM_PI_EVENT		BIT(7)
+#define FM_PD_EVENT		BIT(8)
+#define FM_STIC_EVENT		BIT(9)
+#define FM_MAL_EVENT		BIT(10)
+#define FM_POW_ENB_EVENT	BIT(11)
 
 /*
  * Firmware files of FM. ASIC ID and ASIC version will be appened to this,
@@ -268,38 +268,38 @@ struct fm_event_msg_hdr {
  * Represents an RDS group type & version.
  * There are 15 groups, each group has 2 versions: A and B.
  */
-#define FM_RDS_GROUP_TYPE_MASK_0A	    ((unsigned long)1<<0)
-#define FM_RDS_GROUP_TYPE_MASK_0B	    ((unsigned long)1<<1)
-#define FM_RDS_GROUP_TYPE_MASK_1A	    ((unsigned long)1<<2)
-#define FM_RDS_GROUP_TYPE_MASK_1B	    ((unsigned long)1<<3)
-#define FM_RDS_GROUP_TYPE_MASK_2A	    ((unsigned long)1<<4)
-#define FM_RDS_GROUP_TYPE_MASK_2B	    ((unsigned long)1<<5)
-#define FM_RDS_GROUP_TYPE_MASK_3A	    ((unsigned long)1<<6)
-#define FM_RDS_GROUP_TYPE_MASK_3B           ((unsigned long)1<<7)
-#define FM_RDS_GROUP_TYPE_MASK_4A	    ((unsigned long)1<<8)
-#define FM_RDS_GROUP_TYPE_MASK_4B	    ((unsigned long)1<<9)
-#define FM_RDS_GROUP_TYPE_MASK_5A	    ((unsigned long)1<<10)
-#define FM_RDS_GROUP_TYPE_MASK_5B	    ((unsigned long)1<<11)
-#define FM_RDS_GROUP_TYPE_MASK_6A	    ((unsigned long)1<<12)
-#define FM_RDS_GROUP_TYPE_MASK_6B	    ((unsigned long)1<<13)
-#define FM_RDS_GROUP_TYPE_MASK_7A	    ((unsigned long)1<<14)
-#define FM_RDS_GROUP_TYPE_MASK_7B	    ((unsigned long)1<<15)
-#define FM_RDS_GROUP_TYPE_MASK_8A           ((unsigned long)1<<16)
-#define FM_RDS_GROUP_TYPE_MASK_8B	    ((unsigned long)1<<17)
-#define FM_RDS_GROUP_TYPE_MASK_9A	    ((unsigned long)1<<18)
-#define FM_RDS_GROUP_TYPE_MASK_9B	    ((unsigned long)1<<19)
-#define FM_RDS_GROUP_TYPE_MASK_10A	    ((unsigned long)1<<20)
-#define FM_RDS_GROUP_TYPE_MASK_10B	    ((unsigned long)1<<21)
-#define FM_RDS_GROUP_TYPE_MASK_11A	    ((unsigned long)1<<22)
-#define FM_RDS_GROUP_TYPE_MASK_11B	    ((unsigned long)1<<23)
-#define FM_RDS_GROUP_TYPE_MASK_12A	    ((unsigned long)1<<24)
-#define FM_RDS_GROUP_TYPE_MASK_12B	    ((unsigned long)1<<25)
-#define FM_RDS_GROUP_TYPE_MASK_13A	    ((unsigned long)1<<26)
-#define FM_RDS_GROUP_TYPE_MASK_13B	    ((unsigned long)1<<27)
-#define FM_RDS_GROUP_TYPE_MASK_14A	    ((unsigned long)1<<28)
-#define FM_RDS_GROUP_TYPE_MASK_14B	    ((unsigned long)1<<29)
-#define FM_RDS_GROUP_TYPE_MASK_15A	    ((unsigned long)1<<30)
-#define FM_RDS_GROUP_TYPE_MASK_15B	    ((unsigned long)1<<31)
+#define FM_RDS_GROUP_TYPE_MASK_0A	    BIT(0)
+#define FM_RDS_GROUP_TYPE_MASK_0B	    BIT(1)
+#define FM_RDS_GROUP_TYPE_MASK_1A	    BIT(2)
+#define FM_RDS_GROUP_TYPE_MASK_1B	    BIT(3)
+#define FM_RDS_GROUP_TYPE_MASK_2A	    BIT(4)
+#define FM_RDS_GROUP_TYPE_MASK_2B	    BIT(5)
+#define FM_RDS_GROUP_TYPE_MASK_3A	    BIT(6)
+#define FM_RDS_GROUP_TYPE_MASK_3B	    BIT(7)
+#define FM_RDS_GROUP_TYPE_MASK_4A	    BIT(8)
+#define FM_RDS_GROUP_TYPE_MASK_4B	    BIT(9)
+#define FM_RDS_GROUP_TYPE_MASK_5A	    BIT(10)
+#define FM_RDS_GROUP_TYPE_MASK_5B	    BIT(11)
+#define FM_RDS_GROUP_TYPE_MASK_6A	    BIT(12)
+#define FM_RDS_GROUP_TYPE_MASK_6B	    BIT(13)
+#define FM_RDS_GROUP_TYPE_MASK_7A	    BIT(14)
+#define FM_RDS_GROUP_TYPE_MASK_7B	    BIT(15)
+#define FM_RDS_GROUP_TYPE_MASK_8A	    BIT(16)
+#define FM_RDS_GROUP_TYPE_MASK_8B	    BIT(17)
+#define FM_RDS_GROUP_TYPE_MASK_9A	    BIT(18)
+#define FM_RDS_GROUP_TYPE_MASK_9B	    BIT(19)
+#define FM_RDS_GROUP_TYPE_MASK_10A	    BIT(20)
+#define FM_RDS_GROUP_TYPE_MASK_10B	    BIT(21)
+#define FM_RDS_GROUP_TYPE_MASK_11A	    BIT(22)
+#define FM_RDS_GROUP_TYPE_MASK_11B	    BIT(23)
+#define FM_RDS_GROUP_TYPE_MASK_12A	    BIT(24)
+#define FM_RDS_GROUP_TYPE_MASK_12B	    BIT(25)
+#define FM_RDS_GROUP_TYPE_MASK_13A	    BIT(26)
+#define FM_RDS_GROUP_TYPE_MASK_13B	    BIT(27)
+#define FM_RDS_GROUP_TYPE_MASK_14A	    BIT(28)
+#define FM_RDS_GROUP_TYPE_MASK_14B	    BIT(29)
+#define FM_RDS_GROUP_TYPE_MASK_15A	    BIT(30)
+#define FM_RDS_GROUP_TYPE_MASK_15B	    BIT(31)
 
 /* RX Alternate Frequency info */
 #define FM_RDS_MIN_AF			  1
diff --git a/drivers/staging/media/ipu3/ipu3-tables.h b/drivers/staging/media/ipu3/ipu3-tables.h
index a1bf3286f380..9f719c48b432 100644
--- a/drivers/staging/media/ipu3/ipu3-tables.h
+++ b/drivers/staging/media/ipu3/ipu3-tables.h
@@ -4,6 +4,8 @@
 #ifndef __IPU3_TABLES_H
 #define __IPU3_TABLES_H
 
+#include <linux/bitops.h>
+
 #include "ipu3-abi.h"
 
 #define IMGU_BDS_GRANULARITY		32	/* Downscaling granularity */
@@ -12,7 +14,7 @@
 
 #define IMGU_SCALER_DOWNSCALE_4TAPS_LEN	128
 #define IMGU_SCALER_DOWNSCALE_2TAPS_LEN	64
-#define IMGU_SCALER_FP			((u32)1 << 31) /* 1.0 in fixed point */
+#define IMGU_SCALER_FP			BIT(31) /* 1.0 in fixed point */
 
 #define IMGU_XNR3_VMEM_LUT_LEN		16
 
-- 
2.21.0


