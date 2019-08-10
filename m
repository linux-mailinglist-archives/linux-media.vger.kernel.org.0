Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 682F088B80
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 15:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfHJNJd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Aug 2019 09:09:33 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38921 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfHJNJd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Aug 2019 09:09:33 -0400
Received: by mail-pf1-f196.google.com with SMTP id f17so43479074pfn.6;
        Sat, 10 Aug 2019 06:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nbp33dhtEClMZJfYmdVFpechLLFXlx7/6GRzJF8BUsQ=;
        b=sLHpz8kylvDXRLZFNKnk+XfEE+9bI+XO05/0nYrgqwg890FMLxcSh3dLEYHLCMEuaZ
         4460ZpV0AHUG7benYX/T+GmjLX6cYpoZCJiNPytDVlx8ky7s0JQ4pcNREVrOHApQA3x1
         VENsW0/nsQx9l8IqBdg/ZGyrIyp1IDB3wrqk7pVsxSPIx7TFJh1VPGf22R+xkS4MO/6e
         sJ+r60UgrQOZGuU6b0XEi7EPy7VGvVe0kDqHwlvY/hrFH+R5R7gGUY2bPm+oYb5TKVno
         eHHTpOrqbdcU/bm6ZWocgXt/k2gk7J1pJeFtP0AaJDgJe3xn8wAosprsBtK3SU4ixDYl
         LZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nbp33dhtEClMZJfYmdVFpechLLFXlx7/6GRzJF8BUsQ=;
        b=GnaSlvPwUUSpFbg4Elfw5Kx5jL3xahiOzKPXQ08AZa1jCzBOQxEKmxHMsVsjmrYJ/e
         aFoJqta9JFiWaDZj2+1krIOwz96BomyiT174QbHyHjb0O064u/5U51wiUiVOmucDLiuV
         qof/FK5g8hNVRoJJT/OXYp2I7dnn/tDhczkEUWoCw19RPhFtaimt69C1sNjLCwH4trWc
         vaCesA92cI7bQaOe7wj9mTGor0zlBJTs41poRzBILcSyG8HuvlanOWi2kdW6iY54yz7s
         6TayuseugjQ8+HCjUAvZoxvy+jFsROCLlIt6EYA0V10NMW194FGZiy8v5dRPDgj48dH2
         0KGQ==
X-Gm-Message-State: APjAAAUAvJQq5ivq287v91WyU33pT8NsUeDXdP4g+Fk+3WVQHTAfv/qE
        Rx0t4RyTIn/P+tVT+1QDeX/MPLYZwjnKqG3ME2A=
X-Google-Smtp-Source: APXvYqyE+ULqZVrF1p9wQKabJ2ELBRkepsfar6pZIykSfU9M+fAS92ifxACCYFnuH4uBVfAR8Xu+1d7JNGtHnnaJcrU=
X-Received: by 2002:a63:e54f:: with SMTP id z15mr21886228pgj.4.1565442572461;
 Sat, 10 Aug 2019 06:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-3-git-send-email-luis.oliveira@synopsys.com> <20190809141000.GB864@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190809141000.GB864@valkosipuli.retiisi.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 10 Aug 2019 16:09:21 +0300
Message-ID: <CAHp75VeutP=W43GHtY+FKvVGjBnQrF+nKbdaq_QXy8ZCoS=k1g@mail.gmail.com>
Subject: Re: [v4 2/6] media: platform: dwc: Add MIPI CSI-2 controller driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Luis Oliveira <Luis.Oliveira@synopsys.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        paulmck@linux.ibm.com, Mark Rutland <mark.rutland@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joao Pinto <Joao.Pinto@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 9, 2019 at 5:38 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> On Tue, Jun 11, 2019 at 09:20:51PM +0200, Luis Oliveira wrote:
> > Add the Synopsys MIPI CSI-2 controller driver. This
> > controller driver is divided in platform functions and core functions.
> > This way it serves as platform for future DesignWare drivers.

> > +const struct mipi_dt csi_dt[] = {
>
> Make this static or use a common prefix that somehow resembles the name
> name of the driver.
>
> > +     {
> > +             .hex = CSI_2_YUV420_8,
> > +             .name = "YUV420_8bits",
> > +     }, {
> > +             .hex = CSI_2_YUV420_10,
> > +             .name = "YUV420_10bits",
> > +     }, {
> > +             .hex = CSI_2_YUV420_8_LEG,
> > +             .name = "YUV420_8bits_LEGACY",
> > +     }, {
> > +             .hex = CSI_2_YUV420_8_SHIFT,
> > +             .name = "YUV420_8bits_SHIFT",
> > +     }, {
> > +             .hex = CSI_2_YUV420_10_SHIFT,
> > +             .name = "YUV420_10bits_SHIFT",
> > +     }, {
> > +             .hex = CSI_2_YUV422_8,
> > +             .name = "YUV442_8bits",
> > +     }, {
> > +             .hex = CSI_2_YUV422_10,
> > +             .name = "YUV442_10bits",
> > +     }, {
> > +             .hex = CSI_2_RGB444,
> > +             .name = "RGB444",
> > +     }, {
> > +             .hex = CSI_2_RGB555,
> > +             .name = "RGB555",
> > +     }, {
> > +             .hex = CSI_2_RGB565,
> > +             .name = "RGB565",
> > +     }, {
> > +             .hex = CSI_2_RGB666,
> > +             .name = "RGB666",
> > +     }, {
> > +             .hex = CSI_2_RGB888,
> > +             .name = "RGB888",
> > +     }, {
> > +             .hex = CSI_2_RAW6,
> > +             .name = "RAW6",
> > +     }, {
> > +             .hex = CSI_2_RAW7,
> > +             .name = "RAW7",
> > +     }, {
> > +             .hex = CSI_2_RAW8,
> > +             .name = "RAW8",
> > +     }, {
> > +             .hex = CSI_2_RAW10,
> > +             .name = "RAW10",
> > +     }, {
> > +             .hex = CSI_2_RAW12,
> > +             .name = "RAW12",
> > +     }, {
> > +             .hex = CSI_2_RAW14,
> > +             .name = "RAW14",
> > +     }, {
> > +             .hex = CSI_2_RAW16,
> > +             .name = "RAW16",
> > +     },
> > +};

One may utilize __stringify() macro and do somelike

#define CSI_FMT_DESC(fmt) \
 { .hex = CSI_2_##fmt, .name = __stringify(fmt), }

And do

 CSI_FMT_DESC(RAW16),

etc.

> > +             return cfg ? v4l2_subdev_get_try_format(&dev->sd,
> > +                                                     cfg,
> > +                                                     0) : NULL;

This indentation looks ugly.
I would rather put this on one line.

> > +     dev_dbg(dev->dev,
> > +             "%s got v4l2_mbus_pixelcode. 0x%x\n", __func__,
> > +             dev->format.code);
> > +     dev_dbg(dev->dev,
> > +             "%s got width. 0x%x\n", __func__,
> > +             dev->format.width);
> > +     dev_dbg(dev->dev,
> > +             "%s got height. 0x%x\n", __func__,
> > +             dev->format.height);

__func__ is usually redundant (if Dynamic Debug in use it can be
switched at run-time).

> I'd just omit these debug prints in a driver. But adding them to the
> framework might make sense. We don't have a lot of debug prints dealing
> with user parameters in there. OTOH the common test programs largely do the
> same already.

I would rather see tracepoints instead of debug prints if we are
talking about generic solution for entire framework.

>
> > +     return &dev->format;
> > +}

> > +     struct mipi_fmt *dev_fmt;

This is simple bad name. We have dev_fmt() macro. I would rather avoid
potential collisions.

> > +     struct v4l2_mbus_framefmt *mf;
> > +
> > +     mf = dw_mipi_csi_get_format(dev, cfg, fmt->which);
> > +     if (!mf)
> > +             return -EINVAL;

Can't you rather return an error pointer in this and similar cases?

> > +     dev_vdbg(dev->dev, "%s: on=%d\n", __func__, on);

This is noise. If you would like to debug Function Tracer is a good start.

> > +     of_id = of_match_node(dw_mipi_csi_of_match, dev->of_node);
> > +     if (!of_id)
> > +             return -EINVAL;

Is it possible to have this asserted?


> > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);

> > +     if (!res)
> > +             return -ENXIO;

Redundant. Below does the check for you.

> > +
> > +     csi->base_address = devm_ioremap_resource(dev, res);
> > +     if (IS_ERR(csi->base_address)) {

> > +             dev_err(dev, "Base address not set.\n");

Redundant. Above does print an error message for you.

> > +             return PTR_ERR(csi->base_address);
> > +     }

Moreover, use devm_platform_ioremap_resource() instead of both.

> > +     csi->ctrl_irq_number = platform_get_irq(pdev, 0);
> > +     if (csi->ctrl_irq_number < 0) {

> > +             dev_err(dev, "irq number %d not set.\n", csi->ctrl_irq_number);

Redundant since this cycle (v5.4).

> > +             ret = csi->ctrl_irq_number;

Better to do the opposite

ret = platform_get_irq();
if (ret)
 goto end;
... = ret;

> > +             goto end;
> > +     }

> > +     ret = devm_request_irq(dev, csi->ctrl_irq_number,
> > +                            dw_mipi_csi_irq1, IRQF_SHARED,
> > +                            dev_name(dev), csi);
> > +     if (ret) {
> > +             dev_err(dev, "irq csi %s failed\n", of_id->name);
> > +
> > +             goto end;
> > +     }

devm_*irq() might be a bad idea. Is it race free in your driver?

> > +static const struct of_device_id dw_mipi_csi_of_match[] = {
> > +     { .compatible = "snps,dw-csi" },

> > +     {},

Better without comma. Terminator may terminate even at compile time.

> > +};

> > +static ssize_t core_version_show(struct device *dev,
> > +                              struct device_attribute *attr,
> > +                              char *buf)
> > +{
> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> > +     struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);

> > +
> > +     char buffer[10];
> > +
> > +     snprintf(buffer, 10, "v.%d.%d*\n", csi_dev->hw_version_major,
> > +              csi_dev->hw_version_minor);
> > +
> > +     return strlcpy(buf, buffer, PAGE_SIZE);

Oh, can't you simple without any temprorary useless buffers?
 sprintf(buf, ...)?
(Yes, note _absence_ of *n* there)

> > +}

> > +static ssize_t n_lanes_store(struct device *dev, struct device_attribute *attr,
> > +                          const char *buf, size_t count)
> > +{
> > +     int ret;
> > +     unsigned long lanes;

> > +

More blank lines! We need them!

> > +     struct platform_device *pdev = to_platform_device(dev);
> > +     struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> > +     struct dw_csi *csi_dev = sd_to_mipi_csi_dev(sd);
> > +
> > +     ret = kstrtoul(buf, 10, &lanes);
> > +     if (ret < 0)
> > +             return ret;

Can it return positive number?

> > +     dev_info(dev, "Lanes %lu\n", lanes);

Noise.
The user gets it, why to spam kernel log???

> > +     csi_dev->hw.num_lanes = lanes;
> > +
> > +     return count;
> > +}

I told once, can repeat again. Synopsys perhaps needs better reviews
inside company. Each time I see the code, it repeats same mistakes
over and over. Have you, guys, do something about it?

-- 
With Best Regards,
Andy Shevchenko
