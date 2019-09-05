Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D699DAA08C
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732085AbfIEKxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:53:55 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:42629 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730973AbfIEKxy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 06:53:54 -0400
Received: by mail-ed1-f54.google.com with SMTP id y91so2209256ede.9
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 03:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7rrx72VwVJ1LRFWXWIwjijZPZ1SY7L6VpX1CSdVM04=;
        b=IzAxFAEsOE35jSUHVhedgPdpBis1Rc9StzxezmqkJKZgg9gwMt6McpdeX3YjRYznon
         I+/Ym3VjoDJswSW+d2QTeRTM8WEIKyo8Vb5J/arqCodFn6rK5PagNvhUJCr5m6PKbiPc
         fl0aZd5IQYsPFY4oOFpPjuSZxOJhxJCL2sSG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7rrx72VwVJ1LRFWXWIwjijZPZ1SY7L6VpX1CSdVM04=;
        b=mLiqESpqOcnGAc3D6P0m70WsHigRErIiaEgU0NcFcdbgfTrtLYanorh8QJX6LsvjVu
         /4muFB0hzljlqcf9/KD5PAvJxJ6kDk6mdyKVedsmEuXtomgWC7fX4WGCrb3UVzJIz/1D
         ow8D1AIxFSgVcB7gqE6dGL2W4o2Um1Ml16bEfpjmQv/aJVtDkMhMlexyjAMXXPujpTgF
         syVYg50WD6mS61j5zfyY8+1vQ7OR4+O/CtWM9RLukcEoCV0TJ+bjUXEmuSuJvVPHKvLi
         ExBmMf7gf0p759iXJvHMeQ3Svwsz+eJOYheOrFdJ840eySzaES1OJRJ7s2U+B2wNG/6M
         /QKA==
X-Gm-Message-State: APjAAAUlcwwqRULQWTdo/vWAaGgQrKqPCPd2Aghk3ZxPSWk+RnIWE0hi
        TLM2Mp6/UKRO8h5wA4wb/k39SDAbSd5M/Q==
X-Google-Smtp-Source: APXvYqwfZwFn6035dKn20u/Vlh+JjGreq3rjxMEedDdS4yocGrUbrxPrbasAZp0HLIl5zz98LQl+sg==
X-Received: by 2002:a17:906:a851:: with SMTP id dx17mr2294333ejb.116.1567680831611;
        Thu, 05 Sep 2019 03:53:51 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id r10sm322456edp.25.2019.09.05.03.53.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2019 03:53:50 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id u16so2230230wrr.0
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 03:53:49 -0700 (PDT)
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr1922399wru.48.1567680829535;
 Thu, 05 Sep 2019 03:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com> <20190819083009.GC6133@paasikivi.fi.intel.com>
 <1567676465.21623.100.camel@mhfsdcap03> <20190905104546.GA5475@paasikivi.fi.intel.com>
In-Reply-To: <20190905104546.GA5475@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 5 Sep 2019 19:53:37 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com>
Message-ID: <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com>
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 5, 2019 at 7:45 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dongchun,
>
> On Thu, Sep 05, 2019 at 05:41:05PM +0800, Dongchun Zhu wrote:
>
> ...
>
> > > > + ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > + if (ret < 0) {
> > > > +         dev_err(dev, "Failed to enable regulators\n");
> > > > +         goto disable_clk;
> > > > + }
> > > > + msleep_range(7);
> > >
> > > This has some potential of clashing with more generic functions in the
> > > future. Please use usleep_range directly, or msleep.
> > >
> >
> > Did you mean using usleep_range(7*1000, 8*1000), as used in patch v1?
> > https://patchwork.kernel.org/patch/10957225/
>
> Yes, please.

Why not just msleep()?
