Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DFA345916
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 08:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhCWHvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 03:51:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:55086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229448AbhCWHvV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 03:51:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11621619BA;
        Tue, 23 Mar 2021 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616485881;
        bh=3uD8CzTOuC65CYbpaTP7r52DICy4NKsgZDbTk2Y/zYg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EqQd2mHSmebBpnK4kXDHco4OhdrWFRrAvOO8EhPfGcHHhwg/ybhmbjyvVXL4vbHRu
         tot/vIUOspavDdA62uIKfBAqLvmlb1+GHM4oAEIfDSTAmaIrJUji4ifKmUsqY34DC/
         qbkwtmkAnCXLExEFl0SxbSlmsyg6eTT7sp+eu4UehqFOYfTMtAzQeZkAr7KlWgbqxF
         QjpfRzURtFQ4Ecx7IbxOqE1BUYAQYyROtRsN00utBwNtaCZxE2Iz84DHoyGOg+bmKg
         ixkkXBt40+jxz6fWJjZS/oapOXNdd53BFf14FGIQgozWXda26lS5N26OtcaIAu3yyI
         hEvD9VL/QiFmA==
Date:   Tue, 23 Mar 2021 08:51:16 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: i2c: max9286: Use unsigned constants and
 BIT()
Message-ID: <20210323085116.7a6bd425@coco.lan>
In-Reply-To: <20210120154614.2750268-2-kieran.bingham+renesas@ideasonboard.com>
References: <20210120154614.2750268-1-kieran.bingham+renesas@ideasonboard.com>
        <20210120154614.2750268-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 20 Jan 2021 15:46:13 +0000
Kieran Bingham <kieran.bingham+renesas@ideasonboard.com> escreveu:

> Convert the bitfield definitions to use unsigned integers, and BIT()
> where appropriate.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix up single bit fields to use BIT
> 
>  drivers/media/i2c/max9286.c | 96 ++++++++++++++++++-------------------
>  1 file changed, 48 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index d0cb60521d87..66d3e046db97 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -31,85 +31,85 @@
>  #include <media/v4l2-subdev.h>
>  
>  /* Register 0x00 */
> -#define MAX9286_MSTLINKSEL_AUTO		(7 << 5)
> +#define MAX9286_MSTLINKSEL_AUTO		(7U << 5)
>  #define MAX9286_MSTLINKSEL(n)		((n) << 5)
>  #define MAX9286_EN_VS_GEN		BIT(4)
> -#define MAX9286_LINKEN(n)		(1 << (n))
> +#define MAX9286_LINKEN(n)		BIT(n)
>  /* Register 0x01 */
> -#define MAX9286_FSYNCMODE_ECU		(3 << 6)
> -#define MAX9286_FSYNCMODE_EXT		(2 << 6)
> -#define MAX9286_FSYNCMODE_INT_OUT	(1 << 6)
> -#define MAX9286_FSYNCMODE_INT_HIZ	(0 << 6)
> +#define MAX9286_FSYNCMODE_ECU		(3U << 6)
> +#define MAX9286_FSYNCMODE_EXT		(2U << 6)
> +#define MAX9286_FSYNCMODE_INT_OUT	(1U << 6)
> +#define MAX9286_FSYNCMODE_INT_HIZ	(0U << 6)

You should also use bit macros for bitmasks, e. g. GENMASK or GENMASK_ULL.

>  #define MAX9286_GPIEN			BIT(5)
>  #define MAX9286_ENLMO_RSTFSYNC		BIT(2)
> -#define MAX9286_FSYNCMETH_AUTO		(2 << 0)
> -#define MAX9286_FSYNCMETH_SEMI_AUTO	(1 << 0)
> -#define MAX9286_FSYNCMETH_MANUAL	(0 << 0)
> +#define MAX9286_FSYNCMETH_AUTO		(2U << 0)
> +#define MAX9286_FSYNCMETH_SEMI_AUTO	(1U << 0)
> +#define MAX9286_FSYNCMETH_MANUAL	(0U << 0)
>  #define MAX9286_REG_FSYNC_PERIOD_L	0x06
>  #define MAX9286_REG_FSYNC_PERIOD_M	0x07
>  #define MAX9286_REG_FSYNC_PERIOD_H	0x08
>  /* Register 0x0a */
> -#define MAX9286_FWDCCEN(n)		(1 << ((n) + 4))
> -#define MAX9286_REVCCEN(n)		(1 << (n))
> +#define MAX9286_FWDCCEN(n)		BIT((n) + 4)
> +#define MAX9286_REVCCEN(n)		BIT(n)
>  /* Register 0x0c */
>  #define MAX9286_HVEN			BIT(7)
> -#define MAX9286_EDC_6BIT_HAMMING	(2 << 5)
> -#define MAX9286_EDC_6BIT_CRC		(1 << 5)
> -#define MAX9286_EDC_1BIT_PARITY		(0 << 5)
> +#define MAX9286_EDC_6BIT_HAMMING	(2U << 5)
> +#define MAX9286_EDC_6BIT_CRC		(1U << 5)
> +#define MAX9286_EDC_1BIT_PARITY		(0U << 5)
>  #define MAX9286_DESEL			BIT(4)
>  #define MAX9286_INVVS			BIT(3)
>  #define MAX9286_INVHS			BIT(2)
> -#define MAX9286_HVSRC_D0		(2 << 0)
> -#define MAX9286_HVSRC_D14		(1 << 0)
> -#define MAX9286_HVSRC_D18		(0 << 0)
> +#define MAX9286_HVSRC_D0		(2U << 0)
> +#define MAX9286_HVSRC_D14		(1U << 0)
> +#define MAX9286_HVSRC_D18		(0U << 0)
>  /* Register 0x0f */
>  #define MAX9286_0X0F_RESERVED		BIT(3)
>  /* Register 0x12 */
>  #define MAX9286_CSILANECNT(n)		(((n) - 1) << 6)
>  #define MAX9286_CSIDBL			BIT(5)
>  #define MAX9286_DBL			BIT(4)
> -#define MAX9286_DATATYPE_USER_8BIT	(11 << 0)
> -#define MAX9286_DATATYPE_USER_YUV_12BIT	(10 << 0)
> -#define MAX9286_DATATYPE_USER_24BIT	(9 << 0)
> -#define MAX9286_DATATYPE_RAW14		(8 << 0)
> -#define MAX9286_DATATYPE_RAW11		(7 << 0)
> -#define MAX9286_DATATYPE_RAW10		(6 << 0)
> -#define MAX9286_DATATYPE_RAW8		(5 << 0)
> -#define MAX9286_DATATYPE_YUV422_10BIT	(4 << 0)
> -#define MAX9286_DATATYPE_YUV422_8BIT	(3 << 0)
> -#define MAX9286_DATATYPE_RGB555		(2 << 0)
> -#define MAX9286_DATATYPE_RGB565		(1 << 0)
> -#define MAX9286_DATATYPE_RGB888		(0 << 0)
> +#define MAX9286_DATATYPE_USER_8BIT	(11U << 0)
> +#define MAX9286_DATATYPE_USER_YUV_12BIT	(10U << 0)
> +#define MAX9286_DATATYPE_USER_24BIT	(9U << 0)
> +#define MAX9286_DATATYPE_RAW14		(8U << 0)
> +#define MAX9286_DATATYPE_RAW11		(7U << 0)
> +#define MAX9286_DATATYPE_RAW10		(6U << 0)
> +#define MAX9286_DATATYPE_RAW8		(5U << 0)
> +#define MAX9286_DATATYPE_YUV422_10BIT	(4U << 0)
> +#define MAX9286_DATATYPE_YUV422_8BIT	(3U << 0)
> +#define MAX9286_DATATYPE_RGB555		(2U << 0)
> +#define MAX9286_DATATYPE_RGB565		(1U << 0)
> +#define MAX9286_DATATYPE_RGB888		(0U << 0)
>  /* Register 0x15 */
>  #define MAX9286_VC(n)			((n) << 5)
>  #define MAX9286_VCTYPE			BIT(4)
>  #define MAX9286_CSIOUTEN		BIT(3)
> -#define MAX9286_0X15_RESV		(3 << 0)
> +#define MAX9286_0X15_RESV		(3U << 0)
>  /* Register 0x1b */
> -#define MAX9286_SWITCHIN(n)		(1 << ((n) + 4))
> -#define MAX9286_ENEQ(n)			(1 << (n))
> +#define MAX9286_SWITCHIN(n)		BIT((n) + 4)
> +#define MAX9286_ENEQ(n)			BIT(n)
>  /* Register 0x27 */
>  #define MAX9286_LOCKED			BIT(7)
>  /* Register 0x31 */
>  #define MAX9286_FSYNC_LOCKED		BIT(6)
>  /* Register 0x34 */
>  #define MAX9286_I2CLOCACK		BIT(7)
> -#define MAX9286_I2CSLVSH_1046NS_469NS	(3 << 5)
> -#define MAX9286_I2CSLVSH_938NS_352NS	(2 << 5)
> -#define MAX9286_I2CSLVSH_469NS_234NS	(1 << 5)
> -#define MAX9286_I2CSLVSH_352NS_117NS	(0 << 5)
> -#define MAX9286_I2CMSTBT_837KBPS	(7 << 2)
> -#define MAX9286_I2CMSTBT_533KBPS	(6 << 2)
> -#define MAX9286_I2CMSTBT_339KBPS	(5 << 2)
> -#define MAX9286_I2CMSTBT_173KBPS	(4 << 2)
> -#define MAX9286_I2CMSTBT_105KBPS	(3 << 2)
> -#define MAX9286_I2CMSTBT_84KBPS		(2 << 2)
> -#define MAX9286_I2CMSTBT_28KBPS		(1 << 2)
> -#define MAX9286_I2CMSTBT_8KBPS		(0 << 2)
> -#define MAX9286_I2CSLVTO_NONE		(3 << 0)
> -#define MAX9286_I2CSLVTO_1024US		(2 << 0)
> -#define MAX9286_I2CSLVTO_256US		(1 << 0)
> -#define MAX9286_I2CSLVTO_64US		(0 << 0)
> +#define MAX9286_I2CSLVSH_1046NS_469NS	(3U << 5)
> +#define MAX9286_I2CSLVSH_938NS_352NS	(2U << 5)
> +#define MAX9286_I2CSLVSH_469NS_234NS	(1U << 5)
> +#define MAX9286_I2CSLVSH_352NS_117NS	(0U << 5)
> +#define MAX9286_I2CMSTBT_837KBPS	(7U << 2)
> +#define MAX9286_I2CMSTBT_533KBPS	(6U << 2)
> +#define MAX9286_I2CMSTBT_339KBPS	(5U << 2)
> +#define MAX9286_I2CMSTBT_173KBPS	(4U << 2)
> +#define MAX9286_I2CMSTBT_105KBPS	(3U << 2)
> +#define MAX9286_I2CMSTBT_84KBPS		(2U << 2)
> +#define MAX9286_I2CMSTBT_28KBPS		(1U << 2)
> +#define MAX9286_I2CMSTBT_8KBPS		(0U << 2)
> +#define MAX9286_I2CSLVTO_NONE		(3U << 0)
> +#define MAX9286_I2CSLVTO_1024US		(2U << 0)
> +#define MAX9286_I2CSLVTO_256US		(1U << 0)
> +#define MAX9286_I2CSLVTO_64US		(0U << 0)
>  /* Register 0x3b */
>  #define MAX9286_REV_TRF(n)		((n) << 4)
>  #define MAX9286_REV_AMP(n)		((((n) - 30) / 10) << 1) /* in mV */



Thanks,
Mauro
