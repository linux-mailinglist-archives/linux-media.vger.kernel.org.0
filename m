Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239402836AF
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 15:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgJENgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 09:36:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:43134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbgJENgw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Oct 2020 09:36:52 -0400
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5ADA720774;
        Mon,  5 Oct 2020 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601905011;
        bh=ZIFB3rgf26rt5j5jyMIodGOuMafdvBhjlRX/3PIzwfs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=y/aOCBZPeKbzI6w2BUZ53/alYwBumqxwqs9wxTEyFpDNSe7+Iqeu3PBeqs13z2h/U
         LLziP3TdpkgaDBOgepVjvTyhxQqmYA108Oqo9avokmWyd8d24JD7hrLjIUJLhyxhXU
         9SKToKrwm/l3AAw/bUfH4XNk3HooI8RTrykqWRTk=
Received: by mail-oi1-f182.google.com with SMTP id t77so5217265oie.4;
        Mon, 05 Oct 2020 06:36:51 -0700 (PDT)
X-Gm-Message-State: AOAM53068eSIuuFbikfCmeP/6EPee1OPcWK/6YWLSLw8Bd3AYveW4blf
        xtdE3+xkLwdAEQgLRdO85cn05uddb0NwxLiWpQ==
X-Google-Smtp-Source: ABdhPJyGs5QRZXi2qUMhyXkN0ZTEB+WjvBFpuxhQAOv16pvutHt7q3CX0sNVLLFIy9B+jn4ovbMkwFpiJqg2gYBlnEQ=
X-Received: by 2002:a05:6808:10e:: with SMTP id b14mr9024261oie.152.1601905010756;
 Mon, 05 Oct 2020 06:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200922190807.6830-1-qiangqing.zhang@nxp.com>
 <20200922190807.6830-2-qiangqing.zhang@nxp.com> <20200929155201.GA665464@bogus>
 <20201003084656.GA29917@gofer.mess.org>
In-Reply-To: <20201003084656.GA29917@gofer.mess.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 5 Oct 2020 08:36:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKEqG_Xous_gf=t9LTY8ZGzwcCYNjMDEGt8bA17JUgW-g@mail.gmail.com>
Message-ID: <CAL_JsqKEqG_Xous_gf=t9LTY8ZGzwcCYNjMDEGt8bA17JUgW-g@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] bindings: media: gpio-ir-receiver: add
 linux,autosuspend-period property
To:     Sean Young <sean@mess.org>
Cc:     Joakim Zhang <qiangqing.zhang@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 3, 2020 at 3:46 AM Sean Young <sean@mess.org> wrote:
>
> On Tue, Sep 29, 2020 at 10:52:01AM -0500, Rob Herring wrote:
> > On Wed, Sep 23, 2020 at 03:08:06AM +0800, Joakim Zhang wrote:
> > > Add linux,autosuspend-period property for gpio ir receiver. Some cpuidle
> > > systems wake from idle may take a bit long time, for such case, need
> > > disable cpuidle temporarily.
> > >
> > > Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> > > ---
> > > ChangeLogs:
> > > V1->V2:
> > >     * New add.
> > > V2->V3:
> > >     * linux,autosuspend-period = 125; -> linux,autosuspend-period = <125>;
> > > ---
> > >  Documentation/devicetree/bindings/media/gpio-ir-receiver.txt | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> > > index 58261fb7b408..e1447c9b0e26 100644
> > > --- a/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> > > +++ b/Documentation/devicetree/bindings/media/gpio-ir-receiver.txt
> > > @@ -7,6 +7,8 @@ Required properties:
> > >  Optional properties:
> > >     - linux,rc-map-name: see rc.txt file in the same
> > >       directory.
> > > +        - linux,autosuspend-period: autosuspend delay time,
> > > +          the unit is milisecond.
> >
> > What makes this linux specific?
>
> Good point. "linux,autosuspend-period" does not say what is being
> suspended either. How about "cpuidle-suspend-period" instead?

'cpuidle' is a Linuxism. And you also need a unit suffix.

I'm not clear on how autosuspend which is generally how long a
peripheral is idle before runtime suspending it relates to this which
seems to be concerned with cpu wakeup latency. I'm assuming you need
to wake up within a certain time period to capture GPIO edges. Don't
you know what this time would be based on IR data rates and can
provide that constraint to cpuidle?

Also, we can set autosuspend times from sysfs. Why do you need to do
this from DT?

Rob
