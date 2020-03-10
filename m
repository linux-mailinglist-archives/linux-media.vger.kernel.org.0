Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF9618026F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 16:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgCJPvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 11:51:50 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:41093 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgCJPvt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 11:51:49 -0400
Received: by mail-oi1-f181.google.com with SMTP id i1so14309101oie.8
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TzI3NS1us/9nonvG5pXz3Br1CySTtDhQY55j7Q6IipQ=;
        b=mBsQ1xKQINy5A2P1Vw/LPVEj2a/HGVi3YKU2BuXz7iz+6/A9Eil5VZpaX3mlZF9AcW
         atj5utXs4c9T1S3OZJD6POMTEW7jwHwEXghN2Nl2NuSnK1Zbl2/1nALHQlEV45bcNPPZ
         1Nr0WiCF+FyXxDy16mSv9QxcDB9j05vBTWytODhswMM9R4dCmyLpc4BoMOf60TyHKJAx
         441St8WmfCXE4Jnp29UQo9gFpqMkuzMG7HdUs7jI5UEaclGhaimPK1x/Y9aPQLpR+nTx
         kivYTX3ggu/6XjGjpJ6cPuAZ0AdBJ0+mQN0m7I+Onvr83jg/yJKs/wQ08bAbDLwh12de
         uPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TzI3NS1us/9nonvG5pXz3Br1CySTtDhQY55j7Q6IipQ=;
        b=i0X4g4l1zk4SghXMsu2obfiefnuQlDyUq9ISaB9E/GC0xijFCIkFAF/gMvanXK3hS6
         ZrD9895ekZ99TjHqR/ZCdNfFga0WNyP1+mmlmgGB2z9wCAF8Mx4ubOQWl1bkDpGUf4V7
         C3MTz1fj58RgCnRx4g93uTjurPo20C10urFjzMiI64nH7s38VP2vhUFUOCJ6zEpWMive
         WMiaMBhYdecDZCLSnnYU1bANH3sASxyJTZasJU2+bhPTnurr99S9MVLpXIndTkY+8K+e
         4ZiurXa0bvH1DoXjNvSdFiPDFKvY6E2uKz96GphhnbwhNq0sXZ8qGbWBN01EtV3pfhTr
         Hi4A==
X-Gm-Message-State: ANhLgQ1AUIWjNUsOJHD600pGXspV++Mik75tPdhkzGSpo0PppnCjcGwU
        l3JyKJxUJK9XltztHbzmA7l5H5Ihgtnk0N6YJ+OcpQ==
X-Google-Smtp-Source: ADFU+vto/+p/nquy8sen8kW/eAjYeNh2K6wTtdo9nvKXrCLZxqA2YN3nxqEtyQvwvv7lf4XKqCo9hac02b0WuwtUEl8=
X-Received: by 2002:aca:ab16:: with SMTP id u22mr1571231oie.133.1583855507476;
 Tue, 10 Mar 2020 08:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-2-robert.foss@linaro.org> <CAOMZO5C9Oj+SmTroE+bSsGcOPpz6se+WOqw1qJU9x6TrzbzZKw@mail.gmail.com>
In-Reply-To: <CAOMZO5C9Oj+SmTroE+bSsGcOPpz6se+WOqw1qJU9x6TrzbzZKw@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 10 Mar 2020 16:51:36 +0100
Message-ID: <CAG3jFyuLMxUEr7yZAHT99JK8NoUZc-aquuMEtSBH_Vipa-_giQ@mail.gmail.com>
Subject: Re: [v1 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Fabio Estevam <festevam@gmail.com>
Cc:     ben.kao@intel.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan.Cameron@huawei.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Fabio,

Thanks for having a look at this series so quickly.

On Tue, 10 Mar 2020 at 14:57, Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Robert,
>
> On Tue, Mar 10, 2020 at 10:46 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> > +    ov8856: camera-sensor@10 {
> > +        compatible = "ovti,ov8856";
> > +        reg = <0x10>;
> > +        reset-gpios = <&pio 111 GPIO_ACTIVE_HIGH>;
>
> Could you double check this is correct? Other OmniVision sensors have
> reset-gpios as active low.

I have tested this, unfortunately I don't have access to a ov8856
datasheet that includes
this level of detail. But I have tested this.

>
> I suspect that the driver has also an inverted logic, so that's why it works.

That could explain it still working. Let me have a look into the
driver and see what it does.

>
> I don't have access to the datasheet though, so I am just guessing.

Me neither unfortunately, if anyone does have a link for it, I would
very much appreciate it.
