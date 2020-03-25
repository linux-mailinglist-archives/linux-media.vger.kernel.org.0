Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC3E4192BDF
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 16:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbgCYPL1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 11:11:27 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41079 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727439AbgCYPL1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 11:11:27 -0400
Received: by mail-ed1-f67.google.com with SMTP id v1so2762904edq.8
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YrHWpiSNvcUo2HhP0PsHcnShESgzBfQqzKKNSKCVpE=;
        b=LjXRtFMPvxjuGOYr2sz0SQR9ux6KZFdKlqaC6Pq86rw2dSBIlUv0OfMBEIWqflT9Vv
         oLeFWvonrN5x9q3P1bmyk/d4X/QUGcppnmT51s8h69c84XsScsy4ZfDpzM13O3XZN7gW
         dHBnnlhih3g2QdLWtP4PPpPJtEUe7D++Tc63M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YrHWpiSNvcUo2HhP0PsHcnShESgzBfQqzKKNSKCVpE=;
        b=g/U3579WBJ4Cg/TnOVvdUIldgaj3N98QXF6mcWJsMR4L9EdLCd2yLKfkxXdsQ6h28k
         Y9tMNaVuzn+BxRGIJ5c+DCetDCJLQgBtxGRWpjqg0oE2Z32G610qnqMrTooqtXhc1jgm
         LUSgbFl+3oBo6qrI+8NrOOZ+y9pYMm8XNy5UwkEQSKtcc92AdiF/LF68gHVhRaG9I6xw
         SvPVuJBuf7WmQI4zE2o8lt1F3VhX0FZfpaZXzqBgf4mn0LD3364pdADTSgDCr9URnONP
         J3bPrNe8oOakRlSJfkAI8Bbp7X96eiMiCl9lint8f0dp2uEEIt9Ay+gvGtrI5bAfurM9
         iI/A==
X-Gm-Message-State: ANhLgQ0aU2Eq4VKHQyW/GKGYuPMLgq/ZY1py9UuT1f445Z8N2dEILLEi
        wRCi3I8rS/0O4zpKv04on+d6dyH0SwOxWQ==
X-Google-Smtp-Source: ADFU+vtXzInzdRWrvZ3nEXOUF/RpzunLkQaHwh4L2feA3NHogCAuwb6r6TWxKTXeoQVtDhuQxzOc7w==
X-Received: by 2002:a17:906:6d0e:: with SMTP id m14mr3664056ejr.161.1585149083468;
        Wed, 25 Mar 2020 08:11:23 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id k8sm1365427ejq.36.2020.03.25.08.11.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 08:11:23 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id u10so3570555wro.7
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 08:11:22 -0700 (PDT)
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr3749861wrw.385.1585149075992;
 Wed, 25 Mar 2020 08:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-3-dongchun.zhu@mediatek.com> <20200305120516.GQ5379@paasikivi.fi.intel.com>
 <1584526824.5781.56.camel@mhfsdcap03> <20200318102937.GA15448@kekkonen.localdomain>
 <CAAFQd5A=_+XsvgHTz_3QAJoSk9MBPooUgVCh+9K98DKdw0CXKg@mail.gmail.com> <20200323203558.GA21174@kekkonen.localdomain>
In-Reply-To: <20200323203558.GA21174@kekkonen.localdomain>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 25 Mar 2020 16:11:02 +0100
X-Gmail-Original-Message-ID: <CAAFQd5Bf4-4k9390eCUOSjyQLYF9bUVkF4dS-6tKuXTwMT4gdA@mail.gmail.com>
Message-ID: <CAAFQd5Bf4-4k9390eCUOSjyQLYF9bUVkF4dS-6tKuXTwMT4gdA@mail.gmail.com>
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        andriy.shevchenko@linux.intel.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 23, 2020 at 9:36 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz,
>
> On Mon, Mar 23, 2020 at 08:09:14PM +0100, Tomasz Figa wrote:
> > On Wed, Mar 18, 2020 at 11:29 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dongchun,
> > >
> > > On Wed, Mar 18, 2020 at 06:20:24PM +0800, Dongchun Zhu wrote:
> > > > Hi Sakari,
> > > >
> > > > On Thu, 2020-03-05 at 14:05 +0200, Sakari Ailus wrote:
> > > > > Hi Dongchun,
> > > > >
> > > > > Thanks for the update.
> > > > >
> > > > > On Fri, Feb 28, 2020 at 11:59:58PM +0800, Dongchun Zhu wrote:
> > > > > > This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> > > > > > and provides control to set the desired focus via I2C serial interface.
> > > > > >
> > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > ---
> > > > > >  MAINTAINERS                |   1 +
> > > > > >  drivers/media/i2c/Kconfig  |  10 ++
> > > > > >  drivers/media/i2c/Makefile |   1 +
> > > > > >  drivers/media/i2c/dw9768.c | 437 +++++++++++++++++++++++++++++++++++++++++++++
> > > > > >  4 files changed, 449 insertions(+)
> > > > > >  create mode 100644 drivers/media/i2c/dw9768.c
> > > > > >
> > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > index b805e29..0bb894a 100644
> > > > > > --- a/MAINTAINERS
> > > > > > +++ b/MAINTAINERS
> > > > > > @@ -5139,6 +5139,7 @@ M:  Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > >  L:       linux-media@vger.kernel.org
> > > > > >  T:       git git://linuxtv.org/media_tree.git
> > > > > >  S:       Maintained
> > > > > > +F:       drivers/media/i2c/dw9768.c
> > > > > >  F:       Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > > > >
> > > > > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > index c68e002..aa60781 100644
> > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > @@ -1024,6 +1024,16 @@ config VIDEO_DW9714
> > > > > >     capability. This is designed for linear control of
> > > > > >     voice coil motors, controlled via I2C serial interface.
> > > > > >
> > > > > > +config VIDEO_DW9768
> > > > > > + tristate "DW9768 lens voice coil support"
> > > > > > + depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > > + depends on VIDEO_V4L2_SUBDEV_API
> > > > > > + help
> > > > > > +   This is a driver for the DW9768 camera lens voice coil.
> > > > > > +   DW9768 is a 10 bit DAC with 100mA output current sink
> > > > > > +   capability. This is designed for linear control of
> > > > > > +   voice coil motors, controlled via I2C serial interface.
> > > > > > +
> > > > > >  config VIDEO_DW9807_VCM
> > > > > >   tristate "DW9807 lens voice coil support"
> > > > > >   depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > > > > index c147bb9..ec94434 100644
> > > > > > --- a/drivers/media/i2c/Makefile
> > > > > > +++ b/drivers/media/i2c/Makefile
> > > > > > @@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
> > > > > >  obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
> > > > > >  obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
> > > > > >  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
> > > > > > +obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
> > > > > >  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
> > > > > >  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
> > > > > >  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> > > > > > diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> > > > > > new file mode 100644
> > > > > > index 0000000..dec1abc
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/media/i2c/dw9768.c
> > > > > > @@ -0,0 +1,437 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +// Copyright (c) 2020 MediaTek Inc.
> > > > > > +
> > > > > > +#include <linux/delay.h>
> > > > > > +#include <linux/i2c.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/regulator/consumer.h>
> > > > > > +#include <linux/pm_runtime.h>
> > > > >
> > > > > Alphabetical order would be nice.
> > > > >
> > > > > > +#include <media/v4l2-async.h>
> > > > > > +#include <media/v4l2-ctrls.h>
> > > > > > +#include <media/v4l2-device.h>
> > > > > > +#include <media/v4l2-subdev.h>
> > > > > > +
> > > > > > +#define DW9768_NAME                              "dw9768"
> > > > > > +#define DW9768_MAX_FOCUS_POS                     1023
> > > > > > +/*
> > > > > > + * This sets the minimum granularity for the focus positions.
> > > > > > + * A value of 1 gives maximum accuracy for a desired focus position
> > > > > > + */
> > > > > > +#define DW9768_FOCUS_STEPS                       1
> > > > > > +
> > > > > > +/*
> > > > > > + * Ring control and Power control register
> > > > > > + * Bit[1] RING_EN
> > > > > > + * 0: Direct mode
> > > > > > + * 1: AAC mode (ringing control mode)
> > > > > > + * Bit[0] PD
> > > > > > + * 0: Normal operation mode
> > > > > > + * 1: Power down mode
> > > > > > + * DW9768 requires waiting time of Topr after PD reset takes place.
> > > > > > + */
> > > > > > +#define DW9768_RING_PD_CONTROL_REG               0x02
> > > > > > +#define DW9768_PD_MODE_OFF                       0x00
> > > > > > +#define DW9768_PD_MODE_EN                        BIT(0)
> > > > > > +#define DW9768_AAC_MODE_EN                       BIT(1)
> > > > > > +
> > > > > > +/*
> > > > > > + * DW9768 separates two registers to control the VCM position.
> > > > > > + * One for MSB value, another is LSB value.
> > > > > > + * DAC_MSB: D[9:8] (ADD: 0x03)
> > > > > > + * DAC_LSB: D[7:0] (ADD: 0x04)
> > > > > > + * D[9:0] DAC data input: positive output current = D[9:0] / 1023 * 100[mA]
> > > > > > + */
> > > > > > +#define DW9768_MSB_ADDR                          0x03
> > > > > > +#define DW9768_LSB_ADDR                          0x04
> > > > > > +#define DW9768_STATUS_ADDR                       0x05
> > > > > > +
> > > > > > +/*
> > > > > > + * AAC mode control & prescale register
> > > > > > + * Bit[7:5] Namely AC[2:0], decide the VCM mode and operation time.
> > > > > > + * 000 Direct(default)
> > > > > > + * 001 AAC2 0.48xTvib
> > > > > > + * 010 AAC3 0.70xTvib
> > > > > > + * 011 AAC4 0.75xTvib
> > > > > > + * 100 Reserved
> > > > > > + * 101 AAC8 1.13xTvib
> > > > > > + * 110 Reserved
> > > > > > + * 111 Reserved
> > > > > > + * Bit[2:0] Namely PRESC[2:0], set the internal clock dividing rate as follow.
> > > > > > + * 000 2
> > > > > > + * 001 1(default)
> > > > > > + * 010 1/2
> > > > > > + * 011 1/4
> > > > > > + * 100 8
> > > > > > + * 101 4
> > > > > > + * 110 Reserved
> > > > > > + * 111 Reserved
> > > > > > + */
> > > > > > +#define DW9768_AAC_PRESC_REG                     0x06
> > > > > > +#define DW9768_AAC3_SELECT_DIVIDING_RATE_1       0x41
> > > > > > +
> > > > > > +/*
> > > > > > + * VCM period of vibration register
> > > > > > + * Bit[5:0] Defined as VCM rising periodic time (Tvib) together with PRESC[2:0]
> > > > > > + * Tvib = (6.3ms + AACT[5:0] * 0.1ms) * Dividing Rate
> > > > > > + * Dividing Rate is the internal clock dividing rate that is defined at
> > > > > > + * PRESCALE register (ADD: 0x06)
> > > > > > + */
> > > > > > +#define DW9768_AAC_TIME_REG                      0x07
> > > > > > +#define DW9768_AACT_CNT                          0x39
> > > > >
> > > > > I wonder how hardware specific are these values, this and the divider?
> > > > >
> > > > > The DW9807 has similar configuration but the defaults seem to be just
> > > > > fine. What are the defaults in this case?
> > > > >
> > > >
> > > > From hardware specific, the default value of AAC_PRESC_REG is 0x01, and
> > > > that value of AAC_TIME_REG is 0x20.
> > > >
> > > > For these two registers, each bit is defined as below.
> > > > D[7:0] (D[7:5]-> AC[2:0], D[2:0]-> PRSEC[2:0])
> > > > +------+------+------+------+------+------+------+------+
> > > > | AC2  | AC1  | AC0  |------|------|PRESC2|PRESC1|PRESC0|
> > > > +------+------+------+------+------+------+------+------+
> > > >
> > > > D[7:0] (D[5:0]-> AACT[5:0]).
> > > > +------+------+------+------+------+------+------+------+
> > > > |------+------+ AACT5| AACT4| AACT3| AACT2| AACT1| AACT0|
> > > > +------+------+------+------+------+------+------+------+
> > > >
> > > > > > +
> > > > > > +/*
> > > > > > + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> > > > > > + * or in the case of PD reset taking place.
> > > > > > + */
> > > > > > +#define DW9768_T_OPR_US                          1000
> > > > > > +
> > > > > > +/*
> > > > > > + * This acts as the minimum granularity of lens movement.
> > > > > > + * Keep this value power of 2, so the control steps can be
> > > > > > + * uniformly adjusted for gradual lens movement, with desired
> > > > > > + * number of control steps.
> > > > > > + */
> > > > > > +#define DW9768_MOVE_STEPS                        16
> > > > > > +
> > > > > > +/*
> > > > > > + * DW9768_AAC_PRESC_REG & DW9768_AAC_TIME_REG determine VCM operation time.
> > > > > > + * If DW9768_AAC_PRESC_REG set to be 0x41, DW9768_AAC_TIME_REG set to be 0x39,
> > > > > > + * VCM mode would be AAC3, Operation Time would be 0.70xTvib, that is 8.40ms.
> > > > > > + */
> > > > > > +#define DW9768_MOVE_DELAY_US                     8400
> > > > > > +#define DW9768_STABLE_TIME_US                    20000
> > > > > > +
> > > > > > +static const char * const dw9768_supply_names[] = {
> > > > > > + "vin",  /* I2C I/O interface power */
> > > > > > + "vdd",  /* VCM power */
> > > > > > +};
> > > > > > +
> > > > > > +#define DW9768_NUM_SUPPLIES ARRAY_SIZE(dw9768_supply_names)
> > > > >
> > > > > Please use ARRAY_SIZE() directly instead.
> > > > >
> > > > > > +
> > > > > > +/* dw9768 device structure */
> > > > > > +struct dw9768 {
> > > > > > + struct regulator_bulk_data supplies[DW9768_NUM_SUPPLIES];
> > > > > > + struct v4l2_ctrl_handler ctrls;
> > > > > > + struct v4l2_ctrl *focus;
> > > > > > + struct v4l2_subdev sd;
> > > > > > +};
> > > > > > +
> > > > > > +static inline struct dw9768 *to_dw9768(struct v4l2_ctrl *ctrl)
> > > > > > +{
> > > > > > + return container_of(ctrl->handler, struct dw9768, ctrls);
> > > > > > +}
> > > > > > +
> > > > > > +static inline struct dw9768 *sd_to_dw9768(struct v4l2_subdev *subdev)
> > > > > > +{
> > > > > > + return container_of(subdev, struct dw9768, sd);
> > > > > > +}
> > > > > > +
> > > > > > +struct regval_list {
> > > > > > + u8 reg_num;
> > > > > > + u8 value;
> > > > > > +};
> > > > > > +
> > > > > > +static struct regval_list dw9768_init_regs[] = {
> > > > >
> > > > > const
> > > > >
> > > > > > + {DW9768_RING_PD_CONTROL_REG, DW9768_AAC_MODE_EN},
> > > > > > + {DW9768_AAC_PRESC_REG, DW9768_AAC3_SELECT_DIVIDING_RATE_1},
> > > > > > + {DW9768_AAC_TIME_REG, DW9768_AACT_CNT},
> > > > > > +};
> > > > > > +
> > > > > > +static int dw9768_write_array(struct dw9768 *dw9768, struct regval_list *vals,
> > > > > > +                       size_t len)
> > > > > > +{
> > > > > > + struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > > > > > + unsigned int i;
> > > > > > + int ret;
> > > > > > +
> > > > > > + for (i = 0; i < len; i++) {
> > > > > > +         ret = i2c_smbus_write_byte_data(client, vals[i].reg_num,
> > > > > > +                                         vals[i].value);
> > > > > > +         if (ret < 0)
> > > > > > +                 return ret;
> > > > > > + }
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_set_dac(struct dw9768 *dw9768, u16 val)
> > > > > > +{
> > > > > > + struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > > > > > +
> > > > > > + /* Write VCM position to registers */
> > > > > > + return i2c_smbus_write_word_data(client, DW9768_MSB_ADDR,
> > > > > > +                                  swab16(val));
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_init(struct dw9768 *dw9768)
> > > > > > +{
> > > > > > + struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > > > > > + int ret, val;
> > > > > > +
> > > > > > + /* Reset DW9768_RING_PD_CONTROL_REG to default status 0x00 */
> > > > > > + ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> > > > > > +                                 DW9768_PD_MODE_OFF);
> > > > > > + if (ret < 0)
> > > > > > +         return ret;
> > > > > > +
> > > > > > + /*
> > > > > > +  * DW9769 requires waiting delay time of t_OPR
> > > > > > +  * after PD reset takes place.
> > > > > > +  */
> > > > > > + usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> > > > > > +
> > > > > > + ret = dw9768_write_array(dw9768, dw9768_init_regs,
> > > > > > +                          ARRAY_SIZE(dw9768_init_regs));
> > > > > > + if (ret)
> > > > > > +         return ret;
> > > > > > +
> > > > > > + for (val = dw9768->focus->val % DW9768_MOVE_STEPS;
> > > > > > +      val <= dw9768->focus->val;
> > > > > > +      val += DW9768_MOVE_STEPS) {
> > > > > > +         ret = dw9768_set_dac(dw9768, val);
> > > > > > +         if (ret) {
> > > > > > +                 dev_err(&client->dev, "%s I2C failure: %d",
> > > > > > +                         __func__, ret);
> > > > > > +                 return ret;
> > > > > > +         }
> > > > > > +         usleep_range(DW9768_MOVE_DELAY_US,
> > > > > > +                      DW9768_MOVE_DELAY_US + 1000);
> > > > > > + }
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_release(struct dw9768 *dw9768)
> > > > > > +{
> > > > > > + struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > > > > > + int ret, val;
> > > > > > +
> > > > > > + for (val = round_down(dw9768->focus->val, DW9768_MOVE_STEPS);
> > > > > > +      val >= 0; val -= DW9768_MOVE_STEPS) {
> > > > > > +         ret = dw9768_set_dac(dw9768, val);
> > > > > > +         if (ret) {
> > > > > > +                 dev_err(&client->dev, "%s I2C failure: %d",
> > > > > > +                         __func__, ret);
> > > > > > +                 return ret;
> > > > > > +         }
> > > > > > +         usleep_range(DW9768_MOVE_DELAY_US,
> > > > > > +                      DW9768_MOVE_DELAY_US + 1000);
> > > > > > + }
> > > > > > +
> > > > > > + /*
> > > > > > +  * Wait for the motor to stabilize after the last movement
> > > > > > +  * to prevent the motor from shaking.
> > > > > > +  */
> > > > > > + usleep_range(DW9768_STABLE_TIME_US - DW9768_MOVE_DELAY_US,
> > > > > > +              DW9768_STABLE_TIME_US - DW9768_MOVE_DELAY_US + 1000);
> > > > > > +
> > > > > > + ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> > > > > > +                                 DW9768_PD_MODE_EN);
> > > > > > + if (ret < 0)
> > > > > > +         return ret;
> > > > > > +
> > > > > > + /*
> > > > > > +  * DW9769 requires waiting delay time of t_OPR
> > > > > > +  * after PD reset takes place.
> > > > > > +  */
> > > > > > + usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +/* Power handling */
> > > > > > +static int __maybe_unused dw9768_runtime_suspend(struct device *dev)
> > > > > > +{
> > > > > > + struct i2c_client *client = to_i2c_client(dev);
> > > > > > + struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > > + struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > > > > > +
> > > > > > + dw9768_release(dw9768);
> > > > > > + regulator_bulk_disable(DW9768_NUM_SUPPLIES, dw9768->supplies);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int __maybe_unused dw9768_runtime_resume(struct device *dev)
> > > > > > +{
> > > > > > + struct i2c_client *client = to_i2c_client(dev);
> > > > > > + struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > > + struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > > > > > + int ret;
> > > > > > +
> > > > > > + ret = regulator_bulk_enable(DW9768_NUM_SUPPLIES, dw9768->supplies);
> > > > > > + if (ret < 0) {
> > > > > > +         dev_err(dev, "failed to enable regulators\n");
> > > > > > +         return ret;
> > > > > > + }
> > > > > > +
> > > > > > + /*
> > > > > > +  * The datasheet refers to t_OPR that needs to be waited before sending
> > > > > > +  * I2C commands after power-up.
> > > > > > +  */
> > > > > > + usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> > > > > > +
> > > > > > + ret = dw9768_init(dw9768);
> > > > > > + if (ret < 0)
> > > > > > +         goto disable_regulator;
> > > > > > +
> > > > > > + return 0;
> > > > > > +
> > > > > > +disable_regulator:
> > > > > > + regulator_bulk_disable(DW9768_NUM_SUPPLIES, dw9768->supplies);
> > > > > > +
> > > > > > + return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > > > +{
> > > > > > + struct dw9768 *dw9768 = to_dw9768(ctrl);
> > > > > > +
> > > > > > + if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> > > > > > +         return dw9768_set_dac(dw9768, ctrl->val);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct v4l2_ctrl_ops dw9768_ctrl_ops = {
> > > > > > + .s_ctrl = dw9768_set_ctrl,
> > > > > > +};
> > > > > > +
> > > > > > +static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > > > > +{
> > > > > > + int ret;
> > > > > > +
> > > > > > + ret = pm_runtime_get_sync(sd->dev);
> > > > > > + if (ret < 0) {
> > > > > > +         pm_runtime_put_noidle(sd->dev);
> > > > > > +         return ret;
> > > > > > + }
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > > > > +{
> > > > > > + pm_runtime_put(sd->dev);
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct v4l2_subdev_internal_ops dw9768_int_ops = {
> > > > > > + .open = dw9768_open,
> > > > > > + .close = dw9768_close,
> > > > > > +};
> > > > > > +
> > > > > > +static const struct v4l2_subdev_ops dw9768_ops = { };
> > > > > > +
> > > > > > +static int dw9768_init_controls(struct dw9768 *dw9768)
> > > > > > +{
> > > > > > + struct v4l2_ctrl_handler *hdl = &dw9768->ctrls;
> > > > > > + const struct v4l2_ctrl_ops *ops = &dw9768_ctrl_ops;
> > > > > > +
> > > > > > + v4l2_ctrl_handler_init(hdl, 1);
> > > > > > +
> > > > > > + dw9768->focus = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
> > > > > > +                                   0, DW9768_MAX_FOCUS_POS,
> > > > > > +                                   DW9768_FOCUS_STEPS, 0);
> > > > > > +
> > > > > > + if (hdl->error)
> > > > > > +         return hdl->error;
> > > > > > +
> > > > > > + dw9768->sd.ctrl_handler = hdl;
> > > > > > +
> > > > > > + return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int dw9768_probe(struct i2c_client *client)
> > > > > > +{
> > > > > > + struct device *dev = &client->dev;
> > > > > > + struct dw9768 *dw9768;
> > > > > > + unsigned int i;
> > > > > > + int ret;
> > > > > > +
> > > > > > + dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
> > > > > > + if (!dw9768)
> > > > > > +         return -ENOMEM;
> > > > > > +
> > > > > > + v4l2_i2c_subdev_init(&dw9768->sd, client, &dw9768_ops);
> > > > > > +
> > > > > > + for (i = 0; i < DW9768_NUM_SUPPLIES; i++)
> > > > > > +         dw9768->supplies[i].supply = dw9768_supply_names[i];
> > > > > > +
> > > > > > + ret = devm_regulator_bulk_get(dev, DW9768_NUM_SUPPLIES,
> > > > > > +                               dw9768->supplies);
> > > > > > + if (ret) {
> > > > > > +         dev_err(dev, "failed to get regulators\n");
> > > > > > +         return ret;
> > > > > > + }
> > > > > > +
> > > > >
> > > > > I'd try to see the chip is accessible in probe().
> > > > >
> > > >
> > > > If probe failed, actuator device node would not be generated.
> > >
> > > Yes, this would be preferred.
> > >
> > > > When user tries to open fd, it should report error also.
> > > >
> > > > > > + ret = dw9768_init_controls(dw9768);
> > > > > > + if (ret)
> > > > > > +         goto entity_cleanup;
> > > > > > +
> > > > > > + dw9768->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > > > + dw9768->sd.internal_ops = &dw9768_int_ops;
> > > > > > +
> > > > > > + ret = media_entity_pads_init(&dw9768->sd.entity, 0, NULL);
> > > > > > + if (ret < 0)
> > > > > > +         goto entity_cleanup;
> > > > > > +
> > > > > > + dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> > > > > > +
> > > > > > + ret = v4l2_async_register_subdev(&dw9768->sd);
> > > > > > + if (ret < 0)
> > > > > > +         goto entity_cleanup;
> > > > > > +
> > > > > > + pm_runtime_enable(dev);
> > > > >
> > > > > Your driver appears to depend on runtime PM on DT based systems.
> > > > >
> > > > > You should either add a dependency to CONFIG_PM, or much more preferrably
> > > > > make it work without runtime PM.
> > > > >
> > > >
> > > > Do you mean using the macro like this:
> > > > #ifdef CONFIG_PM
> > > > ...
> > > > #endif
> > >
> > > No. If CONFIG_PM is disabled, the runtime PM functions do nothing. Would
> > > your driver work in that case?
> > >
> >
> > If we make the driver handle the case of !IS_ENABLED(CONFIG_PM), I'd
> > like us to make sure that the driver only does power up in this
> > specific case to avoid blinking the camera LED on boot-up when
> > CONFIG_PM is enabled.
>
> Ah, you have that kind of hardware design again. :-)
>

Yeah. Unfortunately it's not easy to avoid, as the sensors today don't
really provide any secure way to drive a LED. We have some ideas on
how to work around it with some additional components, but the
hardware design pipeline is quite deep and we're still going to see
designs like today in the near future.

> I guess that's fine for a VCM driver; just don't power the device on during
> probe. On the other hand, for an EEPROM that are common in sensors, that
> likely isn't so straightforward.

Yeah, we'll have to take care of those as well...

>
> I wonder what kind of a reception would be for a DT property to tell
> powering the device on during probe is undesirable.

My feeling is that it's more a user's decision, rather than a hardware
decision. Also, with DT, there is no problem with the PM subsystem
powering up things implicitly, as the drivers manage all the power
explicitly.

> Which reminds me ---
> time to respin the corresponding set for ACPI...

Thanks!

Best regards,
Tomasz
