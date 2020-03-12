Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E410182D33
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgCLKOM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:14:12 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:38169 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgCLKOL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:14:11 -0400
Received: by mail-oi1-f180.google.com with SMTP id k21so4925430oij.5
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jmkbYdX8+j8+5rRfl7f3e7GwQSqimyD7SYnYxFyR5E0=;
        b=DmyVra3yF33pND3KBYCG1WrIzqhrPuc37FpVnMX4LRRIrYiXGMpvgPZFZ7bNhx38Jy
         bhBBWOZx+Hi9tJnU7TiJIYR5QAN9paP3kNEAOpLdvqCbpSmYXC0ndWO8Wn/G8hMEoBWI
         7UbF6503aN9fGMsUHVjHpDJ76xjYIUVcSLLlauXJTrBry+6gqbCXkADBm/lhFTPE2dP1
         m6psJHurWRf9QyJqhxENGmofwGS/ziPISB+aR3e8Ybrc6JRvHO8HRLcHdNUT0jYcd5Iz
         uNQuf9VPV1M4kv2mOkskGWHMi8hhUlsOp9R+iuDNgOSSId1M6ByOnNrpRR+9MNvpccEg
         cW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jmkbYdX8+j8+5rRfl7f3e7GwQSqimyD7SYnYxFyR5E0=;
        b=kshxQ+/VvD4eVJg/Fv0FI7NJe2gf8H8RzBpmW1UknSNpM3r+c064LOUqtEkQrphnlI
         wpJWeL/+Ls1OaJRhXrEKV7OkPpYWmiG5ofGrxTQdC7txKhg69ShA21cC+iPt6f9T8GT4
         1jyZSnrv7F3n9nndQTRFyoT9jKZPvLRUHfPbRRJ6Lr2Em8ziN/nouGh04z0+/b8ddfiD
         Jzl9YM2G/twqWXc+ezFFqrPlIEF/mkVTy785wdOEZkZoE+5R0Fvl7mzW/vL+I3iq1JTr
         +RXEtoOFZC+afg1mbhh4DYJ9cmE6knJeE6y8nlh1WhQr80tnPankG5MJJxeKZR3hnVH/
         bXfg==
X-Gm-Message-State: ANhLgQ3caWwvnpfh1kYY14g8YN/BezlpjvT9/xvYy2NySwQMbNAAHKVj
        ArH750LDxUcwJsj2FAzvBJg3tu8p1hVUZMB2fZ9dprRQ9Zk=
X-Google-Smtp-Source: ADFU+vuvLA7OJNogZQsqCnB5B9kakN6GgYe45+rLlUxm/uBRIXUsVnDaJlTEPNY27ZGSH15nNbJL51uwKZO17iVx8DY=
X-Received: by 2002:aca:ab4b:: with SMTP id u72mr2054085oie.26.1584008050585;
 Thu, 12 Mar 2020 03:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-2-robert.foss@linaro.org> <CAOMZO5C9Oj+SmTroE+bSsGcOPpz6se+WOqw1qJU9x6TrzbzZKw@mail.gmail.com>
 <CAG3jFyuLMxUEr7yZAHT99JK8NoUZc-aquuMEtSBH_Vipa-_giQ@mail.gmail.com>
In-Reply-To: <CAG3jFyuLMxUEr7yZAHT99JK8NoUZc-aquuMEtSBH_Vipa-_giQ@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 12 Mar 2020 11:13:59 +0100
Message-ID: <CAG3jFytyTO9h311WzTGDwDzGF-rwY1ANC=mhXXGxn6v83Anqmw@mail.gmail.com>
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

On Tue, 10 Mar 2020 at 16:51, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Fabio,
>
> Thanks for having a look at this series so quickly.
>
> On Tue, 10 Mar 2020 at 14:57, Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Robert,
> >
> > On Tue, Mar 10, 2020 at 10:46 AM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > > +    ov8856: camera-sensor@10 {
> > > +        compatible = "ovti,ov8856";
> > > +        reg = <0x10>;
> > > +        reset-gpios = <&pio 111 GPIO_ACTIVE_HIGH>;
> >
> > Could you double check this is correct? Other OmniVision sensors have
> > reset-gpios as active low.
>
> I have tested this, unfortunately I don't have access to a ov8856
> datasheet that includes
> this level of detail. But I have tested this.
>
> >
> > I suspect that the driver has also an inverted logic, so that's why it works.
>
> That could explain it still working. Let me have a look into the
> driver and see what it does.
>

I had a look at some of OmniVision drivers, and there does seem to be
a logical inversion in some of them,
but not all of them.

ov7251:
- enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
  to the hardware pin XSHUTDOWN which is physically active low.

ov5640:
- reset-gpios: reference to the GPIO connected to the reset pin, if any.
           This is an active low signal to the OV5640.

I think the confusion stems from the XSHUTDOWN pin being mapped to a
GPIO called reset, and the two being logically inverted. Currently
this series does several mappings.

XSHUTDOWN -> reset-gpio -> n_shutdn_gpio
       ^                           ^                      ^
Physical Pin               DT                Driver

I think changing to what ov5640 does makes the most sense.
XSHUTDOWN -> reset-gpio -> reset_gpio

> >
> > I don't have access to the datasheet though, so I am just guessing.
>
> Me neither unfortunately, if anyone does have a link for it, I would
> very much appreciate it.
