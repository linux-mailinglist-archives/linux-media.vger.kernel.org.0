Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA561E7F39
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 15:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgE2NwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 09:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgE2NwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 09:52:04 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F12CC03E969
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 06:52:04 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e4so2711904ljn.4
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWgHSNB7/VCfINBd4053Z4Bp4XM8aSMiiq5K+JAFOJU=;
        b=FLkftvLPGVoeJxbq2VHT25nIDxHqlrnsichgg+ZcVZeImFzvr5WM6ikvLnws0GBV75
         e0Zn7vsbU4Yvy69PdBhEWe/kHB8gmtLkkXdVlfQq0BaaUZC0RFw1i+DCdnrmHmd3975E
         ikaIJR7tmKW8ZMPMqS6oIY/eWF4Uwu7lNTxoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWgHSNB7/VCfINBd4053Z4Bp4XM8aSMiiq5K+JAFOJU=;
        b=ChAHExwKPG5Lz+tlBBj17YqZR1AOvCKPq4awoFp4ODWjgb+ep1SkhgC2bR59qTjB8s
         EJ8MyaYDSxLpvUIfjRmIQ9RoOStFNHPkEOGjTN+8A2usb0cuUbfHwUemPMq5DxTo4qKq
         VSZJVyWY6OI2eLGAPMc7m/YP0gI3cYtx5+YlD7y1cAlPM2rm7P2O0E8NCVmH7OzsXgDI
         LJK8LUy7GD5TkVF0uLmr94wgAg1oizoYZeTtQknNrnX6xcyBRitQua8x5CfX13zz07Db
         ddv2HYHbBxysKjnRPsynDBV/UpQQe5sGGMe8+mv750tspXDZnLQx/eJMAFQFxZh/UIgB
         oU6A==
X-Gm-Message-State: AOAM531GrndK+R2EWxkP9XmBekjTodrAiI52Q1ze6ERpo6UGkJ1/ea8L
        mGp0CaPKsnCMwq90Ni4Usl9RKwkKcJqnLg==
X-Google-Smtp-Source: ABdhPJwDRMA6eNoLNZePALu2rGQNeG2/kwBN/mPRthewDYM1Dv3f9e8qjmZ+jgPgZxkS4aWyeLAW/Q==
X-Received: by 2002:a2e:b803:: with SMTP id u3mr4236704ljo.243.1590760322170;
        Fri, 29 May 2020 06:52:02 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id j17sm454485ljo.95.2020.05.29.06.52.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 06:52:01 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id o9so2692886ljj.6
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 06:52:01 -0700 (PDT)
X-Received: by 2002:a05:6000:d:: with SMTP id h13mr8532637wrx.17.1590759821053;
 Fri, 29 May 2020 06:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com> <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03> <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
 <20200527211628.GT7618@paasikivi.fi.intel.com> <1590636882.8804.474.camel@mhfsdcap03>
 <20200528072332.GW7618@paasikivi.fi.intel.com> <1590653082.8804.517.camel@mhfsdcap03>
In-Reply-To: <1590653082.8804.517.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 29 May 2020 15:43:30 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
Message-ID: <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
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

On Thu, May 28, 2020 at 10:06 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Sakari,
>
> On Thu, 2020-05-28 at 10:23 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> >
> > On Thu, May 28, 2020 at 11:34:42AM +0800, Dongchun Zhu wrote:
> > > Hi Sakari, Rob,
> > >
> > > On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> > > > Hi Rob, Dongchun,
> > > >
> > > > On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > > > > +    properties:
> > > > > > > > +      endpoint:
> > > > > > > > +        type: object
> > > > > > > > +        additionalProperties: false
> > > > > > > > +
> > > > > > > > +        properties:
> > > > > >
> > > > > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > > > >
> > > > > Yes, if you are using it.
> > > >
> > > > Dongchun, can you confirm the chip has a single data and a single clock
> > > > lane and that it does not support lane reordering?
> > > >
> > >
> > > From the datasheet, 'MIPI inside the OV02A10 provides one single
> > > uni-directional clock lane and one bi-directional data lane solution for
> > > communication links between components inside a mobile device.
> > > The data lane has full support for HS(uni-directional) and
> > > LP(bi-directional) data transfer mode.'
> > >
> > > The sensor doesn't support lane reordering, so 'clock-lanes' property
> > > would not be added in next release.
> > >
> > > > So if there's nothing to convey to the driver, also the data-lanes should
> > > > be removed IMO.
> > > >
> > >
> > > However, 'data-lanes' property may still be required.
> > > It is known that either data-lanes or clock-lanes is an array of
> > > physical data lane indexes. Position of an entry determines the logical
> > > lane number, while the value of an entry indicates physical lane, e.g.,
> > > for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
> > > the clock lane is on hardware lane 0.
> > >
> > > As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
> > > support lane reordering, so here we shall use 'data-lanes = <1>' as
> > > there is only a clock lane for OV02A10.
> > >
> > > Reminder:
> > > If 'data-lanes' property is not present, the driver would assume
> > > four-lane operation. This means for one-lane or two-lane operation, this
> > > property must be present and set to the right physical lane indexes.
> > > If the hardware does not support lane reordering, monotonically
> > > incremented values shall be used from 0 or 1 onwards, depending on
> > > whether or not there is also a clock lane.
> >
> > How can the driver use four lanes, considering the device only supports a
> > single lane??
> >
>
> I understood your meaning.
> If we omit the property 'data-lanes', the sensor should work still.
> But then what's the meaning of the existence of 'data-lanes'?
> If this property 'data-lanes' is always optional, then why dt-bindings
> provide the interface?
>
> In the meantime, if omitting 'data-lanes' for one sensor(transmitter)
> that has only one physical data lane, MIPI receiver(e.g., MIPI CSI-2)
> shall enable four-lane configuration, which may increase consumption of
> both power and resource in the process of IIC communication.

Wouldn't the receiver still have the data-lanes property under its
endpoint node, telling it how many lanes and in which order should be
used?

Best regards,
Tomasz
