Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C1A35A7A8
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 22:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbhDIUM1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 16:12:27 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:61308 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233610AbhDIUM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 16:12:27 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AKwI0nK61wwxv3iZqQQPXwD7XdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/2/hfhz726XtB89UGwt8OrwXJWobmjb8fdOgLU5GZeHcE3YtH?=
 =?us-ascii?q?CzLIdkhLGSoAHIPyHl7OZS2eNBfsFFebjNJGN3h8r7/wW0euxIqLLszImSif7a?=
 =?us-ascii?q?3zNRS2hRC51I1RtzCQqQDyRNKDVuOJxRLvehz/sCgzKhfHgNB/7UOlA1G9Hjnp?=
 =?us-ascii?q?nsj5LpYRkPGh4h5k21hyip8aOSKXel4is=3D?=
X-IronPort-AV: E=Sophos;i="5.82,210,1613430000"; 
   d="scan'208";a="502492982"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 22:12:12 +0200
Date:   Fri, 9 Apr 2021 22:12:12 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Mitali Borkar <mitaliborkar810@gmail.com>
cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH v2 2/2] staging: media: zoran: remove
 and add comments; align code
In-Reply-To: <YHCgnP6Jr6TbjwUy@kali>
Message-ID: <alpine.DEB.2.22.394.2104092209200.23056@hadrien>
References: <YHCgnP6Jr6TbjwUy@kali>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Sat, 10 Apr 2021, Mitali Borkar wrote:

> Removed comments from the same line and added them to new line above the
> blocks, aligned everything properly by using tabs to make code neater
> and improve readability.
>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/zoran/zr36057.h | 293 ++++++++++++++------------
>  1 file changed, 162 insertions(+), 131 deletions(-)
>
> diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
> index 93075459f910..198d344a8879 100644
> --- a/drivers/staging/media/zoran/zr36057.h
> +++ b/drivers/staging/media/zoran/zr36057.h
> @@ -12,145 +12,176 @@
>
>  /* Zoran ZR36057 registers */
>
> -#define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
> -#define ZR36057_VFEHCR_HS_POL             BIT(30)
> -#define ZR36057_VFEHCR_H_START           10
> +/* Video Front End, Horizontal Configuration Register */
> +#define ZR36057_VFEHCR			0x000
> +#define ZR36057_VFEHCR_HS_POL			BIT(30)

It looks like the alignment didn't work out here?  Check that the use of
tabs is the same as on the nearby lines.

> +#define ZR36057_VFEHCR_H_START		10
>  #define ZR36057_VFEHCR_H_END		0
>  #define ZR36057_VFEHCR_HMASK		0x3ff
>
> -#define ZR36057_VFEVCR          0x004	/* Video Front End, Vertical Configuration Register */
> -#define ZR36057_VFEVCR_VS_POL             BIT(30)
> -#define ZR36057_VFEVCR_V_START           10
> +/* Video Front End, Vertical Configuration Register */
> +#define ZR36057_VFEVCR			0x004
> +#define ZR36057_VFEVCR_VS_POL			BIT(30)
> +#define ZR36057_VFEVCR_V_START		10
>  #define ZR36057_VFEVCR_V_END		0
>  #define ZR36057_VFEVCR_VMASK		0x3ff
>
> -#define ZR36057_VFESPFR         0x008	/* Video Front End, Scaler and Pixel Format Register */
> -#define ZR36057_VFESPFR_EXT_FL            BIT(26)
> -#define ZR36057_VFESPFR_TOP_FIELD         BIT(25)
> -#define ZR36057_VFESPFR_VCLK_POL          BIT(24)
> -#define ZR36057_VFESPFR_H_FILTER         21
> -#define ZR36057_VFESPFR_HOR_DCM          14
> -#define ZR36057_VFESPFR_VER_DCM          8
> -#define ZR36057_VFESPFR_DISP_MODE        6
> -#define ZR36057_VFESPFR_YUV422          (0 << 3)
> -#define ZR36057_VFESPFR_RGB888          BIT(3)
> -#define ZR36057_VFESPFR_RGB565          (2 << 3)
> -#define ZR36057_VFESPFR_RGB555          (3 << 3)
> -#define ZR36057_VFESPFR_ERR_DIF          BIT(2)
> -#define ZR36057_VFESPFR_PACK24          BIT(1)
> -#define ZR36057_VFESPFR_LITTLE_ENDIAN    BIT(0)
> -
> -#define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
> -
> -#define ZR36057_VDBR            0x010	/* Video Display "Bottom" Register */
> -
> -#define ZR36057_VSSFGR          0x014	/* Video Stride, Status, and Frame Grab Register */
> -#define ZR36057_VSSFGR_DISP_STRIDE       16
> -#define ZR36057_VSSFGR_VID_OVF            BIT(8)
> -#define ZR36057_VSSFGR_SNAP_SHOT          BIT(1)
> -#define ZR36057_VSSFGR_FRAME_GRAB         BIT(0)
> -
> -#define ZR36057_VDCR            0x018	/* Video Display Configuration Register */
> -#define ZR36057_VDCR_VID_EN               BIT(31)
> -#define ZR36057_VDCR_MIN_PIX             24
> -#define ZR36057_VDCR_TRITON              BIT(24)
> -#define ZR36057_VDCR_VID_WIN_HT           12
> -#define ZR36057_VDCR_VID_WIN_WID          0
> -
> -#define ZR36057_MMTR            0x01c	/* Masking Map "Top" Register */
> -
> -#define ZR36057_MMBR            0x020	/* Masking Map "Bottom" Register */
> -
> -#define ZR36057_OCR             0x024	/* Overlay Control Register */
> -#define ZR36057_OCR_OVL_ENABLE            BIT(15)
> -#define ZR36057_OCR_MASK_STRIDE          0
> -
> -#define ZR36057_SPGPPCR         0x028	/* System, PCI, and General Purpose Pins Control Register */
> -#define ZR36057_SPGPPCR_SOFT_RESET	 BIT(24)
> -
> -#define ZR36057_GPPGCR1         0x02c	/* General Purpose Pins and GuestBus Control Register (1) */
> -
> -#define ZR36057_MCSAR           0x030	/* MPEG Code Source Address Register */
> -
> -#define ZR36057_MCTCR           0x034	/* MPEG Code Transfer Control Register */
> -#define ZR36057_MCTCR_COD_TIME            BIT(30)
> -#define ZR36057_MCTCR_C_EMPTY             BIT(29)
> -#define ZR36057_MCTCR_C_FLUSH             BIT(28)
> +/* Video Front End, Scaler and Pixel Format Register */
> +#define ZR36057_VFESPFR			0x008
> +#define ZR36057_VFESPFR_EXT_FL			BIT(26)
> +#define ZR36057_VFESPFR_TOP_FIELD		BIT(25)
> +#define ZR36057_VFESPFR_VCLK_POL		BIT(24)
> +#define ZR36057_VFESPFR_H_FILTER	21
> +#define ZR36057_VFESPFR_HOR_DCM		14
> +#define ZR36057_VFESPFR_VER_DCM		8
> +#define ZR36057_VFESPFR_DISP_MODE	6

The above four lines also look odd.

> +#define ZR36057_VFESPFR_YUV422			(0 << 3)
> +#define ZR36057_VFESPFR_RGB888			BIT(3)

Was there really a BIT in the original code, or is this a patch against
your previous patch?

> +#define ZR36057_VFESPFR_RGB565			(2 << 3)
> +#define ZR36057_VFESPFR_RGB555			(3 << 3)
> +#define ZR36057_VFESPFR_ERR_DIF			BIT(2)
> +#define ZR36057_VFESPFR_PACK24			BIT(1)
> +#define ZR36057_VFESPFR_LITTLE_ENDIAN		BIT(0)
> +
> +/* Video Display "Top" Register */
> +#define ZR36057_VDTR			0x00c
> +
> +/* Video Display "Bottom" Register */
> +#define ZR36057_VDBR			0x010
> +
> +/* Video Stride, Status, and Frame Grab Register */
> +#define ZR36057_VSSFGR			0x014
> +#define ZR36057_VSSFGR_DISP_STRIDE	16
> +#define ZR36057_VSSFGR_VID_OVF			BIT(8)
> +#define ZR36057_VSSFGR_SNAP_SHOT		BIT(1)
> +#define ZR36057_VSSFGR_FRAME_GRAB		BIT(0)
> +
> +/* Video Display Configuration Register */
> +#define ZR36057_VDCR			0x018
> +#define ZR36057_VDCR_VID_EN			BIT(31)
> +#define ZR36057_VDCR_MIN_PIX		24
> +#define ZR36057_VDCR_TRITON			BIT(24)
> +#define ZR36057_VDCR_VID_WIN_HT		12

These don't look well aligned either.

Please check on the rest.

julia


> +#define ZR36057_VDCR_VID_WIN_WID	0
> +
> +/* Masking Map "Top" Register */
> +#define ZR36057_MMTR			0x01c
> +
> +/* Masking Map "Bottom" Register */
> +#define ZR36057_MMBR			0x020
> +
> +/* Overlay Control Register */
> +#define ZR36057_OCR			0x024
> +#define ZR36057_OCR_OVL_ENABLE			BIT(15)
> +#define ZR36057_OCR_MASK_STRIDE		0
> +
> +/* System, PCI, and General Purpose Pins Control Register */
> +#define ZR36057_SPGPPCR			0x028
> +#define ZR36057_SPGPPCR_SOFT_RESET		BIT(24)
> +
> +/* General Purpose Pins and GuestBus Control Register (1) */
> +#define ZR36057_GPPGCR1			0x02c
> +
> +/* MPEG Code Source Address Register */
> +#define ZR36057_MCSAR			0x030
> +
> +/* MPEG Code Transfer Control Register */
> +#define ZR36057_MCTCR			0x034
> +#define ZR36057_MCTCR_COD_TIME			BIT(30)
> +#define ZR36057_MCTCR_C_EMPTY			BIT(29)
> +#define ZR36057_MCTCR_C_FLUSH			BIT(28)
>  #define ZR36057_MCTCR_COD_GUEST_ID	20
>  #define ZR36057_MCTCR_COD_GUEST_REG	16
>
> -#define ZR36057_MCMPR           0x038	/* MPEG Code Memory Pointer Register */
> -
> -#define ZR36057_ISR             0x03c	/* Interrupt Status Register */
> -#define ZR36057_ISR_GIRQ1                BIT(30)
> -#define ZR36057_ISR_GIRQ0                BIT(29)
> -#define ZR36057_ISR_COD_REP_IRQ            BIT(28)
> -#define ZR36057_ISR_JPEG_REP_IRQ           BIT(27)
> -
> -#define ZR36057_ICR             0x040	/* Interrupt Control Register */
> -#define ZR36057_ICR_GIRQ1                BIT(30)
> -#define ZR36057_ICR_GIRQ0                BIT(29)
> -#define ZR36057_ICR_COD_REP_IRQ            BIT(28)
> -#define ZR36057_ICR_JPEG_REP_IRQ           BIT(27)
> -#define ZR36057_ICR_INT_PIN_EN             BIT(24)
> -
> -#define ZR36057_I2CBR           0x044	/* I2C Bus Register */
> -#define ZR36057_I2CBR_SDA		 BIT(1)
> -#define ZR36057_I2CBR_SCL		 BIT(0)
> -
> -#define ZR36057_JMC             0x100	/* JPEG Mode and Control */
> -#define ZR36057_JMC_JPG                  BIT(31)
> -#define ZR36057_JMC_JPG_EXP_MODE          (0 << 29)
> -#define ZR36057_JMC_JPG_CMP_MODE           BIT(29)
> -#define ZR36057_JMC_MJPG_EXP_MODE         (2 << 29)
> -#define ZR36057_JMC_MJPG_CMP_MODE         (3 << 29)
> -#define ZR36057_JMC_RTBUSY_FB            BIT(6)
> -#define ZR36057_JMC_GO_EN                BIT(5)
> -#define ZR36057_JMC_SYNC_MSTR             BIT(4)
> -#define ZR36057_JMC_FLD_PER_BUFF         BIT(3)
> -#define ZR36057_JMC_VFIFO_FB             BIT(2)
> -#define ZR36057_JMC_CFIFO_FB             BIT(1)
> -#define ZR36057_JMC_STLL_LIT_ENDIAN       BIT(0)
> -
> -#define ZR36057_JPC             0x104	/* JPEG Process Control */
> -#define ZR36057_JPC_P_RESET              BIT(7)
> -#define ZR36057_JPC_COD_TRNS_EN            BIT(5)
> -#define ZR36057_JPC_ACTIVE               BIT(0)
> -
> -#define ZR36057_VSP             0x108	/* Vertical Sync Parameters */
> -#define ZR36057_VSP_VSYNC_SIZE           16
> -#define ZR36057_VSP_FRM_TOT              0
> -
> -#define ZR36057_HSP             0x10c	/* Horizontal Sync Parameters */
> -#define ZR36057_HSP_HSYNC_START          16
> -#define ZR36057_HSP_LINE_TOT             0
> -
> -#define ZR36057_FHAP            0x110	/* Field Horizontal Active Portion */
> -#define ZR36057_FHAP_NAX                16
> -#define ZR36057_FHAP_PAX                0
> -
> -#define ZR36057_FVAP            0x114	/* Field Vertical Active Portion */
> -#define ZR36057_FVAP_NAY                16
> -#define ZR36057_FVAP_PAY                0
> -
> -#define ZR36057_FPP             0x118	/* Field Process Parameters */
> -#define ZR36057_FPP_ODD_EVEN             BIT(0)
> -
> -#define ZR36057_JCBA            0x11c	/* JPEG Code Base Address */
> -
> -#define ZR36057_JCFT            0x120	/* JPEG Code FIFO Threshold */
> -
> -#define ZR36057_JCGI            0x124	/* JPEG Codec Guest ID */
> -#define ZR36057_JCGI_JPE_GUEST_ID         4
> -#define ZR36057_JCGI_JPE_GUEST_REG        0
> -
> -#define ZR36057_GCR2            0x12c	/* GuestBus Control Register (2) */
> -
> -#define ZR36057_POR             0x200	/* Post Office Register */
> -#define ZR36057_POR_PO_PEN                BIT(25)
> -#define ZR36057_POR_PO_TIME               BIT(24)
> -#define ZR36057_POR_PO_DIR                BIT(23)
> -
> -#define ZR36057_STR             0x300	/* "Still" Transfer Register */
> +/* MPEG Code Memory Pointer Register */
> +#define ZR36057_MCMPR			0x038
> +
> +/* Interrupt Status Register */
> +#define ZR36057_ISR			0x03c
> +#define ZR36057_ISR_GIRQ1			BIT(30)
> +#define ZR36057_ISR_GIRQ0			BIT(29)
> +#define ZR36057_ISR_COD_REP_IRQ			BIT(28)
> +#define ZR36057_ISR_JPEG_REP_IRQ		BIT(27)
> +
> +/* Interrupt Control Register */
> +#define ZR36057_ICR			0x040
> +#define ZR36057_ICR_GIRQ1			BIT(30)
> +#define ZR36057_ICR_GIRQ0			BIT(29)
> +#define ZR36057_ICR_COD_REP_IRQ			BIT(28)
> +#define ZR36057_ICR_JPEG_REP_IRQ		BIT(27)
> +#define ZR36057_ICR_INT_PIN_EN			BIT(24)
> +
> +/* I2C Bus Register */
> +#define ZR36057_I2CBR			0x044
> +#define ZR36057_I2CBR_SDA			BIT(1)
> +#define ZR36057_I2CBR_SCL			BIT(0)
> +
> +/* JPEG Mode and Control */
> +#define ZR36057_JMC			0x100
> +#define ZR36057_JMC_JPG				BIT(31)
> +#define ZR36057_JMC_JPG_EXP_MODE		(0 << 29)
> +#define ZR36057_JMC_JPG_CMP_MODE		BIT(29)
> +#define ZR36057_JMC_MJPG_EXP_MODE		(2 << 29)
> +#define ZR36057_JMC_MJPG_CMP_MODE		(3 << 29)
> +#define ZR36057_JMC_RTBUSY_FB			BIT(6)
> +#define ZR36057_JMC_GO_EN			BIT(5)
> +#define ZR36057_JMC_SYNC_MSTR			BIT(4)
> +#define ZR36057_JMC_FLD_PER_BUFF		BIT(3)
> +#define ZR36057_JMC_VFIFO_FB			BIT(2)
> +#define ZR36057_JMC_CFIFO_FB			BIT(1)
> +#define ZR36057_JMC_STLL_LIT_ENDIAN		BIT(0)
> +
> +/* JPEG Process Control */
> +#define ZR36057_JPC			0x104
> +#define ZR36057_JPC_P_RESET			BIT(7)
> +#define ZR36057_JPC_COD_TRNS_EN			BIT(5)
> +#define ZR36057_JPC_ACTIVE			BIT(0)
> +
> +/* Vertical Sync Parameters */
> +#define ZR36057_VSP			0x108
> +#define ZR36057_VSP_VSYNC_SIZE		16
> +#define ZR36057_VSP_FRM_TOT		0
> +
> +/* Horizontal Sync Parameters */
> +#define ZR36057_HSP			0x10c
> +#define ZR36057_HSP_HSYNC_START		16
> +#define ZR36057_HSP_LINE_TOT		0
> +
> +/* Field Horizontal Active Portion */
> +#define ZR36057_FHAP			0x110
> +#define ZR36057_FHAP_NAX		16
> +#define ZR36057_FHAP_PAX		0
> +
> +/* Field Vertical Active Portion */
> +#define ZR36057_FVAP			0x114
> +#define ZR36057_FVAP_NAY		16
> +#define ZR36057_FVAP_PAY		0
> +
> +/* Field Process Parameters */
> +#define ZR36057_FPP			0x118
> +#define ZR36057_FPP_ODD_EVEN			BIT(0)
> +
> +/* JPEG Code Base Address */
> +#define ZR36057_JCBA			0x11c
> +
> +/* JPEG Code FIFO Threshold */
> +#define ZR36057_JCFT			0x120
> +
> +/* JPEG Codec Guest ID */
> +#define ZR36057_JCGI			0x124
> +#define ZR36057_JCGI_JPE_GUEST_ID	4
> +#define ZR36057_JCGI_JPE_GUEST_REG	0
> +
> +/* GuestBus Control Register (2) */
> +#define ZR36057_GCR2			0x12c
> +
> +/* Post Office Register */
> +#define ZR36057_POR			0x200
> +#define ZR36057_POR_PO_PEN			BIT(25)
> +#define ZR36057_POR_PO_TIME			BIT(24)
> +#define ZR36057_POR_PO_DIR			BIT(23)
> +
> +/* "Still" Transfer Register */
> +#define ZR36057_STR			0x300
>
>  #endif
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHCgnP6Jr6TbjwUy%40kali.
>
