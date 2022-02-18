Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55AB04BC23E
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 22:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239981AbiBRVib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 16:38:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235586AbiBRVia (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 16:38:30 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DB01A275B;
        Fri, 18 Feb 2022 13:38:10 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o34so6000487wms.1;
        Fri, 18 Feb 2022 13:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a3esNQgPjIhiAjO2a2AoiLQwD7DVU+uOFO/YTeSXn1E=;
        b=nh65QzaMTIcphLikdkkRGbmIA4e9xyXhlZieu9zfA0zGVHknkudbObek8+TyQ+7tLO
         /4jX1JXOow0IjYeF8bhD7JvemgFmYE+Xm9/S5SbmN/fiBRiysn5988VfnARe7/aLlJ5Q
         bdl1V1b6rK6bU7tasN25ja8bS9knOWriFwuMydms0CrYwKcaXZ+C1CGKxsy2HvjtJWVI
         B7zPQnQonfbf1XDmOEFQa7EokHOWlMNUwj79xlr3fUYlXXNVgwugdg9PKYWjMkSNGK27
         eTuxnrMW45ZX+aJnlmQl34+4fxR/+TJf2pYG+3ioJRjwAFDxhd2NwwjL6v4vpPvmJ32W
         pgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a3esNQgPjIhiAjO2a2AoiLQwD7DVU+uOFO/YTeSXn1E=;
        b=h9TYhnGoPU6d2YBE8dULbejCA0onDVGWmwHCvDm2+rzsdHv2wm8OJRQP3oEctjHavS
         P2ModQEp+gqdPQSt8nByEbOBCP9lhkuVqBOw9ppSxkZ+u3LRgeqtQxs7AFZo49BbUPLT
         6jcOrclZxyuaRwPDcygkIXCeqhvg+2IEvQuhvaU3Dwlvh0vi4Cy62eVcUgOo+bTOYpAf
         PcZIVQkb4mxad9yKDK236cGFsZe+gH9p6538UkzJ4An/IThuJOQckQERR52dfC77H0bb
         Qi9qLA/Pb33GXoTNOG7f4BgntMgyd9pYYBNOX6mzgK+t8tGuARbmAjs8MASpHhP2tOiV
         0SOw==
X-Gm-Message-State: AOAM533M4IKzD1Y/PHHHC0cgCN48WfsIt6bQJ0UTm4StpDWC6mTQcXmh
        zPf9u1iogX7PI+AiH3n6i0U=
X-Google-Smtp-Source: ABdhPJzFM2XqLIZn/9qE3N+SC6RKCreVKryHWxJltjr7yBeP3vjydfZg+zOrJcySd48q1MGiJ3t/Kw==
X-Received: by 2002:a05:600c:3512:b0:37b:b51f:af75 with SMTP id h18-20020a05600c351200b0037bb51faf75mr8983755wmq.118.1645220289099;
        Fri, 18 Feb 2022 13:38:09 -0800 (PST)
Received: from X1C7EK5 ([151.40.80.193])
        by smtp.gmail.com with ESMTPSA id u7sm30878611wrm.15.2022.02.18.13.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 13:38:08 -0800 (PST)
Date:   Fri, 18 Feb 2022 22:38:06 +0100
From:   ektor5 <ek5.chimenti@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linuxfancy@googlegroups.com
Subject: Re: [PATCH v2 1/2] media: cec: add SECO MEC-based cec driver
Message-ID: <20220218213806.scym4rqhjumwvcsf@X1C7EK5>
References: <20220215181313.264698-1-ek5.chimenti@gmail.com>
 <20220215181313.264698-2-ek5.chimenti@gmail.com>
 <dad37fe1-6eb7-5295-0381-456dd1338a72@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad37fe1-6eb7-5295-0381-456dd1338a72@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for replying, 

On Fri, Feb 18, 2022 at 09:56:49AM +0100, Hans Verkuil wrote:
> Hi Ettore,
> 
> Some comments below:
> 
> On 15/02/2022 19:13, ektor5 wrote:
> > From: Ettore Chimenti <ek5.chimenti@gmail.com>
> > 
> > This patch adds support to the CEC device implemented with a Microchip
> > MEC microcontroller in SECO Boards, including UDOO BOLT and UDOO Vision.
> > 
> > The communication is achieved via Mailbox protocol.
> > The driver use direct access to the PCI addresses.
> > The firmware implementation also supports resuming from suspend by
> > sending physical address to EC and waiting for a SET_STREAM_PATH command
> > that matches the provided physical address.
> > 
> > The basic functionalities are tested with success with cec-ctl and
> > cec-compliance.
> 
> I'd like to see the output of cec-compliance --test-adapter.
> 

Here it is:

Driver Info:
	Driver Name                : seco_meccec
	Adapter Name               : CEC00002:00-0
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
		Connector Info
	Driver version             : 5.16.5
	Available Logical Addresses: 1
	DRM Connector Info         : card 0, connector 111
	Physical Address           : 1.0.0.0
	Logical Address Mask       : 0x0010
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : 'Playback'
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : 4 (Playback Device 1)
	    Primary Device Type    : Playback
	    Logical Address Type   : Playback
	    All Device Types       : Playback
	    RC TV Profile          : None
	    Device Features        :
		None

Compliance test for seco_meccec device /dev/cec0:

[...]

Find remote devices:
	Polling: OK

CEC API:
	CEC_ADAP_G_CAPS: OK
	Invalid ioctls: OK
	CEC_DQEVENT: OK
	CEC_ADAP_G/S_PHYS_ADDR: OK
	CEC_ADAP_G/S_LOG_ADDRS: OK
		fail: cec-test-adapter.cpp(352): msg.rx_status & CEC_RX_STATUS_TIMEOUT
	CEC_TRANSMIT: FAIL
		fail: cec-test-adapter.cpp(540): doioctl(node, CEC_RECEIVE, &msg)
	CEC_RECEIVE: FAIL
		fail: cec-test-adapter.cpp(783): doioctl(node, CEC_RECEIVE, &msg)
	CEC_TRANSMIT/RECEIVE (non-blocking): FAIL
		fail: cec-test-adapter.cpp(883): doioctl(node, CEC_RECEIVE, &msg)
	CEC_G/S_MODE: FAIL
		Successful transmits: 73
		NACKed transmits: 1
		Received messages: 2 of which 0 were CEC_MSG_CEC_VERSION
		Received 54 messages immediately, and 21 over 7 seconds
		SFTs for repeating messages (>= 7): 6: 71
	warn: cec-test-adapter.cpp(1291): There were 74 CEC_GET_VERSION transmits but only 0 CEC_VERSION receives
	CEC_EVENT_LOST_MSGS: OK

Network topology:
	System Information for device 0 (TV) from device 4 (Playback Device 1):
		CEC Version                : Tx, OK, Rx, Timeout
		Physical Address           : Tx, OK, Rx, Timeout
		Vendor ID                  : 0x00e091 (LG)
		OSD Name                   : Tx, OK, Rx, Timeout
		Menu Language              : kor
		Power Status               : On

Total for seco_meccec device /dev/cec0: 11, Succeeded: 7, Failed: 4, Warnings: 1

> > 
> > Inspired by previous seco-cec implementation, attaches to i915 driver
> > cec-notifier.
> > 
> > Signed-off-by: Ettore Chimenti <ek5.chimenti@gmail.com>
> > ---
> >  MAINTAINERS                                   |   2 +
> >  drivers/media/cec/platform/Kconfig            |  22 +-
> >  drivers/media/cec/platform/seco/Makefile      |   3 +-
> >  drivers/media/cec/platform/seco/seco-meccec.c | 824 ++++++++++++++++++
> >  drivers/media/cec/platform/seco/seco-meccec.h | 130 +++
> >  5 files changed, 978 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/media/cec/platform/seco/seco-meccec.c
> >  create mode 100644 drivers/media/cec/platform/seco/seco-meccec.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fca970a46e77..faa3a19b62eb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17303,6 +17303,8 @@ M:	Ettore Chimenti <ek5.chimenti@gmail.com>
> >  S:	Maintained
> >  F:	drivers/media/cec/platform/seco/seco-cec.c
> >  F:	drivers/media/cec/platform/seco/seco-cec.h
> > +F:	drivers/media/cec/platform/seco/seco-meccec.c
> > +F:	drivers/media/cec/platform/seco/seco-meccec.h
> 
> It's probably easier to just replace these 4 lines with:
> 
> F:	drivers/media/cec/platform/seco/
> 

I agree.

> >  
> >  SECURE COMPUTING
> >  M:	Kees Cook <keescook@chromium.org>
> > diff --git a/drivers/media/cec/platform/Kconfig b/drivers/media/cec/platform/Kconfig
> > index b672d3142eb7..da92b22d0775 100644
> > --- a/drivers/media/cec/platform/Kconfig
> > +++ b/drivers/media/cec/platform/Kconfig
> > @@ -98,7 +98,11 @@ config CEC_TEGRA
> >  	  between compatible devices.
> >  
> >  config CEC_SECO
> > -	tristate "SECO Boards HDMI CEC driver"
> > +	bool "SECO Boards HDMI CEC drivers"
> > +
> > +config CEC_SECO_LEGACY
> > +	tristate "SECO Legacy Boards HDMI CEC driver"
> 
> I'm not too keen on 'Legacy' since it doesn't tell you what
> boards are considered legacy. Is there a better description?
> 
> E.g.: 'SECO ???-Based Boards'
> 

Yes, me neither. What about CEC_SECO_STM32? The former driver boards
were based on that EC.

> > +	depends on CEC_SECO
> >  	depends on (X86 || IA64) || COMPILE_TEST
> >  	depends on PCI && DMI
> >  	select CEC_CORE
> > @@ -109,9 +113,23 @@ config CEC_SECO
> >  	  CEC bus is present in the HDMI connector and enables communication
> >  	  between compatible devices.
> >  
> > +config CEC_SECO_MEC
> > +	tristate "SECO MEC-Based Boards HDMI CEC driver"
> > +	depends on CEC_SECO
> > +	depends on (X86 || IA64) || COMPILE_TEST
> > +	depends on PCI && DMI
> > +	select CEC_CORE
> > +	select CEC_NOTIFIER
> > +	help
> > +	  This is a driver for SECO MEC-Based Boards integrated CEC interface.
> > +	  Selecting it will enable support for this device.
> > +	  CEC bus is present in the HDMI connectors and enables communication
> > +	  between compatible devices.
> > +
> > +
> >  config CEC_SECO_RC
> >  	bool "SECO Boards IR RC5 support"
> > -	depends on CEC_SECO
> > +	depends on CEC_SECO_LEGACY
> >  	depends on RC_CORE=y || RC_CORE = CEC_SECO
> >  	help
> >  	  If you say yes here you will get support for the
> > diff --git a/drivers/media/cec/platform/seco/Makefile b/drivers/media/cec/platform/seco/Makefile
> > index aa1ca8ccdb8b..ccd51dc4c5ac 100644
> > --- a/drivers/media/cec/platform/seco/Makefile
> > +++ b/drivers/media/cec/platform/seco/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > -obj-$(CONFIG_CEC_SECO) += seco-cec.o
> > +obj-$(CONFIG_CEC_SECO_LEGACY) += seco-cec.o
> > +obj-$(CONFIG_CEC_SECO_MEC) += seco-meccec.o
> > diff --git a/drivers/media/cec/platform/seco/seco-meccec.c b/drivers/media/cec/platform/seco/seco-meccec.c
> > new file mode 100644
> > index 000000000000..eaa0006e1390
> > --- /dev/null
> > +++ b/drivers/media/cec/platform/seco/seco-meccec.c
> > @@ -0,0 +1,824 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> > +/*
> > + * CEC driver for SECO MEC-based Boards
> > + *
> > + * Author:  Ettore Chimenti <ek5.chimenti@gmail.com>
> > + * Copyright (C) 2022, SECO SpA.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/acpi.h>
> > +#include <linux/dmi.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/pci.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/version.h>
> > +
> > +/* CEC Framework */
> > +#include <media/cec-notifier.h>
> > +
> > +#include "seco-meccec.h"
> > +
> > +#define SECO_MECCEC_DEV_NAME "seco_meccec"
> > +#define MECCEC_MAX_CEC_ADAP 4
> > +#define MECCEC_MAX_ADDRS 1
> > +#define MECCEC_MAX_STATUS_RETRIES 10
> > +
> > +static DEFINE_MUTEX(ec_mutex);
> > +
> > +struct seco_meccec_data {
> > +	struct device *dev;
> > +	struct platform_device *pdev;
> > +	struct cec_adapter *cec_adap[MECCEC_MAX_CEC_ADAP];
> > +	struct cec_notifier *notifier[MECCEC_MAX_CEC_ADAP];
> > +	u8 channels;	/* bitmask */
> > +	int irq;
> > +};
> > +
> > +struct seco_meccec_adap_data {
> > +	struct seco_meccec_data *cec;
> > +	int idx;
> > +};
> > +
> > +static int ec_reg_byte_op(u8 reg, u8 operation, u8 data, u8 *result)
> > +{
> > +	int res;
> > +
> > +	/* Check still active */
> > +	res = inb(MBX_RESOURCE_REGISTER) & AGENT_ACTIVE(AGENT_USER);
> > +	if (!res)
> > +		return -EBUSY;
> > +
> > +	/* Set the register index */
> > +	outb(reg, EC_REGISTER_INDEX);
> > +
> > +	/* Check still active */
> > +	res = inb(MBX_RESOURCE_REGISTER) & AGENT_ACTIVE(AGENT_USER);
> > +	if (!res)
> > +		return -EBUSY;
> > +
> > +	if (operation == READ) {
> > +		if (!result)
> > +			return -EINVAL;
> > +
> > +		/* Read the data value */
> > +		*result = inb(EC_REGISTER_DATA);
> > +
> > +	} else if (operation == WRITE) {
> > +		/* Write the data value */
> > +		outb(data, EC_REGISTER_DATA);
> > +	}
> > +
> > +	/* Check still active */
> > +	res = inb(MBX_RESOURCE_REGISTER) & AGENT_ACTIVE(AGENT_USER);
> > +	if (!res)
> > +		return -EBUSY;
> > +
> > +	return 0;
> > +}
> > +
> > +#define ec_reg_byte_rd(reg, res) ec_reg_byte_op(reg, READ, 0, res)
> > +#define ec_reg_byte_wr(reg, val) ec_reg_byte_op(reg, WRITE, val, NULL)
> > +
> > +static int ec_waitstatus(u8 status, u8 cmd)
> > +{
> > +	int idx;
> > +
> > +	/* Loop until time-out or Status */
> > +	for (idx = 0; idx < EC_CMD_TIMEOUT; idx++) {
> > +		u8 res = inb(MBX_RESOURCE_REGISTER);
> > +
> > +		/* If status, done */
> > +		if ((res & AGENT_MASK(AGENT_USER)) == status)
> > +			return 0;
> > +
> > +		/* Send command if needed */
> > +		if (!cmd)
> > +			continue;
> > +
> > +		/* Retry sending command when mailbox is free */
> > +		for ( ; idx < EC_CMD_TIMEOUT; idx++) {
> > +			/* Check busy bit */
> > +			res = inb(MBX_BUSY_REGISTER) & EC_STATUS_REGISTER;
> > +
> > +			if (!res) {
> > +				/* Send command */
> > +				outb_p(cmd, MBX_BUSY_REGISTER);
> > +				break;
> > +			}
> > +		}
> > +	}
> > +
> > +	/* Time-out expired */
> > +	return -EAGAIN;
> > +}
> > +
> > +static int ec_send_command(const struct platform_device *pdev, u8 cmd,
> > +			   void *tx_buf, u8 tx_size,
> > +			   void *rx_buf, u8 rx_size)
> > +{
> > +	struct seco_meccec_data *meccec = platform_get_drvdata(pdev);
> > +	const struct device *dev = meccec->dev;
> > +
> > +	int status;
> > +	u8 *buf;
> > +	u8 idx;
> > +	u8 res;
> > +
> > +	mutex_lock(&ec_mutex);
> > +
> > +	/* Wait for BIOS agent idle */
> > +	status = ec_waitstatus(AGENT_IDLE(AGENT_USER), 0);
> > +	if (status) {
> > +		dev_err(dev, "Mailbox agent not available\n");
> > +		goto err;
> > +	}
> > +
> > +	/* BIOS agent is idle: we can request access */
> > +	status = ec_waitstatus(AGENT_ACTIVE(AGENT_USER),
> > +			       REQUEST_MBX_ACCESS(AGENT_USER));
> > +	if (status) {
> > +		dev_err(dev, "Request mailbox agent failed\n");
> > +		goto err;
> > +	}
> > +
> > +	/* Prepare MBX data */
> > +	for (buf = (uint8_t *)tx_buf, idx = 0; (!status) && idx < tx_size; idx++)
> > +		status = ec_reg_byte_wr(EC_MBX_REGISTER + idx, buf[idx]);
> > +
> > +	if (status) {
> > +		dev_err(dev, "Mailbox buffer write failed\n");
> > +		goto err;
> > +	}
> > +
> > +	/* Send command */
> > +	status = ec_reg_byte_wr(EC_COMMAND_REGISTER, cmd);
> > +	if (status) {
> > +		dev_err(dev, "Command write failed\n");
> > +		goto err;
> > +	}
> > +
> > +	/* Wait for completion */
> > +	status = ec_waitstatus(AGENT_DONE(AGENT_USER), 0);
> > +	if (status) {
> > +		dev_err(dev, "Mailbox did not complete after command write\n");
> > +		goto err;
> > +	}
> > +
> > +	/* Get result code */
> > +	status = ec_reg_byte_rd(EC_RESULT_REGISTER, &res);
> > +	if (status) {
> > +		dev_err(dev, "Result read failed\n");
> > +		goto err;
> > +	}
> > +
> > +	/* Get result code and translate it */
> > +	switch (res) {
> > +	case EC_NO_ERROR:
> > +		status = 0;
> > +		break;
> > +
> > +	case EC_UNKNOWN_COMMAND_ERROR:
> > +		status = -EPERM;
> > +		break;
> > +
> > +	case EC_INVALID_ARGUMENT_ERROR:
> > +		status = -EINVAL;
> > +		break;
> > +
> > +	case EC_TIMEOUT_ERROR:
> > +		status = -EAGAIN;
> > +		break;
> > +
> > +	default:
> > +		status = -EIO;
> > +		break;
> > +	}
> > +	if (status) {
> > +		dev_err(dev, "Command failed\n");
> > +		goto err;
> > +	}
> > +
> > +	/* Read return data */
> > +	for (buf = (uint8_t *)rx_buf, idx = 0; !status && idx < rx_size; idx++)
> > +		status = ec_reg_byte_rd(EC_MBX_REGISTER + idx, &buf[idx]);
> > +
> > +	if (status) {
> > +		dev_err(dev, "Mailbox read failed\n");
> > +		goto err;
> > +	}
> > +
> > +err:
> > +	/* Release access, ignoring eventual time-out */
> > +	ec_waitstatus(AGENT_IDLE(AGENT_USER), RELEASE_MBX_ACCESS(AGENT_USER));
> > +
> > +	mutex_unlock(&ec_mutex);
> > +	return status;
> > +}
> > +
> > +static int ec_get_version(struct seco_meccec_data *cec)
> > +{
> > +	const struct device *dev = cec->dev;
> > +	const struct platform_device *pdev = cec->pdev;
> > +	struct version_msg_t version;
> > +	int status;
> > +
> > +	status = ec_send_command(pdev, GET_FIRMWARE_VERSION_CMD,
> > +				 NULL, 0,
> > +				 &version, sizeof(struct version_msg_t));
> > +
> > +	if (status)
> > +		return status;
> > +
> > +	dev_dbg(dev, "Firmware version %X.%02X / %X.%02X\n",
> > +		version.fw.major,
> > +		version.fw.minor,
> > +		version.lib.major,
> > +		version.lib.minor);
> 
> Consider implementing the adap_status op to show this information in a
> /sys/kernel/debug/cec/cecX/status file. This is useful to expose.
> 

Good to know, I'll try to implement in v3.

> > +
> > +	return 0;
> > +}
> > +
> > +static int ec_cec_status(struct seco_meccec_data *cec,
> > +			 struct seco_meccec_status_t *result)
> > +{
> > +	const struct device *dev = cec->dev;
> > +	const struct platform_device *pdev = cec->pdev;
> > +	struct seco_meccec_status_t buf = { 0 };
> > +	int ret, i;
> > +
> > +	/* retry until get status or interrupt will not reset */
> > +	for (i = 0; i < MECCEC_MAX_STATUS_RETRIES; i++) {
> > +		ret = ec_send_command(pdev, GET_CEC_STATUS_CMD,
> > +				      &buf, sizeof(struct seco_meccec_status_t),
> > +				      &buf, sizeof(struct seco_meccec_status_t));
> > +		if (ret) {
> > +			dev_dbg(dev, "Status: Mailbox is busy. Retrying.\n");
> > +			continue;
> > +		}
> > +		break;
> > +	}
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_dbg(dev, "CEC Status:\n");
> > +	dev_dbg(dev, "ch0: 0x%02x\n", buf.status_ch0);
> > +	dev_dbg(dev, "ch1: 0x%02x\n", buf.status_ch1);
> > +	dev_dbg(dev, "ch2: 0x%02x\n", buf.status_ch2);
> > +	dev_dbg(dev, "ch3: 0x%02x\n", buf.status_ch3);
> 
> This might also be useful info for a status file.
> 
> In general I feel that there are too many dev_dbg() calls in this source code.
> Some pruning might be useful, and, as mentioned, some of the info might be
> better for a status file.
> 

Nice, I'll try to convert some of them into adap_status op.

> > +
> > +	if (result)
> > +		*result = buf;
> > +
> > +	return 0;
> > +}
> > +
> > +static int meccec_adap_phys_addr(struct cec_adapter *adap, u16 phys_addr)
> > +{
> > +	struct seco_meccec_adap_data *adap_data = cec_get_drvdata(adap);
> > +	struct seco_meccec_data *cec = adap_data->cec;
> > +	const struct platform_device *pdev = cec->pdev;
> > +	const struct device *dev = cec->dev;
> > +	struct seco_meccec_phyaddr_t buf = { };
> > +	int status;
> > +
> > +	buf.bus = adap_data->idx;
> > +	buf.addr = phys_addr;
> > +
> > +	/* Need to tell physical address to wake up while standby */
> > +	status = ec_send_command(pdev, SET_CEC_PHYADDR_CMD,
> > +				 &buf, sizeof(struct seco_meccec_phyaddr_t),
> > +				 NULL, 0);
> > +	dev_dbg(dev, "Physical address 0x%04x\n", phys_addr);
> > +
> > +	return status;
> > +}
> > +
> > +static int meccec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
> > +{
> > +	struct seco_meccec_adap_data *adap_data = cec_get_drvdata(adap);
> > +	struct seco_meccec_data *cec = adap_data->cec;
> > +	struct platform_device *pdev = cec->pdev;
> > +	const struct device *dev = cec->dev;
> > +	struct seco_meccec_logaddr_t buf = { };
> > +	int status;
> > +
> > +	buf.bus = adap_data->idx;
> > +	buf.addr = logical_addr & 0x0f;
> > +
> > +	status = ec_send_command(pdev, SET_CEC_LOGADDR_CMD,
> > +				 &buf, sizeof(struct seco_meccec_logaddr_t),
> > +				 NULL, 0);
> > +	dev_dbg(dev, "Logical address 0x%02x\n", logical_addr);
> > +
> > +	/* Physical address is sent to MEC to be stored for replying
> 
> These multiline comments traditionally start with /* on a line by itself. So:
> 
> /*
>  * long
>  * comment
>  */
> 
> Can you change that in this source?
> 

Ops. I forgot one of them. Yes, no problem.

> > +	 * autonomously to GIVE_PHYSICAL_ADDR and matching SET_STREAM_PATH when
> > +	 * the CPU is sleeping. If PA match with a SET_STREAM_PATH message, it
> > +	 * will resume the CPU.
> > +	 *
> > +	 * When setting LA, adap has valid physical address
> > +	 */
> > +	status = meccec_adap_phys_addr(adap, adap->phys_addr);
> > +	if (status)
> > +		dev_err(dev, "Set physical address failed %d\n", status);
> 
> Should an error from meccec_adap_phys_addr() be considered a failure?
> Or just a warning, and you continue as is. You can argue either way, but I
> am leaning towards just issuing a warning but still return success.
> 

Agree on that. Not a big deal indeed.

> > +
> > +	return status;
> > +}
> > +
> > +static int meccec_adap_enable(struct cec_adapter *adap, bool enable)
> > +{
> > +	struct seco_meccec_adap_data *adap_data = cec_get_drvdata(adap);
> > +	struct seco_meccec_data *cec = adap_data->cec;
> > +	const struct device *dev = cec->dev;
> > +	int ret;
> > +
> > +	/* reset status register */
> > +	ret = ec_cec_status(cec, NULL);
> > +	if (ret)
> > +		dev_err(dev, "enable: status operation failed %d\n", ret);
> > +
> > +	if (enable) {
> > +		dev_dbg(dev, "Device enabled\n");
> > +	} else {
> > +		dev_dbg(dev, "Device disabled\n");
> > +
> > +		/* When the adapter is disabled, setting the physical address to
> > +		 * invalid prevents the MEC firmware to wake up the CPU.
> > +		 */
> > +		ret = meccec_adap_phys_addr(adap, CEC_PHYS_ADDR_INVALID);
> > +		if (ret) {
> > +			dev_err(dev, "enable: set physical address failed %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int meccec_adap_transmit(struct cec_adapter *adap, u8 attempts,
> > +				u32 signal_free_time, struct cec_msg *msg)
> > +{
> > +	struct seco_meccec_adap_data *adap_data = cec_get_drvdata(adap);
> > +	struct seco_meccec_data *cec = adap_data->cec;
> > +	struct platform_device *pdev = cec->pdev;
> > +	const struct device *dev = cec->dev;
> > +	struct seco_meccec_msg_t buf = { };
> > +	int status;
> > +
> > +	dev_dbg(dev, "Device transmitting\n");
> > +
> > +	buf.bus = adap_data->idx;
> > +	buf.send = (msg->msg[0] & 0xf0) >> 4;
> > +	buf.dest = msg->msg[0] & 0x0f;
> > +	buf.size = msg->len - 1;
> > +	memcpy(buf.data, msg->msg + 1, buf.size);
> > +
> > +	status = ec_send_command(pdev, CEC_WRITE_CMD,
> > +				 &buf, sizeof(struct seco_meccec_msg_t),
> > +				 NULL, 0);
> > +
> > +	return status;
> > +}
> > +
> > +static void meccec_tx_done(struct seco_meccec_data *cec, int adap_idx, u8 status_val)
> > +{
> > +	struct cec_adapter *adap = cec->cec_adap[adap_idx];
> > +
> > +	if (status_val & SECOCEC_STATUS_TX_ERROR_MASK) {
> > +		if (status_val & SECOCEC_STATUS_TX_NACK_ERROR)
> > +			cec_transmit_attempt_done(adap, CEC_TX_STATUS_NACK);
> > +		else
> > +			cec_transmit_attempt_done(adap, CEC_TX_STATUS_ERROR);
> > +	} else {
> > +		cec_transmit_attempt_done(adap, CEC_TX_STATUS_OK);
> > +	}
> > +}
> > +
> > +static void meccec_rx_done(struct seco_meccec_data *cec, int adap_idx, u8 status_val)
> > +{
> > +	struct device *dev = cec->dev;
> > +	struct platform_device *pdev = cec->pdev;
> > +	struct cec_adapter *adap = cec->cec_adap[adap_idx];
> > +	struct seco_meccec_msg_t buf = { .bus = adap_idx };
> > +	struct cec_msg msg = { };
> > +	int status;
> > +
> > +	if (status_val & SECOCEC_STATUS_RX_OVERFLOW_MASK)
> > +		dev_warn(dev, "Received more than 16 bytes. Discarding\n");
> 
> Add a period after 'Discarding'.
> 

No problem.

> > +
> > +	if (status_val & SECOCEC_STATUS_RX_ERROR_MASK) {
> > +		dev_warn(dev, "Message received with errors. Discarding\n");
> 
> Ditto.
> 

No problem.

> > +		status = -EIO;
> > +		goto rxerr;
> 
> Huh? Just do 'return -EIO;' here.
> 

Mmmh, something is not right since the function is void. Need to check.

> > +	}
> > +	/* Read message buffer */
> > +	status = ec_send_command(pdev, CEC_READ_CMD,
> > +				 &buf, sizeof(struct seco_meccec_msg_t),
> > +				 &buf, sizeof(struct seco_meccec_msg_t));
> > +	if (status)
> > +		return;
> > +
> > +	/* Device msg len already accounts for the header */
> > +	msg.len = min(buf.size + 1, CEC_MAX_MSG_SIZE);
> > +
> > +	/* Read logical address */
> > +	msg.msg[0]  = buf.dest & 0x0f;
> > +	msg.msg[0] |= (buf.send & 0x0f) << 4;
> > +
> > +	memcpy(msg.msg + 1, buf.data, buf.size);
> > +
> > +	cec_received_msg(adap, &msg);
> > +	dev_dbg(dev, "Message received successfully\n");
> > +
> > +rxerr:
> > +	return;
> > +}
> > +
> > +static int get_status_ch(struct seco_meccec_status_t *s,
> 
> s can be const
> 

Yes, agree.

> > +			 int ch)
> > +{
> > +	if (!s)
> > +		return -1;
> > +
> > +	switch (ch) {
> > +	case 0: return s->status_ch0;
> > +	case 1: return s->status_ch1;
> > +	case 2: return s->status_ch2;
> > +	case 3: return s->status_ch3;
> > +	default: return -1;
> > +	}
> > +}
> > +
> > +static irqreturn_t seco_meccec_irq_handler(int irq, void *priv)
> > +{
> > +	struct seco_meccec_data *cec = priv;
> > +	struct device *dev = cec->dev;
> > +	struct seco_meccec_status_t status;
> > +	bool interrupt_served = false;
> > +	int ret, idx;
> > +
> > +	dev_dbg(dev, "Interrupt Called!\n");
> > +
> > +	ret = ec_cec_status(cec, &status);
> > +	if (ret) {
> > +		dev_warn(dev, "IRQ: status cmd failed %d\n", ret);
> > +		goto err;
> 
> Since there is only one goto, I think it is better to move the
> code after the 'err' label here, and drop the goto.
> 

Yes, way better.

> > +	}
> > +
> > +	for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
> > +		if (cec->channels & BIT_MASK(idx)) {
> 
> I'd invert this:
> 
> 		if (!(cec->channels & BIT_MASK(idx)))
> 			continue;
> 

Yes, I did that somewhere else, and it is more clean indeed.

> > +			int cec_val = get_status_ch(&status, idx);
> 
> Wouldn't cec_status be a better name for this variable?
> 

Yes, since it is the status of a CEC channel, makes sense. 

> > +
> > +			if (cec_val < 0)
> > +				continue;
> > +
> > +			if (cec_val & SECOCEC_STATUS_MSG_RECEIVED_MASK)
> > +				meccec_rx_done(cec, idx, cec_val);
> > +			if (cec_val & SECOCEC_STATUS_MSG_SENT_MASK)
> > +				meccec_tx_done(cec, idx, cec_val);
> > +
> > +			if (cec_val & (SECOCEC_STATUS_MSG_SENT_MASK |
> > +				       SECOCEC_STATUS_MSG_RECEIVED_MASK))
> > +				interrupt_served = true;
> > +		}
> > +	}
> > +	if (!interrupt_served)
> > +		dev_warn(dev, "Message not received or sent, but interrupt fired\n");
> > +
> > +	return IRQ_HANDLED;
> > +err:
> > +	/* reset status register */
> > +	ret = ec_cec_status(cec, NULL);
> > +	if (ret)
> > +		dev_err(dev, "IRQ: status cmd failed twice %d\n", ret);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +struct cec_dmi_match {
> > +	const char *sys_vendor;
> > +	const char *product_name;
> > +	const char *devname;
> > +	const char *conn[MECCEC_MAX_CEC_ADAP];
> > +};
> > +
> > +static const struct cec_dmi_match secocec_dmi_match_table[] = {
> > +	/* UDOO BOLT */
> > +	{ "Seco", "0C60", "0000:05:00.0", {"Port B", "Port C"} },
> > +	/* UDOO Vision */
> > +	{ "Seco", "0D02", "0000:00:02.0", {"Port B"} },
> > +	/* SECO SBC-D61 */
> > +	{ "Seco", "0D61", "0000:00:02.0", {"Port B", "Port C"} },
> > +};
> > +
> > +static struct device *seco_meccec_find_hdmi_dev(struct device *dev,
> > +						const char * const **conn_ptr)
> > +{
> > +	int i;
> > +
> > +	for (i = 0 ; i < ARRAY_SIZE(secocec_dmi_match_table) ; ++i) {
> > +		const struct cec_dmi_match *m = &secocec_dmi_match_table[i];
> > +
> > +		if (dmi_match(DMI_SYS_VENDOR, m->sys_vendor) &&
> > +		    dmi_match(DMI_PRODUCT_NAME, m->product_name)) {
> > +			struct device *d;
> > +
> > +			/* Find the device, bail out if not yet registered */
> > +			d = bus_find_device_by_name(&pci_bus_type, NULL,
> > +						    m->devname);
> > +			if (!d)
> > +				return ERR_PTR(-EPROBE_DEFER);
> > +
> > +			put_device(d);
> > +
> > +			if (!conn_ptr)
> > +				return ERR_PTR(-EFAULT);
> > +
> > +			*conn_ptr = m->conn;
> > +
> > +			return d;
> > +		}
> > +	}
> > +
> > +	return ERR_PTR(-EINVAL);
> > +}
> > +
> > +static int seco_meccec_acpi_probe(struct seco_meccec_data *sdev)
> > +{
> > +	struct device *dev = sdev->dev;
> > +	const struct acpi_device *adev = ACPI_COMPANION(dev);
> > +	const union acpi_object *obj;
> > +	struct gpio_desc *gpio;
> > +	int irq = 0;
> > +	int ret;
> > +
> > +	gpio = devm_gpiod_get(dev, "notify", GPIOF_IN);
> > +	if (IS_ERR(gpio)) {
> > +		dev_err(dev, "Cannot request interrupt gpio\n");
> > +		return PTR_ERR(gpio);
> > +	}
> > +
> > +	irq = gpiod_to_irq(gpio);
> > +	if (irq < 0) {
> > +		dev_err(dev, "Cannot find valid irq\n");
> > +		return -ENODEV;
> > +	}
> > +	dev_dbg(dev, "irq-gpio is bound to IRQ %d\n", irq);
> > +	sdev->irq = irq;
> > +
> > +	/* Get info from ACPI about channels capabilities */
> > +	ret = acpi_dev_get_property(adev, "av-channels",  ACPI_TYPE_INTEGER, &obj);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Cannot retrieve channel properties\n");
> > +		return ret;
> > +	}
> > +	dev_dbg(dev, "ACPI property: av-channels -> %x\n", (int)obj->integer.value);
> > +	sdev->channels = (int)obj->integer.value;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct cec_adap_ops meccec_cec_adap_ops = {
> > +	/* Low-level callbacks */
> > +	.adap_enable = meccec_adap_enable,
> > +	.adap_log_addr = meccec_adap_log_addr,
> > +	.adap_transmit = meccec_adap_transmit,
> > +};
> > +
> > +static int meccec_create_adapter(struct seco_meccec_data *cec, int idx)
> > +{
> > +	struct seco_meccec_adap_data *adap_data;
> > +	struct device *dev = cec->dev;
> > +	struct cec_adapter *acec;
> > +	char adap_name[32];
> > +
> > +	if (!cec)
> > +		return -EINVAL;
> > +
> > +	adap_data = devm_kzalloc(dev, sizeof(*adap_data), GFP_KERNEL);
> > +	if (!adap_data)
> > +		return -ENOMEM;
> > +
> > +	adap_data->cec = cec;
> > +	adap_data->idx = idx;
> > +
> > +	sprintf(adap_name, "%s-%d", dev_name(dev), idx);
> > +
> > +	/* Allocate CEC adapter */
> > +	acec = cec_allocate_adapter(&meccec_cec_adap_ops,
> > +				    adap_data,
> > +				    adap_name,
> > +				    CEC_CAP_DEFAULTS |
> > +				    CEC_CAP_CONNECTOR_INFO,
> > +				    MECCEC_MAX_ADDRS);
> > +
> > +	if (IS_ERR(acec))
> > +		return PTR_ERR(acec);
> > +
> > +	/* Assign to data */
> > +	cec->cec_adap[idx] = acec;
> > +
> > +	return 0;
> > +}
> > +
> > +static int seco_meccec_probe(struct platform_device *pdev)
> > +{
> > +	struct seco_meccec_data *meccec;
> > +	struct device *dev = &pdev->dev;
> > +	struct device *hdmi_dev;
> > +	const char * const *conn;
> > +	int ret, idx;
> > +	int adaps = 0;
> > +	int notifs = 0;
> > +
> > +	meccec = devm_kzalloc(dev, sizeof(*meccec), GFP_KERNEL);
> > +	if (!meccec)
> > +		return -ENOMEM;
> > +
> > +	dev_set_drvdata(dev, meccec);
> > +
> > +	meccec->pdev = pdev;
> > +	meccec->dev = dev;
> > +
> > +	ret = ec_get_version(meccec);
> > +	if (ret) {
> > +		dev_err(dev, "Get version failed\n");
> > +		goto err;
> > +	}
> > +
> > +	if (!has_acpi_companion(dev)) {
> > +		dev_err(dev, "Cannot find any ACPI companion\n");
> > +		ret = -ENODEV;
> > +		goto err;
> > +	}
> > +
> > +	ret = seco_meccec_acpi_probe(meccec);
> > +	if (ret) {
> > +		dev_err(dev, "ACPI probe failed\n");
> > +		goto err;
> > +	}
> > +
> > +	ret = devm_request_threaded_irq(dev,
> > +					meccec->irq,
> > +					NULL,
> > +					seco_meccec_irq_handler,
> > +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> > +					dev_name(&pdev->dev), meccec);
> > +
> > +	if (ret) {
> > +		dev_err(dev, "Cannot request IRQ %d\n", meccec->irq);
> > +		ret = -EIO;
> > +		goto err;
> > +	}
> > +
> > +	hdmi_dev = seco_meccec_find_hdmi_dev(&pdev->dev, &conn);
> > +	if (IS_ERR(hdmi_dev)) {
> > +		dev_err(dev, "Cannot find HDMI Device\n");
> > +		return PTR_ERR(hdmi_dev);
> > +	}
> > +	dev_dbg(dev, "HDMI device found\n");
> > +
> > +	for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
> > +		if (meccec->channels & BIT_MASK(idx)) {
> > +			ret = meccec_create_adapter(meccec, idx);
> > +			if (ret)
> > +				goto err_delete_adapter;
> > +
> > +			dev_dbg(dev, "CEC adapter #%d allocated\n", idx);
> > +			adaps++;
> > +		}
> > +	}
> > +
> > +	for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
> > +		if (meccec->channels & BIT_MASK(idx)) {
> > +			struct cec_adapter *acec = meccec->cec_adap[idx];
> > +			struct cec_notifier *ncec;
> > +
> > +			if (!acec) {
> > +				ret = -EINVAL;
> > +				goto err_notifier;
> > +			}
> > +
> > +			ncec = cec_notifier_cec_adap_register(hdmi_dev,
> > +							      conn[idx], acec);
> > +
> > +			dev_dbg(dev, "CEC notifier #%d allocated %s\n", idx, conn[idx]);
> > +
> > +			if (IS_ERR(ncec)) {
> > +				ret = PTR_ERR(ncec);
> > +				goto err_notifier;
> > +			}
> > +
> > +			meccec->notifier[idx] = ncec;
> > +			notifs++;
> > +		}
> > +	}
> > +
> > +	for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
> > +		if (meccec->channels & BIT_MASK(idx)) {
> > +			ret = cec_register_adapter(meccec->cec_adap[idx], dev);
> > +			if (ret)
> > +				goto err_notifier;
> > +
> > +			dev_dbg(dev, "CEC adapter #%d registered\n", idx);
> > +		}
> > +	}
> > +
> > +	platform_set_drvdata(pdev, meccec);
> > +	dev_dbg(dev, "Device registered\n");
> > +
> > +	return ret;
> > +
> > +err_notifier:
> > +	for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
> > +		if (meccec->channels & BIT_MASK(idx)) {
> > +			if (adaps--)
> > +				return ret;
> > +
> > +			cec_notifier_cec_adap_unregister(meccec->notifier[idx],
> > +							 meccec->cec_adap[idx]);
> > +		}
> > +	}
> > +err_delete_adapter:
> > +	for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
> > +		if (meccec->channels & BIT_MASK(idx)) {
> > +			if (notifs--)
> > +				return ret;
> > +
> > +			cec_delete_adapter(meccec->cec_adap[idx]);
> > +		}
> > +	}
> > +err:
> > +	dev_err(dev, "%s device probe failed: %d\n", dev_name(dev), ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int seco_meccec_remove(struct platform_device *pdev)
> > +{
> > +	struct seco_meccec_data *meccec = platform_get_drvdata(pdev);
> > +	int idx;
> > +
> > +	for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
> > +		if (meccec->channels && BIT_MASK(idx)) {
> > +			cec_notifier_cec_adap_unregister(meccec->notifier[idx],
> > +							 meccec->cec_adap[idx]);
> > +
> > +			cec_unregister_adapter(meccec->cec_adap[idx]);
> > +		}
> > +	}
> > +
> > +	dev_dbg(&pdev->dev, "CEC device removed\n");
> > +
> > +	return 0;
> > +}
> > +
> > +#ifdef CONFIG_PM_SLEEP
> > +static int seco_meccec_resume(struct device *dev)
> > +{
> > +	struct seco_meccec_data *cec = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	dev_dbg(dev, "Device resumed from suspend\n");
> > +
> > +	/* reset status register */
> > +	ret = ec_cec_status(cec, NULL);
> > +	if (ret)
> > +		dev_err(dev, "resume: status operation failed %d\n", ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(seco_meccec_pm_ops, NULL, seco_meccec_resume);
> > +#define SECO_MECCEC_PM_OPS (&seco_meccec_pm_ops)
> > +#else
> > +#define SECO_MECCEC_PM_OPS NULL
> > +#endif
> > +
> > +#ifdef CONFIG_ACPI
> > +static const struct acpi_device_id seco_meccec_acpi_match[] = {
> > +	{"CEC00002", 0},
> > +	{},
> > +};
> > +
> > +MODULE_DEVICE_TABLE(acpi, seco_meccec_acpi_match);
> > +#endif
> > +
> > +static struct platform_driver seco_meccec_driver = {
> > +	.driver = {
> > +		.name = SECO_MECCEC_DEV_NAME,
> > +		.acpi_match_table = ACPI_PTR(seco_meccec_acpi_match),
> > +		.pm = SECO_MECCEC_PM_OPS,
> > +	},
> > +	.probe = seco_meccec_probe,
> > +	.remove = seco_meccec_remove,
> > +};
> > +
> > +module_platform_driver(seco_meccec_driver);
> > +
> > +MODULE_DESCRIPTION("SECO MEC CEC Driver");
> > +MODULE_AUTHOR("Ettore Chimenti <ek5.chimenti@gmail.com>");
> > +MODULE_LICENSE("Dual BSD/GPL");
> > diff --git a/drivers/media/cec/platform/seco/seco-meccec.h b/drivers/media/cec/platform/seco/seco-meccec.h
> > new file mode 100644
> > index 000000000000..6f7fc9e13e30
> > --- /dev/null
> > +++ b/drivers/media/cec/platform/seco/seco-meccec.h
> > @@ -0,0 +1,130 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> > + * CEC driver for SECO MEC-based Boards
> > + *
> > + * Author:  Ettore Chimenti <ek5.chimenti@gmail.com>
> > + * Copyright (C) 2022, SECO SpA.
> > + */
> > +
> > +/* MailBox definitions */
> > +#define MBX_RESERVED_SIZE	0x10
> > +#define MBX_RESERVED_BASE	0x2b0
> > +
> > +#define BAR_FROM_MBX_BASE(x)	(x + MBX_RESERVED_BASE)
> > +
> > +#define RES_BAR_OFFSET		0
> > +#define BSY_BAR_OFFSET		4
> > +#define MBX_BAR_OFFSET		0xc
> > +
> > +#define MBX_RESOURCE_REGISTER	BAR_FROM_MBX_BASE(RES_BAR_OFFSET)
> > +#define MBX_BUSY_REGISTER	BAR_FROM_MBX_BASE(BSY_BAR_OFFSET)
> > +#define MBX_ACCESS_BAR		BAR_FROM_MBX_BASE(MBX_BAR_OFFSET)
> > +
> > +#define EC_REGISTER_INDEX	MBX_ACCESS_BAR
> > +#define EC_REGISTER_DATA	(EC_REGISTER_INDEX + 1)
> > +#define EC_MBX_SIZE		0x20
> > +
> > +#define EC_COMMAND_REGISTER	0
> > +#define EC_RESULT_REGISTER	1
> > +#define EC_STATUS_REGISTER	2
> > +#define EC_MBX_REGISTER		0x10
> > +
> > +#define EC_CMD_TIMEOUT		0x30000 /* Maximum wait loop */
> > +
> > +/* Firmware version data struct and definitions */
> > +#define FIRMWARE_TIME_STAMP_SIZE (EC_MBX_SIZE - sizeof(u32))
> > +
> > +struct version_t {
> > +	u8 minor;
> > +	u8 major;
> > +};
> > +
> > +struct version_msg_t {
> > +	struct version_t fw;
> > +	struct version_t lib;
> > +	u8 firmware_ts[FIRMWARE_TIME_STAMP_SIZE];
> > +};
> > +
> > +/* CEC data structs and constant definitions */
> > +#define MECCEC_MAX_MSG_SIZE 16
> > +
> > +struct seco_meccec_msg_t {
> > +	u8 bus;
> > +	u8 send;
> > +	u8 dest;
> > +	u8 data[MECCEC_MAX_MSG_SIZE];
> > +	u8 size;
> > +};
> > +
> > +struct seco_meccec_logaddr_t {
> > +	u8 bus;
> > +	u8 addr;
> > +};
> > +
> > +struct seco_meccec_phyaddr_t {
> > +	u16 bus;
> > +	u16 addr;
> > +};
> > +
> > +struct seco_meccec_status_t {
> > +	u8 status_ch0;
> > +	u8 status_ch1;
> > +	u8 status_ch2;
> > +	u8 status_ch3;
> > +};
> > +
> > +/* Status data */
> > +#define SECOCEC_STATUS_MSG_RECEIVED_MASK	BIT(0)
> > +#define SECOCEC_STATUS_RX_ERROR_MASK		BIT(1)
> > +#define SECOCEC_STATUS_MSG_SENT_MASK		BIT(2)
> > +#define SECOCEC_STATUS_TX_ERROR_MASK		BIT(3)
> > +
> > +#define SECOCEC_STATUS_TX_NACK_ERROR		BIT(4)
> > +#define SECOCEC_STATUS_RX_OVERFLOW_MASK		BIT(5)
> > +
> > +/* MBX Status bitmap values from EC to Host */
> > +enum MBX_STATUS {
> > +	MBX_OFF     = 0,	/* Disable MBX Interface */
> > +	MBX_ON      = 1,	/* Enable MBX Interface  */
> > +	MBX_ACTIVE0 = (1 << 6),	/* MBX AGENT 0 active    */
> > +	MBX_QUEUED0 = (1 << 7),	/* MBX AGENT 0 idle      */
> > +};
> > +
> > +#define AGENT_IDLE(x)      0
> > +#define AGENT_QUEUED(x)    (MBX_QUEUED0 >> (2 * x))
> > +#define AGENT_ACTIVE(x)    (MBX_ACTIVE0 >> (2 * x))
> > +#define AGENT_MASK(x)      (AGENT_QUEUED(x) + AGENT_ACTIVE(x))
> > +#define AGENT_DONE(x)      AGENT_MASK(x)
> > +#define MBX_STATUS_DEFAULT 0
> > +
> > +/* MBX user IDs */
> > +enum AGENT_IDS {
> > +	AGENT_BIOS, /* BIOS AGENT */
> > +	AGENT_ACPI, /* ACPI AGENT */
> > +	AGENT_EAPI, /* EAPI AGENT */
> > +	AGENT_USER, /* USER AGENT */
> > +	AGENT_NONE, /* No AGENT   */
> > +};
> > +
> > +/* MBX command results */
> > +enum CMD_RESULT {
> > +	EC_NO_ERROR = 0,		/* Success	    */
> > +	EC_UNKNOWN_COMMAND_ERROR,	/* Unknown command  */
> > +	EC_INVALID_ARGUMENT_ERROR,	/* Invalid argument */
> > +	EC_TIMEOUT_ERROR,		/* Waiting Time-out */
> > +	EC_DEVICE_ERROR,		/* Device error     */
> > +};
> > +
> > +/* MBX commands */
> > +enum MBX_CMDS {
> > +	GET_FIRMWARE_VERSION_CMD = 0,    /* Get firmware version record		*/
> > +	CEC_WRITE_CMD		 = 0x80, /* Write CEC command			*/
> > +	CEC_READ_CMD		 = 0x81, /* Read CEC command			*/
> > +	GET_CEC_STATUS_CMD	 = 0x82, /* Get CEC status regisers		*/
> > +	SET_CEC_LOGADDR_CMD	 = 0x83, /* Set CEC Logical Address		*/
> > +	SET_CEC_PHYADDR_CMD	 = 0x84, /* Set CEC Physical Address		*/
> > +	REQUEST_MBX_ACCESS_CMD   = 0xf0, /* First request access command	*/
> > +	RELEASE_MBX_ACCESS_CMD   = 0xf8, /* First release access command	*/
> > +};
> > +
> > +#define REQUEST_MBX_ACCESS(x) (REQUEST_MBX_ACCESS_CMD + x)
> > +#define RELEASE_MBX_ACCESS(x) (RELEASE_MBX_ACCESS_CMD + x)
> 
> Regards,
> 
> 	Hans
