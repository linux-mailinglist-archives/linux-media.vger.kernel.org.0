Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D311B7463
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 14:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbgDXMZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 08:25:01 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:35377 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727854AbgDXMZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 08:25:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RxO0jFphplKa1RxO3jOEXt; Fri, 24 Apr 2020 14:24:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587731096; bh=7/DlOnWtZ/1lqjz1AxkX7uHaA/ALlK8Wo+7i6pE3qdE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bgoCK/z/oYJ7Ona+etqmNMG56dIeQLn5KNTeAfEOLKpk18zHJu0OHebOXa1HVZDD+
         dAQz84yIRcEwedpxRYGxphqJV1H/pM8xxc9F/z8++Awh+c2OGGw3vDg1ZQmMZfaagJ
         iOTXmTA9nos3149ZyDbEV+8Hq4g/GSU2iuZNGG/rIoerFf8S/IDzOrS52x+yG7TsCV
         Zvu49j+1wC/besiDlfl3fuBNrlU/aa40gGsc3I+IlxfcTsobZyd7nH/DamqBwyW2vf
         DOWr3V7BwYjYKYf5BjWQ4T72NDTMnXzQEIHVBhRJrXKfkgQ0pS+XxdHonQ8+FebF16
         1iomVnqm/F6uw==
Subject: Re: [PATCH 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller
 driver
To:     Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200424053819.220276-1-jnchase@google.com>
 <20200424053819.220276-2-jnchase@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <74c08463-7052-2ac4-3662-7301ecb8150d@xs4all.nl>
Date:   Fri, 24 Apr 2020 14:24:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200424053819.220276-2-jnchase@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC3HVbVTkoX0n/9ZMsD7rw2F5ca6ya3o3fugLb6HGA/JUhwM0XJTyejlcjB9bSKAr8Bnq/2YMTJ6QiVCvKKG1ULfaDrW25qwaAyKxLtFfV1pEt4vuYen
 aRDU2+WMe0fU5KsfmN8pUkIkhLIGPH46Tmf+EfsVwhuA0ADLaHnw5ISYhcKpL/XRwbFdZ8pd6WC6NrogARPrd/vrGVf93mWsjNxZuKzzwAKdv2SHudiOvMPm
 /iLIeH0IcPiwRqWX8uf1tKVZfzpRpcuMDDo7wD21kx6su4y6tODkMNRXL475+wO9NakJ4PD6E5Is+zRfSUBW5A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jeff,

Thank you for this driver.

I'll give a quick review below.

For v2 please run 'checkpatch.pl --strict' over the patches and fix any
issues.

Is the register documentation available somewhere? I only found the product brief.

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

Reading the product brief of this device it seems that there are two modes:
it can handle HPD/EDID itself, or that can be left to the HDMI receiver/transmitter.

From what I can gather this driver only supports the first case. This should be
documented at least in the source code.

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
> +
> +#define CH7322_ADDLR		0x3D
> +#define CH7322_ADDLR_HPD		0x80
> +#define CH7322_ADDLR_MASK		0x0F
> +
> +#define CH7322_INTDATA		0x3E
> +#define CH7322_INTDATA_MODE		0x80
> +#define CH7322_INTDATA_STDBY		0x40
> +#define CH7322_INTDATA_HPDFALL		0x20
> +#define CH7322_INTDATA_HPDRISE		0x10
> +#define CH7322_INTDATA_RXMSG		0x08
> +#define CH7322_INTDATA_TXMSG		0x04
> +#define CH7322_INTDATA_NEWPHA		0x02
> +#define CH7322_INTDATA_ERROR		0x01
> +
> +#define CH7322_EVENT		0x3F
> +#define CH7322_EVENT_TXERR		0x80
> +#define CH7322_EVENT_HRST		0x40
> +#define CH7322_EVENT_HFST		0x20
> +#define CH7322_EVENT_PHACHG		0x10
> +#define CH7322_EVENT_ACTST		0x08
> +#define CH7322_EVENT_PHARDY		0x04
> +#define CH7322_EVENT_BSOK		0x02
> +#define CH7322_EVENT_ERRADCF		0x01
> +
> +#define CH7322_DID		0x51
> +#define CH7322_DID_CH7322		0x5B
> +#define CH7322_DID_CH7323		0x5F
> +
> +#define CH7322_REVISIONID	0x52
> +
> +#define CH7322_PARH		0x53
> +#define CH7322_PARL		0x54
> +
> +#define CH7322_IOCFG2		0x75
> +#define CH7322_IOCFG_CIO		0x80
> +#define CH7322_IOCFG_IOCFGMASK		0x78
> +#define CH7322_IOCFG_AUDIO		0x04
> +#define CH7322_IOCFG_SPAMST		0x02
> +#define CH7322_IOCFG_SPAMSP		0x01
> +
> +#define CH7322_CTL3		0x7B
> +#define CH7322_CTL3_SWENA		0x80
> +#define CH7322_CTL3_FC_INIT		0x40
> +#define CH7322_CTL3_SML_FL		0x20
> +#define CH7322_CTL3_SM_RDST		0x10
> +#define CH7322_CTL3_SPP_CIAH		0x08
> +#define CH7322_CTL3_SPP_CIAL		0x04
> +#define CH7322_CTL3_SPP_ACTH		0x02
> +#define CH7322_CTL3_SPP_ACTL		0x01
> +
> +struct ch7322 {
> +	struct i2c_client	*i2c;
> +	struct regmap		*regmap;
> +	struct cec_adapter	*cec;
> +	struct mutex		mutex;
> +	bool			nack;
> +};
> +
> +static const struct regmap_config ch7322_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.disable_locking = true,
> +};
> +
> +static int ch7322_send_message(struct ch7322 *ch7322, const struct cec_msg *msg)
> +{
> +	unsigned int val;
> +	unsigned int len = msg->len;
> +	int ret = 0;
> +	int i;
> +
> +	WARN_ON(!mutex_is_locked(&ch7322->mutex));
> +
> +	if (len > CH7322_WRBUF_LEN || len < 1)
> +		return -EINVAL;
> +
> +	ret = regmap_read(ch7322->regmap, CH7322_WRITE, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Buffer not ready */
> +	if (!(val & CH7322_WRITE_MSENT))
> +		return -EBUSY;
> +
> +	/* error status is flipped for logical address broadcast */
> +	ch7322->nack = cec_msg_initiator(msg) == cec_msg_destination(msg);
> +
> +	ret = regmap_write(ch7322->regmap, CH7322_WRITE, len - 1);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < len; i++) {
> +		ret = regmap_write(ch7322->regmap,
> +			CH7322_WRBUF + i, msg->msg[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ch7322_receive_message(struct ch7322 *ch7322, struct cec_msg *msg)
> +{
> +	unsigned int val;
> +	int ret = 0;
> +	int i;
> +
> +	WARN_ON(!mutex_is_locked(&ch7322->mutex));
> +
> +	ret = regmap_read(ch7322->regmap, CH7322_READ, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Message not ready */
> +	if (!(val & CH7322_READ_NRDT))
> +		return -EIO;
> +
> +	msg->len = (val & CH7322_READ_NMASK) + 1;
> +
> +	/* Read entire RDBUF to clear state */
> +	for (i = 0; i < CH7322_RDBUF_LEN; i++) {
> +		ret = regmap_read(ch7322->regmap, CH7322_RDBUF + i, &val);
> +		if (ret)
> +			return ret;
> +		msg->msg[i] = (u8) val;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ch7322_tx_done(struct ch7322 *ch7322)
> +{
> +	int ret;
> +	unsigned int val;
> +	u8 status;
> +
> +	mutex_lock(&ch7322->mutex);
> +	ret = regmap_read(ch7322->regmap, CH7322_WRITE, &val);
> +	mutex_unlock(&ch7322->mutex);
> +
> +	if (ret) {
> +		dev_err(&ch7322->i2c->dev, "transmit error\n");
> +		status = CEC_TX_STATUS_ERROR;
> +	} else if (val & CH7322_WRITE_BOK) {
> +		status = ch7322->nack ? CEC_TX_STATUS_NACK : CEC_TX_STATUS_OK;
> +	} else {
> +		status = ch7322->nack ? CEC_TX_STATUS_OK : CEC_TX_STATUS_NACK;
> +	}

The chip can only detect OK vs NACK? There are no error states for Arbitration Lost
or Low Drive conditions? Just checking, not all hardware has support for that.

> +
> +	dev_dbg(&ch7322->i2c->dev, "cec transmit done: %d\n", status);
> +
> +	cec_transmit_attempt_done(ch7322->cec, status);
> +}
> +
> +static void ch7322_rx_done(struct ch7322 *ch7322)
> +{
> +	struct cec_msg msg;
> +	int ret;
> +
> +	mutex_lock(&ch7322->mutex);
> +	ret = ch7322_receive_message(ch7322, &msg);
> +	mutex_unlock(&ch7322->mutex);
> +
> +	if (ret) {
> +		dev_err(&ch7322->i2c->dev, "cec receive error: %d\n", ret);
> +		return;
> +	}
> +
> +	dev_dbg(&ch7322->i2c->dev, "cec receive: %x->%x: %x\n",
> +		cec_msg_initiator(&msg), cec_msg_destination(&msg),
> +		cec_msg_opcode(&msg));

The cec framework has similar logging, so I'd remove this.

> +
> +	cec_received_msg(ch7322->cec, &msg);
> +}
> +
> +static void ch7322_phys_addr(struct ch7322 *ch7322)
> +{
> +	unsigned int pah, pal;
> +	int ret = 0;
> +
> +	mutex_lock(&ch7322->mutex);
> +	ret |= regmap_read(ch7322->regmap, CH7322_PARH, &pah);
> +	ret |= regmap_read(ch7322->regmap, CH7322_PARL, &pal);
> +	mutex_unlock(&ch7322->mutex);
> +
> +	if (ret)
> +		dev_err(&ch7322->i2c->dev, "phys addr error\n");
> +	else
> +		cec_s_phys_addr(ch7322->cec, pal | (pah << 8), false);
> +}
> +
> +static void ch7322_handle_events(struct ch7322 *ch7322)
> +{
> +	unsigned int data;
> +
> +	mutex_lock(&ch7322->mutex);
> +	(void) regmap_read(ch7322->regmap, CH7322_INTDATA, &data);
> +	(void) regmap_write(ch7322->regmap, CH7322_INTDATA, data);
> +	mutex_unlock(&ch7322->mutex);
> +
> +	if (data & CH7322_INTDATA_HPDFALL) {
> +		dev_dbg(&ch7322->i2c->dev, "hpdfall\n");

I think this dbg line can be dropped since the cec framework already
logs when cec_phys_addr_invalidate is called.

> +		cec_phys_addr_invalidate(ch7322->cec);
> +	}
> +
> +	if (data & CH7322_INTDATA_TXMSG)
> +		ch7322_tx_done(ch7322);
> +
> +	if (data & CH7322_INTDATA_RXMSG)
> +		ch7322_rx_done(ch7322);
> +
> +	if (data & CH7322_INTDATA_NEWPHA)
> +		ch7322_phys_addr(ch7322);
> +
> +	if (data & CH7322_INTDATA_ERROR)
> +		dev_err(&ch7322->i2c->dev, "unknown error\n");
> +}
> +
> +
> +static irqreturn_t ch7322_irq(int irq, void *dev)
> +{
> +	struct ch7322 *ch7322 = dev;
> +
> +	ch7322_handle_events(ch7322);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ch7322_cec_adap_enable(struct cec_adapter *adap, bool enable)
> +{
> +	return 0;
> +}
> +
> +static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
> +{
> +	struct ch7322 *ch7322 = cec_get_drvdata(adap);
> +
> +	dev_dbg(&ch7322->i2c->dev, "cec log addr: %x\n", log_addr);
> +
> +	return 0;

This can't be right. I expect that logical addresses are set/cleared here,
because the device needs to know that so that it can ignore messages not
intended for it.

> +}
> +
> +static int ch7322_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
> +				     u32 signal_free_time, struct cec_msg *msg)
> +{

Does the hardware correctly handle Signal Free Time? If this isn't handled right
then one CEC device can flood the CEC bus, preventing anyone else from using it.

In some devices it has to be programmed, in others it is hardwired.

> +	struct ch7322 *ch7322 = cec_get_drvdata(adap);
> +	int ret;
> +
> +	dev_dbg(&ch7322->i2c->dev, "cec transmit: %x->%x: %x\n",
> +		cec_msg_initiator(msg), cec_msg_destination(msg),
> +		cec_msg_opcode(msg));
> +
> +	mutex_lock(&ch7322->mutex);
> +	ret = ch7322_send_message(ch7322, msg);
> +	mutex_unlock(&ch7322->mutex);
> +
> +	return ret;
> +}
> +
> +static const struct cec_adap_ops ch7322_cec_adap_ops = {
> +	.adap_enable = ch7322_cec_adap_enable,
> +	.adap_log_addr = ch7322_cec_adap_log_addr,
> +	.adap_transmit = ch7322_cec_adap_transmit,

If the HW supports CEC monitoring (aka snooping), then I recommend that
adap_monitor_all_enable is also implemented. It's very useful for debugging
CEC in userspace. Not all HW supports it, though.

> +};
> +
> +static int ch7322_probe(struct i2c_client *client)
> +{
> +	struct ch7322 *ch7322;
> +	int ret;
> +	unsigned int val;
> +
> +	ch7322 = devm_kzalloc(&client->dev, sizeof(*ch7322), GFP_KERNEL);
> +	if (!ch7322)
> +		return -ENOMEM;
> +
> +	ch7322->regmap = devm_regmap_init_i2c(client, &ch7322_regmap);
> +	if (IS_ERR(ch7322->regmap))
> +		return PTR_ERR(ch7322->regmap);
> +
> +	mutex_init(&ch7322->mutex);
> +	ch7322->i2c = client;
> +	ch7322->nack = false;
> +
> +	i2c_set_clientdata(client, ch7322);
> +
> +	mutex_lock(&ch7322->mutex);
> +	ret = regmap_read(ch7322->regmap, CH7322_DID, &val);
> +	mutex_unlock(&ch7322->mutex);
> +
> +	if (ret < 0)
> +		goto err_mutex;
> +
> +	if (val != CH7322_DID_CH7322) {
> +		ret = -ENOTSUPP;
> +		goto err_mutex;
> +	}
> +
> +	mutex_lock(&ch7322->mutex);
> +	ret = regmap_write(ch7322->regmap, CH7322_MODE, CH7322_MODE_SW);
> +	mutex_unlock(&ch7322->mutex);
> +
> +	if (ret < 0)
> +		goto err_mutex;
> +
> +	ch7322->cec = cec_allocate_adapter(&ch7322_cec_adap_ops, ch7322,
> +		dev_name(&client->dev), CEC_CAP_DEFAULTS, 1);
> +
> +	if (IS_ERR(ch7322->cec)) {
> +		ret = PTR_ERR(ch7322->cec);
> +		goto err_mutex;
> +	}
> +
> +	ret = cec_register_adapter(ch7322->cec, &client->dev);
> +	if (ret) {
> +		cec_delete_adapter(ch7322->cec);
> +		goto err_mutex;
> +	}
> +
> +	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +		ch7322_irq, IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +		client->name, ch7322);
> +	if (ret < 0)
> +		goto err_cec;
> +
> +	/* Clear events & enable interrupt */
> +	ch7322_handle_events(ch7322);
> +	ret = regmap_write(ch7322->regmap, CH7322_CFG1, 0);
> +	if (ret)
> +		goto err_cec;
> +
> +	dev_info(&client->dev, "device registered\n");
> +
> +	return 0;
> +
> +err_cec:
> +	cec_unregister_adapter(ch7322->cec);
> +err_mutex:
> +	mutex_destroy(&ch7322->mutex);
> +	return ret;
> +}
> +
> +static int ch7322_remove(struct i2c_client *client)
> +{
> +	struct ch7322 *ch7322 = i2c_get_clientdata(client);
> +
> +	/* Disable interrupt */
> +	(void) regmap_write(ch7322->regmap, CH7322_CFG1,
> +		CH7322_CFG1_STDBYO | CH7322_CFG1_HPBP);
> +
> +	cec_unregister_adapter(ch7322->cec);
> +	mutex_destroy(&ch7322->mutex);
> +
> +	dev_info(&client->dev, "device unregistered\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ch7322_of_match[] = {
> +	{ .compatible = "chrontel,ch7322", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ch7322_of_match);
> +
> +static struct i2c_driver ch7322_i2c_driver = {
> +	.driver = {
> +		.name = "ch7322",
> +		.of_match_table = of_match_ptr(ch7322_of_match),
> +	},
> +	.probe_new	= ch7322_probe,
> +	.remove		= ch7322_remove,
> +};
> +
> +module_i2c_driver(ch7322_i2c_driver);
> +
> +MODULE_DESCRIPTION("Chrontel CH7322 CEC Controller Driver");
> +MODULE_AUTHOR("Jeff Chase <jnchase@google.com>");
> +MODULE_LICENSE("GPL");
> 

Regards,

	Hans
