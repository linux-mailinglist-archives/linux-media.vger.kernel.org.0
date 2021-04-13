Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A2835E1D9
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 16:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345027AbhDMOrn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 10:47:43 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34541 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238171AbhDMOrl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 10:47:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WKJvlFbznMxedWKJylj3WG; Tue, 13 Apr 2021 16:47:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618325239; bh=anP9IqN9A8xsrahea21FJgK0DHxjvujnKAWwQt2DbNc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=L5K9i8Z4RgVUfP0go+amsV0Hh5wuH5mkWq/WgZQ3kLQbKfB5EyDt3rrnVU0SLXNTR
         KphT7/o25amFe4kwd37Du0qozW181cmWiM4/LArFepeq85LiU3RnqfVazvUpgSP+7x
         yENrOe7hLQPjBdMIBIxWZrHqT+awNuLlp9YJDsxb0G9xawn7uASNGsoWC0QVPegm/1
         p3i2wiEUCGS6ivnXk8lT0CZMhBg1MDV6Sql8pS4vJFQuThHY8O6eFInrn6cx7UL0JH
         2A+0prU5p1XtBilkC5xVXtE+brvajRc8S4za6FH5A9oqYuB1Dis84bCuggYb3dLr4X
         HHNruGnsTZwzg==
Subject: Re: [PATCH v3 2/2] staging: media: zoran: align code appropriately
To:     Mitali Borkar <mitaliborkar810@gmail.com>, clabbe@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
References: <cover.1618066787.git.mitaliborkar810@gmail.com>
 <bf18b0301f10dae2d2151839b02c3202093940b3.1618066787.git.mitaliborkar810@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9e563bdb-4f6a-485f-9108-0005277eae77@xs4all.nl>
Date:   Tue, 13 Apr 2021 16:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bf18b0301f10dae2d2151839b02c3202093940b3.1618066787.git.mitaliborkar810@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBoGu1JSDDziLmtbsOiHaiIepNiPB8LTK8LvNoVoiLkEQdg+aXiBXIeONdsbqgSrv7Bl2Jfu763VABeuqOZYfF4YGIKPC+9vFTXbWiAykne726OSxRrR
 XMBQNeEqGQrciLgrdetXOtCmbtQep6PlEgaDtC5Q/NytUiS750J5myek/zoONqcbzGD+Aby4S86QLSSGciFH1Ds3hE1JHTSyKbGWpwVGvrjNpYFKhraPv1Nr
 uIFRzHbAHExFEGRQzWUDl8yf/6q8n9uc7DY1P10fhnrUxiLRyaT2JyTLZeDpHcEcxa1VvOgUmVyf4XovCXQuYzCZQQykXmfkAXF4+nCQY1hA9h7rb7RL0/uw
 KPreROu/JQ4YLkperyIB++DWkuh33UFg28Xy5/D74h4dKvnFXgqLoVvuYZvmk7MzD92eamIJYx3CWGabCOMllQEjOefWTEg5tWq3MpgM6euZ9xOw9ZJCzhWW
 Asj6h2MdXJdm3h52nDaD67q6p2L97mbB0WcOzw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/04/2021 17:34, Mitali Borkar wrote:
> Aligned the code properly by using tabs to make code neater and improve
> readability.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/zoran/zr36057.h | 108 +++++++++++++-------------
>  1 file changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
> index 198d344a8879..db42f445248f 100644
> --- a/drivers/staging/media/zoran/zr36057.h
> +++ b/drivers/staging/media/zoran/zr36057.h
> @@ -13,28 +13,28 @@
>  /* Zoran ZR36057 registers */
>  
>  /* Video Front End, Horizontal Configuration Register */
> -#define ZR36057_VFEHCR			0x000
> +#define ZR36057_VFEHCR				0x000
>  #define ZR36057_VFEHCR_HS_POL			BIT(30)

Same issue as the other patches: this patch depends on other local changes
so won't apply to mainline code...

Regards,

	Hans

> -#define ZR36057_VFEHCR_H_START		10
> -#define ZR36057_VFEHCR_H_END		0
> -#define ZR36057_VFEHCR_HMASK		0x3ff
> +#define ZR36057_VFEHCR_H_START			10
> +#define ZR36057_VFEHCR_H_END			0
> +#define ZR36057_VFEHCR_HMASK			0x3ff
>  
>  /* Video Front End, Vertical Configuration Register */
> -#define ZR36057_VFEVCR			0x004
> +#define ZR36057_VFEVCR				0x004
>  #define ZR36057_VFEVCR_VS_POL			BIT(30)
> -#define ZR36057_VFEVCR_V_START		10
> -#define ZR36057_VFEVCR_V_END		0
> -#define ZR36057_VFEVCR_VMASK		0x3ff
> +#define ZR36057_VFEVCR_V_START			10
> +#define ZR36057_VFEVCR_V_END			0
> +#define ZR36057_VFEVCR_VMASK			0x3ff
>  
>  /* Video Front End, Scaler and Pixel Format Register */
>  #define ZR36057_VFESPFR			0x008
>  #define ZR36057_VFESPFR_EXT_FL			BIT(26)
>  #define ZR36057_VFESPFR_TOP_FIELD		BIT(25)
>  #define ZR36057_VFESPFR_VCLK_POL		BIT(24)
> -#define ZR36057_VFESPFR_H_FILTER	21
> +#define ZR36057_VFESPFR_H_FILTER		21
>  #define ZR36057_VFESPFR_HOR_DCM		14
>  #define ZR36057_VFESPFR_VER_DCM		8
> -#define ZR36057_VFESPFR_DISP_MODE	6
> +#define ZR36057_VFESPFR_DISP_MODE		6
>  #define ZR36057_VFESPFR_YUV422			(0 << 3)
>  #define ZR36057_VFESPFR_RGB888			BIT(3)
>  #define ZR36057_VFESPFR_RGB565			(2 << 3)
> @@ -44,34 +44,34 @@
>  #define ZR36057_VFESPFR_LITTLE_ENDIAN		BIT(0)
>  
>  /* Video Display "Top" Register */
> -#define ZR36057_VDTR			0x00c
> +#define ZR36057_VDTR				0x00c
>  
>  /* Video Display "Bottom" Register */
> -#define ZR36057_VDBR			0x010
> +#define ZR36057_VDBR				0x010
>  
>  /* Video Stride, Status, and Frame Grab Register */
> -#define ZR36057_VSSFGR			0x014
> -#define ZR36057_VSSFGR_DISP_STRIDE	16
> +#define ZR36057_VSSFGR				0x014
> +#define ZR36057_VSSFGR_DISP_STRIDE		16
>  #define ZR36057_VSSFGR_VID_OVF			BIT(8)
>  #define ZR36057_VSSFGR_SNAP_SHOT		BIT(1)
>  #define ZR36057_VSSFGR_FRAME_GRAB		BIT(0)
>  
>  /* Video Display Configuration Register */
> -#define ZR36057_VDCR			0x018
> +#define ZR36057_VDCR				0x018
>  #define ZR36057_VDCR_VID_EN			BIT(31)
> -#define ZR36057_VDCR_MIN_PIX		24
> +#define ZR36057_VDCR_MIN_PIX			24
>  #define ZR36057_VDCR_TRITON			BIT(24)
>  #define ZR36057_VDCR_VID_WIN_HT		12
> -#define ZR36057_VDCR_VID_WIN_WID	0
> +#define ZR36057_VDCR_VID_WIN_WID		0
>  
>  /* Masking Map "Top" Register */
> -#define ZR36057_MMTR			0x01c
> +#define ZR36057_MMTR				0x01c
>  
>  /* Masking Map "Bottom" Register */
> -#define ZR36057_MMBR			0x020
> +#define ZR36057_MMBR				0x020
>  
>  /* Overlay Control Register */
> -#define ZR36057_OCR			0x024
> +#define ZR36057_OCR				0x024
>  #define ZR36057_OCR_OVL_ENABLE			BIT(15)
>  #define ZR36057_OCR_MASK_STRIDE		0
>  
> @@ -83,42 +83,42 @@
>  #define ZR36057_GPPGCR1			0x02c
>  
>  /* MPEG Code Source Address Register */
> -#define ZR36057_MCSAR			0x030
> +#define ZR36057_MCSAR				0x030
>  
>  /* MPEG Code Transfer Control Register */
> -#define ZR36057_MCTCR			0x034
> +#define ZR36057_MCTCR				0x034
>  #define ZR36057_MCTCR_COD_TIME			BIT(30)
>  #define ZR36057_MCTCR_C_EMPTY			BIT(29)
>  #define ZR36057_MCTCR_C_FLUSH			BIT(28)
> -#define ZR36057_MCTCR_COD_GUEST_ID	20
> -#define ZR36057_MCTCR_COD_GUEST_REG	16
> +#define ZR36057_MCTCR_COD_GUEST_ID		20
> +#define ZR36057_MCTCR_COD_GUEST_REG		16
>  
>  /* MPEG Code Memory Pointer Register */
> -#define ZR36057_MCMPR			0x038
> +#define ZR36057_MCMPR				0x038
>  
>  /* Interrupt Status Register */
> -#define ZR36057_ISR			0x03c
> +#define ZR36057_ISR				0x03c
>  #define ZR36057_ISR_GIRQ1			BIT(30)
>  #define ZR36057_ISR_GIRQ0			BIT(29)
> -#define ZR36057_ISR_COD_REP_IRQ			BIT(28)
> +#define ZR36057_ISR_COD_REP_IRQ		BIT(28)
>  #define ZR36057_ISR_JPEG_REP_IRQ		BIT(27)
>  
>  /* Interrupt Control Register */
> -#define ZR36057_ICR			0x040
> +#define ZR36057_ICR				0x040
>  #define ZR36057_ICR_GIRQ1			BIT(30)
>  #define ZR36057_ICR_GIRQ0			BIT(29)
> -#define ZR36057_ICR_COD_REP_IRQ			BIT(28)
> +#define ZR36057_ICR_COD_REP_IRQ		BIT(28)
>  #define ZR36057_ICR_JPEG_REP_IRQ		BIT(27)
>  #define ZR36057_ICR_INT_PIN_EN			BIT(24)
>  
>  /* I2C Bus Register */
> -#define ZR36057_I2CBR			0x044
> +#define ZR36057_I2CBR				0x044
>  #define ZR36057_I2CBR_SDA			BIT(1)
>  #define ZR36057_I2CBR_SCL			BIT(0)
>  
>  /* JPEG Mode and Control */
> -#define ZR36057_JMC			0x100
> -#define ZR36057_JMC_JPG				BIT(31)
> +#define ZR36057_JMC				0x100
> +#define ZR36057_JMC_JPG			BIT(31)
>  #define ZR36057_JMC_JPG_EXP_MODE		(0 << 29)
>  #define ZR36057_JMC_JPG_CMP_MODE		BIT(29)
>  #define ZR36057_JMC_MJPG_EXP_MODE		(2 << 29)
> @@ -132,56 +132,56 @@
>  #define ZR36057_JMC_STLL_LIT_ENDIAN		BIT(0)
>  
>  /* JPEG Process Control */
> -#define ZR36057_JPC			0x104
> +#define ZR36057_JPC				0x104
>  #define ZR36057_JPC_P_RESET			BIT(7)
> -#define ZR36057_JPC_COD_TRNS_EN			BIT(5)
> +#define ZR36057_JPC_COD_TRNS_EN		BIT(5)
>  #define ZR36057_JPC_ACTIVE			BIT(0)
>  
>  /* Vertical Sync Parameters */
> -#define ZR36057_VSP			0x108
> -#define ZR36057_VSP_VSYNC_SIZE		16
> -#define ZR36057_VSP_FRM_TOT		0
> +#define ZR36057_VSP				0x108
> +#define ZR36057_VSP_VSYNC_SIZE			16
> +#define ZR36057_VSP_FRM_TOT			0
>  
>  /* Horizontal Sync Parameters */
> -#define ZR36057_HSP			0x10c
> +#define ZR36057_HSP				0x10c
>  #define ZR36057_HSP_HSYNC_START		16
> -#define ZR36057_HSP_LINE_TOT		0
> +#define ZR36057_HSP_LINE_TOT			0
>  
>  /* Field Horizontal Active Portion */
> -#define ZR36057_FHAP			0x110
> -#define ZR36057_FHAP_NAX		16
> -#define ZR36057_FHAP_PAX		0
> +#define ZR36057_FHAP				0x110
> +#define ZR36057_FHAP_NAX			16
> +#define ZR36057_FHAP_PAX			0
>  
>  /* Field Vertical Active Portion */
> -#define ZR36057_FVAP			0x114
> -#define ZR36057_FVAP_NAY		16
> -#define ZR36057_FVAP_PAY		0
> +#define ZR36057_FVAP				0x114
> +#define ZR36057_FVAP_NAY			16
> +#define ZR36057_FVAP_PAY			0
>  
>  /* Field Process Parameters */
> -#define ZR36057_FPP			0x118
> +#define ZR36057_FPP				0x118
>  #define ZR36057_FPP_ODD_EVEN			BIT(0)
>  
>  /* JPEG Code Base Address */
> -#define ZR36057_JCBA			0x11c
> +#define ZR36057_JCBA				0x11c
>  
>  /* JPEG Code FIFO Threshold */
> -#define ZR36057_JCFT			0x120
> +#define ZR36057_JCFT				0x120
>  
>  /* JPEG Codec Guest ID */
> -#define ZR36057_JCGI			0x124
> -#define ZR36057_JCGI_JPE_GUEST_ID	4
> -#define ZR36057_JCGI_JPE_GUEST_REG	0
> +#define ZR36057_JCGI				0x124
> +#define ZR36057_JCGI_JPE_GUEST_ID		4
> +#define ZR36057_JCGI_JPE_GUEST_REG		0
>  
>  /* GuestBus Control Register (2) */
> -#define ZR36057_GCR2			0x12c
> +#define ZR36057_GCR2				0x12c
>  
>  /* Post Office Register */
> -#define ZR36057_POR			0x200
> +#define ZR36057_POR				0x200
>  #define ZR36057_POR_PO_PEN			BIT(25)
>  #define ZR36057_POR_PO_TIME			BIT(24)
>  #define ZR36057_POR_PO_DIR			BIT(23)
>  
>  /* "Still" Transfer Register */
> -#define ZR36057_STR			0x300
> +#define ZR36057_STR				0x300
>  
>  #endif
> 

