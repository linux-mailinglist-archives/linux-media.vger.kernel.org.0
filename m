Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C568A9D13
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 10:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732151AbfIEIeR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 04:34:17 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38295 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730659AbfIEIeQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 04:34:16 -0400
Received: by mail-ed1-f67.google.com with SMTP id r12so1850123edo.5
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mn5kxRXRrvF/mZkjHpojGPnycd5hoXTNnTxiPEIUhic=;
        b=gnCcHyTa41BS7QbJWxPjg7abFPVxAoaH8e6xOOFv5mJdR/hmbbzNQg9WzYn8eQ19IT
         Tk8AJ6eoMl2SJSlhHvFo5bxSRPc8/XxonydDc2rjIcZ/JdBS5Vplpe6C1pMwL64dwvaN
         pduQ3vsw8UKawhs/Yn+lEohSB09AFi3RjVC20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mn5kxRXRrvF/mZkjHpojGPnycd5hoXTNnTxiPEIUhic=;
        b=Oxx52+GdIOf15O2SvINxiRxP9d/kqKVa5Y5TLAIlhf1cKVoKJ4VtoeFGZPC4qPb+PJ
         O747e3l5bgZBl0pFx9Q0HIPG6Ji2r67JWUCvFVFR/gbD9kAvQEDnHvkxwblG0N2KPwxV
         LLUZNsdhnLoatDg7uqwjvJd7Drsq79orFknDZoBi6Yg04gGFWV++C/a3yPyfpFh8oha2
         DdujSilHgn+p9UpTpg532o2Pa7Kw1WKj9iNxTbBJuWW42tFMbo3Urmn/Py9kXdf11eJZ
         jWb2TLwp5QDnVPG7WjFMLlulXY+kqMKU0h877sui4+ErbPkKCKvBgS3+NL8JmP8Wv1NJ
         HzdA==
X-Gm-Message-State: APjAAAWWwPx+yLvWRBe6SVdb87rr9vdD0CuHskDTONPGUxshNVMniXKD
        8F11/dLRp81K3YNCPWCioFs6050enbndJw==
X-Google-Smtp-Source: APXvYqy9zI108SK45WggcaUscw8WP8MVD/pSVU/onsSE0BJjGxE6+lw89wC/6Ue4OaM4b6e02++OEQ==
X-Received: by 2002:a17:906:6d52:: with SMTP id a18mr1882664ejt.56.1567672454159;
        Thu, 05 Sep 2019 01:34:14 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id ox27sm165520ejb.91.2019.09.05.01.34.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2019 01:34:14 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id t9so1807544wmi.5
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 01:34:13 -0700 (PDT)
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr1963245wma.10.1567672149678;
 Thu, 05 Sep 2019 01:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com> <20190905072142.14606-3-dongchun.zhu@mediatek.com>
In-Reply-To: <20190905072142.14606-3-dongchun.zhu@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 5 Sep 2019 17:28:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bzq0exwS-V7afjDHKxf-7oqZtBCUzohk90tTYCJZPonA@mail.gmail.com>
Message-ID: <CAAFQd5Bzq0exwS-V7afjDHKxf-7oqZtBCUzohk90tTYCJZPonA@mail.gmail.com>
Subject: Re: [V2, 2/2] media: i2c: Add DW9768 VCM driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        andriy.shevchenko@linux.intel.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
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
        devicetree@vger.kernel.org, sam.hung@mediatek.com,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Thu, Sep 5, 2019 at 4:22 PM <dongchun.zhu@mediatek.com> wrote:
>
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
>
> This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> and provides control to set the desired focus.
>
> The DW9768 is a 10 bit DAC with 100mA output current sink capability
> from Dongwoon, designed for linear control of voice coil motor,
> and controlled via I2C serial interface.
>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  10 ++
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9768.c | 349 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 361 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9768.c
>

Thanks for v2! Please see my comments inline.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 192a671..c5c9a0e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4976,6 +4976,7 @@ M:        Dongchun Zhu <dongchun.zhu@mediatek.com>
>  L:     linux-media@vger.kernel.org
>  T:     git git://linuxtv.org/media_tree.git
>  S:     Maintained
> +F:     drivers/media/i2c/dw9768.c
>  F:     Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
>
>  DONGWOON DW9807 LENS VOICE COIL DRIVER
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 79ce9ec..dfb665c 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1016,6 +1016,16 @@ config VIDEO_DW9714
>           capability. This is designed for linear control of
>           voice coil motors, controlled via I2C serial interface.
>
> +config VIDEO_DW9768
> +       tristate "DW9768 lens voice coil support"
> +       depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> +       depends on VIDEO_V4L2_SUBDEV_API
> +       help
> +         This is a driver for the DW9768 camera lens voice coil.
> +         DW9768 is a 10 bit DAC with 100mA output current sink
> +         capability. This is designed for linear control of
> +         voice coil motors, controlled via I2C serial interface.
> +
>  config VIDEO_DW9807_VCM
>         tristate "DW9807 lens voice coil support"
>         depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index fd4ea86..2561239 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
>  obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
>  obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
>  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
> +obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
>  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
>  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
>  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> new file mode 100644
> index 0000000..66d1712
> --- /dev/null
> +++ b/drivers/media/i2c/dw9768.c
> @@ -0,0 +1,349 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 MediaTek Inc.
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define DW9768_NAME                            "dw9768"
> +#define DW9768_MAX_FOCUS_POS                   1023
> +/*
> + * This sets the minimum granularity for the focus positions.
> + * A value of 1 gives maximum accuracy for a desired focus position
> + */
> +#define DW9768_FOCUS_STEPS                     1
> +/*
> + * DW9768 separates two registers to control the VCM position.
> + * One for MSB value, another is LSB value.
> + */
> +#define DW9768_REG_MASK_MSB                    0x03
> +#define DW9768_REG_MASK_LSB                    0xff
> +#define DW9768_SET_POSITION_ADDR                0x03
> +
> +#define DW9768_CMD_DELAY                       0xff
> +#define DW9768_CTRL_DELAY_US                   5000
> +
> +#define DW9768_DAC_SHIFT                       8
> +
> +/* dw9768 device structure */
> +struct dw9768 {
> +       struct v4l2_ctrl_handler ctrls;
> +       struct v4l2_subdev sd;
> +       struct regulator *vin;
> +       struct regulator *vdd;
> +};
> +
> +static inline struct dw9768 *to_dw9768_vcm(struct v4l2_ctrl *ctrl)
> +{
> +       return container_of(ctrl->handler, struct dw9768, ctrls);
> +}
> +
> +static inline struct dw9768 *sd_to_dw9768_vcm(struct v4l2_subdev *subdev)
> +{
> +       return container_of(subdev, struct dw9768, sd);
> +}
> +
> +struct regval_list {
> +       unsigned char reg_num;
> +       unsigned char value;
> +};
> +
> +static struct regval_list dw9768_init_regs[] = {
> +       {0x02, 0x02},
> +       {DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +       {0x06, 0x41},
> +       {0x07, 0x39},
> +       {DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +};
> +
> +static struct regval_list dw9768_release_regs[] = {
> +       {0x02, 0x00},
> +       {DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +       {0x01, 0x00},
> +       {DW9768_CMD_DELAY, DW9768_CMD_DELAY},
> +};
> +
> +static int dw9768_write_smbus(struct dw9768 *dw9768, unsigned char reg,
> +                             unsigned char value)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +       int ret;
> +
> +       if (reg == DW9768_CMD_DELAY  && value == DW9768_CMD_DELAY)

Do we really need both to be set to this command?

> +               usleep_range(DW9768_CTRL_DELAY_US,
> +                            DW9768_CTRL_DELAY_US + 100);
> +       else
> +               ret = i2c_smbus_write_byte_data(client, reg, value);
> +       return ret;
> +}

Is there any reason to have this as a separate function and not just
implemented inside the function below?

> +
> +static int dw9768_write_array(struct dw9768 *dw9768, struct regval_list *vals,
> +                             u32 len)
> +{
> +       unsigned int i;
> +       int ret;
> +
> +       for (i = 0; i < len; i++) {
> +               ret = dw9768_write_smbus(dw9768, vals->reg_num, vals->value);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +       return 0;
> +}
> +
> +static int dw9768_set_position(struct dw9768 *dw9768, u16 val)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +       u8 addr[2];
> +
> +       addr[0] = (val >> DW9768_DAC_SHIFT) & DW9768_REG_MASK_MSB;
> +       addr[1] = val & DW9768_REG_MASK_LSB;
> +
> +       return i2c_smbus_write_block_data(client, DW9768_SET_POSITION_ADDR,
> +                                         ARRAY_SIZE(addr), addr);
> +}
> +
> +static int dw9768_release(struct dw9768 *dw9768)
> +{
> +       return dw9768_write_array(dw9768, dw9768_release_regs,
> +                                 ARRAY_SIZE(dw9768_release_regs));
> +}
> +
> +static int dw9768_init(struct dw9768 *dw9768)
> +{
> +       return dw9768_write_array(dw9768, dw9768_init_regs,
> +                                 ARRAY_SIZE(dw9768_init_regs));
> +}

Given that the 2 functions above are just called from 1 place,
wouldn't it make sense to just call dw9768_write_array() directly from
there?

> +
> +/* Power handling */
> +static int dw9768_power_off(struct dw9768 *dw9768)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +       int ret;
> +
> +       ret = dw9768_release(dw9768);
> +       if (ret)
> +               dev_err(&client->dev, "dw9768 release failed!\n");
> +
> +       ret = regulator_disable(dw9768->vin);
> +       if (ret)
> +               return ret;
> +
> +       return regulator_disable(dw9768->vdd);
> +}
> +
> +static int dw9768_power_on(struct dw9768 *dw9768)
> +{
> +       int ret;
> +
> +       ret = regulator_enable(dw9768->vin);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = regulator_enable(dw9768->vdd);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = dw9768_init(dw9768);
> +       if (ret < 0)
> +               goto fail;
> +
> +       return 0;
> +
> +fail:
> +       regulator_disable(dw9768->vin);
> +       regulator_disable(dw9768->vdd);
> +
> +       return ret;
> +}
> +
> +static int dw9768_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct dw9768 *dw9768 = to_dw9768_vcm(ctrl);
> +
> +       if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
> +               return dw9768_set_position(dw9768, ctrl->val);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops dw9768_vcm_ctrl_ops = {
> +       .s_ctrl = dw9768_set_ctrl,
> +};
> +
> +static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +       int ret;
> +
> +       ret = pm_runtime_get_sync(sd->dev);
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(sd->dev);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +       pm_runtime_put(sd->dev);
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_internal_ops dw9768_int_ops = {
> +       .open = dw9768_open,
> +       .close = dw9768_close,
> +};
> +
> +static const struct v4l2_subdev_ops dw9768_ops = { };
> +
> +static void dw9768_subdev_cleanup(struct dw9768 *dw9768)
> +{
> +       v4l2_async_unregister_subdev(&dw9768->sd);
> +       v4l2_ctrl_handler_free(&dw9768->ctrls);
> +       media_entity_cleanup(&dw9768->sd.entity);
> +}
> +
> +static int dw9768_init_controls(struct dw9768 *dw9768)
> +{
> +       struct v4l2_ctrl_handler *hdl = &dw9768->ctrls;
> +       const struct v4l2_ctrl_ops *ops = &dw9768_vcm_ctrl_ops;
> +
> +       v4l2_ctrl_handler_init(hdl, 1);
> +
> +       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
> +                         0, DW9768_MAX_FOCUS_POS, DW9768_FOCUS_STEPS, 0);
> +
> +       if (hdl->error)
> +               return hdl->error;
> +
> +       dw9768->sd.ctrl_handler = hdl;
> +
> +       return 0;
> +}
> +
> +static int dw9768_probe(struct i2c_client *client)
> +{
> +       struct device *dev = &client->dev;
> +       struct dw9768 *dw9768;
> +       int ret;
> +
> +       dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
> +       if (!dw9768)
> +               return -ENOMEM;
> +
> +       dw9768->vin = devm_regulator_get(dev, "vin");
> +       if (IS_ERR(dw9768->vin)) {
> +               ret = PTR_ERR(dw9768->vin);
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(dev, "cannot get vin regulator\n");
> +               return ret;
> +       }
> +
> +       dw9768->vdd = devm_regulator_get(dev, "vdd");
> +       if (IS_ERR(dw9768->vdd)) {
> +               ret = PTR_ERR(dw9768->vdd);
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(dev, "cannot get vdd regulator\n");
> +               return ret;
> +       }

Any reason not to use the regulator bulk API, as already done in the
fixup patch I shared with you earlier [1]?

[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1757579

Best regards,
Tomasz
