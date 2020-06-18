Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438E71FEF43
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 12:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728545AbgFRKFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 06:05:54 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42343 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728416AbgFRKFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 06:05:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id lrQXjdZULlCoGlrQaj7RGT; Thu, 18 Jun 2020 12:05:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592474749; bh=q1G85Aku/4q7/S2PyHhvVQwDWUQSpFJth5UaN3lqDYk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bqrWkXo0escwSEhgitDgY7v55EpGhlahsoeS/HFmBHLCljaETteuDvtaBTBGZUdTn
         BxzzH/xGXrqsw2G/zzsMHlUW+bNBpwk8C942eO83v7bw/EVJyn6qYHmUKlTTOSuYfg
         W1M2bhf5Qvv9mN4LmrIgrM1V8UvpLtX229OoXuIswga/rGfO645q2svtz3WZ4g3tIX
         EZYd0PHIERySN90Oor4UPFGgA2nB4TGzUYTLdRAQGNIBLBYRgIcHPuxW2ExyB9rK89
         LEV+3U8qVp+lA5qnev/r7Y3fej+2Ju9UpeQ+J0wUi0Qy18ZHEHNcxNo2Rj6vtGSJTW
         1Ad4Riqc9RBsQ==
Subject: Re: [PATCH v5 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller
 driver
To:     Jeff Chase <jnchase@google.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200615193811.233737-1-jnchase@google.com>
 <20200615193811.233737-3-jnchase@google.com>
 <3aefc5c4-2af1-59f2-0797-9a5baf91482e@xs4all.nl>
 <CALTkaQ3n30nS-b1XuMiu_Z4+FfD0horJDagCPBaUqCCx4JhtdA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e45bf5a1-3862-66a2-213b-f7e5563e5a5d@xs4all.nl>
Date:   Thu, 18 Jun 2020 12:05:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALTkaQ3n30nS-b1XuMiu_Z4+FfD0horJDagCPBaUqCCx4JhtdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBZeuqAVQy6Q3FWsTIA7BP7DhRF2P893JpyL+L1aPhRLkq6LrrNj9jCDgsnfEX2oRLn6zZ8mnwPqeaiAV8Nqw4nOGaYX3bZtl9wRcweO6wEjY+zxNml7
 cycWi/hXDyArDOidJ0BNtLUrqumqJIadSDvSAFtdmZ7MGKxufxw0p5yGktSzvlV4CdQTUS1gOxQ1PkuGrbQd3tPrYwUhMfC8cTyhxiH9D6V5xEQfWeCbAlUg
 fMpcIxG5z1rXTN/KTBLxqkAyCcmiZ6eelSInCKNfFdzc1jmbORfB7Tr6s67vogWbBHU5FPKH2sDSguvIx76j4A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/06/2020 10:59, Jeff Chase wrote:
> Hi Hans,
> 
> We are using two of these in an Intel-based Chromebox. I see that the
> cros-ec and seco drivers just statically define the PCI BDF of the
> Intel graphics device for their boards. I don't see an example of ACPI
> passing this information. I can copy cros-ec and seco by adding a
> board table and then use the UID of each device to select the correct
> port. Adding board-specific configuration to the driver doesn't seem
> ideal but I'm not sure what the proper way to pass this using ACPI is.

You are right, it's not ACPI, it's using DMI matching.

I have zero knowledge about ACPI, so I have no idea if there is some standard
method of retrieving this association via ACPI.

This particular chip can actually be used both with DMI matching but also
on an ARM with device tree, but since you can't test this on an ARM board,
there is no point in adding support for that.

However, compared to the cros-ec and seco drivers you can do something a bit
different here: those drivers just return -ENODEV if there is no match, but
since this driver reads the EDID it can just continue as long as it does not
set the CEC_CAP_CONNECTOR_INFO capability.

Regards,

	Hans

> 
> Thanks,
> Jeff
> 
> On Thu, Jun 18, 2020 at 12:51 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Hi Jeff,
>>
>> I realized that there is one thing missing here: there is no way to
>> associate this CEC device with the corresponding HDMI interface.
>>
>> Typically this is done either via the device tree (hdmi-phandle property,
>> see cec_notifier_parse_hdmi_phandle()) or ACPI (see cros-ec or seco drivers).
>>
>> How is this ch7322 used? Chromebooks? Intel or ARM based?
>>
>> The link with the HDMI interface is needed for the CEC_ADAP_G_CONNECTOR_INFO
>> ioctl implementation. See:
>>
>> https://hverkuil.home.xs4all.nl/spec/userspace-api/cec/cec-ioc-adap-g-conn-info.html
>>
>> Regards,
>>
>>         Hans
>>
>> On 15/06/2020 21:38, Jeff Chase wrote:
>>> Add a CEC device driver for the Chrontel ch7322 CEC conroller.
>>> This is an I2C device capable of sending and receiving CEC messages.
>>>
>>> Signed-off-by: Jeff Chase <jnchase@google.com>
>>> ---
>>>  MAINTAINERS                    |   1 +
>>>  drivers/media/cec/Kconfig      |   1 +
>>>  drivers/media/cec/Makefile     |   2 +-
>>>  drivers/media/cec/i2c/Kconfig  |  14 +
>>>  drivers/media/cec/i2c/Makefile |   5 +
>>>  drivers/media/cec/i2c/ch7322.c | 503 +++++++++++++++++++++++++++++++++
>>>  6 files changed, 525 insertions(+), 1 deletion(-)
>>>  create mode 100644 drivers/media/cec/i2c/Kconfig
>>>  create mode 100644 drivers/media/cec/i2c/Makefile
>>>  create mode 100644 drivers/media/cec/i2c/ch7322.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c1c17ca17830..e2341eaaaf5e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -4107,6 +4107,7 @@ L:      linux-media@vger.kernel.org
>>>  S:   Maintained
>>>  T:   git git://linuxtv.org/media_tree.git
>>>  F:   Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
>>> +F:   drivers/media/cec/i2c/ch7322.c
>>>
>>>  CIRRUS LOGIC AUDIO CODEC DRIVERS
>>>  M:   James Schulman <james.schulman@cirrus.com>
>>> diff --git a/drivers/media/cec/Kconfig b/drivers/media/cec/Kconfig
>>> index 7e830444bdbb..9ba3a00dce31 100644
>>> --- a/drivers/media/cec/Kconfig
>>> +++ b/drivers/media/cec/Kconfig
>>> @@ -33,6 +33,7 @@ menuconfig MEDIA_CEC_SUPPORT
>>>         adapter that supports HDMI CEC.
>>>
>>>  if MEDIA_CEC_SUPPORT
>>> +source "drivers/media/cec/i2c/Kconfig"
>>>  source "drivers/media/cec/platform/Kconfig"
>>>  source "drivers/media/cec/usb/Kconfig"
>>>  endif
>>> diff --git a/drivers/media/cec/Makefile b/drivers/media/cec/Makefile
>>> index 74e80e1b3571..23539339bc81 100644
>>> --- a/drivers/media/cec/Makefile
>>> +++ b/drivers/media/cec/Makefile
>>> @@ -1,2 +1,2 @@
>>>  # SPDX-License-Identifier: GPL-2.0
>>> -obj-y += core/ platform/ usb/
>>> +obj-y += core/ i2c/ platform/ usb/
>>> diff --git a/drivers/media/cec/i2c/Kconfig b/drivers/media/cec/i2c/Kconfig
>>> new file mode 100644
>>> index 000000000000..e445ca2110b3
>>> --- /dev/null
>>> +++ b/drivers/media/cec/i2c/Kconfig
>>> @@ -0,0 +1,14 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +#
>>> +# I2C drivers
>>> +
>>> +config CEC_CH7322
>>> +     tristate "Chrontel CH7322 CEC controller"
>>> +     select I2C
>>> +     select REGMAP_I2C
>>> +     select CEC_CORE
>>> +     help
>>> +       This is a driver for the Chrontel CH7322 CEC controller. It uses the
>>> +       generic CEC framework interface.
>>> +       CEC bus is present in the HDMI connector and enables communication
>>> +       between compatible devices.
>>> diff --git a/drivers/media/cec/i2c/Makefile b/drivers/media/cec/i2c/Makefile
>>> new file mode 100644
>>> index 000000000000..d7496dfd0fa4
>>> --- /dev/null
>>> +++ b/drivers/media/cec/i2c/Makefile
>>> @@ -0,0 +1,5 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +#
>>> +# Makefile for the CEC I2C device drivers.
>>> +#
>>> +obj-$(CONFIG_CEC_CH7322) += ch7322.o
>>> diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
>>> new file mode 100644
>>> index 000000000000..4e6976a51774
>>> --- /dev/null
>>> +++ b/drivers/media/cec/i2c/ch7322.c
>>> @@ -0,0 +1,503 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Driver for the Chrontel CH7322 CEC Controller
>>> + *
>>> + * Copyright 2020 Google LLC.
>>> + */
>>> +
>>> +/*
>>> + * Notes
>>> + *
>>> + * - This device powers on in Auto Mode which has limited functionality. This
>>> + *   driver disables Auto Mode when it attaches.
>>> + *
>>> + */
>>> +
>>> +#include <linux/cec.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/regmap.h>
>>> +#include <media/cec.h>
>>> +
>>> +#define CH7322_WRITE         0x00
>>> +#define CH7322_WRITE_MSENT           0x80
>>> +#define CH7322_WRITE_BOK             0x40
>>> +#define CH7322_WRITE_NMASK           0x0f
>>> +
>>> +/* Write buffer is 0x01-0x10 */
>>> +#define CH7322_WRBUF         0x01
>>> +#define CH7322_WRBUF_LEN     0x10
>>> +
>>> +#define CH7322_READ          0x40
>>> +#define CH7322_READ_NRDT             0x80
>>> +#define CH7322_READ_MSENT            0x20
>>> +#define CH7322_READ_NMASK            0x0f
>>> +
>>> +/* Read buffer is 0x41-0x50 */
>>> +#define CH7322_RDBUF         0x41
>>> +#define CH7322_RDBUF_LEN     0x10
>>> +
>>> +#define CH7322_MODE          0x11
>>> +#define CH7322_MODE_AUTO             0x78
>>> +#define CH7322_MODE_SW                       0xb5
>>> +
>>> +#define CH7322_RESET         0x12
>>> +#define CH7322_RESET_RST             0x00
>>> +
>>> +#define CH7322_POWER         0x13
>>> +#define CH7322_POWER_FPD             0x04
>>> +
>>> +#define CH7322_CFG0          0x17
>>> +#define CH7322_CFG0_EOBEN            0x40
>>> +#define CH7322_CFG0_PEOB             0x20
>>> +#define CH7322_CFG0_CLRSPP           0x10
>>> +#define CH7322_CFG0_FLOW             0x08
>>> +
>>> +#define CH7322_CFG1          0x1a
>>> +#define CH7322_CFG1_STDBYO           0x04
>>> +#define CH7322_CFG1_HPBP             0x02
>>> +#define CH7322_CFG1_PIO                      0x01
>>> +
>>> +#define CH7322_INTCTL                0x1b
>>> +#define CH7322_INTCTL_INTPB          0x80
>>> +#define CH7322_INTCTL_STDBY          0x40
>>> +#define CH7322_INTCTL_HPDFALL                0x20
>>> +#define CH7322_INTCTL_HPDRISE                0x10
>>> +#define CH7322_INTCTL_RXMSG          0x08
>>> +#define CH7322_INTCTL_TXMSG          0x04
>>> +#define CH7322_INTCTL_NEWPHA         0x02
>>> +#define CH7322_INTCTL_ERROR          0x01
>>> +
>>> +#define CH7322_DVCLKFNH      0x1d
>>> +#define CH7322_DVCLKFNL      0x1e
>>> +
>>> +#define CH7322_CTL           0x31
>>> +#define CH7322_CTL_FSTDBY            0x80
>>> +#define CH7322_CTL_PLSEN             0x40
>>> +#define CH7322_CTL_PLSPB             0x20
>>> +#define CH7322_CTL_SPADL             0x10
>>> +#define CH7322_CTL_HINIT             0x08
>>> +#define CH7322_CTL_WPHYA             0x04
>>> +#define CH7322_CTL_H1T                       0x02
>>> +#define CH7322_CTL_S1T                       0x01
>>> +
>>> +#define CH7322_PAWH          0x32
>>> +#define CH7322_PAWL          0x33
>>> +
>>> +#define CH7322_ADDLW         0x34
>>> +#define CH7322_ADDLW_MASK    0xf0
>>> +
>>> +#define CH7322_ADDLR         0x3d
>>> +#define CH7322_ADDLR_HPD             0x80
>>> +#define CH7322_ADDLR_MASK            0x0f
>>> +
>>> +#define CH7322_INTDATA               0x3e
>>> +#define CH7322_INTDATA_MODE          0x80
>>> +#define CH7322_INTDATA_STDBY         0x40
>>> +#define CH7322_INTDATA_HPDFALL               0x20
>>> +#define CH7322_INTDATA_HPDRISE               0x10
>>> +#define CH7322_INTDATA_RXMSG         0x08
>>> +#define CH7322_INTDATA_TXMSG         0x04
>>> +#define CH7322_INTDATA_NEWPHA                0x02
>>> +#define CH7322_INTDATA_ERROR         0x01
>>> +
>>> +#define CH7322_EVENT         0x3F
>>> +#define CH7322_EVENT_TXERR           0x80
>>> +#define CH7322_EVENT_HRST            0x40
>>> +#define CH7322_EVENT_HFST            0x20
>>> +#define CH7322_EVENT_PHACHG          0x10
>>> +#define CH7322_EVENT_ACTST           0x08
>>> +#define CH7322_EVENT_PHARDY          0x04
>>> +#define CH7322_EVENT_BSOK            0x02
>>> +#define CH7322_EVENT_ERRADCF         0x01
>>> +
>>> +#define CH7322_DID           0x51
>>> +#define CH7322_DID_CH7322            0x5b
>>> +#define CH7322_DID_CH7323            0x5f
>>> +
>>> +#define CH7322_REVISIONID    0x52
>>> +
>>> +#define CH7322_PARH          0x53
>>> +#define CH7322_PARL          0x54
>>> +
>>> +#define CH7322_IOCFG2                0x75
>>> +#define CH7322_IOCFG_CIO             0x80
>>> +#define CH7322_IOCFG_IOCFGMASK               0x78
>>> +#define CH7322_IOCFG_AUDIO           0x04
>>> +#define CH7322_IOCFG_SPAMST          0x02
>>> +#define CH7322_IOCFG_SPAMSP          0x01
>>> +
>>> +#define CH7322_CTL3          0x7b
>>> +#define CH7322_CTL3_SWENA            0x80
>>> +#define CH7322_CTL3_FC_INIT          0x40
>>> +#define CH7322_CTL3_SML_FL           0x20
>>> +#define CH7322_CTL3_SM_RDST          0x10
>>> +#define CH7322_CTL3_SPP_CIAH         0x08
>>> +#define CH7322_CTL3_SPP_CIAL         0x04
>>> +#define CH7322_CTL3_SPP_ACTH         0x02
>>> +#define CH7322_CTL3_SPP_ACTL         0x01
>>> +
>>> +/* BOK status means NACK */
>>> +#define CH7322_TX_FLAG_NACK  BIT(0)
>>> +/* Device will retry automatically */
>>> +#define CH7322_TX_FLAG_RETRY BIT(1)
>>> +
>>> +struct ch7322 {
>>> +     struct i2c_client *i2c;
>>> +     struct regmap *regmap;
>>> +     struct cec_adapter *cec;
>>> +     struct mutex mutex;     /* device access mutex */
>>> +     u8 tx_flags;
>>> +};
>>> +
>>> +static const struct regmap_config ch7322_regmap = {
>>> +     .reg_bits = 8,
>>> +     .val_bits = 8,
>>> +     .max_register = 0x7f,
>>> +     .disable_locking = true,
>>> +
>>> +};
>>> +
>>> +static int ch7322_send_message(struct ch7322 *ch7322, const struct cec_msg *msg)
>>> +{
>>> +     unsigned int val;
>>> +     unsigned int len = msg->len;
>>> +     int ret;
>>> +     int i;
>>> +
>>> +     WARN_ON(!mutex_is_locked(&ch7322->mutex));
>>> +
>>> +     if (len > CH7322_WRBUF_LEN || len < 1)
>>> +             return -EINVAL;
>>> +
>>> +     ret = regmap_read(ch7322->regmap, CH7322_WRITE, &val);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /* Buffer not ready */
>>> +     if (!(val & CH7322_WRITE_MSENT))
>>> +             return -EBUSY;
>>> +
>>> +     if (cec_msg_opcode(msg) == -1 &&
>>> +         cec_msg_initiator(msg) == cec_msg_destination(msg)) {
>>> +             ch7322->tx_flags = CH7322_TX_FLAG_NACK | CH7322_TX_FLAG_RETRY;
>>> +     } else if (cec_msg_is_broadcast(msg)) {
>>> +             ch7322->tx_flags = CH7322_TX_FLAG_NACK;
>>> +     } else {
>>> +             ch7322->tx_flags = CH7322_TX_FLAG_RETRY;
>>> +     }
>>> +
>>> +     ret = regmap_write(ch7322->regmap, CH7322_WRITE, len - 1);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     for (i = 0; i < len; i++) {
>>> +             ret = regmap_write(ch7322->regmap,
>>> +                                CH7322_WRBUF + i, msg->msg[i]);
>>> +             if (ret)
>>> +                     return ret;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int ch7322_receive_message(struct ch7322 *ch7322, struct cec_msg *msg)
>>> +{
>>> +     unsigned int val;
>>> +     int ret = 0;
>>> +     int i;
>>> +
>>> +     WARN_ON(!mutex_is_locked(&ch7322->mutex));
>>> +
>>> +     ret = regmap_read(ch7322->regmap, CH7322_READ, &val);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /* Message not ready */
>>> +     if (!(val & CH7322_READ_NRDT))
>>> +             return -EIO;
>>> +
>>> +     msg->len = (val & CH7322_READ_NMASK) + 1;
>>> +
>>> +     /* Read entire RDBUF to clear state */
>>> +     for (i = 0; i < CH7322_RDBUF_LEN; i++) {
>>> +             ret = regmap_read(ch7322->regmap, CH7322_RDBUF + i, &val);
>>> +             if (ret)
>>> +                     return ret;
>>> +             msg->msg[i] = (u8)val;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void ch7322_tx_done(struct ch7322 *ch7322)
>>> +{
>>> +     int ret;
>>> +     unsigned int val;
>>> +     u8 status, flags;
>>> +
>>> +     mutex_lock(&ch7322->mutex);
>>> +     ret = regmap_read(ch7322->regmap, CH7322_WRITE, &val);
>>> +     flags = ch7322->tx_flags;
>>> +     mutex_unlock(&ch7322->mutex);
>>> +
>>> +     /*
>>> +      * The device returns a one-bit OK status which usually means ACK but
>>> +      * actually means NACK when sending a logical address query or a
>>> +      * broadcast.
>>> +      */
>>> +     if (ret)
>>> +             status = CEC_TX_STATUS_ERROR;
>>> +     else if ((val & CH7322_WRITE_BOK) && (flags & CH7322_TX_FLAG_NACK))
>>> +             status = CEC_TX_STATUS_NACK;
>>> +     else if (val & CH7322_WRITE_BOK)
>>> +             status = CEC_TX_STATUS_OK;
>>> +     else if (flags & CH7322_TX_FLAG_NACK)
>>> +             status = CEC_TX_STATUS_OK;
>>> +     else
>>> +             status = CEC_TX_STATUS_NACK;
>>> +
>>> +     if (status == CEC_TX_STATUS_NACK && (flags & CH7322_TX_FLAG_RETRY))
>>> +             status |= CEC_TX_STATUS_MAX_RETRIES;
>>> +
>>> +     cec_transmit_attempt_done(ch7322->cec, status);
>>> +}
>>> +
>>> +static void ch7322_rx_done(struct ch7322 *ch7322)
>>> +{
>>> +     struct cec_msg msg;
>>> +     int ret;
>>> +
>>> +     mutex_lock(&ch7322->mutex);
>>> +     ret = ch7322_receive_message(ch7322, &msg);
>>> +     mutex_unlock(&ch7322->mutex);
>>> +
>>> +     if (ret)
>>> +             dev_err(&ch7322->i2c->dev, "cec receive error: %d\n", ret);
>>> +     else
>>> +             cec_received_msg(ch7322->cec, &msg);
>>> +}
>>> +
>>> +/*
>>> + * This device can either monitor the DDC lines to obtain the physical address
>>> + * or it can allow the host to program it. This driver lets the device obtain
>>> + * it.
>>> + */
>>> +static void ch7322_phys_addr(struct ch7322 *ch7322)
>>> +{
>>> +     unsigned int pah, pal;
>>> +     int ret = 0;
>>> +
>>> +     mutex_lock(&ch7322->mutex);
>>> +     ret |= regmap_read(ch7322->regmap, CH7322_PARH, &pah);
>>> +     ret |= regmap_read(ch7322->regmap, CH7322_PARL, &pal);
>>> +     mutex_unlock(&ch7322->mutex);
>>> +
>>> +     if (ret)
>>> +             dev_err(&ch7322->i2c->dev, "phys addr error\n");
>>> +     else
>>> +             cec_s_phys_addr(ch7322->cec, pal | (pah << 8), false);
>>> +}
>>> +
>>> +static void ch7322_handle_events(struct ch7322 *ch7322)
>>> +{
>>> +     unsigned int data = 0;
>>> +
>>> +     mutex_lock(&ch7322->mutex);
>>> +     regmap_read(ch7322->regmap, CH7322_INTDATA, &data);
>>> +     regmap_write(ch7322->regmap, CH7322_INTDATA, data);
>>> +     mutex_unlock(&ch7322->mutex);
>>> +
>>> +     if (data & CH7322_INTDATA_HPDFALL)
>>> +             cec_phys_addr_invalidate(ch7322->cec);
>>> +
>>> +     if (data & CH7322_INTDATA_TXMSG)
>>> +             ch7322_tx_done(ch7322);
>>> +
>>> +     if (data & CH7322_INTDATA_RXMSG)
>>> +             ch7322_rx_done(ch7322);
>>> +
>>> +     if (data & CH7322_INTDATA_NEWPHA)
>>> +             ch7322_phys_addr(ch7322);
>>> +
>>> +     if (data & CH7322_INTDATA_ERROR)
>>> +             dev_dbg(&ch7322->i2c->dev, "unknown error\n");
>>> +}
>>> +
>>> +static irqreturn_t ch7322_irq(int irq, void *dev)
>>> +{
>>> +     struct ch7322 *ch7322 = dev;
>>> +
>>> +     ch7322_handle_events(ch7322);
>>> +
>>> +     return IRQ_HANDLED;
>>> +}
>>> +
>>> +/* This device is always enabled */
>>> +static int ch7322_cec_adap_enable(struct cec_adapter *adap, bool enable)
>>> +{
>>> +     return 0;
>>> +}
>>> +
>>> +static int ch7322_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
>>> +{
>>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
>>> +     int ret;
>>> +
>>> +     mutex_lock(&ch7322->mutex);
>>> +     ret = regmap_update_bits(ch7322->regmap, CH7322_ADDLW,
>>> +                              CH7322_ADDLW_MASK, log_addr << 4);
>>> +     mutex_unlock(&ch7322->mutex);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int ch7322_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
>>> +                                 u32 signal_free_time, struct cec_msg *msg)
>>> +{
>>> +     struct ch7322 *ch7322 = cec_get_drvdata(adap);
>>> +     int ret;
>>> +
>>> +     mutex_lock(&ch7322->mutex);
>>> +     ret = ch7322_send_message(ch7322, msg);
>>> +     mutex_unlock(&ch7322->mutex);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static const struct cec_adap_ops ch7322_cec_adap_ops = {
>>> +     .adap_enable = ch7322_cec_adap_enable,
>>> +     .adap_log_addr = ch7322_cec_adap_log_addr,
>>> +     .adap_transmit = ch7322_cec_adap_transmit,
>>> +};
>>> +
>>> +static int ch7322_probe(struct i2c_client *client)
>>> +{
>>> +     struct ch7322 *ch7322;
>>> +     int ret;
>>> +     unsigned int val;
>>> +
>>> +     ch7322 = devm_kzalloc(&client->dev, sizeof(*ch7322), GFP_KERNEL);
>>> +     if (!ch7322)
>>> +             return -ENOMEM;
>>> +
>>> +     ch7322->regmap = devm_regmap_init_i2c(client, &ch7322_regmap);
>>> +     if (IS_ERR(ch7322->regmap))
>>> +             return PTR_ERR(ch7322->regmap);
>>> +
>>> +     ret = regmap_read(ch7322->regmap, CH7322_DID, &val);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (val != CH7322_DID_CH7322)
>>> +             return -ENOTSUPP;
>>> +
>>> +     mutex_init(&ch7322->mutex);
>>> +     ch7322->i2c = client;
>>> +     ch7322->tx_flags = 0;
>>> +
>>> +     i2c_set_clientdata(client, ch7322);
>>> +
>>> +     /* Disable auto mode */
>>> +     ret = regmap_write(ch7322->regmap, CH7322_MODE, CH7322_MODE_SW);
>>> +     if (ret)
>>> +             goto err_mutex;
>>> +
>>> +     /* Enable logical address register */
>>> +     ret = regmap_update_bits(ch7322->regmap, CH7322_CTL,
>>> +                              CH7322_CTL_SPADL, CH7322_CTL_SPADL);
>>> +     if (ret)
>>> +             goto err_mutex;
>>> +
>>> +     ch7322->cec = cec_allocate_adapter(&ch7322_cec_adap_ops, ch7322,
>>> +                                        dev_name(&client->dev),
>>> +                                        CEC_CAP_DEFAULTS, 1);
>>> +
>>> +     if (IS_ERR(ch7322->cec)) {
>>> +             ret = PTR_ERR(ch7322->cec);
>>> +             goto err_mutex;
>>> +     }
>>> +
>>> +     ret = cec_register_adapter(ch7322->cec, &client->dev);
>>> +     if (ret) {
>>> +             cec_delete_adapter(ch7322->cec);
>>> +             goto err_mutex;
>>> +     }
>>> +
>>> +     /* Configure and mask interrupt */
>>> +     ret = regmap_write(ch7322->regmap, CH7322_CFG1, 0);
>>> +     if (ret)
>>> +             goto err_cec;
>>> +
>>> +     ret = regmap_write(ch7322->regmap, CH7322_INTCTL, CH7322_INTCTL_INTPB);
>>> +     if (ret)
>>> +             goto err_cec;
>>> +
>>> +     ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>>> +                                     ch7322_irq,
>>> +                                     IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>>> +                                     client->name, ch7322);
>>> +     if (ret)
>>> +             goto err_cec;
>>> +
>>> +     ch7322_handle_events(ch7322);
>>> +
>>> +     /* Unmask interrupt */
>>> +     mutex_lock(&ch7322->mutex);
>>> +     ret = regmap_write(ch7322->regmap, CH7322_INTCTL, 0xff);
>>> +     mutex_unlock(&ch7322->mutex);
>>> +
>>> +     if (ret)
>>> +             goto err_cec;
>>> +
>>> +     dev_info(&client->dev, "device registered\n");
>>> +
>>> +     return 0;
>>> +
>>> +err_cec:
>>> +     cec_unregister_adapter(ch7322->cec);
>>> +
>>> +err_mutex:
>>> +     mutex_destroy(&ch7322->mutex);
>>> +     return ret;
>>> +}
>>> +
>>> +static int ch7322_remove(struct i2c_client *client)
>>> +{
>>> +     struct ch7322 *ch7322 = i2c_get_clientdata(client);
>>> +
>>> +     /* Mask interrupt */
>>> +     mutex_lock(&ch7322->mutex);
>>> +     regmap_write(ch7322->regmap, CH7322_INTCTL, CH7322_INTCTL_INTPB);
>>> +     mutex_unlock(&ch7322->mutex);
>>> +
>>> +     cec_unregister_adapter(ch7322->cec);
>>> +     mutex_destroy(&ch7322->mutex);
>>> +
>>> +     dev_info(&client->dev, "device unregistered\n");
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct of_device_id ch7322_of_match[] = {
>>> +     { .compatible = "chrontel,ch7322", },
>>> +     {},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, ch7322_of_match);
>>> +
>>> +static struct i2c_driver ch7322_i2c_driver = {
>>> +     .driver = {
>>> +             .name = "ch7322",
>>> +             .of_match_table = of_match_ptr(ch7322_of_match),
>>> +     },
>>> +     .probe_new      = ch7322_probe,
>>> +     .remove         = ch7322_remove,
>>> +};
>>> +
>>> +module_i2c_driver(ch7322_i2c_driver);
>>> +
>>> +MODULE_DESCRIPTION("Chrontel CH7322 CEC Controller Driver");
>>> +MODULE_AUTHOR("Jeff Chase <jnchase@google.com>");
>>> +MODULE_LICENSE("GPL");
>>>
>>

