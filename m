Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CE425DAAE
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 15:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730732AbgIDN4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 09:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730632AbgIDN4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 09:56:18 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05315C061244;
        Fri,  4 Sep 2020 06:56:14 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mm21so3233694pjb.4;
        Fri, 04 Sep 2020 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pHS0OvNcUu22bKVNpK0d+GADbMdPHqwo2X75O5rIZno=;
        b=VfxkyQAiqVBk5fj5X7YOl1ZV7uG3cDScXBkjSYTxTJ/cgIbrTmyOEy3FzYQ50s3ZCj
         diEaFubYWxKAsBRLO3xL/T/bH0ErdNjjDlNm/eQ+L1+DnlO67T79Kk82b8gW9x7P3+N5
         k7izw3zLTqxZezUJjtdbuJPxV6ifOBMPULkvrVZlKsNoDLzi3D5Aj0bJCkqR8bz6GjwU
         SNwx1X+yU9opmmJ49q2zQhM16wwPKcHrwwvndAwroJcTzXWtb5Wrz+bdY/Xlg9BzZe3a
         sASa/HXljYKIJEl1o1SXvfWVAjV/VTJU+YFIz/G2co9vcg6SkPEPjvAmUshVdblO/g0n
         n5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pHS0OvNcUu22bKVNpK0d+GADbMdPHqwo2X75O5rIZno=;
        b=qNpXcuNtsda6mrpYSGxNW1y9kECUzmPed02ioYDC928HKhA/NtKkVgNmON71In8Igv
         jeWS2XtUf4TDyG8acpRg85EuvMcC492OyopgvgM6Om7N2wWIEz6UNv8JOMWtW6Hmz1hV
         ccODfSaHHYrPwz2a1aAEY/RBDKkW+GW9IzXkHfgtOyXnlovzhDBRoLe7sYB8JUaSzKeN
         nZ64nz74v4cXyLC5WfozvrerElabX7FqJgrPH4dFxS+TLKX3arzIXWThFPz7cltw8HNH
         jWccNPN8tjXYgwJNNQo29fmGAa0S7VRDkAnCIxy0GUG9peKtxbvmhgtkDCACzxReLX+p
         rSXQ==
X-Gm-Message-State: AOAM531QkWRt0/ehjaheE6aAP4VeNauiBRR09jBMFZ8y155XSe98TtRU
        6zGhihROJDje64pK7bZk3+3cSj52OqRmtYwtNtk=
X-Google-Smtp-Source: ABdhPJwfDAE9oHcskAwcGQ9AKqYjIave8/BxWdL4hnwucBsyEsQiRYaLBcEhmhRNd1MhbYtbVhVrgwycKquIaba8YRY=
X-Received: by 2002:a17:902:ea86:: with SMTP id x6mr8794264plb.131.1599227773397;
 Fri, 04 Sep 2020 06:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com> <20200902134421.GN1891694@smile.fi.intel.com>
 <20200902135145.GO1891694@smile.fi.intel.com> <1599226354.4733.69.camel@mhfsdcap03>
In-Reply-To: <1599226354.4733.69.camel@mhfsdcap03>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 4 Sep 2020 16:55:56 +0300
Message-ID: <CAHp75VezE2iGBarXke4P9z31SmymBgPH5fwoknt9vBfFTw0u=w@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>, matrix.zhu@aliyun.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 4, 2020 at 4:38 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> On Wed, 2020-09-02 at 16:51 +0300, Andy Shevchenko wrote:
> > On Wed, Sep 02, 2020 at 04:44:21PM +0300, Andy Shevchenko wrote:
> > > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:
> >
> > > > + ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> >
> > > > + ret = fwnode_property_read_u32_array(dev_fwnode(dev),
> >
> > > > +         fwnode_property_read_u32_array(dev_fwnode(dev),
> >
> > > > + ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> >
> >
> > Btw, can somebody explain, why it's fwnode API and not direct use of device property API?
> >
> > In all above cases I see no reason why not to use device property API directly.
> >
>
> From the fwnode API's usage:
> @fwnode: Firmware node to get the property of.
>
> It seems dev_fwnode(dev) could return dev->of_node->fwnode if CONFIG_OF
> is enabled, or return dev->fwnode if not.

So?..

Shouldn't be the above an equivalent to device_property_*(dev, ...)?

-- 
With Best Regards,
Andy Shevchenko
