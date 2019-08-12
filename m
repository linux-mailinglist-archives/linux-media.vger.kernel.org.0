Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7DA8A3CB
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 18:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbfHLQvA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 12:51:00 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:41716 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfHLQu7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 12:50:59 -0400
Received: by mail-pg1-f170.google.com with SMTP id x15so39429087pgg.8;
        Mon, 12 Aug 2019 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g9qJeMX8U2lRIDeMiCr86C9holTbMXh0NvzNqlARYoI=;
        b=KJFn9a4uDrLZeXdVcv23sADaBfj63sYK9Nys2bd9F1b9ij6qqeYBVewjJ1TFcFNGVp
         E6wP5V/v6RJdRH8GREXrnErUAHelzEPyww5bV/1PIn0gIU7Qbf0cgjFQDHTyMu+tT9DS
         PCf2lV4xHJQ+x2qJSxvuh8IXJlu1ylF8aTKRPzENByzCpaxQkrSR7IwA2sE4JrTgQqW3
         zSE70qJFv2fg3XQ7Ox+Pf5Tn+O0es9/VNxLDBpQjEEVp14choZIIwD+EKQ3ov72NYhgM
         7ArfXt2/0eiLvxnFPKxS4yj0JBsmO7BrTNMDLhA1zBsO58kjTwSPXniP12hRb3FpFsTe
         NSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g9qJeMX8U2lRIDeMiCr86C9holTbMXh0NvzNqlARYoI=;
        b=sMd1YrfdtSlBWBF900jj7G1uBnHjzw8nOvjGHw52SOv3llksBZEZvM7AVrkpzdJ5i/
         uLlGLm0yMmkZfj0CH4Ivyn/kLsIH4QOmLuq/OmSwZ54DzMbnuyAi7qsbaif7HdWUBATp
         alTGfhVyOn5Bh77+d2IZqOEqgF4vvX8gW6uqrCx0VjuilRTd2zQuy6AsQkaNpPjULvac
         mxqTKfpOfmXZNvJfhna73FmkQBdPUZmtldSfZPQx6L6Ltz9yIrHcD6NE8R/VSlP2nhti
         f7d66xu6wddnW2qkzUxDxgXFagVpXgd0IisTIKl4FjxtUPpRGRTPGaprIDE6AaT8q+Pm
         kZuQ==
X-Gm-Message-State: APjAAAV+I4XvnhNBRKmR82ZyZPizHi3CiHjkbcDc/L+CCVg+F5Jpufoo
        gHjrUTlGOPfHKonBjA4ww5HdUt0DzvFxgLBvecA=
X-Google-Smtp-Source: APXvYqwgxt09JBsfPEAZiqB4JcYb6a0OyhR7nQZSMJCETQ0/MNL3XZ9i37XfV2K/T+1vZfMuk3wN/B3iap8zlzb3OCA=
X-Received: by 2002:a05:6a00:8e:: with SMTP id c14mr8324189pfj.241.1565628659105;
 Mon, 12 Aug 2019 09:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-3-git-send-email-luis.oliveira@synopsys.com>
 <20190809141000.GB864@valkosipuli.retiisi.org.uk> <CAHp75VeutP=W43GHtY+FKvVGjBnQrF+nKbdaq_QXy8ZCoS=k1g@mail.gmail.com>
 <MN2PR12MB3710E54A1E4BA4FD3AD77B87CBD30@MN2PR12MB3710.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3710E54A1E4BA4FD3AD77B87CBD30@MN2PR12MB3710.namprd12.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Aug 2019 19:50:47 +0300
Message-ID: <CAHp75VcgZjXj8PqBrm5pOxjQuhS-6=e7ZP9HnO9j+BbMEfb-9Q@mail.gmail.com>
Subject: Re: [v4 2/6] media: platform: dwc: Add MIPI CSI-2 controller driver
To:     Luis de Oliveira <Luis.Oliveira@synopsys.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>,
        Mark Rutland <mark.rutland@arm.com>,
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

On Mon, Aug 12, 2019 at 12:45 PM Luis de Oliveira
<Luis.Oliveira@synopsys.com> wrote:
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Date: Sat, Aug 10, 2019 at 14:09:21
> > On Fri, Aug 9, 2019 at 5:38 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > On Tue, Jun 11, 2019 at 09:20:51PM +0200, Luis Oliveira wrote:

> > > > +     of_id = of_match_node(dw_mipi_csi_of_match, dev->of_node);
> > > > +     if (!of_id)
> > > > +             return -EINVAL;
> >
> > Is it possible to have this asserted?
> >
>
> I will remove it.

But please double check that is really the case.

> > > > +     ret = devm_request_irq(dev, csi->ctrl_irq_number,
> > > > +                            dw_mipi_csi_irq1, IRQF_SHARED,
> > > > +                            dev_name(dev), csi);
> > > > +     if (ret) {
> > > > +             dev_err(dev, "irq csi %s failed\n", of_id->name);
> > > > +
> > > > +             goto end;
> > > > +     }
> >
> > devm_*irq() might be a bad idea. Is it race free in your driver?
> >
>
> I never thought about it like that. Should I use request_irq and
> free_irq?

It's you, author of the driver, who knows it better :-)


> > I told once, can repeat again. Synopsys perhaps needs better reviews
> > inside company. Each time I see the code, it repeats same mistakes
> > over and over. Have you, guys, do something about it?
>
> We are working on it. It will get better, sorry.

Thanks! Hope to see a progress!

-- 
With Best Regards,
Andy Shevchenko
