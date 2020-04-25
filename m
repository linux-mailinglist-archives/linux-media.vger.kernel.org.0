Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312921B8522
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 11:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgDYJRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 05:17:44 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:35587 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725837AbgDYJRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 05:17:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SGwKjMyDilKa1SGwNjTMdn; Sat, 25 Apr 2020 11:17:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587806260; bh=IL+cBrSdrf5mHSNS3ugipWYC+HFR9jntLFaxtqRICU4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pnGJQegbUuvE65dR2J9Nxzzrxmi+SiTnknRE9/dKO1f4zhctciD5s3pi0y/c9XXPP
         KTLIuRslQWoJaClp5AkRIstMFV3IuKVM2Pqt78gdZgeNjfqnO++p3OR60+77f3mLCN
         eK3Ve0fBzC3Zpbvm+qpq1zAwiatnO2ytixOyUxt7BU7nvNyLyCOuJS4/g8OGw9xmiW
         eJYLvZavz1MowCYZkwhNDY96FsQ4ifSV/RCywGRCoSHEiOeMIEhizsm757CXEAebJA
         adLaS3sTmrVhbcWa3jk3i80VIlRt48s/pHh9sB2XBwllferLNJDaOK92ChG59kc+zx
         5bzzFWbYgR5HQ==
Subject: Re: [PATCH 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller
 driver
To:     Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200424053819.220276-1-jnchase@google.com>
 <20200424053819.220276-2-jnchase@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <51d31f54-6ec6-b94a-3aed-c56a52232e15@xs4all.nl>
Date:   Sat, 25 Apr 2020 11:17:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200424053819.220276-2-jnchase@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA/xqxNZIOwONR4QNobRSZUwrXv+7PwJo3nAxBG0b60kvb1Xw2WVoBJQZrn+FOYV7/3dKcix/ddH1eIDkU4dgC6/9+P854RttTg7P3dgbkXGTSuejMle
 CU5yuvKsardKDerlJ7R0IiH4shI+VPI56CWc6YuiKoZq6Awwl3B6F/6IhXWhm0zXFTtgLIgGmTJV7DB66a0SAkPGh8Lgaw/Xg94jwCOB8Yyjx/xbxGYEjQXi
 lZaPKFQGAHIrQBDB1nAaxtPH4SatqK9xESbmV4xbJGxF76+E/MlpHW5s39kgly0+Go4mqBBvHkra+0lghyPATA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/04/2020 07:38, Jeff Chase wrote:
> Add a CEC device driver for the Chrontel ch7322 CEC conroller.
> This is an I2C device capable of sending and receiving CEC messages.
> 
> Signed-off-by: Jeff Chase <jnchase@google.com>
> ---
>  MAINTAINERS                    |   7 +
>  drivers/media/cec/Kconfig      |   1 +
>  drivers/media/cec/Makefile     |   2 +-
>  drivers/media/cec/i2c/Kconfig  |  14 +
>  drivers/media/cec/i2c/Makefile |   5 +
>  drivers/media/cec/i2c/ch7322.c | 455 +++++++++++++++++++++++++++++++++
>  6 files changed, 483 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/cec/i2c/Kconfig
>  create mode 100644 drivers/media/cec/i2c/Makefile
>  create mode 100644 drivers/media/cec/i2c/ch7322.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d633a131dcd7..d43f5146cad6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4047,6 +4047,13 @@ F:	drivers/power/supply/cros_usbpd-charger.c
>  N:	cros_ec
>  N:	cros-ec
>  
> +CHRONTEL CH7322 CEC DRIVER
> +M:	Jeff Chase <jnchase@google.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	drivers/media/cec/i2c/ch7322.c
> +
>  CIRRUS LOGIC AUDIO CODEC DRIVERS
>  M:	James Schulman <james.schulman@cirrus.com>
>  M:	David Rhodes <david.rhodes@cirrus.com>
> diff --git a/drivers/media/cec/Kconfig b/drivers/media/cec/Kconfig
> index eea74b7cfa8c..3e934aa239ab 100644
> --- a/drivers/media/cec/Kconfig
> +++ b/drivers/media/cec/Kconfig
> @@ -33,6 +33,7 @@ menuconfig MEDIA_CEC_SUPPORT
>  	  adapter that supports HDMI CEC.
>  
>  if MEDIA_CEC_SUPPORT
> +source "drivers/media/cec/i2c/Kconfig"
>  source "drivers/media/cec/platform/Kconfig"
>  source "drivers/media/cec/usb/Kconfig"
>  endif
> diff --git a/drivers/media/cec/Makefile b/drivers/media/cec/Makefile
> index 74e80e1b3571..23539339bc81 100644
> --- a/drivers/media/cec/Makefile
> +++ b/drivers/media/cec/Makefile
> @@ -1,2 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-y += core/ platform/ usb/
> +obj-y += core/ i2c/ platform/ usb/
> diff --git a/drivers/media/cec/i2c/Kconfig b/drivers/media/cec/i2c/Kconfig
> new file mode 100644
> index 000000000000..e445ca2110b3
> --- /dev/null
> +++ b/drivers/media/cec/i2c/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# I2C drivers
> +
> +config CEC_CH7322
> +	tristate "Chrontel CH7322 CEC controller"
> +	select I2C
> +	select REGMAP_I2C
> +	select CEC_CORE
> +	help
> +	  This is a driver for the Chrontel CH7322 CEC controller. It uses the
> +	  generic CEC framework interface.
> +	  CEC bus is present in the HDMI connector and enables communication
> +	  between compatible devices.
> diff --git a/drivers/media/cec/i2c/Makefile b/drivers/media/cec/i2c/Makefile
> new file mode 100644
> index 000000000000..d7496dfd0fa4
> --- /dev/null
> +++ b/drivers/media/cec/i2c/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for the CEC I2C device drivers.
> +#
> +obj-$(CONFIG_CEC_CH7322) += ch7322.o
> diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
> new file mode 100644
> index 000000000000..a9d66ec26440
> --- /dev/null
> +++ b/drivers/media/cec/i2c/ch7322.c
> @@ -0,0 +1,455 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the Chrontel CH7322 CEC Controller
> + *
> + * Copyright 2020 Google LLC.
> + */
> +#include <linux/cec.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <media/cec.h>
> +
> +#define CH7322_WRITE		0x00
> +#define CH7322_WRITE_MSENT		0x80
> +#define CH7322_WRITE_BOK		0x40
> +#define CH7322_WRITE_NMASK		0x0F
> +
> +/* Write buffer is 0x01-0x10 */
> +#define CH7322_WRBUF		0x01
> +#define CH7322_WRBUF_LEN	0x10
> +
> +#define CH7322_READ		0x40
> +#define CH7322_READ_NRDT		0x80
> +#define CH7322_READ_MSENT		0x20
> +#define CH7322_READ_NMASK		0x0F
> +
> +/* Read buffer is 0x41-0x50 */
> +#define CH7322_RDBUF		0x41
> +#define CH7322_RDBUF_LEN	0x10
> +
> +#define CH7322_MODE		0x11
> +#define CH7322_MODE_AUTO		0x78
> +#define CH7322_MODE_SW			0xB5
> +
> +#define CH7322_RESET		0x12
> +#define CH7322_RESET_RST		0x00
> +
> +#define CH7322_POWER		0x13
> +
> +#define CH7322_CFG0		0x17
> +#define CH7322_CFG0_EOBEN		0x40
> +#define CH7322_CFG0_PEOB		0x20
> +#define CH7322_CFG0_CLRSPP		0x10
> +#define CH7322_CFG0_FLOW		0x08
> +
> +#define CH7322_CFG1		0x1A
> +#define CH7322_CFG1_STDBYO		0x04
> +#define CH7322_CFG1_HPBP		0x02
> +#define CH7322_CFG1_PIO			0x01
> +
> +#define CH7322_INTCTL		0x1B
> +#define CH7322_INTCTL_INTPB		0x80
> +#define CH7322_INTCTL_STDBY		0x40
> +#define CH7322_INTCTL_HPDFALL		0x20
> +#define CH7322_INTCTL_HPDRISE		0x10
> +#define CH7322_INTCTL_RXMSG		0x08
> +#define CH7322_INTCTL_TXMSG		0x04
> +#define CH7322_INTCTL_NEWPHA		0x02
> +#define CH7322_INTCTL_ERROR		0x01
> +
> +#define CH7322_DVCLKFNH	0x1D
> +#define CH7322_DVCLKFNL	0x1E
> +
> +#define CH7322_CTL		0x31
> +#define CH7322_CTL_FSTDBY		0x80
> +#define CH7322_CTL_PLSEN		0x40
> +#define CH7322_CTL_PLSPB		0x20
> +#define CH7322_CTL_SPADL		0x10
> +#define CH7322_CTL_HINIT		0x08
> +#define CH7322_CTL_WPHYA		0x04
> +#define CH7322_CTL_H1T			0x02
> +#define CH7322_CTL_S1T			0x01
> +
> +#define CH7322_PAWH		0x32
> +#define CH7322_PAWL		0x32

Shouldn't this be 0x33?

Regards,

	Hans
