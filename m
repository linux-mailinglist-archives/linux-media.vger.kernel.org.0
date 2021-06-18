Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A85C3ACB5A
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhFRMv6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbhFRMvz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:51:55 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63415C061574;
        Fri, 18 Jun 2021 05:49:45 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id x22-20020a4a62160000b0290245cf6b7feeso2419219ooc.13;
        Fri, 18 Jun 2021 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gYRQQqkflstokbPMQ45EOzFFXs3cNTWmXdnRNdqXloc=;
        b=EfWWbdEB7R4vC8/JNVZrzmPs2b0Lrk5xFdvgVOkGZNtXPLiBcnD9WGYIogCKJi8RyQ
         ft70CvqyLzeUFrs5Eq+xMAwhu9Mai+9jh3kUOMYXm+V5rCQ8WGRh6ORbsqTpCtYch6Rg
         GdJCgPBbFHq3lLDGLp3ejWzlHdyhzpaY7yOfkV0pRri1HqU0I59pSwcu1Pemc9RdF/PF
         u7SyMC5//oe4mmhUVqRmX/XEeQgFrWTAD4+24xYgLf9/h/mvFhNHlUxcA4DM3vYw3JqH
         pI24vSWnm9gbcZRoEgtSwZE+LH4KHsnMj5skC5Wg1FN8dXD4SXis/QzT3wIM8AgvuQqp
         WFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gYRQQqkflstokbPMQ45EOzFFXs3cNTWmXdnRNdqXloc=;
        b=OFxxdEnRuulN0g0pU5FUuugIQZF62v6K0ZTAOasmtTT+ryQidyN3soaxR5IMn5gtjd
         LD95ctp+Fg/SpTnUAJX1DICPJGjOoQVDAjDlthIZUJSAc+xGcciFnAeXQtbGAdsdhryB
         dmWChIA539o+YTdmmrzK5vbMchCMQhabPqQG1jFv+qeruzLjyPm+X8SMPFN4aCYd1yqx
         HXWG1Amepjp0q316dO1AZlNmHMMpm/HEDS/V6q7RigZ7gJ3aTtC/8KChTHuBRvbRLRXj
         vb8u3VDdZ38NdoCwcq85DKXyOFiWZjM9ibRm/xeOHqZUDdMPKJMw0tjHmoFqPSJ1yrUF
         yM0A==
X-Gm-Message-State: AOAM533T+iZJkPRDHtWsN07C8/RcNkae+pEgK2xGRL8oZk2bLA2IokZq
        xsvvUehDoepJ66yNsIcQHHkqjXNxSTn5OSqE1pU=
X-Google-Smtp-Source: ABdhPJxsNeYFNOtY5YWE85ME1DVFAJSS5hj3Ki4PDhCvGsj1DvzdeE8fSkfp5o2vm2uyoJbf3MY6e5TjxyQis22ggOc=
X-Received: by 2002:a4a:b1c2:: with SMTP id j2mr8926777ooo.78.1624020584775;
 Fri, 18 Jun 2021 05:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
 <20210522211055.15988-3-mirela.rabulea@oss.nxp.com> <DB9PR04MB8477D8F7DC86E67F74D5D9F780269@DB9PR04MB8477.eurprd04.prod.outlook.com>
 <e4c174afd7c55c56c68afbe69276b41c3f574964.camel@nxp.com> <CAA+hA=TEi3iZ+nOfff=aN1FrLGb6+OHfx23aWaa1J7YfZRRgtA@mail.gmail.com>
 <15d5728aeb7895f81f833e7f7e281861c1fcef9a.camel@collabora.com>
In-Reply-To: <15d5728aeb7895f81f833e7f7e281861c1fcef9a.camel@collabora.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Fri, 18 Jun 2021 20:47:57 +0800
Message-ID: <CAA+hA=RB_va3TRhjFBSofVqDEpj_LxLfUM84ead5D2LLZ3KRwA@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] arm64: dts: imx: Add jpeg encoder/decoder nodes
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 11, 2021 at 11:01 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Fri, 2021-06-11 at 21:33 +0800, Dong Aisheng wrote:
> > [...]
> >
> > > > > +img_subsys: bus@58000000 {
> > > > > +   compatible = "simple-bus";
> > > > > +   #address-cells = <1>;
> > > > > +   #size-cells = <1>;
> > > > > +   ranges = <0x58000000 0x0 0x58000000 0x1000000>;
> > > > > +
> > > > > +   img_ipg_clk: clock-img-ipg {
> > > > > +           compatible = "fixed-clock";
> > > > > +           #clock-cells = <0>;
> > > > > +           clock-frequency = <200000000>;
> > > > > +           clock-output-names = "img_ipg_clk";
> > > > > +   };
> > > > > +
> > > > > +   jpegdec: jpegdec@58400000 {
> > > >
> > > > Node should be disabled by default.
> > > > And enable it in board dts including LPCG.
> > >
> > > At version v5 of this patch, the node was disabled by default, and I
> > > received this feedback from Ezequiel Garcia:
> > >
> > > "Pure memory-to-memory are typically not enabled per-board, but just
> > > per-platform.
> > > So you can drop the disabled status here."
> > >
> > > So, in v6 I made it enabled by default.
> > >
> > > Any strong reasons for enabled/disabled per platform?
> >
> > AFAIK we usually only enable system basic features and let other
> > user selectable features disabled by default in dts.
> > Even for device LPCG clocks, if it's enabled by default and later
> > enter runtime suspend if no users, it still consumes power.
> >
>
> Well-written drivers shouldn't draw any power if not used.
>

LPCG won't draw power when not used. But the power domain used by LPCG
will still draw power when enter idle state.

> And DT is about hardware-description, not about usage-description.
> Which means, at the soc.dtsi level you disable devices that need
> some board-level hardware thing to be enabled (e.g. a physical
> connected, a regulator, etc.).
> A pure memory-to-memory should be enabled by default, because
> in practice you can't predict what the users a board will want
> to use, nor the DT is the place for that.

It makes sense to me. Thanks

Mirela,
Please follow up with Ezequiel's suggestion.
For LPCGS used by jpeg, you can keep it enabled by default.

Regards
Aisheng

>
> Sticking to hardware description is the best way to get DT right :-)
>
> Cheers,
> Ezequiel
>
