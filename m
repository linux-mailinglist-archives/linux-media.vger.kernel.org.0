Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC62D17F473
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 11:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgCJKKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 06:10:14 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42373 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgCJKKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 06:10:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id h8so6087798pgs.9;
        Tue, 10 Mar 2020 03:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HDXFysJpdV8VuCGjPdLDxQClbolL707s7Oy1HPUOvA0=;
        b=qxEsvkqOujZodAPp+3ueiAK0DjURCF22GunvMK9QN+KklKRMgATwVgcV9c0hSNEUCz
         TAQI5Ohj0cXhf/epw5T+HSN+GE95Tk9gtrafCmMXl587W/ZgpXygCTEZ8vK3SmVb0TIF
         uCehoekTjWV8oLZEDYH8SAa37cT7XZXW/UyahoNZGp6tA8T6lpOy11ils26Zg59WR04z
         CaSo7Rz+ZjrxbxEp0CTNZ07mZ+HX0zl/t7wP+5ThGovd9CjakbU2IQiOFppgt8P+7p4W
         0Jn/7ZK4Yom5kVH/GKtFiX3Hx2gWwpA1KdqhDJiL5ONFS4LALreASK682L6CmTe75aHs
         qIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HDXFysJpdV8VuCGjPdLDxQClbolL707s7Oy1HPUOvA0=;
        b=TVoX6Ny+AsYCWzvPijIGOSbJQOY2ATfTh8MtcwnUBoSsauIJwt5KmhmacfG/WotzIA
         3dcgKmo3x9dzcDdgkQZ6gBQMshqkYQlrwonQ8ShLHu1cnVmbePGFTSB0t2Klm4/8ZON9
         L+HCtEaeJ5Txq2o1ePztK+RN8IKEge/0FlAFxF+Xmu96wp5ej0X9oU4a+y2CYfXNvGM8
         2rGzXHZ2PO+ZbNW5e9J6S91fkzPzW2VLZqYk+Iy9ezOrlcgZ9vrr++4iEjdDNvqcLNq5
         /e64gEJNpa7YdRlUPeyMIiCwgtG0qTi3Z6MpvrHAmPJYnn57JzpiTN1HlwkdtcrgNnJ5
         jUZQ==
X-Gm-Message-State: ANhLgQ1lHLMw/jWnQlesdEIDM+QLpoLxNkU6neh59pKJ17IY2l5veB8Q
        3sjM7KmYEAQzWMRPHpppwT0cEcl3bVGGSWz1SK4=
X-Google-Smtp-Source: ADFU+vvLJ9Bi1/5PtpdB3XdQzWlug4LKrI66cLqdLbaY0Kfs/y64+i228nQqpbnk8BVnj0qLhHSGLoQoUU2CFCR3CCI=
X-Received: by 2002:a63:1246:: with SMTP id 6mr19811313pgs.4.1583835013383;
 Tue, 10 Mar 2020 03:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-3-dongchun.zhu@mediatek.com> <20200305120516.GQ5379@paasikivi.fi.intel.com>
In-Reply-To: <20200305120516.GQ5379@paasikivi.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Mar 2020 12:10:05 +0200
Message-ID: <CAHp75Vf5km-YitoTUAFkr8LZVq2QMep1rC19ZpR-YRbeXgJOVQ@mail.gmail.com>
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        sj.huang@mediatek.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>, louis.kuo@mediatek.com,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 5, 2020 at 2:07 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Fri, Feb 28, 2020 at 11:59:58PM +0800, Dongchun Zhu wrote:
> > This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> > and provides control to set the desired focus via I2C serial interface.

...

> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5139,6 +5139,7 @@ M:      Dongchun Zhu <dongchun.zhu@mediatek.com>
> >  L:   linux-media@vger.kernel.org
> >  T:   git git://linuxtv.org/media_tree.git
> >  S:   Maintained
> > +F:   drivers/media/i2c/dw9768.c
> >  F:   Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml

This has ordering issues.
Run parse-maintainers.pl to fix.

-- 
With Best Regards,
Andy Shevchenko
