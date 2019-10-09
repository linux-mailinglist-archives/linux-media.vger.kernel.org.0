Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB30D06AC
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 06:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbfJIEkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 00:40:24 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37971 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729040AbfJIEkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 00:40:23 -0400
Received: by mail-ed1-f66.google.com with SMTP id l21so764670edr.5
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 21:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mCig5kgLkC+F5fuhEJGg04MH+YglNUctBHKrOOKma9M=;
        b=S8y8Gz2QhYzsjljUGQOUyUFRPAoMO8uF9ZLL+t8vGZgW5Ml6gm4Im86UTJ5w5cpKTd
         kNcdzQhH44b6gx7NrfrVHMdzzkYtp9dEc65X/MxihS7s5TvcVuf1ILC4z1eCkqOI6C5z
         zFbfFbFpQGGlxuPUGeS7XtJI8Gj8i2w/eFtBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mCig5kgLkC+F5fuhEJGg04MH+YglNUctBHKrOOKma9M=;
        b=KM3/VpYsdMgnNi3eQTG9mTAuvEC61aOLo163w4WZZiDrI2le/9Hi4PEJt0A28k+dkl
         qXBzwIXaAdEYuljmMStqhmIs5kC9h7QzFNBdW0fDxN4MwbEW9qyzJmFVujvU1Yvh4luP
         DUQvhSU7lb6VrBGmdG0MYrCEe0SxhIJVVK4SVgM49SJ2PkKMb7RSNtXvHElhZAXZghyl
         lAvlpa3wUAXNrRNU3heOQ+2qHfZFwXsMpaJDc/55SqC4XXxcRdXYpGcx5+X47S3fsyon
         t+op7C5OpgpQjuLXMoWPlxh5FmSEInvccpvH4TH2lTCOubLVA/3fuQycTYzTQlyW7z2F
         E55A==
X-Gm-Message-State: APjAAAX3jmGvJAWbxJaBy/oBApyfXt+muX1TVpD5A+v9uBBNUpAVmzgA
        kUYQRmeFcqoMm3IQcVIs1jMvApAGiKyw6w==
X-Google-Smtp-Source: APXvYqw59ucVaJ9Eo/FZNCn1Aay3QvK4xxj6AVLzxsFedf4sHgPT9CwB/+P7sFJdZX340WNE1lk2oA==
X-Received: by 2002:a50:a781:: with SMTP id i1mr1224319edc.17.1570596021477;
        Tue, 08 Oct 2019 21:40:21 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id b7sm164445eda.67.2019.10.08.21.40.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 21:40:20 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id j11so937610wrp.1
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 21:40:18 -0700 (PDT)
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr1053323wrl.113.1570596018449;
 Tue, 08 Oct 2019 21:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com> <20190905072142.14606-3-dongchun.zhu@mediatek.com>
In-Reply-To: <20190905072142.14606-3-dongchun.zhu@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 9 Oct 2019 13:40:07 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A9mn+695CZdYoXzuQodQqC=p8dstbdFAkOCCHKMUtg-w@mail.gmail.com>
Message-ID: <CAAFQd5A9mn+695CZdYoXzuQodQqC=p8dstbdFAkOCCHKMUtg-w@mail.gmail.com>
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

Please see my further comments inline.

[snip]
> +struct regval_list {
> +       unsigned char reg_num;
> +       unsigned char value;

nit: Since we have strictly sized values here, should we use u8 for
both fields instead?

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

Should we use u8 for the last two arguments here as well?

> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> +       int ret;
> +
> +       if (reg == DW9768_CMD_DELAY  && value == DW9768_CMD_DELAY)
> +               usleep_range(DW9768_CTRL_DELAY_US,
> +                            DW9768_CTRL_DELAY_US + 100);

ret will be uninitialized if we go this path.

> +       else
> +               ret = i2c_smbus_write_byte_data(client, reg, value);
> +       return ret;
> +}
> +
> +static int dw9768_write_array(struct dw9768 *dw9768, struct regval_list *vals,
> +                             u32 len)

Since len is an array size, should we use size_t instead?

> +{
> +       unsigned int i;

size_t?

> +       int ret;
> +
> +       for (i = 0; i < len; i++) {
> +               ret = dw9768_write_smbus(dw9768, vals->reg_num, vals->value);

This should refer to vals[i] instead.

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

As we discovered earlier, i2c_smbus_write_block_data() uses a
different protocol from what we expected. Please change to
i2c_smbus_write_word_data(), as per our downstream changes.

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

There is at least T_opr = 200 us of delay needed here. Would you be
able to add a comment and a corresponding usleep_range() call? I guess
the range of (300, 400) would be enough on the safe side.

Best regards,
Tomasz
