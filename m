Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E80F35AD94
	for <lists+linux-media@lfdr.de>; Sat, 10 Apr 2021 15:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234749AbhDJN1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Apr 2021 09:27:45 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:51025
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234091AbhDJN1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Apr 2021 09:27:45 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A6v1nJa5wq/cPKY0EBwPXwCnXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/2/hfhz726RtB89UGwt8OrqBICuWnXZnKQe3aAwOvOYUBDiqC?=
 =?us-ascii?q?+UKuhZjLfK5x3FN2nA+vVG1aFmGpIObeHYKVRhl8717E2ZPr8boOWvy6yjiefA?=
 =?us-ascii?q?w3oFd2gDV4ha4wh0EQqdGEFtLTM2ZqYRLoaW5cZMulObF0g/U8LTPBU4dtTYq8?=
 =?us-ascii?q?aOvJzrZgNuPW9E1CC+yQLt0rL8HhSCty1ybxpEy94ZnlT4rw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,210,1613430000"; 
   d="scan'208";a="378287059"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Apr 2021 15:27:29 +0200
Date:   Sat, 10 Apr 2021 15:27:28 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Mitali Borkar <mitaliborkar810@gmail.com>
cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH v2 2/2] staging: media: zoran: remove
 and add comments; align code
In-Reply-To: <YHGkxRJ8S22/ZqDZ@kali>
Message-ID: <alpine.DEB.2.22.394.2104101525250.2975@hadrien>
References: <YHCgnP6Jr6TbjwUy@kali> <alpine.DEB.2.22.394.2104092209200.23056@hadrien> <YHDR7VxighihfZd5@kali> <alpine.DEB.2.22.394.2104101354180.2975@hadrien> <YHGkxRJ8S22/ZqDZ@kali>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Mam, my new patch is ready but I am not sure how to send, the v1/2 is
> not on top, I have not made changes in it because it was not required. Now,  how to
> send these two mails as a patchset, since in between these two git
> commits, I have another commits too.

Suppose you have

relevant patch1
patch on some other file
relevant patch2

Then you can use git rebase -i HEAD~3 to reorder them, ie to put relevant
patch2 before patch on some other file.  When you do the git rebase, just
move the lines for the different patches around and save the changes.

julia

>
> > julia
> >
> > > > > +#define ZR36057_VFESPFR_RGB565			(2 << 3)
> > > > > +#define ZR36057_VFESPFR_RGB555			(3 << 3)
> > > > > +#define ZR36057_VFESPFR_ERR_DIF			BIT(2)
> > > > > +#define ZR36057_VFESPFR_PACK24			BIT(1)
> > > > > +#define ZR36057_VFESPFR_LITTLE_ENDIAN		BIT(0)
> > > > > +
> > > > > +/* Video Display "Top" Register */
> > > > > +#define ZR36057_VDTR			0x00c
> > > > > +
> > > > > +/* Video Display "Bottom" Register */
> > > > > +#define ZR36057_VDBR			0x010
> > > > > +
> > > > > +/* Video Stride, Status, and Frame Grab Register */
> > > > > +#define ZR36057_VSSFGR			0x014
> > > > > +#define ZR36057_VSSFGR_DISP_STRIDE	16
> > > > > +#define ZR36057_VSSFGR_VID_OVF			BIT(8)
> > > > > +#define ZR36057_VSSFGR_SNAP_SHOT		BIT(1)
> > > > > +#define ZR36057_VSSFGR_FRAME_GRAB		BIT(0)
> > > > > +
> > > > > +/* Video Display Configuration Register */
> > > > > +#define ZR36057_VDCR			0x018
> > > > > +#define ZR36057_VDCR_VID_EN			BIT(31)
> > > > > +#define ZR36057_VDCR_MIN_PIX		24
> > > > > +#define ZR36057_VDCR_TRITON			BIT(24)
> > > > > +#define ZR36057_VDCR_VID_WIN_HT		12
> > > >
> > > > These don't look well aligned either.
> > > >
> > > > Please check on the rest.
> > > >
> > > Yes Ma'am, I am rechecking this.
> > >
> > > > julia
> > > >
> > > >
> > > > > +#define ZR36057_VDCR_VID_WIN_WID	0
> > > > > +
> > > > > +/* Masking Map "Top" Register */
> > > > > +#define ZR36057_MMTR			0x01c
> > > > > +
> > > > > +/* Masking Map "Bottom" Register */
> > > > > +#define ZR36057_MMBR			0x020
> > > > > +
> > > > > +/* Overlay Control Register */
> > > > > +#define ZR36057_OCR			0x024
> > > > > +#define ZR36057_OCR_OVL_ENABLE			BIT(15)
> > > > > +#define ZR36057_OCR_MASK_STRIDE		0
> > > > > +
> > > > > +/* System, PCI, and General Purpose Pins Control Register */
> > > > > +#define ZR36057_SPGPPCR			0x028
> > > > > +#define ZR36057_SPGPPCR_SOFT_RESET		BIT(24)
> > > > > +
> > > > > +/* General Purpose Pins and GuestBus Control Register (1) */
> > > > > +#define ZR36057_GPPGCR1			0x02c
> > > > > +
> > > > > +/* MPEG Code Source Address Register */
> > > > > +#define ZR36057_MCSAR			0x030
> > > > > +
> > > > > +/* MPEG Code Transfer Control Register */
> > > > > +#define ZR36057_MCTCR			0x034
> > > > > +#define ZR36057_MCTCR_COD_TIME			BIT(30)
> > > > > +#define ZR36057_MCTCR_C_EMPTY			BIT(29)
> > > > > +#define ZR36057_MCTCR_C_FLUSH			BIT(28)
> > > > >  #define ZR36057_MCTCR_COD_GUEST_ID	20
> > > > >  #define ZR36057_MCTCR_COD_GUEST_REG	16
> > > > >
> > > > > -#define ZR36057_MCMPR           0x038	/* MPEG Code Memory Pointer Register */
> > > > > -
> > > > > -#define ZR36057_ISR             0x03c	/* Interrupt Status Register */
> > > > > -#define ZR36057_ISR_GIRQ1                BIT(30)
> > > > > -#define ZR36057_ISR_GIRQ0                BIT(29)
> > > > > -#define ZR36057_ISR_COD_REP_IRQ            BIT(28)
> > > > > -#define ZR36057_ISR_JPEG_REP_IRQ           BIT(27)
> > > > > -
> > > > > -#define ZR36057_ICR             0x040	/* Interrupt Control Register */
> > > > > -#define ZR36057_ICR_GIRQ1                BIT(30)
> > > > > -#define ZR36057_ICR_GIRQ0                BIT(29)
> > > > > -#define ZR36057_ICR_COD_REP_IRQ            BIT(28)
> > > > > -#define ZR36057_ICR_JPEG_REP_IRQ           BIT(27)
> > > > > -#define ZR36057_ICR_INT_PIN_EN             BIT(24)
> > > > > -
> > > > > -#define ZR36057_I2CBR           0x044	/* I2C Bus Register */
> > > > > -#define ZR36057_I2CBR_SDA		 BIT(1)
> > > > > -#define ZR36057_I2CBR_SCL		 BIT(0)
> > > > > -
> > > > > -#define ZR36057_JMC             0x100	/* JPEG Mode and Control */
> > > > > -#define ZR36057_JMC_JPG                  BIT(31)
> > > > > -#define ZR36057_JMC_JPG_EXP_MODE          (0 << 29)
> > > > > -#define ZR36057_JMC_JPG_CMP_MODE           BIT(29)
> > > > > -#define ZR36057_JMC_MJPG_EXP_MODE         (2 << 29)
> > > > > -#define ZR36057_JMC_MJPG_CMP_MODE         (3 << 29)
> > > > > -#define ZR36057_JMC_RTBUSY_FB            BIT(6)
> > > > > -#define ZR36057_JMC_GO_EN                BIT(5)
> > > > > -#define ZR36057_JMC_SYNC_MSTR             BIT(4)
> > > > > -#define ZR36057_JMC_FLD_PER_BUFF         BIT(3)
> > > > > -#define ZR36057_JMC_VFIFO_FB             BIT(2)
> > > > > -#define ZR36057_JMC_CFIFO_FB             BIT(1)
> > > > > -#define ZR36057_JMC_STLL_LIT_ENDIAN       BIT(0)
> > > > > -
> > > > > -#define ZR36057_JPC             0x104	/* JPEG Process Control */
> > > > > -#define ZR36057_JPC_P_RESET              BIT(7)
> > > > > -#define ZR36057_JPC_COD_TRNS_EN            BIT(5)
> > > > > -#define ZR36057_JPC_ACTIVE               BIT(0)
> > > > > -
> > > > > -#define ZR36057_VSP             0x108	/* Vertical Sync Parameters */
> > > > > -#define ZR36057_VSP_VSYNC_SIZE           16
> > > > > -#define ZR36057_VSP_FRM_TOT              0
> > > > > -
> > > > > -#define ZR36057_HSP             0x10c	/* Horizontal Sync Parameters */
> > > > > -#define ZR36057_HSP_HSYNC_START          16
> > > > > -#define ZR36057_HSP_LINE_TOT             0
> > > > > -
> > > > > -#define ZR36057_FHAP            0x110	/* Field Horizontal Active Portion */
> > > > > -#define ZR36057_FHAP_NAX                16
> > > > > -#define ZR36057_FHAP_PAX                0
> > > > > -
> > > > > -#define ZR36057_FVAP            0x114	/* Field Vertical Active Portion */
> > > > > -#define ZR36057_FVAP_NAY                16
> > > > > -#define ZR36057_FVAP_PAY                0
> > > > > -
> > > > > -#define ZR36057_FPP             0x118	/* Field Process Parameters */
> > > > > -#define ZR36057_FPP_ODD_EVEN             BIT(0)
> > > > > -
> > > > > -#define ZR36057_JCBA            0x11c	/* JPEG Code Base Address */
> > > > > -
> > > > > -#define ZR36057_JCFT            0x120	/* JPEG Code FIFO Threshold */
> > > > > -
> > > > > -#define ZR36057_JCGI            0x124	/* JPEG Codec Guest ID */
> > > > > -#define ZR36057_JCGI_JPE_GUEST_ID         4
> > > > > -#define ZR36057_JCGI_JPE_GUEST_REG        0
> > > > > -
> > > > > -#define ZR36057_GCR2            0x12c	/* GuestBus Control Register (2) */
> > > > > -
> > > > > -#define ZR36057_POR             0x200	/* Post Office Register */
> > > > > -#define ZR36057_POR_PO_PEN                BIT(25)
> > > > > -#define ZR36057_POR_PO_TIME               BIT(24)
> > > > > -#define ZR36057_POR_PO_DIR                BIT(23)
> > > > > -
> > > > > -#define ZR36057_STR             0x300	/* "Still" Transfer Register */
> > > > > +/* MPEG Code Memory Pointer Register */
> > > > > +#define ZR36057_MCMPR			0x038
> > > > > +
> > > > > +/* Interrupt Status Register */
> > > > > +#define ZR36057_ISR			0x03c
> > > > > +#define ZR36057_ISR_GIRQ1			BIT(30)
> > > > > +#define ZR36057_ISR_GIRQ0			BIT(29)
> > > > > +#define ZR36057_ISR_COD_REP_IRQ			BIT(28)
> > > > > +#define ZR36057_ISR_JPEG_REP_IRQ		BIT(27)
> > > > > +
> > > > > +/* Interrupt Control Register */
> > > > > +#define ZR36057_ICR			0x040
> > > > > +#define ZR36057_ICR_GIRQ1			BIT(30)
> > > > > +#define ZR36057_ICR_GIRQ0			BIT(29)
> > > > > +#define ZR36057_ICR_COD_REP_IRQ			BIT(28)
> > > > > +#define ZR36057_ICR_JPEG_REP_IRQ		BIT(27)
> > > > > +#define ZR36057_ICR_INT_PIN_EN			BIT(24)
> > > > > +
> > > > > +/* I2C Bus Register */
> > > > > +#define ZR36057_I2CBR			0x044
> > > > > +#define ZR36057_I2CBR_SDA			BIT(1)
> > > > > +#define ZR36057_I2CBR_SCL			BIT(0)
> > > > > +
> > > > > +/* JPEG Mode and Control */
> > > > > +#define ZR36057_JMC			0x100
> > > > > +#define ZR36057_JMC_JPG				BIT(31)
> > > > > +#define ZR36057_JMC_JPG_EXP_MODE		(0 << 29)
> > > > > +#define ZR36057_JMC_JPG_CMP_MODE		BIT(29)
> > > > > +#define ZR36057_JMC_MJPG_EXP_MODE		(2 << 29)
> > > > > +#define ZR36057_JMC_MJPG_CMP_MODE		(3 << 29)
> > > > > +#define ZR36057_JMC_RTBUSY_FB			BIT(6)
> > > > > +#define ZR36057_JMC_GO_EN			BIT(5)
> > > > > +#define ZR36057_JMC_SYNC_MSTR			BIT(4)
> > > > > +#define ZR36057_JMC_FLD_PER_BUFF		BIT(3)
> > > > > +#define ZR36057_JMC_VFIFO_FB			BIT(2)
> > > > > +#define ZR36057_JMC_CFIFO_FB			BIT(1)
> > > > > +#define ZR36057_JMC_STLL_LIT_ENDIAN		BIT(0)
> > > > > +
> > > > > +/* JPEG Process Control */
> > > > > +#define ZR36057_JPC			0x104
> > > > > +#define ZR36057_JPC_P_RESET			BIT(7)
> > > > > +#define ZR36057_JPC_COD_TRNS_EN			BIT(5)
> > > > > +#define ZR36057_JPC_ACTIVE			BIT(0)
> > > > > +
> > > > > +/* Vertical Sync Parameters */
> > > > > +#define ZR36057_VSP			0x108
> > > > > +#define ZR36057_VSP_VSYNC_SIZE		16
> > > > > +#define ZR36057_VSP_FRM_TOT		0
> > > > > +
> > > > > +/* Horizontal Sync Parameters */
> > > > > +#define ZR36057_HSP			0x10c
> > > > > +#define ZR36057_HSP_HSYNC_START		16
> > > > > +#define ZR36057_HSP_LINE_TOT		0
> > > > > +
> > > > > +/* Field Horizontal Active Portion */
> > > > > +#define ZR36057_FHAP			0x110
> > > > > +#define ZR36057_FHAP_NAX		16
> > > > > +#define ZR36057_FHAP_PAX		0
> > > > > +
> > > > > +/* Field Vertical Active Portion */
> > > > > +#define ZR36057_FVAP			0x114
> > > > > +#define ZR36057_FVAP_NAY		16
> > > > > +#define ZR36057_FVAP_PAY		0
> > > > > +
> > > > > +/* Field Process Parameters */
> > > > > +#define ZR36057_FPP			0x118
> > > > > +#define ZR36057_FPP_ODD_EVEN			BIT(0)
> > > > > +
> > > > > +/* JPEG Code Base Address */
> > > > > +#define ZR36057_JCBA			0x11c
> > > > > +
> > > > > +/* JPEG Code FIFO Threshold */
> > > > > +#define ZR36057_JCFT			0x120
> > > > > +
> > > > > +/* JPEG Codec Guest ID */
> > > > > +#define ZR36057_JCGI			0x124
> > > > > +#define ZR36057_JCGI_JPE_GUEST_ID	4
> > > > > +#define ZR36057_JCGI_JPE_GUEST_REG	0
> > > > > +
> > > > > +/* GuestBus Control Register (2) */
> > > > > +#define ZR36057_GCR2			0x12c
> > > > > +
> > > > > +/* Post Office Register */
> > > > > +#define ZR36057_POR			0x200
> > > > > +#define ZR36057_POR_PO_PEN			BIT(25)
> > > > > +#define ZR36057_POR_PO_TIME			BIT(24)
> > > > > +#define ZR36057_POR_PO_DIR			BIT(23)
> > > > > +
> > > > > +/* "Still" Transfer Register */
> > > > > +#define ZR36057_STR			0x300
> > > > >
> > > > >  #endif
> > > > > --
> > > > > 2.30.2
> > > > >
> > > > > --
> > > > > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > > > > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > > > > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHCgnP6Jr6TbjwUy%40kali.
> > > > >
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YHDR7VxighihfZd5%40kali.
> > >
>
