Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6549582A43
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 18:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbiG0QG7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 12:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233779AbiG0QGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 12:06:53 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57332E9F2
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 09:06:52 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31e47ac84daso180858527b3.0
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ewmeS4McgdnQEH35NlTf+WYZOW3FH17zRDpoEtE6dI=;
        b=INtOTD/aD9pkxpId/nbuIfYIh2625Ql2cdm3PPE/6OV3MR+Wf16Bp5IKfLSjHDDdjS
         W7lwSfyvr4fx7EfPX3hqXV1XLbcIMhTyo9YzIwh63CE0L71Xq9Obi4EnF+MQIy1X8AJt
         Wg+uJYmmPqba3AXMWElBsWx5w+MQ+RS/loTWNnuza6cW8u1isDc7eBuHwdXTdLQ7bxLQ
         oSpj0xrrJsCW4Pq4spqSnAhj9GsF0WpwBPW8y/ICNyaWKHRCpa157wFfGAr5fGaoA4sI
         QIUcdKKRbvI4kPeVTPgHneG9ZJXqa0aJU7PVTwSy8IyTy/Lg3cMir7MB3t0/5VoDrZGs
         sV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ewmeS4McgdnQEH35NlTf+WYZOW3FH17zRDpoEtE6dI=;
        b=SIXB3ZrF/6qWvSqXdqWg0KdiHSWMiDljt2WPt3+RF8iErxoHcjIAuBMg9KwFTNKO5q
         bg593NjUQCh726BpTSyRpvKXVbc3Izb8FALo94/1xu/Lu0V4BWKHtKV7ksv4M0sSbxxD
         AJgkEiJ55Ff7j0I4kHJR1Tdb3ao24mqeRx13MUtRGvUrtWNIZ2nrch0LdhQoTQaeVLJS
         WFLeLnpaY7k2pWQClALQA7Gjswk7RMTRuOR1nIqaKx3BrvwLeIIk9REB6iJcta4cWmOE
         Rd/2PLn+V2FU3XuUg+jy9Of9Sq9XwY4PPQaP4LV8d5+BmnLuVQhF7+yooz86kMrbpLeg
         6bPQ==
X-Gm-Message-State: AJIora8HV79Oz5MgBVVbFsvpKM7FNHE27Rv+FTT4412cUmBZ30kJJWE7
        Bj0aEm4x8ntezzwNElC/PGxRnNw1HBucPfEqeR4O/Q==
X-Google-Smtp-Source: AGRyM1vqCW78Cn3V5a5E1wbeBWAhNzfNn3hKWKs7sG2nMhfHyzih69XaNV0l1aSjh7XmJa8TaUVDgp3KjFrA2y3Jezs=
X-Received: by 2002:a05:690c:72c:b0:31f:474d:ea43 with SMTP id
 bt12-20020a05690c072c00b0031f474dea43mr8578158ywb.126.1658938011811; Wed, 27
 Jul 2022 09:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220302211100.65264-1-paul.kocialkowski@bootlin.com>
 <20220302211100.65264-2-paul.kocialkowski@bootlin.com> <YiaTfsMDs7RGob2N@robh.at.kernel.org>
 <CAGETcx9u9RO_5nSp+=qgwDGY=jL_Q1hAcj+RfVN=q-H_8iuT4w@mail.gmail.com> <20220727120631.iefzititedahdsdt@houat>
In-Reply-To: <20220727120631.iefzititedahdsdt@houat>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 27 Jul 2022 09:06:15 -0700
Message-ID: <CAGETcx_o=L+Ku9CPGbQW2wS15etvi+ofkKZ0K=C7imP4=JcXeQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/8] of: Mark interconnects property supplier as optional
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Rob Herring <robh@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 27, 2022 at 5:06 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Mon, Mar 07, 2022 at 07:34:22PM -0800, Saravana Kannan wrote:
> > On Mon, Mar 7, 2022 at 3:21 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > +Saravana
> > >
> > > On Wed, Mar 02, 2022 at 10:10:53PM +0100, Paul Kocialkowski wrote:
> > > > In order to set their correct DMA address offset, some devices rely on
> > > > the device-tree interconnects property which identifies an
> > > > interconnect node that provides a dma-ranges property that can be used
> > > > to set said offset.
> > > >
> > > > Since that logic is all handled by the generic openfirmware and driver
> > > > code, the device-tree description could be enough to properly set
> > > > the offset.
> > > >
> > > > However the interconnects property is currently not marked as
> > > > optional, which implies that a driver for the corresponding node
> > > > must be loaded as a requirement. When no such driver exists, this
> > > > results in an endless EPROBE_DEFER which gets propagated to the
> > > > calling driver. This ends up in the driver never loading.
> > > >
> > > > Marking the interconnects property as optional makes it possible
> > > > to load the driver in that situation, since the EPROBE_DEFER return
> > > > code will no longer be propagated to the driver.
> > > >
> > > > There might however be undesirable consequences with this change,
> > > > which I do not fully grasp at this point.
> >
> > Temporary NACK till I get a bit more time to take a closer look. I
> > really don't like the idea of making interconnects optional. IOMMUs
> > and DMAs were exceptions. Also, we kinda discuss similar issues in
> > LPC. We had some consensus on how to handle these and I noted them all
> > down with a lot of details -- let me go take a look at those notes
> > again and see if I can send a more generic patch.
> >
> > Paul,
> >
> > Can you point to the DTS (not DTSI) file that corresponds to this?
> > Also, if it's a builtin kernel, I'd recommend setting
> > deferred_probe_timeout=1 and that should take care of it too.
>
> For the record, I also encountered this today on next-20220726 with this
> device:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/sun5i.dtsi#n775
>
> The driver won't probe without fw_devlink=off

Really? I basically ended up doing what I mentioned in my original
reply. next-20220726 should have my changes that'll make sure
fw_devlink doesn't block any probe (it'll still try to create as many
device links as possible) after 10s (default deferred probe timeout).
Can you try to find more info on why it's not probing?
<debugfs>/devices_deferred should give more details.


-Saravana
