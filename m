Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F6328B10F
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 11:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbgJLJDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 05:03:07 -0400
Received: from mga04.intel.com ([192.55.52.120]:32115 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbgJLJDG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 05:03:06 -0400
IronPort-SDR: lhS+py2eRqj9gWL7Xu2ImHrKuFiVw9jFlskMvy4tvj7LyB9hCSDM4xeOmYjRDvJc4wgpyvW2nu
 n1S7bsG72K2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="163071171"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="163071171"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 02:03:05 -0700
IronPort-SDR: bfZ5QlyNNUO91Jgjilzs0XPY3IJTiAQ5xX7YoQTDf8rKms4KvxFhppc8vQxp7/uqvH3IF+tCBt
 pXa3FF65kiQA==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="529879842"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 02:03:03 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D850A20878; Mon, 12 Oct 2020 12:02:56 +0300 (EEST)
Date:   Mon, 12 Oct 2020 12:02:56 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 3/5] ipu3-cio2: Use unsigned values where appropriate
Message-ID: <20201012090256.GV26842@paasikivi.fi.intel.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
 <20201009150756.3397-4-sakari.ailus@linux.intel.com>
 <20201009171638.GB24849@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009171638.GB24849@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 08:16:38PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Oct 09, 2020 at 06:07:54PM +0300, Sakari Ailus wrote:
> > Use unsigned values for width, height, bit shifts and registers,
> > effectively for all definitions that are not signed.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.h | 156 +++++++++++------------
> >  1 file changed, 78 insertions(+), 78 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > index 146492383aa5..7650d7998a3f 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> > @@ -13,20 +13,20 @@
> >  #define CIO2_PCI_BAR					0
> >  #define CIO2_DMA_MASK					DMA_BIT_MASK(39)
> >  
> > -#define CIO2_IMAGE_MAX_WIDTH				4224
> > -#define CIO2_IMAGE_MAX_LENGTH				3136
> > +#define CIO2_IMAGE_MAX_WIDTH				4224U
> > +#define CIO2_IMAGE_MAX_LENGTH				3136U
> >  
> >  /* 32MB = 8xFBPT_entry */
> >  #define CIO2_MAX_LOPS					8
> >  #define CIO2_MAX_BUFFERS			(PAGE_SIZE / 16 / CIO2_MAX_LOPS)
> >  #define CIO2_LOP_ENTRIES			(PAGE_SIZE / sizeof(u32))
> >  
> > -#define CIO2_PAD_SINK					0
> > -#define CIO2_PAD_SOURCE					1
> > -#define CIO2_PADS					2
> > +#define CIO2_PAD_SINK					0U
> > +#define CIO2_PAD_SOURCE					1U
> > +#define CIO2_PADS					2U
> 
> I would have done this only for values that are meant to be used in
> arithmetic expressions, such as CIO2_IMAGE_MAX_WIDTH and
> CIO2_IMAGE_MAX_LENGTH. Up to you.

I'd say the register values are inherently unsigned albeit it doesn't
really matter if the sign bit is there in most cases.

> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> >  
> > -#define CIO2_NUM_DMA_CHAN				20
> > -#define CIO2_NUM_PORTS					4 /* DPHYs */
> > +#define CIO2_NUM_DMA_CHAN				20U
> > +#define CIO2_NUM_PORTS					4U /* DPHYs */
> >  
> >  /* 1 for each sensor */
> >  #define CIO2_QUEUES					CIO2_NUM_PORTS
> > @@ -66,12 +66,12 @@
> >  #define CIO2_REG_MIPIBE_FORCE_RAW8	(CIO2_REG_MIPIBE_BASE + 0x20)
> >  #define CIO2_REG_MIPIBE_FORCE_RAW8_ENABLE		BIT(0)
> >  #define CIO2_REG_MIPIBE_FORCE_RAW8_USE_TYPEID		BIT(1)
> > -#define CIO2_REG_MIPIBE_FORCE_RAW8_TYPEID_SHIFT		2
> > +#define CIO2_REG_MIPIBE_FORCE_RAW8_TYPEID_SHIFT		2U
> >  
> >  #define CIO2_REG_MIPIBE_IRQ_STATUS	(CIO2_REG_MIPIBE_BASE + 0x24)
> >  #define CIO2_REG_MIPIBE_IRQ_CLEAR	(CIO2_REG_MIPIBE_BASE + 0x28)
> >  #define CIO2_REG_MIPIBE_GLOBAL_LUT_DISREGARD (CIO2_REG_MIPIBE_BASE + 0x68)
> > -#define CIO2_MIPIBE_GLOBAL_LUT_DISREGARD		1
> > +#define CIO2_MIPIBE_GLOBAL_LUT_DISREGARD		1U
> >  #define CIO2_REG_MIPIBE_PKT_STALL_STATUS (CIO2_REG_MIPIBE_BASE + 0x6c)
> >  #define CIO2_REG_MIPIBE_PARSE_GSP_THROUGH_LP_LUT_REG_IDX \
> >  					(CIO2_REG_MIPIBE_BASE + 0x70)
> > @@ -79,10 +79,10 @@
> >  				       (CIO2_REG_MIPIBE_BASE + 0x74 + 4 * (vc))
> >  #define CIO2_REG_MIPIBE_LP_LUT_ENTRY(m)	/* m = 0..15 */ \
> >  					(CIO2_REG_MIPIBE_BASE + 0x84 + 4 * (m))
> > -#define CIO2_MIPIBE_LP_LUT_ENTRY_DISREGARD		1
> > -#define CIO2_MIPIBE_LP_LUT_ENTRY_SID_SHIFT		1
> > -#define CIO2_MIPIBE_LP_LUT_ENTRY_VC_SHIFT		5
> > -#define CIO2_MIPIBE_LP_LUT_ENTRY_FORMAT_TYPE_SHIFT	7
> > +#define CIO2_MIPIBE_LP_LUT_ENTRY_DISREGARD		1U
> > +#define CIO2_MIPIBE_LP_LUT_ENTRY_SID_SHIFT		1U
> > +#define CIO2_MIPIBE_LP_LUT_ENTRY_VC_SHIFT		5U
> > +#define CIO2_MIPIBE_LP_LUT_ENTRY_FORMAT_TYPE_SHIFT	7U
> >  
> >  /* base register: CIO2_REG_PIPE_BASE(pipe) * CIO2_REG_IRQCTRL_BASE */
> >  /* IRQ registers are 18-bit wide, see cio2_irq_error for bit definitions */
> > @@ -113,31 +113,31 @@
> >  #define CIO2_CGC_ROSC_DCGE				BIT(12)
> >  #define CIO2_CGC_XOSC_DCGE				BIT(13)
> >  #define CIO2_CGC_FLIS_DCGE				BIT(14)
> > -#define CIO2_CGC_CLKGATE_HOLDOFF_SHIFT			20
> > -#define CIO2_CGC_CSI_CLKGATE_HOLDOFF_SHIFT		24
> > +#define CIO2_CGC_CLKGATE_HOLDOFF_SHIFT			20U
> > +#define CIO2_CGC_CSI_CLKGATE_HOLDOFF_SHIFT		24U
> >  #define CIO2_REG_D0I3C					0x1408
> >  #define CIO2_D0I3C_I3					BIT(2)	/* Set D0I3 */
> >  #define CIO2_D0I3C_RR					BIT(3)	/* Restore? */
> >  #define CIO2_REG_SWRESET				0x140c
> > -#define CIO2_SWRESET_SWRESET				1
> > +#define CIO2_SWRESET_SWRESET				1U
> >  #define CIO2_REG_SENSOR_ACTIVE				0x1410
> >  #define CIO2_REG_INT_STS				0x1414
> >  #define CIO2_REG_INT_STS_EXT_OE				0x1418
> > -#define CIO2_INT_EXT_OE_DMAOE_SHIFT			0
> > +#define CIO2_INT_EXT_OE_DMAOE_SHIFT			0U
> >  #define CIO2_INT_EXT_OE_DMAOE_MASK			0x7ffff
> > -#define CIO2_INT_EXT_OE_OES_SHIFT			24
> > +#define CIO2_INT_EXT_OE_OES_SHIFT			24U
> >  #define CIO2_INT_EXT_OE_OES_MASK	(0xf << CIO2_INT_EXT_OE_OES_SHIFT)
> >  #define CIO2_REG_INT_EN					0x1420
> >  #define CIO2_REG_INT_EN_IRQ				(1 << 24)
> > -#define CIO2_REG_INT_EN_IOS(dma)	(1 << (((dma) >> 1) + 12))
> > +#define CIO2_REG_INT_EN_IOS(dma)	(1U << (((dma) >> 1U) + 12U))
> >  /*
> >   * Interrupt on completion bit, Eg. DMA 0-3 maps to bit 0-3,
> >   * DMA4 & DMA5 map to bit 4 ... DMA18 & DMA19 map to bit 11 Et cetera
> >   */
> > -#define CIO2_INT_IOC(dma)	(1 << ((dma) < 4 ? (dma) : ((dma) >> 1) + 2))
> > +#define CIO2_INT_IOC(dma)	(1U << ((dma) < 4U ? (dma) : ((dma) >> 1U) + 2U))
> >  #define CIO2_INT_IOC_SHIFT				0
> >  #define CIO2_INT_IOC_MASK		(0x7ff << CIO2_INT_IOC_SHIFT)
> > -#define CIO2_INT_IOS_IOLN(dma)		(1 << (((dma) >> 1) + 12))
> > +#define CIO2_INT_IOS_IOLN(dma)		(1U << (((dma) >> 1U) + 12U))
> >  #define CIO2_INT_IOS_IOLN_SHIFT				12
> >  #define CIO2_INT_IOS_IOLN_MASK		(0x3ff << CIO2_INT_IOS_IOLN_SHIFT)
> >  #define CIO2_INT_IOIE					BIT(22)
> > @@ -145,32 +145,32 @@
> >  #define CIO2_INT_IOIRQ					BIT(24)
> >  #define CIO2_REG_INT_EN_EXT_OE				0x1424
> >  #define CIO2_REG_DMA_DBG				0x1448
> > -#define CIO2_REG_DMA_DBG_DMA_INDEX_SHIFT		0
> > +#define CIO2_REG_DMA_DBG_DMA_INDEX_SHIFT		0U
> >  #define CIO2_REG_PBM_ARB_CTRL				0x1460
> > -#define CIO2_PBM_ARB_CTRL_LANES_DIV			0 /* 4-4-2-2 lanes */
> > -#define CIO2_PBM_ARB_CTRL_LANES_DIV_SHIFT		0
> > +#define CIO2_PBM_ARB_CTRL_LANES_DIV			0U /* 4-4-2-2 lanes */
> > +#define CIO2_PBM_ARB_CTRL_LANES_DIV_SHIFT		0U
> >  #define CIO2_PBM_ARB_CTRL_LE_EN				BIT(7)
> > -#define CIO2_PBM_ARB_CTRL_PLL_POST_SHTDN		2
> > -#define CIO2_PBM_ARB_CTRL_PLL_POST_SHTDN_SHIFT		8
> > -#define CIO2_PBM_ARB_CTRL_PLL_AHD_WK_UP			480
> > -#define CIO2_PBM_ARB_CTRL_PLL_AHD_WK_UP_SHIFT		16
> > +#define CIO2_PBM_ARB_CTRL_PLL_POST_SHTDN		2U
> > +#define CIO2_PBM_ARB_CTRL_PLL_POST_SHTDN_SHIFT		8U
> > +#define CIO2_PBM_ARB_CTRL_PLL_AHD_WK_UP			480U
> > +#define CIO2_PBM_ARB_CTRL_PLL_AHD_WK_UP_SHIFT		16U
> >  #define CIO2_REG_PBM_WMCTRL1				0x1464
> > -#define CIO2_PBM_WMCTRL1_MIN_2CK_SHIFT			0
> > -#define CIO2_PBM_WMCTRL1_MID1_2CK_SHIFT			8
> > -#define CIO2_PBM_WMCTRL1_MID2_2CK_SHIFT			16
> > +#define CIO2_PBM_WMCTRL1_MIN_2CK_SHIFT			0U
> > +#define CIO2_PBM_WMCTRL1_MID1_2CK_SHIFT			8U
> > +#define CIO2_PBM_WMCTRL1_MID2_2CK_SHIFT			16U
> >  #define CIO2_PBM_WMCTRL1_TS_COUNT_DISABLE		BIT(31)
> >  #define CIO2_PBM_WMCTRL1_MIN_2CK	(4 << CIO2_PBM_WMCTRL1_MIN_2CK_SHIFT)
> >  #define CIO2_PBM_WMCTRL1_MID1_2CK	(16 << CIO2_PBM_WMCTRL1_MID1_2CK_SHIFT)
> >  #define CIO2_PBM_WMCTRL1_MID2_2CK	(21 << CIO2_PBM_WMCTRL1_MID2_2CK_SHIFT)
> >  #define CIO2_REG_PBM_WMCTRL2				0x1468
> > -#define CIO2_PBM_WMCTRL2_HWM_2CK			40
> > -#define CIO2_PBM_WMCTRL2_HWM_2CK_SHIFT			0
> > -#define CIO2_PBM_WMCTRL2_LWM_2CK			22
> > -#define CIO2_PBM_WMCTRL2_LWM_2CK_SHIFT			8
> > -#define CIO2_PBM_WMCTRL2_OBFFWM_2CK			2
> > -#define CIO2_PBM_WMCTRL2_OBFFWM_2CK_SHIFT		16
> > -#define CIO2_PBM_WMCTRL2_TRANSDYN			1
> > -#define CIO2_PBM_WMCTRL2_TRANSDYN_SHIFT			24
> > +#define CIO2_PBM_WMCTRL2_HWM_2CK			40U
> > +#define CIO2_PBM_WMCTRL2_HWM_2CK_SHIFT			0U
> > +#define CIO2_PBM_WMCTRL2_LWM_2CK			22U
> > +#define CIO2_PBM_WMCTRL2_LWM_2CK_SHIFT			8U
> > +#define CIO2_PBM_WMCTRL2_OBFFWM_2CK			2U
> > +#define CIO2_PBM_WMCTRL2_OBFFWM_2CK_SHIFT		16U
> > +#define CIO2_PBM_WMCTRL2_TRANSDYN			1U
> > +#define CIO2_PBM_WMCTRL2_TRANSDYN_SHIFT			24U
> >  #define CIO2_PBM_WMCTRL2_DYNWMEN			BIT(28)
> >  #define CIO2_PBM_WMCTRL2_OBFF_MEM_EN			BIT(29)
> >  #define CIO2_PBM_WMCTRL2_OBFF_CPU_EN			BIT(30)
> > @@ -178,12 +178,12 @@
> >  #define CIO2_REG_PBM_TS_COUNT				0x146c
> >  #define CIO2_REG_PBM_FOPN_ABORT				0x1474
> >  /* below n = 0..3 */
> > -#define CIO2_PBM_FOPN_ABORT(n)				(0x1 << 8 * (n))
> > -#define CIO2_PBM_FOPN_FORCE_ABORT(n)			(0x2 << 8 * (n))
> > -#define CIO2_PBM_FOPN_FRAMEOPEN(n)			(0x8 << 8 * (n))
> > +#define CIO2_PBM_FOPN_ABORT(n)				(0x1 << 8U * (n))
> > +#define CIO2_PBM_FOPN_FORCE_ABORT(n)			(0x2 << 8U * (n))
> > +#define CIO2_PBM_FOPN_FRAMEOPEN(n)			(0x8 << 8U * (n))
> >  #define CIO2_REG_LTRCTRL				0x1480
> >  #define CIO2_LTRCTRL_LTRDYNEN				BIT(16)
> > -#define CIO2_LTRCTRL_LTRSTABLETIME_SHIFT		8
> > +#define CIO2_LTRCTRL_LTRSTABLETIME_SHIFT		8U
> >  #define CIO2_LTRCTRL_LTRSTABLETIME_MASK			0xff
> >  #define CIO2_LTRCTRL_LTRSEL1S3				BIT(7)
> >  #define CIO2_LTRCTRL_LTRSEL1S2				BIT(6)
> > @@ -195,28 +195,28 @@
> >  #define CIO2_LTRCTRL_LTRSEL2S0				BIT(0)
> >  #define CIO2_REG_LTRVAL23				0x1484
> >  #define CIO2_REG_LTRVAL01				0x1488
> > -#define CIO2_LTRVAL02_VAL_SHIFT				0
> > -#define CIO2_LTRVAL02_SCALE_SHIFT			10
> > -#define CIO2_LTRVAL13_VAL_SHIFT				16
> > -#define CIO2_LTRVAL13_SCALE_SHIFT			26
> > +#define CIO2_LTRVAL02_VAL_SHIFT				0U
> > +#define CIO2_LTRVAL02_SCALE_SHIFT			10U
> > +#define CIO2_LTRVAL13_VAL_SHIFT				16U
> > +#define CIO2_LTRVAL13_SCALE_SHIFT			26U
> >  
> > -#define CIO2_LTRVAL0_VAL				175
> > +#define CIO2_LTRVAL0_VAL				175U
> >  /* Value times 1024 ns */
> > -#define CIO2_LTRVAL0_SCALE				2
> > -#define CIO2_LTRVAL1_VAL				90
> > -#define CIO2_LTRVAL1_SCALE				2
> > -#define CIO2_LTRVAL2_VAL				90
> > -#define CIO2_LTRVAL2_SCALE				2
> > -#define CIO2_LTRVAL3_VAL				90
> > -#define CIO2_LTRVAL3_SCALE				2
> > +#define CIO2_LTRVAL0_SCALE				2U
> > +#define CIO2_LTRVAL1_VAL				90U
> > +#define CIO2_LTRVAL1_SCALE				2U
> > +#define CIO2_LTRVAL2_VAL				90U
> > +#define CIO2_LTRVAL2_SCALE				2U
> > +#define CIO2_LTRVAL3_VAL				90U
> > +#define CIO2_LTRVAL3_SCALE				2U
> >  
> >  #define CIO2_REG_CDMABA(n)		(0x1500 + 0x10 * (n))	/* n = 0..19 */
> >  #define CIO2_REG_CDMARI(n)		(0x1504 + 0x10 * (n))
> > -#define CIO2_CDMARI_FBPT_RP_SHIFT			0
> > +#define CIO2_CDMARI_FBPT_RP_SHIFT			0U
> >  #define CIO2_CDMARI_FBPT_RP_MASK			0xff
> >  #define CIO2_REG_CDMAC0(n)		(0x1508 + 0x10 * (n))
> > -#define CIO2_CDMAC0_FBPT_LEN_SHIFT			0
> > -#define CIO2_CDMAC0_FBPT_WIDTH_SHIFT			8
> > +#define CIO2_CDMAC0_FBPT_LEN_SHIFT			0U
> > +#define CIO2_CDMAC0_FBPT_WIDTH_SHIFT			8U
> >  #define CIO2_CDMAC0_FBPT_NS				BIT(25)
> >  #define CIO2_CDMAC0_DMA_INTR_ON_FS			BIT(26)
> >  #define CIO2_CDMAC0_DMA_INTR_ON_FE			BIT(27)
> > @@ -225,12 +225,12 @@
> >  #define CIO2_CDMAC0_DMA_EN				BIT(30)
> >  #define CIO2_CDMAC0_DMA_HALTED				BIT(31)
> >  #define CIO2_REG_CDMAC1(n)		(0x150c + 0x10 * (n))
> > -#define CIO2_CDMAC1_LINENUMINT_SHIFT			0
> > -#define CIO2_CDMAC1_LINENUMUPDATE_SHIFT			16
> > +#define CIO2_CDMAC1_LINENUMINT_SHIFT			0U
> > +#define CIO2_CDMAC1_LINENUMUPDATE_SHIFT			16U
> >  /* n = 0..3 */
> >  #define CIO2_REG_PXM_PXF_FMT_CFG0(n)	(0x1700 + 0x30 * (n))
> > -#define CIO2_PXM_PXF_FMT_CFG_SID0_SHIFT			0
> > -#define CIO2_PXM_PXF_FMT_CFG_SID1_SHIFT			16
> > +#define CIO2_PXM_PXF_FMT_CFG_SID0_SHIFT			0U
> > +#define CIO2_PXM_PXF_FMT_CFG_SID1_SHIFT			16U
> >  #define CIO2_PXM_PXF_FMT_CFG_PCK_64B			(0 << 0)
> >  #define CIO2_PXM_PXF_FMT_CFG_PCK_32B			(1 << 0)
> >  #define CIO2_PXM_PXF_FMT_CFG_BPP_08			(0 << 2)
> > @@ -249,27 +249,27 @@
> >  #define CIO2_PXM_PXF_FMT_CFG_PSWAP4_2ND_BD		(1 << 10)
> >  #define CIO2_REG_INT_STS_EXT_IE				0x17e4
> >  #define CIO2_REG_INT_EN_EXT_IE				0x17e8
> > -#define CIO2_INT_EXT_IE_ECC_RE(n)			(0x01 << (8 * (n)))
> > -#define CIO2_INT_EXT_IE_DPHY_NR(n)			(0x02 << (8 * (n)))
> > -#define CIO2_INT_EXT_IE_ECC_NR(n)			(0x04 << (8 * (n)))
> > -#define CIO2_INT_EXT_IE_CRCERR(n)			(0x08 << (8 * (n)))
> > -#define CIO2_INT_EXT_IE_INTERFRAMEDATA(n)		(0x10 << (8 * (n)))
> > -#define CIO2_INT_EXT_IE_PKT2SHORT(n)			(0x20 << (8 * (n)))
> > -#define CIO2_INT_EXT_IE_PKT2LONG(n)			(0x40 << (8 * (n)))
> > -#define CIO2_INT_EXT_IE_IRQ(n)				(0x80 << (8 * (n)))
> > +#define CIO2_INT_EXT_IE_ECC_RE(n)			(0x01 << (8U * (n)))
> > +#define CIO2_INT_EXT_IE_DPHY_NR(n)			(0x02 << (8U * (n)))
> > +#define CIO2_INT_EXT_IE_ECC_NR(n)			(0x04 << (8U * (n)))
> > +#define CIO2_INT_EXT_IE_CRCERR(n)			(0x08 << (8U * (n)))
> > +#define CIO2_INT_EXT_IE_INTERFRAMEDATA(n)		(0x10 << (8U * (n)))
> > +#define CIO2_INT_EXT_IE_PKT2SHORT(n)			(0x20 << (8U * (n)))
> > +#define CIO2_INT_EXT_IE_PKT2LONG(n)			(0x40 << (8U * (n)))
> > +#define CIO2_INT_EXT_IE_IRQ(n)				(0x80 << (8U * (n)))
> >  #define CIO2_REG_PXM_FRF_CFG(n)				(0x1720 + 0x30 * (n))
> >  #define CIO2_PXM_FRF_CFG_FNSEL				BIT(0)
> >  #define CIO2_PXM_FRF_CFG_FN_RST				BIT(1)
> >  #define CIO2_PXM_FRF_CFG_ABORT				BIT(2)
> > -#define CIO2_PXM_FRF_CFG_CRC_TH_SHIFT			3
> > +#define CIO2_PXM_FRF_CFG_CRC_TH_SHIFT			3U
> >  #define CIO2_PXM_FRF_CFG_MSK_ECC_DPHY_NR		BIT(8)
> >  #define CIO2_PXM_FRF_CFG_MSK_ECC_RE			BIT(9)
> >  #define CIO2_PXM_FRF_CFG_MSK_ECC_DPHY_NE		BIT(10)
> > -#define CIO2_PXM_FRF_CFG_EVEN_ODD_MODE_SHIFT		11
> > +#define CIO2_PXM_FRF_CFG_EVEN_ODD_MODE_SHIFT		11U
> >  #define CIO2_PXM_FRF_CFG_MASK_CRC_THRES			BIT(13)
> >  #define CIO2_PXM_FRF_CFG_MASK_CSI_ACCEPT		BIT(14)
> >  #define CIO2_PXM_FRF_CFG_CIOHC_FS_MODE			BIT(15)
> > -#define CIO2_PXM_FRF_CFG_CIOHC_FRST_FRM_SHIFT		16
> > +#define CIO2_PXM_FRF_CFG_CIOHC_FRST_FRM_SHIFT		16U
> >  #define CIO2_REG_PXM_SID2BID0(n)			(0x1724 + 0x30 * (n))
> >  #define CIO2_FB_HPLL_FREQ				0x2
> >  #define CIO2_ISCLK_RATIO				0xc
> > @@ -278,14 +278,14 @@
> >  
> >  #define CIO2_INT_EN_EXT_OE_MASK				0x8f0fffff
> >  
> > -#define CIO2_CGC_CLKGATE_HOLDOFF			3
> > -#define CIO2_CGC_CSI_CLKGATE_HOLDOFF			5
> > +#define CIO2_CGC_CLKGATE_HOLDOFF			3U
> > +#define CIO2_CGC_CSI_CLKGATE_HOLDOFF			5U
> >  
> >  #define CIO2_PXM_FRF_CFG_CRC_TH				16
> >  
> >  #define CIO2_INT_EN_EXT_IE_MASK				0xffffffff
> >  
> > -#define CIO2_DMA_CHAN					0
> > +#define CIO2_DMA_CHAN					0U
> >  
> >  #define CIO2_CSIRX_DLY_CNT_CLANE_IDX			-1
> >  
> > @@ -302,8 +302,8 @@
> >  #define CIO2_CSIRX_DLY_CNT_TERMEN_DEFAULT		0x4
> >  #define CIO2_CSIRX_DLY_CNT_SETTLE_DEFAULT		0x570
> >  
> > -#define CIO2_PMCSR_OFFSET				4
> > -#define CIO2_PMCSR_D0D3_SHIFT				2
> > +#define CIO2_PMCSR_OFFSET				4U
> > +#define CIO2_PMCSR_D0D3_SHIFT				2U
> >  #define CIO2_PMCSR_D3					0x3
> >  
> >  struct cio2_csi2_timing {
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
